----------------------------------------------------------------------------------
--
-- Copyright (C) 2015 Digilent Inc.
-- All rights reserved.
--
-- @NETFPGA_LICENSE_HEADER_START@
--
-- Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
-- license agreements.  See the NOTICE file distributed with this work for
-- additional information regarding copyright ownership.  NetFPGA licenses this
-- file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
-- "License"); you may not use this file except in compliance with the
-- License.  You may obtain a copy of the License at:
--
--   http://www.netfpga-cic.org
--
-- Unless required by applicable law or agreed to in writing, Work distributed
-- under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
-- CONDITIONS OF ANY KIND, either express or implied.  See the License for the
-- specific language governing permissions and limitations under the License.
--
-- @NETFPGA_LICENSE_HEADER_END@
--
--
-- Create Date:    13:31:38 01/30/2013 
-- Module Name:    cmd_rxtx - Behavioral
--
-- Revision: 
-- Revision 0.01 - File Created
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

------------------------------------------------------------------------
-- Module Declaration 
------------------------------------------------------------------------
entity cmd_rxtx is
   port(
      -- global signals
      clk_i             : in  std_logic;
      rst_i             : in  std_logic;
      
      -- clock divider value
      sck_div_i         : in  std_logic_vector(2 downto 0);
      sck_en_i          : in  std_logic;
      
      -- command control/flag signals
      cmd_index_i       : in  std_logic_vector(7 downto 0);
      cmd_arg_i         : in  std_logic_vector(31 downto 0);
      cmd_send_i        : in  std_logic;
      cmd_done_o        : out std_logic;
      
      -- debug
      dbg_crc0_decoded  : out std_logic_vector(15 downto 0);
      dbg_crc1_decoded  : out std_logic_vector(15 downto 0);
      dbg_crc2_decoded  : out std_logic_vector(15 downto 0);
      dbg_crc3_decoded  : out std_logic_vector(15 downto 0);
      dbg_crc0_actual   : out std_logic_vector(15 downto 0);
      dbg_crc1_actual   : out std_logic_vector(15 downto 0);
      dbg_crc2_actual   : out std_logic_vector(15 downto 0);
      dbg_crc3_actual   : out std_logic_vector(15 downto 0);
      
      -- response control/flag signals
      resp_type_i       : in  std_logic_vector(1 downto 0);
      resp_data_o       : out std_logic_vector(125 downto 0);
      resp_done_o       : out std_logic;
      resp_timeout_o    : out std_logic;
      
      -- data control/flag signals
      data_transfer_i   : in  std_logic;
      data_crc0_err_o   : out std_logic;
      data_crc1_err_o   : out std_logic;
      data_crc2_err_o   : out std_logic;
      data_crc3_err_o   : out std_logic;
      data_zero0_o      : out std_logic;
      data_zero1_o      : out std_logic;
      data_zero2_o      : out std_logic;
      data_zero3_o      : out std_logic;
      data_done_o       : out std_logic;   
      
      -- sd interface
      sd_sck_o          : out std_logic;
      sd_cmd_i          : in  std_logic;
      sd_cmd_t          : out std_logic;
      sd_cmd_o          : out std_logic;
      sd_dat0_i         : in  std_logic;
      sd_dat1_i         : in  std_logic;
      sd_dat2_i         : in  std_logic;
      sd_dat3_i         : in  std_logic
   );
end cmd_rxtx;

architecture Behavioral of cmd_rxtx is

------------------------------------------------------------------------
-- Component Declarations 
------------------------------------------------------------------------
component cmd_tx is
port(
   clk_i             : in  std_logic;
   rst_i             : in  std_logic;
   cmd_index_i       : in  std_logic_vector(7 downto 0);
   cmd_arg_i         : in  std_logic_vector(31 downto 0);
   cmd_send_i        : in  std_logic;
   cmd_done_o        : out std_logic;
   cmd_busy_o        : out std_logic;
   sd_sck_i          : in  std_logic;
   sd_cmd_o          : out std_logic);
end component;

component resp_rx is
generic(
   C_RESP_TIMEOUT    : integer := 100);
port(
   clk_i             : in  std_logic;
   rst_i             : in  std_logic;
   cmd_send_i        : in  std_logic;
   cmd_busy_i        : in  std_logic;
   resp_type_i       : in  std_logic_vector(1 downto 0);
   resp_data_o       : out std_logic_vector(125 downto 0);
   resp_timeout_o    : out std_logic;
   resp_done_o       : out std_logic;
   sd_sck_i          : in  std_logic;
   sd_cmd_i          : in  std_logic;
   sd_dat0_i         : in  std_logic);
end component;

