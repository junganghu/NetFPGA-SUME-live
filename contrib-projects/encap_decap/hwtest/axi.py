#
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

################################################################################
#
#  NetFPGA-10G http://www.netfpga.org
#
#  Author:
#        Yilong Geng
#
#  Description:
#        Helper functions for monitor.py and generator.py
#
#
#  Copyright notice:
#        Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
#                                 Junior University
#
#  Licence:
#        This file is part of the NetFPGA 10G development base package.
#
#        This file is free code: you can redistribute it and/or modify it under
#        the terms of the GNU Lesser General Public License version 2.1 as
#        published by the Free Software Foundation.
#
#        This package is distributed in the hope that it will be useful, but
#        WITHOUT ANY WARRANTY; without even the implied warranty of
#        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#        Lesser General Public License for more details.
#
#        You should have received a copy of the GNU Lesser General Public
#        License along with the NetFPGA source package.  If not, see
#        http://www.gnu.org/licenses/.
#
#

import os, binascii, time, commands
from fcntl import *
from struct import *
from binascii import hexlify

SIOCDEVPRIVATE = 35312
NF10_IOCTL_CMD_READ_STAT = SIOCDEVPRIVATE + 0
NF10_IOCTL_CMD_READ_REG = SIOCDEVPRIVATE + 2
NF10_IOCTL_CMD_WRITE_REG_PY = SIOCDEVPRIVATE + 9

def rdaxi(addr):
    #value=commands.getoutput("./lib/rdaxi " + str(addr))
    value=commands.getoutput("../sw/host/apps/rdaxi " + str(addr))
    read_data = int(value, 16);
    value = hex(read_data & int("0xffffffff", 16))
    return value

def wraxi(addr, value):
    os.system("../sw/host/apps/wraxi "+str(addr)+" "+str(value))

def add_hex(hex1, hex2):

    return hex(int(hex1, 16) + int(hex2, 16))

def hex2ip(hex1):
    hex1 = hex(int(hex1, 16) & int("0xffffffff", 16))
    ip = ""
    for i in range(4):
        ip = ip + '.' + str((int(hex1, 16)>>((3-i)*8)) & int("0xff", 16))
    ip = ip[1:]
    return ip

def ip2hex(ip):
    hex1 = 0
    for tok in ip.split('.'):
        hex1 = (hex1 << 8) + int(tok)
    return hex(hex1 & int("0xffffffff", 16))

# get one bit of value, both int
def get_bit(value, bit):
    return ((value & (2**bit)) >> bit)

def set_bit(value, bit):
    return (value | (2**bit))

def clear_bit(value, bit):
    return (value & (int("0xffffffff", 16) - 2**bit))
