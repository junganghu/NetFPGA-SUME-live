#
# Copyright (c) 2015-2016 Jong Hun Han
# All rights reserved.
#
# This software was developed by Stanford University and the University of
# Cambridge Computer Laboratory under National Science Foundation under Grant
# No. CNS-0855268, the University of Cambridge Computer Laboratory under EPSRC
# INTERNET Project EP/H040536/1 and by the University of Cambridge Computer
# Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), as part of
# the DARPA MRC research programme.
#
# @NETFPGA_LICENSE_HEADER_START@
#
# Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor license
# agreements.  See the NOTICE file distributed with this work for additional
# information regarding copyright ownership.  NetFPGA licenses this file to you
# under the NetFPGA Hardware-Software License, Version 1.0 (the "License"); you
# may not use this file except in compliance with the License.  You may obtain
# a copy of the License at:
#
#   http://www.netfpga-cic.org
#
# Unless required by applicable law or agreed to in writing, Work distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations under the License.
#
# @NETFPGA_LICENSE_HEADER_END@

.PHONY: clean project export_to_sdk load_elf  

project: 
	echo "Create reference project under folder /project";\
	if test -d project/; then\
		echo "Project already exists"; \
	else \
		vivado -mode batch -source tcl/sume_blueswitch.tcl;\
	fi;\

export_to_sdk:
	if test -d project; then\
		echo "export blueswitch project to SDK"; \
		vivado -mode tcl -source tcl/export_hardware_bd.tcl -tclargs system;\
	else \
		echo "Project blueswitch does not exist.";\
		echo "Please run \"make project\" to create and build the project first";\
	fi;\

load_elf:
	@if [ ! -d ../bitfiles ]; then mkdir ../bitfiles; fi;
	if test -d project; then\
		echo "export blueswitch project to SDK"; \
		vivado -mode tcl -source tcl/load_elf_bd.tcl -tclargs system;\
	else \
		echo "Project blueswitch does not exist.";\
		echo "Please run \"make project\" to create and build the project first";\
	fi;\

clean: 
	rm -rf proj* vivado*.* *.*~ .Xil* *ip_repo*

