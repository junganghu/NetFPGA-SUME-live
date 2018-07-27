#!/usr/bin/env python

#
# Copyright (c) 2015 University of Cambridge
# All rights reserved.
#
# This software was developed by Stanford University and the University of Cambridge Computer Laboratory 
# under National Science Foundation under Grant No. CNS-0855268,
# the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
# by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
# as part of the DARPA MRC research programme.
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
#

import subprocess
cmd=[""" cat rom_data.txt | wc -l """]
no_of_lines=subprocess.check_output(cmd,shell=True)
print no_of_lines

input_file = open("rom_data.txt", "r")
output_file = open("id_rom16x32.coe", "w")
output_file.write("memory_initialization_radix=16;\n")
output_file.write("memory_initialization_vector=\n")

line_no = 0
for line in input_file:
	line_no += 1
	b=len(line)
	line = line.strip()
	zeros=9-b
	pad='0'*zeros
	if line_no == 16: # To track the last element of the rom
		final= pad+line+';'
	else:
		final= pad+line+','
	output_file.write(final+"\n")

	
