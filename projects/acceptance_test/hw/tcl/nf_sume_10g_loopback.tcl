#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# Copyright (C) 2017 Salvator Galea
# All rights reserved.
#
# File:
# nf_sume_10g_loopback.tcl
#
# Project:
# acceptance_test
#
# Author:
# Tinghui Wang (Steve)
# Modified by Salvator Galea
#
# Description:
# Vivado TCL script to generate 10G Loopback Test 
#
# @NETFPGA_LICENSE_HEADER_START@
#
# Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
# license agreements.  See the NOTICE file distributed with this work for
# additional information regarding copyright ownership.  NetFPGA licenses this
# file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
# "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at:
#
#   http://www.netfpga-cic.org
#
# Unless required by applicable law or agreed to in writing, Work distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
#
# @NETFPGA_LICENSE_HEADER_END@
#

source tcl/nf_sume_mbsys.tcl

# Set up External Ports for 10G interfaces eth0-3
proc create_ext_ports_10g { } {
  ## Set up External Ports
  # - eth0
  create_bd_port -dir O eth0_rx_led
  create_bd_port -dir O eth0_tx_led
  create_bd_port -dir I eth0_xphy_abs
  create_bd_port -dir I eth0_xphy_rxn
  create_bd_port -dir I eth0_xphy_rxp
  create_bd_port -dir O eth0_xphy_tx_disable
  create_bd_port -dir I eth0_xphy_tx_fault
  create_bd_port -dir O eth0_xphy_txn
  create_bd_port -dir O eth0_xphy_txp
  # - eth1
  create_bd_port -dir O eth1_rx_led
  create_bd_port -dir O eth1_tx_led
  create_bd_port -dir I eth1_xphy_abs
  create_bd_port -dir I eth1_xphy_rxn
  create_bd_port -dir I eth1_xphy_rxp
  create_bd_port -dir O eth1_xphy_tx_disable
  create_bd_port -dir I eth1_xphy_tx_fault
  create_bd_port -dir O eth1_xphy_txn
  create_bd_port -dir O eth1_xphy_txp
  # - eth2
  create_bd_port -dir O eth2_rx_led
  create_bd_port -dir O eth2_tx_led
  create_bd_port -dir I eth2_xphy_abs
  create_bd_port -dir I eth2_xphy_rxn
  create_bd_port -dir I eth2_xphy_rxp
  create_bd_port -dir O eth2_xphy_tx_disable
  create_bd_port -dir I eth2_xphy_tx_fault
  create_bd_port -dir O eth2_xphy_txn
  create_bd_port -dir O eth2_xphy_txp
  # - eth3
  create_bd_port -dir O eth3_rx_led
  create_bd_port -dir O eth3_tx_led
  create_bd_port -dir I eth3_xphy_abs
  create_bd_port -dir I eth3_xphy_rxn
  create_bd_port -dir I eth3_xphy_rxp
  create_bd_port -dir O eth3_xphy_tx_disable
  create_bd_port -dir I eth3_xphy_tx_fault
  create_bd_port -dir O eth3_xphy_txn
  create_bd_port -dir O eth3_xphy_txp
}

