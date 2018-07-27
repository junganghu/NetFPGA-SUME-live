#
# Copyright (c) 2015-2016 Jong Hun Han
# All rights reserved
#
# This software was developed by Stanford University and the University of
# Cambridge Computer Laboratory under National Science Foundation under Grant
# No. CNS-0855268, the University of Cambridge Computer Laboratory under EPSRC
# INTERNET Project EP/H040536/1 and by the University of Cambridge Computer
# Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), as part of
# the DARPA MRC research programme.
#
# @NETFPGA_LICENSE_HEADER_START@
#
# Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor license
# agreements.  See the NOTICE file distributed with this work for additional
# information regarding copyright ownership.  NetFPGA licenses this file to you
# under the NetFPGA Hardware-Software License, Version 1.0 (the "License"); you
# may not use this file except in compliance with the License.  You may obtain
# a copy of the License at:
#
#   http://www.netfpga-cic.org
#
# Unless required by applicable law or agreed to in writing, Work distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations under the License.
#
# @NETFPGA_LICENSE_HEADER_END@

## Timing Constraints
create_clock -period 3.103 -name rxusrclkout0 [get_pins -hier -filter name=~*interface_0*gthe2_i/RXOUTCLK]
create_clock -period 3.103 -name txusrclkout0 [get_pins -hier -filter name=~*interface_0*gthe2_i/TXOUTCLK]
create_clock -period 3.103 -name rxusrclkout1 [get_pins -hier -filter name=~*interface_1*gthe2_i/RXOUTCLK]
create_clock -period 3.103 -name txusrclkout1 [get_pins -hier -filter name=~*interface_1*gthe2_i/TXOUTCLK]
create_clock -period 3.103 -name rxusrclkout2 [get_pins -hier -filter name=~*interface_2*gthe2_i/RXOUTCLK]
create_clock -period 3.103 -name txusrclkout2 [get_pins -hier -filter name=~*interface_2*gthe2_i/TXOUTCLK]
create_clock -period 3.103 -name rxusrclkout3 [get_pins -hier -filter name=~*interface_3*gthe2_i/RXOUTCLK]
create_clock -period 3.103 -name txusrclkout3 [get_pins -hier -filter name=~*interface_3*gthe2_i/TXOUTCLK]

#create_clock -period 6.400 -name clk156 [get_pins -hier -filter name=~*shared*clk156_bufg_inst/O]
#create_clock -period 6.400 -name xge_refclk [get_pins -hier -filter name=~*sfp_buf/IBUF_OUT*]

#set_clock_groups -name async_sys_xgemac -asynchronous -group [get_clocks sys_clk_ref] -group [get_clocks clk156]
#set_clock_groups -name async_rxusrclk_xgemac -asynchronous -group [get_clocks rxusrclkout?] -group [get_clocks clk156]
#set_clock_groups -name async_txusrclk_xgemac -asynchronous -group [get_clocks txusrclkout?] -group [get_clocks clk156]
#set_clock_groups -name async_txusrclk_xgemac -asynchronous -group [get_clocks txusrclkout?] -group [get_clocks -include_generated_clocks xge_refclk]

set_false_path -from [get_clocks clk_out1_system_sys_clock_0_0] -to [get_clocks xgemac_clk_156]
set_false_path -from [get_clocks xgemac_clk_156] -to [get_clocks clk_out1_system_sys_clock_0_0]

set_false_path -from [get_clocks clk_out2_system_sys_clock_0_0] -to [get_clocks xgemac_clk_156]
set_false_path -from [get_clocks xgemac_clk_156] -to [get_clocks clk_out2_system_sys_clock_0_0]

set_false_path -from [get_clocks clk_out1_system_sys_clock_0_0] -to [get_clocks clk_out2_system_sys_clock_0_0]
set_false_path -from [get_clocks clk_out2_system_sys_clock_0_0] -to [get_clocks clk_out1_system_sys_clock_0_0]

set_false_path -from [get_clocks rxusrclkout?] -to [get_clocks xgemac_clk_156]
set_false_path -from [get_clocks xgemac_clk_156] -to [get_clocks rxusrclkout?]

set_false_path -from [get_clocks txusrclkout?] -to [get_clocks xgemac_clk_156]
set_false_path -from [get_clocks xgemac_clk_156] -to [get_clocks txusrclkout?]

set_false_path -from [get_ports reset]

set_false_path -from [get_ports pcie_sys_resetn]

set_false_path -from [get_clocks userclk1] -to [get_clocks clk_out1_system_sys_clock_0_0]
set_false_path -from [get_clocks clk_out1_system_sys_clock_0_0] -to [get_clocks userclk1]

set_false_path -from [get_clocks userclk1] -to [get_clocks pcie_sys_clk]
set_false_path -from [get_clocks pcie_sys_clk] -to [get_clocks userclk1]

set_false_path -from [get_clocks userclk1] -to [get_clocks xgemac_clk_156]
set_false_path -from [get_clocks xgemac_clk_156] -to [get_clocks userclk1]

set_false_path -from [get_clocks userclk1] -to [get_clocks clk_out1_system_sys_clock_0_0]
set_false_path -from [get_clocks clk_out1_system_sys_clock_0_0] -to [get_clocks userclk1]

set_false_path -from [get_clocks userclk1] -to [get_clocks clk_out2_system_sys_clock_0_0]
set_false_path -from [get_clocks clk_out2_system_sys_clock_0_0] -to [get_clocks userclk1]

