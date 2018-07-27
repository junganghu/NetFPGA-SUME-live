################################################################################
#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# All rights reserved.
#
# File:
# Makefile
#
# Author:
# Tinghui Wang (Steve), Digilent Inc.
#
# Description:
# make all : Copy Xilinx files into NetFPGA-SUME library
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

IPGEN_DIR = generated_ip

all: ip_gen

ip_name = nf_sume_10g_pcs_pma
FILES := $(ip_name)_ff_synchronizer_rst2.v $(ip_name)_gt_common.v

ip_gen:
	@mkdir -p $(IPGEN_DIR)
	@cd $(IPGEN_DIR) && vivado -mode batch -source ../tcl/nf_sume_pcs_pma_compile.tcl
	@echo "/////////////////////////////////////////";
	@echo "// PCS PMA Shared Clk Rst Core Generated "; 
	@echo "/////////////////////////////////////////";
	for i in $(FILES); do \
		cp $(IPGEN_DIR)/${ip_name}/example_design/${ip_name}_ex/imports/$$i hdl/ -v; \
	done;
	@vivado -mode batch -source tcl/nf_sume_10g_interface_shared_logic.tcl

edit:
	vivado -mode tcl -source tcl/nf_sume_10g_interface_shared_logic_edit.tcl

clean:
	rm -rf $(IPGEN_DIR) 
	for i in $(FILES); do \
		rm hdl/$$i -fv; \
	done;
	rm -rf vivado*
	rm -rf .Xil
	rm -rf nf_sume_10g_interface_shared_logic_project
	rm -rf component.xml
	rm -rf xgui

cleanall: clean
