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

module checksum_processor
#(
   parameter   C_S_AXIS_TDATA_WIDTH       = 256,
   parameter   C_S_AXIS_TUSER_WIDTH       = 256
)
(
   input                                           axi_aclk,
   input                                           axi_resetn,

   //Slave Stream Ports (interface to data path)
   input          [C_S_AXIS_TDATA_WIDTH-1:0]       s_axis_tdata,
   input          [(C_S_AXIS_TDATA_WIDTH/8)-1:0]   s_axis_tstrb,
   input          [C_S_AXIS_TUSER_WIDTH-1:0]       s_axis_tuser,
   input                                           s_axis_tlast,
   input                                           s_axis_tvalid
);


reg   [C_S_AXIS_TDATA_WIDTH-1:0]       r_tdata;
reg   [(C_S_AXIS_TDATA_WIDTH/8)-1:0]   r_tstrb;
reg   [C_S_AXIS_TUSER_WIDTH-1:0]       r_tuser;
reg                                    r_tlast;
reg                                    r_tvalid;

reg   [7:0]    pkt_cnt;

reg   [15:0]   ip_bytes[0:(C_S_AXIS_TDATA_WIDTH/16)-1], ip_check_sum;
reg   [31:0]   ip_bytes_sum_current, ip_bytes_sum_next, ip_bytes_sum;

reg   [15:0]   udp_bytes[0:(C_S_AXIS_TDATA_WIDTH/16)-1], udp_check_sum;
reg   [31:0]   udp_bytes_sum_current, udp_bytes_sum_next, udp_bytes_sum;

reg   [15:0]   tcp_bytes[0:(C_S_AXIS_TDATA_WIDTH/16)-1], tcp_check_sum;
reg   [31:0]   tcp_bytes_sum_current, tcp_bytes_sum_next, tcp_bytes_sum;


always @(posedge axi_aclk)
   if (~axi_resetn) begin
      r_tdata  <= 0;
      r_tstrb  <= 0;
      r_tuser  <= 0;
      r_tlast  <= 0;
      r_tvalid <= 0;
   end
   else begin
      r_tdata  <= s_axis_tdata;
      r_tstrb  <= s_axis_tstrb;
      r_tuser  <= s_axis_tuser;
      r_tlast  <= s_axis_tlast;
      r_tvalid <= s_axis_tvalid;
   end

always @(posedge axi_aclk)
   if (~axi_resetn) begin
      pkt_cnt                 <= 0;
      ip_bytes_sum_current    <= 0;
      udp_bytes_sum_current   <= 0;
      tcp_bytes_sum_current   <= 0;
   end
   else if (r_tvalid && r_tlast) begin
      pkt_cnt                 <= 0;
      ip_bytes_sum_current    <= 0;
      udp_bytes_sum_current   <= 0;
      tcp_bytes_sum_current   <= 0;
   end
   else if (r_tvalid) begin
      pkt_cnt                 <= pkt_cnt + 1;
      ip_bytes_sum_current    <= ip_bytes_sum_next;
      udp_bytes_sum_current   <= udp_bytes_sum_next;
      tcp_bytes_sum_current   <= tcp_bytes_sum_next;
   end

//IPv4 checksum computation.
wire ip_bytes_3_en = (pkt_cnt == 1) || (pkt_cnt == 2) || (pkt_cnt == 3);
wire ip_bytes_2_en = (pkt_cnt == 2) || (pkt_cnt == 3);
wire ip_bytes_1_en = (pkt_cnt == 2) || (pkt_cnt == 3);
wire ip_bytes_0_en = (pkt_cnt == 2) || (pkt_cnt == 4);

always @(r_tvalid or ip_bytes_3_en or ip_bytes_2_en or ip_bytes_1_en or ip_bytes_0_en) begin
   ip_bytes[3] = (r_tvalid && ip_bytes_3_en) ? r_tdata[48+:16] : 0;
   ip_bytes[2] = (r_tvalid && ip_bytes_2_en) ? r_tdata[32+:16] : 0;
   ip_bytes[1] = (r_tvalid && ip_bytes_1_en) ? r_tdata[16+:16] : 0;
   ip_bytes[0] = (r_tvalid && ip_bytes_0_en) ? r_tdata[0+:16]  : 0;
   
   ip_bytes_sum      = ip_bytes[0] + ip_bytes[1] + ip_bytes[2] + ip_bytes[3] + ip_bytes_sum_current;
   ip_bytes_sum_next = ip_bytes_sum;

   ip_check_sum      = ~(ip_bytes_sum[31:16] + ip_bytes_sum[15:0]);
end

//UDP checksum computation.
wire udp_bytes_3_en_n = (pkt_cnt == 0) || (pkt_cnt == 1);
wire udp_bytes_2_en_n = (pkt_cnt == 0) || (pkt_cnt == 1) || (pkt_cnt == 2);
wire udp_bytes_1_en_n = (pkt_cnt == 0) || (pkt_cnt == 1) || (pkt_cnt == 2);
wire udp_bytes_0_en_n = (pkt_cnt == 0) || (pkt_cnt == 1) || (pkt_cnt == 2) || (pkt_cnt == 3) || (pkt_cnt == 5);

