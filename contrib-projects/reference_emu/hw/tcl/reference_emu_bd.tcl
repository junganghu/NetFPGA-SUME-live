#
# Copyright (c) 2015 University of Cambridge
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
set design reference_emu 
set device xc7vx690t-3-ffg1761
set proj_dir ./project

set public_repo_dir $::env(SUME_FOLDER)/lib/hw/
set xilinx_repo_dir $::env(XILINX_PATH)/data/ip/xilinx/
set repo_dir ./ip_repo

set project_constraints ./constraints/nf_sume_general_bd.xdc
set nf_10g_constraints ./constraints/nf_sume_10g_bd.xdc

#####################################
# Read IP Addresses and export registers
#####################################
source ./tcl/reference_emu_defines.tcl
source ./tcl/export_registers.tcl

create_project -name ${design} -force -dir "./${proj_dir}" -part ${device}
set_property source_mgmt_mode DisplayOnly [current_project]

file copy ${public_repo_dir}/ ${repo_dir}
set_property ip_repo_paths ${repo_dir} [current_fileset]

update_ip_catalog

source ./create_ip/nf_10ge_interface.tcl
create_ip -name nf_10ge_interface -vendor NetFPGA -library NetFPGA -module_name nf_10g_interface_ip
set_property generate_synth_checkpoint false [get_files nf_10g_interface_ip.xci]
reset_target all [get_ips nf_10g_interface_ip]
generate_target all [get_ips nf_10g_interface_ip]

source ./create_ip/nf_10ge_interface_shared.tcl
create_ip -name nf_10ge_interface_shared -vendor NetFPGA -library NetFPGA -module_name nf_10g_interface_shared_ip
set_property generate_synth_checkpoint false [get_files nf_10g_interface_shared_ip.xci]
reset_target all [get_ips nf_10g_interface_shared_ip]
generate_target all [get_ips nf_10g_interface_shared_ip]

create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.2 -module_name identifier_ip
set_property -dict [list CONFIG.Interface_Type {AXI4} CONFIG.AXI_Type {AXI4_Lite} CONFIG.AXI_Slave_Type {Memory_Slave} CONFIG.Use_AXI_ID {false} CONFIG.Load_Init_File {true} CONFIG.Coe_File {/../../../../../../create_ip/id_rom16x32.coe} CONFIG.Fill_Remaining_Memory_Locations {true} CONFIG.Remaining_Memory_Locations {DEADDEAD} CONFIG.Memory_Type {Simple_Dual_Port_RAM} CONFIG.Use_Byte_Write_Enable {true} CONFIG.Byte_Size {8} CONFIG.Assume_Synchronous_Clk {true} CONFIG.Write_Width_A {32} CONFIG.Write_Depth_A {4096} CONFIG.Read_Width_A {32} CONFIG.Operating_Mode_A {READ_FIRST} CONFIG.Write_Width_B {32} CONFIG.Read_Width_B {32} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Use_ENB_Pin} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Use_RSTB_Pin {true} CONFIG.Reset_Type {ASYNC} CONFIG.Port_A_Write_Rate {50} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100}] [get_ips identifier_ip]
set_property generate_synth_checkpoint false [get_files identifier_ip.xci]
reset_target all [get_ips identifier_ip]
generate_target all [get_ips identifier_ip]

create_bd_design ${design}

add_files -fileset constrs_1 -norecurse ${project_constraints} ${nf_10g_constraints}
import_files -fileset constrs_1 ${project_constraints} ${nf_10g_constraints}

create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:nf_identifier:1.00 nf_identifier_0

# System clock buffer.
create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.0 sysclk_buf

# System clock generator, clock1 for bus registers, clock2 for axi-stream data path.
create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.1 sys_clock_0
set_property -dict [list CONFIG.PRIM_IN_FREQ {200.000}] [get_bd_cells sys_clock_0]
set_property -dict [list CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {100.000}] [get_bd_cells sys_clock_0]
set_property -dict [list CONFIG.CLKOUT2_USED {true} ] [get_bd_cells sys_clock_0]
set_property -dict [list CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {100.000}] [get_bd_cells sys_clock_0]

