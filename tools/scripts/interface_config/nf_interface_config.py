#!/usr/bin/python

# Copyright (c) 2015 Neelakandan Manihatty Bojan
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
################################################################################
#  Description:
#        This is used to create customized conn and setup configuration files 
#        based on user interfaces. The user generated files needs to be placed 
#        in the projects's test folder. For further details about the location of  
#        conn and setup files please refer to 
#        https://github.com/NetFPGA/NetFPGA-SUME-public/wiki/Hardware-Tests


import re
import subprocess

eth_interfaces = []
nf_interfaces = []

def dumpConfig():
   ifconfig_file = open("ifconfig_dump", "w+")
   p = subprocess.Popen('ifconfig -a', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
   for line in p.stdout.readlines():
       ifconfig_file.write(line)
   ifconfig_file.close()

def processInterfaces():
   ifconfig_file = open("ifconfig_dump", "r+")
   log_file = open("log", "w")
   for line in ifconfig_file:
       match_eth_interfaces = re.match(r'\s*eth([0-9]+)', line)
       match_nf_interfaces = re.match(r'\s*nf([0-9]+)', line)
    	
       if match_eth_interfaces:
          eth_interfaces.append(match_eth_interfaces.group(0))
          newline1= "\nFound %s\n" % (match_eth_interfaces.group(0))
   	  log_file.write(newline1)
       elif match_nf_interfaces:
   	  nf_interfaces.append(match_nf_interfaces.group(0))
          newline1= "\nFound %s\n" % (match_nf_interfaces.group(0))
   	  log_file.write(newline1)
       else:
   	  newline1="No interface found"
   
   print"Following are the ethX interfaces found in your machine:"
   for i in eth_interfaces:
       print "%s" %i	

def getConfiguration():
   global first_interface
   global second_interface

   print"The hardware tests requires two interfaces, please choose your interfaces below:"
   first_interface =  raw_input("Enter your first interface : ").strip()
   second_interface = raw_input("Enter your second interface : ").strip()


def checkInterfaces(first_interface,second_interface):
   global result

   found_first  = first_interface in eth_interfaces
   found_second = second_interface in eth_interfaces
   result = found_first and found_second

def createHeader():
    return "#\n\
# Copyright (c) 2015 Neelakandan Manihatty Bojan\n\
# All rights reserved.\n\
#\n\
# This software was developed by Stanford University and the University of Cambridge Computer Laboratory \n\
# under National Science Foundation under Grant No. CNS-0855268,\n\
# the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and\n\
# by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ('MRC2'),\n\
# as part of the DARPA MRC research programme.\n\
#\n\
# @NETFPGA_LICENSE_HEADER_START@\n\
#\n\
# Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor\n\
# license agreements.  See the NOTICE file distributed with this work for\n\
# additional information regarding copyright ownership.  NetFPGA licenses this\n\
# file to you under the NetFPGA Hardware-Software License, Version 1.0 (the\n\
# \"License\"); you may not use this file except in compliance with the\n\
# License.  You may obtain a copy of the License at:\n\
#\n\
#   http://www.netfpga-cic.org\n\
#\n\
# Unless required by applicable law or agreed to in writing, Work distributed\n\
# under the License is distributed on an \"AS IS\" BASIS, WITHOUT WARRANTIES OR\n\
# CONDITIONS OF ANY KIND, either express or implied.  See the License for the\n\
# specific language governing permissions and limitations under the License.\n\
#\n\
# @NETFPGA_LICENSE_HEADER_END@\n\
#\n\
"

def createSetup(first_interface,second_interface):
    with open("setup","w") as f:
        f.write("#!/usr/bin/env python\n" + createHeader() +
"\n\
\n\
from subprocess import Popen, PIPE\n\
\n\
proc = Popen([\"ifconfig\",\"" +first_interface+ "\",\"192.168.100.1\"], stdout=PIPE)\n\
proc = Popen([\"ifconfig\",\"" +second_interface+ "\",\"192.168.101.1\"], stdout=PIPE)\n\
proc = Popen([\"ifconfig\",\"nf0\",\"192.168.200.1\"], stdout=PIPE)\n\
proc = Popen([\"ifconfig\",\"nf1\",\"192.168.201.1\"], stdout=PIPE)\n\
proc = Popen([\"ifconfig\",\"nf2\",\"192.168.202.1\"], stdout=PIPE)\n\
proc = Popen([\"ifconfig\",\"nf3\",\"192.168.203.1\"], stdout=PIPE)\n\
\n\
")

def createConn(first_interface,second_interface):
    with open("conn","w") as f:
        f.write(createHeader() +
"\n\
nf0:"+first_interface+"\n\
nf1:"+second_interface+"\n\
nf2:\n\
nf3:\n\
")


dumpConfig()
processInterfaces()
getConfiguration()
checkInterfaces(first_interface,second_interface)
if (result):
   createSetup(first_interface,second_interface)
   createConn(first_interface,second_interface)
else:
   print "Your desired interfaces doesn't match with the available interfaces. Please try again"





