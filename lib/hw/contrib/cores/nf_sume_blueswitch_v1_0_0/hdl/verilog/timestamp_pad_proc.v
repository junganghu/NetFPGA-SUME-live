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

`timescale 1ns/1ps

`include "nf_sume_blueswitch_register_define.v"
`include "nf_sume_blueswitch_parameter_define.v"

module timestamp_pad_proc
#(
   parameter   TS_POSITION_WIDTH       = 8,
   parameter   C_M_AXIS_TDATA_WIDTH    = 256,
   parameter   C_S_AXIS_TDATA_WIDTH    = 256
)
(
   input                                              axi_aclk,
   input                                              axi_resetn,

   input       [63:0]                                 ref_counter,
   input                                              ts_valid,
   input       [TS_POSITION_WIDTH-1:0]                slave_ts_position,
   input       [TS_POSITION_WIDTH-1:0]                master_ts_position,
   //Slave Stream Ports (interface to data path)
   input       [C_S_AXIS_TDATA_WIDTH-1:0]             s_axis_tdata,
   input                                              s_axis_tvalid,
   input                                              s_axis_tready,
   input                                              s_axis_tlast,
   //To rx fifo
   output      [C_S_AXIS_TDATA_WIDTH-1:0]             s_axis_tdata_ts_pad,
   //Master Stream Ports (interface to TX queues)
   input       [C_M_AXIS_TDATA_WIDTH-1:0]             m_axis_tdata,
   input                                              m_axis_tvalid,
   input                                              m_axis_tready,
   input                                              m_axis_tlast,
   //From tx fifo
   output      [C_M_AXIS_TDATA_WIDTH-1:0]             m_axis_tdata_ts_pad
);

//Add packet data in passive way at axis slave
reg   [7:0] slave_pkt_word_cnt, master_pkt_word_cnt;

always @(posedge axi_aclk)
 if (~axi_resetn)
    slave_pkt_word_cnt  <= 0;
 else if (s_axis_tlast & s_axis_tvalid & s_axis_tready)
    slave_pkt_word_cnt  <= 0;
 else if (s_axis_tvalid & s_axis_tready)
    slave_pkt_word_cnt  <= slave_pkt_word_cnt + 1;

assign s_axis_tdata_ts_pad = (ts_valid && (slave_ts_position[7:0] == slave_pkt_word_cnt)) ? ref_counter : s_axis_tdata;

//Add packet data in passive way at axis master 
always @(posedge axi_aclk)
 if (~axi_resetn)
    master_pkt_word_cnt <= 0;
 else if (m_axis_tlast & m_axis_tvalid & m_axis_tready)
    master_pkt_word_cnt <= 0;
 else if (m_axis_tvalid & m_axis_tready)
    master_pkt_word_cnt <= master_pkt_word_cnt + 1;

assign m_axis_tdata_ts_pad = (ts_valid && (master_ts_position[7:0] == master_pkt_word_cnt)) ? ref_counter : m_axis_tdata;

endmodule
