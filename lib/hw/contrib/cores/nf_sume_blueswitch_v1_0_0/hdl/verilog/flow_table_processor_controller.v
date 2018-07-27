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

module flow_table_processor_controller
#(
   parameter   C_S_AXI_ADDR_WIDTH         = 32,
   parameter   C_S_AXI_DATA_WIDTH         = 32,
   parameter   BASEADDR_OFFSET            = 16'h0,

   parameter   HDR_MAC_ADDR_WIDTH         = 48,
   parameter   HDR_ETH_TYPE_WIDTH         = 16,
   parameter   HDR_IP_ADDR_WIDTH          = 32,
   parameter   HDR_IP_PROT_WIDTH          = 16,
   parameter   HDR_PORT_NO_WIDTH          = 16,

   parameter   MAC_TBL_ADDR_WIDTH         = 4,
   parameter   IP_TBL_ADDR_WIDTH          = 4,
   parameter   PORT_NO_TBL_ADDR_WIDTH     = 4,

   parameter   ACT_TBL_DATA_WIDTH         = 8
)
(
   input                                              Bus2IP_Clk,
   input                                              Bus2IP_Resetn,
   input          [C_S_AXI_ADDR_WIDTH-1:0]            Bus2IP_Addr,
   input          [0:0]                               Bus2IP_CS,
   input                                              Bus2IP_RNW,
   input          [C_S_AXI_DATA_WIDTH-1:0]            Bus2IP_Data,
   input          [C_S_AXI_DATA_WIDTH/8-1:0]          Bus2IP_BE,
   output   reg   [C_S_AXI_DATA_WIDTH-1:0]            IP2Bus_Data,
   output   reg                                       IP2Bus_RdAck,
   output   reg                                       IP2Bus_WrAck,
   //Reference counter for time stamping in overall system.
   input          [63:0]                              ref_counter,
   //Stream interface latency measurement register.
   input          [63:0]                              stream_update_start,
   input          [63:0]                              stream_update_end,
   output   reg                                       stream_cnt_clear,

   output   reg   [C_S_AXI_DATA_WIDTH-1:0]            bus_configuration,
   //Flow table configuration set. bitmap type.
   //2'b00 : active, 2'b01 : bypass, 2'b10 : action update if hit.
   //[1:0]: ip flow table, [3:2]: mac flow table, [5:4]: port no flow table.
   output   reg   [5:0]                               bus_flow_table_config,
   //Override selection mode.
   output   reg   [5:0]                               bus_flow_table_sel,
   //TCAM and action double buffer status.
   //[1:0] mac, [3:2] ip, [5:4] port no.
   input          [5:0]                               bus_flow_table_status,
   output   reg   [2:0]                               bus_flow_table_trig,

   output   reg   [5:0]                               bus_entry_stat_mem_clr,

   //MAC address flow table i/f
   output   reg   [MAC_TBL_ADDR_WIDTH-1:0]            bus_mac_tcam_addr,
   output   reg   [HDR_MAC_ADDR_WIDTH-1:0]            bus_mac_tcam_din,
   output   reg   [HDR_MAC_ADDR_WIDTH-1:0]            bus_mac_tcam_din_mask,
   output   reg                                       bus_mac_tcam_wren,
   output   reg                                       bus_mac_tcam_stat_rden,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_mac_tcam_stat_rd_data,

   output   reg   [MAC_TBL_ADDR_WIDTH-1:0]            bus_mac_act_addr,
   output   reg   [ACT_TBL_DATA_WIDTH-1:0]       bus_mac_act_din,
   output   reg                                       bus_mac_act_wren,
   output   reg                                       bus_mac_act_stat_rden,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_mac_act_stat_rd_data,
   //IP address flow table i/f
   output   reg   [IP_TBL_ADDR_WIDTH-1:0]             bus_ip_tcam_addr,
   output   reg   [HDR_IP_ADDR_WIDTH-1:0]             bus_ip_tcam_din,
   output   reg   [HDR_IP_ADDR_WIDTH-1:0]             bus_ip_tcam_din_mask,
   output   reg                                       bus_ip_tcam_wren,
   output   reg                                       bus_ip_tcam_stat_rden,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_ip_tcam_stat_rd_data,

   output   reg   [IP_TBL_ADDR_WIDTH-1:0]             bus_ip_act_addr,
   output   reg   [ACT_TBL_DATA_WIDTH-1:0]       bus_ip_act_din,
   output   reg                                       bus_ip_act_wren,
   output   reg                                       bus_ip_act_stat_rden,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_ip_act_stat_rd_data,
   //Port No flow table i/f
   output   reg   [PORT_NO_TBL_ADDR_WIDTH-1:0]        bus_port_no_tcam_addr,
   output   reg   [HDR_PORT_NO_WIDTH-1:0]             bus_port_no_tcam_din,
   output   reg   [HDR_PORT_NO_WIDTH-1:0]             bus_port_no_tcam_din_mask,
   output   reg                                       bus_port_no_tcam_wren,
   output   reg                                       bus_port_no_tcam_stat_rden,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_port_no_tcam_stat_rd_data,

   output   reg   [PORT_NO_TBL_ADDR_WIDTH-1:0]        bus_port_no_act_addr,
   output   reg   [ACT_TBL_DATA_WIDTH-1:0]       bus_port_no_act_din,
   output   reg                                       bus_port_no_act_wren,
   output   reg                                       bus_port_no_act_stat_rden,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_port_no_act_stat_rd_data,

   //tcam and act memory status selected.
   //action result priorities.
   output   reg   [2:0]                               bus_flow_stat_cnt_clr,

   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_mac_hit_count,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_mac_miss_count,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_mac_tot_count,

   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_ip_hit_count,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_ip_miss_count,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_ip_tot_count,

   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_port_no_hit_count,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_port_no_miss_count,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_port_no_tot_count
);

