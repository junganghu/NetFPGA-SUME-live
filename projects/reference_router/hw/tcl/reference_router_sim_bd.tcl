#
# Copyright (c) 2015 University of Cambridge
# Modified by Salvator Galea
# All rights reserved.
#
# This software was developed by Stanford University and the University of Cambridge Computer Laboratory 
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
set design reference_router 
set device xc7vx690t-3-ffg1761
set proj_dir ./project

set public_repo_dir $::env(SUME_FOLDER)/lib/hw/
set xilinx_repo_dir $::env(XILINX_PATH)/data/ip/xilinx/
set repo_dir ./ip_repo

set sim_top top_tb_bd

set test_name [lindex $argv 0] 

#####################################
# Read IP Addresses and export registers
#####################################
source $::env(NF_DESIGN_DIR)/hw/tcl/reference_router_defines.tcl

create_project -name ${design} -force -dir "$::env(NF_DESIGN_DIR)/hw/${proj_dir}" -part ${device}

file copy ${public_repo_dir}/ ${repo_dir}
set_property ip_repo_paths ${repo_dir} [current_fileset]

update_ip_catalog

create_bd_design ${design}

# System clock generator, clock1 for bus registers, clock2 for axi-stream data path.
create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.3 sys_clock_0
set_property -dict [list CONFIG.PRIM_IN_FREQ {200.000}] [get_bd_cells sys_clock_0]
set_property -dict [list CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {100.000}] [get_bd_cells sys_clock_0]
set_property -dict [list CONFIG.CLKOUT2_USED {true} ] [get_bd_cells sys_clock_0]
set_property -dict [list CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {160.000}] [get_bd_cells sys_clock_0]

# Bug Vivado 2016.4 -- Workaround -- Start
# https://forums.xilinx.com/t5/Synthesis/Vivado-2016-3-Utility-Buffer-issue-Limiting-clock-on-100Mhz/td-p/736176
# System clock buffer.
startgroup
create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 CLK_IN_D
create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 sysclk_buf_0
# CONFIG.FREQ_HZ 500000000 <- random value
set_property CONFIG.FREQ_HZ 500000000 [get_bd_intf_ports CLK_IN_D]
endgroup

create_bd_net clk_in_d_0
create_bd_net ibuf_out_0
connect_bd_intf_net -intf_net clk_in_d_0 [get_bd_intf_ports CLK_IN_D] [get_bd_intf_pins sysclk_buf_0/CLK_IN_D] 
connect_bd_net -net ibuf_out_0 [get_bd_pins sysclk_buf_0/IBUF_OUT] [get_bd_pins sys_clock_0/clk_in1]

delete_bd_objs [get_bd_intf_nets clk_in_d_0] [get_bd_nets ibuf_out_0] [get_bd_cells sysclk_buf_0] 

startgroup
set_property CONFIG.FREQ_HZ 200000000 [get_bd_intf_ports CLK_IN_D]
create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 sysclk_buf
endgroup
connect_bd_intf_net [get_bd_intf_ports CLK_IN_D] [get_bd_intf_pins sysclk_buf/CLK_IN_D]
connect_bd_net [get_bd_pins sysclk_buf/IBUF_OUT] [get_bd_pins sys_clock_0/clk_in1]
# Bug Vivado 2016.4 -- Workaround -- End

# fpga system reset generator.
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0

# Data path
source $::env(NF_DESIGN_DIR)/hw/tcl/bd_nf_sume_datapath.tcl
create_hier_cell_nf_sume_datapath [current_bd_instance .] nf_sim_datapath 256 

# simulation interfaces (stim + rec)
source $::env(NF_DESIGN_DIR)/hw/tcl/bd_nf_sume_sim_interface.tcl
create_hier_cell_nf_sume_sim_interface [current_bd_instance .] nf_sim_interface_0 "nf_interface_0_stim.axi" "nf_interface_0_log.axi"
create_hier_cell_nf_sume_sim_interface [current_bd_instance .] nf_sim_interface_1 "nf_interface_1_stim.axi" "nf_interface_1_log.axi"
create_hier_cell_nf_sume_sim_interface [current_bd_instance .] nf_sim_interface_2 "nf_interface_2_stim.axi" "nf_interface_2_log.axi"
create_hier_cell_nf_sume_sim_interface [current_bd_instance .] nf_sim_interface_3 "nf_interface_3_stim.axi" "nf_interface_3_log.axi"

