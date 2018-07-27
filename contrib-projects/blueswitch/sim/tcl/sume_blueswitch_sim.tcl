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
set design  system 
set device  xc7vx690t-3-ffg1761

# Build project.
create_project -name ${design} -force -dir ./proj_${design} -part ${device}
set_property ip_repo_paths  ../../../lib/hw [current_project]
update_ip_catalog

create_bd_design ${design}

create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:axis_sim_stim:1.00 axis_sim_stim_0
set_property -dict [list CONFIG.C_M_AXIS_DATA_WIDTH {64} CONFIG.input_file {./../../../../tv/packet_stim_rx_0.axi}] [get_bd_cells axis_sim_stim_0]

create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:axis_sim_stim:1.00 axis_sim_stim_1
set_property -dict [list CONFIG.C_M_AXIS_DATA_WIDTH {64} CONFIG.input_file {./../../../../tv/packet_stim_rx_1.axi}] [get_bd_cells axis_sim_stim_1]

create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:axis_sim_stim:1.00 axis_sim_stim_2
set_property -dict [list CONFIG.C_M_AXIS_DATA_WIDTH {64} CONFIG.input_file {./../../../../tv/packet_stim_rx_2.axi}] [get_bd_cells axis_sim_stim_2]

create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:axis_sim_stim:1.00 axis_sim_stim_3
set_property -dict [list CONFIG.C_M_AXIS_DATA_WIDTH {64} CONFIG.input_file {./../../../../tv/packet_stim_rx_3.axi}] [get_bd_cells axis_sim_stim_3]

create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:axis_sim_stim:1.00 axis_sim_stim_4
set_property -dict [list CONFIG.C_M_AXIS_DATA_WIDTH {64} CONFIG.input_file {./../../../../tv/packet_stim_rx_4.axi}] [get_bd_cells axis_sim_stim_4]

create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:axis_sim_record:1.00 axis_sim_record_0
set_property -dict [list CONFIG.C_S_AXIS_DATA_WIDTH {64}] [get_bd_cells axis_sim_record_0]

create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:axis_sim_record:1.00 axis_sim_record_1
set_property -dict [list CONFIG.C_S_AXIS_DATA_WIDTH {64}] [get_bd_cells axis_sim_record_1]

create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:axis_sim_record:1.00 axis_sim_record_2
set_property -dict [list CONFIG.C_S_AXIS_DATA_WIDTH {64}] [get_bd_cells axis_sim_record_2]

create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:axis_sim_record:1.00 axis_sim_record_3
set_property -dict [list CONFIG.C_S_AXIS_DATA_WIDTH {64}] [get_bd_cells axis_sim_record_3]

create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:axis_sim_record:1.00 axis_sim_record_4
set_property -dict [list CONFIG.C_S_AXIS_DATA_WIDTH {64}] [get_bd_cells axis_sim_record_4]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0
set_property -dict [list CONFIG.NUM_MI {1}] [get_bd_cells axi_interconnect_0]

create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:axi_sim_transactor:1.00 axi_sim_transactor_0
set_property -dict [list CONFIG.STIM_FILE {./../../../../tv/reg_stim.axi} CONFIG.EXPECT_FILE {./../../../../tv/reg_expect.axi} CONFIG.LOG_FILE {./../../../../tv/reg_stim.log}] [get_bd_cells axi_sim_transactor_0]

source ../hw/tcl/bd_nf_sume_blueswitch.tcl
create_hier_cell_nf_sume_blueswitch [current_bd_instance .] blueswitch_0 0x7fa00000 0x7fa0ffff


# Integration and connection.
create_bd_port -dir I -type clk axis_aclk
create_bd_port -dir I -type rst axis_rstn
create_bd_port -dir I -type clk axi_aclk
create_bd_port -dir I -type rst axi_rstn

