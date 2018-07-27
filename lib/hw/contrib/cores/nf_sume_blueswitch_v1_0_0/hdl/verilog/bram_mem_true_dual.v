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

module bram_mem_true_dual
#(
   parameter   ADDR_WIDTH   =  32,
   parameter   DATA_WIDTH   =  32
)
(
   input                         CLK_0,
   input                         WR_0,
   input    [ADDR_WIDTH-1:0]     ADDR_WR_0,
   input    [DATA_WIDTH-1:0]     DIN_0,
   input                         RD_0,
   input    [ADDR_WIDTH-1:0]     ADDR_RD_0,
   output   [DATA_WIDTH-1:0]     DOUT_0,

   input                         CLK_1,
   input                         WR_1,
   input    [ADDR_WIDTH-1:0]     ADDR_WR_1,
   input    [DATA_WIDTH-1:0]     DIN_1,
   input                         RD_1,
   input    [ADDR_WIDTH-1:0]     ADDR_RD_1,
   output   [DATA_WIDTH-1:0]     DOUT_1
);

`ifdef XIL_BRAM

wire  [ADDR_WIDTH-1:0]  addra = (WR_0) ? ADDR_WR_0 : ADDR_RD_0;
wire  [ADDR_WIDTH-1:0]  addrb = (WR_1) ? ADDR_WR_1 : ADDR_RD_1;

generate
   if (ADDR_WIDTH == 4) begin
      if (DATA_WIDTH == 16) begin : true_dual16x16
         true_dual16x16 true_dual16x16 (
            .clka    (  CLK_0          ),
            .ena     (  RD_0  |  WR_0  ),
            .wea     (  WR_0           ),
            .addra   (  addra          ),
            .dina    (  DIN_0          ),
            .douta   (  DOUT_0         ),
            .clkb    (  CLK_1          ),
            .enb     (  RD_1  |  WR_1  ),
            .web     (  WR_1           ),
            .addrb   (  addrb          ),
            .dinb    (  DIN_1          ),
            .doutb   (  DOUT_1         )
         );
      end
      else if (DATA_WIDTH == 32) begin : true_dual16x32
         true_dual16x32 true_dual16x32 (
            .clka    (  CLK_0          ),
            .ena     (  RD_0  |  WR_0  ),
            .wea     (  WR_0           ),
            .addra   (  addra          ),
            .dina    (  DIN_0          ),
            .douta   (  DOUT_0         ),
            .clkb    (  CLK_1          ),
            .enb     (  RD_1  |  WR_1  ),
            .web     (  WR_1           ),
            .addrb   (  addrb          ),
            .dinb    (  DIN_1          ),
            .doutb   (  DOUT_1         )
         );
      end
      else if (DATA_WIDTH == 48) begin : true_dual16x48
         true_dual16x48 true_dual16x48 (
            .clka    (  CLK_0          ),
            .ena     (  RD_0  |  WR_0  ),
            .wea     (  WR_0           ),
            .addra   (  addra          ),
            .dina    (  DIN_0          ),
            .douta   (  DOUT_0         ),
            .clkb    (  CLK_1          ),
            .enb     (  RD_1  |  WR_1  ),
            .web     (  WR_1           ),
            .addrb   (  addrb          ),
            .dinb    (  RD_1           ),
            .doutb   (  DOUT_1         )
         );
      end
   end
   else if (ADDR_WIDTH == 5) begin
      if (DATA_WIDTH == 16) begin : true_dual32x16
         true_dual32x16 true_dual32x16 (
            .clka    (  CLK_0          ),
            .ena     (  RD_0  |  WR_0  ),
            .wea     (  WR_0           ),
            .addra   (  addra          ),
            .dina    (  DIN_0          ),
            .douta   (  DOUT_0         ),
            .clkb    (  CLK_1          ),
            .enb     (  RD_1  |  WR_1  ),
            .web     (  WR_1           ),
            .addrb   (  addrb          ),
            .dinb    (  DIN_1          ),
            .doutb   (  DOUT_1         )
         );
      end
      else if (DATA_WIDTH == 32) begin : true_dual32x32
         true_dual32x32 true_dual32x32 (
            .clka    (  CLK_0          ),
            .ena     (  RD_0  |  WR_0  ),
            .wea     (  WR_0           ),
            .addra   (  addra          ),
            .dina    (  DIN_0          ),
            .douta   (  DOUT_0         ),
            .clkb    (  CLK_1          ),
            .enb     (  RD_1  |  WR_1  ),
            .web     (  WR_1           ),
            .addrb   (  addrb          ),
            .dinb    (  DIN_1          ),
            .doutb   (  DOUT_1         )
         );
      end
      else if (DATA_WIDTH == 48) begin : true_dual32x48
         true_dual32x48 true_dual32x48 (
            .clka    (  CLK_0    ),
            .ena     (  RD_0  |  WR_0  ),
            .wea     (  WR_0           ),
            .addra   (  addra          ),
            .dina    (  DIN_0          ),
            .douta   (  DOUT_0         ),
            .clkb    (  CLK_1          ),
            .enb     (  RD_1  |  WR_1  ),
            .web     (  WR_1           ),
            .addrb   (  addrb          ),
            .dinb    (  DIN_1          ),
            .doutb   (  DOUT_1         )
         );
      end
   end
endgenerate

`else

(* RAM_STYLE = "BLOCK" *)
reg   [DATA_WIDTH-1:0]  mem[(2**ADDR_WIDTH)-1:0];
reg   [ADDR_WIDTH-1:0]  rd_addr_0, rd_addr_1;

always @(posedge CLK_0) begin
   if (WR_0)  mem[ADDR_WR_0]   <= DIN_0;
end

always @(posedge CLK_1) begin
   if (WR_1)  mem[ADDR_WR_1]   <= DIN_1;
end

always @(posedge CLK_0) begin
   if (RD_0)  rd_addr_0 <= ADDR_RD_0;
end

always @(posedge CLK_1) begin
   if (RD_1)  rd_addr_1 <= ADDR_RD_1;
end

assign   DOUT_0  =  mem[rd_addr_0];
assign   DOUT_1  =  mem[rd_addr_1];

`endif

endmodule
