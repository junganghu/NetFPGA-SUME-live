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

module tcam_module
#(
   parameter   TCAM_ADDR_WIDTH         = 4,
   parameter   TCAM_DATA_WIDTH         = 32
)
(
   input                                     CLK,
   input                                     RSTN,

   input                                     WR,
   input          [TCAM_ADDR_WIDTH-1:0]      ADDR_WR,
   input          [TCAM_DATA_WIDTH-1:0]      DIN,
   input          [TCAM_DATA_WIDTH-1:0]      DIN_MASK,
   output   reg                              BUSY,

`ifdef EN_TCAM_RD
   input                                     RD,
   input          [TCAM_ADDR_WIDTH-1:0]      ADDR_RD,
   output   reg   [TCAM_DATA_WIDTH-1:0]      DOUT,
`endif

   input          [TCAM_DATA_WIDTH-1:0]      CAM_DIN,
   input          [TCAM_DATA_WIDTH-1:0]      CAM_DATA_MASK,
   output   reg                              MATCH,
   output   reg   [TCAM_ADDR_WIDTH-1:0]      MATCH_ADDR
);

reg   [TCAM_ADDR_WIDTH-1:0]   rADDR_WR, rADDR_RD;
reg   [TCAM_DATA_WIDTH-1:0]   rDIN, rDIN_MASK, rCAM_DIN, rCAM_DATA_MASK;
reg   rWR, rRD;

always @(posedge CLK)
   if (~RSTN) begin
      rWR               <= 0;
      rRD               <= 0;
      rADDR_WR          <= 0;
      rADDR_RD          <= 0;
      rDIN              <= 0;
      rDIN_MASK         <= 0;
      rCAM_DIN          <= 0;
      rCAM_DATA_MASK    <= 0;
   end
   else begin
      rWR               <= WR;
      `ifdef EN_TCAM_RD
      rRD               <= RD;
      rADDR_RD          <= ADDR_RD;
      `endif
      rADDR_WR          <= ADDR_WR;
      rDIN              <= DIN;
      rDIN_MASK         <= DIN_MASK;
      rCAM_DIN          <= CAM_DIN;
      rCAM_DATA_MASK    <= CAM_DATA_MASK;
   end


