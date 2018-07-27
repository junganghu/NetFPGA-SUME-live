#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# Copyright (C) 2017 Salvator Galea
# All rights reserved.
#
# File:
# nf_sume_gpio.tcl
#
# Project:
# acceptance_test
#
# Author:
# Tinghui Wang (Steve)
# Modified by Salvator Galea
#
# Description:
# Vivado TCL script to generate gpio/sdcard test 
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

set project_name        {nf_sume_gpio_ex}
set device 				{xc7vx690tffg1761-3}
set ip_repo_path        {../../ip_repo}
set bd_name             {baseSys}

# Create project under project folder
if {![file isdirectory project]} {
	file mkdir project
}
cd project
create_project $project_name ./$project_name -part $device

# Set IP Repository
set_property ip_repo_paths ${ip_repo_path} [current_fileset]
update_ip_catalog -rebuild

# Create Microblaze System
create_bd -uart true -iic true
open_bd_design [get_files -regexp -nocase {.*\.bd}]

# Create clock frequency detector for all clock inputs
create_bd_cell -type ip -vlnv digilent:digilent:d_clkfreq_detector fmc_clk0_freqdetect
create_bd_cell -type ip -vlnv digilent:digilent:d_clkfreq_detector fmc_clk1_freqdetect
create_bd_cell -type ip -vlnv digilent:digilent:d_clkfreq_detector fmc_gbtclk0_freqdetect
create_bd_cell -type ip -vlnv digilent:digilent:d_clkfreq_detector fmc_gbtclk1_freqdetect
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/mbsys/microblaze_0 (Periph)" Clk "Auto" } [get_bd_intf_pins fmc_clk0_freqdetect/s_axi]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/mbsys/microblaze_0 (Periph)" Clk "Auto" } [get_bd_intf_pins fmc_clk1_freqdetect/s_axi]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/mbsys/microblaze_0 (Periph)" Clk "Auto" } [get_bd_intf_pins fmc_gbtclk0_freqdetect/s_axi]
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/mbsys/microblaze_0 (Periph)" Clk "Auto" } [get_bd_intf_pins fmc_gbtclk1_freqdetect/s_axi]
create_bd_port -dir I -from 0 -to 0 fmc_clk0_p
create_bd_port -dir I -from 0 -to 0 fmc_clk0_n
create_bd_port -dir I -from 0 -to 0 fmc_clk1_p
create_bd_port -dir I -from 0 -to 0 fmc_clk1_n
create_bd_port -dir I -from 0 -to 0 fmc_gbtclk0_p
create_bd_port -dir I -from 0 -to 0 fmc_gbtclk0_n
create_bd_port -dir I -from 0 -to 0 fmc_gbtclk1_p
create_bd_port -dir I -from 0 -to 0 fmc_gbtclk1_n
set fmc_clk0_ibuf [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf fmc_clk0_ibuf ]
set_property -dict [ list CONFIG.C_BUF_TYPE {IBUFDS}  ] $fmc_clk0_ibuf
set fmc_clk1_ibuf [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf fmc_clk1_ibuf ]
set_property -dict [ list CONFIG.C_BUF_TYPE {IBUFDS}  ] $fmc_clk1_ibuf
set fmc_gbtclk0_ibuf [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf fmc_gbtclk0_ibuf ]
set_property -dict [ list CONFIG.C_BUF_TYPE {IBUFDSGTE}  ] $fmc_gbtclk0_ibuf
set fmc_gbtclk1_ibuf [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf fmc_gbtclk1_ibuf ]
set_property -dict [ list CONFIG.C_BUF_TYPE {IBUFDSGTE}  ] $fmc_gbtclk1_ibuf
connect_bd_net -net fmc_gbtclk0_n [get_bd_ports fmc_gbtclk0_n] [get_bd_pins fmc_gbtclk0_ibuf/IBUF_DS_N]
connect_bd_net -net fmc_gbtclk0_p [get_bd_ports fmc_gbtclk0_p] [get_bd_pins fmc_gbtclk0_ibuf/IBUF_DS_P]
connect_bd_net -net fmc_gbtclk1_n [get_bd_ports fmc_gbtclk1_n] [get_bd_pins fmc_gbtclk1_ibuf/IBUF_DS_N]
connect_bd_net -net fmc_gbtclk1_p [get_bd_ports fmc_gbtclk1_p] [get_bd_pins fmc_gbtclk1_ibuf/IBUF_DS_P]
connect_bd_net -net fmc_clk0_n [get_bd_ports fmc_clk0_n] [get_bd_pins fmc_clk0_ibuf/IBUF_DS_N]
connect_bd_net -net fmc_clk0_p [get_bd_ports fmc_clk0_p] [get_bd_pins fmc_clk0_ibuf/IBUF_DS_P]
connect_bd_net -net fmc_clk1_n [get_bd_ports fmc_clk1_n] [get_bd_pins fmc_clk1_ibuf/IBUF_DS_N]
connect_bd_net -net fmc_clk1_p [get_bd_ports fmc_clk1_p] [get_bd_pins fmc_clk1_ibuf/IBUF_DS_P]
connect_bd_net -net fmc_clk0_ibuf_IBUF_OUT [get_bd_pins fmc_clk0_freqdetect/ref_clk] [get_bd_pins fmc_clk0_ibuf/IBUF_OUT]
connect_bd_net -net fmc_clk1_ibuf_IBUF_OUT [get_bd_pins fmc_clk1_freqdetect/ref_clk] [get_bd_pins fmc_clk1_ibuf/IBUF_OUT]
connect_bd_net -net fmc_gbtclk0_ibuf_IBUF_OUT [get_bd_pins fmc_gbtclk0_freqdetect/ref_clk] [get_bd_pins fmc_gbtclk0_ibuf/IBUF_OUT]
connect_bd_net -net fmc_gbtclk1_ibuf_IBUF_OUT [get_bd_pins fmc_gbtclk1_freqdetect/ref_clk] [get_bd_pins fmc_gbtclk1_ibuf/IBUF_OUT]

