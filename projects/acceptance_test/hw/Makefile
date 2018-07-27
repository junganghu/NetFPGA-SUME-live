#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
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
# Modified by Salvator Galea
#
# Description:
# This makefile is used to generate and compile acceptance_test hardware
# projects 
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

all:
	@echo ""
	@echo "NetFPGA-SUME Acceptance Test HW Makefile"
	@echo ""
	@echo "make PROJ=<project_name> TARGETS"
	@echo "------------------------------------------------------"
	@echo "project:         Create hardware project"
	@echo "compile:         Synthesize and implement specified project"
	@echo "export_to_sdk:   Export implemented project to sw/embedded"
	@echo "load_elf:        Load ELF file for specified project"
	@echo "sim:             Simulate specified project"
	@echo ""
	@echo "clean:           Remove specified project"
	@echo "distclean:       Remove all generated projects"
	@echo ""
	@echo "Available Projects are: ddr3A ddr3B qdrA qdrB qdrC pcie fmc_ibert fmc_gtwizard qth_ibert qth_gtwizard pcie_ibert gpio sata 10g_loopback"
	@echo ""

.PHONY: project compile export_to_sdk load_elf clean distclean

project:
	@if [ -z ${PROJ} ]; then \
		echo "make PROJ=<proj_name> project";\
		echo "Available Projects are: ddr3A ddr3B qdrA qdrB qdrC pcie fmc_ibert fmc_gtwizard qth_ibert qth_gtwizard pcie_ibert gpio sata 10g_loopback ";\
	else \
		echo "";\
		echo "*******************************************************************";\
		echo "* Create ${PROJ} acceptance test under folder /project";\
		echo "*******************************************************************\n";\
		if test -d project/nf_sume_${PROJ}_ex; then \
			echo "${PROJ} already exists"; \
		else \
			vivado -mode batch -source tcl/nf_sume_${PROJ}.tcl;\
			if [ -f patch/nf_sume_${PROJ}.patch ]; then \
				patch -p1 < patch/nf_sume_${PROJ}.patch;\
			fi;\
			if [ -f project/nf_sume_${PROJ}_ex/nf_sume_${PROJ}_ex.srcs/sources_1/ip/nf_sume_${PROJ}/nf_sume_${PROJ}/example_design/rtl/example_top.v ]; then \
				cp -f project/nf_sume_${PROJ}_ex/nf_sume_${PROJ}_ex.srcs/sources_1/ip/nf_sume_${PROJ}/nf_sume_${PROJ}/example_design/rtl/example_top.v project/nf_sume_${PROJ}_ex/imports/example_top.v;\
			fi;\
		fi;\
	fi;

compile:
	@if [ -z ${PROJ} ]; then \
		echo "make PROJ=<proj_name> compile";\
		echo "Available Projects are: ddr3A ddr3B qdrA qdrB qdrC pcie fmc_ibert fmc_gtwizard qth_ibert qth_gtwizard pcie_ibert gpio sata 10g_loopback ";\
	else \
		if test -d project/nf_sume_${PROJ}_ex; then \
			echo "";\
			echo "***********************************";\
			echo "* Start Compiling ${PROJ}"; \
			echo "***********************************\n";\
			vivado -mode batch -source tcl/nf_sume_compile.tcl -tclargs ${PROJ};\
		else \
			echo "Acceptance test ${PROJ} does not exists.";\
			echo "Please run \"make PROJ=${PROJ} project\" to create the project first";\
		fi;\
	fi;

export_to_sdk:
	@if [ -z ${PROJ} ]; then \
		echo "make PROJ=<proj_name> export_to_sdk";\
		echo "Available Projects are: ddr3A ddr3B qdrA qdrB qdrC pcie fmc_ibert fmc_gtwizard qth_ibert qth_gtwizard pcie_ibert gpio sata 10g_loopback ";\
	else \
		if test -d project/nf_sume_${PROJ}_ex; then \
			echo "";\
			echo "******************************************";\
			echo "* Export ${PROJ} project to SDK";\
			echo "******************************************\n";\
#			vivado -mode batch -source tcl/nf_sume_export_hardware.tcl -tclargs nf_sume_${PROJ};\
			if test -d ../sw/embedded/nf_sume_${PROJ}; then \
				rm -rf ../sw/embedded/nf_sume_${PROJ}/; \
			fi; \
			mkdir ../sw/embedded/nf_sume_${PROJ}/; \
			find project/nf_sume_${PROJ}_ex/ -name "*.sysdef" -exec cp -f {} ../sw/embedded/nf_sume_${PROJ}/nf_sume_${PROJ}.hdf  \; ;\
		else \
			echo "Acceptance test ${PROJ} does not exists.";\
			echo "Please run \"make PROJ=${PROJ} project compile\" to create and build the project first";\
		fi;\
	fi;

sim:
	@if [ -z ${PROJ} ]; then \
		echo "make PROJ=<proj_name> sim";\
		echo "Available Projects are: ddr3A ddr3B qdrA qdrB qdrC pcie fmc_ibert fmc_gtwizard qth_ibert qth_gtwizard pcie_ibert gpio sata 10g_loopback ";\
	else \
		if test -d project/nf_sume_${PROJ}_ex; then \
			echo "";\
			echo "******************************************";\
			echo "* Export SIM ${PROJ} project to SDK"; \
			echo "******************************************\n";\
			vivado -mode batch -source tcl/nf_sume_sim.tcl -tclargs nf_sume_${PROJ};\
		else \
			echo "Acceptance test ${PROJ} does not exists.";\
			echo "Please run \"make PROJ=${PROJ} project compile\" to create and build the project first";\
		fi;\
	fi;

load_elf:
	@if [ ! -d ../bitfiles ]; then mkdir ../bitfiles; fi;
	@if [ -z ${PROJ} ]; then \
		echo "make PROJ=<proj_name> load_elf";\
		echo "Available Projects are: ddr3A ddr3B qdrA qdrB qdrC pcie fmc_ibert fmc_gtwizard qth_ibert qth_gtwizard pcie_ibert gpio sata 10g_loopback ";\
	else \
		if test -d project/nf_sume_${PROJ}_ex; then \
			echo "";\
			echo "******************************************";\
			echo "* Load elf file to ${PROJ} project"; \
			echo "******************************************\n";\
			vivado -mode batch -source tcl/nf_sume_load_elf.tcl -tclargs nf_sume_${PROJ};\
		else \
			echo "Acceptance test ${PROJ} does not exists.";\
			echo "Please run \"make PROJ=${PROJ} project compile\" to create and build the project first";\
		fi;\
	fi;

clean:
	@if [ -z ${PROJ} ]; then \
		echo "make PROJ=<proj_name> clean";\
		echo "Available Projects are: ddr3A ddr3B qdrA qdrB qdrC pcie fmc_ibert fmc_gtwizard qth_ibert qth_gtwizard pcie_ibert gpio sata 10g_loopback ";\
	else \
		rm -rfv project/nf_sume_${PROJ}*;\
		rm -rfv ../sw/embedded/nf_sume_${PROJ}*;\
		rm -rfv vivado*;\
		rm -rfv *.log;\
		rm -rfv .Xil;\
		rm -rfv ..rej;\
		rm -rfv .srcs;\
		rm -rfv webtalk*;\
	fi;

distclean:
	@rm -rfv project
	@rm -rfv ../sw/embedded/nf_sume_*
	@rm -rfv vivado*
	@rm -rfv *.log
	@rm -rfv .Xil
	@rm -rfv ..rej
	@rm -rfv .srcs
	@rm -rfv webtalk*

