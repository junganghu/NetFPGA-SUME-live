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

module tcam_rtl
#(
   parameter   ADDR_WIDTH   =  4,
   parameter   DATA_WIDTH   =  32
)
(
   input                               CLK,

   input                               WR,
   input          [ADDR_WIDTH-1:0]     ADDR_WR,
   input          [DATA_WIDTH-1:0]     DIN,
   input          [DATA_WIDTH-1:0]     DIN_MASK,

`ifdef EN_TCAM_RD
   input                               RD,
   input          [ADDR_WIDTH-1:0]     ADDR_RD,
   output         [DATA_WIDTH-1:0]     DOUT,
`endif

   input          [DATA_WIDTH-1:0]     CAM_IN,
   output   reg                        MATCH,
   output   reg   [ADDR_WIDTH-1:0]     MATCH_ADDR
);

(* RAM_STYLE = "DISTRIBUTED" *)
reg   [DATA_WIDTH-1:0]  mem[0:(2**ADDR_WIDTH)-1];
reg   [DATA_WIDTH-1:0]  mask[0:(2**ADDR_WIDTH)-1];

`ifdef EN_TCAM_RD
reg   [DATA_WIDTH-1:0]  rd_data;
`endif

always @(posedge CLK)
   if (WR)  begin
      mem[ADDR_WR]   <= DIN;
      mask[ADDR_WR]  <= DIN_MASK;
   end
`ifdef EN_TCAM_RD
   else if (RD)  rd_data   <= mem[ADDR_RD]; 

assign   DOUT  =  rd_data;
`endif

reg   [ADDR_WIDTH-1:0]  rMatchAddr;
reg   rMatch;

integer i;

always @(CAM_IN) begin
   rMatch = 0;
   rMatchAddr = 0;
   for (i=0; i<(2**ADDR_WIDTH); i=i+1) begin
      if (|((CAM_IN & mask[i]) ^ (mem[i] & mask[i])) == 0) begin rMatch = 1;   rMatchAddr = i; end
   end
end

always @(posedge CLK) MATCH_ADDR <= rMatchAddr;

always @(posedge CLK) MATCH <= rMatch; 

endmodule
