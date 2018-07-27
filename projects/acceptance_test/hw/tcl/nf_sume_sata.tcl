#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# All rights reserved.
#
# File:
# nf_sume_sata.tcl
#
# Project:
# acceptance_test
#
# Author:
# Tinghui Wang (Steve)
#
# Description:
# Vivado TCL scripts to generate SATA acceptance_test project
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

set ip_name {nf_sume_sata}

# Create Project in Memory
create_project -in_memory -part xc7vx690tffg1761-3

# Generate MIG IP Core
create_ip -name gtwizard -vendor xilinx.com -library ip -module_name ${ip_name}
set_property -dict [list\
	CONFIG.identical_val_tx_line_rate {6}\
	CONFIG.gt4_val {false}\
	CONFIG.gt24_val {true}\
	CONFIG.gt25_val {true}\
	CONFIG.gt24_val_tx_refclk {REFCLK0_Q6}\
	CONFIG.gt25_val_tx_refclk {REFCLK0_Q6}\
	CONFIG.gt24_val_rx_refclk {REFCLK0_Q6}\
	CONFIG.gt25_val_rx_refclk {REFCLK0_Q6}\
	CONFIG.identical_val_tx_reference_clock {150.000}\
	CONFIG.gt0_val_tx_data_width {16}\
	CONFIG.gt0_val_encoding {8B/10B}\
	CONFIG.gt0_val_rx_data_width {16}\
	CONFIG.gt0_val_decoding {8B/10B}\
	CONFIG.gt0_val_drp {false}\
	CONFIG.gt0_val_drp_clock {100}\
	CONFIG.gt0_val_sata_rx_burst_val {6}\
	CONFIG.gt0_val_sata_e_idle_val {6}\
	CONFIG.gt0_uselabtools {true}\
	CONFIG.identical_val_rx_line_rate {6}\
	CONFIG.identical_val_rx_reference_clock {150.000}\
	CONFIG.gt0_val_tx_line_rate {6}\
	CONFIG.gt0_val_tx_int_datawidth {20}\
	CONFIG.gt0_val_tx_reference_clock {150.000}\
	CONFIG.gt0_val_rx_line_rate {6}\
	CONFIG.gt0_val_rx_int_datawidth {20}\
	CONFIG.gt0_val_rx_reference_clock {150.000}\
	CONFIG.gt0_val_cpll_fbdiv {4}\
	CONFIG.gt0_val_cpll_rxout_div {1}\
	CONFIG.gt0_val_cpll_txout_div {1}\
	CONFIG.gt0_val_port_rxcharisk {true}\
	CONFIG.gt0_val_comma_preset {K28.5}\
	CONFIG.gt0_val_dfe_mode {LPM-Auto}\
	CONFIG.gt0_val_clk_cor_seq_1_1 {00000000}\
	CONFIG.gt0_val_clk_cor_seq_1_2 {00000000}\
	CONFIG.gt0_val_clk_cor_seq_1_3 {00000000}\
	CONFIG.gt0_val_clk_cor_seq_1_4 {00000000}\
	CONFIG.gt0_val_clk_cor_seq_2_1 {00000000}\
	CONFIG.gt0_val_clk_cor_seq_2_2 {00000000}\
	CONFIG.gt0_val_clk_cor_seq_2_3 {00000000}\
	CONFIG.gt0_val_clk_cor_seq_2_4 {00000000}\
] [get_ips ${ip_name}]


# Create Example Design
open_example_project -force -in_process -dir project [get_ips ${ip_name}] 

# Create Microblaze block design
create_bd -iic true -uart true -add_rw 1 -add_ro 1 -add_ro 8 -add_ro 8

# Add Constraints
add_files -fileset constrs_1 -norecurse xdc/nf_sume_system_general.xdc
add_files -fileset constrs_1 -norecurse xdc/nf_sume_sata.xdc

exit
