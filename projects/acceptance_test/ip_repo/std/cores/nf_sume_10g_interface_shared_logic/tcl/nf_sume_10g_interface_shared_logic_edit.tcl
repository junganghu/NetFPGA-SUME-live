################################################################################
#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# All rights reserved.
#
# File:
# nf_sume_10g_shared_logic_edit.tcl
#
# Library: 
#        hw/std/nf_sume_10g_shared_logic
#
# Author:
# Tinghui Wang (Steve)
#
# Description:
# This script is used to generate an IP Packager project for nf_sume_10g_shared_logic project
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

### Change Design Settings Here ###
set device 				{xc7vx690tffg1761-3}
set ipname				{nf_sume_10g_interface_shared_logic}

# Create Project in Memory
set mem_proj [create_project -in_memory -part $device]

# Create IP Edit Project
set ip_proj [ipx::edit_ip_in_project -name nf_sume_10g_interface_shared_logic_project -directory ./nf_sume_10g_interface_shared_logic_project ./component.xml]
ipx::open_ipxact_file ./component.xml

# Close mem_proj window
current_project $mem_proj
close_project

# Switch back to IP Editor
current_project $ip_proj

