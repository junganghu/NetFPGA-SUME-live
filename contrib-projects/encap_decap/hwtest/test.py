#! /usr/bin/env python

################################################################################
# Copyright (c) 2015 University of Cambridge
# Copyright (c) 2017 Neelakandan Manihatty Bojan
# All rights reserved.
#
# This software was developed by
# Stanford University and the University of Cambridge Computer Laboratory
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


import os
from axi import *
from time import sleep
from math import ceil
import argparse
import subprocess
import sys
import shutil # removing directory with contents
import signal # when killing process
import glob   # for walking through files
import re
 
DATAPATH_FREQUENCY = 160000000

REORDER_OUTPUT_QUEUES_BASE_ADDR = "0x76000000"
VLAN_ADDER_BASE_ADDR   = "0x44090000"
VLAN_REMOVER_BASE_ADDR = "0x440a0000"
testList = ["both_test_qlimit", "Vlan Adder", "Vlan Muxing", "Vlan Demuxing", "Checking sequence numbers"]
DELAY_BASE_ADDR = {0 : "0x79c60000",
                   1 : "0x79c40000",
                   2 : "0x79c20000",
                   3 : "0x79c00000"}

parser = argparse.ArgumentParser(description='Argument Parser')
parser.add_argument('--delay', help='delay values for each queue', nargs=4, default=[0, 0, 0, 0], type=int)
parser.add_argument('--dropLoop', help='drop_loop for each queue', nargs=4, default=[0, 0, 0, 0], type=int)
parser.add_argument('--dropCount', help='drop_count for each queue', nargs=4, default=[0, 0, 0, 0], type=int)
parser.add_argument('--splitRatio', help='split_ratio for each queue', nargs=4, default=[1, 0, 0, 0], type=int)
parser.add_argument('--printDrop', help='print drop counters', action='store_true')
parser.add_argument('--printDelay', help='print delays', action='store_true')
parser.add_argument('--printSplitRatio', help='print split ratios', action='store_true')

class VlanAdder:

    def __init__(self):
        self.module_base_addr = VLAN_ADDER_BASE_ADDR
        self.vlan_adder_reg_offset = ["0x00", "0x04", "0x08","0x0C", "0x10", "0x14", "0x18", "0x1c", "0x20"]
        self.vlan_adder_values  = len(self.vlan_adder_reg_offset)*[0]

    def get_vlan_adder_values(self):
        for i in range(len(self.vlan_adder_values)):
            vlan_adder_value = rdaxi(self.reg_addr(self.vlan_adder_reg_offset[i]))
            self.vlan_adder_values[i] = int(vlan_adder_value, 16)

    def print_vlan_adder_values(self):
        for i in range(len(self.vlan_adder_values)):
            print "Reg " + str(i) + " Value is : " + str(self.vlan_adder_values[i])

    def reg_addr(self, offset):
        return add_hex(self.module_base_addr, offset)

    def set_seq_number_limits(self, start_seq, end_seq):

        wraxi(self.reg_addr("0x1c"), hex(start_seq))
	self.update_current_seq_num_value() # Used to initialize the seq number generator counter to the above new value
        wraxi(self.reg_addr("0x20"), hex(end_seq))
        self.get_seq_number_limits()

    def update_current_seq_num_value(self):
        wraxi(self.reg_addr("0x10"), hex(1))
        wraxi(self.reg_addr("0x10"), hex(0))

	
    def get_seq_number_limits(self):

        current_seq_number_starts = rdaxi(self.reg_addr("0x1c"))
        current_seq_number_ends = rdaxi(self.reg_addr("0x20"))
	print "current_seq_number_starts : "+ current_seq_number_starts 
	print "current_seq_number_ends   : "+ current_seq_number_ends 

    def runTest(self,test):
	run = 'run.py'
        designDIr = os.path.abspath(os.environ['NF_DESIGN_DIR'])
	testRoot = 'test'
	testDir = designDIr + '/' + testRoot + '/' + test	
	print testDir
	if os.path.exists(testDir) and os.path.isdir(testDir):
		os.chdir(testDir)
		cwd = os.getcwd()	
		print cwd
 	subprocess.call(['python',run,"--hw" ])
	tdir = designDIr + '/' + "hwtest" + '/'	
	os.chdir(tdir)

