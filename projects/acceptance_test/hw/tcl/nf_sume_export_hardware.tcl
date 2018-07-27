#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# Copyright (C) 2017 Salvator Galea
# All rights reserved.
#
# File:
# nf_sume_export_hardware.tcl
#
# Project:
# acceptance_test
#
# Author:
# Tinghui Wang (Steve)
# Modified by Salvator Galea
#
# Description:
# Vivado TCL scripts to export an implemented hardware design to SDK
#
# Useage:
# $ vivado -source tcl/nf_sume_export_hardware -tclargs <project_name>
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

puts "\nOpening $project_name XPR project\n"
open_project project/${project_name}_ex/${project_name}_ex.xpr

puts "\nOpening $project_name Implementation design\n"
open_run impl_1

puts "\nCopying $project_name.sysdef\n"
file mkdir ../sw/embedded/${project_name}
file copy -force project/${project_name}_ex/${project_name}_ex.runs/impl_1/example_top.sysdef ../sw/embedded/${project_name}/$project_name.hdf

exit


