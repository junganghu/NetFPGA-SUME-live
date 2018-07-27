#
# Copyright (c) 2015 University of Cambridge
# All rights reserved.
#
# This software was developed by Stanford University and the University of Cambridge Computer Laboratory 
# under National Science Foundation under Grant No. CNS-0855268,
# the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
# by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
# as part of the DARPA MRC research programme.
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
# CONDITIONS OF ANY KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations under the License.
#
# @NETFPGA_LICENSE_HEADER_END@
#

# XGE-SFP1
set_property PACKAGE_PIN M18 [get_ports eth0_tx_disable]
set_property IOSTANDARD LVCMOS15 [get_ports eth0_tx_disable]
set_property PACKAGE_PIN M19 [get_ports eth0_tx_fault]
set_property IOSTANDARD LVCMOS15 [get_ports eth0_tx_fault]
set_property PACKAGE_PIN N18 [get_ports eth0_abs]
set_property IOSTANDARD LVCMOS15 [get_ports eth0_abs]

set_property LOC GTHE2_CHANNEL_X1Y39 [get_cells -hier -filter name=~*interface_0*gthe2_i]

# XGE-SFP2
set_property PACKAGE_PIN B31 [get_ports eth1_tx_disable]
set_property IOSTANDARD LVCMOS15 [get_ports eth1_tx_disable]
set_property PACKAGE_PIN C26 [get_ports eth1_tx_fault]
set_property IOSTANDARD LVCMOS15 [get_ports eth1_tx_fault]
set_property PACKAGE_PIN L19 [get_ports eth1_abs]
set_property IOSTANDARD LVCMOS15 [get_ports eth1_abs]

set_property LOC GTHE2_CHANNEL_X1Y38 [get_cells -hier -filter name=~*interface_1*gthe2_i]

# XGE-SFP3
set_property PACKAGE_PIN J38 [get_ports eth2_tx_disable]
set_property IOSTANDARD LVCMOS15 [get_ports eth2_tx_disable]
set_property PACKAGE_PIN E39 [get_ports eth2_tx_fault]
set_property IOSTANDARD LVCMOS15 [get_ports eth2_tx_fault]
set_property PACKAGE_PIN J37 [get_ports eth2_abs]
set_property IOSTANDARD LVCMOS15 [get_ports eth2_abs]

set_property LOC GTHE2_CHANNEL_X1Y37 [get_cells -hier -filter name=~*interface_2*gthe2_i]

# XGE-SFP4 <= PCIE slot side.
set_property PACKAGE_PIN L21 [get_ports eth3_tx_disable]
set_property IOSTANDARD LVCMOS15 [get_ports eth3_tx_disable]
set_property PACKAGE_PIN J26 [get_ports eth3_tx_fault]
set_property IOSTANDARD LVCMOS15 [get_ports eth3_tx_fault]
set_property PACKAGE_PIN H36 [get_ports eth3_abs]
set_property IOSTANDARD LVCMOS15 [get_ports eth3_abs]

set_property LOC GTHE2_CHANNEL_X1Y36 [get_cells -hier -filter name=~*interface_3*gthe2_i]

# GT Ref clk
set_property PACKAGE_PIN E10 [get_ports sfp_refclk_p]
set_property PACKAGE_PIN E9 [get_ports sfp_refclk_n]
create_clock -period 6.400 -name xgemac_clk_156 [get_ports sfp_refclk_p]

# XGE TX/RX LEDs
#   GRN - TX
#   YLW - RX
set_property PACKAGE_PIN G13  [get_ports eth0_tx_led]
set_property PACKAGE_PIN AL22 [get_ports eth1_tx_led]
set_property PACKAGE_PIN AY18 [get_ports eth2_tx_led]
set_property PACKAGE_PIN P31  [get_ports eth3_tx_led]

