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

module input_header_arbiter
#(
   //Master AXI Stream Data Width
   parameter   C_M_HDR_TDATA_WIDTH     =  256,
   parameter   C_M_HDR_TUSER_WIDTH     =  128,

   parameter   C_S_HDR_TDATA_WIDTH     =  256,
   parameter   C_S_HDR_TUSER_WIDTH     =  128,

   parameter   NUM_QUEUES=5
)
(
   // Part 1: System side signals
   // Global Ports
   input axi_aclk,
   input axi_resetn,

   // Master Stream Ports (interface to data path)
   output [C_M_HDR_TDATA_WIDTH - 1:0] m_axis_tdata,
   output [C_M_HDR_TUSER_WIDTH-1:0] m_axis_tuser,
   output m_axis_tvalid,
   input  m_axis_tready,

   // Slave Stream Ports (interface to RX queues)
   input [C_S_HDR_TDATA_WIDTH - 1:0] s_axis_tdata_0,
   input [C_S_HDR_TUSER_WIDTH-1:0] s_axis_tuser_0,
   input  s_axis_tvalid_0,
   output s_axis_tready_0,

   input [C_S_HDR_TDATA_WIDTH - 1:0] s_axis_tdata_1,
   input [C_S_HDR_TUSER_WIDTH-1:0] s_axis_tuser_1,
   input  s_axis_tvalid_1,
   output s_axis_tready_1,

   input [C_S_HDR_TDATA_WIDTH - 1:0] s_axis_tdata_2,
   input [C_S_HDR_TUSER_WIDTH-1:0] s_axis_tuser_2,
   input  s_axis_tvalid_2,
   output s_axis_tready_2,

   input [C_S_HDR_TDATA_WIDTH - 1:0] s_axis_tdata_3,
   input [C_S_HDR_TUSER_WIDTH-1:0] s_axis_tuser_3,
   input  s_axis_tvalid_3,
   output s_axis_tready_3,

   input [C_S_HDR_TDATA_WIDTH - 1:0] s_axis_tdata_4,
   input [C_S_HDR_TUSER_WIDTH-1:0] s_axis_tuser_4,
   input  s_axis_tvalid_4,
   output s_axis_tready_4
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
parameter NUM_QUEUES_WIDTH = log2(NUM_QUEUES);

localparam MAX_PKT_SIZE = 2000; // In bytes
localparam IN_FIFO_DEPTH_BIT = log2(MAX_PKT_SIZE/(C_M_HDR_TDATA_WIDTH / 8));

// ------------- Regs/ wires -----------

wire [NUM_QUEUES-1:0]            nearly_full;
wire [NUM_QUEUES-1:0]            empty;
wire [C_M_HDR_TDATA_WIDTH-1:0]   in_tdata[NUM_QUEUES-1:0];
wire [C_M_HDR_TUSER_WIDTH-1:0]   in_tuser[NUM_QUEUES-1:0];
wire [NUM_QUEUES-1:0] 	         in_tvalid;
wire [C_M_HDR_TUSER_WIDTH-1:0]   fifo_out_tuser[NUM_QUEUES-1:0];
wire [C_M_HDR_TDATA_WIDTH-1:0]   fifo_out_tdata[NUM_QUEUES-1:0];
wire [NUM_QUEUES-1:0]            rd_en;
reg [NUM_QUEUES_WIDTH-1:0]       cur_queue;

wire [256-C_M_HDR_TUSER_WIDTH-C_M_HDR_TDATA_WIDTH-1:0] dummy_wire[NUM_QUEUES-1:0];

// ------------ Modules -------------
generate
genvar i;
for(i=0; i<NUM_QUEUES; i=i+1) begin: in_arb_queues

   `ifdef XIL_FIFO

   fifo_64x256 in_arb_fifo
   (
      .dout  (  {dummy_wire[i], fifo_out_tuser[i], fifo_out_tdata[i]} ),
      .rd_en (  rd_en[i]                                 ),
      .full  (  nearly_full[i]                           ),
      .empty (  empty[i]                                 ),
      .din   (  {{(256-C_M_HDR_TUSER_WIDTH-C_M_HDR_TDATA_WIDTH){1'b0}}, in_tuser[i], in_tdata[i]}),
      .wr_en (  in_tvalid[i]                             ),
      .clk   (  axi_aclk                                 )
   );

   `else

   fallthrough_small_fifo
   #(
      .WIDTH            (  C_M_HDR_TDATA_WIDTH+C_M_HDR_TUSER_WIDTH   ),
      .MAX_DEPTH_BITS   (  IN_FIFO_DEPTH_BIT                         )
   )
   in_arb_fifo
   (
      // Outputs
      .dout          ({fifo_out_tuser[i], fifo_out_tdata[i]}),
      .full          (),
      .nearly_full   (nearly_full[i]),
      .prog_full     (),
      .empty         (empty[i]),
      // Inputs
      .din           ({in_tuser[i], in_tdata[i]}),
      .wr_en         (in_tvalid[i]), //& ~nearly_full[i]),
      .rd_en         (rd_en[i]),
      .reset         (~axi_resetn),
      .clk           (axi_aclk)
   );

   `endif
end
endgenerate

// ------------- Logic ------------
assign in_tdata[0]        = s_axis_tdata_0;
assign in_tuser[0]        = s_axis_tuser_0;
assign in_tvalid[0]       = s_axis_tvalid_0;
assign s_axis_tready_0    = !nearly_full[0];
assign rd_en[0]   = (cur_queue == 0) & ~empty[0] & m_axis_tready;

assign in_tdata[1]        = s_axis_tdata_1;
assign in_tuser[1]        = s_axis_tuser_1;
assign in_tvalid[1]       = s_axis_tvalid_1;
assign s_axis_tready_1    = !nearly_full[1];
assign rd_en[1]   = (cur_queue == 1) & ~empty[1] & m_axis_tready;

assign in_tdata[2]        = s_axis_tdata_2;
assign in_tuser[2]        = s_axis_tuser_2;
assign in_tvalid[2]       = s_axis_tvalid_2;
assign s_axis_tready_2    = !nearly_full[2];
assign rd_en[2]   = (cur_queue == 2) & ~empty[2] & m_axis_tready;

assign in_tdata[3]        = s_axis_tdata_3;
assign in_tuser[3]        = s_axis_tuser_3;
assign in_tvalid[3]       = s_axis_tvalid_3;
assign s_axis_tready_3    = !nearly_full[3];
assign rd_en[3]   = (cur_queue == 3) & ~empty[3] & m_axis_tready;

assign in_tdata[4]        = s_axis_tdata_4;
assign in_tuser[4]        = s_axis_tuser_4;
assign in_tvalid[4]       = s_axis_tvalid_4;
assign s_axis_tready_4    = !nearly_full[4];
assign rd_en[4]   = (cur_queue == 4) & ~empty[4] & m_axis_tready;

assign m_axis_tuser = (~empty[cur_queue]) ? fifo_out_tuser[cur_queue] : 0;
assign m_axis_tdata = (~empty[cur_queue]) ? fifo_out_tdata[cur_queue] : 0;
assign m_axis_tvalid = ~empty[cur_queue];

always @(posedge axi_aclk)
   if (~axi_resetn) begin
      cur_queue   <= 0;
   end
   else begin
      cur_queue   <= (cur_queue == (NUM_QUEUES-1)) ? 0 : cur_queue + 1;
   end

endmodule
