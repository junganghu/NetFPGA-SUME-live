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

# Hierachical cell : SUME 10g interface block design
proc create_hier_cell_nf_sume_datapath { parentCell coreName tdataWidth} {

   # Check argument
   if { $parentCell eq "" || $coreName eq "" } {
      puts "ERROR: Empty argument(s)!"
      return
   }

   if { $tdataWidth eq "" } {
      puts "Default: Default setting data width to 128bits!"
      return
   }
 
   if { $tdataWidth < "128" } {
      puts "ERROR: Data width should be larger than 128bits!"
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

   # Create bd external ports
   create_bd_pin -dir I -type clk axis_aclk
   create_bd_pin -dir I axis_resetn

   create_bd_pin -dir I -type clk s_axi_aclk
   create_bd_pin -dir I s_axi_aresetn

   # Add slave axi lite if you add your custom module 

   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_lite_0
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_lite_1
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_lite_2
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_lite_3
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_lite_4


   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_0
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_1
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_2
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_3
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_4


   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis_0
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis_1
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis_2
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis_3
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis_4
 

   # create data path blocks
   set input_arbiter_0 [create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:input_arbiter:1.00 input_arbiter_0]
   set_property -dict [list CONFIG.C_M_AXIS_DATA_WIDTH $tdataWidth] $input_arbiter_0
   set_property -dict [list CONFIG.C_S_AXIS_DATA_WIDTH $tdataWidth] $input_arbiter_0

   set vlan_adder_0 [create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:vlan_adder:1.00 vlan_adder_0]
   set_property -dict [list CONFIG.C_M_AXIS_DATA_WIDTH $tdataWidth] $vlan_adder_0
   set_property -dict [list CONFIG.C_S_AXIS_DATA_WIDTH $tdataWidth] $vlan_adder_0

   set vlan_remover_0 [create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:vlan_remover:1.00 vlan_remover_0]
   set_property -dict [list CONFIG.C_M_AXIS_DATA_WIDTH $tdataWidth] $vlan_remover_0
   set_property -dict [list CONFIG.C_S_AXIS_DATA_WIDTH $tdataWidth] $vlan_remover_0

   set nic_output_port_lookup_0 [create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:nic_output_port_lookup:4.00 nic_output_port_lookup_0]
   set_property -dict [list CONFIG.C_M_AXIS_DATA_WIDTH $tdataWidth] $nic_output_port_lookup_0
   set_property -dict [list CONFIG.C_S_AXIS_DATA_WIDTH $tdataWidth] $nic_output_port_lookup_0

   set output_queues_0 [create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:output_queues:1.00 output_queues_0]	
   set_property -dict [list CONFIG.C_M_AXIS_DATA_WIDTH $tdataWidth] $output_queues_0
   set_property -dict [list CONFIG.C_S_AXIS_DATA_WIDTH $tdataWidth] $output_queues_0
 
   # External port connections  
   # axis	 
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins input_arbiter_0/axis_aclk]  
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins vlan_adder_0/axis_aclk]  
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins vlan_remover_0/axis_aclk]  
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins nic_output_port_lookup_0/axis_aclk]
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins output_queues_0/axis_aclk]	
   
   connect_bd_net [get_bd_pins axis_resetn] [get_bd_pins input_arbiter_0/axis_resetn]  
   connect_bd_net [get_bd_pins axis_resetn] [get_bd_pins vlan_adder_0/axis_resetn]  
   connect_bd_net [get_bd_pins axis_resetn] [get_bd_pins vlan_remover_0/axis_resetn]  
   connect_bd_net [get_bd_pins axis_resetn] [get_bd_pins nic_output_port_lookup_0/axis_resetn]
   connect_bd_net [get_bd_pins axis_resetn] [get_bd_pins output_queues_0/axis_resetn]

   # interfaces
   connect_bd_intf_net [get_bd_intf_pin s_axis_0] [get_bd_intf_pins input_arbiter_0/s_axis_0] 	  
   connect_bd_intf_net [get_bd_intf_pin s_axis_1] [get_bd_intf_pins input_arbiter_0/s_axis_1] 
   connect_bd_intf_net [get_bd_intf_pin s_axis_2] [get_bd_intf_pins input_arbiter_0/s_axis_2] 
   connect_bd_intf_net [get_bd_intf_pin s_axis_3] [get_bd_intf_pins input_arbiter_0/s_axis_3] 
   connect_bd_intf_net [get_bd_intf_pin s_axis_4] [get_bd_intf_pins input_arbiter_0/s_axis_4] 

   connect_bd_intf_net [get_bd_intf_pin m_axis_0] [get_bd_intf_pins output_queues_0/m_axis_0] 	  
   connect_bd_intf_net [get_bd_intf_pin m_axis_1] [get_bd_intf_pins output_queues_0/m_axis_1] 
   connect_bd_intf_net [get_bd_intf_pin m_axis_2] [get_bd_intf_pins output_queues_0/m_axis_2] 
   connect_bd_intf_net [get_bd_intf_pin m_axis_3] [get_bd_intf_pins output_queues_0/m_axis_3] 
   connect_bd_intf_net [get_bd_intf_pin m_axis_4] [get_bd_intf_pins output_queues_0/m_axis_4]  
  
   # axi-lite 	     
   connect_bd_net [get_bd_pins s_axi_aclk] [get_bd_pins input_arbiter_0/S_AXI_ACLK] 
   connect_bd_net [get_bd_pins s_axi_aclk] [get_bd_pins vlan_adder_0/S_AXI_ACLK] 
   connect_bd_net [get_bd_pins s_axi_aclk] [get_bd_pins vlan_remover_0/S_AXI_ACLK] 
   connect_bd_net [get_bd_pins s_axi_aclk] [get_bd_pins nic_output_port_lookup_0/S_AXI_ACLK] 
   connect_bd_net [get_bd_pins s_axi_aclk] [get_bd_pins output_queues_0/S_AXI_ACLK] 
 	
   connect_bd_net [get_bd_pins s_axi_aresetn] [get_bd_pins input_arbiter_0/S_AXI_ARESETN]
   connect_bd_net [get_bd_pins s_axi_aresetn] [get_bd_pins vlan_adder_0/S_AXI_ARESETN]
   connect_bd_net [get_bd_pins s_axi_aresetn] [get_bd_pins vlan_remover_0/S_AXI_ARESETN]
   connect_bd_net [get_bd_pins s_axi_aresetn] [get_bd_pins nic_output_port_lookup_0/S_AXI_ARESETN]
   connect_bd_net [get_bd_pins s_axi_aresetn] [get_bd_pins output_queues_0/S_AXI_ARESETN]

   # interfaces
   connect_bd_intf_net [get_bd_intf_pins s_axi_lite_0] [get_bd_intf_pins input_arbiter_0/S_AXI] 	  
   connect_bd_intf_net [get_bd_intf_pins s_axi_lite_1] [get_bd_intf_pins nic_output_port_lookup_0/S_AXI] 
   connect_bd_intf_net [get_bd_intf_pins s_axi_lite_2] [get_bd_intf_pins output_queues_0/S_AXI] 
   connect_bd_intf_net [get_bd_intf_pins s_axi_lite_3] [get_bd_intf_pins vlan_adder_0/S_AXI] 
   connect_bd_intf_net [get_bd_intf_pins s_axi_lite_4] [get_bd_intf_pins vlan_remover_0/S_AXI] 
		
      
   # Internal connection
   connect_bd_intf_net [get_bd_intf_pins input_arbiter_0/m_axis] [get_bd_intf_pins vlan_adder_0/s_axis]
   connect_bd_intf_net [get_bd_intf_pins vlan_adder_0/m_axis] [get_bd_intf_pins vlan_remover_0/s_axis]
   connect_bd_intf_net [get_bd_intf_pins vlan_remover_0/m_axis] [get_bd_intf_pins nic_output_port_lookup_0/s_axis]
   connect_bd_intf_net [get_bd_intf_pins nic_output_port_lookup_0/m_axis] [get_bd_intf_pins output_queues_0/s_axis]

   # Restore current instance
   current_bd_instance $oldCurInst
}