`ifdef XIL_TCAM_USE

wire  [TCAM_ADDR_WIDTH-1:0]   wMATCH_ADDR;
wire  wMATCH, wBUSY;

always @(posedge CLK)
   if (~RSTN) begin
      BUSY        <= 0;
      MATCH       <= 0;
      MATCH_ADDR  <= 0;
   end
   else begin
      BUSY        <= wBUSY;
      MATCH       <= wMATCH;
      MATCH_ADDR  <= wMATCH_ADDR;
   end

tcam
#(
   .C_TCAM_ADDR_WIDTH   (  TCAM_ADDR_WIDTH   ),
   .C_TCAM_DATA_WIDTH   (  TCAM_DATA_WIDTH   )
)
xil_tcam
(
   .CLK                 (  CLK               ), 
   .WE                  (  rWR               ), 
   .ADDR_WR             (  rADDR_WR          ),
   .DIN                 (  rDIN              ), 
   .DATA_MASK           (  rDIN_MASK         ), 
   .BUSY                (  wBUSY             ), 

   .CMP_DIN             (  rCAM_DIN          ),
   .CMP_DATA_MASK       (  rCAM_DATA_MASK    ),
   .MATCH               (  wMATCH            ), 
   .MATCH_ADDR          (  wMATCH_ADDR       )
);

//generate
//   if (TCAM_ADDR_WIDTH == 4) begin
//      if (TCAM_DATA_WIDTH == 16) begin : tcam_16x16
//         tcam16x16 tcam16x16 (
//            .CLK           (  CLK               ), 
//            .WE            (  rWR               ), 
//            .BUSY          (  wBUSY             ), 
//            .MATCH         (  wMATCH            ), 
//            .DIN           (  rDIN              ), 
//            .DATA_MASK     (  rDIN_MASK         ), 
//            .WR_ADDR       (  rADDR_WR          ),
//            .CMP_DIN       (  rCAM_DIN          ),
//            .CMP_DATA_MASK (  rCAM_DATA_MASK    ),
//            .MATCH_ADDR    (  wMATCH_ADDR       )
//         );
//      end
//      else if (TCAM_DATA_WIDTH == 32) begin : tcam_16x32
//         tcam16x32 tcam16x32 (
//            .CLK           (  CLK               ), 
//            .WE            (  rWR               ), 
//            .BUSY          (  wBUSY             ), 
//            .MATCH         (  wMATCH            ), 
//            .DIN           (  rDIN              ), 
//            .DATA_MASK     (  rDIN_MASK         ), 
//            .WR_ADDR       (  rADDR_WR          ),
//            .CMP_DIN       (  rCAM_DIN          ),
//            .CMP_DATA_MASK (  rCAM_DATA_MASK    ),
//            .MATCH_ADDR    (  wMATCH_ADDR       )
//         );
//      end
//      else if (TCAM_DATA_WIDTH == 48) begin : tcam_16x48
//         tcam16x48 tcam16x48 (
//            .CLK           (  CLK               ), 
//            .WE            (  rWR               ), 
//            .BUSY          (  wBUSY             ), 
//            .MATCH         (  wMATCH            ), 
//            .DIN           (  rDIN              ), 
//            .DATA_MASK     (  rDIN_MASK         ), 
//            .WR_ADDR       (  rADDR_WR          ),
//            .CMP_DIN       (  rCAM_DIN          ),
//            .CMP_DATA_MASK (  rCAM_DATA_MASK    ),
//            .MATCH_ADDR    (  wMATCH_ADDR       )
//         );
//      end
//   end
//   else if (TCAM_ADDR_WIDTH == 5) begin
//      if (TCAM_DATA_WIDTH == 16) begin : tcam_32x16
//         tcam32x16 tcam32x16 (
//            .CLK           (  CLK               ), 
//            .WE            (  rWR               ), 
//            .BUSY          (  wBUSY             ), 
//            .MATCH         (  wMATCH            ), 
//            .DIN           (  rDIN              ), 
//            .DATA_MASK     (  rDIN_MASK         ), 
//            .WR_ADDR       (  rADDR_WR          ),
//            .CMP_DIN       (  rCAM_DIN          ),
//            .CMP_DATA_MASK (  rCAM_DATA_MASK    ),
//            .MATCH_ADDR    (  wMATCH_ADDR       )
//         );
//      end
//      else if (TCAM_DATA_WIDTH == 32) begin : tcam_32x32
//         tcam32x32 tcam32x32 (
//            .CLK           (  CLK               ), 
//            .WE            (  rWR               ), 
//            .BUSY          (  wBUSY             ), 
//            .MATCH         (  wMATCH            ), 
//            .DIN           (  rDIN              ), 
//            .DATA_MASK     (  rDIN_MASK         ), 
//            .WR_ADDR       (  rADDR_WR          ),
//            .CMP_DIN       (  rCAM_DIN          ),
//            .CMP_DATA_MASK (  rCAM_DATA_MASK    ),
//            .MATCH_ADDR    (  wMATCH_ADDR       )
//         );
//      end
//      else if (TCAM_DATA_WIDTH == 48) begin : tcam_32x48
//         tcam32x48 tcam32x48 (
//            .CLK           (  CLK               ), 
//            .WE            (  rWR               ), 
//            .BUSY          (  wBUSY             ), 
//            .MATCH         (  wMATCH            ), 
//            .DIN           (  rDIN              ), 
//            .DATA_MASK     (  rDIN_MASK         ), 
//            .WR_ADDR       (  rADDR_WR          ),
//            .CMP_DIN       (  rCAM_DIN          ),
//            .CMP_DATA_MASK (  rCAM_DATA_MASK    ),
//            .MATCH_ADDR    (  wMATCH_ADDR       )
//         );
//      end
//   end
//   else if (TCAM_ADDR_WIDTH == 6) begin
//      if (TCAM_DATA_WIDTH == 16) begin : tcam_64x16
//         tcam64x16 tcam64x16 (
//            .CLK           (  CLK               ), 
//            .WE            (  rWR               ), 
//            .BUSY          (  wBUSY             ), 
//            .MATCH         (  wMATCH            ), 
//            .DIN           (  rDIN              ), 
//            .DATA_MASK     (  rDIN_MASK         ), 
//            .WR_ADDR       (  rADDR_WR          ),
//            .CMP_DIN       (  rCAM_DIN          ),
//            .CMP_DATA_MASK (  rCAM_DATA_MASK    ),
//            .MATCH_ADDR    (  wMATCH_ADDR       )
//         );
//      end
//      else if (TCAM_DATA_WIDTH == 32) begin : tcam_64x32
//         tcam64x32 tcam64x32 (
//            .CLK           (  CLK               ), 
//            .WE            (  rWR               ), 
//            .BUSY          (  wBUSY             ), 
//            .MATCH         (  wMATCH            ), 
//            .DIN           (  rDIN              ), 
//            .DATA_MASK     (  rDIN_MASK         ), 
//            .WR_ADDR       (  rADDR_WR          ),
//            .CMP_DIN       (  rCAM_DIN          ),
//            .CMP_DATA_MASK (  rCAM_DATA_MASK    ),
//            .MATCH_ADDR    (  wMATCH_ADDR       )
//         );
//      end
//      else if (TCAM_DATA_WIDTH == 48) begin : tcam_64x48
//         tcam64x48 tcam64x48 (
//            .CLK           (  CLK               ), 
//            .WE            (  rWR               ), 
//            .BUSY          (  wBUSY             ), 
//            .MATCH         (  wMATCH            ), 
//            .DIN           (  rDIN              ), 
//            .DATA_MASK     (  rDIN_MASK         ), 
//            .WR_ADDR       (  rADDR_WR          ),
//            .CMP_DIN       (  rCAM_DIN          ),
//            .CMP_DATA_MASK (  rCAM_DATA_MASK    ),
//            .MATCH_ADDR    (  wMATCH_ADDR       )
//         );
//      end
//   end
//endgenerate

`else

wire  [TCAM_ADDR_WIDTH-1:0]   wMATCH_ADDR;
wire  wMATCH;

always @(posedge CLK)
   if (~RSTN) begin
      BUSY        <= 0;
      MATCH       <= 0;
      MATCH_ADDR  <= 0;
   end
   else begin
      BUSY        <= WR;
      MATCH       <= wMATCH;
      MATCH_ADDR  <= wMATCH_ADDR;
   end


tcam_rtl
#(
   .ADDR_WIDTH    (  TCAM_ADDR_WIDTH         ),
   .DATA_WIDTH    (  TCAM_DATA_WIDTH         )
)
reg_dst_ip_table
(
   .CLK           (  CLK                     ),
   .WR            (  rWR                     ),
   .ADDR_WR       (  rADDR_WR                ),
   .DIN           (  rDIN                    ),
   .DIN_MASK      (  {TCAM_DATA_WIDTH{1'b1}} ),

`ifdef EN_TCAM_RD
   .RD            (  0                       ),
   .ADDR_RD       (  0                       ),
   .DOUT          (                          ),
`endif

   .CAM_IN        (  rCAM_DIN                ),
   .MATCH         (  wMATCH                  ),
   .MATCH_ADDR    (  wMATCH_ADDR             )
);

`endif


endmodule
