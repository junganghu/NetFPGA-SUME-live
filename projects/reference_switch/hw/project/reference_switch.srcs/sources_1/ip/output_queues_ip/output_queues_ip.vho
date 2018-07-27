-- (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: NetFPGA:NetFPGA:output_queues:1.00
-- IP Revision: 1

-- The following code must appear in the VHDL architecture header.

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
COMPONENT output_queues_ip
  PORT (
    axis_aclk : IN STD_LOGIC;
    axis_resetn : IN STD_LOGIC;
    s_axis_tdata : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
    s_axis_tkeep : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_tuser : IN STD_LOGIC_VECTOR(127 DOWNTO 0);
    s_axis_tvalid : IN STD_LOGIC;
    s_axis_tready : OUT STD_LOGIC;
    s_axis_tlast : IN STD_LOGIC;
    m_axis_0_tdata : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    m_axis_0_tkeep : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_0_tuser : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    m_axis_0_tvalid : OUT STD_LOGIC;
    m_axis_0_tready : IN STD_LOGIC;
    m_axis_0_tlast : OUT STD_LOGIC;
    m_axis_1_tdata : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    m_axis_1_tkeep : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_1_tuser : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    m_axis_1_tvalid : OUT STD_LOGIC;
    m_axis_1_tready : IN STD_LOGIC;
    m_axis_1_tlast : OUT STD_LOGIC;
    m_axis_2_tdata : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    m_axis_2_tkeep : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_2_tuser : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    m_axis_2_tvalid : OUT STD_LOGIC;
    m_axis_2_tready : IN STD_LOGIC;
    m_axis_2_tlast : OUT STD_LOGIC;
    m_axis_3_tdata : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    m_axis_3_tkeep : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_3_tuser : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    m_axis_3_tvalid : OUT STD_LOGIC;
    m_axis_3_tready : IN STD_LOGIC;
    m_axis_3_tlast : OUT STD_LOGIC;
    m_axis_4_tdata : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    m_axis_4_tkeep : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_4_tuser : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    m_axis_4_tvalid : OUT STD_LOGIC;
    m_axis_4_tready : IN STD_LOGIC;
    m_axis_4_tlast : OUT STD_LOGIC;
    bytes_stored : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    pkt_stored : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    bytes_removed_0 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    bytes_removed_1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    bytes_removed_2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    bytes_removed_3 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    bytes_removed_4 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    pkt_removed_0 : OUT STD_LOGIC;
    pkt_removed_1 : OUT STD_LOGIC;
    pkt_removed_2 : OUT STD_LOGIC;
    pkt_removed_3 : OUT STD_LOGIC;
    pkt_removed_4 : OUT STD_LOGIC;
    S_AXI_ACLK : IN STD_LOGIC;
    S_AXI_ARESETN : IN STD_LOGIC;
    S_AXI_AWADDR : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    S_AXI_AWVALID : IN STD_LOGIC;
    S_AXI_WDATA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    S_AXI_WSTRB : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
    S_AXI_WVALID : IN STD_LOGIC;
    S_AXI_BREADY : IN STD_LOGIC;
    S_AXI_ARADDR : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
    S_AXI_ARVALID : IN STD_LOGIC;
    S_AXI_RREADY : IN STD_LOGIC;
    S_AXI_ARREADY : OUT STD_LOGIC;
    S_AXI_RDATA : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    S_AXI_RRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S_AXI_RVALID : OUT STD_LOGIC;
    S_AXI_WREADY : OUT STD_LOGIC;
    S_AXI_BRESP : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    S_AXI_BVALID : OUT STD_LOGIC;
    S_AXI_AWREADY : OUT STD_LOGIC;
    bytes_dropped : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    pkt_dropped : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
  );
END COMPONENT;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body. Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : output_queues_ip
  PORT MAP (
    axis_aclk => axis_aclk,
    axis_resetn => axis_resetn,
    s_axis_tdata => s_axis_tdata,
    s_axis_tkeep => s_axis_tkeep,
    s_axis_tuser => s_axis_tuser,
    s_axis_tvalid => s_axis_tvalid,
    s_axis_tready => s_axis_tready,
    s_axis_tlast => s_axis_tlast,
    m_axis_0_tdata => m_axis_0_tdata,
    m_axis_0_tkeep => m_axis_0_tkeep,
    m_axis_0_tuser => m_axis_0_tuser,
    m_axis_0_tvalid => m_axis_0_tvalid,
    m_axis_0_tready => m_axis_0_tready,
    m_axis_0_tlast => m_axis_0_tlast,
    m_axis_1_tdata => m_axis_1_tdata,
    m_axis_1_tkeep => m_axis_1_tkeep,
    m_axis_1_tuser => m_axis_1_tuser,
    m_axis_1_tvalid => m_axis_1_tvalid,
    m_axis_1_tready => m_axis_1_tready,
    m_axis_1_tlast => m_axis_1_tlast,
    m_axis_2_tdata => m_axis_2_tdata,
    m_axis_2_tkeep => m_axis_2_tkeep,
    m_axis_2_tuser => m_axis_2_tuser,
    m_axis_2_tvalid => m_axis_2_tvalid,
    m_axis_2_tready => m_axis_2_tready,
    m_axis_2_tlast => m_axis_2_tlast,
    m_axis_3_tdata => m_axis_3_tdata,
    m_axis_3_tkeep => m_axis_3_tkeep,
    m_axis_3_tuser => m_axis_3_tuser,
    m_axis_3_tvalid => m_axis_3_tvalid,
    m_axis_3_tready => m_axis_3_tready,
    m_axis_3_tlast => m_axis_3_tlast,
    m_axis_4_tdata => m_axis_4_tdata,
    m_axis_4_tkeep => m_axis_4_tkeep,
    m_axis_4_tuser => m_axis_4_tuser,
    m_axis_4_tvalid => m_axis_4_tvalid,
    m_axis_4_tready => m_axis_4_tready,
    m_axis_4_tlast => m_axis_4_tlast,
    bytes_stored => bytes_stored,
    pkt_stored => pkt_stored,
    bytes_removed_0 => bytes_removed_0,
    bytes_removed_1 => bytes_removed_1,
    bytes_removed_2 => bytes_removed_2,
    bytes_removed_3 => bytes_removed_3,
    bytes_removed_4 => bytes_removed_4,
    pkt_removed_0 => pkt_removed_0,
    pkt_removed_1 => pkt_removed_1,
    pkt_removed_2 => pkt_removed_2,
    pkt_removed_3 => pkt_removed_3,
    pkt_removed_4 => pkt_removed_4,
    S_AXI_ACLK => S_AXI_ACLK,
    S_AXI_ARESETN => S_AXI_ARESETN,
    S_AXI_AWADDR => S_AXI_AWADDR,
    S_AXI_AWVALID => S_AXI_AWVALID,
    S_AXI_WDATA => S_AXI_WDATA,
    S_AXI_WSTRB => S_AXI_WSTRB,
    S_AXI_WVALID => S_AXI_WVALID,
    S_AXI_BREADY => S_AXI_BREADY,
    S_AXI_ARADDR => S_AXI_ARADDR,
    S_AXI_ARVALID => S_AXI_ARVALID,
    S_AXI_RREADY => S_AXI_RREADY,
    S_AXI_ARREADY => S_AXI_ARREADY,
    S_AXI_RDATA => S_AXI_RDATA,
    S_AXI_RRESP => S_AXI_RRESP,
    S_AXI_RVALID => S_AXI_RVALID,
    S_AXI_WREADY => S_AXI_WREADY,
    S_AXI_BRESP => S_AXI_BRESP,
    S_AXI_BVALID => S_AXI_BVALID,
    S_AXI_AWREADY => S_AXI_AWREADY,
    bytes_dropped => bytes_dropped,
    pkt_dropped => pkt_dropped
  );
-- INST_TAG_END ------ End INSTANTIATION Template ---------

