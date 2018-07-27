#!/bin/bash
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

rm -f *.axi *.pcap*
rm -f ../tv/.axi

PKTLENGTH=19	# Byte
PKTNO=20			# Number of Packets
PORTNO=0			# 0~3
RXTX=rx			# Tx or Rx
DATAWTH=64		# EQ to INTEGER*32
PKTTYPE=UDP
SRCIP=192.168.1.1
DSCIP=192.168.1.2
SPORT_NO=50
DPORT_NO=53
VLAN=801
ALIGN=1

./make_pkts.py --packet_length $PKTLENGTH --packet_no $PKTNO --port_no $PORTNO --txrx $RXTX --data_width $DATAWTH --src_ip $SRCIP --dst_ip $DSCIP --packet_type $PKTTYPE --sport_no $SPORT_NO --dport_no $DPORT_NO

mv *.axi ../tv/

echo " " > ../tv/packet_stim_rx_1.axi
echo " " > ../tv/packet_stim_rx_2.axi
echo " " > ../tv/packet_stim_rx_3.axi
echo " " > ../tv/packet_stim_rx_4.axi

