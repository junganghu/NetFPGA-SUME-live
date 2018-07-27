#
# Copyright (c) 2017 Yuta Tokusashi
# All rights reserved.
#
# This software was developed by
# Stanford University and the University of Cambridge Computer Laboratory
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
# Vivado Launch Script
#### Change design settings here #######
set design lcam_output_port_lookup
set top lcam_output_port_lookup
set device xc7vx690t-3-ffg1761
set proj_dir ./synth
set ip_version 1.00
set lib_name NetFPGA
#####################################
# set IP paths
#####################################

#####################################
# Project Settings
#####################################
create_project -name ${design} -force -dir "./${proj_dir}" -part ${device} -ip
set_property source_mgmt_mode All [current_project]  
set_property top ${top} [current_fileset]
set_property ip_repo_paths $::env(SUME_FOLDER)/lib/hw/  [current_fileset]
puts "Creating Output Port Lookup IP"
# Project Constraints
#####################################
# Project Structure & IP Build
#####################################

read_verilog "./hdl/verilog/small_fifo.v"
read_verilog "./hdl/verilog/fallthrough_small_fifo.v"
read_verilog "./hdl/verilog/output_port_lookup_cpu_regs_defines.v"
read_verilog "./hdl/verilog/output_port_lookup_cpu_regs.v"
read_verilog "./hdl/verilog/eth_parser.v"
read_verilog "./hdl/verilog/mac_cam_lut.v"
read_verilog "./hdl/verilog/ncams.v"
read_verilog "./hdl/verilog/switch_output_port_lookup.v"
read_verilog "./hdl/verilog/prio_enc.v"
read_verilog "./hdl/verilog/cam.v"
read_verilog "./hdl/verilog/cam_wrapper.v"
read_vhdl "./hdl/vhdl/cam/cam_control.vhd"
read_vhdl "./hdl/vhdl/cam/cam_decoder.vhd"
read_vhdl "./hdl/vhdl/cam/cam_init_file_pack_xst.vhd"
read_vhdl "./hdl/vhdl/cam/cam_input_ternary_ternenc.vhd"
read_vhdl "./hdl/vhdl/cam/cam_input_ternary.vhd"
read_vhdl "./hdl/vhdl/cam/cam_input.vhd"
read_vhdl "./hdl/vhdl/cam/cam_match_enc.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem_blk_extdepth_prim.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem_blk_extdepth.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem_blk.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem_srl16_block.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem_srl16_block_word.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem_srl16_ternwrcomp.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem_srl16.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem_srl16_wrcomp.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem.vhd"
read_vhdl "./hdl/vhdl/cam/cam_pkg.vhd"
read_vhdl "./hdl/vhdl/cam/cam_regouts.vhd"
read_vhdl "./hdl/vhdl/cam/cam_rtl.vhd"
read_vhdl "./hdl/vhdl/cam/cam_top.vhd"
read_vhdl "./hdl/vhdl/cam/dmem.vhd"

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
ipx::package_project

set_property name ${design} [ipx::current_core]
set_property library ${lib_name} [ipx::current_core]
set_property vendor_display_name {NetFPGA} [ipx::current_core]
set_property company_url {www.netfpga.org} [ipx::current_core]
set_property vendor {NetFPGA} [ipx::current_core]
set_property supported_families {{virtex7} {Production}} [ipx::current_core]
set_property taxonomy {{/NetFPGA/Generic}} [ipx::current_core]
set_property version ${ip_version} [ipx::current_core]
set_property display_name ${design} [ipx::current_core]
set_property description ${design} [ipx::current_core]

