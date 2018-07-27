#  
# Copyright (c) 2015 Digilent Inc.
# All rights reserved.
#
# File:
# Makefile
#  
# Library:
# hw/std/cores/nf_sume_10g_interface
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
MAC_IP = nf_sume_10g_interface_mac
PMA_IP = nf_sume_10g_interface_pcs_pma
MAC_DIR = $(IPGEN_DIR)/$(MAC_IP)
PMA_DIR = $(IPGEN_DIR)/$(PMA_IP)

all:
	mkdir -p $(IPGEN_DIR)
	cd $(IPGEN_DIR) && vivado -mode batch -source ../tcl/nf_sume_10g_interface_mac.tcl
	cd $(IPGEN_DIR) && vivado -mode batch -source ../tcl/nf_sume_10g_interface_pcs_pma.tcl
	mkdir -p hdl/$(IPGEN_DIR)/$(MAC_IP)
	mkdir -p hdl/$(IPGEN_DIR)/$(PMA_IP)
	cp -rfv $(MAC_DIR)/synth hdl/$(IPGEN_DIR)/$(MAC_IP)
	cp -rfv $(PMA_DIR)/synth hdl/$(IPGEN_DIR)/$(PMA_IP)
	cp -rfv $(MAC_DIR)/example_design hdl/$(IPGEN_DIR)/$(MAC_IP)
	cp -rfv $(PMA_DIR)/example_design hdl/$(IPGEN_DIR)/$(PMA_IP)
	vivado -mode batch -source tcl/nf_sume_10g_interface.tcl
	vivado -mode batch -source tcl/nf_sume_10g_interface_edit.tcl

clean:
	rm -fv vivado*
	rm -fv component.xml
	rm -rf $(IPGEN_DIR)
	rm -rf hdl/$(IPGEN_DIR)
	rm -rf nf_sume_10g_interface_project
	rm -rf xgui