proc post_connection_hier_10g { nameHier } {
  # Make External Port Connection
  # - eth0
  connect_bd_net -net eth0_rx_led          [get_bd_pins eth0_rx_led         ] [get_bd_pins $nameHier/eth0_rx_led         ]
  connect_bd_net -net eth0_tx_led          [get_bd_pins eth0_tx_led         ] [get_bd_pins $nameHier/eth0_tx_led         ]
  connect_bd_net -net eth0_xphy_txn        [get_bd_pins eth0_xphy_txn       ] [get_bd_pins $nameHier/eth0_xphy_txn       ]
  connect_bd_net -net eth0_xphy_txp        [get_bd_pins eth0_xphy_txp       ] [get_bd_pins $nameHier/eth0_xphy_txp       ]
  connect_bd_net -net eth0_xphy_rxn        [get_bd_pins eth0_xphy_rxn       ] [get_bd_pins $nameHier/eth0_xphy_rxn       ]
  connect_bd_net -net eth0_xphy_rxp        [get_bd_pins eth0_xphy_rxp       ] [get_bd_pins $nameHier/eth0_xphy_rxp       ]
  connect_bd_net -net eth0_xphy_abs        [get_bd_pins eth0_xphy_abs       ] [get_bd_pins $nameHier/eth0_xphy_abs       ]
  connect_bd_net -net eth0_xphy_tx_disable [get_bd_pins eth0_xphy_tx_disable] [get_bd_pins $nameHier/eth0_xphy_tx_disable]
  connect_bd_net -net eth0_xphy_tx_fault   [get_bd_pins eth0_xphy_tx_fault  ] [get_bd_pins $nameHier/eth0_xphy_tx_fault  ]
  # - eth1
  connect_bd_net -net eth1_rx_led          [get_bd_pins eth1_rx_led         ] [get_bd_pins $nameHier/eth1_rx_led         ]
  connect_bd_net -net eth1_tx_led          [get_bd_pins eth1_tx_led         ] [get_bd_pins $nameHier/eth1_tx_led         ]
  connect_bd_net -net eth1_xphy_txn        [get_bd_pins eth1_xphy_txn       ] [get_bd_pins $nameHier/eth1_xphy_txn       ]
  connect_bd_net -net eth1_xphy_txp        [get_bd_pins eth1_xphy_txp       ] [get_bd_pins $nameHier/eth1_xphy_txp       ]
  connect_bd_net -net eth1_xphy_rxn        [get_bd_pins eth1_xphy_rxn       ] [get_bd_pins $nameHier/eth1_xphy_rxn       ]
  connect_bd_net -net eth1_xphy_rxp        [get_bd_pins eth1_xphy_rxp       ] [get_bd_pins $nameHier/eth1_xphy_rxp       ]
  connect_bd_net -net eth1_xphy_abs        [get_bd_pins eth1_xphy_abs       ] [get_bd_pins $nameHier/eth1_xphy_abs       ]
  connect_bd_net -net eth1_xphy_tx_disable [get_bd_pins eth1_xphy_tx_disable] [get_bd_pins $nameHier/eth1_xphy_tx_disable]
  connect_bd_net -net eth1_xphy_tx_fault   [get_bd_pins eth1_xphy_tx_fault  ] [get_bd_pins $nameHier/eth1_xphy_tx_fault  ]
  # - eth2
  connect_bd_net -net eth2_rx_led          [get_bd_pins eth2_rx_led         ] [get_bd_pins $nameHier/eth2_rx_led         ]
  connect_bd_net -net eth2_tx_led          [get_bd_pins eth2_tx_led         ] [get_bd_pins $nameHier/eth2_tx_led         ]
  connect_bd_net -net eth2_xphy_txn        [get_bd_pins eth2_xphy_txn       ] [get_bd_pins $nameHier/eth2_xphy_txn       ]
  connect_bd_net -net eth2_xphy_txp        [get_bd_pins eth2_xphy_txp       ] [get_bd_pins $nameHier/eth2_xphy_txp       ]
  connect_bd_net -net eth2_xphy_rxn        [get_bd_pins eth2_xphy_rxn       ] [get_bd_pins $nameHier/eth2_xphy_rxn       ]
  connect_bd_net -net eth2_xphy_rxp        [get_bd_pins eth2_xphy_rxp       ] [get_bd_pins $nameHier/eth2_xphy_rxp       ]
  connect_bd_net -net eth2_xphy_abs        [get_bd_pins eth2_xphy_abs       ] [get_bd_pins $nameHier/eth2_xphy_abs       ]
  connect_bd_net -net eth2_xphy_tx_disable [get_bd_pins eth2_xphy_tx_disable] [get_bd_pins $nameHier/eth2_xphy_tx_disable]
  connect_bd_net -net eth2_xphy_tx_fault   [get_bd_pins eth2_xphy_tx_fault  ] [get_bd_pins $nameHier/eth2_xphy_tx_fault  ]
  # - eth3
  connect_bd_net -net eth3_rx_led          [get_bd_pins eth3_rx_led         ] [get_bd_pins $nameHier/eth3_rx_led         ]
  connect_bd_net -net eth3_tx_led          [get_bd_pins eth3_tx_led         ] [get_bd_pins $nameHier/eth3_tx_led         ]
  connect_bd_net -net eth3_xphy_txn        [get_bd_pins eth3_xphy_txn       ] [get_bd_pins $nameHier/eth3_xphy_txn       ]
  connect_bd_net -net eth3_xphy_txp        [get_bd_pins eth3_xphy_txp       ] [get_bd_pins $nameHier/eth3_xphy_txp       ]
  connect_bd_net -net eth3_xphy_rxn        [get_bd_pins eth3_xphy_rxn       ] [get_bd_pins $nameHier/eth3_xphy_rxn       ]
  connect_bd_net -net eth3_xphy_rxp        [get_bd_pins eth3_xphy_rxp       ] [get_bd_pins $nameHier/eth3_xphy_rxp       ]
  connect_bd_net -net eth3_xphy_abs        [get_bd_pins eth3_xphy_abs       ] [get_bd_pins $nameHier/eth3_xphy_abs       ]
  connect_bd_net -net eth3_xphy_tx_disable [get_bd_pins eth3_xphy_tx_disable] [get_bd_pins $nameHier/eth3_xphy_tx_disable]
  connect_bd_net -net eth3_xphy_tx_fault   [get_bd_pins eth3_xphy_tx_fault  ] [get_bd_pins $nameHier/eth3_xphy_tx_fault  ]

  # Generate AXI Buses
  apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/mbsys/microblaze_0 (Periph)" Clk "Auto" }  [get_bd_intf_pins /$nameHier/S0_AXI]
  apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/mbsys/microblaze_0 (Periph)" Clk "Auto" }  [get_bd_intf_pins /$nameHier/S1_AXI]
  apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/mbsys/microblaze_0 (Periph)" Clk "Auto" }  [get_bd_intf_pins /$nameHier/S2_AXI]
  apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/mbsys/microblaze_0 (Periph)" Clk "Auto" }  [get_bd_intf_pins /$nameHier/S3_AXI]
  apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/mbsys/microblaze_0 (Periph)" Clk "Auto" }  [get_bd_intf_pins /$nameHier/S4_AXI]
  apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/mbsys/microblaze_0 (Periph)" Clk "Auto" }  [get_bd_intf_pins /$nameHier/S5_AXI]
}

