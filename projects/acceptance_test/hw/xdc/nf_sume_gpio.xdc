#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# All rights reserved.
#
# File:
# nf_sume_gpio.xdc
#
# Project:
# acceptance_test
#
# Author:
# Tinghui Wang (Steve)
#
# Description:
# Constraints for SD Card and GPIOs for FMC/Pmod Connectors
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

# PMOD Constraints
set_property PACKAGE_PIN C40 [get_ports pmod_oe]

set_property PACKAGE_PIN AW18 [get_ports pmod_up[0]]
set_property PACKAGE_PIN AW17 [get_ports pmod_up[1]]
set_property PACKAGE_PIN AU19 [get_ports pmod_up[2]]
set_property PACKAGE_PIN AV19 [get_ports pmod_up[3]]
set_property PACKAGE_PIN AT20 [get_ports pmod_down[0]]
set_property PACKAGE_PIN AT19 [get_ports pmod_down[1]]
set_property PACKAGE_PIN AV16 [get_ports pmod_down[2]]
set_property PACKAGE_PIN AW16 [get_ports pmod_down[3]]

set_property PACKAGE_PIN AT16 [get_ports pmod_up_dir[0]]
set_property PACKAGE_PIN AU16 [get_ports pmod_up_dir[1]]
set_property PACKAGE_PIN BB19 [get_ports pmod_up_dir[2]]
set_property PACKAGE_PIN AV20 [get_ports pmod_up_dir[3]]
set_property PACKAGE_PIN AW20 [get_ports pmod_down_dir[0]]
set_property PACKAGE_PIN BA17 [get_ports pmod_down_dir[1]]
set_property PACKAGE_PIN BB17 [get_ports pmod_down_dir[2]]
set_property PACKAGE_PIN AY20 [get_ports pmod_down_dir[3]]

# FMC LA Constraints (N first)
set_property PACKAGE_PIN AR28 [get_ports fmc_la_odd[0]]
set_property PACKAGE_PIN AP27 [get_ports fmc_la_odd[1]]
set_property PACKAGE_PIN BB27 [get_ports fmc_la_odd[2]]
set_property PACKAGE_PIN BB26 [get_ports fmc_la_odd[3]]
set_property PACKAGE_PIN AV26 [get_ports fmc_la_odd[4]]
set_property PACKAGE_PIN AV25 [get_ports fmc_la_odd[5]]
set_property PACKAGE_PIN AY28 [get_ports fmc_la_odd[6]]
set_property PACKAGE_PIN AY27 [get_ports fmc_la_odd[7]]
set_property PACKAGE_PIN AR25 [get_ports fmc_la_odd[8]]
set_property PACKAGE_PIN AP25 [get_ports fmc_la_odd[9]]
set_property PACKAGE_PIN AT26 [get_ports fmc_la_odd[10]]
set_property PACKAGE_PIN AT25 [get_ports fmc_la_odd[11]]
set_property PACKAGE_PIN AW28 [get_ports fmc_la_odd[12]]
set_property PACKAGE_PIN AW27 [get_ports fmc_la_odd[13]]
set_property PACKAGE_PIN AM27 [get_ports fmc_la_odd[14]]
set_property PACKAGE_PIN AM26 [get_ports fmc_la_odd[15]]
set_property PACKAGE_PIN AY33 [get_ports fmc_la_odd[16]]
set_property PACKAGE_PIN AY32 [get_ports fmc_la_odd[17]]
set_property PACKAGE_PIN AW31 [get_ports fmc_la_odd[18]]
set_property PACKAGE_PIN AV30 [get_ports fmc_la_odd[19]]
set_property PACKAGE_PIN BB31 [get_ports fmc_la_odd[20]]
set_property PACKAGE_PIN BA30 [get_ports fmc_la_odd[21]]
set_property PACKAGE_PIN BB34 [get_ports fmc_la_odd[22]]
set_property PACKAGE_PIN BA34 [get_ports fmc_la_odd[23]]
set_property PACKAGE_PIN AU33 [get_ports fmc_la_odd[24]]
set_property PACKAGE_PIN AT32 [get_ports fmc_la_odd[25]]
set_property PACKAGE_PIN AV31 [get_ports fmc_la_odd[26]]
set_property PACKAGE_PIN AU31 [get_ports fmc_la_odd[27]]
set_property PACKAGE_PIN BB36 [get_ports fmc_la_odd[28]]
set_property PACKAGE_PIN BA36 [get_ports fmc_la_odd[29]]
set_property PACKAGE_PIN AP30 [get_ports fmc_la_odd[30]]
set_property PACKAGE_PIN AN30 [get_ports fmc_la_odd[31]]
set_property PACKAGE_PIN AU36 [get_ports fmc_la_odd[32]]
set_property PACKAGE_PIN AT36 [get_ports fmc_la_odd[33]]