reg   [7:0]    RdAckCnt;

//0x1000 ~ 0x10fc : Switch control and configuration range.
//
//TCAM and act table configurtion. Select match and act results, and so on.
wire  wren_1000 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TCAM_ACT_TBL_CONF + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1000 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TCAM_ACT_TBL_CONF + BASEADDR_OFFSET)) & Bus2IP_RNW;
//TCAM and act table trigger.
//0:mac TCAM, 1:ip TCAM, 2:port TCAM, 3:mac act, 4:ip act, 5:port act.
wire  wren_1004 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`FLOW_TBL_TRIG + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
//Clear TCAM and act stats memory.
//0:mac TCAM, 1:ip TCAM, 2:port TCAM, 3:mac act, 4:ip act, 5:port act.
wire  wren_1008 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`INIT_STATS_MEM + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
//tcam and act selection
//0: Not select, 1: Table 0, 2: Table 1
wire  wren_100c = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`FLOW_TBL_SEL + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_100c = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`FLOW_TBL_SEL + BASEADDR_OFFSET)) & Bus2IP_RNW;

//READ general TCAM and act stats.
wire  wren_1010 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`CLR_TCAM_ACT_COUNT + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
//Flow table configuration
wire  wren_1014 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`FLOW_TBL_CONF + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1014 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`FLOW_TBL_CONF + BASEADDR_OFFSET)) & Bus2IP_RNW;
//Flow table tcam and action double buffer status.
wire  rden_1018 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`FLOW_TBL_STATUS + BASEADDR_OFFSET)) & Bus2IP_RNW;

//0x1100 ~ 0x12fc : TCAM table access.
//
//MAC TCAM and act table write and read registers.
wire  wren_1100 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_TCAM_ADDR + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1100 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_TCAM_ADDR + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  wren_1104 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_TCAM_WR_DATA + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1104 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_TCAM_WR_DATA + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  wren_1108 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_TCAM_WR_DA_SK + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1108 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_TCAM_WR_DA_SK + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  wren_110c = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_TCAM_WR_MASK + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_110c = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_TCAM_WR_MASK + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  wren_1110 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_TCAM_WR_EN + BASEADDR_OFFSET)) & ~Bus2IP_RNW;

wire  rden_1114 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_TCAM_STATS_RD_DATA + BASEADDR_OFFSET)) & Bus2IP_RNW;

