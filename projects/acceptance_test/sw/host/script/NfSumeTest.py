#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# All rights reserved.
#
# File:
# sw/host/script/NfSumeTest.py
#
# Project:
# acceptance_test
#
# Author:
# Tinghui Wang (Steve)
# Neelakandan Manihatty Bojan (Modified "Run Auto Test" option to include just the default tests on 2nd June 2015) 
# 
# 
#
# Description:
# Python script for Automatic NetFPGA-SUME Acceptance Test
#
# This software was developed by
# Stanford University and the University of Cambridge Computer Laboratory under National Science Foundation under Grant No. CNS-0855268,
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
#   http://netfpga-cic.org
#
# Unless required by applicable law or agreed to in writing, Work distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
#
# @NETFPGA_LICENSE_HEADER_END@

import wx
import sys
import os
import inspect
import re
import time
import threading
import serial
import logging
import logging.config
import glob
try:
    import serial.tools.list_ports_posix as lpp
except ImportError:
    comports = None
from subprocess import Popen, PIPE

def NfSume_usb_lsusb_string(sysfs_path):
    bus, dev = os.path.basename(os.path.realpath(sysfs_path)).split('-')
    dev = lpp.popen(['cat', sysfs_path + '/devnum'])
    try:
        desc = lpp.popen(['lsusb', '-v', '-s', '%s:%s' % (bus, dev)])
        # descriptions from device
        iManufacturer = lpp.re_group('iManufacturer\s+\w+ (.+)', desc)
        iProduct = lpp.re_group('iProduct\s+\w+ (.+)', desc)
        iSerial = lpp.re_group('iSerial\s+\w+ (.+)', desc) or ''
        # descriptions from kernel
        idVendor = lpp.re_group('idVendor\s+0x\w+ (.+)', desc)
        idProduct = lpp.re_group('idProduct\s+0x\w+ (.+)', desc)
        # create descriptions. prefer text from device, fall back to the others
        return '%s %s %s' % (iManufacturer or idVendor, iProduct or idProduct, iSerial)
    except IOError:
        return base

def NfSume_comports():
    devices = glob.glob('/dev/ttyUSB*')
    return [(d, lpp.describe(d), lpp.hwinfo(d)) for d in devices]

if lpp.comports:
    lpp.usb_lsusb_string = NfSume_usb_lsusb_string
    comports = lpp.comports

# Dump Available COM Ports
def dumpComPortList():
    if comports:
        sys.stdout.write('\n--- Available COM Ports:\n')
        for port, desc, hwid in sorted(comports()):
            sys.stdout.write('--- %-20s %s\n' % (port, desc))

