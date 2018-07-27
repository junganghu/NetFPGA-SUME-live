//
// Copyright (c) 2015 University of Cambridge
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

`timescale 1 ns/1ps 
 
`include "nf_sume_blueswitch_register_define.v" 
`include "nf_sume_blueswitch_parameter_define.v" 
 
module packet_data_marshaller 
#( 
   parameter   C_M_AXIS_TDATA_WIDTH       = 64, 
   parameter   C_S_AXIS_TDATA_WIDTH       = 64, 
   parameter   C_M_AXIS_TUSER_WIDTH       = 128, 
   parameter   C_S_AXIS_TUSER_WIDTH       = 128, 
 
   //HDR_MAC_ADDR_WIDTH*2 + HDR_IP_PROT_WIDTH + HDR_ETH_TYPE_WIDTH*3 + HDR_IP_ADDR_WIDTH*2
   parameter   C_S_ACT_TDATA_WIDTH        = 46, 
   parameter   C_S_ACT_TUSER_WIDTH        = 8,
   parameter   SOURCE_PORT                = 0
) 
( 
   input                                              axis_aclk, 
   input                                              axis_resetn,

   input          [31:0]                              bus_sw_tag,
 
   // Slave Stream Ports (interface to data path) 
   input          [C_S_AXIS_TDATA_WIDTH-1:0]          s_axis_tdata, 
   input          [((C_S_AXIS_TDATA_WIDTH/8))-1:0]    s_axis_tstrb, 
   input          [C_S_AXIS_TUSER_WIDTH-1:0]          s_axis_tuser, 
   input                                              s_axis_tvalid, 
   output   reg                                       s_axis_tready, 
   input                                              s_axis_tlast, 
 
   // Master Stream Ports (interface to TX queues) 
   output   reg   [C_M_AXIS_TDATA_WIDTH-1:0]          m_axis_tdata, 
   output   reg   [((C_M_AXIS_TDATA_WIDTH/8))-1:0]    m_axis_tstrb, 
   output   reg   [C_M_AXIS_TUSER_WIDTH-1:0]          m_axis_tuser, 
   output   reg                                       m_axis_tvalid, 
   input                                              m_axis_tready, 
   output   reg                                       m_axis_tlast, 
 
   // Action results Slave Stream Ports (interface to data path)
   // Destination port, hit, miss, VLAN, vlan action, sw tags, sw tags en.
   // sw tags is the result of checksum of source and destination mac
   // addresses.
   // 32 + 4 + 8 + 2 + 16 + 2 = 64
   // {sw tag(32), sw tag val(4), vlan action(2), vlan(16), miss(1), hit(1), destination port(8)}
   // sw tags en, 0: no sw tags, 1: add, 2: remove.
   // vlan action, 0: no vlan, 1: add, 2: remove.
   input          [C_S_ACT_TDATA_WIDTH-1:0]           s_action_tdata, 
   input          [C_S_ACT_TUSER_WIDTH-1:0]           s_action_tuser, 
   input                                              s_action_tvalid, 
   output   reg                                       s_action_tready,

   input          [7:0]                               bus_miss_fwd_port_map
); 
 
`define  ST_TX_PKT_IDLE       0 
`define  ST_TX_PKT_WR_INIT    1 
`define  ST_TX_PKT_WR         2
//VLAN action states.
`define  ST_VLAN_ADD_INIT     3 
`define  ST_VLAN_ADD          4 
`define  ST_VLAN_ADD_WR       5 
`define  ST_VLAN_ADD_EXT      6//Extend one cycle for added vlan 
`define  ST_VLAN_RM_INIT      7 
`define  ST_VLAN_RM_LSB       8 
`define  ST_VLAN_RM_MSB       9 
 
reg   [C_S_AXIS_TDATA_WIDTH-1:0]       s_axis_tdata_d1; 
reg   [(C_S_AXIS_TDATA_WIDTH/8)-1:0]   s_axis_tstrb_d1; 
reg   [C_S_AXIS_TUSER_WIDTH-1:0]       s_axis_tuser_d1; 
reg   s_axis_tvalid_d1, s_axis_tlast_d1; 
 
reg   [C_S_AXIS_TDATA_WIDTH-1:0]       s_axis_tdata_d2; 
reg   [(C_S_AXIS_TDATA_WIDTH/8)-1:0]   s_axis_tstrb_d2; 
reg   [C_S_AXIS_TUSER_WIDTH-1:0]       s_axis_tuser_d2; 
reg   s_axis_tvalid_d2, s_axis_tlast_d2;


reg   [3:0] StTxPktCurrent, StTxPktNext; 
always @(posedge axis_aclk) 
   if (~axis_resetn) 
      StTxPktCurrent <= 0; 
   else 
      StTxPktCurrent <= StTxPktNext;

reg   [`DEF_META_PORT_WIDTH-1:0]    r_action_result;
always @(*) begin
   // Default and miss condition, flood packets except the source port itself.
   //r_action_result = ~s_axis_tuser[16+:8];
   r_action_result = ~s_axis_tuser[16+:8];
   // Register setting for forcing packets to forward before considering HIT
   // condition.  
   if (bus_miss_fwd_port_map != 0) begin
      r_action_result = bus_miss_fwd_port_map;
   end
   // Hit condition
   else if (s_action_tdata[`DEF_META_PORT_WIDTH]) begin
      r_action_result = s_action_tdata[0+:`DEF_META_PORT_WIDTH];
   end
end

//0: nothing, 1: remove vlan, 2: add vlan
wire  [1:0] w_vlan_act = s_action_tdata[(`DEF_META_PORT_WIDTH+2+`DEF_ETH_TYPE)+:2];
wire  w_vlan_rm_en = (w_vlan_act == 1);
wire  w_vlan_add_en = (w_vlan_act == 2);
wire  w_vlan_en = w_vlan_rm_en | w_vlan_add_en;

wire  [`DEF_SW_TAG_VAL-1:0]   w_sw_tag_act = s_action_tdata[(`DEF_META_PORT_WIDTH+2+`DEF_ETH_TYPE+2)+:`DEF_SW_TAG_VAL];
wire  w_sw_tag_rm_en = (w_sw_tag_act == 4);
wire  w_sw_tag_add_en = (w_sw_tag_act == 2 || w_sw_tag_act == 3);
wire  w_sw_tag_en = w_sw_tag_rm_en | w_sw_tag_add_en;

always @(posedge axis_aclk) 
   if (~axis_resetn) begin 
      s_axis_tdata_d1   <= 0; 
      s_axis_tstrb_d1   <= 0; 
      s_axis_tuser_d1   <= 0; 
      s_axis_tlast_d1   <= 0; 
      s_axis_tvalid_d1  <= 0; 
      s_axis_tdata_d2   <= 0; 
      s_axis_tstrb_d2   <= 0; 
      s_axis_tuser_d2   <= 0; 
      s_axis_tlast_d2   <= 0; 
      s_axis_tvalid_d2  <= 0; 
   end 
   else begin 
      s_axis_tdata_d1   <= s_axis_tdata; 
      s_axis_tstrb_d1   <= s_axis_tstrb; 
      s_axis_tuser_d1   <= s_axis_tuser; 
      s_axis_tlast_d1   <= s_axis_tlast; 
      s_axis_tvalid_d1  <= s_axis_tvalid; 
      s_axis_tdata_d2   <= s_axis_tdata_d1; 
      s_axis_tstrb_d2   <= s_axis_tstrb_d1; 
      s_axis_tuser_d2   <= s_axis_tuser_d1; 
      s_axis_tlast_d2   <= s_axis_tlast_d1; 
      s_axis_tvalid_d2  <= s_axis_tvalid_d1; 
   end 
 
always @(*) begin 
   m_axis_tdata      = 0; 
   m_axis_tstrb      = 0; 
   m_axis_tuser      = 0; 
   m_axis_tlast      = 0; 
   m_axis_tvalid     = 0; 
   s_axis_tready     = 0; 
   s_action_tready   = 0; 
   StTxPktNext       = `ST_TX_PKT_IDLE; 
   case (StTxPktCurrent) 
      `ST_TX_PKT_IDLE : begin //Update Tuser at this state. 
         m_axis_tdata      = 0; 
         m_axis_tstrb      = 0; 
         m_axis_tuser      = 0;
         m_axis_tlast      = 0; 
         m_axis_tvalid     = 0; 
         s_axis_tready     = ((s_action_tvalid & s_axis_tvalid & m_axis_tready) && (w_vlan_en | w_sw_tag_en)) ? 1 : 0;
         s_action_tready   = 0; 
         StTxPktNext       = (s_action_tvalid & s_axis_tvalid & m_axis_tready) ?
                                 (w_vlan_add_en | w_sw_tag_add_en) ? `ST_VLAN_ADD_INIT :
                                 (w_vlan_rm_en  | w_sw_tag_rm_en)  ? `ST_VLAN_RM_INIT  : `ST_TX_PKT_WR_INIT :
                                 `ST_TX_PKT_IDLE;
      end 
      `ST_TX_PKT_WR_INIT : begin 
         m_axis_tdata      = s_axis_tdata; 
         m_axis_tstrb      = s_axis_tstrb; 
         m_axis_tuser      = {s_axis_tuser[32+:96], 
                              r_action_result, // Destination port
                              {1'b0, r_action_result[`DEF_META_PORT_WIDTH-1:1]}, // Source port
                              //s_action_tdata[C_S_ACT_TDATA_WIDTH-1], //Miss
                              //s_action_tdata[C_S_ACT_TDATA_WIDTH-2], //Hit
                              s_axis_tuser[0+:16]}; 
         m_axis_tlast      = (s_action_tvalid & s_axis_tvalid & m_axis_tready) & s_axis_tlast; 
         m_axis_tvalid     = (s_action_tvalid & s_axis_tvalid & m_axis_tready); 
         s_axis_tready     = (s_action_tvalid & s_axis_tvalid & m_axis_tready); 
         s_action_tready   = (s_action_tvalid & s_axis_tvalid & m_axis_tready); 
         StTxPktNext       = ((s_action_tvalid & s_axis_tvalid & m_axis_tready) & s_axis_tlast) ? `ST_TX_PKT_IDLE : 
                             (s_action_tvalid & s_axis_tvalid & m_axis_tready)                  ? `ST_TX_PKT_WR   : `ST_TX_PKT_WR_INIT;
      end 
      `ST_TX_PKT_WR : begin 
         m_axis_tdata      = s_axis_tdata; 
         m_axis_tstrb      = s_axis_tstrb; 
         m_axis_tuser      = 0; 
         m_axis_tlast      = (s_axis_tvalid & m_axis_tready) & s_axis_tlast; 
         m_axis_tvalid     = (s_axis_tvalid & m_axis_tready); 
         s_axis_tready     = (s_axis_tvalid & m_axis_tready); 
         s_action_tready   = 0; 
         StTxPktNext       = ((s_axis_tvalid & m_axis_tready) & s_axis_tlast) ? `ST_TX_PKT_IDLE : `ST_TX_PKT_WR; 
      end
      //Vlan add case has been verified with increasing size of packets in a unit of byte.
      `ST_VLAN_ADD_INIT : begin 
         m_axis_tdata      = s_axis_tdata_d1; 
         m_axis_tstrb      = s_axis_tstrb_d1; 
         m_axis_tuser      = {s_axis_tuser_d1[32+:96],
                              r_action_result,
                              {1'b0, r_action_result[`DEF_META_PORT_WIDTH-1:1]}, // Source port
                              //s_action_tdata[9],
                              //s_action_tdata[8],
                              s_axis_tuser_d1[0+:16]} + 4;
         m_axis_tlast      = (s_action_tvalid & s_axis_tvalid_d1 & m_axis_tready) & s_axis_tlast_d1;
         m_axis_tvalid     = (s_action_tvalid & s_axis_tvalid_d1 & m_axis_tready);
         s_axis_tready     = (s_action_tvalid & s_axis_tvalid_d1 & m_axis_tready); 
         s_action_tready   = (s_action_tvalid & s_axis_tvalid_d1 & m_axis_tready);
         StTxPktNext       = ((s_action_tvalid & s_axis_tvalid_d1 & m_axis_tready) & s_axis_tlast_d1) ? `ST_TX_PKT_IDLE : 
                             ( s_action_tvalid & s_axis_tvalid_d1 & m_axis_tready)                    ? `ST_VLAN_ADD    : `ST_VLAN_ADD_INIT; 
      end 
      `ST_VLAN_ADD : begin 
         //m_axis_tdata      = {32'h0123abcd, s_axis_tdata_d1[0+:32]};
         m_axis_tdata      = {bus_sw_tag,   s_axis_tdata_d1[0+:32]};
         m_axis_tstrb      = {4'hf,         s_axis_tstrb_d1[0+:4]}; 
         m_axis_tuser      = 0; 
         m_axis_tlast      = (s_axis_tvalid_d1 & m_axis_tready) & s_axis_tlast_d1; 
         m_axis_tvalid     = (s_axis_tvalid_d1 & m_axis_tready); 
         s_axis_tready     = (s_axis_tvalid_d1 & m_axis_tready); 
         s_action_tready   = 0; 
         StTxPktNext       = ((s_axis_tvalid_d1 & m_axis_tready) & s_axis_tlast_d1) ? `ST_TX_PKT_IDLE :
                             ( s_axis_tvalid_d1 & m_axis_tready)                    ? `ST_VLAN_ADD_WR : `ST_VLAN_ADD;
      end 
      `ST_VLAN_ADD_WR : begin 
         m_axis_tdata      = {s_axis_tdata_d1[0+:32], s_axis_tdata_d2[32+:32]}; 
         m_axis_tstrb      = {s_axis_tstrb_d1[0+:4],  s_axis_tstrb_d2[4+:4]}; 
         m_axis_tuser      = 0; 
         m_axis_tlast      = ( s_axis_tvalid_d1 & m_axis_tready  & s_axis_tlast_d1) & ~(|s_axis_tstrb_d1[4+:4]); 
         m_axis_tvalid     = ( s_axis_tvalid_d1 & m_axis_tready); 
         s_axis_tready     = ( s_axis_tvalid_d1 & m_axis_tready) & ~s_axis_tlast_d1;
         s_action_tready   = 0; 
         StTxPktNext       = ((s_axis_tvalid_d1 & m_axis_tready & s_axis_tlast_d1) & ~(|s_axis_tstrb_d1[4+:4])) ? `ST_TX_PKT_IDLE  :
                             ((s_axis_tvalid_d1 & m_axis_tready & s_axis_tlast_d1) &  (|s_axis_tstrb_d1[4+:4])) ? `ST_VLAN_ADD_EXT : `ST_VLAN_ADD_WR;
      end 
      `ST_VLAN_ADD_EXT : begin 
         m_axis_tdata      = {32'h0, s_axis_tdata_d2[32+:32]}; 
         m_axis_tstrb      = {4'h0,  s_axis_tstrb_d2[4+:4]}; 
         m_axis_tuser      = 0; 
         m_axis_tlast      = 1; 
         m_axis_tvalid     = 1; 
         s_axis_tready     = 0; 
         s_action_tready   = 0; 
         StTxPktNext       = `ST_TX_PKT_IDLE; 
      end 
      //Vlan remove case has been verified with increasing size of packets in a unit of byte.
      `ST_VLAN_RM_INIT : begin 
         m_axis_tdata      = s_axis_tdata_d1; 
         m_axis_tstrb      = s_axis_tstrb_d1; 
         m_axis_tuser      = {s_axis_tuser_d1[32+:96],
                              r_action_result,
                              {1'b0, r_action_result[`DEF_META_PORT_WIDTH-1:1]}, // Source port
                              //s_action_tdata[9],
                              //s_action_tdata[8],
                              s_axis_tuser_d1[0+:16]} - 4;
         m_axis_tlast      = ((s_action_tvalid & s_axis_tvalid_d1 & m_axis_tready) & s_axis_tlast_d1); 
         m_axis_tvalid     = ( s_action_tvalid & s_axis_tvalid_d1 & m_axis_tready); 
         s_axis_tready     = ( s_action_tvalid & s_axis_tvalid_d1 & m_axis_tready); 
         s_action_tready   = 1; 
         StTxPktNext       = ((s_action_tvalid & s_axis_tvalid_d1 & m_axis_tready) & s_axis_tlast_d1) ? `ST_TX_PKT_IDLE : 
                             ( s_action_tvalid & s_axis_tvalid_d1 & m_axis_tready)                    ? `ST_VLAN_RM_LSB : `ST_VLAN_RM_INIT; 
      end 
      `ST_VLAN_RM_LSB : begin 
         m_axis_tdata      = ((s_axis_tvalid_d1 & m_axis_tready & s_axis_tlast) & ~(|s_axis_tstrb[4+:4])) ? {s_axis_tdata[0+:32], s_axis_tdata_d1[32+:32]} :
                             ( s_axis_tvalid_d1 & m_axis_tready & s_axis_tlast_d1)                        ? {32'h0,               s_axis_tdata_d1[32+:32]} :
                                                                                                            {s_axis_tdata[0+:32], s_axis_tdata_d1[0+:32]}; 
         m_axis_tstrb      = ((s_axis_tvalid_d1 & m_axis_tready & s_axis_tlast) & ~(|s_axis_tstrb[4+:4])) ? {s_axis_tstrb[0+:4],  s_axis_tstrb_d1[4+:4]} :
                             ( s_axis_tvalid_d1 & m_axis_tready & s_axis_tlast_d1)                        ? {4'h0,                s_axis_tstrb_d1[4+:4]} : 
                                                                                                            {s_axis_tstrb[0+:4],  s_axis_tstrb_d1[0+:4]}; 
         m_axis_tuser      = 0; 
         m_axis_tlast      = ((s_axis_tvalid_d1 & m_axis_tready & s_axis_tlast) & ~(|s_axis_tstrb[4+:4])) ? 1 :
                             ( s_axis_tvalid_d1 & m_axis_tready & s_axis_tlast_d1)                        ? (|s_axis_tstrb_d1[4+:4]) : 0; 
         m_axis_tvalid     = ( s_axis_tvalid_d1 & m_axis_tready); 
         s_axis_tready     = ( s_axis_tvalid_d1 & m_axis_tready) & ~s_axis_tlast_d1; 
         s_action_tready   = 0; 
         StTxPktNext       = ((s_axis_tvalid_d1 & m_axis_tready & s_axis_tlast) & ~(|s_axis_tstrb[4+:4]))      ? `ST_TX_PKT_IDLE :
                             ((s_axis_tvalid_d1 & m_axis_tready & s_axis_tlast_d1) & (|s_axis_tstrb_d1[4+:4])) ? `ST_TX_PKT_IDLE :
                             ( s_axis_tvalid_d1 & m_axis_tready)                                               ? `ST_VLAN_RM_MSB : `ST_VLAN_RM_LSB;
      end 
      `ST_VLAN_RM_MSB : begin 
         m_axis_tdata      = (s_axis_tvalid_d1 & m_axis_tready & s_axis_tlast_d1 & (|s_axis_tstrb_d1[4+:4])) ? {32'h0,               s_axis_tdata_d1[32+:32]} :
                                                                                                               {s_axis_tdata[0+:32], s_axis_tdata_d1[32+:32]};
         m_axis_tstrb      = (s_axis_tvalid_d1 & m_axis_tready & s_axis_tlast_d1 & (|s_axis_tstrb_d1[4+:4])) ? {4'h0,                s_axis_tstrb_d1[4+:4]} :
                                                                                                               {s_axis_tstrb[0+:4],  s_axis_tstrb_d1[4+:4]}; 
         m_axis_tuser      = 0;
         m_axis_tlast      = (s_axis_tvalid_d1 & m_axis_tready & s_axis_tlast_d1) ? 1 :
                             (s_axis_tvalid_d1 & m_axis_tready & s_axis_tlast)    ? ~(|s_axis_tstrb[4+:4]) : 0; 
         m_axis_tvalid     = (s_axis_tvalid_d1 & m_axis_tready);
         s_axis_tready     = (s_axis_tvalid_d1 & m_axis_tready) & ~s_axis_tlast_d1;
         s_action_tready   = 0;
         StTxPktNext       = ((s_axis_tvalid_d1 & m_axis_tready & s_axis_tlast) & ~(|s_axis_tstrb[4+:4]))      ? `ST_TX_PKT_IDLE :
                             ((s_axis_tvalid_d1 & m_axis_tready & s_axis_tlast_d1) & (|s_axis_tstrb_d1[4+:4])) ? `ST_TX_PKT_IDLE :
                             ( s_axis_tvalid_d1 & m_axis_tready)                                               ? `ST_VLAN_RM_LSB : `ST_VLAN_RM_MSB;
      end 
   endcase 
end 
 
endmodule 
