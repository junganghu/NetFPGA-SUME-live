//
// Copyright (c) 2015-2016 Jong Hun Han
// Copyright (c) 2015 SRI International
// All rights reserved
//
// This software was developed by Stanford University and the University of
// Cambridge Computer Laboratory under National Science Foundation under Grant
// No. CNS-0855268, the University of Cambridge Computer Laboratory under EPSRC
// INTERNET Project EP/H040536/1 and by the University of Cambridge Computer
// Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), as part of
// the DARPA MRC research programme.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor license
// agreements.  See the NOTICE file distributed with this work for additional
// information regarding copyright ownership.  NetFPGA licenses this file to you
// under the NetFPGA Hardware-Software License, Version 1.0 (the "License"); you
// may not use this file except in compliance with the License.  You may obtain
// a copy of the License at:
//
//   http://www.netfpga-cic.org
//
// Unless required by applicable law or agreed to in writing, Work distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@

//Define whether use xilinx tcam or Verilog tcam (this is not recommended).
`define  XIL_TCAM_USE
//Define whether use xilinx ngc fifo or fifo in nf10_proc_common.
//`define  XIL_FIFO
//Define whether use xilinx ngc block memory or verilog memmory.
//`define  XIL_BRAM
//`define  TCAM_MULTI //Define whether use xilinx ngc block memory or verilog memmory.
//`define  TUSER_32

`define  DEF_TCAM_WIDTH    5

//Common data width parameters used for the design.
`define  DEF_MAC_ADDR               48
`define  DEF_IP_ADDR                32
`define  DEF_ETH_TYPE               16
`define  DEF_IP_PROT                8
`define  DEF_PORT_NO                16
`define  DEF_VLAN                   32
//Tag for distribute switch
`define  DEF_SW_TAG                 32
`define  DEF_SW_TAG_VAL             4
// destination port width, needs to add more info.
`define  DEF_ACT_TBL_DATA_WIDTH     8
// TUSER meta data source and destination port width.
`define  DEF_META_PORT_WIDTH        8


//Parameters used in all the modules, parser, match, etc.
`define  TYPE_IPV4                  16'h0008
`define  TYPE_ARP                   16'h0608

`define  PROT_ICMP                  8'h01
`define  PROT_TCP                   8'h06
`define  PROT_UDP                   8'h11

`define  VLAN_TYPE                  16'h0081

// Base address offset
`define  BASE_ADDR      32'h7fa00000
// Base address offsets of data path
`define  BASE_ADDR_DP0  32'h7fa00000
`define  BASE_ADDR_DP1  32'h7fa02000
`define  BASE_ADDR_DP2  32'h7fa04000
`define  BASE_ADDR_DP3  32'h7fa06000
`define  BASE_ADDR_DP4  32'h7fa08000
// Base address offsets of match table
`define  BASE_ADDR_TBL  32'h7fa0a000
