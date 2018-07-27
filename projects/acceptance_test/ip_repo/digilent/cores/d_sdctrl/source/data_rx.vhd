--
-- Copyright (c) 2013, Digilent RO. 
-- All rights reserved.
--
-- File:
-- data_rx.vhd
--
-- MODULE NAME : Data sampler
--
-- Author:
-- Mihaita Nagy (mihaita.nagy@digilent.ro)
--
-- Description:
-- This module implements a 4-bit data receiver that is used only
-- in a Demo maner, by only checking calculating the CRC's for every data line
-- and retrieving a success or an failure flag.
--
-- REVISION HISTORY
--  VERSION  DATE         AUTHOR         DESCRIPTION
--  1.0 	   2013-02-05   Mihaita Nagy   Created
--
-- @NETFPGA_LICENSE_HEADER_START@
--
-- Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
-- license agreements. See the NOTICE file distributed with this work for
-- additional information regarding copyright ownership. NetFPGA licenses this
-- file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
-- "License"); you may not use this file except in compliance with the
-- License. You may obtain a copy of the License at:
--
-- http://www.netfpga-cic.org
--
-- Unless required by applicable law or agreed to in writing, Work distributed
-- under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
-- CONDITIONS OF ANY KIND, either express or implied. See the License for the
-- specific language governing permissions and limitations under the License.
--
-- @NETFPGA_LICENSE_HEADER_END@
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

