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
proc create_hier_cell_axis_converter { parentCell coreName s0Width m0Width s1Width m1Width } {

   # Check argument
   if { $parentCell eq "" || $coreName eq "" || $s0Width eq "" || $m0Width eq "" || $s1Width eq "" || $m1Width eq ""} {
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

   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s00_axis
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s01_axis
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s02_axis
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s03_axis
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s04_axis

   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m00_axis
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m01_axis
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m02_axis
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m03_axis
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m04_axis

   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s10_axis
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s11_axis
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s12_axis
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s13_axis
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s14_axis

   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m10_axis
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m11_axis
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m12_axis
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m13_axis
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m14_axis

   set slave0Width [expr {$s0Width/8}]
   set master0Width [expr {$m0Width/8}]

   create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_00
   set_property -dict [list CONFIG.S_TDATA_NUM_BYTES $slave0Width CONFIG.M_TDATA_NUM_BYTES $master0Width] [get_bd_cells axis_dwidth_converter_00]

   create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_01
   set_property -dict [list CONFIG.S_TDATA_NUM_BYTES $slave0Width CONFIG.M_TDATA_NUM_BYTES $master0Width] [get_bd_cells axis_dwidth_converter_01]

   create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_02
   set_property -dict [list CONFIG.S_TDATA_NUM_BYTES $slave0Width CONFIG.M_TDATA_NUM_BYTES $master0Width] [get_bd_cells axis_dwidth_converter_02]

   create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_03
   set_property -dict [list CONFIG.S_TDATA_NUM_BYTES $slave0Width CONFIG.M_TDATA_NUM_BYTES $master0Width] [get_bd_cells axis_dwidth_converter_03]

   create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_04
   set_property -dict [list CONFIG.S_TDATA_NUM_BYTES $slave0Width CONFIG.M_TDATA_NUM_BYTES $master0Width] [get_bd_cells axis_dwidth_converter_04]

   set slave1Width [expr {$s1Width/8}]
   set master1Width [expr {$m1Width/8}]

   create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_10
   set_property -dict [list CONFIG.S_TDATA_NUM_BYTES $slave1Width CONFIG.M_TDATA_NUM_BYTES $master1Width] [get_bd_cells axis_dwidth_converter_10]

   create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_11
   set_property -dict [list CONFIG.S_TDATA_NUM_BYTES $slave1Width CONFIG.M_TDATA_NUM_BYTES $master1Width] [get_bd_cells axis_dwidth_converter_11]

   create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_12
   set_property -dict [list CONFIG.S_TDATA_NUM_BYTES $slave1Width CONFIG.M_TDATA_NUM_BYTES $master1Width] [get_bd_cells axis_dwidth_converter_12]

   create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_13
   set_property -dict [list CONFIG.S_TDATA_NUM_BYTES $slave1Width CONFIG.M_TDATA_NUM_BYTES $master1Width] [get_bd_cells axis_dwidth_converter_13]

   create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_14
   set_property -dict [list CONFIG.S_TDATA_NUM_BYTES $slave1Width CONFIG.M_TDATA_NUM_BYTES $master1Width] [get_bd_cells axis_dwidth_converter_14]


   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins axis_dwidth_converter_00/aclk]
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins axis_dwidth_converter_01/aclk]
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins axis_dwidth_converter_02/aclk]
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins axis_dwidth_converter_03/aclk]
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins axis_dwidth_converter_04/aclk]

   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins axis_dwidth_converter_10/aclk]
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins axis_dwidth_converter_11/aclk]
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins axis_dwidth_converter_12/aclk]
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins axis_dwidth_converter_13/aclk]
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins axis_dwidth_converter_14/aclk]

   connect_bd_net [get_bd_pins axis_aresetn] [get_bd_pins axis_dwidth_converter_00/aresetn]
   connect_bd_net [get_bd_pins axis_aresetn] [get_bd_pins axis_dwidth_converter_01/aresetn]
   connect_bd_net [get_bd_pins axis_aresetn] [get_bd_pins axis_dwidth_converter_02/aresetn]
   connect_bd_net [get_bd_pins axis_aresetn] [get_bd_pins axis_dwidth_converter_03/aresetn]
   connect_bd_net [get_bd_pins axis_aresetn] [get_bd_pins axis_dwidth_converter_04/aresetn]

   connect_bd_net [get_bd_pins axis_aresetn] [get_bd_pins axis_dwidth_converter_10/aresetn]
   connect_bd_net [get_bd_pins axis_aresetn] [get_bd_pins axis_dwidth_converter_11/aresetn]
   connect_bd_net [get_bd_pins axis_aresetn] [get_bd_pins axis_dwidth_converter_12/aresetn]
   connect_bd_net [get_bd_pins axis_aresetn] [get_bd_pins axis_dwidth_converter_13/aresetn]
   connect_bd_net [get_bd_pins axis_aresetn] [get_bd_pins axis_dwidth_converter_14/aresetn]


   connect_bd_intf_net [get_bd_intf_pins s00_axis] [get_bd_intf_pins axis_dwidth_converter_00/S_AXIS]
   connect_bd_intf_net [get_bd_intf_pins s01_axis] [get_bd_intf_pins axis_dwidth_converter_01/S_AXIS]
   connect_bd_intf_net [get_bd_intf_pins s02_axis] [get_bd_intf_pins axis_dwidth_converter_02/S_AXIS]
   connect_bd_intf_net [get_bd_intf_pins s03_axis] [get_bd_intf_pins axis_dwidth_converter_03/S_AXIS]
   connect_bd_intf_net [get_bd_intf_pins s04_axis] [get_bd_intf_pins axis_dwidth_converter_04/S_AXIS]

   connect_bd_intf_net [get_bd_intf_pins m00_axis] [get_bd_intf_pins axis_dwidth_converter_00/M_AXIS]
   connect_bd_intf_net [get_bd_intf_pins m01_axis] [get_bd_intf_pins axis_dwidth_converter_01/M_AXIS]
   connect_bd_intf_net [get_bd_intf_pins m02_axis] [get_bd_intf_pins axis_dwidth_converter_02/M_AXIS]
   connect_bd_intf_net [get_bd_intf_pins m03_axis] [get_bd_intf_pins axis_dwidth_converter_03/M_AXIS]
   connect_bd_intf_net [get_bd_intf_pins m04_axis] [get_bd_intf_pins axis_dwidth_converter_04/M_AXIS]

   connect_bd_intf_net [get_bd_intf_pins s10_axis] [get_bd_intf_pins axis_dwidth_converter_10/S_AXIS]
   connect_bd_intf_net [get_bd_intf_pins s11_axis] [get_bd_intf_pins axis_dwidth_converter_11/S_AXIS]
   connect_bd_intf_net [get_bd_intf_pins s12_axis] [get_bd_intf_pins axis_dwidth_converter_12/S_AXIS]
   connect_bd_intf_net [get_bd_intf_pins s13_axis] [get_bd_intf_pins axis_dwidth_converter_13/S_AXIS]
   connect_bd_intf_net [get_bd_intf_pins s14_axis] [get_bd_intf_pins axis_dwidth_converter_14/S_AXIS]

   connect_bd_intf_net [get_bd_intf_pins m10_axis] [get_bd_intf_pins axis_dwidth_converter_10/M_AXIS]
   connect_bd_intf_net [get_bd_intf_pins m11_axis] [get_bd_intf_pins axis_dwidth_converter_11/M_AXIS]
   connect_bd_intf_net [get_bd_intf_pins m12_axis] [get_bd_intf_pins axis_dwidth_converter_12/M_AXIS]
   connect_bd_intf_net [get_bd_intf_pins m13_axis] [get_bd_intf_pins axis_dwidth_converter_13/M_AXIS]
   connect_bd_intf_net [get_bd_intf_pins m14_axis] [get_bd_intf_pins axis_dwidth_converter_14/M_AXIS]

   # Restore current instance
   current_bd_instance $oldCurInst
}
