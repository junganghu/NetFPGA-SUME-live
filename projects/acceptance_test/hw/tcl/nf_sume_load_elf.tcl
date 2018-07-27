#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# Copyright (C) 2017 Salvator Galea
# All rights reserved.
#
# File:
# nf_sume_load_elf.tcl
#
# Project:
# acceptance_test
#
# Author:
# Tinghui Wang (Steve)
# Modified by Salvator Galea
#
# Description:
# Vivado TCL script to insert compiled elf files into the project
# and associate it with the microblaze in the system. The script generates
# bitstreams with microblaze BRAM initialized with the elf file.
#
# Useage:
# $ vivado -source tcl/nf_sume_load_elf -tclargs <project_name>
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

set project_name [lindex $argv 0]

# open project
open_project project/${project_name}_ex/${project_name}_ex.xpr

set bd_file [get_files -regexp -nocase {.*\.bd}]
set elf_file ../sw/embedded/${project_name}/SDK_Workspace/acceptance_test/Debug/acceptance_test.elf

open_bd_design $bd_file

# insert acceptance_test elf if it is not inserted yet
if {[llength [get_files *acceptance_test.elf]]} {
	puts "ELF File [get_files *acceptance_test.elf] is already associated"
} else {
	add_files -norecurse -force ${elf_file} 
	set_property SCOPED_TO_REF [current_bd_design] [get_files -all -of_objects [get_fileset sources_1] ${elf_file}]
	set_property SCOPED_TO_CELLS mbsys/microblaze_0 [get_files -all -of_objects [get_fileset sources_1] ${elf_file}]
}

# Create bitstream with up-to-date elf files
reset_run impl_1 -prev_step
launch_runs impl_1 -to_step write_bitstream
wait_on_run impl_1
open_run impl_1
write_bitstream -force ../bitfiles/${project_name}.bit

exit