class VlanRemover:

    def __init__(self):
        self.module_base_addr = VLAN_REMOVER_BASE_ADDR
        self.etc_reg_offset = ["0x00", "0x04", "0x08","0x0C", "0x10", "0x14", "0x18",
	"0x1c",
	"0x20",
	"0x24",
	"0x28",
	"0x2c",
	"0x30",
	"0x34",
	"0x38",
	"0x3c",
	"0x40",
	"0x44",
	"0x48",
	"0x4c"]

        self.etc_counts = len(self.etc_reg_offset)*[0]

        #self.etc_counts()

    def runTest(self,test):
	self.initialize()
	run = 'run.py'
        designDIr = os.path.abspath(os.environ['NF_DESIGN_DIR'])
	testRoot = 'test'
	testDir = designDIr + '/' + testRoot + '/' + test	
	print testDir
	if os.path.exists(testDir) and os.path.isdir(testDir):
		os.chdir(testDir)
		cwd = os.getcwd()	
		print cwd
 	subprocess.call(['python',run,"--hw" ])
	tdir = designDIr + '/' + "hwtest" + '/'	
	os.chdir(tdir)

    # Used to initialize the past value to dad
  	
    def initialize(self):
        wraxi(self.reg_addr("0x10"), hex(1))
        wraxi(self.reg_addr("0x10"), hex(0))

    def reg_addr(self, offset):
        return add_hex(self.module_base_addr, offset)
		
def make_test_dir():
    # Check if a test directory in the name already exists
    # if so delete it 

    if os.path.exists(mytestDir):
	## Try to remove tree; if failed show an error using try...except on screen
	#try:
	#	shutil.rmtree(mydir)
	#	except OSError, e:
	#	print ("Error: %s - %s." % (e.filename,e.strerror))
        shutil.rmtree(mytestDir)	
	print 'removing existing directory'
    	os.makedirs(mytestDir)
   	print 'New test directory made\n'
    else:
    	print 'No test directory, so making it\n'
    	os.makedirs(mytestDir)
    # if not make a new directory

def start_pkt_dump():	

    # Go inside the test directory 
    os.chdir(mytestDir)
    os.system("tcpdump -e -i eth1 -w eth1.pcap &") 	
    os.system("tcpdump -e -i eth2 -w eth2.pcap &") 	
    os.system("tcpdump -e -i eth3 -w eth3.pcap &") 	
    os.system("tcpdump -e -i eth4 -w eth4.pcap &") 	
    os.chdir(tdir)


def stop_pkt_dump():	
   #find_pid = "$(ps -e | pgrep tcpdump | awk '{print $0}')"
   #print find_pid
   #pids=os.system("ps -e | pgrep tcpdump | awk '{print $0}'")
   #print pids
   
   os.chdir(mytestDir)
   os.system("ps -e | pgrep tcpdump | awk '{print $0}' > tmp")
   lines = []
   with open("tmp",'r') as file:
   	for line in file:
        	line = line.strip() #or someother preprocessing
        	lines.append(line)
   print lines
   
   # Start killing each of the process
   for i in range(len(lines)):
	#os.system("kill -9 "+ lines[i])
        #signal.CTRL_C_EVENT
        os.kill(int(lines[i]), signal.SIGINT)
	print "killed ", lines[i]	
	

   print open('tmp', 'r').read()
   os.chdir(tdir)


