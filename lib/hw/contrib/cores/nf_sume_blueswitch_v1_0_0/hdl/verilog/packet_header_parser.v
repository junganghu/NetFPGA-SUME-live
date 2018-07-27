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

module packet_header_parser
#(
   parameter   C_S_AXIS_TDATA_WIDTH       = 256,

   parameter   HDR_MAC_ADDR_WIDTH         = 48,
   parameter   HDR_ETH_TYPE_WIDTH         = 16,
   parameter   HDR_IP_ADDR_WIDTH          = 32,
   parameter   HDR_IP_PROT_WIDTH          = 8,
   parameter   HDR_PORT_NO_WIDTH          = 16,
   parameter   HDR_VLAN_WIDTH             = 32
)
(
   input                                           axi_aclk,
   input                                           axi_resetn,

   // Slave Stream Ports (interface to data path)
   input          [C_S_AXIS_TDATA_WIDTH-1:0]       s_axis_tdata,
   input                                           s_axis_tlast,
   input                                           s_axis_tvalid,
   // SW Tag enable
   input          [`DEF_SW_TAG_VAL-1:0]            bus_sw_tag_val,
   input          [31:0]                           bus_sw_tag,
   output   reg                                    clear_sw_tag_val,

   output   reg   [HDR_MAC_ADDR_WIDTH-1:0]         out_dst_mac_addr,
   output   reg   [HDR_MAC_ADDR_WIDTH-1:0]         out_src_mac_addr,
   output   reg   [HDR_ETH_TYPE_WIDTH-1:0]         out_eth_type,
   output   reg   [HDR_IP_PROT_WIDTH-1:0]          out_ip_pro,
   output   reg   [HDR_IP_ADDR_WIDTH-1:0]          out_src_ip_addr,
   output   reg   [HDR_IP_ADDR_WIDTH-1:0]          out_dst_ip_addr,
   output   reg   [HDR_PORT_NO_WIDTH-1:0]          out_src_port_no,
   output   reg   [HDR_PORT_NO_WIDTH-1:0]          out_dst_port_no,
   // The sw tag data is used in the flow table flow processor to identify
   // whether the match table needs to be updated by swapping.
   // To unique sw tag generation, a method like checksum can be used. The sw
   // tag will be placed after source mac address. Thus, the sw tag can be
   // a result of checksum of destination and source mac address in 16bits
   // wide.
   output   reg   [`DEF_SW_TAG-1:0]                out_sw_tag,
   // Tag identification, 0: N/A, 1: only update rule, 2: only add out_sw_tag
   // to a packet for triggering next switches, 3: update rule and add
   // out_sw_tag to a packet forwarding to next switches.
   // If out_sw_tag_val is 1, the flow table processor only swaps the match table
   // for applying new rules updated in advance.
   // If out_sw_tag_val is 2, the flow table processor only adds out_sw_tag
   // for triggering match tables in next switches.
   // If out_sw_tag_val is 3, the flow table processor swaps and adds in 2 and
   // 3.
   output   reg   [`DEF_SW_TAG_VAL-1:0]            out_sw_tag_val,
   output   reg                                    parser_en
);

integer i;

localparam HDR_TOT_WIDTH = 512;

reg   [C_S_AXIS_TDATA_WIDTH-1:0]    pkt_hdr[0:7];//Collect 64byte header informatin
reg   [3:0]    hdr_cnt;

reg   tlast_d1, tlast_d2;
always @(posedge axi_aclk)
   if (~axi_resetn) begin
      tlast_d1 <= 0;
      tlast_d2 <= 0;
   end
   else begin
      tlast_d1 <= s_axis_tvalid & s_axis_tlast;
      tlast_d2 <= tlast_d1;
   end

wire  w_tlast = (s_axis_tvalid & s_axis_tlast) & ~tlast_d1;
wire  w_tlast_d = tlast_d1 & ~tlast_d2;

always @(posedge axi_aclk)
   if (~axi_resetn) begin
      hdr_cnt  <= 0;
   end
   //(w_tlast && hdr_cnt < 7)  <== Abnormal case (there is no packet less than 64bytes)
   else if (w_tlast && ((hdr_cnt == 7) || (hdr_cnt < 7)|| (hdr_cnt > 7))) begin 
      hdr_cnt  <= 0;
   end
   else if (hdr_cnt > 10) begin
      hdr_cnt  <= hdr_cnt;
   end
   else if (s_axis_tvalid) begin
      hdr_cnt  <= hdr_cnt + 1;
   end

//Valid from 0 to 7 (64bytes)
wire  hdr_window = s_axis_tvalid && ((hdr_cnt == 0) || ((|hdr_cnt[2:0] == 1) && (hdr_cnt[3] == 0)));

always @(posedge axi_aclk)
   if (~axi_resetn) begin
      for (i=0; i<8; i=i+1) begin
         pkt_hdr[i]  <= 0;
      end
   end
   else if (hdr_window && (hdr_cnt == 0)) begin
      for (i=1; i<8; i=i+1) begin
         pkt_hdr[i]  <= 0;
      end
      pkt_hdr[hdr_cnt[2:0]]   <= s_axis_tdata;
   end
   else if (hdr_window) begin
      pkt_hdr[hdr_cnt[2:0]]   <= s_axis_tdata;
   end

wire  [HDR_TOT_WIDTH-1:0]  hdr_info = {pkt_hdr[7], pkt_hdr[6], pkt_hdr[5], pkt_hdr[4],
                                       pkt_hdr[3], pkt_hdr[2], pkt_hdr[1], pkt_hdr[0]};

//Parsing header
wire  [HDR_MAC_ADDR_WIDTH-1:0]   dst_mac_addr = hdr_info[0+:HDR_MAC_ADDR_WIDTH];
wire  [HDR_MAC_ADDR_WIDTH-1:0]   src_mac_addr = hdr_info[HDR_MAC_ADDR_WIDTH+:HDR_MAC_ADDR_WIDTH];

wire  [`DEF_SW_TAG-1:0] sw_tag_pkt = hdr_info[(2*`DEF_MAC_ADDR)+:`DEF_SW_TAG];

wire  w_sw_tag_en = (sw_tag_pkt == bus_sw_tag);
//wire  w_sw_tag_en = (sw_tag_pkt == 32'hcdab2301);
//wire  w_sw_tag_en = (sw_tag_pkt == 32'hfaceface);

wire  [HDR_ETH_TYPE_WIDTH-1:0]   eth_type = hdr_info[(HDR_MAC_ADDR_WIDTH*2)+:HDR_ETH_TYPE_WIDTH];
wire  [HDR_ETH_TYPE_WIDTH-1:0]   vlan_eth_type = hdr_info[((HDR_MAC_ADDR_WIDTH*2)+`DEF_VLAN)+:HDR_ETH_TYPE_WIDTH];
wire  [HDR_ETH_TYPE_WIDTH-1:0]   sw_tag_eth_type = hdr_info[((HDR_MAC_ADDR_WIDTH*2)+`DEF_SW_TAG)+:HDR_ETH_TYPE_WIDTH];
wire  [HDR_ETH_TYPE_WIDTH-1:0]   sw_tag_vlan_eth_type = hdr_info[((HDR_MAC_ADDR_WIDTH*2)+`DEF_SW_TAG+`DEF_VLAN)+:HDR_ETH_TYPE_WIDTH];

wire  w_vlan_en = (eth_type == `VLAN_TYPE);
wire  w_sw_tag_vlan_en = (sw_tag_eth_type == `VLAN_TYPE);

wire  [HDR_ETH_TYPE_WIDTH-1:0]   w_eth_type = (w_sw_tag_en) ? (w_sw_tag_vlan_en) ? sw_tag_vlan_eth_type : sw_tag_eth_type :
                                                              (w_vlan_en)        ? vlan_eth_type        : eth_type;

//No of VLAN in the packet.
wire  [1:0]    w_vlan_no = 1;
//ARP ip address
localparam  ARP_HDR_WIDTH = 64;
localparam  POS_ARP_SRC_IP = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + ARP_HDR_WIDTH + HDR_MAC_ADDR_WIDTH;
localparam  POS_ARP_DST_OP = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + ARP_HDR_WIDTH +
                             HDR_MAC_ADDR_WIDTH   + HDR_IP_ADDR_WIDTH  + HDR_MAC_ADDR_WIDTH;

localparam  VLAN_POS_ARP_SRC_IP = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + ARP_HDR_WIDTH + HDR_MAC_ADDR_WIDTH + 
                                  HDR_VLAN_WIDTH;
localparam  VLAN_POS_ARP_DST_OP = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + ARP_HDR_WIDTH +
                                  HDR_MAC_ADDR_WIDTH   + HDR_IP_ADDR_WIDTH  + HDR_MAC_ADDR_WIDTH +
                                  HDR_VLAN_WIDTH;

localparam  SW_TAG_POS_ARP_SRC_IP = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + ARP_HDR_WIDTH + HDR_MAC_ADDR_WIDTH + 
                                 `DEF_SW_TAG;
localparam  SW_TAG_POS_ARP_DST_OP = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + ARP_HDR_WIDTH +
                                 HDR_MAC_ADDR_WIDTH   + HDR_IP_ADDR_WIDTH  + HDR_MAC_ADDR_WIDTH +
                                 `DEF_SW_TAG;

localparam  SW_TAG_VLAN_POS_ARP_SRC_IP = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + ARP_HDR_WIDTH + HDR_MAC_ADDR_WIDTH + 
                                         HDR_VLAN_WIDTH + `DEF_SW_TAG;
localparam  SW_TAG_VLAN_POS_ARP_DST_OP = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + ARP_HDR_WIDTH +
                                         HDR_MAC_ADDR_WIDTH   + HDR_IP_ADDR_WIDTH  + HDR_MAC_ADDR_WIDTH +
                                         HDR_VLAN_WIDTH + `DEF_SW_TAG;

wire  [HDR_IP_ADDR_WIDTH-1:0]      arp_src_ip_addr = hdr_info[POS_ARP_SRC_IP+:HDR_IP_ADDR_WIDTH];
wire  [HDR_IP_ADDR_WIDTH-1:0]      arp_dst_ip_addr = hdr_info[POS_ARP_DST_OP+:HDR_IP_ADDR_WIDTH];

wire  [HDR_IP_ADDR_WIDTH-1:0]      vlan_arp_src_ip_addr = hdr_info[VLAN_POS_ARP_SRC_IP+:HDR_IP_ADDR_WIDTH];
wire  [HDR_IP_ADDR_WIDTH-1:0]      vlan_arp_dst_ip_addr = hdr_info[VLAN_POS_ARP_DST_OP+:HDR_IP_ADDR_WIDTH];

wire  [HDR_IP_ADDR_WIDTH-1:0]      sw_tag_arp_src_ip_addr = hdr_info[SW_TAG_POS_ARP_SRC_IP+:HDR_IP_ADDR_WIDTH];
wire  [HDR_IP_ADDR_WIDTH-1:0]      sw_tag_arp_dst_ip_addr = hdr_info[SW_TAG_POS_ARP_DST_OP+:HDR_IP_ADDR_WIDTH];

wire  [HDR_IP_ADDR_WIDTH-1:0]      sw_tag_vlan_arp_src_ip_addr = hdr_info[SW_TAG_VLAN_POS_ARP_SRC_IP+:HDR_IP_ADDR_WIDTH];
wire  [HDR_IP_ADDR_WIDTH-1:0]      sw_tag_vlan_arp_dst_ip_addr = hdr_info[SW_TAG_VLAN_POS_ARP_DST_OP+:HDR_IP_ADDR_WIDTH];

wire  [HDR_IP_ADDR_WIDTH-1:0]      w_arp_src_ip_addr = (w_sw_tag_en) ? (w_sw_tag_vlan_en) ? sw_tag_vlan_arp_src_ip_addr : sw_tag_arp_src_ip_addr :
                                                                       (w_vlan_en)        ? vlan_arp_src_ip_addr        : arp_src_ip_addr;
wire  [HDR_IP_ADDR_WIDTH-1:0]      w_arp_dst_ip_addr = (w_sw_tag_en) ? (w_sw_tag_vlan_en) ? sw_tag_vlan_arp_dst_ip_addr : sw_tag_arp_dst_ip_addr :
                                                                       (w_vlan_en)        ? vlan_arp_dst_ip_addr        : arp_dst_ip_addr;


//IPv4 protocol
localparam  IP_HDR_WIDTH = 96;
localparam  IP_CHK_WIDTH = 16;
localparam  POS_IP_TYPE = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + 
                          IP_HDR_WIDTH - IP_CHK_WIDTH - HDR_IP_PROT_WIDTH;

localparam  VLAN_POS_IP_TYPE = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + 
                               IP_HDR_WIDTH - IP_CHK_WIDTH - HDR_IP_PROT_WIDTH +
                               HDR_VLAN_WIDTH;

localparam  SW_TAG_POS_IP_TYPE = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + 
                                 IP_HDR_WIDTH - IP_CHK_WIDTH - HDR_IP_PROT_WIDTH +
                                 `DEF_SW_TAG;

localparam  SW_TAG_VLAN_POS_IP_TYPE = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + 
                                      IP_HDR_WIDTH - IP_CHK_WIDTH - HDR_IP_PROT_WIDTH +
                                      HDR_VLAN_WIDTH + `DEF_SW_TAG;

wire  [HDR_IP_PROT_WIDTH-1:0]     ip_pro = hdr_info[POS_IP_TYPE+:HDR_IP_PROT_WIDTH];
wire  [HDR_IP_PROT_WIDTH-1:0]     vlan_ip_pro = hdr_info[VLAN_POS_IP_TYPE+:HDR_IP_PROT_WIDTH];
wire  [HDR_IP_PROT_WIDTH-1:0]     sw_tag_ip_pro = hdr_info[SW_TAG_POS_IP_TYPE+:HDR_IP_PROT_WIDTH];
wire  [HDR_IP_PROT_WIDTH-1:0]     sw_tag_vlan_ip_pro = hdr_info[SW_TAG_VLAN_POS_IP_TYPE+:HDR_IP_PROT_WIDTH];

wire  [HDR_IP_PROT_WIDTH-1:0]     w_ip_pro = (w_sw_tag_en) ? (w_sw_tag_vlan_en) ? sw_tag_vlan_ip_pro : sw_tag_ip_pro :
                                                             (w_vlan_en)        ? vlan_ip_pro        : ip_pro;

//IPv4 ip address
localparam  POS_IP_SRC_IP = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + IP_HDR_WIDTH;
localparam  POS_IP_DST_IP = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + IP_HDR_WIDTH + HDR_IP_ADDR_WIDTH;

localparam  VLAN_POS_IP_SRC_IP = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + IP_HDR_WIDTH +
                                 HDR_VLAN_WIDTH;
localparam  VLAN_POS_IP_DST_IP = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + IP_HDR_WIDTH + HDR_IP_ADDR_WIDTH +
                                 HDR_VLAN_WIDTH;

localparam  SW_TAG_POS_IP_SRC_IP = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + IP_HDR_WIDTH + 
                                   `DEF_SW_TAG;
localparam  SW_TAG_POS_IP_DST_IP = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + IP_HDR_WIDTH + HDR_IP_ADDR_WIDTH +
                                   `DEF_SW_TAG;

localparam  SW_TAG_VLAN_POS_IP_SRC_IP = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + IP_HDR_WIDTH +
                                        HDR_VLAN_WIDTH + `DEF_SW_TAG;
localparam  SW_TAG_VLAN_POS_IP_DST_IP = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + IP_HDR_WIDTH + HDR_IP_ADDR_WIDTH +
                                        HDR_VLAN_WIDTH + `DEF_SW_TAG;

wire  [HDR_IP_ADDR_WIDTH-1:0]    src_ip_addr = hdr_info[POS_IP_SRC_IP+:HDR_IP_ADDR_WIDTH];
wire  [HDR_IP_ADDR_WIDTH-1:0]    dst_ip_addr = hdr_info[POS_IP_DST_IP+:HDR_IP_ADDR_WIDTH];

wire  [HDR_IP_ADDR_WIDTH-1:0]    vlan_src_ip_addr = hdr_info[VLAN_POS_IP_SRC_IP+:HDR_IP_ADDR_WIDTH];
wire  [HDR_IP_ADDR_WIDTH-1:0]    vlan_dst_ip_addr = hdr_info[VLAN_POS_IP_DST_IP+:HDR_IP_ADDR_WIDTH];

wire  [HDR_IP_ADDR_WIDTH-1:0]    sw_tag_src_ip_addr = hdr_info[SW_TAG_POS_IP_SRC_IP+:HDR_IP_ADDR_WIDTH];
wire  [HDR_IP_ADDR_WIDTH-1:0]    sw_tag_dst_ip_addr = hdr_info[SW_TAG_POS_IP_DST_IP+:HDR_IP_ADDR_WIDTH];

wire  [HDR_IP_ADDR_WIDTH-1:0]    sw_tag_vlan_src_ip_addr = hdr_info[SW_TAG_VLAN_POS_IP_SRC_IP+:HDR_IP_ADDR_WIDTH];
wire  [HDR_IP_ADDR_WIDTH-1:0]    sw_tag_vlan_dst_ip_addr = hdr_info[SW_TAG_VLAN_POS_IP_DST_IP+:HDR_IP_ADDR_WIDTH];

wire  [HDR_IP_ADDR_WIDTH-1:0]    w_ip_src_ip_addr = (w_sw_tag_en) ? (w_sw_tag_vlan_en) ? sw_tag_vlan_src_ip_addr : sw_tag_src_ip_addr :
                                                                    (w_vlan_en)        ? vlan_src_ip_addr        : src_ip_addr;
wire  [HDR_IP_ADDR_WIDTH-1:0]    w_ip_dst_ip_addr = (w_sw_tag_en) ? (w_sw_tag_vlan_en) ? sw_tag_vlan_dst_ip_addr : sw_tag_dst_ip_addr :
                                                                    (w_vlan_en)        ? vlan_dst_ip_addr        : dst_ip_addr;

//IPv4 port number
localparam  IP_HDR_TOT_WIDTH = 160;
localparam  POS_SRC_PORT = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + IP_HDR_TOT_WIDTH;
localparam  VLAN_POS_SRC_PORT = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + IP_HDR_TOT_WIDTH +
                                HDR_VLAN_WIDTH;
localparam  SW_TAG_POS_SRC_PORT = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + IP_HDR_TOT_WIDTH +
                                  `DEF_SW_TAG;
localparam  SW_TAG_VLAN_POS_SRC_PORT = HDR_MAC_ADDR_WIDTH*2 + HDR_ETH_TYPE_WIDTH + IP_HDR_TOT_WIDTH +
                                HDR_VLAN_WIDTH + `DEF_SW_TAG;

wire  [HDR_PORT_NO_WIDTH-1:0]    src_port_no = hdr_info[POS_SRC_PORT+:HDR_PORT_NO_WIDTH];
wire  [HDR_PORT_NO_WIDTH-1:0]    dst_port_no = hdr_info[(POS_SRC_PORT+HDR_PORT_NO_WIDTH)+:HDR_PORT_NO_WIDTH];

wire  [HDR_PORT_NO_WIDTH-1:0]    vlan_src_port_no = hdr_info[VLAN_POS_SRC_PORT+:HDR_PORT_NO_WIDTH];
wire  [HDR_PORT_NO_WIDTH-1:0]    vlan_dst_port_no = hdr_info[(VLAN_POS_SRC_PORT+HDR_PORT_NO_WIDTH)+:HDR_PORT_NO_WIDTH];

wire  [HDR_PORT_NO_WIDTH-1:0]    sw_tag_src_port_no = hdr_info[SW_TAG_POS_SRC_PORT+:HDR_PORT_NO_WIDTH];
wire  [HDR_PORT_NO_WIDTH-1:0]    sw_tag_dst_port_no = hdr_info[(SW_TAG_POS_SRC_PORT+HDR_PORT_NO_WIDTH)+:HDR_PORT_NO_WIDTH];

wire  [HDR_PORT_NO_WIDTH-1:0]    sw_tag_vlan_src_port_no = hdr_info[SW_TAG_VLAN_POS_SRC_PORT+:HDR_PORT_NO_WIDTH];
wire  [HDR_PORT_NO_WIDTH-1:0]    sw_tag_vlan_dst_port_no = hdr_info[(SW_TAG_VLAN_POS_SRC_PORT+HDR_PORT_NO_WIDTH)+:HDR_PORT_NO_WIDTH];

wire  [HDR_IP_ADDR_WIDTH-1:0]    w_src_port_no = (w_sw_tag_en) ? (w_sw_tag_vlan_en) ? sw_tag_vlan_src_port_no : sw_tag_src_port_no :
                                                                 (w_vlan_en)        ? vlan_src_port_no        : src_port_no;
wire  [HDR_IP_ADDR_WIDTH-1:0]    w_dst_port_no = (w_sw_tag_en) ? (w_sw_tag_vlan_en) ? sw_tag_vlan_dst_port_no : sw_tag_dst_port_no :
                                                                 (w_vlan_en)        ? vlan_dst_port_no        : dst_port_no;

//IP address of ARP or IPv4
wire  [HDR_IP_ADDR_WIDTH-1:0]    w_src_ip_addr = (w_sw_tag_en) ? (w_sw_tag_vlan_en) ? (sw_tag_vlan_eth_type == `TYPE_IPV4) ? w_ip_src_ip_addr : w_arp_src_ip_addr :
                                                                                      (sw_tag_eth_type == `TYPE_IPV4)      ? w_ip_src_ip_addr : w_arp_src_ip_addr :
                                                                 (w_vlan_en)        ? (vlan_eth_type == `TYPE_IPV4)        ? w_ip_src_ip_addr : w_arp_src_ip_addr :
                                                                                      (eth_type == `TYPE_IPV4)             ? w_ip_src_ip_addr : w_arp_src_ip_addr;
wire  [HDR_IP_ADDR_WIDTH-1:0]    w_dst_ip_addr = (w_sw_tag_en) ? (w_sw_tag_vlan_en) ? (sw_tag_vlan_eth_type == `TYPE_IPV4) ? w_ip_dst_ip_addr : w_arp_dst_ip_addr :
                                                                                      (sw_tag_eth_type == `TYPE_IPV4)      ? w_ip_dst_ip_addr : w_arp_dst_ip_addr :
                                                                 (w_vlan_en)        ? (vlan_eth_type == `TYPE_IPV4)        ? w_ip_dst_ip_addr : w_arp_dst_ip_addr :
                                                                                      (eth_type == `TYPE_IPV4)             ? w_ip_dst_ip_addr : w_arp_dst_ip_addr;

wire  w_parser_en = (hdr_cnt == 7) || (w_tlast && (hdr_cnt < 7));

reg   r_parser_en;
always @(posedge axi_aclk)
   if (~axi_resetn) begin
      r_parser_en <= 0;
   end
   else begin
      r_parser_en <= w_parser_en;
   end

wire  w_r_parser_en = w_parser_en & ~r_parser_en;

always @(posedge axi_aclk)
   if (~axi_resetn) begin
      out_dst_mac_addr     <= 0;
      out_src_mac_addr     <= 0;
      out_eth_type         <= 0;
      out_ip_pro           <= 0;
      out_src_ip_addr      <= 0;
      out_dst_ip_addr      <= 0;
      out_src_port_no      <= 0;
      out_dst_port_no      <= 0;
      out_sw_tag_val       <= 0;
      out_sw_tag           <= 0;
   end
   else if (w_tlast && (hdr_cnt < 7)) begin
      out_dst_mac_addr     <= 0;
      out_src_mac_addr     <= 0;
      out_eth_type         <= 0;
      out_ip_pro           <= 0;
      out_src_ip_addr      <= 0;
      out_dst_ip_addr      <= 0;
      out_src_port_no      <= 0;
      out_dst_port_no      <= 0;
      out_sw_tag_val       <= 0;
      out_sw_tag           <= 0;
   end
   else if (w_r_parser_en) begin
      out_dst_mac_addr     <= dst_mac_addr;
      out_src_mac_addr     <= src_mac_addr;
      out_eth_type         <= w_eth_type;
      out_ip_pro           <= w_ip_pro;
      out_src_ip_addr      <= w_src_ip_addr;
      out_dst_ip_addr      <= w_dst_ip_addr;
      out_src_port_no      <= w_src_port_no;
      out_dst_port_no      <= w_dst_port_no;
      out_sw_tag_val       <= (bus_sw_tag_val != 0) ? bus_sw_tag_val :
                              (w_sw_tag_en)         ? 4              : 0;
      out_sw_tag           <= (bus_sw_tag_val != 0) ? sw_tag_pkt     :
                              (w_sw_tag_en)         ? sw_tag_pkt     : 0;
   end

always @(posedge axi_aclk)
   if (~axi_resetn)  parser_en   <= 0;
   else              parser_en   <= w_r_parser_en;

always @(posedge axi_aclk)
   if (~axi_resetn)  clear_sw_tag_val  <= 0;
   else              clear_sw_tag_val  <= parser_en;

endmodule
