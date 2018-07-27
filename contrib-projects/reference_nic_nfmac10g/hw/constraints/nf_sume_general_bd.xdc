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

## -- The following two properties should be set for every design
set_property CFGBVS GND [current_design]
set_property CONFIG_VOLTAGE 1.8 [current_design]
set_property BITSTREAM.GENERAL.COMPRESS FALSE [current_design]

# PCIe Transceiver clock (100 MHz)
set_property PACKAGE_PIN AB8 [get_ports sys_clkp]
set_property PACKAGE_PIN AB7 [get_ports sys_clkn]

set_property LOC IBUFDS_GTE2_X1Y11 [get_cells -hier -filter name=~*IBUFDS_GTE2*]
create_clock -period 10.000 -name pcie_sys_clk [get_pins -hier -filter name=~*IBUFDS_GTE2*/O]

# PCIe sys reset
set_property PACKAGE_PIN AY35 [get_ports pcie_sys_resetn]
set_property IOSTANDARD LVCMOS18 [get_ports pcie_sys_resetn]
set_property PULLUP true [get_ports pcie_sys_resetn]

set_false_path -from [get_ports pcie_sys_resetn]

# 200MHz System Clock
set_property PACKAGE_PIN G18 [get_ports fpga_sysclk_n]
set_property PACKAGE_PIN H19 [get_ports fpga_sysclk_p]

set_property VCCAUX_IO DONTCARE [get_ports fpga_sysclk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports fpga_sysclk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports fpga_sysclk_n]

create_clock -period 5.000 -name sys_clk_ref [get_pins -hier -filter name=~*sysclk_buf/IBUF_OUT*]

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

# reset - Btn0
set_property PACKAGE_PIN AR13 [get_ports reset]
set_property IOSTANDARD LVCMOS15 [get_ports reset]


set_false_path -from [get_ports reset]

set_false_path -from [get_ports pcie_sys_resetn]








