#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# All rights reserved.
#
# File:
# sw/embedded/Makefile
#
# Project:
# acceptance_test
#
# Author:
# Tinghui Wang (Steve)
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

WS = SDK_Workspace

.PHONY: distclean clean

all:
	@echo ""
	@echo "NetFPGA-SUME Acceptance Test SW Makefile"
	@echo ""
	@echo "make PROJ=<project_name> TARGETS"
	@echo "------------------------------------------------------"
	@echo "project:         Create software project"
	@echo "compile:         Compile specified project"
	@echo "download:        Download and run specified project via xmd"
	@echo ""
	@echo "clean:           Remove specified project"
	@echo "distclean:       Remove all generated projects"
	@echo ""
	@echo "Available Projects are: ddr3A, ddr3B, qdrA, qdrB, qdrC, pcie, fmc_ibert, fmc_gtwizard, fmc_aurora, qth_ibert, qth_gtwizard, qth_aurora, xge_loopback, gpio"
	@echo ""

project:
	@if [ -z ${PROJ} ]; then \
		echo "make PROJ=<proj_name> project";\
		echo "Available Projects are: ddr3A, ddr3B, qdrA, qdrB, qdrC, pcie, fmc_ibert, fmc_gtwizard, fmc_aurora, qth_ibert, qth_gtwizard, qth_aurora, xge_loopback, gpio";\
	else \
		if [ -d ./nf_sume_${PROJ}/${WS} ]; then \
			echo "Cleaning nf_sume_${PROJ}/${WS}";\
			rm -rf ./nf_sume_${PROJ}/${WS};\
		fi;\
		xsdk -batch -source ./tcl/acceptance_test_xsdk.tcl ${PROJ};\
		echo "Copy source files under nf_sume_${PROJ}/${WS}/acceptance_test";\
		cp src/nf_sume_${PROJ}/* ./nf_sume_${PROJ}/${WS}/acceptance_test/src/ -rf;\
		if [ -d ./src/nf_sume_${PROJ}_sim ]; then \
			echo "Copy SIM src files under nf_sume_${PROJ}/${WS}/acceptance_test_sim";\
			cp src/nf_sume_${PROJ}_sim/* ./nf_sume_${PROJ}/${WS}/acceptance_test_sim/src/ -rf;\
		fi;\
	fi;

# Compile Command needs to run twice to get sw compiled correctly in DEBUG mode
compile:
	@if [ -z ${PROJ} ]; then \
		echo "make PROJ=<proj_name> compile";\
		echo "Available Projects are: ddr3A, ddr3B, qdrA, qdrB, qdrC, pcie, fmc_ibert, fmc_gtwizard, fmc_aurora, qth_ibert, qth_gtwizard, qth_aurora, xge_loopback, gpio";\
	else \
		if [ -d nf_sume_${PROJ}/SDK_Workspace ]; then \
			xsdk -wait -eclipseargs -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild -build all -data nf_sume_${PROJ}/${WS} -vmargs -Dorg.eclipse.cdt.core.console=org.eclipse.cdt.core.systemConsole;\
			xsdk -wait -eclipseargs -nosplash -application org.eclipse.cdt.managedbuilder.core.headlessbuild -build all -data nf_sume_${PROJ}/${WS} -vmargs -Dorg.eclipse.cdt.core.console=org.eclipse.cdt.core.systemConsole;\
		else \
			echo "The nf_sume_${PROJ}/SDK_Workspace direcotry doesn't exist";\
			exit 0;\
		fi;\
	fi;

download:
	@if [ -z ${PROJ} ]; then \
		echo "make PROJ=<proj_name> download";\
		echo "Available Projects are: ddr3A, ddr3B, qdrA, qdrB, qdrC, pcie, fmc_ibert, fmc_gtwizard, fmc_aurora, qth_ibert, qth_gtwizard, qth_aurora, xge_loopback, gpio";\
	else \
		if [ -d nf_sume_${PROJ} ]; then\
			cd nf_sume_${PROJ};\
			xmd -tcl ../tcl/download.tcl `find hw -name "*.bit"` ${PROJ};\
		else \
			echo "${PROJ} not found";\
		fi;\
	fi;

clean:
	@if [ -z ${PROJ} ]; then \
		echo "make PROJ=<proj_name> clean";\
		echo "Available Projects are: ddr3A, ddr3B, qdrA, qdrB, qdrC, pcie, fmc_ibert, fmc_gtwizard, fmc_aurora, qth_ibert, qth_gtwizard, qth_aurora, xge_loopback, gpio";\
	else \
		rm -rf nf_sume_${PROJ}/${WS};\
		rm -rf nf_sume_${PROJ}/*.log;\
		rm -rf nf_sume_${PROJ}/*.hdf;\
	fi;

distclean:
	rm -rf `find . -name "${WS}"`
	rm -rf `find . -name "*.log"`
	rm -rf `find . -name "*.hdf"`