wire  wren_1120 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_ACT_ADDR + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1120 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_ACT_ADDR + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  wren_1124 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_ACT_WR_DATA + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1124 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_ACT_WR_DATA + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  wren_1130 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_ACT_WR_EN + BASEADDR_OFFSET)) & ~Bus2IP_RNW;

wire  rden_1134 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_ACT_STATS_RD_DATA + BASEADDR_OFFSET)) & Bus2IP_RNW;

//IP TCAM and act table write and read registers.
wire  wren_1140 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_TCAM_ADDR + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1140 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_TCAM_ADDR + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  wren_1144 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_TCAM_WR_DATA + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1144 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_TCAM_WR_DATA + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  wren_1148 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_TCAM_WR_MASK + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1148 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_TCAM_WR_MASK + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  wren_1150 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_TCAM_WR_EN + BASEADDR_OFFSET)) & ~Bus2IP_RNW;

wire  rden_1154 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_TCAM_STATS_RD_DATA + BASEADDR_OFFSET)) & Bus2IP_RNW;

wire  wren_1160 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_ACT_ADDR + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1160 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_ACT_ADDR + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  wren_1164 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_ACT_WR_DATA + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1164 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_ACT_WR_DATA + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  wren_1170 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_ACT_WR_EN + BASEADDR_OFFSET)) & ~Bus2IP_RNW;

wire  rden_1174 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_ACT_STATS_RD_DATA + BASEADDR_OFFSET)) & Bus2IP_RNW;

//PORT TCAM and act table write and read registers.
wire  wren_1180 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_TCAM_ADDR + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1180 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_TCAM_ADDR + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  wren_1184 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_TCAM_WR_DATA + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1184 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_TCAM_WR_DATA + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  wren_1188 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_TCAM_WR_MASK + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1188 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_TCAM_WR_MASK + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  wren_1190 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_TCAM_WR_EN + BASEADDR_OFFSET)) & ~Bus2IP_RNW;

wire  rden_1194 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_TCAM_STATS_RD_DATA + BASEADDR_OFFSET)) & Bus2IP_RNW;

wire  wren_11a0 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_ACT_ADDR + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_11a0 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_ACT_ADDR + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  wren_11a4 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_ACT_WR_DATA + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_11a4 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_ACT_WR_DATA + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  wren_11b0 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_ACT_WR_EN + BASEADDR_OFFSET)) & ~Bus2IP_RNW;

wire  rden_11b4 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_ACT_STATS_RD_DATA + BASEADDR_OFFSET)) & Bus2IP_RNW;

//0x1500 ~ 0x16fc : Debug and timestamp
wire  rden_1504 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_HIT_COUNT + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_1508 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_MISS_COUNT + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_150c = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`MAC_TCAM_TOT_COUNT + BASEADDR_OFFSET)) & Bus2IP_RNW;

wire  rden_1514 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_HIT_COUNT + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_1518 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_MISS_COUNT + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_151c = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`IP_TCAM_TOT_COUNT + BASEADDR_OFFSET)) & Bus2IP_RNW;

