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

module nf_sume_crossbar
#(
   //Master AXI Stream Data Width
   parameter   C_M_AXIS_DATA_WIDTH     = 64,
   parameter   C_S_AXIS_DATA_WIDTH     = 64,
   parameter   C_M_AXIS_TUSER_WIDTH    = 128,
   parameter   C_S_AXIS_TUSER_WIDTH    = 128,
   parameter   NUM_QUEUES              = 5
)
(
    //Part 1: System side signals
    //Global Ports
    input axis_aclk,
    input axis_aresetn,

    //Master Stream Ports (interface to data path)
    output [C_M_AXIS_DATA_WIDTH - 1:0] m0_axis_tdata,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m0_axis_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0] m0_axis_tuser,
    output  m0_axis_tvalid,
    input m0_axis_tready,
    output  m0_axis_tlast,

    output [C_M_AXIS_DATA_WIDTH - 1:0] m1_axis_tdata,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m1_axis_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0] m1_axis_tuser,
    output  m1_axis_tvalid,
    input m1_axis_tready,
    output  m1_axis_tlast,

    output [C_M_AXIS_DATA_WIDTH - 1:0] m2_axis_tdata,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m2_axis_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0] m2_axis_tuser,
    output  m2_axis_tvalid,
    input m2_axis_tready,
    output  m2_axis_tlast,

    output [C_M_AXIS_DATA_WIDTH - 1:0] m3_axis_tdata,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m3_axis_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0] m3_axis_tuser,
    output  m3_axis_tvalid,
    input m3_axis_tready,
    output  m3_axis_tlast,

    output [C_M_AXIS_DATA_WIDTH - 1:0] m4_axis_tdata,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m4_axis_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0] m4_axis_tuser,
    output  m4_axis_tvalid,
    input m4_axis_tready,
    output  m4_axis_tlast,

    //Slave Stream Ports (interface to RX queues)
    input [C_S_AXIS_DATA_WIDTH - 1:0] s0_axis_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s0_axis_tkeep,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s0_axis_tuser,
    input  s0_axis_tvalid,
    output s0_axis_tready,
    input  s0_axis_tlast,

    input [C_S_AXIS_DATA_WIDTH - 1:0] s1_axis_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s1_axis_tkeep,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s1_axis_tuser,
    input  s1_axis_tvalid,
    output s1_axis_tready,
    input  s1_axis_tlast,

    input [C_S_AXIS_DATA_WIDTH - 1:0] s2_axis_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s2_axis_tkeep,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s2_axis_tuser,
    input  s2_axis_tvalid,
    output s2_axis_tready,
    input  s2_axis_tlast,

    input [C_S_AXIS_DATA_WIDTH - 1:0] s3_axis_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s3_axis_tkeep,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s3_axis_tuser,
    input  s3_axis_tvalid,
    output s3_axis_tready,
    input  s3_axis_tlast,

    input [C_S_AXIS_DATA_WIDTH - 1:0] s4_axis_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s4_axis_tkeep,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s4_axis_tuser,
    input  s4_axis_tvalid,
    output s4_axis_tready,
    input  s4_axis_tlast
);

localparam  TOT_NUM = NUM_QUEUES*NUM_QUEUES;

// ------------- Regs/ wires -----------
wire  [NUM_QUEUES-1:0]                 out_queues_s_tready;
wire  [C_S_AXIS_DATA_WIDTH-1:0]        out_queues_s_tdata[NUM_QUEUES-1:0];
wire  [(C_S_AXIS_DATA_WIDTH/8)-1:0]    out_queues_s_tstrb[NUM_QUEUES-1:0];
wire  [C_S_AXIS_TUSER_WIDTH-1:0]       out_queues_s_tuser[NUM_QUEUES-1:0];
wire  [NUM_QUEUES-1:0] 	               out_queues_s_tvalid;
wire  [NUM_QUEUES-1:0]                 out_queues_s_tlast;

wire  [TOT_NUM-1:0]                    out_queues_m_tready;
wire  [C_M_AXIS_DATA_WIDTH-1:0]        out_queues_m_tdata[TOT_NUM-1:0];
wire  [(C_M_AXIS_DATA_WIDTH/8)-1:0]    out_queues_m_tstrb[TOT_NUM-1:0];
wire  [C_M_AXIS_TUSER_WIDTH-1:0]       out_queues_m_tuser[TOT_NUM-1:0];
wire  [TOT_NUM-1:0] 	                  out_queues_m_tvalid;
wire  [TOT_NUM-1:0]                    out_queues_m_tlast;

