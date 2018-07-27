#!/usr/bin/python

#
# Copyright (c) 2015 Neelakandan Manihatty Bojan
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



import sys
import getopt

from subprocess import Popen, PIPE


def main(argv):

# Parsing for the input file 

    input_filename = ''

    try:
	opts, args = getopt.getopt(sys.argv[1:], 'i:v', ['input='])

    except getopt.GetoptError:          
        print 'Usage : python load_bitfile -i <bitfile>'	                        
        sys.exit(2)   

    for opt, arg in opts:
    	if opt in ('-i', '--input'):
        	input_filename = arg
    print 'INPUT    :', input_filename

#   Scanning for the FPGA index
    p = Popen(['djtgcfg', 'init', '-d', 'NetSUME'], stdout=PIPE, bufsize = 1)
    for line in iter(p.stdout.readline, b''):
        tokens = line.split()
        for i in xrange(len(tokens)):
            if tokens[i] == 'XC7VX690T':
                fpgaIndex = tokens[i - 1].split(':')[0]
		print fpgaIndex;
    p.stdout.close()
    print('FPGA JTAG Index: %s' % fpgaIndex)

    # Program FPGA with bitfile
    k = Popen(['vivado', '-nolog', '-nojournal', '-mode', 'batch', '-source', 'download.tcl', '-tclargs', fpgaIndex, input_filename], stdout=PIPE, bufsize = 1)
    sys.stdout.write(k.stdout.readline())

if __name__ == "__main__":
    main(sys.argv[1:])
 
