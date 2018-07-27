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
# @NETFPGA_LICENSE_HEADER_END@

# Hierachical cell
proc create_hier_cell_nf_sume_blueswitch { parentCell coreName regOffset regRange } {

   # Check argument
   if { $parentCell eq "" || $coreName eq "" || $regOffset eq "" || $regRange eq ""} {
      puts "ERROR: Empty argument(s)!"
      return
   }

   # Get object for parentCell
   set parentObj [get_bd_cells $parentCell]
   if { $parentCell == "" } {
      puts "ERROR: Unable to find parent cell <$parentCell>!"
      return
   }

   # parentObj should be hier block
   set parentType [get_property TYPE $parentObj]
   if { $parentType ne "hier"} {
      puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>."
   }

   # Save current instance; Restore later
   set oldCurInst [current_bd_instance .]

   # Set parent object as current
   current_bd_instance $parentObj

   # Create cell and set as current instance
   set hier_obj [create_bd_cell -type hier $coreName]
   current_bd_instance $hier_obj

   create_bd_pin -dir I -type clk axis_aclk 
   create_bd_pin -dir I axis_aresetn

   create_bd_pin -dir I -type clk s_axi_aclk
   create_bd_pin -dir I s_axi_aresetn

   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s0_axis
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s1_axis
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s2_axis
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s3_axis
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s4_axis

   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m0_axis
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m1_axis
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m2_axis
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m3_axis
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m4_axis

   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi

   create_bd_cell -type ip -vlnv NetFPGA:NetFPGA-SUME-contrib:nf_sume_blueswitch:1.00 nf_sume_blueswitch_0
   set_property -dict [list CONFIG.C_BASEADDR $regOffset CONFIG.C_HIGHADDR $regRange] [get_bd_cells nf_sume_blueswitch_0]

   create_bd_cell -type ip -vlnv NetFPGA:NetFPGA-SUME-contrib:nf_sume_crossbar:1.00 nf_sume_crossbar_0
   
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins nf_sume_blueswitch_0/axis_aclk]
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins nf_sume_crossbar_0/axis_aclk]
   connect_bd_net [get_bd_pins s_axi_aclk] [get_bd_pins nf_sume_blueswitch_0/S_AXI_ACLK]

   connect_bd_net [get_bd_pins axis_aresetn] [get_bd_pins nf_sume_blueswitch_0/axis_resetn]
   connect_bd_net [get_bd_pins axis_aresetn] [get_bd_pins nf_sume_crossbar_0/axis_aresetn]
   connect_bd_net [get_bd_pins s_axi_aresetn] [get_bd_pins nf_sume_blueswitch_0/S_AXI_ARESETN]

   connect_bd_intf_net [get_bd_intf_pins nf_sume_blueswitch_0/m0_axis] [get_bd_intf_pins nf_sume_crossbar_0/s0_axis]
   connect_bd_intf_net [get_bd_intf_pins nf_sume_blueswitch_0/m1_axis] [get_bd_intf_pins nf_sume_crossbar_0/s1_axis]
   connect_bd_intf_net [get_bd_intf_pins nf_sume_blueswitch_0/m2_axis] [get_bd_intf_pins nf_sume_crossbar_0/s2_axis]
   connect_bd_intf_net [get_bd_intf_pins nf_sume_blueswitch_0/m3_axis] [get_bd_intf_pins nf_sume_crossbar_0/s3_axis]
   connect_bd_intf_net [get_bd_intf_pins nf_sume_blueswitch_0/m4_axis] [get_bd_intf_pins nf_sume_crossbar_0/s4_axis]
   
   connect_bd_intf_net [get_bd_intf_pins s_axi] [get_bd_intf_pins nf_sume_blueswitch_0/S_AXI]

   connect_bd_intf_net [get_bd_intf_pins s0_axis] [get_bd_intf_pins nf_sume_blueswitch_0/s0_axis]
   connect_bd_intf_net [get_bd_intf_pins s1_axis] [get_bd_intf_pins nf_sume_blueswitch_0/s1_axis]
   connect_bd_intf_net [get_bd_intf_pins s2_axis] [get_bd_intf_pins nf_sume_blueswitch_0/s2_axis]
   connect_bd_intf_net [get_bd_intf_pins s3_axis] [get_bd_intf_pins nf_sume_blueswitch_0/s3_axis]
   connect_bd_intf_net [get_bd_intf_pins s4_axis] [get_bd_intf_pins nf_sume_blueswitch_0/s4_axis]

   connect_bd_intf_net [get_bd_intf_pins m0_axis] [get_bd_intf_pins nf_sume_crossbar_0/m0_axis]
   connect_bd_intf_net [get_bd_intf_pins m1_axis] [get_bd_intf_pins nf_sume_crossbar_0/m1_axis]
   connect_bd_intf_net [get_bd_intf_pins m2_axis] [get_bd_intf_pins nf_sume_crossbar_0/m2_axis]
   connect_bd_intf_net [get_bd_intf_pins m3_axis] [get_bd_intf_pins nf_sume_crossbar_0/m3_axis]
   connect_bd_intf_net [get_bd_intf_pins m4_axis] [get_bd_intf_pins nf_sume_crossbar_0/m4_axis]

   # Restore current instance
   current_bd_instance $oldCurInst
}
