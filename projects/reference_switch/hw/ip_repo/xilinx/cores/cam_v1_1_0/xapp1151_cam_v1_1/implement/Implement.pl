#!xilperl

##-----------------------------------------------------------------------------
##
##  File Name   : Implement.pl
##
##  Version     : 1.1
##
##  Last Update : 01 March 2011
##
##  Project     : CAM Reference Design
##
##  Description : Perl script to implement the CAM
##
##  Company     : Xilinx, Inc.
##
##   (c) Copyright 2001-2011 Xilinx, Inc. All rights reserved.
## 
##   This file contains confidential and proprietary information
##   of Xilinx, Inc. and is protected under U.S. and
##   international copyright and other intellectual property
##   laws.
## 
##   DISCLAIMER
##   This disclaimer is not a license and does not grant any
##   rights to the materials distributed herewith. Except as
##   otherwise provided in a valid license issued to you by
##   Xilinx, and to the maximum extent permitted by applicable
##   law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
##   WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
##   AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
##   BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
##   INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
##   (2) Xilinx shall not be liable (whether in contract or tort,
##   including negligence, or under any other theory of
##   liability) for any loss or damage of any kind or nature
##   related to, arising under or in connection with these
##   materials, including for any direct, or any indirect,
##   special, incidental, or consequential loss or damage
##  (including loss of data, profits, goodwill, or any type of
##   loss or damage suffered as a result of any action brought
##   by a third party) even if such damage or loss was
##   reasonably foreseeable or Xilinx had been advised of the
##   possibility of the same.
## 
##   CRITICAL APPLICATIONS
##   Xilinx products are not designed or intended to be fail-
##   safe, or for use in any application requiring fail-safe
##   performance, such as life-support or safety devices or
##   systems, Class III medical devices, nuclear facilities,
##   applications related to the deployment of airbags, or any
##   other applications that could lead to death, personal
##   injury, or severe property or environmental damage
##   (individually and collectively, "Critical
##   Applications"). Customer assumes the sole risk and
##   liability of any use of Xilinx products in Critical
##   Applications, subject only to applicable laws and
##   regulations governing limitations on product liability.
## 
##   THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
##   PART OF THIS FILE AT ALL TIMES.
##   
##-----------------------------------------------------------------------------
##
##  History
##
##  Date        Version   Description
##
##  03/01/2011  1.1       Initial release
##
##-----------------------------------------------------------------------------

print "\nImplementing the CAM Reference Design\n";

print "\n===============================================\n";
print "Running Ngdbuild...\n";
system ("ngdbuild -p 6vlx240t-ff1156-1 -sd ./results -dd ./results -nt on cam ./results/cam.ngd");

print "\n===============================================\n";
print "Running Map...\n";
system ("map -w -o ./results/cam_map.ncd ./results/cam.ngd");

print "\n===============================================\n";
print "Running PAR...\n";
system ("par -w ./results/cam_map.ncd ./results/cam_routed.ncd");

# move implementation output products to /results directory
rename "cam_wrapper_map.xrpt", "results/cam_wrapper_map.xrpt";
rename "cam_wrapper_par.xrpt", "results/cam_wrapper_par.xrpt";
rename "xilinx_device_details.xml", "results/xilinx_device_details.xml";
rename "xlnx_auto_0.ise", "results/xlnx_auto_0.ise";
rename "xlnx_auto_0_xdb", "results/xlnx_auto_0_xdb";
