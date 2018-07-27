#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# All rights reserved.
#
# File:
# nf_sume_ddr3A.xdc
#
# Project:
# acceptance_test
#
# Author:
# Tinghui Wang (Steve)
#
# Description:
# System general constraints for NetFPGA-SUME board.
# The file includes constraints for:
# - Master FPGA 200MHz clock (fpga_sysclk)
# - Main I2C Bus (iic_fpga, iic_reset)
# - UART (115200-8N1)
# - Btn0 is used as system reset (active high)
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

## -- The following two properties should be set for every design
set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]

# Main I2C Bus - 100KHz
set_property IOSTANDARD LVCMOS18 [get_ports iic_fpga_scl_io]
set_property SLEW SLOW [get_ports iic_fpga_scl_io]
set_property DRIVE 16 [get_ports iic_fpga_scl_io]
set_property PULLUP true [get_ports iic_fpga_scl_io]
set_property PACKAGE_PIN AK24 [get_ports iic_fpga_scl_io]

set_property IOSTANDARD LVCMOS18 [get_ports iic_fpga_sda_io]
set_property SLEW SLOW [get_ports iic_fpga_sda_io]
set_property DRIVE 16 [get_ports iic_fpga_sda_io]
set_property PULLUP true [get_ports iic_fpga_sda_io]
set_property PACKAGE_PIN AK25 [get_ports iic_fpga_sda_io]

# i2c_reset[0] - iic_mux reset - high active
# i2c_reset[1] - si5324 reset - high active
set_property SLEW SLOW [get_ports {iic_reset[*]}]
set_property DRIVE 16 [get_ports {iic_reset[*]}]
set_property PACKAGE_PIN AM39 [get_ports {iic_reset[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {iic_reset[0]}]
set_property PACKAGE_PIN BA29 [get_ports {iic_reset[1]}]
set_property IOSTANDARD LVCMOS18 [get_ports {iic_reset[1]}]

# UART - 115200 8-1 no parity
set_property PACKAGE_PIN AY19 [get_ports uart_rxd]
set_property PACKAGE_PIN BA19 [get_ports uart_txd]
set_property IOSTANDARD LVCMOS15 [get_ports uart_rxd]
set_property IOSTANDARD LVCMOS15 [get_ports uart_txd]

# Bitfile Generation
set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]