# Create GPIO Test Logic Core
create_bd_cell -type ip -vlnv digilent:digilent:nf_sume_gpio_test nf_sume_gpio_test
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/mbsys/microblaze_0 (Periph)" Clk "Auto" } [get_bd_intf_pins nf_sume_gpio_test/s_axi]
create_bd_port -dir IO -from 33 -to 0 fmc_la_odd
create_bd_port -dir IO -from 33 -to 0 fmc_la_even
create_bd_port -dir IO -from 3 -to 0 pmod_up
create_bd_port -dir IO -from 3 -to 0 pmod_down
create_bd_port -dir O -from 3 -to 0 pmod_up_dir
create_bd_port -dir O -from 3 -to 0 pmod_down_dir
create_bd_port -dir O pmod_oe
connect_bd_net [get_bd_pins /nf_sume_gpio_test/fmc_la_odd] [get_bd_ports fmc_la_odd]
connect_bd_net [get_bd_pins /nf_sume_gpio_test/fmc_la_even] [get_bd_ports fmc_la_even]
connect_bd_net [get_bd_pins /nf_sume_gpio_test/pmod_up] [get_bd_ports pmod_up]
connect_bd_net [get_bd_pins /nf_sume_gpio_test/pmod_down] [get_bd_ports pmod_down]
connect_bd_net [get_bd_pins /nf_sume_gpio_test/pmod_up_dir] [get_bd_ports pmod_up_dir]
connect_bd_net [get_bd_pins /nf_sume_gpio_test/pmod_down_dir] [get_bd_ports pmod_down_dir]
connect_bd_net [get_bd_pins /nf_sume_gpio_test/pmod_oe] [get_bd_ports pmod_oe]