# Hierarchical cell: xge
proc create_hier_10g { nameHier } {

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S0_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S1_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S2_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S3_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S4_AXI
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S5_AXI

  # Create pins
  # - clock and reset
  create_bd_pin -dir I -type rst areset
  create_bd_pin -dir I -type clk refclk
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn
  # - eth0
  create_bd_pin -dir O eth0_rx_led
  create_bd_pin -dir O eth0_tx_led
  create_bd_pin -dir I eth0_xphy_abs
  create_bd_pin -dir I eth0_xphy_rxn
  create_bd_pin -dir I eth0_xphy_rxp
  create_bd_pin -dir O eth0_xphy_tx_disable
  create_bd_pin -dir I eth0_xphy_tx_fault
  create_bd_pin -dir O eth0_xphy_txn
  create_bd_pin -dir O eth0_xphy_txp
  # - eth1
  create_bd_pin -dir O eth1_rx_led
  create_bd_pin -dir O eth1_tx_led
  create_bd_pin -dir I eth1_xphy_abs
  create_bd_pin -dir I eth1_xphy_rxn
  create_bd_pin -dir I eth1_xphy_rxp
  create_bd_pin -dir O eth1_xphy_tx_disable
  create_bd_pin -dir I eth1_xphy_tx_fault
  create_bd_pin -dir O eth1_xphy_txn
  create_bd_pin -dir O eth1_xphy_txp
  # - eth2
  create_bd_pin -dir O eth2_rx_led
  create_bd_pin -dir O eth2_tx_led
  create_bd_pin -dir I eth2_xphy_abs
  create_bd_pin -dir I eth2_xphy_rxn
  create_bd_pin -dir I eth2_xphy_rxp
  create_bd_pin -dir O eth2_xphy_tx_disable
  create_bd_pin -dir I eth2_xphy_tx_fault
  create_bd_pin -dir O eth2_xphy_txn
  create_bd_pin -dir O eth2_xphy_txp
  # - eth3
  create_bd_pin -dir O eth3_rx_led
  create_bd_pin -dir O eth3_tx_led
  create_bd_pin -dir I eth3_xphy_abs
  create_bd_pin -dir I eth3_xphy_rxn
  create_bd_pin -dir I eth3_xphy_rxp
  create_bd_pin -dir O eth3_xphy_tx_disable
  create_bd_pin -dir I eth3_xphy_tx_fault
  create_bd_pin -dir O eth3_xphy_txn
  create_bd_pin -dir O eth3_xphy_txp

  # Create instance: clk156_reset_inv, and set properties
  set clk156_reset_inv [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 clk156_reset_inv ]
  set_property -dict [ list CONFIG.C_OPERATION {not} CONFIG.C_SIZE {1}  ] $clk156_reset_inv

  # Create instance: nf_axis_gen_chk_0, and set properties
  set nf_axis_gen_chk_0 [ create_bd_cell -type ip -vlnv digilent:digilent:nf_axis_gen_chk:1.0 nf_axis_gen_chk_0 ]
  set_property -dict [ list CONFIG.C_M_AXIS_TDATA_WIDTH {64} CONFIG.C_S_AXIS_TDATA_WIDTH {64} ] $nf_axis_gen_chk_0

  # Create instance: nf_axis_gen_chk_1, and set properties
  set nf_axis_gen_chk_1 [ create_bd_cell -type ip -vlnv digilent:digilent:nf_axis_gen_chk:1.0 nf_axis_gen_chk_1 ]
  set_property -dict [ list CONFIG.C_M_AXIS_TDATA_WIDTH {64} CONFIG.C_S_AXIS_TDATA_WIDTH {64} ] $nf_axis_gen_chk_1

  # Create instance: xge_eth0, and set properties
  set xge_eth0 [ create_bd_cell -type ip -vlnv digilent:digilent:nf_sume_10g_interface:1.0 xge_eth0 ]
  set_property -dict [list CONFIG.USE_SHARED_TXUSRCLK {FALSE}] $xge_eth0

  # Create instance: xge_eth1, and set properties
  set xge_eth1 [ create_bd_cell -type ip -vlnv digilent:digilent:nf_sume_10g_interface:1.0 xge_eth1 ]

  # Create instance: xge_eth2, and set properties
  set xge_eth2 [ create_bd_cell -type ip -vlnv digilent:digilent:nf_sume_10g_interface:1.0 xge_eth2 ]

  # Create instance: xge_eth3, and set properties
  set xge_eth3 [ create_bd_cell -type ip -vlnv digilent:digilent:nf_sume_10g_interface:1.0 xge_eth3 ]

  # Create instance: xge_shared_logic, and set properties
  set xge_shared_logic [ create_bd_cell -type ip -vlnv digilent:digilent:nf_sume_10g_interface_shared_logic:1.0 xge_shared_logic ]

  # Create interface connections
  connect_bd_intf_net -intf_net mbsys_M03_AXI [get_bd_intf_pins S0_AXI] [get_bd_intf_pins xge_eth0/S_AXI]
  connect_bd_intf_net -intf_net mbsys_M04_AXI [get_bd_intf_pins S1_AXI] [get_bd_intf_pins xge_eth1/S_AXI]
  connect_bd_intf_net -intf_net mbsys_M05_AXI [get_bd_intf_pins S2_AXI] [get_bd_intf_pins xge_eth2/S_AXI]
  connect_bd_intf_net -intf_net mbsys_M06_AXI [get_bd_intf_pins S3_AXI] [get_bd_intf_pins xge_eth3/S_AXI]
  connect_bd_intf_net -intf_net mbsys_M07_AXI [get_bd_intf_pins S4_AXI] [get_bd_intf_pins nf_axis_gen_chk_0/S_AXI]
  connect_bd_intf_net -intf_net mbsys_M08_AXI [get_bd_intf_pins S5_AXI] [get_bd_intf_pins nf_axis_gen_chk_1/S_AXI]
  connect_bd_intf_net -intf_net nf_axis_gen_chk_0_M_AXIS [get_bd_intf_pins nf_axis_gen_chk_0/M_AXIS] [get_bd_intf_pins xge_eth0/tx_axis]
  connect_bd_intf_net -intf_net nf_axis_gen_chk_1_M_AXIS [get_bd_intf_pins nf_axis_gen_chk_1/M_AXIS] [get_bd_intf_pins xge_eth3/tx_axis]
  connect_bd_intf_net -intf_net xge_eth0_rx_axis [get_bd_intf_pins nf_axis_gen_chk_0/S_AXIS] [get_bd_intf_pins xge_eth0/rx_axis]
  connect_bd_intf_net -intf_net xge_eth1_rx_axis [get_bd_intf_pins xge_eth1/rx_axis] [get_bd_intf_pins xge_eth2/tx_axis]
  connect_bd_intf_net -intf_net xge_eth2_rx_axis [get_bd_intf_pins xge_eth1/tx_axis] [get_bd_intf_pins xge_eth2/rx_axis]
  connect_bd_intf_net -intf_net xge_eth3_rx_axis [get_bd_intf_pins nf_axis_gen_chk_1/S_AXIS] [get_bd_intf_pins xge_eth3/rx_axis]

  # Create port connections
  connect_bd_net -net clk156_reset_inv_Res [get_bd_pins clk156_reset_inv/Res] [get_bd_pins nf_axis_gen_chk_0/m_axis_aresetn] [get_bd_pins nf_axis_gen_chk_0/s_axis_aresetn] [get_bd_pins nf_axis_gen_chk_1/m_axis_aresetn] [get_bd_pins nf_axis_gen_chk_1/s_axis_aresetn] [get_bd_pins xge_eth0/rx_axis_fifo_aresetn] [get_bd_pins xge_eth0/tx_axis_fifo_aresetn] [get_bd_pins xge_eth1/rx_axis_fifo_aresetn] [get_bd_pins xge_eth1/tx_axis_fifo_aresetn] [get_bd_pins xge_eth2/rx_axis_fifo_aresetn] [get_bd_pins xge_eth2/tx_axis_fifo_aresetn] [get_bd_pins xge_eth3/rx_axis_fifo_aresetn] [get_bd_pins xge_eth3/tx_axis_fifo_aresetn]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins s_axi_aclk] [get_bd_pins nf_axis_gen_chk_0/s_axi_aclk] [get_bd_pins nf_axis_gen_chk_1/s_axi_aclk] [get_bd_pins xge_eth0/s_axi_aclk] [get_bd_pins xge_eth1/s_axi_aclk] [get_bd_pins xge_eth2/s_axi_aclk] [get_bd_pins xge_eth3/s_axi_aclk]
  connect_bd_net -net areset [get_bd_pins areset] [get_bd_pins xge_shared_logic/areset]
  connect_bd_net -net rst_clk_wiz_1_100M_peripheral_aresetn [get_bd_pins s_axi_aresetn] [get_bd_pins nf_axis_gen_chk_0/s_axi_aresetn] [get_bd_pins nf_axis_gen_chk_1/s_axi_aresetn] [get_bd_pins xge_eth0/s_axi_aresetn] [get_bd_pins xge_eth1/s_axi_aresetn] [get_bd_pins xge_eth2/s_axi_aresetn] [get_bd_pins xge_eth3/s_axi_aresetn]
  connect_bd_net -net sfp_ibufdsgte_IBUF_OUT [get_bd_pins refclk] [get_bd_pins xge_shared_logic/refclk]
  connect_bd_net [get_bd_pins xge_eth0/txusrclk_out] [get_bd_pins xge_eth1/txusrclk_shared] [get_bd_pins xge_eth2/txusrclk_shared] [get_bd_pins xge_eth3/txusrclk_shared]

  # Connect XGE Interface Signals
  # - eth0
  connect_bd_net -net eth0_rx_led          [get_bd_pins eth0_rx_led         ] [get_bd_pins xge_eth0/rx_led         ]
  connect_bd_net -net eth0_tx_led          [get_bd_pins eth0_tx_led         ] [get_bd_pins xge_eth0/tx_led         ]
  connect_bd_net -net eth0_xphy_txn        [get_bd_pins eth0_xphy_txn       ] [get_bd_pins xge_eth0/xphy_txn       ]
  connect_bd_net -net eth0_xphy_txp        [get_bd_pins eth0_xphy_txp       ] [get_bd_pins xge_eth0/xphy_txp       ]
  connect_bd_net -net eth0_xphy_rxn        [get_bd_pins eth0_xphy_rxn       ] [get_bd_pins xge_eth0/xphy_rxn       ]
  connect_bd_net -net eth0_xphy_rxp        [get_bd_pins eth0_xphy_rxp       ] [get_bd_pins xge_eth0/xphy_rxp       ]
  connect_bd_net -net eth0_xphy_abs        [get_bd_pins eth0_xphy_abs       ] [get_bd_pins xge_eth0/xphy_abs       ]
  connect_bd_net -net eth0_xphy_tx_disable [get_bd_pins eth0_xphy_tx_disable] [get_bd_pins xge_eth0/xphy_tx_disable]
  connect_bd_net -net eth0_xphy_tx_fault   [get_bd_pins eth0_xphy_tx_fault  ] [get_bd_pins xge_eth0/xphy_tx_fault  ]
  # - eth1
  connect_bd_net -net eth1_rx_led          [get_bd_pins eth1_rx_led         ] [get_bd_pins xge_eth1/rx_led         ]
  connect_bd_net -net eth1_tx_led          [get_bd_pins eth1_tx_led         ] [get_bd_pins xge_eth1/tx_led         ]
  connect_bd_net -net eth1_xphy_txn        [get_bd_pins eth1_xphy_txn       ] [get_bd_pins xge_eth1/xphy_txn       ]
  connect_bd_net -net eth1_xphy_txp        [get_bd_pins eth1_xphy_txp       ] [get_bd_pins xge_eth1/xphy_txp       ]
  connect_bd_net -net eth1_xphy_rxn        [get_bd_pins eth1_xphy_rxn       ] [get_bd_pins xge_eth1/xphy_rxn       ]
  connect_bd_net -net eth1_xphy_rxp        [get_bd_pins eth1_xphy_rxp       ] [get_bd_pins xge_eth1/xphy_rxp       ]
  connect_bd_net -net eth1_xphy_abs        [get_bd_pins eth1_xphy_abs       ] [get_bd_pins xge_eth1/xphy_abs       ]
  connect_bd_net -net eth1_xphy_tx_disable [get_bd_pins eth1_xphy_tx_disable] [get_bd_pins xge_eth1/xphy_tx_disable]
  connect_bd_net -net eth1_xphy_tx_fault   [get_bd_pins eth1_xphy_tx_fault  ] [get_bd_pins xge_eth1/xphy_tx_fault  ]
  # - eth2
  connect_bd_net -net eth2_rx_led          [get_bd_pins eth2_rx_led         ] [get_bd_pins xge_eth2/rx_led         ]
  connect_bd_net -net eth2_tx_led          [get_bd_pins eth2_tx_led         ] [get_bd_pins xge_eth2/tx_led         ]
  connect_bd_net -net eth2_xphy_txn        [get_bd_pins eth2_xphy_txn       ] [get_bd_pins xge_eth2/xphy_txn       ]
  connect_bd_net -net eth2_xphy_txp        [get_bd_pins eth2_xphy_txp       ] [get_bd_pins xge_eth2/xphy_txp       ]
  connect_bd_net -net eth2_xphy_rxn        [get_bd_pins eth2_xphy_rxn       ] [get_bd_pins xge_eth2/xphy_rxn       ]
  connect_bd_net -net eth2_xphy_rxp        [get_bd_pins eth2_xphy_rxp       ] [get_bd_pins xge_eth2/xphy_rxp       ]
  connect_bd_net -net eth2_xphy_abs        [get_bd_pins eth2_xphy_abs       ] [get_bd_pins xge_eth2/xphy_abs       ]
  connect_bd_net -net eth2_xphy_tx_disable [get_bd_pins eth2_xphy_tx_disable] [get_bd_pins xge_eth2/xphy_tx_disable]
  connect_bd_net -net eth2_xphy_tx_fault   [get_bd_pins eth2_xphy_tx_fault  ] [get_bd_pins xge_eth2/xphy_tx_fault  ]
  # - eth3
  connect_bd_net -net eth3_rx_led          [get_bd_pins eth3_rx_led         ] [get_bd_pins xge_eth3/rx_led         ]
  connect_bd_net -net eth3_tx_led          [get_bd_pins eth3_tx_led         ] [get_bd_pins xge_eth3/tx_led         ]
  connect_bd_net -net eth3_xphy_txn        [get_bd_pins eth3_xphy_txn       ] [get_bd_pins xge_eth3/xphy_txn       ]
  connect_bd_net -net eth3_xphy_txp        [get_bd_pins eth3_xphy_txp       ] [get_bd_pins xge_eth3/xphy_txp       ]
  connect_bd_net -net eth3_xphy_rxn        [get_bd_pins eth3_xphy_rxn       ] [get_bd_pins xge_eth3/xphy_rxn       ]
  connect_bd_net -net eth3_xphy_rxp        [get_bd_pins eth3_xphy_rxp       ] [get_bd_pins xge_eth3/xphy_rxp       ]
  connect_bd_net -net eth3_xphy_abs        [get_bd_pins eth3_xphy_abs       ] [get_bd_pins xge_eth3/xphy_abs       ]
  connect_bd_net -net eth3_xphy_tx_disable [get_bd_pins eth3_xphy_tx_disable] [get_bd_pins xge_eth3/xphy_tx_disable]
  connect_bd_net -net eth3_xphy_tx_fault   [get_bd_pins eth3_xphy_tx_fault  ] [get_bd_pins xge_eth3/xphy_tx_fault  ]
  # - shared logics
  connect_bd_net -net xge_shared_logic_areset_clk156 [get_bd_pins clk156_reset_inv/Op1] [get_bd_pins xge_eth0/areset] [get_bd_pins xge_eth0/areset_clk156] [get_bd_pins xge_eth1/areset] [get_bd_pins xge_eth1/areset_clk156] [get_bd_pins xge_eth2/areset] [get_bd_pins xge_eth2/areset_clk156] [get_bd_pins xge_eth3/areset] [get_bd_pins xge_eth3/areset_clk156] [get_bd_pins xge_shared_logic/areset_clk156]
  connect_bd_net -net xge_shared_logic_clk156 [get_bd_pins nf_axis_gen_chk_0/m_axis_aclk] [get_bd_pins nf_axis_gen_chk_0/s_axis_aclk] [get_bd_pins nf_axis_gen_chk_1/m_axis_aclk] [get_bd_pins nf_axis_gen_chk_1/s_axis_aclk] [get_bd_pins xge_eth0/clk156] [get_bd_pins xge_eth0/rx_axis_aclk] [get_bd_pins xge_eth0/tx_axis_aclk] [get_bd_pins xge_eth1/clk156] [get_bd_pins xge_eth1/rx_axis_aclk] [get_bd_pins xge_eth1/tx_axis_aclk] [get_bd_pins xge_eth2/clk156] [get_bd_pins xge_eth2/rx_axis_aclk] [get_bd_pins xge_eth2/tx_axis_aclk] [get_bd_pins xge_eth3/clk156] [get_bd_pins xge_eth3/rx_axis_aclk] [get_bd_pins xge_eth3/tx_axis_aclk] [get_bd_pins xge_shared_logic/clk156]
  connect_bd_net -net xge_shared_logic_dclk [get_bd_pins xge_eth0/dclk] [get_bd_pins xge_eth1/dclk] [get_bd_pins xge_eth2/dclk] [get_bd_pins xge_eth3/dclk] [get_bd_pins xge_shared_logic/dclk]
  connect_bd_net -net xge_shared_logic_gtrxreset [get_bd_pins xge_eth0/gtrxreset] [get_bd_pins xge_eth1/gtrxreset] [get_bd_pins xge_eth2/gtrxreset] [get_bd_pins xge_eth3/gtrxreset] [get_bd_pins xge_shared_logic/gtrxreset]
  connect_bd_net -net xge_shared_logic_gttxreset [get_bd_pins xge_eth0/gttxreset] [get_bd_pins xge_eth1/gttxreset] [get_bd_pins xge_eth2/gttxreset] [get_bd_pins xge_eth3/gttxreset] [get_bd_pins xge_shared_logic/gttxreset]
  connect_bd_net -net xge_shared_logic_qplllock [get_bd_pins xge_eth0/qplllock] [get_bd_pins xge_eth1/qplllock] [get_bd_pins xge_eth2/qplllock] [get_bd_pins xge_eth3/qplllock] [get_bd_pins xge_shared_logic/qplllock]
  connect_bd_net -net xge_shared_logic_qplloutclk [get_bd_pins xge_eth0/qplloutclk] [get_bd_pins xge_eth1/qplloutclk] [get_bd_pins xge_eth2/qplloutclk] [get_bd_pins xge_eth3/qplloutclk] [get_bd_pins xge_shared_logic/qplloutclk]
  connect_bd_net -net xge_shared_logic_qplloutrefclk [get_bd_pins xge_eth0/qplloutrefclk] [get_bd_pins xge_eth1/qplloutrefclk] [get_bd_pins xge_eth2/qplloutrefclk] [get_bd_pins xge_eth3/qplloutrefclk] [get_bd_pins xge_shared_logic/qplloutrefclk]
  connect_bd_net -net xge_shared_logic_reset_counter_done [get_bd_pins xge_eth0/reset_counter_done] [get_bd_pins xge_eth1/reset_counter_done] [get_bd_pins xge_eth2/reset_counter_done] [get_bd_pins xge_eth3/reset_counter_done] [get_bd_pins xge_shared_logic/reset_counter_done]
  
  # Restore current instance
  current_bd_instance $oldCurInst
}