wire  [NUM_QUEUES-1:0]                 in_queues_m_tready;
wire  [C_M_AXIS_DATA_WIDTH-1:0]        in_queues_m_tdata[NUM_QUEUES-1:0];
wire  [(C_M_AXIS_DATA_WIDTH/8)-1:0]    in_queues_m_tstrb[NUM_QUEUES-1:0];
wire  [C_M_AXIS_TUSER_WIDTH-1:0]       in_queues_m_tuser[NUM_QUEUES-1:0];
wire  [NUM_QUEUES-1:0] 	               in_queues_m_tvalid;
wire  [NUM_QUEUES-1:0]                 in_queues_m_tlast;

generate
   genvar i;
   for(i=0; i<NUM_QUEUES; i=i+1) begin: output_queues
      output_queues
      #(
         .C_M_AXIS_DATA_WIDTH    (  C_M_AXIS_DATA_WIDTH                    ),
         .C_S_AXIS_DATA_WIDTH    (  C_S_AXIS_DATA_WIDTH                    ),
         .C_M_AXIS_TUSER_WIDTH   (  C_M_AXIS_TUSER_WIDTH                   ),
         .C_S_AXIS_TUSER_WIDTH   (  C_S_AXIS_TUSER_WIDTH                   ),
         .NUM_QUEUES             (  NUM_QUEUES                             )
      )
      output_queues
      (
         .axi_aclk               (  axis_aclk                              ),
         .axi_resetn             (  axis_aresetn                           ),
                                                                            
         .s_axis_tdata           (  out_queues_s_tdata[i]                  ),
         .s_axis_tstrb           (  out_queues_s_tstrb[i]                  ),
         .s_axis_tuser           (  out_queues_s_tuser[i]                  ),
         .s_axis_tvalid          (  out_queues_s_tvalid[i]                 ),
         .s_axis_tready          (  out_queues_s_tready[i]                 ),
         .s_axis_tlast           (  out_queues_s_tlast[i]                  ),

         .m_axis_tdata_0         (  out_queues_m_tdata[(NUM_QUEUES*i)]     ),
         .m_axis_tstrb_0         (  out_queues_m_tstrb[(NUM_QUEUES*i)]     ),
         .m_axis_tuser_0         (  out_queues_m_tuser[(NUM_QUEUES*i)]     ),
         .m_axis_tvalid_0        (  out_queues_m_tvalid[(NUM_QUEUES*i)]    ),
         .m_axis_tready_0        (  out_queues_m_tready[(NUM_QUEUES*i)]    ),
         .m_axis_tlast_0         (  out_queues_m_tlast[(NUM_QUEUES*i)]     ),

         .m_axis_tdata_1         (  out_queues_m_tdata[(NUM_QUEUES*i)+1]   ),
         .m_axis_tstrb_1         (  out_queues_m_tstrb[(NUM_QUEUES*i)+1]   ),
         .m_axis_tuser_1         (  out_queues_m_tuser[(NUM_QUEUES*i)+1]   ),
         .m_axis_tvalid_1        (  out_queues_m_tvalid[(NUM_QUEUES*i)+1]  ),
         .m_axis_tready_1        (  out_queues_m_tready[(NUM_QUEUES*i)+1]  ),
         .m_axis_tlast_1         (  out_queues_m_tlast[(NUM_QUEUES*i)+1]   ),

         .m_axis_tdata_2         (  out_queues_m_tdata[(NUM_QUEUES*i)+2]   ),
         .m_axis_tstrb_2         (  out_queues_m_tstrb[(NUM_QUEUES*i)+2]   ),
         .m_axis_tuser_2         (  out_queues_m_tuser[(NUM_QUEUES*i)+2]   ),
         .m_axis_tvalid_2        (  out_queues_m_tvalid[(NUM_QUEUES*i)+2]  ),
         .m_axis_tready_2        (  out_queues_m_tready[(NUM_QUEUES*i)+2]  ),
         .m_axis_tlast_2         (  out_queues_m_tlast[(NUM_QUEUES*i)+2]   ),

         .m_axis_tdata_3         (  out_queues_m_tdata[(NUM_QUEUES*i)+3]   ),
         .m_axis_tstrb_3         (  out_queues_m_tstrb[(NUM_QUEUES*i)+3]   ),
         .m_axis_tuser_3         (  out_queues_m_tuser[(NUM_QUEUES*i)+3]   ),
         .m_axis_tvalid_3        (  out_queues_m_tvalid[(NUM_QUEUES*i)+3]  ),
         .m_axis_tready_3        (  out_queues_m_tready[(NUM_QUEUES*i)+3]  ),
         .m_axis_tlast_3         (  out_queues_m_tlast[(NUM_QUEUES*i)+3]   ),

         .m_axis_tdata_4         (  out_queues_m_tdata[(NUM_QUEUES*i)+4]   ),
         .m_axis_tstrb_4         (  out_queues_m_tstrb[(NUM_QUEUES*i)+4]   ),
         .m_axis_tuser_4         (  out_queues_m_tuser[(NUM_QUEUES*i)+4]   ),
         .m_axis_tvalid_4        (  out_queues_m_tvalid[(NUM_QUEUES*i)+4]  ),
         .m_axis_tready_4        (  out_queues_m_tready[(NUM_QUEUES*i)+4]  ),
         .m_axis_tlast_4         (  out_queues_m_tlast[(NUM_QUEUES*i)+4]   )
      );

      input_queues
      #(
         .C_M_AXIS_DATA_WIDTH    (  C_M_AXIS_DATA_WIDTH                    ),
         .C_S_AXIS_DATA_WIDTH    (  C_S_AXIS_DATA_WIDTH                    ),
         .C_M_AXIS_TUSER_WIDTH   (  C_M_AXIS_TUSER_WIDTH                   ),
         .C_S_AXIS_TUSER_WIDTH   (  C_S_AXIS_TUSER_WIDTH                   ),
         .NUM_QUEUES             (  NUM_QUEUES                             )
      )
      input_queues
      (
         .axi_aclk               (  axis_aclk                              ),
         .axi_resetn             (  axis_aresetn                           ),
                                                                            
         .m_axis_tdata           (  in_queues_m_tdata[i]                   ),
         .m_axis_tstrb           (  in_queues_m_tstrb[i]                   ),
         .m_axis_tuser           (  in_queues_m_tuser[i]                   ),
         .m_axis_tvalid          (  in_queues_m_tvalid[i]                  ),
         .m_axis_tready          (  in_queues_m_tready[i]                  ),
         .m_axis_tlast           (  in_queues_m_tlast[i]                   ),

         .s_axis_tdata_0         (  out_queues_m_tdata[i]                  ),
         .s_axis_tstrb_0         (  out_queues_m_tstrb[i]                  ),
         .s_axis_tuser_0         (  out_queues_m_tuser[i]                  ),
         .s_axis_tvalid_0        (  out_queues_m_tvalid[i]                 ),
         .s_axis_tready_0        (  out_queues_m_tready[i]                 ),
         .s_axis_tlast_0         (  out_queues_m_tlast[i]                  ),

         .s_axis_tdata_1         (  out_queues_m_tdata[i+(NUM_QUEUES*1)]   ),
         .s_axis_tstrb_1         (  out_queues_m_tstrb[i+(NUM_QUEUES*1)]   ),
         .s_axis_tuser_1         (  out_queues_m_tuser[i+(NUM_QUEUES*1)]   ),
         .s_axis_tvalid_1        (  out_queues_m_tvalid[i+(NUM_QUEUES*1)]  ),
         .s_axis_tready_1        (  out_queues_m_tready[i+(NUM_QUEUES*1)]  ),
         .s_axis_tlast_1         (  out_queues_m_tlast[i+(NUM_QUEUES*1)]   ),

         .s_axis_tdata_2         (  out_queues_m_tdata[i+(NUM_QUEUES*2)]   ),
         .s_axis_tstrb_2         (  out_queues_m_tstrb[i+(NUM_QUEUES*2)]   ),
         .s_axis_tuser_2         (  out_queues_m_tuser[i+(NUM_QUEUES*2)]   ),
         .s_axis_tvalid_2        (  out_queues_m_tvalid[i+(NUM_QUEUES*2)]  ),
         .s_axis_tready_2        (  out_queues_m_tready[i+(NUM_QUEUES*2)]  ),
         .s_axis_tlast_2         (  out_queues_m_tlast[i+(NUM_QUEUES*2)]   ),

         .s_axis_tdata_3         (  out_queues_m_tdata[i+(NUM_QUEUES*3)]   ),
         .s_axis_tstrb_3         (  out_queues_m_tstrb[i+(NUM_QUEUES*3)]   ),
         .s_axis_tuser_3         (  out_queues_m_tuser[i+(NUM_QUEUES*3)]   ),
         .s_axis_tvalid_3        (  out_queues_m_tvalid[i+(NUM_QUEUES*3)]  ),
         .s_axis_tready_3        (  out_queues_m_tready[i+(NUM_QUEUES*3)]  ),
         .s_axis_tlast_3         (  out_queues_m_tlast[i+(NUM_QUEUES*3)]   ),

         .s_axis_tdata_4         (  out_queues_m_tdata[i+(NUM_QUEUES*4)]   ),
         .s_axis_tstrb_4         (  out_queues_m_tstrb[i+(NUM_QUEUES*4)]   ),
         .s_axis_tuser_4         (  out_queues_m_tuser[i+(NUM_QUEUES*4)]   ),
         .s_axis_tvalid_4        (  out_queues_m_tvalid[i+(NUM_QUEUES*4)]  ),
         .s_axis_tready_4        (  out_queues_m_tready[i+(NUM_QUEUES*4)]  ),
         .s_axis_tlast_4         (  out_queues_m_tlast[i+(NUM_QUEUES*4)]   )
      );
   end
