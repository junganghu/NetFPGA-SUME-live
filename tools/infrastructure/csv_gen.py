#
# Copyright (c) 2018 Murali Ramanujam
# All rights reserved.
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
# CONDITIONS OF ANY KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations under the License.
#
# @NETFPGA_LICENSE_HEADER_END@
#
import csv
import pprint
import os

inputFileName="module_generation.csv"
inputTemplateName="regs_template.txt"
outputFileName="regs_gen.py"


def get_width(input):
	parts=input.split(":")
	i = 0
	for element in parts:
		parts[i] = int(parts[i])
		i = i + 1
	high=parts[0]
	if(len(parts) < 2):
		return high
	if(max(parts) > 0):
		low = parts[1]
		return high - low + 1
	else:
		return 1


headers = []
result = []


module_col = 0
name_col = 1
addr_col = 2
desc_col = 3
type_col = 4
bits_col = 5
endian_col = 6
access_col = 7
submodule_col = 8
default_col = 9
comments_col = 10


with open(inputFileName, 'rb') as csvfile:
	reader = csv.reader(csvfile, delimiter=',', quotechar='"')
	headers = list(reader.next())
	result = [list(row) for row in reader]


try:
    os.remove(outputFileName)
except OSError:
	print("target output file does not already exist. moving on.")
	pass



with open(outputFileName, "a") as myfile:
	myfile.write("%s\n%s\n%s\n" % ("#! /usr/bin/env python", "", "# @NETFPGA_LICENSE_HEADER_START@\n\
#\n\
# Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor\n\
# license agreements.  See the NOTICE file distributed with this work for\n\
# additional information regarding copyright ownership.  NetFPGA licenses this\n\
# file to you under the NetFPGA Hardware-Software License, Version 1.0 (the\n\
# \"License\"); you may not use this file except in compliance with the\n\
# License.  You may obtain a copy of the License at:\n\
#\n\
#   http://www.netfpga-cic.org\n\
#\n\
# Unless required by applicable law or agreed to in writing, Work distributed\n\
# under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR\n\
# CONDITIONS OF ANY KIND, either express or implied.  See the License for the\n\
# specific language governing permissions and limitations under the License.\n\
# @NETFPGA_LICENSE_HEADER_END@"))
	myfile.write("module_name='%s'\n" % result[2][module_col].lower())
	myfile.write("block_name=module_name.upper()\n\n")
	myfile.write("def create_regs_list():\n  regsDict=[\n")
	prev_is_reg = 1
	for rowNum in range(1,len(result)):

		reg_block = result[rowNum][module_col]
		reg_name = result[rowNum][name_col]
		reg_addr = "32'h" + str(result[rowNum][addr_col])
		reg_desc = result[rowNum][desc_col]
		reg_type = result[rowNum][type_col]
		reg_bits = result[rowNum][bits_col]
		reg_width = get_width(reg_bits)
		reg_endian_type = result[rowNum][endian_col]
		reg_access = result[rowNum][access_col]
		reg_submodule = result[rowNum][submodule_col]
		reg_default = result[rowNum][default_col]
		reg_comments = result[rowNum][comments_col]
		eol = "\n\r"
		
		if(reg_type.lower() == "reg"):
			myfile.write("{'reg':\"%s\",'type':\"%s\",'endian':\"%s\", 'name':\"%s\",'bits':\"%s\",'width':\"%s\",'addr':\"%s\",'default':\"%s\"},\n" % (reg_name,reg_access,reg_endian_type,reg_name,reg_bits,reg_width,reg_addr,reg_default))
		elif(reg_type.lower() == "mem"):
			if(prev_is_reg == 1):
				prev_is_reg = 0
				myfile.write("]\n")
				myfile.write("  return(regsDict)")
				myfile.write("\n")
				myfile.write("def create_mems_list():\n")
				myfile.write("  memsDict=[ \n")
			myfile.write("{'mem':\"%s\",'name':\"%s\",'data_bits':\"%s\", 'addr_bits':\"%s\",'width':\"%s\",'address':\"%s\"},\n" % (reg_name,reg_name.lower(),reg_bits,reg_access,reg_width,reg_default))

	myfile.write("]\n")
	if(prev_is_reg == 1):
		myfile.write("  return(regsDict)")
	else:
		myfile.write("  return(memsDict)")
	myfile.write("\n")
	with open(inputTemplateName, "r") as templateInputFile:
		myfile.write(templateInputFile.read())
print("done")