class NfSumeTest(object):
    localLogger = None
    """ Local Logger """

    # mainFrame - Main Gui Frame
    mainFrame = None

    '''
        nfSumeTestConfiguration
        =======================
        Configuration for NetFPGA-SUME Acceptance Test
        Label: Test Button Label String
        bitstream: Associated compiled bitstream
        project: Associated Project Name
        target: Test Target and Description
        button: Associated Button
        callback: Associated Callback function for test
    '''
    nfSumeTestConfiguration = {
        'CPLD': {
            'label': 'Test CPLD and FLash',
            'bitstream': 'nf_sume_gpio.bit',
            'project': 'gpio',
            'target': {'CPLD': 'CPLD, Flash and Configuration'},
            },
        'GPIO': {
            'label': 'Test GPIO',
            'bitstream': 'nf_sume_gpio.bit',
            'project': 'gpio',
            'target': { 'SD_Card': 'SD Card (4-bit SDIO)',
                        'GPIO_Test': 'GPIO Walking 1/0 on FMC and Pmod',
                        'FMC_Clocks': 'Clock Signals on FMC Connector'
                      },
            'button': None
        },
#        'Optional': {
#            'label': 'Optional Tests',
#            'bitstream': '',
#            'project': '',
#            'target': { ''},
#            'button': None
#        },
        'DDR3A': {
            'label': 'Test DDR3A',
            'bitstream': 'nf_sume_ddr3A.bit',
            'project': 'ddr3A',
            'target': { 'DDR3A_IIC': 'IIC R/W on DDR3A SODIMM',
                        'DDR3A_RW': 'Read/Write on DDR3A SODIMM'},
            'button': None
        },
        'DDR3B': {
            'label': 'Test DDR3B',
            'bitstream': 'nf_sume_ddr3B.bit',
            'project': 'ddr3B',
            'target': { 'DDR3B_IIC': 'IIC R/W on DDR3B SODIMM',
                        'DDR3B_RW': 'Read/Write on DDR3B SODIMM'},
            'button': None
        },
        'QDRA': {
            'label': 'Test QDRII+ A',
            'bitstream': 'nf_sume_qdrA.bit',
            'project': 'qdrA',
            'target': { 'QDRA_RW': 'QDR II+ A Read/Write' },
            'button': None
        },
        'QDRB': {
            'label': 'Test QDRII+ B',
            'bitstream': 'nf_sume_qdrB.bit',
            'project': 'qdrB',
            'target': { 'QDRB_RW': 'QDR II+ B Read/Write' },
            'button': None
        },
        'QDRC': {
            'label': 'Test QDRII+ C',
            'bitstream': 'nf_sume_qdrC.bit',
            'project': 'qdrC',
            'target': { 'QDRC_RW': 'QDR II+ C Read/Write' },
            'button': None
        },
        'SATA': {
            'label': 'Test SATA III',
            'bitstream': 'nf_sume_sata.bit',
            'project': 'sata',
            'target': { 'SATA': 'SATA III (6Gbps) Loopback' },
            'button': None
        },
        'PCIE': {
            'label': 'Test PCI-E Gen3 x8',
            'bitstream': 'nf_sume_pcie.bit',
            'project': 'pcie',
            'target': { 'PCIE': 'PCI-Express Gen3 (8Gbps) Loopback' },
            'button': None
        },
        'QTH': {
            'label': 'Test QTH',
            'bitstream': 'nf_sume_qth_gtwizard.bit',
            'project': 'qth_gtwizard',
            'target': { 'QTH': 'QTH Connector GTH Transceiver (12.5Gbps) Loopback'},
            'button': None
        },
        'FMC': {
            'label': 'Test FMC',
            'bitstream': 'nf_sume_fmc_gtwizard.bit',
            'project': 'fmc_gtwizard',
            'target': { 'FMC': 'FMC Connector GTH Transceiver (12.5Gbps) Loopback'},
            'button': None
        },
        '10G': {
            'label': 'Test 10G Loopback',
            'bitstream': 'nf_sume_10g_loopback.bit',
            'project': '10g_loopback',
            'target': { '10G_Loopback': '10G Ethernet Loopback'},
            'button': None
        }
    }

    '''
        nfSumeTestResult
        ================
        Data structure to hold results for each test target
    '''
    nfSumeDefaultConfiguration = {
        'CPLD': {
            'label': 'Test CPLD and FLash',
            'bitstream': 'nf_sume_gpio.bit',
            'project': 'gpio',
            'target': {'CPLD': 'CPLD, Flash and Configuration'},
            },
        'DDR3A': {
            'label': 'Test DDR3A',
            'bitstream': 'nf_sume_ddr3A.bit',
            'project': 'ddr3A',
            'target': { 'DDR3A_IIC': 'IIC R/W on DDR3A SODIMM',
                        'DDR3A_RW': 'Read/Write on DDR3A SODIMM'},
            'button': None
        },
        'DDR3B': {
            'label': 'Test DDR3B',
            'bitstream': 'nf_sume_ddr3B.bit',
            'project': 'ddr3B',
            'target': { 'DDR3B_IIC': 'IIC R/W on DDR3B SODIMM',
                        'DDR3B_RW': 'Read/Write on DDR3B SODIMM'},
            'button': None
        },
        'QDRA': {
            'label': 'Test QDRII+ A',
            'bitstream': 'nf_sume_qdrA.bit',
            'project': 'qdrA',
            'target': { 'QDRA_RW': 'QDR II+ A Read/Write' },
            'button': None
        },
        'QDRB': {
            'label': 'Test QDRII+ B',
            'bitstream': 'nf_sume_qdrB.bit',
            'project': 'qdrB',
            'target': { 'QDRB_RW': 'QDR II+ B Read/Write' },
            'button': None
        },
        'QDRC': {
            'label': 'Test QDRII+ C',
            'bitstream': 'nf_sume_qdrC.bit',
            'project': 'qdrC',
            'target': { 'QDRC_RW': 'QDR II+ C Read/Write' },
            'button': None
        },
        '10G': {
            'label': 'Test 10G Loopback',
            'bitstream': 'nf_sume_10g_loopback.bit',
            'project': '10g_loopback',
            'target': { '10G_Loopback': '10G Ethernet Loopback'},
            'button': None
        }
    }


    nfSumeTestResult = {}

    # Array for all serial ports
    serialArray = []
    # Serial Port Name selected for NetFPGA-SUME Board
    serialPortName = ''
    # Serial Connection
    serialCon = None
    # Compile Worker Threads Array
    compileWorkerThreads = []

    # Setup Serial Parameters
    # Baud Rate: 115200
    # Line Coding: 8 bits, 1 stop bit, no parity
    # Flow Control: None
    # rts, dtr: Not available
    baudrate = 115200
    bytesize = serial.EIGHTBITS
    parity = serial.PARITY_NONE
    stopbits = serial.STOPBITS_ONE
    xonxoff = False
    rtscts = False
    dsrdtr = False

    # Detailed Info Level
    verbose = False

    # CompileThreadLock
    lockCompile = threading.Lock()

    # Compiling Log
    bitIsCompiling = {}

    def __init__(self, guiEnable=True):
        self.localLogger = logging.getLogger('NfSumeTest')
        if guiEnable:
            self.localLogger.info('Start GUI...')
            app = wx.App(False)
            self.mainFrame = testFrame(None, self, 'NetFPGA-SUME Acceptance Test')
            self.RefreshSerial()
            app.MainLoop()
        else:
            print 'NetFPGA-SUME Acceptance Test'
            print '----------------------------'
            self.RefreshSerial()
        if not guiEnable:
            self.StartAutoTest()

    # Refresh Serial Ports
    def RefreshSerial(self):
        global comports
        self.localLogger.info('refresh Serial Ports')
        self.serialArray = []
        if comports:
            for port, desc, hwid in sorted(comports()):
                self.serialArray.append('%-20s %s' % (port, desc))
        self.localLogger.debug('serialArray updated: ' + '\n'.join(self.serialArray))
        if self.mainFrame == None:
            index = 0
            selectedIndex = -1
            while(selectedIndex > index or selectedIndex < 0):
                print ''
                print 'Please Select Serial Ports of NetFPGA-SUME Board:'
                for serialElement in self.serialArray:
                    print '[%02d]: %s' % (index, serialElement)
                    index += 1
                sys.stdout.write('Select Item Index: ')
                strIndex = sys.stdin.readline()
                selectedIndex = int(strIndex)
            self.serialPortName = self.serialArray[selectedIndex].split()[0]
            print 'Selected Serial Port: %s' % self.serialPortName
        else:
            self.localLogger.debug('send call to update GUI thread')
            wx.CallAfter(self.mainFrame.serialComboBox.SetItems, self.serialArray)

    # Start Auto Test
    def StartAutoTest(self):
        self.localLogger.debug('Try to connect serial port')
        self.connectSerial()
        if self.serialCon == None:
            return
        for testName in self.nfSumeDefaultConfiguration.keys():
            self.localLogger.debug('Entering *****************')
            if testName == 'CPLD':
                self.TestFlash(testName)
            else:
                self.TestInterface(testName)
        self.localLogger.debug('Destroy Progress Bar as all tests finished')
        if(self.mainFrame != None):
            wx.CallAfter(self.mainFrame.DestroyProgress)
        #if len(self.compileWorkerThreads) != 0:
        #	logger.info('See if All ')
        #	for workerStruct in self.compileWorkerThreads:
        #		workerStruct['worker'].join()
        #	wx.CallAfter(self.mainFrame.CreateProgress, ('Finish up Auto Test',
        #			100*len(self.compileWorkerThreads)))
        #	for workerStruct in self.compileWorkerThreads:
        #		if workerStruct['test'] == 'CPLD':
        #			self.TestFlash(workerStruct['test'])
        #		else:
        #			self.TestInterface(workerStruct['test'])
        #		self.compileWorkerThreads.remove(workerStruct)
        #	wx.CallAfter(self.mainFrame.DestroyProgress)
        self.PrintTestResult()

    # Print Test Result, Command Line Mode
    def PrintTestResult(self):
        for testName in self.nfSumeTestConfiguration.keys():
            for target in self.nfSumeTestConfiguration[testName]['target'].keys():
                if target in self.nfSumeTestResult.keys():
                    print '%-20s [%s]' % (self.nfSumeTestConfiguration[testName]['target'][target],
                            self.nfSumeTestResult[target])
                else:
                    print '%-20s [Skip]' % (self.nfSumeTestConfiguration[testName]['target'][target])

    # Connect Serial Port
    def connectSerial(self):
        try:
            self.serialCon = serial.Serial(port = self.serialPortName,
                             baudrate = self.baudrate, 
                             bytesize = self.bytesize, 
                             parity = self.parity, 
                             stopbits = self.stopbits,
                             timeout = 1,
                             xonxoff = False,
                             rtscts = False,
                             dsrdtr = False)
        except serial.SerialException, e:
            self.serialCon = None
            self.localLogger.error('Failed to Open serial port %s: Error Message - %s' % (self.serialPortName, e))
            if self.mainFrame != None:
                wx.CallAfter(self.mainFrame.DisplayErrorMessage, 
                    'Error: Cannot Access Serial Port %s\n Exception Message: %s' % (self.serialPortName, e))

    # CPLD/Flash Test Function
    def TestFlash(self, testName):
        if self.serialCon == None:
            self.connectSerial()
            if self.serialCon == None:
                return
        # Need to check bitstream avilibility
        projName = self.nfSumeTestConfiguration[testName]['project']
        destroyProgress = False
        self.localLogger.info('start testing %s' % projName)
        if self.mainFrame != None:
            wx.CallAfter(self.mainFrame.DisableTestButton, testName)
            if self.mainFrame.progressDlg != None:
                wx.CallAfter(self.mainFrame.UpdateProgress, 0, 'Test %s' % testName)
            else:
                destroyProgress = True
                wx.CallAfter(self.mainFrame.CreateProgress, 100, 'Test %s' % testName)
        if self.TestAndCompileProject(testName, projName):
            if not self.serialCon.isOpen():
                self.serialCon.open()
            if self.mainFrame != None and self.mainFrame.progressDlg == None:
                print '---------------------------------------------'
                print '[%s]: write bitstream to Flash section %d' % (projName, 1)
                print '---------------------------------------------'
            self.ProgramFlash(1, '../../../bitfiles/' + self.nfSumeTestConfiguration[testName]['bitstream'])
            if(len(self.serialCon.readlines()) > 0):
                self.nfSumeTestResult['CPLD'] = 'Passed'
            else:
                self.nfSumeTestResult['CPLD'] = 'Failed'
            self.serialCon.close()
            if self.mainFrame != None:
                wx.CallAfter(self.mainFrame.EnableTestButton, testName)
        if self.mainFrame != None:
            if self.mainFrame.progressDlg != None:
                wx.CallAfter(self.mainFrame.UpdateProgress, 100)
                wx.CallAfter(self.mainFrame.DisplaySummary)
                if destroyProgress:
                    wx.CallAfter(self.mainFrame.DestroyProgress)

    def TestInterface(self, testName):
        if self.serialCon == None:
            self.connectSerial()
            if self.serialCon == None:
                return
        destroyProgress = False
        projName = self.nfSumeTestConfiguration[testName]['project']
        if self.mainFrame != None:
            wx.CallAfter(self.mainFrame.DisableTestButton, testName)
            if self.mainFrame.progressDlg != None:
                wx.CallAfter(self.mainFrame.UpdateProgress, 0, 'Test %s' % testName)
            else:
                destroyProgress = True
                print 'Create Progress'
                wx.CallAfter(self.mainFrame.CreateProgress, 100, 'Test %s' % testName)
        # Need to check bitstream avilibility
        if self.TestAndCompileProject(testName, projName):
            # Start Testing
            if not self.serialCon.isOpen():
                self.serialCon.open()
            print '---------------------------------------------'
            print '[%s]: Running Auto Test' % projName
            print '---------------------------------------------'
            self.ProgramFpga('../../../bitfiles/' + self.nfSumeTestConfiguration[testName]['bitstream'])
            self.serialCon.readlines()
            self.serialCon.write('a')
            time.sleep(8)
            for line in self.serialCon.readlines():
                if self.verbose:
                    sys.stdout.write(line)
		match = re.search( r'\s*(\w+)\.+(\w+)+(.*?)', line)
                if match:
                    self.nfSumeTestResult[match.groups()[0]] = match.groups()[1]
            if self.mainFrame != None:
                wx.CallAfter(self.mainFrame.EnableTestButton, testName)
        if self.mainFrame != None:
            if self.mainFrame.progressDlg != None:
                wx.CallAfter(self.mainFrame.UpdateProgress, 100)
                wx.CallAfter(self.mainFrame.DisplaySummary)
                if destroyProgress:
                    wx.CallAfter(self.mainFrame.DestroyProgress)

    # Check whether bitstream is here - compile according to user input
    def TestAndCompileProject(self, testName, projName):
        if not os.path.isfile('../../../bitfiles/' + self.nfSumeTestConfiguration[testName]['bitstream']):
            bitName = self.nfSumeTestConfiguration[testName]['bitstream']
            if not (bitName in self.bitIsCompiling.keys()) or (not self.bitIsCompiling[bitName]):
                self.localLogger.warn('bitFile %s used for %s test does not exist' % (bitName, testName))
                # Two options:
                # If GUI mode, produce message box to allow user select what to do
                # If command line mode, get user input from command line
                if self.mainFrame == None: # Command line
                    print ('Cannot find bitstream for project ' + projName + ' at ../../../bitfiles/' + self.nfSumeTestConfiguration[testName]['bitstream'] + '.\n' + 'Do you want to compile the project now? [y/n]')
                    usrInput = raw_input()
                    if (usrInput == 'y' or usrInput == 'Y'):
                        worker = NfSumeWorker(self.CompileProject, 
                                        (testName, projName, None))
                        self.testStruct.compileWorkerThreads.append({'test': testName, 'worker':worker})
                        worker.start()
                else:
                    if self.mainFrame != None:
                        wx.CallAfter(self.mainFrame.CompileProjectPrompt, testName, projName)
            return False
        return True

    def GuiCompileProject(self, testName, projName):
        # Compile Project
        if compileProject:
            if self.mainFrame != None:
                pcdlg = ProjectCompileDialog(self, projName)
                pcdlg.Show()
            # Create SubProcess to Compile Coresponding Project
            worker = NfSumeWorker(self.CompileProject, (testName, projName, pcdlg))
            self.compileWorkerThreads.append({'test':testName, 'worker':worker})
            worker.start()

    # Compile Project
    def CompileProject(self, testName, projName, pcdlg):
        self.bitIsCompiling[self.nfSumeTestConfiguration[testName]['bitstream']] = True
        self.localLogger.info('Cleaning hw project %s' % projName)
        p = Popen(['make', '-C', '../../../hw/', 'PROJ=' + projName, 'clean'], stdout=PIPE, bufsize=1)
        while(True):
            poll = p.poll()
            if poll != None:
                break
            out = p.stdout.readline()
            if out != '':
                if pcdlg == None:
                    if self.verbose:
                        sys.stdout.write(str(out))
                else:
                    wx.CallAfter(pcdlg.AddLog, str(out))
        self.localLogger.info('Cleaning sw project %s' % projName)
        p = Popen(['make', '-C', '../../../sw/embedded', 'PROJ=' + projName, 'clean'], stdout=PIPE, bufsize=1)
        while(True):
            poll = p.poll()
            if poll != None:
                break
            out = p.stdout.readline()
            if out != '':
                if pcdlg == None:
                    if self.verbose:
                        sys.stdout.write(str(out))
                else:
                    wx.CallAfter(pcdlg.AddLog, str(out))
        self.localLogger.info('Start compiling project %s' % projName)
        self.localLogger.debug('[%s]: Try Acquiring Compiling Mutex Lock' % projName)
        self.lockCompile.acquire()
        self.localLogger.debug('[%s]: Lock Acquired' % projName)
        try:
            p = Popen(['make', '-C', '../../../', projName], stdout=PIPE, bufsize=1)
            while(True):
                poll = p.poll()
                if poll != None:
                    break
                out = p.stdout.readline()
                if out != '':
                    if pcdlg == None:
                        if self.verbose:
                            sys.stdout.write(str(out))
                    else:
                        wx.CallAfter(pcdlg.AddLog, str(out))
            if pcdlg != None:
                wx.CallAfter(pcdlg.EnableOkButton)
        finally:
            self.lockCompile.release()
            if self.mainFrame != None:
                wx.CallAfter(self.mainFrame.EnableTestButton, testName)
    
    # Get FPGA JTAG Chain Index
    def getFpgaIndex(self):
        self.localLogger.debug('Get FPGA Index...')
        p = Popen(['djtgcfg', 'init', '-d', 'NetSUME'], stdout=PIPE, bufsize = 1)
        for line in iter(p.stdout.readline, b''):
            tokens = line.split()
            for i in xrange(len(tokens)):
                if tokens[i] == 'XC7VX690T':
                    self.fpgaIndex = tokens[i - 1].split(':')[0]
        p.stdout.close()
        self.localLogger.debug('FPGA JTAG Index: %s' % self.fpgaIndex)
        #print 'Get Index: %s' % self.fpgaIndex

    # Program FPGA with bitfile
    def ProgramFpga(self, bitfileName):
        self.getFpgaIndex()
        self.localLogger.debug('Program FPGA with bitfile %s' % bitfileName)
        #p = Popen(['djtgcfg', 'prog', '-d', 'NetSUME', '-i', self.fpgaIndex, '-f',
        #bitfileName], stdout=PIPE, bufsize = 1);
        p = Popen(['vivado', '-nolog', '-nojournal', '-mode', 'batch', '-source', 'download.tcl', '-tclargs', self.fpgaIndex, bitfileName], stdout=PIPE, bufsize = 1)
        while(True):
            poll = p.poll()
            if poll != None:
                break
            if self.mainFrame == None:
                if self.verbose:
                    sys.stdout.write(p.stdout.readline())
            else:
                self.localLogger.debug('    '.join(p.stdout.readlines()))

    # Write bitfile to Flash section 1
    def ProgramFlash(self, secId, bitfileName):
        self.getFpgaIndex()
        tagString = ''
        prevChar = ''
        localLine = ''
        percent = 0
        prevPercent = 0
        # Due to flash programming take quite a while
        # Create progress box to show speed
        self.localLogger.debug('Program Flash sector %d with bitfile %s' % (secId, bitfileName))
        if secId < 4 and secId > -1:
            p = Popen(['dsumecfg', 'write', '-d', 'NetSUME', '-s', '%d' % secId, 
                        '-f', bitfileName], stdout=PIPE, bufsize = 1)
            while(True):
                poll = p.poll()
                if poll != None:
                    break
                out = p.stdout.read(1)
                if self.mainFrame == None:
                    if self.verbose:
                        sys.stdout.write(str(out))
                else:
                    if out == '\r' or out == '\n' or out == '\x08':
                        if prevChar != '\r' and prevChar != '\n' and prevChar != '\x08':
                            self.localLogger.debug(localLine)
                            match = re.search('(\D+)(\d+)%', localLine)
                            if match != None:
                                tagString = match.groups()[0]
                                percent = int(match.groups()[1])
                                prevPercent = 0
                                wx.CallAfter(self.mainFrame.UpdateProgress, 0, localLine)
                            else:
                                match = re.search('(\d+)%', localLine)
                                if match != None:
                                    percent = int(match.groups()[0])
                                    wx.CallAfter(self.mainFrame.UpdateProgress, 0, tagString + localLine)
                            prevPercent = percent
                        localLine = ''
                    else:
                        localLine += str(out)
                    prevChar = out
            p = Popen(['dsumecfg', 'reconfig', '-d', 'NetSUME', '-s', '%d' % secId], 
                            stdout=PIPE, bufsize = 1)
            while(True):
                poll = p.poll()
                if poll != None:
                    break
                if self.mainFrame == None:
                    out = p.stdout.read(1)
                    sys.stdout.write(str(out))
                else:
                    self.localLogger.debug('    '.join(p.stdout.readlines()))
        else:
            raise IOError('wrong section ID')

