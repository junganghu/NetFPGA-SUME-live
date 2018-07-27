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

module fifo_depth_monitor
#(
   parameter   C_S_AXI_DATA_WIDTH      = 32
)
(
   input                                        axi_aclk,
   input                                        axi_resetn,

   input                                        fifo_wren,
   input                                        fifo_rden,

   input                                        clear,

   output   reg   [C_S_AXI_DATA_WIDTH-1:0]      fifo_depth,
   output   reg   [C_S_AXI_DATA_WIDTH-1:0]      fifo_depth_max
);

reg   r_fifo_wren, r_fifo_rden;
always @(posedge axi_aclk)
   if (~axi_resetn) begin
      r_fifo_wren    <= 0;
      r_fifo_rden    <= 0;
   end
   else begin
      r_fifo_wren    <= fifo_wren;
      r_fifo_rden    <= fifo_rden;
   end

reg   r_rden, r_wren;
always @(posedge axi_aclk)
   if (~axi_resetn) begin
      r_rden   <= 0;
      r_wren   <= 0;
   end
   else begin
      r_rden   <= (r_fifo_wren &  ~r_fifo_rden);
      r_wren   <= (r_fifo_rden &  ~r_fifo_wren);
   end
   
always @(posedge axi_aclk)
   if (~axi_resetn)
      fifo_depth  <= 0;
   else if (clear)
      fifo_depth  <= 0;
   else if (r_rden)
      fifo_depth  <= fifo_depth + 1;
   else if (r_wren)
      fifo_depth  <= fifo_depth - 1;

always @(posedge axi_aclk)
   if (~axi_resetn)
      fifo_depth_max <= 0;
   else if (clear)
      fifo_depth_max <= 0;
   else if (fifo_depth > fifo_depth_max)
      fifo_depth_max <= fifo_depth;

endmodule
