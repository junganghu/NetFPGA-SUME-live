################################################################################
#
# Copyright (c) 2015 Digilent Inc.
# All rights reserved.
#
# File:
# Makefile
#
# Library:
# hw/std/nf_sume_gpio_test
#
# Author:
# Tinghui Wang (Steve)
#
# Description:
# Makefile to generate nf_sume_gpio_test IP Core
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

ip_name = nf_sume_gpio_test

# Targets:
# 	all: generate IP definitions
# 	edit: open up the IP core in Vivado IP Packager
# 	clean: Clean up all generated files

all:
	vivado -mode tcl -source tcl/$(ip_name).tcl

edit:
	vivado -mode tcl -source tcl/$(ip_name)_edit.tcl

clean:
	rm -fv vivado*
	rm -fv component.xml
	rm -rf xgui
	rm -rf $(ip_name)_project