connect_bd_intf_net [get_bd_intf_pins axi_sim_transactor_0/M_AXI] -boundary_type upper [get_bd_intf_pins axi_interconnect_0/S00_AXI]
connect_bd_intf_net [get_bd_intf_pins blueswitch_0/s_axi] -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M00_AXI]

connect_bd_net [get_bd_ports axis_aclk] [get_bd_pins axis_sim_stim_0/ACLK]
connect_bd_net [get_bd_ports axis_aclk] [get_bd_pins axis_sim_stim_1/ACLK]
connect_bd_net [get_bd_ports axis_aclk] [get_bd_pins axis_sim_stim_2/ACLK]
connect_bd_net [get_bd_ports axis_aclk] [get_bd_pins axis_sim_stim_3/ACLK]
connect_bd_net [get_bd_ports axis_aclk] [get_bd_pins axis_sim_stim_4/ACLK]
connect_bd_net [get_bd_ports axis_aclk] [get_bd_pins axis_sim_record_0/axi_aclk]
connect_bd_net [get_bd_ports axis_aclk] [get_bd_pins axis_sim_record_1/axi_aclk]
connect_bd_net [get_bd_ports axis_aclk] [get_bd_pins axis_sim_record_2/axi_aclk]
connect_bd_net [get_bd_ports axis_aclk] [get_bd_pins axis_sim_record_3/axi_aclk]
connect_bd_net [get_bd_ports axis_aclk] [get_bd_pins axis_sim_record_4/axi_aclk]

connect_bd_net [get_bd_ports axis_aclk] [get_bd_pins blueswitch_0/axis_aclk]

connect_bd_net [get_bd_ports axis_rstn] [get_bd_pins axis_sim_stim_0/ARESETN]
connect_bd_net [get_bd_ports axis_rstn] [get_bd_pins axis_sim_stim_1/ARESETN]
connect_bd_net [get_bd_ports axis_rstn] [get_bd_pins axis_sim_stim_2/ARESETN]
connect_bd_net [get_bd_ports axis_rstn] [get_bd_pins axis_sim_stim_3/ARESETN]
connect_bd_net [get_bd_ports axis_rstn] [get_bd_pins axis_sim_stim_4/ARESETN]
connect_bd_net [get_bd_ports axis_rstn] [get_bd_pins blueswitch_0/axis_aresetn]

connect_bd_net [get_bd_ports axi_aclk] [get_bd_pins axi_sim_transactor_0/AXI_ACLK]
connect_bd_net [get_bd_ports axi_aclk] [get_bd_pins blueswitch_0/s_axi_aclk]
connect_bd_net [get_bd_ports axi_aclk] [get_bd_pins axi_interconnect_0/ACLK]
connect_bd_net [get_bd_ports axi_aclk] [get_bd_pins axi_interconnect_0/S00_ACLK]
connect_bd_net [get_bd_ports axi_aclk] [get_bd_pins axi_interconnect_0/M00_ACLK]

connect_bd_net [get_bd_ports axi_rstn] [get_bd_pins axi_sim_transactor_0/axi_resetn]
connect_bd_net [get_bd_ports axi_rstn] [get_bd_pins blueswitch_0/s_axi_aresetn]
connect_bd_net [get_bd_ports axi_rstn] [get_bd_pins axi_interconnect_0/ARESETN]
connect_bd_net [get_bd_ports axi_rstn] [get_bd_pins axi_interconnect_0/S00_ARESETN]
connect_bd_net [get_bd_ports axi_rstn] [get_bd_pins axi_interconnect_0/M00_ARESETN]

connect_bd_intf_net [get_bd_intf_pins axis_sim_stim_0/M_AXIS] [get_bd_intf_pins blueswitch_0/s0_axis]
connect_bd_intf_net [get_bd_intf_pins axis_sim_stim_1/M_AXIS] [get_bd_intf_pins blueswitch_0/s1_axis]
connect_bd_intf_net [get_bd_intf_pins axis_sim_stim_2/M_AXIS] [get_bd_intf_pins blueswitch_0/s2_axis]
connect_bd_intf_net [get_bd_intf_pins axis_sim_stim_3/M_AXIS] [get_bd_intf_pins blueswitch_0/s3_axis]
connect_bd_intf_net [get_bd_intf_pins axis_sim_stim_4/M_AXIS] [get_bd_intf_pins blueswitch_0/s4_axis]