class testFrame(wx.Frame):
    localLogger = None
    progressDlg = None
    curProgress = 0
    progressWorker = None
    '''
        Ask users to turn the board on and properly connected to the PC via USB cable
        ------------------------------------------------------------------------------
        | filemenu - File (filemenu) -> About/Exit
        ------------------------------------------------------------------------------
        | toolSizer
        | self.serialComboBox | self.serialRefreshButton | self.serialStartTestButton
        ------------------------------------------------------------------------------
        | self.testSelectionSizer      | self.testSummarySizer
        | |- self.testStruct.          |   Summary/Log...
        | |  nfSumeTestConfiguration[] |
        | |  ['button']                | 
        ------------------------------------------------------------------------------
    '''
    def __init__(self, parent, testStruct, title):
        self.localLogger = logging.getLogger('testFrame')
        self.testStruct = testStruct
        # Setup Basic Frame Parameter, Default size: 800x600
        wx.Frame.__init__(self, parent, title=title, size=(800, 600))
        self.CreateStatusBar() # A Status Bar at the bottom of the window

        # Setting up a Menu
        filemenu = wx.Menu()
        menuAbout = filemenu.Append(wx.ID_ABOUT, "&About", "Information about this program")
        menuExit = filemenu.Append(wx.ID_EXIT, "E&xit", "Terminate the program")
        menuBar = wx.MenuBar()
        menuBar.Append(filemenu, "&File")	# Adding "File" menu to menu bar
        self.SetMenuBar(menuBar)

        topSizer = wx.BoxSizer(wx.VERTICAL)
        toolSizer = wx.BoxSizer(wx.HORIZONTAL)
        testSizer = wx.BoxSizer(wx.HORIZONTAL)
        
        # Serial Combox
        self.serialComboBox = wx.ComboBox(parent=self, choices=self.testStruct.serialArray, style=wx.CB_READONLY | wx.CB_DROPDOWN)
        self.serialCheckBox = wx.CheckBox(parent=self, label='List only USB devices: ')
        self.serialRefreshButton = wx.Button(parent=self, label='Refresh')
        self.serialStartTestButton = wx.Button(parent=self, label='Start Test')

        topSizer.Add(toolSizer, 0, wx.EXPAND)
        topSizer.Add(testSizer, 1, wx.EXPAND)

        toolSizer.Add(self.serialCheckBox, proportion=0)
        toolSizer.Add(self.serialComboBox, proportion=1, flag=wx.EXPAND)
        toolSizer.Add(self.serialRefreshButton, proportion=0)
        toolSizer.Add(self.serialStartTestButton, proportion=0)

        # Sizer for Configuration Panel
        self.testSelectionSizer = wx.BoxSizer(wx.VERTICAL)
        self.testSummarySizer = wx.BoxSizer(wx.VERTICAL)
        testSizer.Add(self.testSelectionSizer, 0, wx.EXPAND)
        testSizer.Add(self.testSummarySizer, 1, wx.EXPAND)
    
        self.SetSizer(topSizer, wx.EXPAND)

        self.Bind(wx.EVT_CHECKBOX, self.OnSerialCheckBox, self.serialCheckBox)
        self.Bind(wx.EVT_COMBOBOX, self.OnSerialComboBox, self.serialComboBox)
        self.Bind(wx.EVT_BUTTON, self.OnSerialRefresh, self.serialRefreshButton)
        self.Bind(wx.EVT_BUTTON, self.StartTest, self.serialStartTestButton)
        self.Bind(wx.EVT_MENU, self.OnAbout, menuAbout)
        self.Bind(wx.EVT_MENU, self.OnExit, menuExit)
        self.Layout()
        self.Show()

    def OnSerialRefresh(self, e):
        self.localLogger.debug('Refresh Serial Button Clicked, Refresh Serial Ports List')
        self.testStruct.RefreshSerial()

    def OnSerialCheckBox(self, e):
        global comports
        if self.serialCheckBox.GetValue():
            comports = NfSume_comports
            self.testStruct.RefreshSerial()
        else:
            comports = lpp.comports
	    self.testStruct.RefreshSerial()

    def OnSerialComboBox(self, e):
        # Get Serial Port Selected
        self.testStruct.serialPortName = self.serialComboBox.GetValue().split()[0]
        self.localLogger.debug('Serial port %s selected' % self.testStruct.serialPortName)

    # Start Test
    def StartTest(self, e):
        self.localLogger.debug('Start Test Button Clicked. Prepare Test Panel for NetFPGA-SUME Acceptance Test')
        self.testSelectionSizer.Clear(True)
        curButton = wx.Button(self, wx.ID_ANY, label='Run Auto Test')
        self.testSelectionSizer.Add(curButton, 0, wx.EXPAND)
        self.Bind(wx.EVT_BUTTON, self.RunAutoTest, curButton)
        curButton = wx.Button(self, wx.ID_ANY, label='Show Test Summary')
        self.testSelectionSizer.Add(curButton, 0, wx.EXPAND)
        self.Bind(wx.EVT_BUTTON, self.DisplaySummary, curButton)
        # Start to Draw out Buttons for test selection Panel
        for testName in self.testStruct.nfSumeTestConfiguration.keys():
            curButton = wx.Button(self, wx.ID_ANY, 
                            label=self.testStruct.nfSumeTestConfiguration[testName]['label'],
                            name=testName)
            self.testSelectionSizer.Add(curButton, 0, wx.EXPAND)
            self.testStruct.nfSumeTestConfiguration[testName]['button'] = curButton
            if testName == 'CPLD':
                self.Bind(wx.EVT_BUTTON, lambda evt, testName=testName:
                            self.TestFlashCallBack(testName),
                    curButton)
            else:
                self.Bind(wx.EVT_BUTTON, lambda evt, testName=testName:
                            self.TestInterfaceCallBack(testName),
                    curButton)
        self.DisplaySummary()
        self.Layout()
        #for testName in self.testStruct.nfSumeTestConfiguration.keys():
            #projName = self.testStruct.nfSumeTestConfiguration[testName]['project']
            #if not os.path.isfile('../../../bitfiles/' +
            #				self.testStruct.nfSumeTestConfiguration[testName]['bitstream']):
            #	dlg = wx.MessageDialog(None, 'Cannot find bitstream for project ' +
            #				projName + ' at ../../../bitfiles/' +
            #				self.testStruct.nfSumeTestConfiguration[testName]['bitstream'] +
            #				'.  Do you want to compile the project now?',
            #				'Cannot Fild Bitstream', wx.YES_NO | wx.ICON_EXCLAMATION)
            #	if dlg.ShowModal() == wx.ID_YES:
            #		pcdlg = ProjectCompileDialog(self, projName)
            #		pcdlg.Show()
            #		# Create SubProcess to Compile the corresponding project
            #		self.Worker = NfSumeWorker(self.testStruct.CompileProject,
            #							(testName, projName, pcdlg))
            #		self.Worker.start()
            #	else:
            #		# Skip the test
            #		self.EnableTestButton(testName)
            #		pass
            #else: # Found Bitstream: Start Test
            #	self.RunTest(testName)
            #	self.EnableTestButton(testName)
            #	pass

    def EnableTestButton(self, testName):
        self.localLogger.debug('Enable Test Button: %s' % testName)
        self.testStruct.nfSumeTestConfiguration[testName]['button'].Enable(True)

    def DisableTestButton(self, testName):
        self.localLogger.debug('Disable Test Button: %s' % testName)
        self.testStruct.nfSumeTestConfiguration[testName]['button'].Enable(False)

    def DisplayErrorMessage(self, eMsg):
        dlg = wx.MessageDialog(None, eMsg, 'Error', wx.OK | wx.ICON_ERROR)
        dlg.ShowModal()
        dlg.Destroy()

    def TestFlashCallBack(self, testName):
        self.localLogger.debug('Test Flash/CPLD Button Clicked. Start worker to test Flash/CPLD')
        worker = NfSumeWorker(self.testStruct.TestFlash, (testName,))
        self.progressWorker = worker
        worker.start()
    
    def TestInterfaceCallBack(self, testName):
        self.localLogger.debug('Test %s Button Clicked. Start worker to test %s' % (testName, testName))
        worker = NfSumeWorker(self.testStruct.TestInterface, (testName,))
        self.progressWorker = worker
        worker.start()

    def RunAutoTest(self, e):
        self.localLogger.debug('Start Auto Test Button Clicked. Start worker to perform auto test procedure')
        if self.testStruct.serialPortName == "":
            dlg = wx.MessageDialog(None, 'Error: Not found NetFPGA-SUME Serial Port',
                                    'Error', wx.OK | wx.ICON_ERROR)
        else:
            # Start Auto Test
            self.CreateProgress(1200, 'Auto Test')
            worker = NfSumeWorker(self.testStruct.StartAutoTest, ())
            self.progressWorker = worker
            worker.start()

    def CreateProgress(self, maximum, title):
        if self.progressDlg == None:
            self.localLogger.debug('Create Progress Dialog with title %s, maximum %d' % (title, maximum))
            self.curProgress = 0
            self.progressDlg = NfSumeProgress(self, title, maximum=maximum)
            self.progressDlg.Show()

    def UpdateProgress(self, percent, localLine=None):
        self.curProgress += percent
        if self.progressDlg != None:
            self.localLogger.debug('Increase progress by %d, from %d to %d' % (percent, self.curProgress - percent, self.curProgress))
            if localLine == None:
                self.progressDlg.Update(self.curProgress)
            else:
                self.localLogger.debug('Update Progress Message to %s' % str(localLine))
                self.progressDlg.Update(self.curProgress, str(localLine))

    def DestroyProgress(self):
        if self.progressDlg != None:
            self.localLogger.debug('Destroy progress Dialog')
            self.progressDlg.Close()
            self.curProgress = 0
            self.progressDlg = None
            self.progressWorker = None

    def CompileProjectPrompt(self, testName, projName):
        dlg = wx.MessageDialog(None, 'Cannot find bitstream for project ' + projName + ' at ../../../bitfiles/' + self.testStruct.nfSumeTestConfiguration[testName]['bitstream'] + '. Do you want to compile the project now?',
                    'Cannot Fild Bitstream', wx.YES_NO | wx.ICON_EXCLAMATION)
        if dlg.ShowModal() == wx.ID_YES:
            self.localLogger.debug('Create worker to compile %s project. Start the worker' % projName)
            pcdlg = ProjectCompileDialog(self, projName)
            pcdlg.Show()
            worker = NfSumeWorker(self.testStruct.CompileProject, 
                                    (testName, projName, pcdlg))
            self.testStruct.compileWorkerThreads.append({'test': testName, 'worker':worker})
            worker.start()
        else:
            self.EnableTestButton(testName)
        

    def DisplaySummary(self, e=None):
        self.localLogger.debug('Display Summary: ' + '\n'.join(['%s: %s' % (k, v) for k,v in self.testStruct.nfSumeTestResult.items()]))
        self.summaryListCtrl = wx.ListCtrl(self, style=wx.LC_REPORT | wx.BORDER_SUNKEN)
        self.summaryListCtrl.InsertColumn(0, 'TestID')
        self.summaryListCtrl.InsertColumn(1, 'Result')
        self.summaryListCtrl.InsertColumn(2, 'Description')
        index = 0
        for testName in self.testStruct.nfSumeTestConfiguration.keys():
            for targetName in self.testStruct.nfSumeTestConfiguration[testName]['target'].keys():
                self.summaryListCtrl.InsertStringItem(index, targetName)
                if targetName in self.testStruct.nfSumeTestResult.keys():
                    self.summaryListCtrl.SetStringItem(index, 1, 
                        self.testStruct.nfSumeTestResult[targetName])
                else:
                    self.summaryListCtrl.SetStringItem(index, 1, 'not tested')
                self.summaryListCtrl.SetStringItem(index, 2,
                    self.testStruct.nfSumeTestConfiguration[testName]['target'][targetName])
                index += 1
        self.testSummarySizer.Clear(True)
        self.testSummarySizer.Add(self.summaryListCtrl, proportion=1, flag=wx.EXPAND | wx.ALL)
        self.Layout()

    # When About Button is hit
    def OnAbout(self, e):
        # A Message Diaglog box with an OK Button.
        dlg = wx.MessageDialog(self, "Author: Tinghui Wang\nCopyright Digilent Inc. 2015\nVersion: 1.00.0\n", "NetFPGA-SUME Acceptance Test Info", wx.OK)
        dlg.ShowModal()
        dlg.Destroy()

    # When Exit is hit
    def OnExit(self, e):
        self.Close(True)

