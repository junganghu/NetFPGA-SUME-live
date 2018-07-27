#!/bin/sh
#
# Copyright (c) 2015-2016 Jong Hun Han
# All rights reserved
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

cam_dir=./xapp1151_cam_v1_1/src
file_list=`find $cam_dir -name *.vhd`

axi_dir=./hdl/xilinx

check_virtex7=`grep -r virtex7 $cam_dir `
check_VIRTEX7=`grep -r VIRTEX7 $cam_dir `

if [[ $XILINX_PATH == "" ]]
   then
      echo " "
      echo "Run setup for Xilinx tool environments!"
      echo " "
      exit
fi

if [ ! -d ./xapp1151_cam_v1_1 ]
   then
      echo ""
      echo "Download and uncompress the Xilinx CAM (xapp1151) here."
      echo "The CAM can be downloaded from Xilinx web site."
      echo ""
      exit
fi 

if [ ! -d ./hdl/xilinx ]
   then
      mkdir ./hdl/xilinx
fi

\cp -f $XILINX_PATH/data/ip/xilinx/axi_lite_ipif_v3_0/hdl/src/vhdl/* ./hdl/xilinx/


for in_file in $file_list; do

   sed -i -e 's/LIBRARY cam/LIBRARY xil_defaultlib/' $in_file
   sed -i -e 's/ENTITY cam\./ENTITY xil_defaultlib\./' $in_file
   sed -i -e 's/USE cam\./USE xil_defaultlib\./' $in_file
done

axi_file_list=`find $axi_dir -name *.vhd`

for in_file in $axi_file_list; do

   sed -i -e 's/axi_lite_ipif_v3_0/xil_defaultlib/' $in_file
done

if [[ $check_virtex7 != "" && $check_VIRTEX7 != "" ]]
   then
      echo " "
      echo "It's already updated."
      echo " "
      exit
fi

sed -i '/virtex6l/a CONSTANT VIRTEX7               : STRING := "virtex7";' $cam_dir/vhdl/cam_pkg.vhd
sed -i -e 's/spartan6)/spartan6) OR (C_FAMILY = virtex7)/' $cam_dir/vhdl/cam_rtl.vhd
sed -i -e 's/or spartan6/spartan6, or virtex7/' $cam_dir/vhdl/cam_rtl.vhd