connect_bd_intf_net [get_bd_intf_pins axis_sim_record_0/s_axis] [get_bd_intf_pins blueswitch_0/m0_axis]
connect_bd_intf_net [get_bd_intf_pins axis_sim_record_1/s_axis] [get_bd_intf_pins blueswitch_0/m1_axis]
connect_bd_intf_net [get_bd_intf_pins axis_sim_record_2/s_axis] [get_bd_intf_pins blueswitch_0/m2_axis]
connect_bd_intf_net [get_bd_intf_pins axis_sim_record_3/s_axis] [get_bd_intf_pins blueswitch_0/m3_axis]
connect_bd_intf_net [get_bd_intf_pins axis_sim_record_4/s_axis] [get_bd_intf_pins blueswitch_0/m4_axis]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0
set_property -dict [list CONFIG.CONST_WIDTH {11} CONFIG.CONST_VAL {0}] [get_bd_cells xlconstant_0]
connect_bd_net [get_bd_pins xlconstant_0/dout] [get_bd_pins axis_sim_stim_0/counter]
connect_bd_net [get_bd_pins xlconstant_0/dout] [get_bd_pins axis_sim_stim_1/counter]
connect_bd_net [get_bd_pins xlconstant_0/dout] [get_bd_pins axis_sim_stim_2/counter]
connect_bd_net [get_bd_pins xlconstant_0/dout] [get_bd_pins axis_sim_stim_3/counter]
connect_bd_net [get_bd_pins xlconstant_0/dout] [get_bd_pins axis_sim_stim_4/counter]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1
set_property -dict [list CONFIG.CONST_WIDTH {1} CONFIG.CONST_VAL {0}] [get_bd_cells xlconstant_1]
connect_bd_net [get_bd_pins xlconstant_1/dout] [get_bd_pins axis_sim_stim_0/barrier_proceed]
connect_bd_net [get_bd_pins xlconstant_1/dout] [get_bd_pins axis_sim_stim_1/barrier_proceed]
connect_bd_net [get_bd_pins xlconstant_1/dout] [get_bd_pins axis_sim_stim_2/barrier_proceed]
connect_bd_net [get_bd_pins xlconstant_1/dout] [get_bd_pins axis_sim_stim_3/barrier_proceed]
connect_bd_net [get_bd_pins xlconstant_1/dout] [get_bd_pins axis_sim_stim_4/barrier_proceed]

assign_bd_address [get_bd_addr_segs {blueswitch_0/nf_sume_blueswitch_0/S_AXI/reg0 }]
set_property range 64K [get_bd_addr_segs {axi_sim_transactor_0/M_AXI/SEG_nf_sume_blueswitch_0_reg0}]
set_property offset 0x7FA00000 [get_bd_addr_segs {axi_sim_transactor_0/M_AXI/SEG_nf_sume_blueswitch_0_reg0}]

generate_target all [get_files ./proj_system/system.srcs/sources_1/bd/system/system.bd]
make_wrapper -files [get_files ./proj_system/system.srcs/sources_1/bd/system/system.bd] -top
import_files -force -norecurse ./proj_system/system.srcs/sources_1/bd/system/hdl/system_wrapper.v
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Update pre-defined testbench.
import_files -fileset sim_1 -norecurse ./lib/system_wrapper_tb.v
update_compile_order -fileset sim_1

set_property top system_wrapper_tb [get_filesets sim_1]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

#set_property target_simulator ModelSim [current_project]
launch_simulation -scripts_only

exit
