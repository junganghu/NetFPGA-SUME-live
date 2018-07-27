//
// Copyright (c) 2015-2016 Jong Hun Han
// Copyright (c) 2015 SRI International
// All rights reserved.
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

module input_queues
#(
    //Master AXI Stream Data Width
    parameter C_M_AXIS_DATA_WIDTH=256,
    parameter C_S_AXIS_DATA_WIDTH=256,
    parameter C_M_AXIS_TUSER_WIDTH=128,
    parameter C_S_AXIS_TUSER_WIDTH=128,
    parameter NUM_QUEUES=5
)
(
    //Part 1: System side signals
    //Global Ports
    input axi_aclk,
    input axi_resetn,

    //Master Stream Ports (interface to data path)
    output [C_M_AXIS_DATA_WIDTH - 1:0] m_axis_tdata,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_tstrb,
    output [C_M_AXIS_TUSER_WIDTH-1:0] m_axis_tuser,
    output m_axis_tvalid,
    input  m_axis_tready,
    output m_axis_tlast,

    //Slave Stream Ports (interface to RX queues)
    input [C_S_AXIS_DATA_WIDTH - 1:0] s_axis_tdata_0,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s_axis_tstrb_0,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s_axis_tuser_0,
    input  s_axis_tvalid_0,
    output s_axis_tready_0,
    input  s_axis_tlast_0,

    input [C_S_AXIS_DATA_WIDTH - 1:0] s_axis_tdata_1,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s_axis_tstrb_1,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s_axis_tuser_1,
    input  s_axis_tvalid_1,
    output s_axis_tready_1,
    input  s_axis_tlast_1,

    input [C_S_AXIS_DATA_WIDTH - 1:0] s_axis_tdata_2,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s_axis_tstrb_2,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s_axis_tuser_2,
    input  s_axis_tvalid_2,
    output s_axis_tready_2,
    input  s_axis_tlast_2,

    input [C_S_AXIS_DATA_WIDTH - 1:0] s_axis_tdata_3,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s_axis_tstrb_3,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s_axis_tuser_3,
    input  s_axis_tvalid_3,
    output s_axis_tready_3,
    input  s_axis_tlast_3,

    input [C_S_AXIS_DATA_WIDTH - 1:0] s_axis_tdata_4,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s_axis_tstrb_4,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s_axis_tuser_4,
    input  s_axis_tvalid_4,
    output s_axis_tready_4,
    input  s_axis_tlast_4
);

function integer log2;
   input integer number;
   begin
      log2=0;
      while(2**log2<number) begin
         log2=log2+1;
      end
   end
endfunction //log2

// ------------ Internal Params --------
parameter NUM_QUEUES_WIDTH = log2(NUM_QUEUES);
parameter NUM_STATES = 1;
parameter IDLE = 0;
parameter WR_PKT = 1;

localparam MAX_PKT_SIZE = 2048; //In bytes
localparam IN_FIFO_DEPTH_BIT = log2(MAX_PKT_SIZE/(C_M_AXIS_DATA_WIDTH/8));

// ------------- Regs/ wires -----------
wire [NUM_QUEUES-1:0]                  nearly_full;
wire [NUM_QUEUES-1:0]                  empty;
wire [C_M_AXIS_DATA_WIDTH-1:0]         in_tdata[NUM_QUEUES-1:0];
wire [((C_M_AXIS_DATA_WIDTH/8))-1:0]   in_tstrb[NUM_QUEUES-1:0];
wire [C_M_AXIS_TUSER_WIDTH-1:0]        in_tuser[NUM_QUEUES-1:0];
wire [NUM_QUEUES-1:0] 	               in_tvalid;
wire [NUM_QUEUES-1:0]                  in_tlast;
wire [C_M_AXIS_TUSER_WIDTH-1:0]        fifo_out_tuser[NUM_QUEUES-1:0];
wire [C_M_AXIS_DATA_WIDTH-1:0]         fifo_out_tdata[NUM_QUEUES-1:0];
wire [((C_M_AXIS_DATA_WIDTH/8))-1:0]   fifo_out_tstrb[NUM_QUEUES-1:0];
wire [NUM_QUEUES-1:0] 	               fifo_out_tlast;
wire                                   fifo_tvalid;
wire                                   fifo_tlast;

reg [NUM_QUEUES-1:0]                   rd_en;
reg [NUM_QUEUES_WIDTH-1:0]             cur_queue, cur_queue_next;
reg [NUM_STATES-1:0]                   state;
reg [NUM_STATES-1:0]                   state_next;