//For pseudo IP header calculation, the upd protocol is only required with zeros.
wire  [15:0]   udp_bytes_en_3 = (pkt_cnt == 2) ? 16'hff00 : {{8{r_tstrb[7]}}, {8{r_tstrb[6]}}};
wire  [15:0]   udp_bytes_en_2 = {{8{r_tstrb[5]}}, {8{r_tstrb[4]}}};
wire  [15:0]   udp_bytes_en_1 = {{8{r_tstrb[3]}}, {8{r_tstrb[2]}}};
wire  [15:0]   udp_bytes_en_0 = {{8{r_tstrb[1]}}, {8{r_tstrb[0]}}};

always @(r_tvalid or ip_bytes_3_en or ip_bytes_2_en or ip_bytes_1_en or ip_bytes_0_en) begin
   udp_bytes[3] = (r_tvalid && udp_bytes_3_en_n) ? 0 : r_tdata[48+:16] & udp_bytes_en_3;
   udp_bytes[2] = (r_tvalid && udp_bytes_2_en_n) ? 0 : r_tdata[32+:16] & udp_bytes_en_2;
   udp_bytes[1] = (r_tvalid && udp_bytes_1_en_n) ? 0 : r_tdata[16+:16] & udp_bytes_en_1;
   udp_bytes[0] = (r_tvalid && udp_bytes_0_en_n) ? 0 : r_tdata[0+:16]  & udp_bytes_en_0;

   //For Pseudo IP header calculation, the upd length must be added one more. 
   udp_bytes_sum      = (pkt_cnt == 4) ? udp_bytes[0] + udp_bytes[1] + udp_bytes[2] + udp_bytes[3] + udp_bytes[3] + udp_bytes_sum_current :
                                         udp_bytes[0] + udp_bytes[1] + udp_bytes[2] + udp_bytes[3] + udp_bytes_sum_current;
   udp_bytes_sum_next = udp_bytes_sum;

   udp_check_sum      = ~(udp_bytes_sum[31:16] + udp_bytes_sum[15:0]);
end

//TCP checksum computation.
wire tcp_bytes_3_en_n = (pkt_cnt == 0) || (pkt_cnt == 1);
wire tcp_bytes_2_en_n = (pkt_cnt == 0) || (pkt_cnt == 1) || (pkt_cnt == 2);
wire tcp_bytes_1_en_n = (pkt_cnt == 0) || (pkt_cnt == 1) || (pkt_cnt == 2);
wire tcp_bytes_0_en_n = (pkt_cnt == 0) || (pkt_cnt == 1) || (pkt_cnt == 2) || (pkt_cnt == 3) || (pkt_cnt == 5);

//TCP length including TCP header and data needs to be calculated on the fly.
reg   [15:0]   r_tcp_length;
always @(posedge axi_aclk)
   if (~axi_resetn)
      r_tcp_length   <= 0;
   else if (pkt_cnt == 2)
      r_tcp_length   <= ({r_tdata[0+:8], r_tdata[8+:8]} - 16'h0014);

wire  [15:0]   tcp_length = {r_tcp_length[0+:8], r_tcp_length[8+:8]};

//For pseudo IP header calculation, the upd protocol is only required with zeros.
wire  [15:0]   tcp_bytes_en_3 = (pkt_cnt == 2) ? 16'hff00 : {{8{r_tstrb[7]}}, {8{r_tstrb[6]}}};
wire  [15:0]   tcp_bytes_en_2 = {{8{r_tstrb[5]}}, {8{r_tstrb[4]}}};
wire  [15:0]   tcp_bytes_en_1 = {{8{r_tstrb[3]}}, {8{r_tstrb[2]}}};
wire  [15:0]   tcp_bytes_en_0 = {{8{r_tstrb[1]}}, {8{r_tstrb[0]}}};

always @(r_tvalid or ip_bytes_3_en or ip_bytes_2_en or ip_bytes_1_en or ip_bytes_0_en) begin
   tcp_bytes[3] = (r_tvalid && tcp_bytes_3_en_n) ? 0 : r_tdata[48+:16] & tcp_bytes_en_3;
   tcp_bytes[2] = (r_tvalid && tcp_bytes_2_en_n) ? 0 : r_tdata[32+:16] & tcp_bytes_en_2;
   tcp_bytes[1] = (r_tvalid && tcp_bytes_1_en_n) ? 0 : r_tdata[16+:16] & tcp_bytes_en_1;
   tcp_bytes[0] = (r_tvalid && tcp_bytes_0_en_n) ? 0 : r_tdata[0+:16]  & tcp_bytes_en_0;

   //For Pseudo IP header calculation, the upd length must be added one more. 
   tcp_bytes_sum      = (pkt_cnt == 4) ? tcp_bytes[0] + tcp_bytes[1] + tcp_bytes[2] + tcp_bytes[3] + tcp_bytes[3] + tcp_bytes_sum_current :
                                         tcp_bytes[0] + tcp_bytes[1] + tcp_bytes[2] + tcp_bytes[3] + tcp_bytes_sum_current;
   tcp_bytes_sum_next = tcp_bytes_sum;

   tcp_check_sum      = ~(tcp_bytes_sum[31:16] + tcp_bytes_sum[15:0]);
end

endmodule