# fpga system reset generator.
create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic_0
set_property -dict [list CONFIG.C_GPO_WIDTH {2}] [get_bd_cells axi_iic_0]
set_property -dict [list CONFIG.C_SCL_INERTIAL_DELAY {5}] [get_bd_cells axi_iic_0]
set_property -dict [list CONFIG.C_SDA_INERTIAL_DELAY {5}] [get_bd_cells axi_iic_0]

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0
set_property -dict [list CONFIG.C_BAUDRATE {115200}] [get_bd_cells axi_uartlite_0]

create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:input_arbiter:1.00 input_arbiter_0
#create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:nf_endianess_manager:1.00 endianess_manager_0
create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:emu_output_port_lookup:1.00 emu_output_port_lookup_0
create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:output_queues:1.00 output_queues_0

create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:nf_10ge_interface_shared:1.00 nf_10g_interface_0
create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:nf_10ge_interface:1.00 nf_10g_interface_1
create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:nf_10ge_interface:1.00 nf_10g_interface_2
create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:nf_10ge_interface:1.00 nf_10g_interface_3

source tcl/bd_nf_sume_dma_engine.tcl
create_hier_cell_nf_sume_dma_engine [current_bd_instance .] nf_sume_dma 256

source ./tcl/bd_nf_sume_mbsys.tcl
create_hier_cell_mbsys [current_bd_instance .] mbsys

create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0
set_property -dict [list CONFIG.NUM_SI {2} CONFIG.NUM_MI {12}] [get_bd_cells axi_interconnect_0]

# Create external ports and make connection
source ./tcl/reference_emu_bd_port.tcl
source ./tcl/reference_emu_bd_connection.tcl

