#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# Copyright (c) 2015 Noa Zilberman
# All rights reserved.
#
# File:
# hw/Makefile
#
# Project:
# acceptance_test
#
# Author:
# Tinghui Wang (Steve)
# Modified by Noa Zilberman, Salvator Galea
#
# Description:
# This makefile is used to generate and compile acceptance_test project 
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

LIB_REPO = ip_repo/
LIB_HW_DIR_INSTANCES := $(shell cd $(LIB_REPO) && find . -mindepth 3 -maxdepth 3 -type d)

# TODO
# fmc_aurora qth_aurora 
all: ddr3A ddr3B qdrA qdrB qdrC pcie fmc_ibert fmc_gtwizard qth_ibert qth_gtwizard pcie_ibert gpio sata 10g_loopback 

ddr3A ddr3B qdrA qdrB qdrC pcie fmc_ibert fmc_gtwizard qth_ibert qth_gtwizard pcie_ibert gpio sata 10g_loopback:
	make -C hw PROJ=$@ project
	make -C hw PROJ=$@ compile
	make -C hw PROJ=$@ export_to_sdk
	make -C sw/embedded PROJ=$@ project
	make -C sw/embedded PROJ=$@ compile
	make -C hw PROJ=$@ load_elf

test:
	python sw/host/script/NfSumeTest.py

cores:
	for lib in $(LIB_HW_DIR_INSTANCES) ; do\
		make -C ip_repo/$$lib clean; \
		make -C ip_repo/$$lib; \
	done;

clean:
	for lib in $(LIB_HW_DIR_INSTANCES) ; do\
		make -C ip_repo/$$lib clean; \
	done;
	rm -rfv vivado*;\

distclean:
	for lib in $(LIB_HW_DIR_INSTANCES) ; do\
		make -C ip_repo/$$lib clean; \
	done;
	make -C hw distclean
	make -C sw/embedded distclean
	rm -rfv vivado*;\