# FMC LA Constraints (N first)
set_property PACKAGE_PIN AV28 [get_ports fmc_la_even[0]]
set_property PACKAGE_PIN AU28 [get_ports fmc_la_even[1]]
set_property PACKAGE_PIN AT29 [get_ports fmc_la_even[2]]
set_property PACKAGE_PIN AR29 [get_ports fmc_la_even[3]]
set_property PACKAGE_PIN BB29 [get_ports fmc_la_even[4]]
set_property PACKAGE_PIN BB28 [get_ports fmc_la_even[5]]
set_property PACKAGE_PIN BA27 [get_ports fmc_la_even[6]]
set_property PACKAGE_PIN BA26 [get_ports fmc_la_even[7]]
set_property PACKAGE_PIN AP28 [get_ports fmc_la_even[8]]
set_property PACKAGE_PIN AN28 [get_ports fmc_la_even[9]]
set_property PACKAGE_PIN AW26 [get_ports fmc_la_even[10]]
set_property PACKAGE_PIN AW25 [get_ports fmc_la_even[11]]
set_property PACKAGE_PIN AV29 [get_ports fmc_la_even[12]]
set_property PACKAGE_PIN AU29 [get_ports fmc_la_even[13]]
set_property PACKAGE_PIN AN26 [get_ports fmc_la_even[14]]
set_property PACKAGE_PIN AN25 [get_ports fmc_la_even[15]]
set_property PACKAGE_PIN AL27 [get_ports fmc_la_even[16]]
set_property PACKAGE_PIN AK27 [get_ports fmc_la_even[17]]
set_property PACKAGE_PIN AV33 [get_ports fmc_la_even[18]]
set_property PACKAGE_PIN AU32 [get_ports fmc_la_even[19]]
set_property PACKAGE_PIN AY30 [get_ports fmc_la_even[20]]
set_property PACKAGE_PIN AW30 [get_ports fmc_la_even[21]]
set_property PACKAGE_PIN BA32 [get_ports fmc_la_even[22]]
set_property PACKAGE_PIN BA31 [get_ports fmc_la_even[23]]
set_property PACKAGE_PIN AU34 [get_ports fmc_la_even[24]]
set_property PACKAGE_PIN AT34 [get_ports fmc_la_even[25]]
set_property PACKAGE_PIN BB33 [get_ports fmc_la_even[26]]
set_property PACKAGE_PIN BB32 [get_ports fmc_la_even[27]]
set_property PACKAGE_PIN AT35 [get_ports fmc_la_even[28]]
set_property PACKAGE_PIN AR34 [get_ports fmc_la_even[29]]
set_property PACKAGE_PIN BA35 [get_ports fmc_la_even[30]]
set_property PACKAGE_PIN AY34 [get_ports fmc_la_even[31]]
set_property PACKAGE_PIN AW36 [get_ports fmc_la_even[32]]
set_property PACKAGE_PIN AV36 [get_ports fmc_la_even[33]]

# FMC IO Standards
set_property IOSTANDARD LVCMOS18 [get_ports fmc_la_even[*]]
set_property IOSTANDARD LVCMOS18 [get_ports fmc_la_odd[*]]

set_property IOSTANDARD LVCMOS15 [get_ports pmod_up[*]]
set_property IOSTANDARD LVCMOS15 [get_ports pmod_down[*]]
set_property IOSTANDARD LVCMOS15 [get_ports pmod_up_dir[*]]
set_property IOSTANDARD LVCMOS15 [get_ports pmod_down_dir[*]]
set_property IOSTANDARD LVCMOS15 [get_ports pmod_oe]


#set_property IOB TRUE [get_ports fmc_la_even[*]]
#set_property IOB TRUE [get_ports fmc_la_odd[*]]
#set_property IOB TRUE [get_ports pmod_up[*]]
#set_property IOB TRUE [get_ports pmod_down[*]]