def post_process_pkts():
   os.chdir(mytestDir)
   os.system("for i in `ls -v *.pcap`; do tcpdump -r $i -xx > $i.conv; done")
   resultsDir=mytestDir+"/"+results

   # Adding a new line to make the processing easy 
   # (only if final line is empty, the last packet gets printed)	
   for file in glob.glob("*.*.conv"):
	f= open(file,'a+')
	f.write('\n')

   # Creating a new directory to store the results

   if os.path.exists(resultsDir):
        shutil.rmtree(resultsDir)	
	print 'removing existing directory'
    	os.makedirs(resultsDir)
   	print 'New results directory made\n'
   else:
    	print 'No results directory, so making it\n'
    	os.makedirs(resultsDir)
    # if not make a new directory

   # Logic to count the number of packets in each *.*.conv file
   for file in glob.glob("*.*.conv"):
			
   	print(file) 
        pcap_file = open(file)
	
        # creating the result file (for example eth1_result.log)
        base_name = file.split(".")[0]
        f=open(base_name+"_result.log","w")
        
	pkt_count = 0
        pkts = [] 
	pkt_data = ""
        show_out = ""


        for line_data in pcap_file.readlines():
           line_array_data=re.findall(r"[\S']+", line_data)
        
           if (line_array_data == []):
                 #print "EOF"
                 #print show_out
                 #print pkt_count
                 f.write(show_out+"\n")
                 #f.write(str(pkt_count)+"\n") // Will do this finally. Now clashes with diff
                 #f.flush()
                 pkt_data= ""   
 
           elif (bool(re.compile(r'(0x)(\w+)(?=\:$)').match(line_array_data[0]))):
                 #print "elif"
                 pkt_line_data = "".join(line_array_data[1:])
                 pkt_data=pkt_data+pkt_line_data
                 show_out= pkt_data
                 if (line_array_data[0] == "0x0000:"):
                     #print "happening"
                     pkt_count=pkt_count+1
        
           else :
		 # The first time this line executes, it creates an empty line. TODO 

                 #print "else"
                 #print show_out
                 f.write(show_out+"\n")
                 #f.flush()
                 pkt_data= ""
   f.close()
   os.system("mv *.log"+" "+resultsDir) 
   os.chdir(tdir)

### start


def both_test_qlimit():
    # run the tests  
    for i in range(2):
	for j in range (2):
		print i , 5+j
    		vlanAdder.set_seq_number_limits(i,5+j)
		time.sleep(1)
		print options[Testno].__name__
    		vlanAdder.runTest(options[Testno].__name__)

def both_vlan_muxing():
    #vlanAdder.set_seq_number_limits(0,15)
    time.sleep(1)
    print options[Testno].__name__
    #vlanRemover.initialize() # will be called by runTest
    vlanRemover.runTest(options[Testno].__name__)

def both_vlan_demuxing():
    vlanAdder.set_seq_number_limits(0,15)
    time.sleep(1)
    print options[Testno].__name__
    #vlanRemover.initialize() # will be called by runTest
    vlanAdder.runTest(options[Testno].__name__)

def both_arp_ip():
    vlanAdder.set_seq_number_limits(0,15)
    time.sleep(1)
    print options[Testno].__name__
    #vlanRemover.initialize() # will be called by runTest
    vlanAdder.runTest(options[Testno].__name__)


### t1