set project_name        {nf_sume_10g_loopback_ex}
set device 				{xc7vx690tffg1761-3}
set ip_repo_path        {../../ip_repo}
set bd_name             {baseSys}

# Create project under project folder
if {![file isdirectory project]} {
	file mkdir project
}
cd project
create_project $project_name ./$project_name -part $device

# Set IP Repository
set_property ip_repo_paths ${ip_repo_path} [current_fileset]

update_ip_catalog -rebuild

# Create Microblaze System
create_bd -uart true -iic true
open_bd_design [get_files -regexp -nocase {.*\.bd}]

# Create instance: sysclk_ibufds, and set properties
delete_bd_objs [get_bd_pins sysclk]

# set sysclk_ibufds [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf sysclk_ibufds ]
set fpga_sysclk_n [ create_bd_port -dir I -from 0 -to 0 fpga_sysclk_n ]
set fpga_sysclk_p [ create_bd_port -dir I -from 0 -to 0 fpga_sysclk_p ]

# Create External Ports for 10G Ethernet
create_ext_ports_10g
create_hier_10g {nf_sume_10g_subsys}
post_connection_hier_10g {nf_sume_10g_subsys}

# Setup SFP+ Refclk Connection
create_bd_port -dir I -from 0 -to 0 sfp_refclk_n
create_bd_port -dir I -from 0 -to 0 sfp_refclk_p
# Create instance: sfp_ibufdsgte, and set properties
set sfp_ibufdsgte [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 sfp_ibufdsgte ]
set_property -dict [ list CONFIG.C_BUF_TYPE {IBUFDSGTE}  ] $sfp_ibufdsgte
# Connect SFP+ Refclk
connect_bd_net [get_bd_ports sfp_refclk_p] [get_bd_pins sfp_ibufdsgte/IBUF_DS_P]
connect_bd_net [get_bd_ports sfp_refclk_n] [get_bd_pins sfp_ibufdsgte/IBUF_DS_N]

