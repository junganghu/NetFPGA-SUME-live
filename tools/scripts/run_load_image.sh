#!/bin/bash
# Copyright (c) 2016 University of Cambridge
# Copyright (c) 2016 Jong Hun Han
# All rights reserved.
#
# This software was developed by University of Cambridge Computer Laboratory
# under the ENDEAVOUR project (grant agreement 644960) as part of
# the European Union's Horizon 2020 research and innovation programme.
#
# @NETFPGA_LICENSE_HEADER_START@
#
# Licensed to NetFPGA Open Systems C.I.C. (NetFPGA) under one or more
# contributor license agreements. See the NOTICE file distributed with this
# work for additional information regarding copyright ownership. NetFPGA
# licenses this file to you under the NetFPGA Hardware-Software License,
# Version 1.0 (the "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at:
#
# http://www.netfpga-cic.org
#
# Unless required by applicable law or agreed to in writing, Work distributed
# under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
#
# @NETFPGA_LICENSE_HEADER_END@

xilinx_tool_path=`which vivado`
bitimage=$1

if [ -z $1 ]; then
	echo
	echo 'Nothing input for bit file.'
	exit 1
fi

if [ "$xilinx_tool_path" == "" ]; then
	echo
	echo Source Xilinx tool to run xmd command for programming a bit file. 
	echo
	exit 1
fi

sleep 1 
xmd -tcl run_xmd.tcl -tclargs $bitimage

sleep 1
bash $SUME_FOLDER/tools/scripts/reconfigure/pci_rescan_run.sh

sleep 1
rmmod sume_riffa

sleep 1
insmod $DRIVER_FOLDER/sume_riffa.ko

sleep 1
ifconfig nf0 up
ifconfig nf1 up
ifconfig nf2 up
ifconfig nf3 up