------------------------------------------------------------------------
-- Module Declaration 
------------------------------------------------------------------------
entity data_rx is
   port(
      clk_i             : in  std_logic;
      rst_i             : in  std_logic;
      
      -- response done flag
      resp_done_i       : in  std_logic;
      -- enables data reception
      data_transfer_i   : in  std_logic;
      -- CRC mismatch on DAT0
      data_crc0_err_o   : out std_logic;
      -- CRC mismatch on DAT1
      data_crc1_err_o   : out std_logic;
      -- CRC mismatch on DAT2
      data_crc2_err_o   : out std_logic;
      -- CRC mismatch on DAT3
      data_crc3_err_o   : out std_logic;
      -- data received successfully (all 0's on DAT0)
      data_zero0_o      : out std_logic;
      -- data received successfully (all 0's on DAT1)
      data_zero1_o      : out std_logic;
      -- data received successfully (all 0's on DAT2)
      data_zero2_o      : out std_logic;
      -- data received successfully (all 0's on DAT3)
      data_zero3_o      : out std_logic;
      -- done flag
      data_done_o       : out std_logic;
      
      -- debug
      dbg_crc0_decoded  : out std_logic_vector(15 downto 0);
      dbg_crc1_decoded  : out std_logic_vector(15 downto 0);
      dbg_crc2_decoded  : out std_logic_vector(15 downto 0);
      dbg_crc3_decoded  : out std_logic_vector(15 downto 0);
      dbg_crc0_actual   : out std_logic_vector(15 downto 0);
      dbg_crc1_actual   : out std_logic_vector(15 downto 0);
      dbg_crc2_actual   : out std_logic_vector(15 downto 0);
      dbg_crc3_actual   : out std_logic_vector(15 downto 0);
      
      -- sd interface
      sd_sck_i          : in  std_logic;
      sd_dat0_i         : in  std_logic;
      sd_dat1_i         : in  std_logic;
      sd_dat2_i         : in  std_logic;
      sd_dat3_i         : in  std_logic
   );
end data_rx;

architecture Behavioral of data_rx is

------------------------------------------------------------------------
-- Component Declarations 
------------------------------------------------------------------------
component crc16 is 
port(
   clk_i    : in  std_logic;
   crc_en_i : in  std_logic;
   data_i   : in  std_logic_vector(128 downto 0);
   crc_o    : out std_logic_vector(15 downto 0));
end component;

------------------------------------------------------------------------
-- Type Declarations 
------------------------------------------------------------------------
type states is (stIdle, stWaitData, stSmplData, stDoneData, stCrcPls, 
                stCrcEn, stCheckCrc, stDone);
attribute fsm_encoding : string;
attribute fsm_encoding of states : type is "gray";

------------------------------------------------------------------------
-- Signal Declarations 
------------------------------------------------------------------------
signal state, nstate : states := stIdle;
signal sd_sck_tmp, sck_rising : std_logic;
signal sd_dat0_tmp, sd_dat1_tmp, sd_dat2_tmp, sd_dat3_tmp : std_logic;
signal resp_done_tmp, resp_done_rising : std_logic;
signal data_transfer_tmp : std_logic;
signal cnt : std_logic_vector(7 downto 0);
signal sd_dat0_p_tmp, sd_dat1_p_tmp : std_logic_vector(143 downto 0);
signal sd_dat2_p_tmp, sd_dat3_p_tmp : std_logic_vector(143 downto 0);
signal crc_dat0, crc_dat1, crc_dat2, crc_dat3 : std_logic_vector(128 downto 0);
signal dat0_o_crc, dat1_o_crc, dat2_o_crc, dat3_o_crc : std_logic_vector(15 downto 0);
signal crc_en : std_logic;
signal crc_to_cmp0, crc_to_cmp1, crc_to_cmp2, crc_to_cmp3 : std_logic_vector(15 downto 0);
signal zero_dat0, zero_dat1, zero_dat2, zero_dat3 : std_logic;
signal err_dat0, err_dat1, err_dat2, err_dat3 : std_logic;

------------------------------------------------------------------------
-- Module Implementation 
------------------------------------------------------------------------

begin

-- input stage
   process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         sd_sck_tmp <= sd_sck_i;
         sd_dat0_tmp <= sd_dat0_i;
         sd_dat1_tmp <= sd_dat1_i;
         sd_dat2_tmp <= sd_dat2_i;
         sd_dat3_tmp <= sd_dat3_i;
         resp_done_tmp <= resp_done_i;
         data_transfer_tmp <= data_transfer_i;
      end if;
   end process;
   
   -- rising edge of serial clock
   sck_rising <= '1' when sd_sck_tmp = '0' and sd_sck_i = '1' else '0';
   -- rising edge of response done flag
   resp_done_rising <= '1' when resp_done_tmp = '0' and resp_done_i = '1' else '0';

-- shift in 4-bit serial data process
   SHIFTIN: process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if state = stIdle then
            sd_dat0_p_tmp <= (others => '0');
            sd_dat1_p_tmp <= (others => '0');
            sd_dat2_p_tmp <= (others => '0');
            sd_dat3_p_tmp <= (others => '0');
         elsif state = stSmplData then
            if sck_rising = '1' then
               sd_dat0_p_tmp <= sd_dat0_p_tmp(142 downto 0) & sd_dat0_tmp;
               sd_dat1_p_tmp <= sd_dat1_p_tmp(142 downto 0) & sd_dat1_tmp;
               sd_dat2_p_tmp <= sd_dat2_p_tmp(142 downto 0) & sd_dat2_tmp;
               sd_dat3_p_tmp <= sd_dat3_p_tmp(142 downto 0) & sd_dat3_tmp;
            end if;
         end if;
      end if;
   end process SHIFTIN;
   
-- check and store the received data
   PAR_DAT: process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if state = stDoneData then
            -- check for 0's
            if sd_dat0_p_tmp(143 downto 16) = x"00000000000000000000000000000000" then
               zero_dat0 <= '1'; -- dat0 zeros
            else
               zero_dat0 <= '0';
            end if;
            if sd_dat1_p_tmp(143 downto 16) = x"00000000000000000000000000000000" then
               zero_dat1 <= '1'; -- dat1 zeros
            else
               zero_dat1 <= '0';
            end if;
            if sd_dat2_p_tmp(143 downto 16) = x"00000000000000000000000000000000" then
               zero_dat2 <= '1'; -- dat2 zeros
            else
               zero_dat2 <= '0';
            end if;
            if sd_dat3_p_tmp(143 downto 16) = x"00000000000000000000000000000000" then
               zero_dat3 <= '1'; -- dat3 zeros
            else
               zero_dat3 <= '0';
            end if;
            -- store data
            crc_dat0 <= "0" & sd_dat0_p_tmp(143 downto 16);
            crc_dat1 <= "0" & sd_dat1_p_tmp(143 downto 16);
            crc_dat2 <= "0" & sd_dat2_p_tmp(143 downto 16);
            crc_dat3 <= "0" & sd_dat3_p_tmp(143 downto 16);
            crc_to_cmp0 <= sd_dat0_p_tmp(15 downto 0);
            crc_to_cmp1 <= sd_dat1_p_tmp(15 downto 0);
            crc_to_cmp2 <= sd_dat2_p_tmp(15 downto 0);
            crc_to_cmp3 <= sd_dat3_p_tmp(15 downto 0);
         end if;
      end if;
   end process PAR_DAT;

-- generate an enable signal for the crc generator
   CRCEN: process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if state = stCrcPls then
            crc_en <= '1';
         else
            crc_en <= '0';
         end if;
      end if;
   end process CRCEN;
   
   CRCDAT3: crc16
   port map(
      clk_i    => clk_i,
      crc_en_i => crc_en,
      data_i   => crc_dat3, -- 129-bit
      crc_o    => dat3_o_crc); -- 16-bit ---> valid after 2 clks!
   
   CRCDAT2: crc16
   port map(
      clk_i    => clk_i,
      crc_en_i => crc_en,
      data_i   => crc_dat2, -- 129-bit
      crc_o    => dat2_o_crc); -- 16-bit ---> valid after 2 clks!
   
   CRCDAT1: crc16
   port map(
      clk_i    => clk_i,
      crc_en_i => crc_en,
      data_i   => crc_dat1, -- 129-bit
      crc_o    => dat1_o_crc); -- 16-bit ---> valid after 2 clks!
   
   CRCDAT0: crc16
   port map(
      clk_i    => clk_i,
      crc_en_i => crc_en,
      data_i   => crc_dat0, -- 129-bit
      crc_o    => dat0_o_crc); -- 16-bit ---> valid after 2 clks!

-- checking the CRCs
   CHCK_CRC: process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if state = stCheckCrc then
            if dat0_o_crc /= crc_to_cmp0 then
               err_dat0 <= '1';
            else
               err_dat0 <= '0';
            end if;
            if dat1_o_crc /= crc_to_cmp1 then
               err_dat1 <= '1';
            else
               err_dat1 <= '0';
            end if;
            if dat2_o_crc /= crc_to_cmp2 then
               err_dat2 <= '1';
            else
               err_dat2 <= '0';
            end if;
            if dat3_o_crc /= crc_to_cmp3 then
               err_dat3 <= '1';
            else
               err_dat3 <= '0';
            end if;
         end if;
      end if;
   end process CHCK_CRC;

-- debugging signals
   dbg_crc0_decoded <= dat0_o_crc;
   dbg_crc1_decoded <= dat1_o_crc;
   dbg_crc2_decoded <= dat2_o_crc;
   dbg_crc3_decoded <= dat3_o_crc;
   dbg_crc0_actual <= crc_to_cmp0;
   dbg_crc1_actual <= crc_to_cmp1;
   dbg_crc2_actual <= crc_to_cmp2;
   dbg_crc3_actual <= crc_to_cmp3;
   
-- counting process
   COUNT: process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if state = stSmplData then
            if sck_rising = '1' then
               cnt <= cnt + '1';
            end if;
         elsif state = stCrcEn then
            cnt <= cnt + '1';
         else
            cnt <= (others => '0');
         end if;
      end if;
   end process COUNT;
   
-- done flag
   DONE: process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if rst_i = '1' then
            data_done_o <= '0';
         elsif state = stDone then
            data_done_o <= '1';
         elsif state = stWaitData then
            data_done_o <= '0';
         end if;
      end if;
   end process DONE;

-- FSM process
   process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if rst_i = '1' then
            state <= stIdle;
         else
            state <= nstate;
         end if;
      end if;
   end process;
   
   process(state, nstate, resp_done_rising, data_transfer_tmp, sck_rising, 
   sd_dat0_tmp, sd_dat1_tmp, sd_dat2_tmp, sd_dat3_tmp, cnt)
   begin
      nstate <= state;
      case(state) is
         when stIdle =>
            if data_transfer_tmp = '1' and resp_done_rising = '1' then
               nstate <= stWaitData;
            end if;
         when stWaitData => -- TODO: a timeout counter should be implemented here
            if sck_rising = '1' then
               if sd_dat0_tmp = '0' and sd_dat1_tmp = '0' and
                  sd_dat2_tmp = '0' and sd_dat3_tmp = '0' then
                  nstate <= stSmplData;
               end if;
            end if;
         when stSmplData =>
            if sck_rising = '1' then
               if cnt = x"8F" then -- 144 clks (128-bit data + 16-bit CRC)
                  nstate <= stDoneData;
               end if;
            end if;
         when stDoneData => nstate <= stCrcPls;
         when stCrcPls => nstate <= stCrcEn;
         when stCrcEn =>
            if cnt = x"04" then -- wait for 3..4 clks
               nstate <= stCheckCrc;
            end if;
         when stCheckCrc => nstate <= stDone;
         when stDone => nstate <= stIdle;
         when others => nstate <= stIdle;
      end case;
   end process;
   
-- generating the status
   data_crc0_err_o <= '1' when err_dat0 = '1' else '0';
   data_crc1_err_o <= '1' when err_dat1 = '1' else '0';
   data_crc2_err_o <= '1' when err_dat2 = '1' else '0';
   data_crc3_err_o <= '1' when err_dat3 = '1' else '0';
   data_zero0_o <= '1' when zero_dat0 = '1' else '0';
   data_zero1_o <= '1' when zero_dat1 = '1' else '0';
   data_zero2_o <= '1' when zero_dat2 = '1' else '0';
   data_zero3_o <= '1' when zero_dat3 = '1' else '0';

end Behavioral;
