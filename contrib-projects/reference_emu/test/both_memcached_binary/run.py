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
#        Modified by Neelakandan Manihatty Bojan, Georgina Kalogeridou, Salvator Galea

import logging
logging.getLogger("scapy.runtime").setLevel(logging.ERROR)

from NFTest import *
from memlib import * 
from memcached_pcapgen import * 
import sys
import os
from scapy.layers.all import Ether, IP, TCP, UDP, Raw
from reg_defines_reference_emu import *



phy2loop0 = ('../connections/conn', [])
nftest_init(sim_loop = [], hw_config = [phy2loop0])


cfg_set_s1={ \
'dst-mac'	: 'BB:BB:BB:BB:BB:BB',\
'src-mac'	: 'AA:AA:AA:AA:AA:AA',\
'dont-fragment'	: 'yes',\
'protocol'	: 'binary',\
'key'		: 'Test_1',\
'success'	: 'yes',\
'opaque'	: '00110022',\
'request-id'	: 23,\
'src-port'	: 6666,\
'dst-port'	: 11211,\
'src-ip'	: '1.1.1.1',\
'dst-ip'	: '2.2.2.2',\
'flags'		: 'DEADBEEF',\
'value'		: 'TestVal1',\
'file'		: 'set_s1',\
'type'		: 'set',\
'expiration'	: 1\
}


nftest_start()


routerMAC = []
routerIP = []
for i in range(4):
    routerMAC.append("00:ca:fe:00:00:0%d"%(i+1))
    routerIP.append("192.168.%s.40"%i)

pkts = []
pkta = []
coll = []
rtx = []
pkt_num = 9


# SET 10 keys + 10 values
for i in range(pkt_num):
	cfg_set_s1['key'] = "Test_%d"%i
	cfg_set_s1['value'] = "TestVal%d"%i
	cfg_set_s1['type'] = "set" 
	(request, response) = generateMemcached(cfg_set_s1)
	(request_packet, response_packet) = generateUdpIp(cfg_set_s1, request, response)
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

#nftest_barrier()
# GET 10 keys + 10 values (succeed)
for i in range(pkt_num):
	cfg_set_s1['key'] = "Test_%d"%i
	cfg_set_s1['value'] = "TestVal%d"%i
	cfg_set_s1['type'] = "get"
	cfg_set_s1['success'] = "yes"	
	(request, response) = generateMemcached(cfg_set_s1)
	(request_packet, response_packet) = generateUdpIp(cfg_set_s1, request, response)
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

#nftest_barrier()
# GET 1 key that doesnt exist (failure)
cfg_set_s1['key'] = "Malaka"
cfg_set_s1['value'] = "TestVal%d"%i
cfg_set_s1['type'] = "get"
cfg_set_s1['success'] = "no"
(request, response) = generateMemcached(cfg_set_s1)
(request_packet, response_packet) = generateUdpIp(cfg_set_s1, request, response)
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

nftest_barrier()




# SET the same 10 keys + different 10 values
for i in range(pkt_num):
	cfg_set_s1['key'] = "Test_%d"%i
	cfg_set_s1['value'] = "Valeria%d"%i
	cfg_set_s1['type'] = "set" 
	cfg_set_s1['success'] = "yes"
	(request, response) = generateMemcached(cfg_set_s1)
	(request_packet, response_packet) = generateUdpIp(cfg_set_s1, request, response)
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

#nftest_barrier()
# GET the same 10 keys + different 10 values (succeed)
for i in range(pkt_num):
	cfg_set_s1['key'] = "Test_%d"%i
	cfg_set_s1['value'] = "Valeria%d"%i
	cfg_set_s1['type'] = "get"
	cfg_set_s1['success'] = "yes"	
	(request, response) = generateMemcached(cfg_set_s1)
	(request_packet, response_packet) = generateUdpIp(cfg_set_s1, request, response)
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

nftest_barrier()

## DELETE all odd keys (success)
for i in range(pkt_num):
	if((i+2)%2==0):
		cfg_set_s1['key'] = "Test_%d"%i
		cfg_set_s1['value'] = "TestVal%d"%i
		cfg_set_s1['type'] = "delete"
		(request, response) = generateMemcached(cfg_set_s1)
		(request_packet, response_packet) = generateUdpIp(cfg_set_s1, request, response)
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

#nftest_barrier()
## DELETE all odd keys again (failure)
for i in range(pkt_num):
	if((i+2)%2==0):
		cfg_set_s1['key'] = "Test_%d"%i
		cfg_set_s1['value'] = "TestVal%d"%i
		cfg_set_s1['type'] = "delete"
		cfg_set_s1['success'] = "no"
		(request, response) = generateMemcached(cfg_set_s1)
		(request_packet, response_packet) = generateUdpIp(cfg_set_s1, request, response)
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

nftest_barrier()
## GET all odd keys  (failure)
for i in range(pkt_num):
	if((i+2)%2==0):
		cfg_set_s1['key'] = "Test_%d"%i
		cfg_set_s1['value'] = "TestVal%d"%i
		cfg_set_s1['type'] = "get"
		cfg_set_s1['success'] = "no"
		(request, response) = generateMemcached(cfg_set_s1)
		(request_packet, response_packet) = generateUdpIp(cfg_set_s1, request, response)
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

#nftest_barrier()
## GET all even keys  (success)
for i in range(pkt_num):
	if((i+2)%2!=0):
		cfg_set_s1['key'] = "Test_%d"%i
		cfg_set_s1['value'] = "Valeria%d"%i
		cfg_set_s1['type'] = "get"
		cfg_set_s1['success'] = "yes"
		(request, response) = generateMemcached(cfg_set_s1)
		(request_packet, response_packet) = generateUdpIp(cfg_set_s1, request, response)
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
 
#nftest_barrier()   
if not isHW():
    nftest_send_phy('nf0', pkts)
    nftest_expect_phy('nf0', pkta)

scapy.all.wrpcap('MEMCACHED_BINARY', rtx)


nftest_barrier()


nftest_finish([])



