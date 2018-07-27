#!/usr/bin/env python

#
# Copyright (c) 2015 University of Cambridge
# Copyright (c) 2015 Neelakandan Manihatty Bojan, Georgina Kalogeridou
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
#
# Author:
#        Modified by Neelakandan Manihatty Bojan, Georgina Kalogeridou

import logging
logging.getLogger("scapy.runtime").setLevel(logging.ERROR)

from NFTest import *
import sys
import os
from scapy.layers.all import Ether, IP, TCP
from reg_defines_encap_decap import *
import time

conn = ('../connections/conn', [])
nftest_init(sim_loop = ['nf0', 'nf1', 'nf2', 'nf3'], hw_config = [conn])

if isHW():
   # reset_counters (triggered by Write only event) for all the modules 
   nftest_regwrite(SUME_INPUT_ARBITER_0_RESET(), 0x1)
   nftest_regwrite(SUME_OUTPUT_PORT_LOOKUP_0_RESET(), 0x1)
   nftest_regwrite(SUME_OUTPUT_QUEUES_0_RESET(), 0x1)
   nftest_regwrite(SUME_NF_10G_INTERFACE_SHARED_0_RESET(), 0x1)
   nftest_regwrite(SUME_NF_10G_INTERFACE_1_RESET(), 0x1)
   nftest_regwrite(SUME_NF_10G_INTERFACE_2_RESET(), 0x1)
   nftest_regwrite(SUME_NF_10G_INTERFACE_3_RESET(), 0x1)
   nftest_regwrite(SUME_NF_RIFFA_DMA_0_RESET(), 0x1)

nftest_start()

# set parameters
SA = "aa:bb:cc:dd:ee:ff"
TTL = 64
DST_IP = "192.168.1.2"
SRC_IP = "192.168.0.1"
nextHopMAC = "dd:55:dd:66:dd:77"

pkts = []

print "Sending now: "
totalPktLengths = [0,0,0,0]

i=0

# HW Test
if isHW():
    for num_pkts in range(64,1515):
    #for num_pkts in range(64,1518):
        DA = "00:ca:fe:00:00:00"
        pkt = make_IP_pkt(dst_MAC=DA, src_MAC=SA, dst_IP=DST_IP,
                         src_IP=SRC_IP, TTL=TTL,
                         pkt_len=num_pkts) 
    
        nftest_send_phy('nf2', pkt)
	
  	i = i+1 # enable to just sweep once

# SIM Test

if not isHW():  
   for i in range(64,69):
        DA = "00:ca:fe:00:00:00"
        pkt = make_IP_pkt(dst_MAC=DA, src_MAC=SA, dst_IP=DST_IP,
                             src_IP=SRC_IP, TTL=TTL,
                             pkt_len=i)
        pkt.time = (i*(1e-8))
        pkts.append(pkt)

 
if not isHW():  
    nftest_send_phy('nf2', pkts) 

nftest_barrier()

if isHW():
    rres1=nftest_regread_expect(SUME_INPUT_ARBITER_0_PKTIN(), 0x5AB)
    rres2=nftest_regread_expect(SUME_INPUT_ARBITER_0_PKTOUT(), 0x5AB)
    rres3=nftest_regread_expect(SUME_OUTPUT_QUEUES_0_PKTSTOREDPORT0(), 0x5AB)
    rres4=nftest_regread_expect(SUME_OUTPUT_QUEUES_0_PKTREMOVEDPORT0(), 0x5AB) 
    rres5=nftest_regread_expect(SUME_OUTPUT_PORT_LOOKUP_0_PKTIN(), 0x5AB) 
    rres6=nftest_regread_expect(SUME_OUTPUT_PORT_LOOKUP_0_PKTOUT(), 0x5AB) 
    mres=[rres1,rres2,rres3,rres4,rres5,rres6]

else: 

    nftest_regread_expect(SUME_INPUT_ARBITER_0_PKTIN(), 0x5)
    nftest_regread_expect(SUME_INPUT_ARBITER_0_PKTOUT(), 0x5)
    nftest_regread_expect(SUME_OUTPUT_PORT_LOOKUP_0_PKTIN(), 0x5) 
    nftest_regread_expect(SUME_OUTPUT_PORT_LOOKUP_0_PKTOUT(), 0x5) 
    nftest_regread_expect(SUME_OUTPUT_QUEUES_0_PKTSTOREDPORT0(), 0x5)
    nftest_regread_expect(SUME_OUTPUT_QUEUES_0_PKTREMOVEDPORT0(), 0x5) 
    nftest_regread_expect(SUME_OUTPUT_QUEUES_0_PKTSTOREDPORT1(), 0x5)
    nftest_regread_expect(SUME_OUTPUT_QUEUES_0_PKTREMOVEDPORT1(), 0x5) 

    mres=[]


nftest_finish(mres)




