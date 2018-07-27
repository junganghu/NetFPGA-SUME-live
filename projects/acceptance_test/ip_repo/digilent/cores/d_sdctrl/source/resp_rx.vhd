--
-- Copyright (c) 2013, Digilent RO. 
-- All rights reserved.
--
-- File:
-- resp_rx.vhd
--
-- MODULE NAME : Response Receiver
--
-- Author:
-- Mihaita Nagy (mihaita.nagy@digilent.ro)
--
-- Description:
-- This module implements the Response receiver for the SD.
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
entity resp_rx is
   generic(
      C_RESP_TIMEOUT : integer := 100
   );
   port(
      -- global misc. ports
      clk_i          : in  std_logic;
      rst_i          : in  std_logic;
      
      -- command related
      cmd_send_i     : in  std_logic;
      cmd_busy_i     : in  std_logic;
      
      -- response related
      -- 00: no response
      -- 01: response length 136
      -- 10: response length 48
      -- 11: response length 48 and check Busy after response
      resp_type_i    : in  std_logic_vector(1 downto 0);
      resp_data_o    : out std_logic_vector(125 downto 0);
      resp_timeout_o : out std_logic;
      resp_done_o    : out std_logic;
      
      -- sd interface
      sd_sck_i       : in  std_logic;
      sd_cmd_i       : in  std_logic;
      sd_dat0_i      : in  std_logic
   );
end resp_rx;

architecture Behavioral of resp_rx is

------------------------------------------------------------------------
-- Type Declarations 
------------------------------------------------------------------------
type states is (stIdle, stWaitBusyEnd, stWaitResp, stRespRecvd, stSmplResp, 
                stStoreResp, stWaitEnd, stWaitBusy, stError, stDoneFlag);
attribute fsm_encoding : string;
attribute fsm_encoding of states : type is "gray";

------------------------------------------------------------------------
-- Signal Declarations 
------------------------------------------------------------------------
signal state, nstate : states := stIdle;
signal cmd_send_tmp, cmd_send_pls, cmd_busy_tmp, cmd_busy_falling : std_logic;
signal sd_sck_tmp, sck_rising : std_logic;
signal sd_cmd_tmp : std_logic;
signal resp_type_tmp : std_logic_vector(1 downto 0);
signal sd_dat0_tmp : std_logic;
signal cnt : std_logic_vector(7 downto 0);
signal sd_data_tmp : std_logic_vector(125 downto 0);

------------------------------------------------------------------------
-- Module Implementation 
------------------------------------------------------------------------

begin
   
-- debouncing stage
   process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         sd_sck_tmp <= sd_sck_i;
         sd_cmd_tmp <= sd_cmd_i;
         resp_type_tmp <= resp_type_i;
         sd_dat0_tmp <= sd_dat0_i;
         cmd_send_tmp <= cmd_send_i;
         cmd_busy_tmp <= cmd_busy_i;
      end if;
   end process;
   
   -- rising edge of serial clock
   sck_rising <= '1' when sd_sck_tmp = '0' and sd_sck_i = '1' else '0';
   -- receive response pulse
   cmd_send_pls <= '1' when cmd_send_tmp = '0' and cmd_send_i = '1' else '0';
   -- falling edge of cmd busy flag
   cmd_busy_falling <= '1' when cmd_busy_tmp = '1' and cmd_busy_i = '0' else '0';
   
-- serial input sampler process
   SHIFTIN: process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if rst_i = '1' then
            resp_data_o <= (others => '0');
            sd_data_tmp <= (others => '0');
         else
            if state = stStoreResp then
               resp_data_o <= sd_data_tmp;
               sd_data_tmp <= (others => '0');
            elsif state = stSmplResp then
               if sck_rising = '1' then
                  sd_data_tmp <= sd_data_tmp(124 downto 0) & sd_cmd_tmp;
               end if;
            end if;
         end if;
      end if;
   end process SHIFTIN;

-- counting process
   COUNT: process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if state = stSmplResp or state = stWaitResp or state = stWaitEnd then
            if sck_rising = '1' then
               cnt <= cnt + '1';
            end if;
         else
            cnt <= (others => '0');
         end if;
      end if;
   end process COUNT;

-- response timeout flag
   process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if state = stError then
            resp_timeout_o <= '1';
         else
            resp_timeout_o <= '0';
         end if;
      end if;
   end process;

-- generate busy flag
   process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if rst_i = '1' then
            resp_done_o <= '0';
         elsif state = stDoneFlag then
            resp_done_o <= '1';
         elsif state = stWaitBusyEnd then
            resp_done_o <= '0';
         end if;
      end if;
   end process;
   
   process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if rst_i = '1' then
            state <= stIdle;
         else
            state <= nstate;
         end if;
      end if;
   end process;
   
   process(state, nstate, cmd_send_pls, cmd_busy_falling, cnt, 
   sck_rising, sd_cmd_tmp, resp_type_tmp, sd_dat0_tmp)
   begin
      nstate <= state;
      case(state) is
         when stIdle => -- 0
            if cmd_send_pls = '1' and resp_type_tmp /= b"00" then
               nstate <= stWaitBusyEnd;
            end if;
         when stWaitBusyEnd => -- 1
            if cmd_busy_falling = '1' then
               nstate <= stWaitResp;
            end if;
         when stWaitResp => -- 2
            if cnt = (C_RESP_TIMEOUT-1) then
               nstate <= stError;
            elsif sck_rising = '1' then
               if sd_cmd_tmp = '0' then
                  nstate <= stRespRecvd;
               end if;
            end if;
         when stRespRecvd => -- 3
            if sck_rising = '1' then
               if sd_cmd_tmp = '0' then
                  nstate <= stSmplResp;
               else
                  nstate <= stWaitResp;
               end if;
            end if;
         when stSmplResp => -- 4
            if resp_type_tmp = b"01" then
               if cnt = x"7e" then -- 126
                  nstate <= stStoreResp;
               end if;
            else
               if cnt = x"26" then -- 38
                  nstate <= stStoreResp;
               end if;
            end if;
         when stStoreResp => nstate <= stWaitEnd; -- 5
         when stWaitEnd => -- 6
            if cnt = x"08" then -- 8
               if resp_type_tmp = b"11" then
                  nstate <= stWaitBusy;
               else
                  nstate <= stDoneFlag;
               end if;
            end if;
         when stWaitBusy => -- 7
            if sd_dat0_tmp = '1' then
               nstate <= stDoneFlag;
            end if;
         when stError => null; -- 8
         when stDoneFlag => nstate <= stIdle; -- 9
         when others => nstate <= stIdle;
      end case;
   end process;

end Behavioral;