def both_test_qlimit_results():
    os.chdir(resultsDir)

    if os.path.exists(ologDir):
        shutil.rmtree(ologDir)	
	print 'removing existing directory'
    	os.makedirs(ologDir)
   	print 'New original log directory made\n'
    else:
    	print 'No original log directory found, so making it\n'
    	os.makedirs(ologDir)

    # copying the log files to the olog directory
    os.system("cp -r *.log olog") 

    fr=open("final_results.txt","w+")
    fr.write('{0} {1} {2}\n'.format("base_name", "ordinary_pkt_count", "vlan_pkt_count"))
    for file in glob.glob("*.log"):
    #for file in glob.glob("eth2_result.log"):
            print(file)
            log_file = open(file)
    
            base_name = file.split(".")[0]
            f=open(base_name+"_vlan_removed.log","w+")
            s=open(base_name+"_seq_no.log","w+")
    
            ordinary_pkt_count = 0
            vlan_pkt_count = 0
            pkts = []
            pkt_data = ""
            show_out = ""
    
            for line_data in log_file.readlines():
                    print "vlan sequence number"
                    if (line_data[24:28]=='8100'):
                            print line_data[28:32]
                            s.write(line_data[28:32]+"\n")
    
                            #m = re.search('8100(.{4})', line_data)
                            #if m:
                            #    found = m.group(1)
                            #    print m.group(1)
                            print "After Removing Vlan header"
                            newtext=line_data.replace(line_data[24:32],"")
                            print newtext
                            fcs_removed = newtext[:-9]
                            print fcs_removed
                            f.write(fcs_removed+"\n")
			    vlan_pkt_count = vlan_pkt_count + 1
	
		    elif line_data in ['\n', '\r\n']:	
        		    print "Empty lines"
	
                    else:
                            print "These are not VLAN packets"
			    ordinary_pkt_count = ordinary_pkt_count + 1

	    fr.write('{0} {1} {2}\n'.format(base_name, ordinary_pkt_count, vlan_pkt_count))
	    print(str(base_name)+" "+str(ordinary_pkt_count)+" "+str(vlan_pkt_count))
	    print("----------------------------------------------------------------------------------------------------------------------->")

	    #outfile.write('{0}\n'.format(word1, word2))
    
            s.close() # sequence number file
            f.close() # vlan number file
 
    fr.close() # final results file is closed

    if os.path.exists(plogDir):
        shutil.rmtree(plogDir)	
	print 'removing existing directory'
    	os.makedirs(plogDir)
   	print 'New original log directory made\n'
    else:
    	print 'No original log directory found, so making it\n'
    	os.makedirs(plogDir)


    # Adding a new line for the log files to do a clean diff with *_results.log
    os.system(r"sed -s -i '1i\\' *_vlan_removed.log") 
    os.system(r"sed -s -i '1i\\' *_seq_no.log") 
 
   
    os.system("cp -r *_vlan_removed.log plog") 
    os.system("cp -r *_seq_no.log plog") 
    os.system("rm -f *.log") 
    
    os.chdir(plogDir)
    os.system("cmp --silent eth2_result_vlan_removed.log ../olog/eth3_result.log && echo '### SUCCESS: Files Are Identical! ###' || echo '### WARNING: Files Are Different! ###'")
    print "Testing Sequence numbers"
    os.system("cmp --silent eth1_result_seq_no.log ../../../chk_result.log && echo '### SUCCESS: Files Are Identical! ###' || echo '### WARNING: Files Are Different! ###'")
    os.system("cmp --silent eth2_result_seq_no.log ../../../chk_result.log && echo '### SUCCESS: Files Are Identical! ###' || echo '### WARNING: Files Are Different! ###'")
    os.chdir(tdir)

### t2

