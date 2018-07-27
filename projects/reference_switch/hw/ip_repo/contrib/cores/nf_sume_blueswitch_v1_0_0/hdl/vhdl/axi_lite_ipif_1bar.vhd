--
-- Copyright (c) 2015 University of Cambridge
-- All rights reserved
--
-- This software was developed by the University of Cambridge Computer
-- Laboratory under EPSRC INTERNET Project EP/H040536/1, National Science
-- Foundation under Grant No. CNS-0855268, and Defense Advanced Research
-- Projects Agency (DARPA) and Air Force Research Laboratory (AFRL), under
-- contract FA8750-11-C-0249.
--
-- @NETFPGA_LICENSE_HEADER_START@
--
-- Licensed to NetFPGA Open Systems C.I.C. (NetFPGA) under one or more contributor
-- license agreements.  See the NOTICE file distributed with this work for
-- additional information regarding copyright ownership.  NetFPGA licenses this
-- file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
-- "License"); you may not use this file except in compliance with the
-- License.  You may obtain a copy of the License at:
--
-- http://www.netfpga-cic.org
--
-- Unless required by applicable law or agreed to in writing, Work distributed
-- under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
-- CONDITIONS OF ANY KIND, either express or implied.  See the License for the
-- specific language governing permissions and limitations under the License.
--
-- @NETFPGA_LICENSE_HEADER_END@


library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library xil_defaultlib;
use xil_defaultlib.axi_lite_ipif;
use xil_defaultlib.ipif_pkg.all;

entity axi_lite_ipif_1bar is
   generic
   (
      C_S_AXI_DATA_WIDTH         : integer               := 32;
      C_S_AXI_ADDR_WIDTH         : integer               := 32;
      C_USE_WSTRB                : integer               := 0; -- Enable(1),   Disable(0, byte enables fixed to '1111')
	   C_DPHASE_TIMEOUT           : integer               := 8; -- Enable(!=0), Disbale(0, data phase timeout not implemented)
      C_BAR0_BASEADDR            : std_logic_vector      := X"FFFFFFFF";
      C_BAR0_HIGHADDR            : std_logic_vector      := X"00000000"
   );
   port
   (
      S_AXI_ACLK                 : in  std_logic;
      S_AXI_ARESETN              : in  std_logic;
      S_AXI_AWADDR               : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
      S_AXI_AWVALID              : in  std_logic;
      S_AXI_WDATA                : in  std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
      S_AXI_WSTRB                : in  std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
      S_AXI_WVALID               : in  std_logic;
      S_AXI_BREADY               : in  std_logic;
      S_AXI_ARADDR               : in  std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
      S_AXI_ARVALID              : in  std_logic;
      S_AXI_RREADY               : in  std_logic;
      S_AXI_ARREADY              : out std_logic;
      S_AXI_RDATA                : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
      S_AXI_RRESP                : out std_logic_vector(1 downto 0);
      S_AXI_RVALID               : out std_logic;
      S_AXI_WREADY               : out std_logic;
      S_AXI_BRESP                : out std_logic_vector(1 downto 0);
      S_AXI_BVALID               : out std_logic;
      S_AXI_AWREADY              : out std_logic;
	   -- Controls to the IP/IPIF modules
      Bus2IP_Clk                 : out std_logic;
      Bus2IP_Resetn              : out std_logic;
      Bus2IP_Addr                : out std_logic_vector((C_S_AXI_ADDR_WIDTH-1) downto 0);
      Bus2IP_RNW                 : out std_logic;
      Bus2IP_BE                  : out std_logic_vector(((C_S_AXI_DATA_WIDTH/8)-1) downto 0);
      Bus2IP_CS                  : out std_logic_vector(0 downto 0);
      Bus2IP_Data                : out std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      IP2Bus_Data                : in  std_logic_vector((C_S_AXI_DATA_WIDTH-1) downto 0);
      IP2Bus_WrAck               : in  std_logic;
      IP2Bus_RdAck               : in  std_logic;
      IP2Bus_Error               : in  std_logic
   );