endgenerate

assign out_queues_s_tdata[0]     = s0_axis_tdata;
assign out_queues_s_tstrb[0]     = s0_axis_tkeep;
assign out_queues_s_tuser[0]     = s0_axis_tuser;
assign out_queues_s_tvalid[0]    = s0_axis_tvalid;
assign out_queues_s_tlast[0]     = s0_axis_tlast;
assign s0_axis_tready            = out_queues_s_tready[0];

assign out_queues_s_tdata[1]     = s1_axis_tdata;
assign out_queues_s_tstrb[1]     = s1_axis_tkeep;
assign out_queues_s_tuser[1]     = s1_axis_tuser;
assign out_queues_s_tvalid[1]    = s1_axis_tvalid;
assign out_queues_s_tlast[1]     = s1_axis_tlast;
assign s1_axis_tready            = out_queues_s_tready[1];

assign out_queues_s_tdata[2]     = s2_axis_tdata;
assign out_queues_s_tstrb[2]     = s2_axis_tkeep;
assign out_queues_s_tuser[2]     = s2_axis_tuser;
assign out_queues_s_tvalid[2]    = s2_axis_tvalid;
assign out_queues_s_tlast[2]     = s2_axis_tlast;
assign s2_axis_tready            = out_queues_s_tready[2];