class ProjectCompileDialog(wx.Frame):
    def __init__(self, parent, projName):
        wx.Frame.__init__(self, parent, id=wx.ID_ANY, title='Compile ' + projName) 
        vbox = wx.BoxSizer(wx.VERTICAL)
        self.textLog = wx.TextCtrl(self, wx.ID_ANY, style=wx.TE_MULTILINE | wx.TE_READONLY)
        vbox.Add(self.textLog, 1, wx.EXPAND)
        self.okButton = wx.Button(self, wx.ID_OK)
        self.okButton.Enable(False)
        self.Bind(wx.EVT_BUTTON, self.OnOkButton, self.okButton)
        self.Bind(wx.EVT_CLOSE, self.OnCloseDialog)
        hbox = wx.BoxSizer(wx.HORIZONTAL)
        hbox.Add(self.okButton, 0, wx.RIGHT | wx.EXPAND)
        vbox.Add(hbox, 0, wx.EXPAND)
        self.SetSizer(vbox)
        self.Layout()

    def OnCloseDialog(self, e):
        if e.CanVeto():
            e.Veto()
        else:
            e.Skip()

    def ClearLog(self):
        self.textLog.SetValue('')

    def AddLog(self, strLog):
        self.textLog.AppendText(strLog)

    def EnableOkButton(self):
        self.okButton.Enable(True)

    def OnOkButton(self, e):
        self.Close(force=True)