# Create SD card controller core
create_bd_cell -type ip -vlnv digilent:digilent:d_sdctrl d_sdctrl
apply_bd_automation -rule xilinx.com:bd_rule:axi4 -config {Master "/mbsys/microblaze_0 (Periph)" Clk "Auto" } [get_bd_intf_pins d_sdctrl/s_axi]
create_bd_port -dir I sd_dat0_i
create_bd_port -dir I sd_dat1_i
create_bd_port -dir I sd_dat2_i
create_bd_port -dir I sd_dat3_i
create_bd_port -dir O sd_sck_o
create_bd_port -dir IO sd_cmd_io
connect_bd_net [get_bd_pins /d_sdctrl/sd_dat0_i] [get_bd_ports sd_dat0_i]
connect_bd_net [get_bd_pins /d_sdctrl/sd_dat1_i] [get_bd_ports sd_dat1_i]
connect_bd_net [get_bd_pins /d_sdctrl/sd_dat2_i] [get_bd_ports sd_dat2_i]
connect_bd_net [get_bd_pins /d_sdctrl/sd_dat3_i] [get_bd_ports sd_dat3_i]
connect_bd_net [get_bd_pins /d_sdctrl/sd_sck_o] [get_bd_ports sd_sck_o]
connect_bd_net [get_bd_pins /d_sdctrl/sd_cmd_io] [get_bd_ports sd_cmd_io]

# System Master Clock Input
# ---------------------------------------------------------------------------------------------------------------
# Bug Vivado 2016.4 -- Workaround -- Start
# https://forums.xilinx.com/t5/Synthesis/Vivado-2016-3-Utility-Buffer-issue-Limiting-clock-on-100Mhz/td-p/736176
# System clock buffer.
delete_bd_objs [get_bd_ports sysclk]
create_bd_port -dir I -from 0 -to 0 fpga_sysclk_p
create_bd_port -dir I -from 0 -to 0 fpga_sysclk_n

startgroup
set CLK_IN_D [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 CLK_IN_D ]
set_property -dict [ list CONFIG.FREQ_HZ {200000000} ] $CLK_IN_D

set fpga_sysclk_ibuf [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 fpga_sysclk_ibuf_0 ]

connect_bd_net -net fpga_sysclk_n [get_bd_ports fpga_sysclk_n] [get_bd_pins fpga_sysclk_ibuf_0/IBUF_DS_N]
connect_bd_net -net fpga_sysclk_p [get_bd_ports fpga_sysclk_p] [get_bd_pins fpga_sysclk_ibuf_0/IBUF_DS_P]
endgroup

create_bd_intf_net clk_in_d_0
connect_bd_intf_net -intf_net clk_in_d_0 [get_bd_intf_ports CLK_IN_D] [get_bd_intf_pins fpga_sysclk_ibuf_0/CLK_IN_D]

delete_bd_objs [get_bd_intf_nets clk_in_d_0] [get_bd_cells fpga_sysclk_ibuf_0]

startgroup
set_property -dict [ list CONFIG.FREQ_HZ {200000000} ] $CLK_IN_D
set fpga_sysclk_ibuf [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf fpga_sysclk_ibuf ]
set_property -dict [ list CONFIG.C_BUF_TYPE {IBUFDS} ] $fpga_sysclk_ibuf
endgroup

connect_bd_net [get_bd_pins fpga_sysclk_ibuf/IBUF_OUT] [get_bd_pins clk_wiz_1/clk_in1]
connect_bd_intf_net [get_bd_intf_ports CLK_IN_D] [get_bd_intf_pins fpga_sysclk_ibuf/CLK_IN_D]
validate_bd_design

delete_bd_obj [get_bd_intf_nets CLK_IN_D_1] [get_bd_intf_ports CLK_IN_D]

connect_bd_net -net fpga_sysclk_n [get_bd_ports fpga_sysclk_n] [get_bd_pins fpga_sysclk_ibuf/IBUF_DS_N]
connect_bd_net -net fpga_sysclk_p [get_bd_ports fpga_sysclk_p] [get_bd_pins fpga_sysclk_ibuf/IBUF_DS_P]
report_property -all [get_bd_intf_pins fpga_sysclk_ibuf/CLK_IN_D]
validate_bd_design
# Bug Vivado 2016.4 -- Workaround -- End
# ---------------------------------------------------------------------------------------------------------------

# Generate Top Wrapper
regenerate_bd_layout
save_bd_design
close_bd_design [current_bd_design]
make_wrapper -files [get_files -regexp -nocase {.*\.bd}] -top -import -force
add_files -fileset constrs_1 -norecurse ../xdc/nf_sume_system_general.xdc
add_files -fileset constrs_1 -norecurse ../xdc/nf_sume_gpio.xdc

# Update Compile Order
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

exit
