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

module output_action_arbiter 
#(
   // Master AXI Stream Data Width
   parameter C_S_AXI_DATA_WIDTH        = 32,

   parameter C_M_ACT_TDATA_WIDTH       = 256,
   parameter C_M_ACT_TUSER_WIDTH       = 128,

   parameter C_S_ACT_TDATA_WIDTH       = 256,
   parameter C_S_ACT_TUSER_WIDTH       = 128,

   parameter NUM_QUEUES                = 5
)
(
   // Part 1: System side signals
   // Global Ports
   input axi_aclk,
   input axi_resetn,

   output   reg   [C_S_AXI_DATA_WIDTH-1:0]   out_arb_counter,
   output   reg   [C_S_AXI_DATA_WIDTH-1:0]   out_arb_rd_counter,

   // Slave Stream Ports (interface to data path)
   input [C_S_ACT_TDATA_WIDTH - 1:0] s_axis_tdata,
   input [C_S_ACT_TUSER_WIDTH-1:0] s_axis_tuser,
   input s_axis_tvalid,
   output s_axis_tready,

   // Master Stream Ports (interface to TX queues)
   output [C_M_ACT_TDATA_WIDTH - 1:0] m_axis_tdata_0,
   output [C_M_ACT_TUSER_WIDTH-1:0] m_axis_tuser_0,
   output  m_axis_tvalid_0,
   input m_axis_tready_0,

   output [C_M_ACT_TDATA_WIDTH - 1:0] m_axis_tdata_1,
   output [C_M_ACT_TUSER_WIDTH-1:0] m_axis_tuser_1,
   output  m_axis_tvalid_1,
   input m_axis_tready_1,

   output [C_M_ACT_TDATA_WIDTH - 1:0] m_axis_tdata_2,
   output [C_M_ACT_TUSER_WIDTH-1:0] m_axis_tuser_2,
   output  m_axis_tvalid_2,
   input m_axis_tready_2,

   output [C_M_ACT_TDATA_WIDTH - 1:0] m_axis_tdata_3,
   output [C_M_ACT_TUSER_WIDTH-1:0] m_axis_tuser_3,
   output  m_axis_tvalid_3,
   input m_axis_tready_3,

   output [C_M_ACT_TDATA_WIDTH - 1:0] m_axis_tdata_4,
   output [C_M_ACT_TUSER_WIDTH-1:0] m_axis_tuser_4,
   output  m_axis_tvalid_4,
   input m_axis_tready_4
);

//assign s_axis_tready = s_axis_tvalid;
assign s_axis_tready = 1;

// ------------- Regs/ wires -----------
wire [NUM_QUEUES-1:0]               empty;


wire  [C_M_ACT_TUSER_WIDTH-1:0]   fifo_out_tuser[NUM_QUEUES-1:0];
wire  [C_M_ACT_TDATA_WIDTH-1:0]    fifo_out_tdata[NUM_QUEUES-1:0];

wire  [NUM_QUEUES-1:0]  rd_en;

wire  [64-C_M_ACT_TDATA_WIDTH-C_M_ACT_TUSER_WIDTH-1:0]   dummy_wire[NUM_QUEUES-1:0];

generate
genvar i;
for(i=0; i<NUM_QUEUES; i=i+1) begin: output_queues
   
   `ifdef XIL_FIFO

   fifo_64x64 output_fifo
   (
      .dout  (  {dummy_wire[i], fifo_out_tdata[i], fifo_out_tuser[i]} ),
      .rd_en (  rd_en[i]                                 ),
      .full  (),
      .empty (  empty[i]                                 ),
      .din   (  {{(64-C_M_ACT_TUSER_WIDTH-C_M_ACT_TDATA_WIDTH){1'b0}}, s_axis_tdata, s_axis_tuser}),
      .wr_en (  s_axis_tuser[i] & s_axis_tvalid          ),
      .clk   (  axi_aclk                                 )
   );

   `else

   fallthrough_small_fifo
     #( .WIDTH(C_M_ACT_TDATA_WIDTH+C_M_ACT_TUSER_WIDTH),
        .MAX_DEPTH_BITS( 4 ))
   output_fifo
     (// Outputs
      .dout          ({fifo_out_tdata[i], fifo_out_tuser[i]}),
      .full          (),
      .nearly_full   (),
 	   .prog_full     (),
      .empty         (empty[i]),
      // Inputs
      .din           ({s_axis_tdata, s_axis_tuser}),
      .wr_en         (s_axis_tuser[i] & s_axis_tvalid),// & s_axis_tready),
      .rd_en         (rd_en[i]),
      .reset         (~axi_resetn),
      .clk           (axi_aclk));

   `endif
end
endgenerate

always @(posedge axi_aclk)
   if (~axi_resetn) begin
      out_arb_counter   <= 0;
   end
   else if (|s_axis_tuser & s_axis_tvalid) begin
      out_arb_counter   <= out_arb_counter + 1;
   end

always @(posedge axi_aclk)
   if (~axi_resetn) begin
      out_arb_rd_counter   <= 0;
   end
   else if (|rd_en) begin
      out_arb_rd_counter   <= out_arb_rd_counter + 1;
   end

assign m_axis_tdata_0	 = fifo_out_tdata[0];
assign m_axis_tuser_0	 = fifo_out_tuser[0];
assign m_axis_tvalid_0	 = ~empty[0];
assign rd_en[0]			 = m_axis_tready_0 & ~empty[0];

assign m_axis_tdata_1	 = fifo_out_tdata[1];
assign m_axis_tuser_1	 = fifo_out_tuser[1];
assign m_axis_tvalid_1	 = ~empty[1];
assign rd_en[1]			 = m_axis_tready_1 & ~empty[1];

assign m_axis_tdata_2	 = fifo_out_tdata[2];
assign m_axis_tuser_2	 = fifo_out_tuser[2];
assign m_axis_tvalid_2	 = ~empty[2];
assign rd_en[2]			 = m_axis_tready_2 & ~empty[2];

assign m_axis_tdata_3	 = fifo_out_tdata[3];
assign m_axis_tuser_3	 = fifo_out_tuser[3];
assign m_axis_tvalid_3	 = ~empty[3];
assign rd_en[3]			 = m_axis_tready_3 & ~empty[3];

assign m_axis_tdata_4	 = fifo_out_tdata[4];
assign m_axis_tuser_4	 = fifo_out_tuser[4];
assign m_axis_tvalid_4	 = ~empty[4];
assign rd_en[4]			 = m_axis_tready_4 & ~empty[4];

endmodule