# Connect areset
connect_bd_net [get_bd_ports reset] [get_bd_pins nf_sume_10g_subsys/areset]
connect_bd_net [get_bd_pins sfp_ibufdsgte/IBUF_OUT] [get_bd_pins nf_sume_10g_subsys/refclk]


# ---------------------------------------------------------------------------------------------------------------
# Bug Vivado 2016.4 -- Workaround -- Start
# https://forums.xilinx.com/t5/Synthesis/Vivado-2016-3-Utility-Buffer-issue-Limiting-clock-on-100Mhz/td-p/736176
# System clock buffer.
startgroup
set CLK_IN_D [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 CLK_IN_D ]
set_property -dict [ list CONFIG.FREQ_HZ {200000000} ] $CLK_IN_D

set sysclk_ibufds [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 sysclk_ibufds_0 ]

connect_bd_net -net fpga_sysclk_n [get_bd_ports fpga_sysclk_n] [get_bd_pins sysclk_ibufds_0/IBUF_DS_N]
connect_bd_net -net fpga_sysclk_p [get_bd_ports fpga_sysclk_p] [get_bd_pins sysclk_ibufds_0/IBUF_DS_P]
endgroup

create_bd_intf_net clk_in_d_0
connect_bd_intf_net -intf_net clk_in_d_0 [get_bd_intf_ports CLK_IN_D] [get_bd_intf_pins sysclk_ibufds_0/CLK_IN_D]