assign out_queues_s_tdata[3]     = s3_axis_tdata;
assign out_queues_s_tstrb[3]     = s3_axis_tkeep;
assign out_queues_s_tuser[3]     = s3_axis_tuser;
assign out_queues_s_tvalid[3]    = s3_axis_tvalid;
assign out_queues_s_tlast[3]     = s3_axis_tlast;
assign s3_axis_tready            = out_queues_s_tready[3];

assign out_queues_s_tdata[4]     = s4_axis_tdata;
assign out_queues_s_tstrb[4]     = s4_axis_tkeep;
assign out_queues_s_tuser[4]     = s4_axis_tuser;
assign out_queues_s_tvalid[4]    = s4_axis_tvalid;
assign out_queues_s_tlast[4]     = s4_axis_tlast;
assign s4_axis_tready            = out_queues_s_tready[4];


assign m0_axis_tdata          = in_queues_m_tdata[0];
assign m0_axis_tkeep          = in_queues_m_tstrb[0];
assign m0_axis_tuser          = in_queues_m_tuser[0];
assign m0_axis_tvalid         = in_queues_m_tvalid[0];
assign m0_axis_tlast          = in_queues_m_tlast[0];
assign in_queues_m_tready[0]  = m0_axis_tready;

assign m1_axis_tdata          = in_queues_m_tdata[1];
assign m1_axis_tkeep          = in_queues_m_tstrb[1];
assign m1_axis_tuser          = in_queues_m_tuser[1];
assign m1_axis_tvalid         = in_queues_m_tvalid[1];
assign m1_axis_tlast          = in_queues_m_tlast[1];
assign in_queues_m_tready[1]  = m1_axis_tready;

assign m2_axis_tdata          = in_queues_m_tdata[2];
assign m2_axis_tkeep          = in_queues_m_tstrb[2];
assign m2_axis_tuser          = in_queues_m_tuser[2];
assign m2_axis_tvalid         = in_queues_m_tvalid[2];
assign m2_axis_tlast          = in_queues_m_tlast[2];
assign in_queues_m_tready[2]  = m2_axis_tready;

assign m3_axis_tdata          = in_queues_m_tdata[3];
assign m3_axis_tkeep          = in_queues_m_tstrb[3];
assign m3_axis_tuser          = in_queues_m_tuser[3];
assign m3_axis_tvalid         = in_queues_m_tvalid[3];
assign m3_axis_tlast          = in_queues_m_tlast[3];
assign in_queues_m_tready[3]  = m3_axis_tready;

assign m4_axis_tdata          = in_queues_m_tdata[4];
assign m4_axis_tkeep          = in_queues_m_tstrb[4];
assign m4_axis_tuser          = in_queues_m_tuser[4];
assign m4_axis_tvalid         = in_queues_m_tvalid[4];
assign m4_axis_tlast          = in_queues_m_tlast[4];
assign in_queues_m_tready[4]  = m4_axis_tready;

endmodule
