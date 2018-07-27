//
// Copyright (c) 2015 University of Cambridge
// Copyright (c) 2017 Yuta Tokusashi
// 
// All rights reserved.
//
// This software was developed by SRI International and the University of
// Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1,
// National Science Foundation under Grant No. CNS-0855268, and Defense
// Advanced Research Projects Agency (DARPA) and Air Force Research Laboratory
// (AFRL), under contract FA8750-11-C-0249.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed to NetFPGA Open Systems C.I.C. (NetFPGA) under one or more
// contributor license agreements. See the NOTICE file distributed with this
// work for additional information regarding copyright ownership. NetFPGA
// licenses this file to you under the NetFPGA Hardware-Software License,
// Version 1.0 (the "License"); you may not use this file except in compliance
// with the License. You may obtain a copy of the License at:
//
// http://www.netfpga-cic.org
//
// Unless required by applicable law or agreed to in writing, Work distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@

`timescale 1ns/1ps

module cam 
#(
   parameter ID                     = 0,
   parameter ID_BITS                = 1,
   parameter MEM_TYPE               = 0,
   parameter CAM_MODE               = 0,
   parameter C_TCAM_ADDR_WIDTH  	= 5, 
   parameter C_TCAM_DATA_WIDTH   	= 32,
   parameter C_TCAM_ADDR_TYPE		= 0,
   parameter C_TCAM_MATCH_ADDR_WIDTH	= 5
)
(
   input					CLK,
   input					WE,
   input          [C_TCAM_ADDR_WIDTH-1:0]	ADDR_WR,
   input          [C_TCAM_DATA_WIDTH-1:0]	DIN,
   output					BUSY,

   input          [C_TCAM_DATA_WIDTH-1:0]	CMP_DIN,
   output					MATCH,
   output         [C_TCAM_MATCH_ADDR_WIDTH-1:0]	MATCH_ADDR
);

localparam  C_TCAM_DATA_DEPTH = 2**C_TCAM_ADDR_WIDTH;

wire [C_TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_cam;	

generate 
	if (ID_BITS != 0) begin
		wire [ID_BITS-1:0] id_num = ID;
		assign MATCH_ADDR = {id_num, match_addr_cam};
	end else begin
		assign MATCH_ADDR = match_addr_cam;
	end
endgenerate

cam_wrapper
#(
   .MEM_TYPE                (  MEM_TYPE             ),
   .CAM_MODE                (  CAM_MODE             ),
   .C_TCAM_ADDR_WIDTH		(  C_TCAM_ADDR_WIDTH    ),
   .C_TCAM_DATA_WIDTH		(  C_TCAM_DATA_WIDTH    ),
   .C_TCAM_ADDR_TYPE		(  C_TCAM_ADDR_TYPE     ),
   .C_TCAM_MATCH_ADDR_WIDTH	(  C_TCAM_MATCH_ADDR_WIDTH   )
)
cam_wrapper
(
   .CLK                 (  CLK                  ),
   .WE                  (  WE                   ), 
   .WR_ADDR             (  ADDR_WR              ),
   .DIN                 (  DIN                  ), 
   .BUSY                (  BUSY                 ),

   .MATCH               (  MATCH                ), 
   .MATCH_ADDR          (  match_addr_cam       ),
   .CMP_DIN             (  CMP_DIN              )
);

endmodule