wire  rden_1524 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_HIT_COUNT + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_1528 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_MISS_COUNT + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_152c = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`PORT_NO_TCAM_TOT_COUNT + BASEADDR_OFFSET)) & Bus2IP_RNW;

//Timestamp
wire  wren_1600 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_TAP_LSB_0 + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1600 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_TAP_LSB_0 + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_1604 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_TAP_MSB_0 + BASEADDR_OFFSET)) & Bus2IP_RNW;

wire  wren_1608 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_TAP_LSB_1 + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
wire  rden_1608 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_TAP_LSB_1 + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_160c = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_TAP_MSB_1 + BASEADDR_OFFSET)) & Bus2IP_RNW;

//Flow table wren Timestamp
wire  rden_1610 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_MAC_WREN_LSB_0 + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_1614 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_MAC_WREN_MSB_0 + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_1618 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_MAC_WREN_LSB_1 + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_161c = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_MAC_WREN_MSB_1 + BASEADDR_OFFSET)) & Bus2IP_RNW;

wire  rden_1620 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_IP_WREN_LSB_0 + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_1624 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_IP_WREN_MSB_0 + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_1628 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_IP_WREN_LSB_1 + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_162c = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_IP_WREN_MSB_1 + BASEADDR_OFFSET)) & Bus2IP_RNW;

wire  rden_1630 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_PORT_NO_WREN_LSB_0 + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_1634 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_PORT_NO_WREN_MSB_0 + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_1638 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_PORT_NO_WREN_LSB_1 + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_163c = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_PORT_NO_WREN_MSB_1 + BASEADDR_OFFSET)) & Bus2IP_RNW;

wire  rden_1640 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_TRIG_LSB_0 + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_1644 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_TRIG_MSB_0 + BASEADDR_OFFSET)) & Bus2IP_RNW;

wire  rden_1650 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_ST_START_LSB + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_1654 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_ST_START_MSB + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_1658 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_ST_END_LSB + BASEADDR_OFFSET)) & Bus2IP_RNW;
wire  rden_165c = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_ST_END_MSB + BASEADDR_OFFSET)) & Bus2IP_RNW;

wire  wren_1660 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (`TS_ST_CNT_CLR + BASEADDR_OFFSET)) & ~Bus2IP_RNW;
//End of register lists.

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn)
      stream_cnt_clear  <= 0;
   else
      stream_cnt_clear  <= wren_1660;

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) begin
      bus_configuration <= 0;
   end
   else begin
      bus_configuration <= (wren_1000) ? Bus2IP_Data : bus_configuration;
   end

//Trigger signals in pulse
reg   wren_1004_d;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn)  wren_1004_d <= 0;
   else wren_1004_d  <= wren_1004;

wire  w_wren_1004_d = wren_1004 & ~wren_1004_d;

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn)  bus_flow_table_trig  <= 0;
   else bus_flow_table_trig  <= (w_wren_1004_d) ? Bus2IP_Data[2:0] : 0;

//Get the ref_counter when any action trigger is written.
reg   [63:0]   trigger_ref_counter;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) trigger_ref_counter <= 0;
   else if (w_wren_1004_d) trigger_ref_counter <= ref_counter;

//Clear stats memory that needs to be initiate.
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn)  bus_entry_stat_mem_clr  <= 0;
   else bus_entry_stat_mem_clr  <= (wren_1008) ? Bus2IP_Data[5:0] : 0;

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) begin
      bus_flow_table_sel   <= 0;
   end
   else begin
      bus_flow_table_sel   <= (wren_100c) ? Bus2IP_Data[5:0] : bus_flow_table_sel;
   end

//Clear hit, miss, total, act.
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn)
      bus_flow_stat_cnt_clr   <= 0;
   else  bus_flow_stat_cnt_clr   <= (wren_1010) ? Bus2IP_Data[2:0] : 0;

//Get the ref_counter when the first mac addres is written.
reg   [C_S_AXI_DATA_WIDTH-1:0]  mac_wren_counter;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) mac_wren_counter <= 0;
   else if (bus_flow_stat_cnt_clr[1]) mac_wren_counter <= 0;
   else if (bus_mac_tcam_wren) mac_wren_counter <= mac_wren_counter + 1;

reg   [63:0]   mac_wren_1st_ref_counter;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) mac_wren_1st_ref_counter <= 0;
   else if (bus_flow_stat_cnt_clr[1]) mac_wren_1st_ref_counter <= 0;
   else if (mac_wren_counter == 0 && bus_mac_tcam_wren) mac_wren_1st_ref_counter <= ref_counter;

reg   [63:0]   mac_wren_ref_counter;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) mac_wren_ref_counter <= 0;
   else if (bus_flow_stat_cnt_clr[1]) mac_wren_ref_counter <= 0;
   else if (bus_mac_tcam_wren) mac_wren_ref_counter <= ref_counter;


always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) bus_flow_table_config <= 6'h3c;//de-active mac, port no.
   else if (wren_1014)  bus_flow_table_config <= Bus2IP_Data[5:0];