def both_vlan_muxing_results():
    os.chdir(resultsDir)

    if os.path.exists(ologDir):
        shutil.rmtree(ologDir)	
	print 'removing existing directory'
    	os.makedirs(ologDir)
   	print 'New original log directory made\n'
    else:
    	print 'No original log directory found, so making it\n'
    	os.makedirs(ologDir)

    # copying the log files to the olog directory
    os.system("cp -r *.log olog") 

    fr=open("final_results.txt","w+")
    fr.write('{0} {1} {2}\n'.format("base_name", "ordinary_pkt_count", "vlan_pkt_count"))
    for file in glob.glob("*.log"):
    #for file in glob.glob("eth2_result.log"):
            print(file)
            log_file = open(file)
    
            base_name = file.split(".")[0]
            f=open(base_name+"_vlan_removed.log","w+")
            s=open(base_name+"_seq_no.log","w+")
    
            ordinary_pkt_count = 0
            vlan_pkt_count = 0
            pkts = []
            pkt_data = ""
            show_out = ""
    
            for line_data in log_file.readlines():
                    #print "vlan sequence number"
                    if (line_data[24:28]=='8100'):
                            #print line_data[28:32]
                            s.write(line_data[28:32]+"\n")
    
                            #m = re.search('8100(.{4})', line_data)
                            #if m:
                            #    found = m.group(1)
                            #    print m.group(1)
                            #print "After Removing Vlan header"
                            newtext=line_data.replace(line_data[24:32],"")
                            #print newtext
                            # while removing the last 8 characters (FCS), the new line \n also gets removed
                            # so when writing into a new file, we need to include the new line.

			    f.write(newtext)
			    vlan_pkt_count = vlan_pkt_count + 1
	
		    elif line_data in ['\n', '\r\n']:	
        		    print "Empty lines"

	
                    else:
                    	    #print "These are not VLAN packets"
                            fcs_removed = line_data[:-9]
                            #print fcs_removed
                            f.write(fcs_removed+"\n")
			    ordinary_pkt_count = ordinary_pkt_count + 1

	    fr.write('{0} {1} {2}\n'.format(base_name, ordinary_pkt_count, vlan_pkt_count))
	    print(str(base_name)+" "+str(ordinary_pkt_count)+" "+str(vlan_pkt_count))
	    print("----------------------------------------------------------------------------------------------------------------------->")

	    #outfile.write('{0}\n'.format(word1, word2))
    
            s.close() # sequence number file
            f.close() # vlan number file
 
    fr.close() # final results file is closed

    if os.path.exists(plogDir):
        shutil.rmtree(plogDir)	
	print 'removing existing directory'
    	os.makedirs(plogDir)
   	print 'New original log directory made\n'
    else:
    	print 'No original log directory found, so making it\n'
    	os.makedirs(plogDir)


    # Adding a new line for the log files to do a clean diff with *_results.log
    os.system(r"sed -s -i '1i\\' *_vlan_removed.log") 
    os.system(r"sed -s -i '1i\\' *_seq_no.log") 
 
   
    os.system("cp -r *_vlan_removed.log plog") 
    os.system("cp -r *_seq_no.log plog") 
    os.system("rm -f *.log") 
    
    os.chdir(plogDir)
    os.system("echo 'cmp --silent eth3_result_vlan_removed.log eth2_result_vlan_removed.log'")
    os.system("cmp --silent eth3_result_vlan_removed.log eth2_result_vlan_removed.log && echo '### SUCCESS: Files Are Identical! ###' || echo '### WARNING: Files Are Different! ###'")
    os.chdir(tdir)

### t3

