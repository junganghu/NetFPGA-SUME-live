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
from reg_defines_reference_emu import *
from memlib import * 
from memcached_pcapgen import * 

phy2loop0 = ('../connections/conn', [])
nftest_init(sim_loop = [], hw_config = [phy2loop0])


nftest_start()

cfg_set_s1={'dst-mac': 'BB:BB:BB:BB:BB:BB', 'dont-fragment': 'yes', 'protocol': 'binary', 'key': 'Test_1', 'success': 'yes', 'opaque': '00110022', 'request-id': 23, 'src-mac': 'AA:AA:AA:AA:AA:AA', 'src-port': 6666, 'src-ip': '1.1.1.1', 'flags': '\xaa', 'value': 'TestVal1', 'file': 'set_s1', 'dst-port': 11211, 'dst-ip': '2.2.2.2', 'type': 'set', 'expiration': 1}

pkt_num = 10

pkts = []
pkta = []
rtx = []

for i in range(pkt_num):
	cfg_set_s1['flags'] = "%x" % (ord('a')+i)
	(request_packet, response_packet) = generateICMP(cfg_set_s1)
	if not isHW():
		request_packet.time = ((i*(1e-8)) + (2e-6))
		response_packet.time = ((i*(1e-8)) + (2e-6))
	rtx.append(request_packet)
	rtx.append(response_packet)	
	pkts.append(request_packet)
	pkta.append(response_packet)
	if isHW():
		nftest_send_phy('nf0', request_packet)
		nftest_expect_phy('nf0', response_packet)

scapy.all.wrpcap('ICMP_ECHO', rtx)

if not isHW():
    nftest_send_phy('nf0', pkts)
    nftest_expect_phy('nf0', pkta)



nftest_barrier()

if isHW():
    # Now we expect to see the lut_hit and lut_miss registers incremented and we
    # verify this by doing a regread_expect
#    rres1= nftest_regread_expect(SUME_OUTPUT_PORT_LOOKUP_0_LUTHIT(), num_normal)
#    rres2= nftest_regread_expect(SUME_OUTPUT_PORT_LOOKUP_0_LUTMISS(), num_broadcast)
    # List containing the return values of the reg_reads
    mres=[]
else:
#    nftest_regread_expect(SUME_OUTPUT_PORT_LOOKUP_0_LUTHIT(), num_normal) # lut_hit
#    nftest_regread_expect(SUME_OUTPUT_PORT_LOOKUP_0_LUTMISS(), num_broadcast) # lut_miss
    mres=[]

#nftest_finish(mres)
nftest_finish([])



