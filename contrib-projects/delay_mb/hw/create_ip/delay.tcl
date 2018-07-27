#
# Copyright (c) 2016 Noa Zilberman
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

# Set variables



create_ip -name fifo_generator -vendor xilinx.com -library ip -version 12.0 -module_name delay_fifo
set_property -dict [list CONFIG.FIFO_Implementation_wach {Common_Clock_Distributed_RAM} CONFIG.FIFO_Implementation_rach {Common_Clock_Distributed_RAM} CONFIG.FIFO_Implementation_wrch {Common_Clock_Distributed_RAM}] [get_ips delay_fifo]
set_property -dict [list CONFIG.INTERFACE_TYPE {Native}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Almost_Full_Flag {true} CONFIG.Write_Acknowledge_Flag {false}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Data_Count {true}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Programmable_Empty_Type {No_Programmable_Empty_Threshold}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Use_Extra_Logic {true}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Performance_Options {First_Word_Fall_Through}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Input_Data_Width {449} CONFIG.Input_Depth {32768}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Reset_Pin {true}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Output_Data_Width {449} CONFIG.Output_Depth {32768}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Full_Flags_Reset_Value {1}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Use_Dout_Reset {true}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Data_Count_Width {16}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Write_Data_Count_Width {16}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Read_Data_Count_Width {16}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Full_Threshold_Assert_Value {32767}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Full_Threshold_Negate_Value {32766}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Empty_Threshold_Assert_Value {4}] [get_ips delay_fifo]
set_property -dict [list CONFIG.Empty_Threshold_Negate_Value {5}] [get_ips delay_fifo]

set_property generate_synth_checkpoint false [get_files delay_fifo.xci]
reset_target all [get_ips delay_fifo]
generate_target all [get_ips delay_fifo]
