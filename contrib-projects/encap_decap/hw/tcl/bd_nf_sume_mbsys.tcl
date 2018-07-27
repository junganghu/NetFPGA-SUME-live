#
# Copyright (c) 2015 University of Cambridge All rights reserved.
#
# This software was developed by Stanford University and the University of Cambridge Computer Laboratory 
# under National Science Foundation under Grant No. CNS-0855268,
# the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
# by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
# as part of the DARPA MRC research programme.
#
# @NETFPGA_LICENSE_HEADER_START@
#
# Licensed to NetFPGA C.I.C. (NetFPGA) under one or more
# contributor license agreements.  See the NOTICE file distributed with this
# work for additional information regarding copyright ownership.  NetFPGA
# licenses this file to you under the NetFPGA Hardware-Software License,
# Version 1.0 (the "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at:
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

# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

   if { $parentCell eq "" || $nameHier eq "" } {
      puts "ERROR: create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"
      return
   }

   # Get object for parentCell
   set parentObj [get_bd_cells $parentCell]
   if { $parentObj == "" } {
      puts "ERROR: Unable to find parent cell <$parentCell>!"
      return
   }

   # Make sure parentObj is hier blk
   set parentType [get_property TYPE $parentObj]
   if { $parentType ne "hier" } {
      puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
      return
   }

   # Save current instance; Restore later
   set oldCurInst [current_bd_instance .]

   # Set parent object as current
   current_bd_instance $parentObj

   # Create cell and set as current instance
   set hier_obj [create_bd_cell -type hier $nameHier]
   current_bd_instance $hier_obj

   # Create interface pins
   create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
   create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB

   # Create pins
   create_bd_pin -dir I -type clk LMB_Clk
   create_bd_pin -dir I -type rst LMB_Rst

   # Create instance: dlmb_bram_if_cntlr, and set properties
   set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
   set_property -dict [ list CONFIG.C_ECC {0}  ] $dlmb_bram_if_cntlr

   # Create instance: dlmb_v10, and set properties
   set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

   # Create instance: ilmb_bram_if_cntlr, and set properties
   set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
   set_property -dict [ list CONFIG.C_ECC {0}  ] $ilmb_bram_if_cntlr

   # Create instance: ilmb_v10, and set properties
   set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

   # Create instance: lmb_bram, and set properties
   set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.2 lmb_bram ]
   set_property -dict [ list CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.use_bram_block {BRAM_Controller}  ] $lmb_bram

   # Create interface connections
   connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
   connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
   connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
   connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
   connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
   connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

   # Create port connections
   connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]
   connect_bd_net -net microblaze_0_LMB_Rst [get_bd_pins LMB_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]
  
   # Restore current instance
   current_bd_instance $oldCurInst
}

# Hierarchical cell: mbsys
proc create_hier_cell_mbsys { parentCell nameHier } {

   if { $parentCell eq "" || $nameHier eq "" } {
      puts "ERROR: create_hier_cell_mbsys() - Empty argument(s)!"
      return
   }

   # Get object for parentCell
   set parentObj [get_bd_cells $parentCell]
   if { $parentObj == "" } {
      puts "ERROR: Unable to find parent cell <$parentCell>!"
      return
   }

   # Make sure parentObj is hier blk
   set parentType [get_property TYPE $parentObj]
   if { $parentType ne "hier" } {
      puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
      return
   }

   # Save current instance; Restore later
   set oldCurInst [current_bd_instance .]

   # Set parent object as current
   current_bd_instance $parentObj

   # Create cell and set as current instance
   set hier_obj [create_bd_cell -type hier $nameHier]
   current_bd_instance $hier_obj

   # Create pins
   create_bd_pin -dir I -type clk Clk
   create_bd_pin -dir I -from 0 -to 0 In0
   create_bd_pin -dir I -from 0 -to 0 In1
   create_bd_pin -dir I LMB_Rst
   create_bd_pin -dir I Reset
   create_bd_pin -dir I s_axi_aresetn
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI 

   create_bd_pin -dir O Debug_SYS_Rst
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI

   # Create instance: mdm_1, and set properties
   set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]

   # Create instance: microblaze_0, and set properties
   set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:9.4 microblaze_0 ]
   set_property -dict [ list CONFIG.C_DEBUG_ENABLED {1} CONFIG.C_D_AXI {1} CONFIG.C_D_LMB {1} CONFIG.C_I_LMB {1}  ] $microblaze_0

   # Create instance: microblaze_0_axi_intc, and set properties
   set microblaze_0_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_0_axi_intc ]
   set_property -dict [ list CONFIG.C_HAS_FAST {1}  ] $microblaze_0_axi_intc

   # Create instance: microblaze_0_local_memory
   create_hier_cell_microblaze_0_local_memory $hier_obj microblaze_0_local_memory

   # Create instance: microblaze_0_xlconcat, and set properties
   set microblaze_0_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_0_xlconcat ]

   connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
   connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
   connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
   connect_bd_intf_net -intf_net microblaze_0_interrupt [get_bd_intf_pins microblaze_0/INTERRUPT] [get_bd_intf_pins microblaze_0_axi_intc/interrupt]

   # Create port connections
   connect_bd_net [get_bd_pins Clk] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_intc/processor_clk] [get_bd_pins microblaze_0_axi_intc/s_axi_aclk] [get_bd_pins microblaze_0_local_memory/LMB_Clk]
   connect_bd_net [get_bd_pins Reset] [get_bd_pins microblaze_0/Reset] [get_bd_pins microblaze_0_axi_intc/processor_rst]
   connect_bd_net [get_bd_pins In0] [get_bd_pins microblaze_0_xlconcat/In0]
   connect_bd_net [get_bd_pins In1] [get_bd_pins microblaze_0_xlconcat/In1]
   connect_bd_net [get_bd_pins microblaze_0_axi_intc/intr] [get_bd_pins microblaze_0_xlconcat/dout]
   connect_bd_intf_net [get_bd_intf_pins S_AXI] [get_bd_intf_pins microblaze_0_axi_intc/s_axi]
   connect_bd_intf_net [get_bd_intf_pins M_AXI] [get_bd_intf_pins microblaze_0/M_AXI_DP]
   connect_bd_net [get_bd_pins LMB_Rst] [get_bd_pins microblaze_0_local_memory/LMB_Rst]
   connect_bd_net [get_bd_pins Debug_SYS_Rst] [get_bd_pins mdm_1/Debug_SYS_Rst]
   connect_bd_net [get_bd_pins s_axi_aresetn] [get_bd_pins microblaze_0_axi_intc/s_axi_aresetn]

   # Restore current instance
   current_bd_instance $oldCurInst
}