# simulation DMA (sim, rec, transactor)
source $::env(NF_DESIGN_DIR)/hw/tcl/bd_nf_sume_sim_dma.tcl 
create_hier_cell_nf_sume_sim_dma [current_bd_instance .] nf_sim_dma "dma_0_stim.axi" "dma_0_log.axi" "reg_stim.axi" "reg_expect.axi" "reg_stim.log"

# barrier
set barrier_ip [create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:barrier:1.00 barrier_ip]
# glue logic
set activity_stim_glogic [create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:barrier_gluelogic:1.00 activity_stim_glogic]
set activity_rec_glogic [create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:barrier_gluelogic:1.00 activity_rec_glogic]
set barrier_rec_glogic [create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:barrier_gluelogic:1.00 barrier_rec_glogic]

# axi_interconnect
set axi_interconnect_0 [create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0]
set_property -dict [list CONFIG.NUM_SI {1} CONFIG.NUM_MI {4}] $axi_interconnect_0


## Create external ports and make connection
source $::env(NF_DESIGN_DIR)/hw/tcl/reference_router_bd_port_sim.tcl
source $::env(NF_DESIGN_DIR)/hw/tcl/reference_router_bd_connection_sim.tcl

update_ip_catalog

# Bus register map address configuration
create_bd_addr_seg -range ${INPUT_ARBITER_SIZEADDR} -offset ${INPUT_ARBITER_BASEADDR} [get_bd_addr_spaces nf_sim_dma/axi_sim_transactor_ip/M_AXI] \
   [get_bd_addr_segs nf_sim_datapath/input_arbiter_0/S_AXI/reg0] SEG_input_arbiter_0_reg0

create_bd_addr_seg -range ${OUTPUT_PORT_LOOKUP_SIZEADDR} -offset ${OUTPUT_PORT_LOOKUP_BASEADDR} [get_bd_addr_spaces nf_sim_dma/axi_sim_transactor_ip/M_AXI] \
   [get_bd_addr_segs nf_sim_datapath/router_output_port_lookup_0/S_AXI/reg0] SEG_router_output_port_lookup_0_reg0

create_bd_addr_seg -range ${OUTPUT_QUEUES_SIZEADDR} -offset ${OUTPUT_QUEUES_BASEADDR} [get_bd_addr_spaces nf_sim_dma/axi_sim_transactor_ip/M_AXI] \
   [get_bd_addr_segs nf_sim_datapath/output_queues_0/S_AXI/reg0] SEG_output_queues_0_reg0


# Create system block
generate_target all [get_files $::env(NF_DESIGN_DIR)/hw/${proj_dir}/${design}.srcs/sources_1/bd/${design}/${design}.bd]
make_wrapper -files [get_files $::env(NF_DESIGN_DIR)/hw/${proj_dir}/${design}.srcs/sources_1/bd/${design}/${design}.bd] -top
add_files -norecurse $::env(NF_DESIGN_DIR)/hw/${proj_dir}/${design}.srcs/sources_1/bd/${design}/hdl/${design}_wrapper.v
set_property top ${design}_wrapper [current_fileset]

# Bug Vivado 2016.4 -- Workaround
# https://forums.xilinx.com/t5/Synthesis/Vivado-2016-3-Utility-Buffer-issue-Limiting-clock-on-100Mhz/td-p/736176
validate_bd_design
connect_bd_net [get_bd_ports fpga_sysclk_n] [get_bd_pins sysclk_buf/IBUF_DS_N]
connect_bd_net [get_bd_ports fpga_sysclk_p] [get_bd_pins sysclk_buf/IBUF_DS_P]

# clk and rst stimuli
read_verilog "$::env(NF_DESIGN_DIR)/hw/hdl/top_tb_bd.v"

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

set_property top ${sim_top} [get_filesets sim_1]
set_property include_dirs ${proj_dir} [get_filesets sim_1]
set_property simulator_language Mixed [current_project]
set_property verilog_define { {SIMULATION=1} } [get_filesets sim_1]
set_property -name xsim.more_options -value {-testplusarg TESTNAME=basic_test} -objects [get_filesets sim_1]
set_property runtime {} [get_filesets sim_1]
set_property target_simulator xsim [current_project]
set_property compxlib.compiled_library_dir {} [current_project]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

set output [exec python $::env(NF_DESIGN_DIR)/test/${test_name}/run.py]
puts $output

launch_xsim -simset sim_1 -mode behavioral
run 120us
