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

# Set variables.
set   lib_name       NetFPGA-SUME-contrib
set   ip_version     1.00
set   design         nf_sume_crossbar
set   ip_taxonomy    Data-Path

set   device         xc7vx690t-3-ffg1761
set   proj_dir       ip_proj

# Project setting.
create_project -name ${design} -force -dir "./${proj_dir}" -part ${device} -ip

set_property source_mgmt_mode All [current_project]  
set_property top ${design} [current_fileset]

# IP build.
read_verilog "./hdl/verilog/nf_sume_crossbar.v"
read_verilog "./hdl/verilog/input_queues.v"
read_verilog "./hdl/verilog/output_queues.v"

read_verilog "../../../std/cores/fallthrough_small_fifo_v1_0_0/hdl/fallthrough_small_fifo.v"
read_verilog "../../../std/cores/fallthrough_small_fifo_v1_0_0/hdl/small_fifo.v"

update_compile_order -fileset sources_1

ipx::package_project

# Set ip descriptions
set_property vendor {NetFPGA} [ipx::current_core]
set_property library ${lib_name} [ipx::current_core]
set_property version ${ip_version} [ipx::current_core]
set_property display_name ${design}_${ip_version} [ipx::current_core]
set_property description ${design}_${ip_version} [ipx::current_core]
set_property taxonomy ${ip_taxonomy} [ipx::current_core]
set_property vendor_display_name {NetFPGA} [ipx::current_core]
set_property company_url {www.netfpga.org} [ipx::current_core]
set_property supported_families {{virtex7} {Production}} [ipx::current_core]

ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces m0_axis -of_objects [ipx::current_core]]
ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces m1_axis -of_objects [ipx::current_core]]
ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces m2_axis -of_objects [ipx::current_core]]
ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces m3_axis -of_objects [ipx::current_core]]
ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces m4_axis -of_objects [ipx::current_core]]
ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces s0_axis -of_objects [ipx::current_core]]
ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces s1_axis -of_objects [ipx::current_core]]
ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces s2_axis -of_objects [ipx::current_core]]
ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces s3_axis -of_objects [ipx::current_core]]
ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces s4_axis -of_objects [ipx::current_core]]

ipx::infer_user_parameters [ipx::current_core]
ipx::check_integrity [ipx::current_core]
ipx::save_core [ipx::current_core]

close_project
exit