# SD Card Constraints
set_property PACKAGE_PIN AJ26 [get_ports sd_cmd_io]
set_property IOSTANDARD LVCMOS18 [get_ports sd_cmd_io]
#set_property IOB TRUE [get_ports sd_cmd_io]

set_property PACKAGE_PIN AJ25 [get_ports sd_sck_o]
set_property IOSTANDARD LVCMOS18 [get_ports sd_sck_o]

set_property PACKAGE_PIN AY29 [get_ports sd_dat0_i]
set_property IOSTANDARD LVCMOS18 [get_ports sd_dat0_i]

set_property PACKAGE_PIN AM28 [get_ports sd_dat1_i]
set_property IOSTANDARD LVCMOS18 [get_ports sd_dat1_i]

set_property PACKAGE_PIN AL25 [get_ports sd_dat2_i]
set_property IOSTANDARD LVCMOS18 [get_ports sd_dat2_i]

set_property PACKAGE_PIN AL26 [get_ports sd_dat3_i]
set_property IOSTANDARD LVCMOS18 [get_ports sd_dat3_i]

# FMC-GBTCLK0 - 156.25MHz
set_property PACKAGE_PIN AT7 [get_ports {fmc_gbtclk0_n[0]}]
create_clock -period 6.400 -name fmc_gbtclk0 [get_ports fmc_gbtclk0_p]

# FMC-GBTCLK1 - 156.25MHz
set_property PACKAGE_PIN AU9 [get_ports {fmc_gbtclk1_n[0]}]
create_clock -period 6.400 -name fmc_gbtclk1 [get_ports fmc_gbtclk1_p]

# FMC-CLK0 - 120MHz
set_property PACKAGE_PIN AT27 [get_ports {fmc_clk0_n[0]}]
set_property IOSTANDARD LVDS [get_ports {fmc_clk0_p[0]}]
set_property IOSTANDARD LVDS [get_ports {fmc_clk0_n[0]}]
create_clock -period 6.400 -name fmc_clk0 [get_ports fmc_clk0_p]

# FMC-CLK1 - 120MHz
set_property PACKAGE_PIN AV35 [get_ports {fmc_clk1_n[0]}]
set_property IOSTANDARD LVDS [get_ports {fmc_clk1_p[0]}]
set_property IOSTANDARD LVDS [get_ports {fmc_clk1_n[0]}]
create_clock -period 6.400 -name fmc_clk1 -add [get_ports fmc_clk1_p]

# 200MHz System Clock
set_property PACKAGE_PIN G18 [get_ports fpga_sysclk_n]
set_property PACKAGE_PIN H19 [get_ports fpga_sysclk_p]

set_property VCCAUX_IO DONTCARE [get_ports fpga_sysclk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports fpga_sysclk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports fpga_sysclk_n]

create_clock -period 5.000 -name sys_clk_ref [get_pins -hier -filter name=~*fpga_sysclk_ibuf/IBUF_OUT*]

# reset - Btn0
set_property PACKAGE_PIN AR13 [get_ports reset]
set_property IOSTANDARD LVCMOS15 [get_ports reset]

# Timing Constraints
set_clock_groups -asynchronous -group [get_clocks fmc_clk0] -group [get_clocks -of_objects [get_pins -hier "*CLKOUT0*"]]
set_clock_groups -asynchronous -group [get_clocks fmc_clk1] -group [get_clocks -of_objects [get_pins -hier "*CLKOUT0*"]]
set_clock_groups -asynchronous -group [get_clocks fmc_gbtclk0] -group [get_clocks -of_objects [get_pins -hier "*CLKOUT0*"]]
set_clock_groups -asynchronous -group [get_clocks fmc_gbtclk1] -group [get_clocks -of_objects [get_pins -hier "*CLKOUT0*"]]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins -hier "*CLKOUT0*"]] -group [get_clocks fmc_clk0]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins -hier "*CLKOUT0*"]] -group [get_clocks fmc_clk1]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins -hier "*CLKOUT0*"]] -group [get_clocks fmc_gbtclk0]
set_clock_groups -asynchronous -group [get_clocks -of_objects [get_pins -hier "*CLKOUT0*"]] -group [get_clocks fmc_gbtclk1]

