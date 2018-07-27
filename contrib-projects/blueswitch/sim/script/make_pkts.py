#!/usr/bin/python
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
# @NETFPGA_LICENSE_HEADER_END

from __future__ import with_statement

import os
import sys
import argparse

#Current directory
script_dir = os.path.dirname( sys.argv[0] )

#Axitools converts packet into axi stream format
import axitools
from scapy.all import wrpcap
from scapy.layers.all import Ether, IP, TCP, UDP, ARP, ICMP, Dot1Q

#Input arguments
parser = argparse.ArgumentParser()
parser.add_argument("--packet_length", help="Length of packet in no of bytes")
parser.add_argument("--packet_no", help="No of packets")
parser.add_argument("--port_no", help="Port no of packets for Tx or Rx")
parser.add_argument("--txrx", type=str, help="rx o tx for indicating receive or transmit packets")
parser.add_argument("--data_width", help="axi stream bus data width")
parser.add_argument("--packet_type", type=str, help="ARP, TCP, UDP,...")
parser.add_argument("--src_ip", type=str, help="Source IP address")
parser.add_argument("--dst_ip", type=str, help="Destination IP address")
parser.add_argument("--vlan", help="Add VLAN number in hex 0x")
parser.add_argument("--align", help="Add null before header for alignment")
parser.add_argument("--sport_no", help="Source Port Number")
parser.add_argument("--dport_no", help="Destination Port Number")

args = parser.parse_args()

if (args.vlan):
    vlan_no=int(args.vlan)
else:
    vlan_no=0

tag_val = Dot1Q(vlan=vlan_no)

#Length of Packets
if (args.packet_length):
	pkt_length = args.packet_length
else:
	# Default length of packets
	pkt_length = '16'

#No of packets for tx or rx
if (args.packet_no):
	no_pkt = args.packet_no
else:
	#Default number of packets
	no_pkt = '2'

#Port no to send or receive packets
#TUSER source and destination values
#Rx port 0 = 0x01, Rx port 1 = 0x04, Rx port 2 = 0x10, Rx port 3 = 0x40
#Tx port 0 = 0x02, Tx port 1 = 0x08, Tx port 2 = 0x20, Tx port 3 = 0x80
if (args.txrx == 'rx'):
	if (args.port_no == '0'): no_port = 1
	elif (args.port_no == '1'): no_port = 4
	elif (args.port_no == '2'): no_port = 16
	elif (args.port_no == '3'): no_port = 64
	else: no_port_no = 1
elif (args.txrx == 'tx'):
	if (args.port_no == '0'): no_port = 2
	elif (args.port_no == '1'): no_port = 8
	elif (args.port_no == '2'): no_port = 32
	elif (args.port_no == '3'): no_port = 128
	else: no_port = 2
else:
	no_port = 1

#Axi stream data width
if (args.data_width):
	axi_width=int(args.data_width)
else:
	axi_width='256'

#Source and Destination IP address allocation
if (args.src_ip):
	src_ip_addr=args.src_ip
else:
	src_ip_addr='192.168.1.1'

if (args.dst_ip):
	dst_ip_addr=args.dst_ip
else:
	dst_ip_addr='192.168.1.2'

#Source and Destination port number
if (args.sport_no):
	ip_sport_no=int(args.sport_no)
else:
	ip_sport_no=10

if (args.dport_no):
	ip_dport_no=int(args.dport_no)
else:
	ip_dport_no=15

#Payload appended to packet header
payload_data = ''
for i in range(int(pkt_length)):
	payload_data = payload_data + 'A'# Payload contents are not important.

payload_data = payload_data + 'Cd'

align_byte='\0\0'
pad_18='\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0' #Padding end of packet for ARP test.


pkts_arp=[]
#A simple TCP/IP packet embedded in an Ethernet II frame


for i in range(int(no_pkt)):
   if (args.align == '1'):
        if (args.vlan):
	    pkt = (align_byte/Ether(src='ff:22:33:44:55:66', dst='77:88:99:aa:bb:cc')/
                   Dot1Q(vlan=vlan_no)/
		   ARP(psrc=src_ip_addr, pdst=dst_ip_addr)/pad_18)
	    pkt.time = i*(1e-8)
	    pkt.tuser_sport = no_port
	    pkts_arp.append(pkt)
        else:
	    pkt = (align_byte/Ether(src='ff:22:33:44:55:66', dst='77:88:99:aa:bb:cc')/
		   ARP(psrc=src_ip_addr, pdst=dst_ip_addr)/pad_18)
	    pkt.time = i*(1e-8)
	    pkt.tuser_sport = no_port
	    pkts_arp.append(pkt)
   else:
        if (args.vlan):
	    pkt = (Ether(src='ff:22:33:44:55:66',dst='77:88:99:aa:bb:cc')/
                   Dot1Q(vlan=vlan_no)/
	  	   ARP(psrc=src_ip_addr, pdst=dst_ip_addr)/pad_18)
	    pkt.time = i*(1e-8)
	    pkt.tuser_sport = no_port
	    pkts_arp.append(pkt)
        else:
	    pkt = (Ether(src='ff:22:33:44:55:66', dst='77:88:99:aa:bb:cc')/
		   ARP(psrc=src_ip_addr, pdst=dst_ip_addr)/pad_18)
	    pkt.time = i*(1e-8)
	    pkt.tuser_sport = no_port
	    pkts_arp.append(pkt)


