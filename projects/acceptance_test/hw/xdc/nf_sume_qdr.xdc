#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# All rights reserved.
#
# File:
# nf_sume_qdr.xdc
#
# Project:
# acceptance_test
#
# Author:
# Tinghui Wang (Steve)
#
# Description:
# Constraints for QDR Tests 
#
# @NETFPGA_LICENSE_HEADER_START@
#
# Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
# license agreements. See the NOTICE file distributed with this work for
# additional information regarding copyright ownership. NetFPGA licenses this
# file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
# "License"); you may not use this file except in compliance with the
# License. You may obtain a copy of the License at:
#
# http://www.netfpga-cic.org
#
# Unless required by applicable law or agreed to in writing, Work distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
#
# @NETFPGA_LICENSE_HEADER_END@
#

# PadFunction: IO_L13P_T2_MRCC_38 
set_property VCCAUX_IO DONTCARE [get_ports {clk_ref_p}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {clk_ref_p}]
set_property PACKAGE_PIN H19 [get_ports {clk_ref_p}]

# PadFunction: IO_L13N_T2_MRCC_38 
set_property VCCAUX_IO DONTCARE [get_ports {clk_ref_n}]
set_property IOSTANDARD DIFF_SSTL15 [get_ports {clk_ref_n}]
set_property PACKAGE_PIN G18 [get_ports {clk_ref_n}]

# reset - Btn0
set_property PACKAGE_PIN AR13 [get_ports sys_rst]
set_property IOSTANDARD LVCMOS15 [get_ports sys_rst]

# led0
set_property PACKAGE_PIN AR22 [get_ports led_error]
set_property IOSTANDARD LVCMOS15 [get_ports led_error]

# led1
set_property PACKAGE_PIN AR23 [get_ports led_init_done]
set_property IOSTANDARD LVCMOS15 [get_ports led_init_done]

# Timing Constraints
create_clock -period 5 [get_nets clk_ref_i]
#set_propagated_clock clk_ref_i
