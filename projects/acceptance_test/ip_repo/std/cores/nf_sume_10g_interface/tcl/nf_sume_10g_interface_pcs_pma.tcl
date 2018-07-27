#  
# Copyright (c) 2015 Digilent Inc.
# All rights reserved.
#
# File:
# nf_sume_10g_interface_pcs_pma.tcl
#  
# Library:
# hw/std/cores/nf_sume_10g_interface
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

# Create NetFPGA-SUME 10G MAC Core using Xilinx Ten Gigabit Ethernet Mac IP Core
set ip_name "nf_sume_10g_interface_pcs_pma"

# Create Project
create_project -in_memory -part xc7vx690tffg1761-3
set nf_sume_10g_mac [\
	create_ip -name ten_gig_eth_pcs_pma\
              -vendor xilinx.com\
              -library ip\
              -module_name $ip_name\
              -dir .\
	]

set_property -dict [list \
	CONFIG.MDIO_Management {true}\
	CONFIG.base_kr {BASE-R}\
	CONFIG.TransceiverControl {false}\
	CONFIG.baser32 {64bit}\
] [get_ips $ip_name]

generate_target {synthesis} [get_ips $ip_name]
open_example_project -force -dir $ip_name/example_design [get_ips $ip_name]