pkts_tcp=[]
#A simple TCP/IP packet embedded in an Ethernet II frame
for i in range(int(no_pkt)):
   if (args.align == '1'):
        if (args.vlan):
	    pkt = (align_byte/Ether(src='ff:22:33:44:55:66', dst='77:88:99:aa:bb:cc')/
                   Dot1Q(vlan=vlan_no)/
	 	   IP(src=src_ip_addr, dst=dst_ip_addr)/
		   TCP()/payload_data)
	    pkt.time = i*(1e-8)
	    pkt.tuser_sport = no_port
	    pkts_tcp.append(pkt)
        else:
	    pkt = (align_byte/Ether(src='ff:22:33:44:55:66', dst='77:88:99:aa:bb:cc')/
		   IP(src=src_ip_addr, dst=dst_ip_addr)/
		   TCP()/payload_data)
	    pkt.time = i*(1e-8)
	    pkt.tuser_sport = no_port
	    pkts_tcp.append(pkt)
   else:
        if (args.vlan):
	    pkt = (Ether(src='ff:22:33:44:55:66', dst='77:88:99:aa:bb:cc')/
                   Dot1Q(vlan=vlan_no)/
		   IP(src=src_ip_addr, dst=dst_ip_addr)/
		   TCP()/payload_data)
	    pkt.time = i*(1e-8)
	    pkt.tuser_sport = no_port
	    pkts_tcp.append(pkt)
        else:
	    pkt = (Ether(src='ff:22:33:44:55:66', dst='77:88:99:aa:bb:cc')/
		   IP(src=src_ip_addr, dst=dst_ip_addr)/
		   TCP()/payload_data)
	    pkt.time = i*(1e-8)
	    pkt.tuser_sport = no_port
	    pkts_tcp.append(pkt)

pkts_udp=[]
#A simple UDP/IP packet embedded in an Ethernet II frame
for i in range(int(no_pkt)):
   if (args.align == '1'):
        if (args.vlan):
	    pkt = (align_byte/Ether(src='ff:22:33:44:55:66', dst='77:88:99:aa:bb:cc')/
                   tag_val/
	 	   IP(src=src_ip_addr, dst=dst_ip_addr)/
		   UDP(sport=ip_sport_no, dport=ip_dport_no)/payload_data)
	    pkt.time = i*(1e-8)
	    pkt.tuser_sport = no_port
	    pkts_udp.append(pkt)
        else:
	    pkt = (align_byte/Ether(src='ff:22:33:44:55:66', dst='77:88:99:aa:bb:cc')/
		   IP(src=src_ip_addr, dst=dst_ip_addr)/
		   UDP(sport=ip_sport_no, dport=ip_dport_no)/payload_data)
	    pkt.time = i*(1e-8)
	    pkt.tuser_sport = no_port
	    pkts_udp.append(pkt)
   else:
        if (args.vlan):
	    pkt = (Ether(src='ff:22:33:44:55:66', dst='77:88:99:aa:bb:cc')/
                   tag_val/
		   IP(src=src_ip_addr, dst=dst_ip_addr)/
		   UDP(sport=ip_sport_no, dport=ip_dport_no)/payload_data)
	    pkt.time = i*(1e-8)
	    pkt.tuser_sport = no_port
	    pkts_udp.append(pkt)
        else:
	    pkt = (Ether(src='ff:22:33:44:55:66', dst='77:88:99:aa:bb:cc')/
		   IP(src=src_ip_addr, dst=dst_ip_addr)/
		   UDP(sport=ip_sport_no, dport=ip_dport_no)/payload_data)
	    pkt.time = i*(1e-8)
	    pkt.tuser_sport = no_port
	    pkts_udp.append(pkt)


pkts=[]
#Select packet type for axi stream data generation
if (args.packet_type == 'ARP' or args.packet_type == 'arp'): pkts=pkts_arp
elif (args.packet_type == 'TCP' or args.packet_type == 'tcp'): pkts=pkts_tcp
elif (args.packet_type == 'UDP' or args.packet_type == 'udp'): pkts=pkts_udp
else: 
   pkts=pkts_tcp

#TODO Selecting type by input options.
#Dump packet data in axi stream formats.
with open( os.path.join( script_dir, 'packet_stim_%s_%x.axi' % (args.txrx, int(args.port_no)) ), 'w' ) as f:
    axitools.axis_dump( pkts, f, axi_width, 1e-9 )
wrpcap(os.path.join( script_dir, 'packet_stim_%s_%x.pcap' % (args.txrx, int(args.port_no)) ), pkts)

print 'Finish packet generation!'