//mac tcam interface
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) begin
      bus_mac_tcam_addr      <= 0;
      bus_mac_tcam_din       <= 0;
      bus_mac_tcam_din_mask  <= 0;
   end
   else begin
      bus_mac_tcam_addr              <= (wren_1100) ? Bus2IP_Data[MAC_TBL_ADDR_WIDTH-1:0] : bus_mac_tcam_addr;
      bus_mac_tcam_din[0+:32]        <= (wren_1104) ? Bus2IP_Data : bus_mac_tcam_din[0+:32];
      bus_mac_tcam_din[32+:16]       <= (wren_1108) ? Bus2IP_Data[0+:16] : bus_mac_tcam_din[32+:16];
      bus_mac_tcam_din_mask[0+:16]   <= (wren_1108) ? Bus2IP_Data[16+:16] : bus_mac_tcam_din_mask[0+:16];
      bus_mac_tcam_din_mask[16+:32]  <= (wren_110c) ? Bus2IP_Data : bus_mac_tcam_din_mask[16+:32];
   end

reg   wren_1110_d;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) wren_1110_d  <= 0;
   else wren_1110_d  <= wren_1110;

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) bus_mac_tcam_wren  <= 0;
   else bus_mac_tcam_wren  <= wren_1110 & ~wren_1110_d;

reg   rden_1114_d;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) rden_1114_d  <= 0;
   else rden_1114_d  <= rden_1114;

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) bus_mac_tcam_stat_rden  <= 0;
   else bus_mac_tcam_stat_rden   <= rden_1114 & ~rden_1114_d;

//mac action interface
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) begin
      bus_mac_act_addr    <= 0;
      bus_mac_act_din     <= 0;
   end
   else begin
      bus_mac_act_addr    <= (wren_1120) ? Bus2IP_Data[MAC_TBL_ADDR_WIDTH-1:0] : bus_mac_act_addr;
      bus_mac_act_din     <= (wren_1124) ? Bus2IP_Data[ACT_TBL_DATA_WIDTH-1:0] : bus_mac_act_din;
   end

reg   wren_1130_d;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) wren_1130_d  <= 0;
   else wren_1130_d  <= wren_1130;

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) bus_mac_act_wren  <= 0;
   else bus_mac_act_wren   <= wren_1130 & ~wren_1130_d;

reg   rden_1134_d;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) rden_1134_d  <= 0;
   else rden_1134_d  <= rden_1134;

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) bus_mac_act_stat_rden  <= 0;
   else bus_mac_act_stat_rden <= rden_1134 & ~rden_1134_d;

//Get the ref_counter when the first ip address table is written.
reg   [C_S_AXI_DATA_WIDTH-1:0]  ip_wren_counter;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) ip_wren_counter <= 0;
   else if (bus_flow_stat_cnt_clr[0]) ip_wren_counter <= 0;
   else if (bus_ip_tcam_wren) ip_wren_counter <= ip_wren_counter + 1;

reg   [63:0]   ip_wren_1st_ref_counter;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) ip_wren_1st_ref_counter <= 0;
   else if (bus_flow_stat_cnt_clr[0]) ip_wren_1st_ref_counter <= 0;
   else if (ip_wren_counter == 0 && bus_ip_tcam_wren) ip_wren_1st_ref_counter <= ref_counter;

reg   [63:0]   ip_wren_ref_counter;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) ip_wren_ref_counter <= 0;
   else if (bus_flow_stat_cnt_clr[0]) ip_wren_ref_counter <= 0;
   else if (bus_ip_tcam_wren) ip_wren_ref_counter <= ref_counter;


//ip tcam interfacee
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) begin
      bus_ip_tcam_addr        <= 0;
      bus_ip_tcam_din         <= 0;
      bus_ip_tcam_din_mask    <= 0;
   end
   else begin
      bus_ip_tcam_addr        <= (wren_1140) ? Bus2IP_Data[IP_TBL_ADDR_WIDTH-1:0] : bus_ip_tcam_addr;
      bus_ip_tcam_din         <= (wren_1144) ? Bus2IP_Data[HDR_IP_ADDR_WIDTH-1:0] : bus_ip_tcam_din;
      bus_ip_tcam_din_mask    <= (wren_1148) ? Bus2IP_Data[HDR_IP_ADDR_WIDTH-1:0] : bus_ip_tcam_din_mask;
   end

reg   wren_1150_d;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) wren_1150_d  <= 0;
   else wren_1150_d  <= wren_1150;

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) bus_ip_tcam_wren  <= 0;
   else bus_ip_tcam_wren   <= wren_1150 & ~wren_1150_d;

