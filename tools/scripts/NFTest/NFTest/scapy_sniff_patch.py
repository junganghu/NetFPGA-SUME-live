#
# Copyright (c) 2015 University of Cambridge
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

import sys
import time

try:
    import scapy.all as scapy
except:
    try:
        import scapy as scapy
    except:
        sys.exit("Error: need to install scapy for packet handling")

# Override sniff from scapy to implement custom stopper
# from http://trac.secdev.org/scapy/wiki/PatchSelectStopperTimeout
def sniff(count=0, store=1, offline=None, prn = None, lfilter=None, L2socket=None, timeout=None, stopperTimeout=None, stopper = None, lst = [], *arg, **karg):
    """Sniff packets
sniff([count=0,] [prn=None,] [store=1,] [offline=None,] [lfilter=None,] + L2ListenSocket args) -> list of packets

  count: number of packets to capture. 0 means infinity
  store: wether to store sniffed packets or discard them
    prn: function to apply to each packet. If something is returned,
         it is displayed. Ex:
         ex: prn = lambda x: x.summary()
lfilter: python function applied to each packet to determine
         if further action may be done
         ex: lfilter = lambda x: x.haslayer(Padding)
offline: pcap file to read packets from, instead of sniffing them
timeout: stop sniffing after a given time (default: None)
stopperTimeout: break the select to check the returned value of
         stopper() and stop sniffing if needed (select timeout)
stopper: function returning true or false to stop the sniffing process
L2socket: use the provided L2socket
    """
    c = 0

    if offline is None:
        if L2socket is None:
            L2socket = scapy.conf.L2listen
        s = L2socket(type=scapy.ETH_P_ALL, *arg, **karg)
    else:
        s = PcapReader(offline)

    if timeout is not None:
        stoptime = time.time()+timeout
    remain = None

    if stopperTimeout is not None:
        stopperStoptime = time.time()+stopperTimeout
    remainStopper = None
    while 1:
        try:
            if timeout is not None:
                remain = stoptime-time.time()
                if remain <= 0:
                    break

            if stopperTimeout is not None:
                remainStopper = stopperStoptime-time.time()
                if remainStopper <=0:
                    if stopper and stopper():
                        break
                    stopperStoptime = time.time()+stopperTimeout
                    remainStopper = stopperStoptime-time.time()

                sel = scapy.select([s],[],[],remainStopper)
                if s not in sel[0]:
                    if stopper and stopper():
                        break
            else:
                sel = scapy.select([s],[],[],remain)

            if s in sel[0]:
                p = s.recv(scapy.MTU)
                if p is None:
                    break
                if lfilter and not lfilter(p):
                    continue
                if store:
                    lst.append(p)
                c += 1
                if prn:
                    r = prn(p)
                    if r is not None:
                        print r
                if count > 0 and c >= count:
                    break
        except KeyboardInterrupt:
            break
    s.close()
    return scapy.plist.PacketList(lst,"Sniffed")