// ------------ Modules -------------
generate
   genvar i;
   for(i=0; i<NUM_QUEUES; i=i+1) begin: in_arb_queues
      fallthrough_small_fifo
      #(
         .WIDTH(C_M_AXIS_DATA_WIDTH+C_M_AXIS_TUSER_WIDTH+C_M_AXIS_DATA_WIDTH/8+1),
         .MAX_DEPTH_BITS(IN_FIFO_DEPTH_BIT)
      )
      in_arb_fifo
      (
      // Outputs
      .dout          (  {fifo_out_tlast[i], fifo_out_tuser[i], fifo_out_tstrb[i], fifo_out_tdata[i]}),
      .full          (),
      .nearly_full   (  nearly_full[i]),
      .prog_full     (),
      .empty         (  empty[i]),
      // Inputs
      .din           (  {in_tlast[i], in_tuser[i], in_tstrb[i], in_tdata[i]}),
      .wr_en         (  in_tvalid[i] & ~nearly_full[i]),
      .rd_en         (  rd_en[i]),
      .reset         (  ~axi_resetn),
      .clk           (  axi_aclk));
   end
endgenerate

// ------------- Logic ------------
assign in_tdata[0]        = s_axis_tdata_0;
assign in_tstrb[0]        = s_axis_tstrb_0;
assign in_tuser[0]        = s_axis_tuser_0;
assign in_tvalid[0]       = s_axis_tvalid_0;
assign in_tlast[0]        = s_axis_tlast_0;
assign s_axis_tready_0    = !nearly_full[0];

assign in_tdata[1]        = s_axis_tdata_1;
assign in_tstrb[1]        = s_axis_tstrb_1;
assign in_tuser[1]        = s_axis_tuser_1;
assign in_tvalid[1]       = s_axis_tvalid_1;
assign in_tlast[1]        = s_axis_tlast_1;
assign s_axis_tready_1    = !nearly_full[1];

assign in_tdata[2]        = s_axis_tdata_2;
assign in_tstrb[2]        = s_axis_tstrb_2;
assign in_tuser[2]        = s_axis_tuser_2;
assign in_tvalid[2]       = s_axis_tvalid_2;
assign in_tlast[2]        = s_axis_tlast_2;
assign s_axis_tready_2    = !nearly_full[2];

assign in_tdata[3]        = s_axis_tdata_3;
assign in_tstrb[3]        = s_axis_tstrb_3;
assign in_tuser[3]        = s_axis_tuser_3;
assign in_tvalid[3]       = s_axis_tvalid_3;
assign in_tlast[3]        = s_axis_tlast_3;
assign s_axis_tready_3    = !nearly_full[3];

assign in_tdata[4]        = s_axis_tdata_4;
assign in_tstrb[4]        = s_axis_tstrb_4;
assign in_tuser[4]        = s_axis_tuser_4;
assign in_tvalid[4]       = s_axis_tvalid_4;
assign in_tlast[4]        = s_axis_tlast_4;
assign s_axis_tready_4    = !nearly_full[4];

assign m_axis_tuser = fifo_out_tuser[cur_queue];
assign m_axis_tdata = fifo_out_tdata[cur_queue];
assign m_axis_tlast = fifo_out_tlast[cur_queue];
assign m_axis_tstrb = fifo_out_tstrb[cur_queue];
assign m_axis_tvalid = ~empty[cur_queue];

always @(*) begin
   state_next      = 0;
   rd_en           = 0;
   cur_queue_next  = cur_queue;
   case(state)
      IDLE: begin
         if (m_axis_tready & ~empty[cur_queue]) begin
            state_next = WR_PKT;
            rd_en[cur_queue] = 1;
         end
         else begin
            state_next = IDLE;
            cur_queue_next   = (cur_queue == NUM_QUEUES-1) ? 0 : cur_queue + 1;
         end
      end
      WR_PKT: begin
         if (m_axis_tready & m_axis_tlast) begin
            state_next = IDLE;
            rd_en[cur_queue] = 1;
            cur_queue_next    = (cur_queue == NUM_QUEUES-1) ? 0 : cur_queue + 1;
         end
         else begin
            rd_en[cur_queue] = (m_axis_tready & ~empty[cur_queue]);
            state_next = WR_PKT;
         end
      end
   endcase
end

always @(posedge axi_aclk)
   if(~axi_resetn) begin
      state       <= IDLE;
      cur_queue   <= 0;
   end
   else begin
      state       <= state_next;
      cur_queue   <= cur_queue_next;
   end

endmodule
