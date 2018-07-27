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

module output_queues
#(
    // Master AXI Stream Data Width
    parameter C_M_AXIS_DATA_WIDTH=256,
    parameter C_S_AXIS_DATA_WIDTH=256,
    parameter C_M_AXIS_TUSER_WIDTH=128,
    parameter C_S_AXIS_TUSER_WIDTH=128,
    parameter NUM_QUEUES=5
)
(
    // Part 1: System side signals
    // Global Ports
    input axi_aclk,
    input axi_resetn,

    // Slave Stream Ports (interface to data path)
    input [C_S_AXIS_DATA_WIDTH - 1:0] s_axis_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s_axis_tstrb,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s_axis_tuser,
    input s_axis_tvalid,
    output s_axis_tready,
    input s_axis_tlast,

    // Master Stream Ports (interface to TX queues)
    output [C_M_AXIS_DATA_WIDTH - 1:0] m_axis_tdata_0,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_tstrb_0,
    output [C_M_AXIS_TUSER_WIDTH-1:0] m_axis_tuser_0,
    output  m_axis_tvalid_0,
    input m_axis_tready_0,
    output  m_axis_tlast_0,

    output [C_M_AXIS_DATA_WIDTH - 1:0] m_axis_tdata_1,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_tstrb_1,
    output [C_M_AXIS_TUSER_WIDTH-1:0] m_axis_tuser_1,
    output  m_axis_tvalid_1,
    input m_axis_tready_1,
    output  m_axis_tlast_1,

    output [C_M_AXIS_DATA_WIDTH - 1:0] m_axis_tdata_2,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_tstrb_2,
    output [C_M_AXIS_TUSER_WIDTH-1:0] m_axis_tuser_2,
    output  m_axis_tvalid_2,
    input m_axis_tready_2,
    output  m_axis_tlast_2,

    output [C_M_AXIS_DATA_WIDTH - 1:0] m_axis_tdata_3,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_tstrb_3,
    output [C_M_AXIS_TUSER_WIDTH-1:0] m_axis_tuser_3,
    output  m_axis_tvalid_3,
    input m_axis_tready_3,
    output  m_axis_tlast_3,

    output [C_M_AXIS_DATA_WIDTH - 1:0] m_axis_tdata_4,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_tstrb_4,
    output [C_M_AXIS_TUSER_WIDTH-1:0] m_axis_tuser_4,
    output  m_axis_tvalid_4,
    input m_axis_tready_4,
    output  m_axis_tlast_4
);

function integer log2;
   input integer number;
   begin
      log2=0;
      while(2**log2<number) begin
         log2=log2+1;
      end
   end
endfunction // log2

// ------------ Internal Params --------
localparam NUM_QUEUES_WIDTH = log2(NUM_QUEUES);
localparam BUFFER_SIZE         = 4096; // Buffer size 4096B
localparam BUFFER_SIZE_WIDTH   = log2(BUFFER_SIZE/(C_M_AXIS_DATA_WIDTH/8));

localparam MAX_PACKET_SIZE = 1600;
localparam BUFFER_THRESHOLD = (BUFFER_SIZE-MAX_PACKET_SIZE)/(C_M_AXIS_DATA_WIDTH/8);

// ------------- Regs/ wires -----------
wire  [NUM_QUEUES-1:0]  nearly_full_fifo, empty, rd_en, oq;
reg   [NUM_QUEUES-1:0]  wr_en;

wire  [C_M_AXIS_TUSER_WIDTH-1:0]       fifo_out_tuser[NUM_QUEUES-1:0];
wire  [C_M_AXIS_DATA_WIDTH-1:0]        fifo_out_tdata[NUM_QUEUES-1:0];
wire  [((C_M_AXIS_DATA_WIDTH/8))-1:0]  fifo_out_tstrb[NUM_QUEUES-1:0];
wire  [NUM_QUEUES-1:0] 	               fifo_out_tlast;