ipx::add_user_parameter {C_S_AXI_DATA_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_S_AXI_DATA_WIDTH [ipx::current_core]]
set_property display_name {C_S_AXI_DATA_WIDTH} [ipx::get_user_parameter C_S_AXI_DATA_WIDTH [ipx::current_core]]
set_property value {32} [ipx::get_user_parameter C_S_AXI_DATA_WIDTH [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter C_S_AXI_DATA_WIDTH [ipx::current_core]]

ipx::add_user_parameter {C_S_AXI_ADDR_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_S_AXI_ADDR_WIDTH [ipx::current_core]]
set_property display_name {C_S_AXI_ADDR_WIDTH} [ipx::get_user_parameter C_S_AXI_ADDR_WIDTH [ipx::current_core]]
set_property value {32} [ipx::get_user_parameter C_S_AXI_ADDR_WIDTH [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter C_S_AXI_ADDR_WIDTH [ipx::current_core]]

ipx::add_user_parameter {C_M_AXIS_DATA_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_M_AXIS_DATA_WIDTH [ipx::current_core]]
set_property display_name {C_M_AXIS_DATA_WIDTH} [ipx::get_user_parameter C_M_AXIS_DATA_WIDTH [ipx::current_core]]
set_property value {256} [ipx::get_user_parameter C_M_AXIS_DATA_WIDTH [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter C_M_AXIS_DATA_WIDTH [ipx::current_core]]

ipx::add_user_parameter {C_S_AXIS_DATA_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_S_AXIS_DATA_WIDTH [ipx::current_core]]
set_property display_name {C_S_AXIS_DATA_WIDTH} [ipx::get_user_parameter C_S_AXIS_DATA_WIDTH [ipx::current_core]]
set_property value {256} [ipx::get_user_parameter C_S_AXIS_DATA_WIDTH [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter C_S_AXIS_DATA_WIDTH [ipx::current_core]]
  
ipx::add_user_parameter {C_M_AXIS_TUSER_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_M_AXIS_TUSER_WIDTH [ipx::current_core]]
set_property display_name {C_M_AXIS_TUSER_WIDTH} [ipx::get_user_parameter C_M_AXIS_TUSER_WIDTH [ipx::current_core]]
set_property value {128} [ipx::get_user_parameter C_M_AXIS_TUSER_WIDTH [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter C_M_AXIS_TUSER_WIDTH [ipx::current_core]]

ipx::add_user_parameter {C_S_AXIS_TUSER_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_S_AXIS_TUSER_WIDTH [ipx::current_core]]
set_property display_name {C_S_AXIS_TUSER_WIDTH} [ipx::get_user_parameter C_S_AXIS_TUSER_WIDTH [ipx::current_core]]
set_property value {128} [ipx::get_user_parameter C_S_AXIS_TUSER_WIDTH [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter C_S_AXIS_TUSER_WIDTH [ipx::current_core]]

ipx::add_user_parameter {SRC_PORT_POS} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter SRC_PORT_POS [ipx::current_core]]
set_property display_name {SRC_PORT_POS} [ipx::get_user_parameter SRC_PORT_POS [ipx::current_core]]
set_property value {16} [ipx::get_user_parameter SRC_PORT_POS [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter SRC_PORT_POS [ipx::current_core]]

ipx::add_user_parameter {DST_PORT_POS} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter DST_PORT_POS [ipx::current_core]]
set_property display_name {SRC_PORT_POS} [ipx::get_user_parameter DST_PORT_POS [ipx::current_core]]
set_property value {24} [ipx::get_user_parameter DST_PORT_POS [ipx::current_core]]
set_property value_format {long} [ipx::get_user_parameter DST_PORT_POS [ipx::current_core]]

ipx::add_user_parameter {C_BASEADDR} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameter C_BASEADDR [ipx::current_core]]
set_property display_name {C_BASEADDR} [ipx::get_user_parameter C_BASEADDR [ipx::current_core]]
set_property value {0x00000000} [ipx::get_user_parameter C_BASEADDR [ipx::current_core]]
set_property value_format {bitstring} [ipx::get_user_parameter C_BASEADDR [ipx::current_core]]


ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces m_axis -of_objects [ipx::current_core]]
ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces s_axis -of_objects [ipx::current_core]]

ipx::infer_user_parameters [ipx::current_core]

ipx::check_integrity [ipx::current_core]
ipx::save_core [ipx::current_core]
update_ip_catalog
close_project

file delete -force ${proj_dir} 
