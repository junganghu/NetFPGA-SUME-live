#!/bin/sh

#
# Copyright (c) 2016-2017 University of Cambridge
# Copyright (c) 2016-2017 Neelakandan Manihatty Bojan
# All rights reserved.
#
# This software was developed by University of Cambridge Computer Laboratory
#
# @NETFPGA_LICENSE_HEADER_START@
#
# Licensed to NetFPGA Open Systems C.I.C. (NetFPGA) under one or more
# contributor license agreements. See the NOTICE file distributed with this
# work for additional information regarding copyright ownership. NetFPGA
# licenses this file to you under the NetFPGA Hardware-Software License,
# Version 1.0 (the License); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at:
#
# http://www.netfpga-cic.org
#
# Unless required by applicable law or agreed to in writing, Work distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
#
# @NETFPGA_LICENSE_HEADER_END@


echo -n "\nINPUT_ARBITER\n"
echo -n "---------------\n"
./rdaxi 0x44010014 
./rdaxi 0x44010018 


echo -n "\n\nOPL\n"
echo -n "---------------\n"
./rdaxi 0x44020014
./rdaxi 0x44020018
./rdaxi 0x44020020
./rdaxi 0x44020024
./rdaxi 0x44020028
./rdaxi 0x4402002C
./rdaxi 0x44020030
./rdaxi 0x44020034
 

echo -n "\nVLAN_ADDER\n"
echo -n "---------------\n"
./rdaxi 0x44090014 
./rdaxi 0x44090018 
./rdaxi 0x4409001C 
./rdaxi 0x44090020 

echo -n "\nVLAN_REMOVER\n"
echo -n "---------------\n"
./rdaxi 0x440a0014
./rdaxi 0x440a0018
./rdaxi 0x440a001c
./rdaxi 0x440a0020
./rdaxi 0x440a0024
./rdaxi 0x440a0028
./rdaxi 0x440a002C
./rdaxi 0x440a0030
./rdaxi 0x440a0034
./rdaxi 0x440a0038
./rdaxi 0x440a003C
./rdaxi 0x440a0040
./rdaxi 0x440a0044
./rdaxi 0x440a0048
./rdaxi 0x440a004C



echo -n "\n\nOQ\n"
echo -n "---------------\n"
./rdaxi 0x44030014
./rdaxi 0x44030018
 
echo -n "\n\nP_STO\tB_STO\tP_REM\tB_REM\tP_DRO\tB_DRO\tP_IN_QUE\n"

echo -n "\n\nOQ P0 : \n" 
echo -n "---------------\n"
./rdaxi 0x44030004
./rdaxi 0x4403001c
./rdaxi 0x44030020
./rdaxi 0x44030024
./rdaxi 0x44030028
./rdaxi 0x4403002c
./rdaxi 0x44030030
./rdaxi 0x44030034
echo -n "\n" 
./rdaxi 0x440300A8
./rdaxi 0x440300AC
./rdaxi 0x440300B0
./rdaxi 0x440300B4
./rdaxi 0x440300B8
./rdaxi 0x440300BC
./rdaxi 0x440300C0
./rdaxi 0x440300C4


echo -n "\n\nOQ P1 : \n" 
echo -n "---------------\n"
./rdaxi 0x44030038
./rdaxi 0x4403003c
./rdaxi 0x44030040
./rdaxi 0x44030044
./rdaxi 0x44030048
./rdaxi 0x4403004c
./rdaxi 0x44030050

echo -n "\n\nOQ P2 : \n" 
echo -n "---------------\n"
./rdaxi 0x44030054
./rdaxi 0x44030058
./rdaxi 0x4403005c
./rdaxi 0x44030060
./rdaxi 0x44030064
./rdaxi 0x44030068
./rdaxi 0x4403006c

echo -n "\n\nOQ P3 : \n" 
echo -n "---------------\n"
./rdaxi 0x44030070
./rdaxi 0x44030074
./rdaxi 0x44030078
./rdaxi 0x4403007c
./rdaxi 0x44030080
./rdaxi 0x44030084
./rdaxi 0x44030088

echo -n "\n\nOQ P4 : \n" 
echo -n "---------------\n"
./rdaxi 0x4403008c
./rdaxi 0x44030090
./rdaxi 0x44030094
./rdaxi 0x44030098
./rdaxi 0x4403009c
./rdaxi 0x440300a0
./rdaxi 0x440300a4


echo -n "\n\nIF 0 : \n" 
echo -n "---------------\n"
./rdaxi 0x44040018
./rdaxi 0x4404001c

echo -n "\n\nIF 1 : \n" 
echo -n "---------------\n"
./rdaxi 0x44050018
./rdaxi 0x4405001c

echo -n "\n\nIF 2 : \n" 
echo -n "---------------\n"
./rdaxi 0x44060018
./rdaxi 0x4406001c

echo -n "\n\nIF 3 : \n" 
echo -n "---------------\n"
./rdaxi 0x44070018
./rdaxi 0x4407001c










 