def both_vlan_demuxing_results():
    os.chdir(resultsDir)

    if os.path.exists(ologDir):
        shutil.rmtree(ologDir)
        print 'removing existing directory'
        os.makedirs(ologDir)
        print 'New original log directory made\n'
    else:
        print 'No original log directory found, so making it\n'
        os.makedirs(ologDir)

    # copying the log files to the olog directory
    os.system("cp -r *.log olog")

    fr=open("final_results.txt","w+")
    fr.write('{0} {1} {2}\n'.format("base_name", "ordinary_pkt_count", "vlan_pkt_count"))
    for file in glob.glob("*.log"):
    #for file in glob.glob("eth2_result.log"):
            print(file)
            log_file = open(file)

            base_name = file.split(".")[0]
            f=open(base_name+"_vlan_removed.log","w+")
            s=open(base_name+"_seq_no.log","w+")

            ordinary_pkt_count = 0
            vlan_pkt_count = 0
            pkts = []
            pkt_data = ""
            show_out = ""

            for line_data in log_file.readlines():
                    #print "vlan sequence number"
                    if (line_data[24:28]=='8100'):
                            #print line_data[28:32]
                            s.write(line_data[28:32]+"\n")

                            #m = re.search('8100(.{4})', line_data)
                            #if m:
                            #    found = m.group(1)
                            #    print m.group(1)
                            #print "After Removing Vlan header"
                            newtext=line_data.replace(line_data[24:32],"")
                            #print newtext
                            fcs_removed = newtext[:-9]
                            #print fcs_removed
                            f.write(fcs_removed+"\n")
                            vlan_pkt_count = vlan_pkt_count + 1

                    elif line_data in ['\n', '\r\n']:
                            print "Empty lines"

                    else:
                            #print "These are not VLAN packets"
                            ordinary_pkt_count = ordinary_pkt_count + 1


            fr.write('{0} {1} {2}\n'.format(base_name, ordinary_pkt_count, vlan_pkt_count))
            print(str(base_name)+" "+str(ordinary_pkt_count)+" "+str(vlan_pkt_count))
            print("----------------------------------------------------------------------------------------------------------------------->")

            #outfile.write('{0}\n'.format(word1, word2))

            s.close() # sequence number file
            f.close() # vlan number file

    fr.close() # final results file is closed

    if os.path.exists(plogDir):
        shutil.rmtree(plogDir)
        print 'removing existing directory'
        os.makedirs(plogDir)
        print 'New original log directory made\n'
    else:
        print 'No original log directory found, so making it\n'
        os.makedirs(plogDir)


    # Adding a new line for the log files to do a clean diff with *_results.log
    os.system(r"sed -s -i '1i\\' *_vlan_removed.log")
    os.system(r"sed -s -i '1i\\' *_seq_no.log")


    os.system("cp -r *_vlan_removed.log plog")
    os.system("cp -r *_seq_no.log plog")
    os.system("rm -f *.log")

    os.chdir(plogDir)
    os.system("echo 'Comparing eth2_result_vlan_removed.log ../olog/eth3_result.log'")
    os.system("cmp --silent eth2_result_vlan_removed.log ../olog/eth3_result.log && echo '### SUCCESS: Files Are Identical! ###' || echo '### WARNING: Files Are Different! ###'")
    os.system("echo 'Comparing eth1_result_vlan_removed.log ../olog/eth3_result.log'")
    os.system("cmp --silent eth1_result_vlan_removed.log ../olog/eth3_result.log && echo '### SUCCESS: Files Are Identical! ###' || echo '### WARNING: Files Are Different! ###'")
 

    os.chdir(tdir)