reg   rden_1154_d;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) rden_1154_d  <= 0;
   else rden_1154_d  <= rden_1154;

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) bus_ip_tcam_stat_rden  <= 0;
   else bus_ip_tcam_stat_rden    <= rden_1154 & ~rden_1154_d;

//ip action interface
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) begin
      bus_ip_act_addr   <= 0;
      bus_ip_act_din    <= 0;
   end
   else begin
      bus_ip_act_addr   <= (wren_1160) ? Bus2IP_Data[IP_TBL_ADDR_WIDTH-1:0] : bus_ip_act_addr;
      bus_ip_act_din    <= (wren_1164) ? Bus2IP_Data[ACT_TBL_DATA_WIDTH-1:0] : bus_ip_act_din;
   end

reg   wren_1170_d;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) wren_1170_d  <= 0;
   else wren_1170_d  <= wren_1170;

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) bus_ip_act_wren  <= 0;
   else bus_ip_act_wren <= wren_1170 & ~wren_1170_d;

reg   rden_1174_d;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) rden_1174_d  <= 0;
   else rden_1174_d  <= rden_1174;

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) bus_ip_act_stat_rden  <= 0;
   else bus_ip_act_stat_rden <= rden_1174 & ~rden_1174_d;


//Get the ref_counter when the first port number table is written.
reg   [C_S_AXI_DATA_WIDTH-1:0]  port_wren_counter;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) port_wren_counter <= 0;
   else if (bus_flow_stat_cnt_clr[2]) port_wren_counter <= 0;
   else if (bus_port_no_tcam_wren) port_wren_counter <= port_wren_counter + 1;

reg   [63:0]   port_wren_1st_ref_counter;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) port_wren_1st_ref_counter <= 0;
   else if (bus_flow_stat_cnt_clr[2]) port_wren_1st_ref_counter <= 0;
   else if (port_wren_counter == 0 && bus_port_no_tcam_wren) port_wren_1st_ref_counter <= ref_counter;

reg   [63:0]   port_wren_ref_counter;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) port_wren_ref_counter <= 0;
   else if (bus_flow_stat_cnt_clr[2]) port_wren_ref_counter <= 0;
   else if (bus_port_no_tcam_wren) port_wren_ref_counter <= ref_counter;


//port tcam interface
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) begin
      bus_port_no_tcam_addr      <= 0;
      bus_port_no_tcam_din       <= 0;
      bus_port_no_tcam_din_mask  <= 0;
   end
   else begin
      bus_port_no_tcam_addr      <= (wren_1180) ? Bus2IP_Data[PORT_NO_TBL_ADDR_WIDTH-1:0] : bus_port_no_tcam_addr;
      bus_port_no_tcam_din       <= (wren_1184) ? Bus2IP_Data[HDR_PORT_NO_WIDTH-1:0] : bus_port_no_tcam_din;
      bus_port_no_tcam_din_mask  <= (wren_1188) ? Bus2IP_Data[HDR_PORT_NO_WIDTH-1:0] : bus_port_no_tcam_din_mask;
   end

reg   wren_1190_d;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) wren_1190_d  <= 0;
   else wren_1190_d  <= wren_1190;

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) bus_port_no_tcam_wren  <= 0;
   else bus_port_no_tcam_wren <= wren_1190 & ~wren_1190_d;

reg   rden_1194_d;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) rden_1194_d  <= 0;
   else rden_1194_d  <= rden_1194;

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) bus_port_no_tcam_stat_rden  <= 0;
   else bus_port_no_tcam_stat_rden <= rden_1194 & ~rden_1194_d;
      
//port action interface
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) begin
      bus_port_no_act_addr   <= 0;
      bus_port_no_act_din    <= 0;
   end
   else begin
      bus_port_no_act_addr   <= (wren_11a0) ? Bus2IP_Data[PORT_NO_TBL_ADDR_WIDTH-1:0] : bus_port_no_act_addr;
      bus_port_no_act_din    <= (wren_11a4) ? Bus2IP_Data[ACT_TBL_DATA_WIDTH-1:0] : bus_port_no_act_din;
   end

