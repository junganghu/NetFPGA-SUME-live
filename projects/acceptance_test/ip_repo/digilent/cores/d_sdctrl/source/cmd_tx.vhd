--
-- Copyright (c) 2013, Digilent RO. 
-- All rights reserved.
--
-- File:
-- cmd_tx.vhd
--
-- MODULE NAME : Command Transmitter
--
-- Author:
-- Mihaita Nagy (mihaita.nagy@digilent.ro)
--
-- Description:
-- This module implements the command transmitter of the SD.
--
-- REVISION HISTORY
--  VERSION  DATE         AUTHOR         DESCRIPTION
--  1.0 	   2013-01-29   Mihaita Nagy   Created
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
entity cmd_tx is
   port(
      -- global misc. ports
      clk_i       : in  std_logic;
      rst_i       : in  std_logic;
      
      -- command related
      cmd_index_i : in  std_logic_vector(7 downto 0);
      cmd_arg_i   : in  std_logic_vector(31 downto 0);
      cmd_send_i  : in  std_logic;
      
      -- busy flaging signal
      cmd_done_o  : out std_logic;
      cmd_busy_o  : out std_logic;
      
      -- serial cmd line output
      sd_sck_i    : in  std_logic;
      sd_cmd_o    : out std_logic
   );
end cmd_tx;

architecture Behavioral of cmd_tx is

------------------------------------------------------------------------
-- Component Declarations 
------------------------------------------------------------------------
component crc7
port(
   clk_i    : in std_logic;
   crc_en_i : in std_logic;
   data_in  : in std_logic_vector(39 downto 0);
   crc_o    : out std_logic_vector(6 downto 0));
end component;

------------------------------------------------------------------------
-- Type Declarations 
------------------------------------------------------------------------
type states is (stIdle, stReadData, stCrcEn, stGenCrc, stPreLoadData,
                stLoadData, stSerialize);
attribute fsm_encoding : string;
attribute fsm_encoding of states : type is "gray";

------------------------------------------------------------------------
-- Signal Declarations 
------------------------------------------------------------------------
signal state, nstate : states := stIdle;
signal sd_sck_tmp, sck_falling : std_logic;
signal cmd_send_tmp, cmd_send_pls : std_logic;
signal data_i_crc : std_logic_vector(39 downto 0);
signal data_o_crc : std_logic_vector(6 downto 0);
signal data_p_cmd, data_p_cmd_tmp : std_logic_vector(47 downto 0);
signal cnt : std_logic_vector(7 downto 0);
signal crc_en : std_logic;
signal cmd_busy_int, cmd_busy_intt : std_logic;

------------------------------------------------------------------------
-- Module Implementation 
------------------------------------------------------------------------
begin

-- debounce cmd_send_i to detect rising edge
   process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         sd_sck_tmp <= sd_sck_i;
         cmd_send_tmp <= cmd_send_i;
      end if;
   end process;
   
   -- falling edge of serial clock
   sck_falling <= '1' when sd_sck_tmp = '1' and sd_sck_i = '0' else '0';
   -- send command pulse
   cmd_send_pls <= '1' when cmd_send_tmp = '0' and cmd_send_i = '1' else '0';

-- store data to be crc'd
   LOADDATA1: process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if state = stReadData then
            data_i_crc <= cmd_index_i & cmd_arg_i;
         end if;
      end if;
   end process LOADDATA1;

-- generate an enable signal for the crc generator
   CRCEN: process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if state = stCrcEn then
            crc_en <= '1';
         else
            crc_en <= '0';
         end if;
      end if;
   end process CRCEN;
   
   CRC: crc7
   port map(
      clk_i    => clk_i,
      crc_en_i => crc_en,
      data_in  => data_i_crc,
      crc_o    => data_o_crc); -- valid after 2 clks!
   
-- with crc valid we can construct the final command
   LOADDATA2: process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if state = stPreLoadData then
            data_p_cmd <= data_i_crc & data_o_crc & b"1";
         end if;
      end if;
   end process LOADDATA2;
   
-- serialize parallel data to be sent
   SER: process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if sck_falling = '1' then
            if state = stLoadData then
               data_p_cmd_tmp <= data_p_cmd;
            elsif state = stSerialize then
               data_p_cmd_tmp <= data_p_cmd_tmp(46 downto 0) & '1';
               sd_cmd_o <= data_p_cmd_tmp(47);
            else
               sd_cmd_o <= '1';
            end if;
         end if;
      end if;
   end process SER;
   
   --sd_cmd_o <= data_p_cmd_tmp(47);
   
-- counter for the command transmission phase
   COUNT: process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if state = stGenCrc then
            cnt <= cnt + '1'; -- every clk_i
         elsif state = stSerialize then
            if sck_falling = '1' then
               cnt <= cnt + '1'; -- every sck_i
            end if;
         else
            cnt <= (others => '0');
         end if;
      end if;
   end process COUNT;
   
-- busy signaling flag
   BUSY: process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if state = stIdle then
            cmd_busy_int <= '0';
         else
            cmd_busy_int <= '1';
         end if;
      end if;
   end process BUSY;
   
   process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if sck_falling = '1' then
            cmd_busy_intt <= cmd_busy_int;
            cmd_busy_o <= cmd_busy_intt;
         end if;
      end if;
   end process;
   
   process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if rst_i = '1' then
            cmd_done_o <= '0';
         elsif cmd_send_tmp = '1' then
            cmd_done_o <= '0';
         elsif state = stSerialize and cnt = x"30" then
            cmd_done_o <= '1';
         end if;
      end if;
   end process;
   
   process(clk_i)
   begin
      if clk_i'event and clk_i = '1' then
         if rst_i = '1' then
            state <= stIdle;
         else
            state <= nstate;
         end if;
      end if;
   end process;
   
   process(state, nstate, cmd_send_pls, cnt, sck_falling)
   begin
      nstate <= state;
      case(state) is
         when stIdle =>
            if cmd_send_pls = '1' then
               nstate <= stReadData;
            end if;
         when stReadData => nstate <= stCrcEn;
         when stCrcEn => nstate <= stGenCrc;
         when stGenCrc =>
            if cnt = x"04" then -- 4 clks
               nstate <= stPreLoadData;
            end if;
         when stPreLoadData => 
            if sck_falling = '1' then
               nstate <= stLoadData;
            end if;
         when stLoadData => 
            if sck_falling = '1' then
               nstate <= stSerialize;
            end if;
         when stSerialize =>
            if cnt = x"30" then -- 48 clks
               nstate <= stIdle;
            end if;
         when others => nstate <= stIdle;
      end case;
   end process;

end Behavioral;