end entity axi_lite_ipif_1bar;

------------------------------------------------------------------------------
-- Architecture section
------------------------------------------------------------------------------

architecture IMP of axi_lite_ipif_1bar is
   constant C_S_AXI_MIN_SIZE		         : std_logic_vector(31 downto 0)  := (C_BAR0_BASEADDR xor C_BAR0_HIGHADDR); 
   constant ZERO_ADDR_PAD                 : std_logic_vector(0 to 31)      := (others => '0');
   constant IPIF_ARD_ADDR_RANGE_ARRAY     : SLV64_ARRAY_TYPE               := 
      (
         ZERO_ADDR_PAD & C_BAR0_BASEADDR,
         ZERO_ADDR_PAD & C_BAR0_HIGHADDR
      );
   constant IPIF_ARD_NUM_CE_ARRAY         : INTEGER_ARRAY_TYPE             := 
      (
         0 => 1 -- CE count for BAR0 
      );
begin

------------------------------------------
-- instantiate axi_lite_ipif
------------------------------------------
AXI_LITE_IPIF_I : entity xil_defaultlib.axi_lite_ipif
generic map
(
   C_S_AXI_DATA_WIDTH         => C_S_AXI_DATA_WIDTH,
   C_S_AXI_ADDR_WIDTH         => C_S_AXI_ADDR_WIDTH,
   C_S_AXI_MIN_SIZE           => C_S_AXI_MIN_SIZE,
   C_USE_WSTRB                => C_USE_WSTRB,
   C_DPHASE_TIMEOUT           => C_DPHASE_TIMEOUT,
   C_ARD_ADDR_RANGE_ARRAY     => IPIF_ARD_ADDR_RANGE_ARRAY,
   C_ARD_NUM_CE_ARRAY         => IPIF_ARD_NUM_CE_ARRAY
)
port map
(
   S_AXI_ACLK                 => S_AXI_ACLK,
   S_AXI_ARESETN              => S_AXI_ARESETN,
   S_AXI_AWADDR               => S_AXI_AWADDR,
   S_AXI_AWVALID              => S_AXI_AWVALID,
   S_AXI_WDATA                => S_AXI_WDATA,
   S_AXI_WSTRB                => S_AXI_WSTRB,
   S_AXI_WVALID               => S_AXI_WVALID,
   S_AXI_BREADY               => S_AXI_BREADY,
   S_AXI_ARADDR               => S_AXI_ARADDR,
   S_AXI_ARVALID              => S_AXI_ARVALID,
   S_AXI_RREADY               => S_AXI_RREADY,
   S_AXI_ARREADY              => S_AXI_ARREADY,
   S_AXI_RDATA                => S_AXI_RDATA,
   S_AXI_RRESP                => S_AXI_RRESP,
   S_AXI_RVALID               => S_AXI_RVALID,
   S_AXI_WREADY               => S_AXI_WREADY,
   S_AXI_BRESP                => S_AXI_BRESP,
   S_AXI_BVALID               => S_AXI_BVALID,
   S_AXI_AWREADY              => S_AXI_AWREADY,
   Bus2IP_Clk                 => Bus2IP_Clk,
   Bus2IP_Resetn              => Bus2IP_Resetn,
   Bus2IP_Addr                => Bus2IP_Addr,
   Bus2IP_RNW                 => Bus2IP_RNW,
   Bus2IP_BE                  => Bus2IP_BE,
   Bus2IP_CS                  => Bus2IP_CS,
   Bus2IP_RdCE                => open,
   Bus2IP_WrCE                => open,
   Bus2IP_Data                => Bus2IP_Data,
   IP2Bus_WrAck               => IP2Bus_WrAck,
   IP2Bus_RdAck               => IP2Bus_RdAck,
   IP2Bus_Error               => IP2Bus_Error,
   IP2Bus_Data                => IP2Bus_Data
);

end IMP;