reg   wren_11b0_d;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) wren_11b0_d  <= 0;
   else wren_11b0_d  <= wren_11b0;

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) bus_port_no_act_wren  <= 0;
   else bus_port_no_act_wren <= wren_11b0 & ~wren_11b0_d;
      
reg   rden_11b4_d;
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) rden_11b4_d  <= 0;
   else rden_11b4_d  <= rden_11b4;

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) bus_port_no_act_stat_rden  <= 0;
   else bus_port_no_act_stat_rden <= rden_11b4 & ~rden_11b4_d;


reg   [63:0]   ts_tap_0, ts_tap_1;
always @(posedge  Bus2IP_Clk)
   if (~Bus2IP_Resetn) begin
      ts_tap_0 <= 0;
      ts_tap_1 <= 0;
   end
   else if (wren_1600) begin
      ts_tap_0 <= ref_counter;
   end
   else if (wren_1608) begin
      ts_tap_1 <= ref_counter;
   end


//Return WrAck to CPU.
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) begin
      IP2Bus_WrAck   <= 0;
   end
   else if (IP2Bus_WrAck) begin
      IP2Bus_WrAck   <= (Bus2IP_CS) ? 1 : 0;
   end
   else if (Bus2IP_CS & ~Bus2IP_RNW) begin
      IP2Bus_WrAck   <= 1;
   end

