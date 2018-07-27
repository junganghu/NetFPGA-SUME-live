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

module data_processor_controller
#(
   parameter   C_S_AXI_ADDR_WIDTH      = 32,
   parameter   C_S_AXI_DATA_WIDTH      = 32,
   parameter   BASEADDR_OFFSET         = 16'h0
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

   output   reg                                       bus_clear_cnt,
   output   reg   [7:0]                               bus_miss_fwd_port_map,
   output   reg                                       bus_ts_valid,
   output   reg   [7:0]                               bus_slave_ts_position,
   output   reg   [7:0]                               bus_master_ts_position,
   output   reg   [C_S_AXI_DATA_WIDTH-1:0]            bus_sw_tag,
   output   reg   [`DEF_SW_TAG_VAL-1:0]               bus_sw_tag_val,
   input                                              clear_sw_tag_val,

   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_rx_byte_cnt,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_rx_pkt_cnt,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_tx_byte_cnt,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_tx_pkt_cnt,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_rx_fifo_depth,
   input          [C_S_AXI_DATA_WIDTH-1:0]            bus_rx_fifo_depth_max
);

reg   [7:0]    RdAckCnt;

//Clear rx and tx packet and byte number counters.
wire  wren_0010 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (BASEADDR_OFFSET + `CLR_COUNT)) & ~Bus2IP_RNW;

//Time stamp position
wire  wren_0014 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (BASEADDR_OFFSET + `TS_POSITION)) & ~Bus2IP_RNW;
wire  rden_0014 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (BASEADDR_OFFSET + `TS_POSITION)) & Bus2IP_RNW;
wire  wren_0030 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (BASEADDR_OFFSET + 16'h0030)) & ~Bus2IP_RNW;
wire  rden_0030 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (BASEADDR_OFFSET + 16'h0030)) & Bus2IP_RNW;

//As miss matach, set where it needs to go 0: Flood, others that is same with
//the destination port bitmap.
wire  wren_0018 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (BASEADDR_OFFSET + `MISS_FWD)) & ~Bus2IP_RNW;
wire  rden_0018 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (BASEADDR_OFFSET + `MISS_FWD)) & Bus2IP_RNW;

//Statistics
//rx byte counter.
wire  rden_0020 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (BASEADDR_OFFSET + `RX_BYTE_COUNT)) & Bus2IP_RNW;
//rx packet counter.
wire  rden_0024 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (BASEADDR_OFFSET + `RX_PKT_COUNT)) & Bus2IP_RNW;
//tx byte counter.
wire  rden_0028 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (BASEADDR_OFFSET + `TX_BYTE_COUNT)) & Bus2IP_RNW;
//tx packet counter.
wire  rden_002c = Bus2IP_CS & (Bus2IP_Addr[15:0] == (BASEADDR_OFFSET + `TX_PKT_COUNT)) & Bus2IP_RNW;

//Rx fifo depth monitor.
wire  rden_0060 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (BASEADDR_OFFSET + `RX_FIFO_DEPTH)) & Bus2IP_RNW;
//Rx fifo depth max.
wire  rden_0064 = Bus2IP_CS & (Bus2IP_Addr[15:0] == (BASEADDR_OFFSET + `RX_FIFO_DEPTH_MAX)) & Bus2IP_RNW;

//Add SW TAG for triggering next hop switches.
wire  wren_SW_TAG_VAL = Bus2IP_CS & (Bus2IP_Addr[15:0] == (BASEADDR_OFFSET + `SW_TAG_VAL)) & ~Bus2IP_RNW;

wire  wren_SW_TAG = Bus2IP_CS & (Bus2IP_Addr[15:0] == (BASEADDR_OFFSET + `SW_TAG)) & ~Bus2IP_RNW;
wire  rden_SW_TAG = Bus2IP_CS & (Bus2IP_Addr[15:0] == (BASEADDR_OFFSET + `SW_TAG)) &  Bus2IP_RNW;


always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn)
      bus_clear_cnt  <= 0;
   else
      bus_clear_cnt  <= wren_0010;


always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) begin
      bus_slave_ts_position    <= 0;
      bus_master_ts_position   <= 0;
   end
   else begin
      bus_slave_ts_position    <= (wren_0014) ? Bus2IP_Data[0+:8]  : bus_slave_ts_position;
      bus_master_ts_position   <= (wren_0014) ? Bus2IP_Data[16+:8] : bus_master_ts_position;
   end

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) begin
      bus_ts_valid   <= 0;
   end
   else if (wren_0030) begin
      bus_ts_valid   <= Bus2IP_Data[0];
   end

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) begin
      bus_miss_fwd_port_map   <= 0;
   end
   else if (wren_0018) begin
      bus_miss_fwd_port_map   <= Bus2IP_Data[0+:8];
   end

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) begin
      bus_sw_tag_val <= 0;
   end
   else if (clear_sw_tag_val) begin
      bus_sw_tag_val <= 0;
   end
   else if (wren_SW_TAG_VAL) begin
      bus_sw_tag_val <= Bus2IP_Data[0+:`DEF_SW_TAG_VAL];
   end

always @(posedge Bus2IP_Clk)
   if (~Bus2IP_Resetn) begin
      bus_sw_tag  <= 32'h0123abcd;
   end
   else if (wren_SW_TAG) begin
      bus_sw_tag  <= Bus2IP_Data;
   end

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
         if      (rden_0014)  IP2Bus_Data <= {8'h0, bus_master_ts_position, 8'h0, bus_slave_ts_position};
         else if (rden_0018)  IP2Bus_Data <= {24'h0, bus_miss_fwd_port_map};
         else if (rden_0020)  IP2Bus_Data <= bus_rx_byte_cnt;
         else if (rden_0024)  IP2Bus_Data <= bus_rx_pkt_cnt;
         else if (rden_0028)  IP2Bus_Data <= bus_tx_byte_cnt;
         else if (rden_002c)  IP2Bus_Data <= bus_tx_pkt_cnt;
         else if (rden_0030)  IP2Bus_Data <= {31'h0, bus_ts_valid};
         else if (rden_0060)  IP2Bus_Data <= bus_rx_fifo_depth;
         else if (rden_0064)  IP2Bus_Data <= bus_rx_fifo_depth_max;
         else if (rden_SW_TAG)   IP2Bus_Data <= bus_sw_tag;
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
