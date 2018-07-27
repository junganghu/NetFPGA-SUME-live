//
// Copyright (c) 2015-2016 Jong Hun Han
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

module tcam 
#(
   parameter C_TCAM_ADDR_WIDTH   = 5, 
   parameter C_TCAM_DATA_WIDTH   = 32 
)
(
   input                                     CLK,
   input                                     WE,
   input          [C_TCAM_ADDR_WIDTH-1:0]    ADDR_WR,
   input          [C_TCAM_DATA_WIDTH-1:0]    DIN,
   input          [C_TCAM_DATA_WIDTH-1:0]    DATA_MASK,
   output                                    BUSY,

   input          [C_TCAM_DATA_WIDTH-1:0]    CMP_DIN,
   input          [C_TCAM_DATA_WIDTH-1:0]    CMP_DATA_MASK,
   output                                    MATCH,
   output         [C_TCAM_ADDR_WIDTH-1:0]    MATCH_ADDR
);


tcam_wrapper
#(
   .C_TCAM_ADDR_WIDTH   (  C_TCAM_ADDR_WIDTH    ),
   .C_TCAM_DATA_WIDTH   (  C_TCAM_DATA_WIDTH    )
)
tcam_wrapper
(
   .CLK                 (  CLK                  ),
   .WE                  (  WE                   ), 
   .WR_ADDR             (  ADDR_WR              ),
   .DIN                 (  DIN                  ), 
   .DATA_MASK           (  DATA_MASK            ),
   .BUSY                (  BUSY                 ),

   .MATCH               (  MATCH                ), 
   .MATCH_ADDR          (  MATCH_ADDR           ),
   .CMP_DIN             (  CMP_DIN              ),
   .CMP_DATA_MASK       (  CMP_DATA_MASK        )
);

endmodule
