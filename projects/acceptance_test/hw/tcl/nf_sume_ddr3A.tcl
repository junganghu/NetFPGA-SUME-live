#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# All rights reserved.
#
# File:
# nf_sume_ddr3A.tcl
#
# Project:
# acceptance_test
#
# Author:
# Tinghui Wang (Steve)
#
# Description:
# Vivado TCL scripts to generate ddr3A acceptance_test project
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

set ip_name {nf_sume_ddr3A}
set ip_xml_abs_path "[pwd]/xml/${ip_name}.prj"

# Create Project in Memory
create_project -in_memory -part xc7vx690tffg1761-3

# Generate MIG IP Core
create_ip -name mig_7series -vendor xilinx.com -library ip -module_name ${ip_name}
set_property -dict [list\
	CONFIG.XML_INPUT_FILE $ip_xml_abs_path\
	CONFIG.RESET_BOARD_INTERFACE {Custom}\
	CONFIG.MIG_DONT_TOUCH_PARAM {Custom}\
	CONFIG.BOARD_MIG_PARAM {Custom}]\
[get_ips ${ip_name}]

# Create Example Design
open_example_project -force -in_process -dir project [get_ips ${ip_name}] 

# Create Microblaze block design
create_bd -iic true -uart true -add_ro 2

# Add Constraints
add_files -fileset constrs_1 -norecurse xdc/nf_sume_system_general.xdc
add_files -fileset constrs_1 -norecurse xdc/nf_sume_ddr3A.xdc

exit