#t4
def both_arp_ip_results():
    os.chdir(resultsDir)

    if os.path.exists(ologDir):
        shutil.rmtree(ologDir)
        print 'removing existing directory'
        os.makedirs(ologDir)
        print 'New original log directory made\n'
    else:
        print 'No original log directory found, so making it\n'
        os.makedirs(ologDir)

    # copying the log files to the olog directory
    os.system("cp -r *.log olog")

    fr=open("final_results.txt","w+")
    fr.write('{0} {1} {2}\n'.format("base_name", "ordinary_pkt_count", "vlan_pkt_count"))
    for file in glob.glob("*.log"):
    #for file in glob.glob("eth2_result.log"):
            print(file)
            log_file = open(file)

            base_name = file.split(".")[0]
            f=open(base_name+"_vlan_removed.log","w+")
            s=open(base_name+"_seq_no.log","w+")

            ordinary_pkt_count = 0
            vlan_pkt_count = 0
            pkts = []
            pkt_data = ""
            show_out = ""

            for line_data in log_file.readlines():
                    #print "vlan sequence number"
                    if (line_data[24:28]=='8100'):
                            #print line_data[28:32]
                            s.write(line_data[28:32]+"\n")

                            #m = re.search('8100(.{4})', line_data)
                            #if m:
                            #    found = m.group(1)
                            #    print m.group(1)
                            #print "After Removing Vlan header"
                            newtext=line_data.replace(line_data[24:32],"")
                            #print newtext
                            fcs_removed = newtext[:-9]
                            #print fcs_removed
                            f.write(fcs_removed+"\n")
                            vlan_pkt_count = vlan_pkt_count + 1

                    elif line_data in ['\n', '\r\n']:
                            print "Empty lines"

                    else:
                            #print "These are not VLAN packets"
                            ordinary_pkt_count = ordinary_pkt_count + 1


            fr.write('{0} {1} {2}\n'.format(base_name, ordinary_pkt_count, vlan_pkt_count))
            print(str(base_name)+" "+str(ordinary_pkt_count)+" "+str(vlan_pkt_count))
            print("----------------------------------------------------------------------------------------------------------------------->")

            #outfile.write('{0}\n'.format(word1, word2))

            s.close() # sequence number file
            f.close() # vlan number file

    fr.close() # final results file is closed

    if os.path.exists(plogDir):
        shutil.rmtree(plogDir)
        print 'removing existing directory'
        os.makedirs(plogDir)
        print 'New original log directory made\n'
    else:
        print 'No original log directory found, so making it\n'
        os.makedirs(plogDir)


    # Adding a new line for the log files to do a clean diff with *_results.log
    os.system(r"sed -s -i '1i\\' *_vlan_removed.log")
    os.system(r"sed -s -i '1i\\' *_seq_no.log")


    os.system("cp -r *_vlan_removed.log plog")
    os.system("cp -r *_seq_no.log plog")
    os.system("rm -f *.log")

    os.chdir(plogDir)
    os.system("echo 'Comparing eth2_result_vlan_removed.log ../olog/eth3_result.log'")
    os.system("cmp --silent eth2_result_vlan_removed.log ../olog/eth3_result.log && echo '### SUCCESS: Files Are Identical! ###' || echo '### WARNING: Files Are Different! ###'")
    os.system("echo 'Comparing eth1_result_vlan_removed.log ../olog/eth3_result.log'")
    os.system("cmp --silent eth1_result_vlan_removed.log ../olog/eth3_result.log && echo '### SUCCESS: Files Are Identical! ###' || echo '### WARNING: Files Are Different! ###'")
 

    os.chdir(tdir)



if __name__=="__main__":

    args = parser.parse_args()
    vlanAdder = VlanAdder()
    vlanRemover = VlanRemover()
    vlanAdder.get_vlan_adder_values()	

    global options
    options = {  #0 :both_test_qlimit,
		 1 :both_vlan_muxing,
		 2 :both_vlan_demuxing
		 #3 :both_arp_ip
    }

    functions = {'both_test_qlimit_results': both_test_qlimit_results,
    		  'both_vlan_muxing_results': both_vlan_muxing_results,
    		  'both_vlan_demuxing_results': both_vlan_demuxing_results,	
    		  'both_arp_ip_results': both_arp_ip_results	
	}
 
    for x in options:
        print (x, options[x])
    #call_external()
    #sys.exit(0)

    print "Enter the test to run (1 or 2):",
    Testno = int(raw_input())
    designDIr = os.path.abspath(os.environ['NF_DESIGN_DIR'])
    switchRoot = 'hwtest'

    mytestDir = designDIr + '/' + switchRoot + '/' + options[Testno].__name__
    print mytestDir

    tdir = designDIr + '/' + "hwtest" + '/'	
    print tdir

    results = 'results'
    resultsDir=mytestDir+"/"+results
    print resultsDir

    # Original log directory holding pcaps 
    olog = 'olog'  
    ologDir=mytestDir+"/"+results+"/"+olog 
    print ologDir 

    # Post processed log directory holding the results
    plog = 'plog'
    plogDir=mytestDir+"/"+results+"/"+plog 
    print plogDir 


    make_test_dir()   
    start_pkt_dump()
    options[Testno]()
    time.sleep(10)
    stop_pkt_dump()
    time.sleep(10)
    post_process_pkts()

    ex1=options[Testno].__name__+'_results'
    print ex1
    functions[ex1]()

    #packet_stats()




        
