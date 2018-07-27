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

module bram_mem
#(
   parameter   ADDR_WIDTH   =  32,
   parameter   DATA_WIDTH   =  32
)
(
   input                         CLK,
   input                         WR,
   input    [ADDR_WIDTH-1:0]     ADDR_WR,
   input    [DATA_WIDTH-1:0]     DIN,
   input                         RD,
   input    [ADDR_WIDTH-1:0]     ADDR_RD,
   output   [DATA_WIDTH-1:0]     DOUT
);

(* RAM_STYLE = "BLOCK" *)
reg   [DATA_WIDTH-1:0]  mem[(2**ADDR_WIDTH)-1:0];
reg   [DATA_WIDTH-1:0]  rd_data;

always @(posedge CLK) begin
   if (WR)  mem[ADDR_WR]   <= DIN;
end

always @(posedge CLK) begin
   if (RD & WR & (ADDR_WR == ADDR_RD))  rd_data <= DIN;
   else if (RD) rd_data <= mem[ADDR_RD];
end
      
assign   DOUT  =  rd_data;

endmodule