# Bus register map address configuration
create_bd_addr_seg -range ${MICROBLAZE_DLMB_BRAM_SIZEADDR} -offset ${MICROBLAZE_DLMB_BRAM_BASEADDR} [get_bd_addr_spaces mbsys/microblaze_0/Data] \
   [get_bd_addr_segs mbsys/microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
create_bd_addr_seg -range ${MICROBLAZE_ILMB_BRAM_SIZEADDR} -offset ${MICROBLAZE_ILMB_BRAM_BASEADDR} [get_bd_addr_spaces mbsys/microblaze_0/Instruction] \
   [get_bd_addr_segs mbsys/microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
create_bd_addr_seg -range ${MICROBLAZE_AXI_INTC_SIZEADDR} -offset ${MICROBLAZE_AXI_INTC_BASEADDR} [get_bd_addr_spaces mbsys/microblaze_0/Data] \
   [get_bd_addr_segs mbsys/microblaze_0_axi_intc/s_axi/Reg] SEG_microblaze_0_axi_intc_Reg

create_bd_addr_seg -range ${MICROBLAZE_AXI_IIC_SIZEADDR} -offset ${MICROBLAZE_AXI_IIC_BASEADDR} [get_bd_addr_spaces mbsys/microblaze_0/Data] \
   [get_bd_addr_segs axi_iic_0/S_AXI/Reg] SEG_axi_iic_0_Reg
create_bd_addr_seg -range ${MICROBLAZE_UARTLITE_SIZEADDR} -offset ${MICROBLAZE_UARTLITE_BASEADDR} [get_bd_addr_spaces mbsys/microblaze_0/Data] \
   [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg

create_bd_addr_seg -range ${MICROBLAZE_AXI_IIC_SIZEADDR} -offset ${MICROBLAZE_AXI_IIC_BASEADDR} [get_bd_addr_spaces nf_sume_dma/nf_riffa_dma_0/m_axi_lite] \
   [get_bd_addr_segs axi_iic_0/S_AXI/Reg] SEG_axi_iic_0_Reg
create_bd_addr_seg -range ${MICROBLAZE_UARTLITE_SIZEADDR} -offset ${MICROBLAZE_UARTLITE_BASEADDR} [get_bd_addr_spaces nf_sume_dma/nf_riffa_dma_0/m_axi_lite] \
   [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg


create_bd_addr_seg -range ${INPUT_ARBITER_SIZEADDR} -offset ${INPUT_ARBITER_BASEADDR} [get_bd_addr_spaces mbsys/microblaze_0/Data] \
   [get_bd_addr_segs input_arbiter_0/S_AXI/reg0] SEG_input_arbiter_0_reg0
create_bd_addr_seg -range ${INPUT_ARBITER_SIZEADDR} -offset ${INPUT_ARBITER_BASEADDR} [get_bd_addr_spaces nf_sume_dma/nf_riffa_dma_0/m_axi_lite] \
   [get_bd_addr_segs input_arbiter_0/S_AXI/reg0] SEG_input_arbiter_0_reg0

create_bd_addr_seg -range ${OUTPUT_PORT_LOOKUP_SIZEADDR} -offset ${OUTPUT_PORT_LOOKUP_BASEADDR} [get_bd_addr_spaces mbsys/microblaze_0/Data] \
   [get_bd_addr_segs emu_output_port_lookup_0/S_AXI/reg0] SEG_emu_output_port_lookup_0_reg0
create_bd_addr_seg -range ${OUTPUT_PORT_LOOKUP_SIZEADDR} -offset ${OUTPUT_PORT_LOOKUP_BASEADDR} [get_bd_addr_spaces nf_sume_dma/nf_riffa_dma_0/m_axi_lite] \
   [get_bd_addr_segs emu_output_port_lookup_0/S_AXI/reg0] SEG_emu_output_port_lookup_0_reg0

create_bd_addr_seg -range ${OUTPUT_QUEUES_SIZEADDR} -offset ${OUTPUT_QUEUES_BASEADDR} [get_bd_addr_spaces mbsys/microblaze_0/Data] \
   [get_bd_addr_segs output_queues_0/S_AXI/reg0] SEG_output_queues_0_reg0
create_bd_addr_seg -range ${OUTPUT_QUEUES_SIZEADDR} -offset ${OUTPUT_QUEUES_BASEADDR} [get_bd_addr_spaces nf_sume_dma/nf_riffa_dma_0/m_axi_lite] \
   [get_bd_addr_segs output_queues_0/S_AXI/reg0] SEG_output_queues_0_reg0

create_bd_addr_seg -range ${NF_10G_INTERFACE0_SIZEADDR} -offset ${NF_10G_INTERFACE0_BASEADDR} [get_bd_addr_spaces mbsys/microblaze_0/Data] \
   [get_bd_addr_segs nf_10g_interface_0/S_AXI/reg0] SEG_nf_10g_interface_0_reg0
create_bd_addr_seg -range ${NF_10G_INTERFACE0_SIZEADDR} -offset ${NF_10G_INTERFACE0_BASEADDR} [get_bd_addr_spaces nf_sume_dma/nf_riffa_dma_0/m_axi_lite] \
   [get_bd_addr_segs nf_10g_interface_0/S_AXI/reg0] SEG_nf_10g_interface_0_reg0

create_bd_addr_seg -range ${NF_10G_INTERFACE1_SIZEADDR} -offset ${NF_10G_INTERFACE1_BASEADDR} [get_bd_addr_spaces mbsys/microblaze_0/Data] \
   [get_bd_addr_segs nf_10g_interface_1/S_AXI/reg0] SEG_nf_10g_interface_1_reg0
create_bd_addr_seg -range ${NF_10G_INTERFACE1_SIZEADDR} -offset ${NF_10G_INTERFACE1_BASEADDR} [get_bd_addr_spaces nf_sume_dma/nf_riffa_dma_0/m_axi_lite] \
   [get_bd_addr_segs nf_10g_interface_1/S_AXI/reg0] SEG_nf_10g_interface_1_reg0

create_bd_addr_seg -range ${NF_10G_INTERFACE2_SIZEADDR} -offset ${NF_10G_INTERFACE2_BASEADDR} [get_bd_addr_spaces mbsys/microblaze_0/Data] \
   [get_bd_addr_segs nf_10g_interface_2/S_AXI/reg0] SEG_nf_10g_interface_2_reg0
create_bd_addr_seg -range ${NF_10G_INTERFACE2_SIZEADDR} -offset ${NF_10G_INTERFACE2_BASEADDR} [get_bd_addr_spaces nf_sume_dma/nf_riffa_dma_0/m_axi_lite] \
   [get_bd_addr_segs nf_10g_interface_2/S_AXI/reg0] SEG_nf_10g_interface_2_reg0

create_bd_addr_seg -range ${NF_10G_INTERFACE3_SIZEADDR} -offset ${NF_10G_INTERFACE3_BASEADDR} [get_bd_addr_spaces mbsys/microblaze_0/Data] \
   [get_bd_addr_segs nf_10g_interface_3/S_AXI/reg0] SEG_nf_10g_interface_3_reg0
create_bd_addr_seg -range ${NF_10G_INTERFACE3_SIZEADDR} -offset ${NF_10G_INTERFACE3_BASEADDR} [get_bd_addr_spaces nf_sume_dma/nf_riffa_dma_0/m_axi_lite] \
   [get_bd_addr_segs nf_10g_interface_3/S_AXI/reg0] SEG_nf_10g_interface_3_reg0

create_bd_addr_seg -range ${NF_RIFFA_DMA_SIZEADDR} -offset ${NF_RIFFA_DMA_BASEADDR} [get_bd_addr_spaces mbsys/microblaze_0/Data] \
   [get_bd_addr_segs nf_sume_dma/nf_riffa_dma_0/s_axi_lite/reg0] SEG_nf_riffa_dma_0_reg0
create_bd_addr_seg -range ${NF_RIFFA_DMA_SIZEADDR} -offset ${NF_RIFFA_DMA_BASEADDR} [get_bd_addr_spaces nf_sume_dma/nf_riffa_dma_0/m_axi_lite] \
   [get_bd_addr_segs nf_sume_dma/nf_riffa_dma_0/s_axi_lite/reg0] SEG_nf_riffa_dma_0_reg0

create_bd_addr_seg -range ${IDENTIFIER_SIZEADDR} -offset ${IDENTIFIER_BASEADDR} [get_bd_addr_spaces mbsys/microblaze_0/Data] \
   [get_bd_addr_segs nf_identifier_0/S_AXI/reg0] SEG_nf_identifier_0_reg0
create_bd_addr_seg -range ${IDENTIFIER_SIZEADDR} -offset ${IDENTIFIER_BASEADDR} [get_bd_addr_spaces nf_sume_dma/nf_riffa_dma_0/m_axi_lite] \
   [get_bd_addr_segs nf_identifier_0/S_AXI/reg0] SEG_nf_identifier_0_reg0

current_bd_instance [current_bd_instance .]
save_bd_design

# Create system block
make_wrapper -files [get_files ./${proj_dir}/${design}.srcs/sources_1/bd/${design}/${design}.bd] -top
add_files -norecurse ./${proj_dir}/${design}.srcs/sources_1/bd/${design}/hdl/${design}_wrapper.v
set_property top ${design}_wrapper [current_fileset]

# These steps should in ip libraries. Will update for better bd based project.
create_ip_run [get_files ./${proj_dir}/${design}.srcs/sources_1/ip/axi_10g_ethernet_nonshared/axi_10g_ethernet_nonshared.xci]
launch_runs axi_10g_ethernet_nonshared_synth_1
wait_on_run axi_10g_ethernet_nonshared_synth_1
create_ip_run [get_files ./${proj_dir}/${design}.srcs/sources_1/ip/fifo_generator_status/fifo_generator_status.xci]
launch_runs fifo_generator_status_synth_1
wait_on_run fifo_generator_status_synth_1
create_ip_run [get_files ./${proj_dir}/${design}.srcs/sources_1/ip/inverter_0/inverter_0.xci]
launch_runs inverter_0_synth_1
wait_on_run inverter_0_synth_1
create_ip_run [get_files ./${proj_dir}/${design}.srcs/sources_1/ip/axi_10g_ethernet_shared/axi_10g_ethernet_shared.xci]
launch_runs axi_10g_ethernet_shared_synth_1
wait_on_run axi_10g_ethernet_shared_synth_1
###
create_ip_run [get_files ./${proj_dir}/${design}.srcs/sources_1/ip/fifo_generator_1_9/fifo_generator_1_9.xci]
launch_runs fifo_generator_1_9_synth_1
wait_on_run fifo_generator_1_9_synth_1

generate_target all [get_files ./${proj_dir}/${design}.srcs/sources_1/bd/${design}/${design}.bd]

#### Start synthesis and implementation
synth_design -rtl -name rtl_1
set_property BITSTREAM.GENERAL.COMPRESS TRUE [get_designs rtl_1]
save_constraints

set_property strategy Performance_Explore [get_runs impl_1]

launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
exit