component data_rx is
port(
   clk_i             : in  std_logic;
   rst_i             : in  std_logic;
   resp_done_i       : in  std_logic;
   data_transfer_i   : in  std_logic;
   data_crc0_err_o   : out std_logic;
   data_crc1_err_o   : out std_logic;
   data_crc2_err_o   : out std_logic;
   data_crc3_err_o   : out std_logic;
   data_zero0_o      : out std_logic;
   data_zero1_o      : out std_logic;
   data_zero2_o      : out std_logic;
   data_zero3_o      : out std_logic;
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
   sd_sck_i          : in  std_logic;
   sd_dat0_i         : in  std_logic;
   sd_dat1_i         : in  std_logic;
   sd_dat2_i         : in  std_logic;
   sd_dat3_i         : in  std_logic);
end component;

------------------------------------------------------------------------
-- Signal Declarations 
------------------------------------------------------------------------
signal resp_done_int : std_logic;
signal cmd_busy_int : std_logic;
signal div_val, cnt_sck : std_logic_vector(7 downto 0);
signal sck_int : std_logic;

------------------------------------------------------------------------
-- Module Implementation 
------------------------------------------------------------------------
begin
   
   -- done sending command flag
   --cmd_done_o <= not cmd_busy_int;
   
   -- done receiving response flag
   resp_done_o <= resp_done_int;
   
   -- cmd line tristate enable
   sd_cmd_t <= '0' when cmd_busy_int = '1' else '1';
   
   -- serial clock output
   sd_sck_o <= sck_int;
   
   TX: cmd_tx
   port map(
      clk_i             => clk_i,
      rst_i             => rst_i,
      cmd_index_i       => cmd_index_i, -- 8-bit
      cmd_arg_i         => cmd_arg_i, -- 32-bit
      cmd_send_i        => cmd_send_i,
      cmd_done_o        => cmd_done_o,
      cmd_busy_o        => cmd_busy_int,
      sd_sck_i          => sck_int,
      sd_cmd_o          => sd_cmd_o);

   RX: resp_rx
   generic map(
      C_RESP_TIMEOUT => 100)
   port map(
      clk_i             => clk_i,
      rst_i             => rst_i,
      cmd_send_i        => cmd_send_i,
      cmd_busy_i        => cmd_busy_int,
      resp_type_i       => resp_type_i, -- 2-bit
      resp_data_o       => resp_data_o, -- 126-bit
      resp_timeout_o    => resp_timeout_o,
      resp_done_o       => resp_done_int,
      sd_sck_i          => sck_int,
      sd_cmd_i          => sd_cmd_i,
      sd_dat0_i         => sd_dat0_i);
   
   DATA: data_rx
   port map(
      clk_i             => clk_i,
      rst_i             => rst_i,
      resp_done_i       => resp_done_int,
      data_transfer_i   => data_transfer_i,
      data_crc0_err_o   => data_crc0_err_o,
      data_crc1_err_o   => data_crc1_err_o,
      data_crc2_err_o   => data_crc2_err_o,
      data_crc3_err_o   => data_crc3_err_o,
      data_zero0_o      => data_zero0_o,
      data_zero1_o      => data_zero1_o,
      data_zero2_o      => data_zero2_o,
      data_zero3_o      => data_zero3_o,
      data_done_o       => data_done_o,
      dbg_crc0_decoded  => dbg_crc0_decoded,
      dbg_crc1_decoded  => dbg_crc1_decoded,
      dbg_crc2_decoded  => dbg_crc2_decoded,
      dbg_crc3_decoded  => dbg_crc3_decoded,
      dbg_crc0_actual   => dbg_crc0_actual,
      dbg_crc1_actual   => dbg_crc1_actual,
      dbg_crc2_actual   => dbg_crc2_actual,
      dbg_crc3_actual   => dbg_crc3_actual,
      sd_sck_i          => sck_int,
      sd_dat0_i         => sd_dat0_i,
      sd_dat1_i         => sd_dat1_i,
      sd_dat2_i         => sd_dat2_i,
      sd_dat3_i         => sd_dat3_i);
   
   DIV_SELECT: process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         case(sck_div_i) is
            when b"000" => div_val <= x"00"; -- divided by 2   ->  50 MHz
            when b"001" => div_val <= x"01"; -- divided by 4   ->  25 MHz
            when b"010" => div_val <= x"04"; -- divided by 10  ->  10 MHz
            when b"011" => div_val <= x"09"; -- divided by 20  ->   5 MHz
            when b"100" => div_val <= x"18"; -- divided by 50  ->   2 MHz
            when b"101" => div_val <= x"31"; -- divided by 100 ->   1 MHz
            when b"110" => div_val <= x"3d"; -- divided by 125 -> 800 kHz
            when b"111" => div_val <= x"f9"; -- divided by 500 -> 200 kHz
            when others => div_val <= x"f9"; -- divided by 500 -> 200 kHz
         end case;
      end if;
   end process DIV_SELECT;
   
   SCK_CNT: process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if rst_i = '1' or sck_en_i = '0' then 
            cnt_sck <= (others => '0');
            sck_int <= '1';
         elsif cnt_sck >= div_val then
            cnt_sck <= (others => '0');
            sck_int <= not sck_int;
         else
            cnt_sck <= cnt_sck + '1';
         end if;
      end if;
   end process SCK_CNT;

end Behavioral;