// ------------ Modules -------------
generate
   genvar i;
   for(i=0; i<NUM_QUEUES; i=i+1) begin: output_queues
      fallthrough_small_fifo
      #(
         .WIDTH(C_S_AXIS_DATA_WIDTH+C_S_AXIS_TUSER_WIDTH+C_S_AXIS_DATA_WIDTH/8+1),
         .MAX_DEPTH_BITS(BUFFER_SIZE_WIDTH)
      )
      output_fifo
      (
      // Outputs
      .dout          (  {fifo_out_tlast[i], fifo_out_tuser[i], fifo_out_tstrb[i], fifo_out_tdata[i]}),
      .full          (),
      .nearly_full   (),
 	   .prog_full     (  nearly_full_fifo[i]),
      .empty         (  empty[i]),
      // Inputs
      .din           (  {s_axis_tlast, s_axis_tuser, s_axis_tstrb, s_axis_tdata}),
      .wr_en         (  wr_en[i] & s_axis_tvalid & ~nearly_full_fifo[i]),
      .rd_en         (  rd_en[i]),
      .reset         (  ~axi_resetn),
      .clk           (  axi_aclk)
      );
   end
endgenerate

localparam DST_POS = 24;
assign oq = {(s_axis_tuser[DST_POS + 1] | s_axis_tuser[DST_POS + 3] | s_axis_tuser[DST_POS + 5] | s_axis_tuser[DST_POS + 7]),
              s_axis_tuser[DST_POS + 6],
              s_axis_tuser[DST_POS + 4],
              s_axis_tuser[DST_POS + 2],
              s_axis_tuser[DST_POS]};

reg   s_axis_enable;
always @(posedge axi_aclk)
   if (~axi_resetn) begin
      s_axis_enable  <= 0;
   end
   else begin
      s_axis_enable  <= s_axis_tvalid & ~s_axis_tlast;
   end

wire  s_axis_en = (s_axis_tvalid & ~s_axis_tlast) & ~s_axis_enable;

//This is the case that s_axis_tvalid is '1', but s_axis_tuser has no
//destination port, which means the packet hit the match, but no destination
//port.
reg   drop_en;
always @(posedge axi_aclk)
   if (~axi_resetn) begin
      wr_en    <= 0;
      drop_en  <= 0;
   end
   else if (s_axis_tvalid & s_axis_tlast & s_axis_tready) begin
      wr_en    <= 0;
      drop_en  <= 0;
   end
   else if (s_axis_en) begin
      wr_en    <= oq;
      drop_en  <= ~|oq;
   end

assign s_axis_tready = |(wr_en & ~nearly_full_fifo) || drop_en;

assign m_axis_tdata_0	 = fifo_out_tdata[0];
assign m_axis_tstrb_0	 = fifo_out_tstrb[0];
assign m_axis_tuser_0	 = fifo_out_tuser[0];
assign m_axis_tlast_0	 = fifo_out_tlast[0];
assign m_axis_tvalid_0	 = ~empty[0];
assign rd_en[0]			 = m_axis_tready_0 & ~empty[0];

assign m_axis_tdata_1	 = fifo_out_tdata[1];
assign m_axis_tstrb_1	 = fifo_out_tstrb[1];
assign m_axis_tuser_1	 = fifo_out_tuser[1];
assign m_axis_tlast_1	 = fifo_out_tlast[1];
assign m_axis_tvalid_1	 = ~empty[1];
assign rd_en[1]			 = m_axis_tready_1 & ~empty[1];

assign m_axis_tdata_2	 = fifo_out_tdata[2];
assign m_axis_tstrb_2	 = fifo_out_tstrb[2];
assign m_axis_tuser_2	 = fifo_out_tuser[2];
assign m_axis_tlast_2	 = fifo_out_tlast[2];
assign m_axis_tvalid_2	 = ~empty[2];
assign rd_en[2]			 = m_axis_tready_2 & ~empty[2];

assign m_axis_tdata_3	 = fifo_out_tdata[3];
assign m_axis_tstrb_3	 = fifo_out_tstrb[3];
assign m_axis_tuser_3	 = fifo_out_tuser[3];
assign m_axis_tlast_3	 = fifo_out_tlast[3];
assign m_axis_tvalid_3	 = ~empty[3];
assign rd_en[3]			 = m_axis_tready_3 & ~empty[3];

assign m_axis_tdata_4	 = fifo_out_tdata[4];
assign m_axis_tstrb_4	 = fifo_out_tstrb[4];
assign m_axis_tuser_4	 = fifo_out_tuser[4];
assign m_axis_tlast_4	 = fifo_out_tlast[4];
assign m_axis_tvalid_4	 = ~empty[4];
assign rd_en[4]			 = m_axis_tready_4 & ~empty[4];

endmodule