class NfSumeWorker(threading.Thread):
    def __init__(self, func, data):
        threading.Thread.__init__(self)
        self.target = func
        self.data = data

    def run(self):
        self.target(*self.data)

    def abort(self):
        pass	

class NfSumeProgress(wx.Frame):
    def __init__(self, parent, title, msg='', maximum=100):
        wx.Frame.__init__(self, parent, id=wx.ID_ANY, title=title)
        self.message = msg
        self.maximum = maximum
        self.progressUpdated = True
        self.curProgress = 0
        self.timeElapsed = 0
        self.Timer = wx.Timer(self, wx.ID_ANY)
        self.Bind(wx.EVT_TIMER, self.UpdateTime)
        
        vbox = wx.BoxSizer(wx.VERTICAL)
        self.SetSizer(vbox)
        self.messageText = wx.StaticText(self, label=self.message, style=wx.ALIGN_LEFT)
        vbox.Add(self.messageText, proportion = 0, flag=wx.EXPAND)
        self.progressBar = wx.Gauge(self, id=wx.ID_ANY, range=self.maximum, 
                style=wx.GA_HORIZONTAL | wx.GA_SMOOTH)
        self.timeElapsedText = wx.StaticText(self, label='Elapsed   Time:   ')
        self.timeRemainingText = wx.StaticText(self, label='Remaining Time: ')
        self.timeEstimatedText = wx.StaticText(self, label='Estimated Time: ') 
        vbox.Add(self.progressBar, proportion = 1, flag=wx.EXPAND)
        vbox.Add(self.timeElapsedText, proportion = 0, flag=wx.EXPAND)
        vbox.Add(self.timeRemainingText, proportion = 0, flag=wx.EXPAND)
        vbox.Add(self.timeEstimatedText, proportion = 0, flag=wx.EXPAND)
        self.UpdateTime()
        self.Timer.Start(1000)

    def UpdateTime(self, e=None):
        if e != None:
            self.timeElapsed += 1
        strElapsed = 'Elapsed   Time: ' + \
                     time.strftime('%H:%M:%S', time.gmtime(self.timeElapsed))
        if self.curProgress == 0:
            strRemaining = 'Remaining Time: Unknown'
            strEstimated = 'Estimated Time: Unknown'
        else:
            if self.progressUpdated:
                self.progressUpdated = False
                self.timeEstimated = self.timeElapsed * self.maximum / self.curProgress
            self.timeRemaining = self.timeEstimated - self.timeElapsed
            strRemaining = 'Remaining Time: ' + \
                            time.strftime('%H:%M:%S', time.gmtime(self.timeRemaining))
            strEstimated = 'Estimated Time: ' + \
                            time.strftime('%H:%M:%S', time.gmtime(self.timeEstimated))
        self.timeElapsedText.SetLabel(strElapsed)
        self.timeRemainingText.SetLabel(strRemaining)
        self.timeEstimatedText.SetLabel(strEstimated)
        self.progressBar.SetValue(self.curProgress)
        self.messageText.SetLabel(self.message)
        self.Layout()

    def Update(self, percent, msg=None):
        self.curProgress = percent
        if msg != None:
            self.message = msg
        self.progressUpdated = True

if __name__ == '__main__':
    os.chdir(os.path.dirname(inspect.getfile(inspect.currentframe())))
    logging.config.fileConfig('NfSumeTestLog.inf')
    logger = logging.getLogger('NfSumeTest')
    verbose = False
    gui = True
    argv = sys.argv
    if '-h' in argv:
        print '****************************************'
        print 'NfSumeTest: NetFPGA-SUME Acceptance Test'
        print '****************************************'
        print 'python NfSumeTest.py [options]'
        print 'Options:'
        print '  -nogui: Command Line Mode'
        print '  -v:     Verbose (Command Line Only)' 
        print '  -h:     This help message'
        exit()

    if '-v' in argv:
        logger.setLevel(logging.DEBUG)

    if '-nogui' in argv:
        gui = False

    app = NfSumeTest(guiEnable=gui)