//Bus read process
always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) begin
      RdAckCnt       <= 0;
      IP2Bus_RdAck   <= 0;
      IP2Bus_Data    <= 0;
   end
   else if (IP2Bus_RdAck) begin
      RdAckCnt       <= 0;
      IP2Bus_RdAck   <= (Bus2IP_CS) ? 1 : 0;
   end
   else if (RdAckCnt == 7) begin
      RdAckCnt       <= 0;
      IP2Bus_RdAck   <= 1;
      begin
         if      (rden_1000)  IP2Bus_Data <= bus_configuration;
         else if (rden_100c)  IP2Bus_Data <= {26'b0, bus_flow_table_sel};
         else if (rden_1014)  IP2Bus_Data <= {26'b0, bus_flow_table_config};
         else if (rden_1018)  IP2Bus_Data <= {26'b0, bus_flow_table_status};
         else if (rden_1100)  IP2Bus_Data <= {{(C_S_AXI_DATA_WIDTH-MAC_TBL_ADDR_WIDTH){1'b0}},bus_mac_tcam_addr};
         else if (rden_1104)  IP2Bus_Data <= bus_mac_tcam_din[0+:32];
         else if (rden_1108)  IP2Bus_Data <= {bus_mac_tcam_din_mask[0+:16], bus_mac_tcam_din[32+:16]};
         else if (rden_110c)  IP2Bus_Data <= bus_mac_tcam_din_mask[16+:32];
         else if (rden_1114)  IP2Bus_Data <= bus_mac_tcam_stat_rd_data;

         else if (rden_1120)  IP2Bus_Data <= {{(C_S_AXI_DATA_WIDTH-MAC_TBL_ADDR_WIDTH){1'b0}},bus_mac_act_addr};
         else if (rden_1124)  IP2Bus_Data <= bus_mac_act_din[0+:ACT_TBL_DATA_WIDTH];
         else if (rden_1134)  IP2Bus_Data <= bus_mac_act_stat_rd_data;


         else if (rden_1140)  IP2Bus_Data <= {{(C_S_AXI_DATA_WIDTH-IP_TBL_ADDR_WIDTH){1'b0}},bus_ip_tcam_addr};
         else if (rden_1144)  IP2Bus_Data <= bus_ip_tcam_din;
         else if (rden_1148)  IP2Bus_Data <= bus_ip_tcam_din_mask;
         else if (rden_1154)  IP2Bus_Data <= bus_ip_tcam_stat_rd_data;

         else if (rden_1160)  IP2Bus_Data <= {{(C_S_AXI_DATA_WIDTH-IP_TBL_ADDR_WIDTH){1'b0}},bus_ip_act_addr};
         else if (rden_1164)  IP2Bus_Data <= bus_ip_act_din[0+:ACT_TBL_DATA_WIDTH];
         else if (rden_1174)  IP2Bus_Data <= bus_ip_act_stat_rd_data;


         else if (rden_1180)  IP2Bus_Data <= {{(C_S_AXI_DATA_WIDTH-PORT_NO_TBL_ADDR_WIDTH){1'b0}},bus_port_no_tcam_addr};
         else if (rden_1184)  IP2Bus_Data <= bus_port_no_tcam_din;
         else if (rden_1188)  IP2Bus_Data <= bus_port_no_tcam_din_mask;
         else if (rden_1194)  IP2Bus_Data <= bus_port_no_tcam_stat_rd_data;

         else if (rden_11a0)  IP2Bus_Data <= {{(C_S_AXI_DATA_WIDTH-PORT_NO_TBL_ADDR_WIDTH){1'b0}},bus_port_no_act_addr};
         else if (rden_11a4)  IP2Bus_Data <= bus_port_no_act_din[0+:ACT_TBL_DATA_WIDTH];
         else if (rden_11b4)  IP2Bus_Data <= bus_port_no_act_stat_rd_data;


         else if (rden_1504)  IP2Bus_Data <= bus_mac_hit_count;
         else if (rden_1508)  IP2Bus_Data <= bus_mac_miss_count;
         else if (rden_150c)  IP2Bus_Data <= bus_mac_tot_count;

         else if (rden_1514)  IP2Bus_Data <= bus_ip_hit_count;
         else if (rden_1518)  IP2Bus_Data <= bus_ip_miss_count;
         else if (rden_151c)  IP2Bus_Data <= bus_ip_tot_count;

         else if (rden_1524)  IP2Bus_Data <= bus_port_no_hit_count;
         else if (rden_1528)  IP2Bus_Data <= bus_port_no_miss_count;
         else if (rden_152c)  IP2Bus_Data <= bus_port_no_tot_count;

         else if (rden_1600)  IP2Bus_Data <= ts_tap_0[31:0];
         else if (rden_1604)  IP2Bus_Data <= ts_tap_0[63:32];
         else if (rden_1608)  IP2Bus_Data <= ts_tap_1[31:0];
         else if (rden_160c)  IP2Bus_Data <= ts_tap_1[63:32];

         else if (rden_1610)  IP2Bus_Data <= mac_wren_1st_ref_counter[31:0];
         else if (rden_1614)  IP2Bus_Data <= mac_wren_1st_ref_counter[63:32];
         else if (rden_1618)  IP2Bus_Data <= mac_wren_ref_counter[31:0];
         else if (rden_161c)  IP2Bus_Data <= mac_wren_ref_counter[63:32];
 
         else if (rden_1620)  IP2Bus_Data <= ip_wren_1st_ref_counter[31:0];
         else if (rden_1624)  IP2Bus_Data <= ip_wren_1st_ref_counter[63:32];
         else if (rden_1628)  IP2Bus_Data <= ip_wren_ref_counter[31:0];
         else if (rden_162c)  IP2Bus_Data <= ip_wren_ref_counter[63:32];
 
         else if (rden_1630)  IP2Bus_Data <= port_wren_1st_ref_counter[31:0];
         else if (rden_1634)  IP2Bus_Data <= port_wren_1st_ref_counter[63:32];
         else if (rden_1638)  IP2Bus_Data <= port_wren_ref_counter[31:0];
         else if (rden_163c)  IP2Bus_Data <= port_wren_ref_counter[63:32];
 
         else if (rden_1640)  IP2Bus_Data <= trigger_ref_counter[31:0];
         else if (rden_1644)  IP2Bus_Data <= trigger_ref_counter[63:32];

         else if (rden_1650)  IP2Bus_Data <= stream_update_start[31:0];
         else if (rden_1654)  IP2Bus_Data <= stream_update_start[63:32];
         else if (rden_1658)  IP2Bus_Data <= stream_update_end[31:0];
         else if (rden_165c)  IP2Bus_Data <= stream_update_end[63:32];
    end
   end
   else if (RdAckCnt > 0) begin
      RdAckCnt       <= RdAckCnt + 1;
      IP2Bus_RdAck   <= 0;
   end
   else if (Bus2IP_CS & Bus2IP_RNW) begin
      RdAckCnt       <= 1;
      IP2Bus_RdAck   <= 0;
   end

endmodule
