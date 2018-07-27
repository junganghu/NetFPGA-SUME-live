#
# Copyright (c) 2015 University of Cambridge 
# Modified by Salvator Galea
# All rights reserved.
#
# This software was developed by the University of Cambridge Computer
# Laboratory under EPSRC INTERNET Project EP/H040536/1, National Science
# Foundation under Grant No. CNS-0855268, and Defense Advanced Research
# Projects Agency (DARPA) and Air Force Research Laboratory (AFRL), under
# contract FA8750-11-C-0249.
#
# @NETFPGA_LICENSE_HEADER_START@
#
# Licensed to NetFPGA Open Systems C.I.C. (NetFPGA) under one or more
# contributor license agreements.  See the NOTICE file distributed with this
# work for additional information regarding copyright ownership.  NetFPGA
# licenses this file to you under the NetFPGA Hardware-Software License,
# Version 1.0 (the "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at:
#
#   http://www.netfpga-cic.org
#
# Unless required by applicable law or agreed to in writing, Work distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations under the License.
#
# @NETFPGA_LICENSE_HEADER_END@

# Set variables
set   lib_name       xilinx
set   ip_version     1.10
set   design         cam

set   device         xc7vx690t-3-ffg1761
set   proj_dir       ip_proj

# Project setting
create_project -name ${design} -force -dir "./${proj_dir}" -part ${device} -ip

set_property source_mgmt_mode All [current_project]  
set_property top ${design} [current_fileset]

# IP build
read_verilog "./hdl/verilog/cam.v"
read_verilog "./hdl/verilog/cam_wrapper.v"

read_vhdl "./hdl/vhdl/cam/cam_init_file_pack_xst.vhd"
read_vhdl "./hdl/vhdl/cam/cam_pkg.vhd"

read_vhdl "./hdl/vhdl/cam/cam_input_ternary_ternenc.vhd"
read_vhdl "./hdl/vhdl/cam/cam_input_ternary.vhd"
read_vhdl "./hdl/vhdl/cam/cam_input.vhd"
read_vhdl "./hdl/vhdl/cam/cam_control.vhd"
read_vhdl "./hdl/vhdl/cam/cam_decoder.vhd"
read_vhdl "./hdl/vhdl/cam/cam_match_enc.vhd"

read_vhdl "./hdl/vhdl/cam/cam_regouts.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem_srl16_ternwrcomp.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem_srl16_wrcomp.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem_srl16_block_word.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem_srl16_block.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem_srl16.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem_blk_extdepth_prim.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem_blk_extdepth.vhd"
read_vhdl "./hdl/vhdl/cam/dmem.vhd"
read_vhdl "./hdl/vhdl/cam/cam_mem_blk.vhd"

read_vhdl "./hdl/vhdl/cam/cam_mem.vhd"
read_vhdl "./hdl/vhdl/cam/cam_rtl.vhd"
read_vhdl "./hdl/vhdl/cam/cam_top.vhd"

update_compile_order -fileset sources_1

ipx::package_project

set_property name ${design} [ipx::current_core]
set_property library ${lib_name} [ipx::current_core]
set_property vendor_display_name {xilinx} [ipx::current_core]
set_property company_url {www.xilinx.com} [ipx::current_core]
set_property vendor {xilinx} [ipx::current_core]
set_property supported_families {{virtex7} {Production}} [ipx::current_core]
set_property taxonomy {{/NetFPGA/Generic}} [ipx::current_core]
set_property version ${ip_version} [ipx::current_core]
set_property display_name ${design} [ipx::current_core]
set_property description ${design} [ipx::current_core]

ipx::infer_user_parameters [ipx::current_core]
ipx::check_integrity [ipx::current_core]
ipx::save_core [ipx::current_core]

close_project
exit