delete_bd_objs [get_bd_intf_nets clk_in_d_0] [get_bd_cells sysclk_ibufds_0]

startgroup
set_property -dict [ list CONFIG.FREQ_HZ {200000000} ] $CLK_IN_D
set sysclk_ibufds [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf sysclk_ibufds ]
set_property -dict [ list CONFIG.C_BUF_TYPE {IBUFDS} ] $sysclk_ibufds
endgroup

connect_bd_net [get_bd_pins sysclk_ibufds/IBUF_OUT] [get_bd_pins clk_wiz_1/clk_in1]
connect_bd_intf_net [get_bd_intf_ports CLK_IN_D] [get_bd_intf_pins sysclk_ibufds/CLK_IN_D]
validate_bd_design

delete_bd_obj [get_bd_intf_nets CLK_IN_D_1] [get_bd_intf_ports CLK_IN_D]

connect_bd_net -net fpga_sysclk_n [get_bd_ports fpga_sysclk_n] [get_bd_pins sysclk_ibufds/IBUF_DS_N]
connect_bd_net -net fpga_sysclk_p [get_bd_ports fpga_sysclk_p] [get_bd_pins sysclk_ibufds/IBUF_DS_P]
report_property -all [get_bd_intf_pins sysclk_ibufds/CLK_IN_D]
validate_bd_design
# Bug Vivado 2016.4 -- Workaround -- End
# ---------------------------------------------------------------------------------------------------------------


# Generate Top Wrapper
regenerate_bd_layout
save_bd_design

close_bd_design [current_bd_design]
make_wrapper -files [get_files -regexp -nocase {.*\.bd}] -top -import -force
add_files -fileset constrs_1 -norecurse ../xdc/nf_sume_system_general.xdc
add_files -fileset constrs_1 -norecurse ../xdc/nf_sume_10g_loopback.xdc

# Add 
add_files -fileset sim_1 -norecurse ../sim/nf_sume_10g_loopback/system_wrapper_tb.v

# Update Compile Order
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

exit
