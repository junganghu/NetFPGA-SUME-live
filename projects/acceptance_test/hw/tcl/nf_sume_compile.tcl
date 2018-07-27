#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# Copyright (C) 2017 Salvator Galea
# All rights reserved.
#
# File:
# nf_sume_compile.tcl
#
# Project:
# acceptance_test
#
# Author:
# Tinghui Wang (Steve)
# Modified by Salvator Galea
#
# Description:
# Vivado TCL script to synthesize and implement the specified 
# acceptance_test project.
#
# Useage:
# $ vivado -source tcl/nf_sume_compile -tclargs <project_name>
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

if { $::argc != 1 } {
	puts "nf_sume_compile <project_name>";
	error "nf_sume_compile: missing args <project_name>";
}

set interface_name [lindex $argv 0]
set project_name nf_sume_${interface_name}_ex

open_project "project/${project_name}/${project_name}.xpr"
reset_run impl_1 -prev_step
set_property synth_checkpoint_mode None [get_files -regexp -nocase {.*\.bd}]
launch_runs impl_1 -to_step write_bitstream
set prog "0"
set impl_prog "0%"
set synth_prog "0%"
set num_of_dirs "1"
set num_of_logs "0"

while { $prog != "100" && $impl_prog != "100%"} {
	set prog [ expr { (100*$num_of_logs) / $num_of_dirs } ]
	set impl_prog [get_property PROGRESS [get_runs impl_1]]
	set synth_prog [get_property PROGRESS [get_runs synth_1]]
	puts -nonewline "Synthesis Progress\t: $synth_prog\nImplementation Progress\t: $impl_prog\nTotal Progress\t\t: $prog%"
	after 2000
	set num_of_dirs [llength [glob -type d project/$project_name/$project_name.runs/*]]
	set num_of_logs [llength [glob -type f project/$project_name/$project_name.runs/*/runme.log]]
	puts [exec clear] 
}
wait_on_run impl_1

exit