set_property PACKAGE_PIN L15  [get_ports eth0_rx_led]
set_property PACKAGE_PIN BA20 [get_ports eth1_rx_led]
set_property PACKAGE_PIN AY17 [get_ports eth2_rx_led]
set_property PACKAGE_PIN K32  [get_ports eth3_rx_led]

set_property IOSTANDARD LVCMOS15 [get_ports {eth?_?x_led}]


## Timing Constraints
create_clock -period 3.103 -name rxusrclkout0 [get_pins -hier -filter name=~*interface_0*gthe2_i/RXOUTCLK]
create_clock -period 3.103 -name txusrclkout0 [get_pins -hier -filter name=~*interface_0*gthe2_i/TXOUTCLK]
create_clock -period 3.103 -name rxusrclkout1 [get_pins -hier -filter name=~*interface_1*gthe2_i/RXOUTCLK]
create_clock -period 3.103 -name txusrclkout1 [get_pins -hier -filter name=~*interface_1*gthe2_i/TXOUTCLK]
create_clock -period 3.103 -name rxusrclkout2 [get_pins -hier -filter name=~*interface_2*gthe2_i/RXOUTCLK]
create_clock -period 3.103 -name txusrclkout2 [get_pins -hier -filter name=~*interface_2*gthe2_i/TXOUTCLK]
create_clock -period 3.103 -name rxusrclkout3 [get_pins -hier -filter name=~*interface_3*gthe2_i/RXOUTCLK]
create_clock -period 3.103 -name txusrclkout3 [get_pins -hier -filter name=~*interface_3*gthe2_i/TXOUTCLK]


set_false_path -from [get_clocks clk_out1_encap_decap_sys_clock_0_0] -to [get_clocks xgemac_clk_156]
set_false_path -from [get_clocks xgemac_clk_156] -to [get_clocks clk_out1_encap_decap_sys_clock_0_0]

set_false_path -from [get_clocks clk_out2_encap_decap_sys_clock_0_0] -to [get_clocks xgemac_clk_156]
set_false_path -from [get_clocks xgemac_clk_156] -to [get_clocks clk_out2_encap_decap_sys_clock_0_0]

set_false_path -from [get_clocks clk_out1_encap_decap_sys_clock_0_0] -to [get_clocks clk_out2_encap_decap_sys_clock_0_0]
set_false_path -from [get_clocks clk_out2_encap_decap_sys_clock_0_0] -to [get_clocks clk_out1_encap_decap_sys_clock_0_0]

set_false_path -from [get_clocks rxusrclkout?] -to [get_clocks xgemac_clk_156]
set_false_path -from [get_clocks xgemac_clk_156] -to [get_clocks rxusrclkout?]

set_false_path -from [get_clocks txusrclkout?] -to [get_clocks xgemac_clk_156]
set_false_path -from [get_clocks xgemac_clk_156] -to [get_clocks txusrclkout?]

set_false_path -from [get_clocks userclk1] -to [get_clocks clk_out1_encap_decap_sys_clock_0_0]
set_false_path -from [get_clocks clk_out1_encap_decap_sys_clock_0_0] -to [get_clocks userclk1]

set_false_path -from [get_clocks userclk1] -to [get_clocks pcie_sys_clk]
set_false_path -from [get_clocks pcie_sys_clk] -to [get_clocks userclk1]

set_false_path -from [get_clocks userclk1] -to [get_clocks xgemac_clk_156]
set_false_path -from [get_clocks xgemac_clk_156] -to [get_clocks userclk1]

set_false_path -from [get_clocks userclk1] -to [get_clocks clk_out1_encap_decap_sys_clock_0_0]
set_false_path -from [get_clocks clk_out1_encap_decap_sys_clock_0_0] -to [get_clocks userclk1]

set_false_path -from [get_clocks userclk1] -to [get_clocks clk_out2_encap_decap_sys_clock_0_0]
set_false_path -from [get_clocks clk_out2_encap_decap_sys_clock_0_0] -to [get_clocks userclk1]



