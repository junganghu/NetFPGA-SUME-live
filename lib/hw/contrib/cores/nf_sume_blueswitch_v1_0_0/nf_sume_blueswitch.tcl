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
set   design         nf_sume_blueswitch
set   ip_taxonomy    BlueSwitch

set   device         xc7vx690t-3-ffg1761
set   proj_dir       ip_proj

# Project setting.
create_project -name ${design} -force -dir "./${proj_dir}" -part ${device} -ip

set_property source_mgmt_mode All [current_project]  
set_property top ${design} [current_fileset]

# IP build.
read_verilog "./hdl/verilog/nf_sume_blueswitch.v"
read_verilog "./hdl/verilog/nf_sume_blueswitch_register_define.v"
read_verilog "./hdl/verilog/nf_sume_blueswitch_parameter_define.v"

read_verilog "./hdl/verilog/blueswitch_top.v"
read_verilog "./hdl/verilog/blueswitch_data_processor.v"
read_verilog "./hdl/verilog/timestamp_pad_proc.v"
read_verilog "./hdl/verilog/fifo_depth_monitor.v"
read_verilog "./hdl/verilog/packet_header_parser.v"
read_verilog "./hdl/verilog/checksum_processor.v"
read_verilog "./hdl/verilog/data_processor_controller.v"
read_verilog "./hdl/verilog/stream_update_processor.v"
read_verilog "./hdl/verilog/packet_data_marshaller.v"
read_verilog "./hdl/verilog/blueswitch_flow_table_processor.v"
read_verilog "./hdl/verilog/flow_table_processor_controller.v"
read_verilog "./hdl/verilog/input_header_arbiter.v"
read_verilog "./hdl/verilog/output_action_arbiter.v"
read_verilog "./hdl/verilog/flow_table_processor.v"
read_verilog "./hdl/verilog/flow_table.v"
read_verilog "./hdl/verilog/tcam_table_double.v"
read_verilog "./hdl/verilog/tcam_module.v"
read_verilog "./hdl/verilog/tcam_multi_module.v"
read_verilog "./hdl/verilog/tcam_rtl.v"
read_verilog "./hdl/verilog/action_table_double.v"
read_verilog "./hdl/verilog/bram_mem_true_dual.v"
read_verilog "./hdl/verilog/bram_mem.v"
read_verilog "./hdl/verilog/tcam.v"
read_verilog "./hdl/verilog/tcam_wrapper.v"

# From Xilinx TCAM IPs
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_control.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_decoder.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_init_file_pack_xst.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_input_ternary_ternenc.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_input_ternary.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_input.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_match_enc.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_mem_blk_extdepth_prim.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_mem_blk_extdepth.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_mem_blk.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_mem_srl16_block.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_mem_srl16_block_word.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_mem_srl16_ternwrcomp.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_mem_srl16.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_mem_srl16_wrcomp.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_mem.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_pkg.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_regouts.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_rtl.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/cam_top.vhd"
read_vhdl "./xapp1151_cam_v1_1/src/vhdl/dmem.vhd"

read_verilog "../../../std/cores/fallthrough_small_fifo_v1_0_0/hdl/fallthrough_small_fifo.v"
read_verilog "../../../std/cores/fallthrough_small_fifo_v1_0_0/hdl/small_fifo.v"

# From Xilinx IPs
read_vhdl "./hdl/vhdl/axi_lite_ipif_1bar.vhd"
read_vhdl "./hdl/xilinx/axi_lite_ipif.vhd"
read_vhdl "./hdl/xilinx/ipif_pkg.vhd"
read_vhdl "./hdl/xilinx/pselect_f.vhd"
read_vhdl "./hdl/xilinx/slave_attachment.vhd"
read_vhdl "./hdl/xilinx/address_decoder.vhd"

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

ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces S_AXI -of_objects [ipx::current_core]]
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

