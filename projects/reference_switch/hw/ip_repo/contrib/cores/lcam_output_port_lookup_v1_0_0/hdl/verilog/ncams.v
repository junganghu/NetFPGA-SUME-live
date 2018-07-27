//
// Copyright (c) 2017 University of Cambridge
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


module ncams #(
	parameter MEM_TYPE         = 1,
	parameter CAM_MODE         = 0,
	parameter ID_BITS          = 5,
	parameter TCAM_ADDR_WIDTH  = 5 ,
	parameter TCAM_DATA_WIDTH  = 48,
	parameter TCAM_ADDR_TYPE   = 0,
	parameter TCAM_MATCH_ADDR_WIDTH = 5
)(
	input  wire                       	    clk,
	input  wire                       	    rst,
	input  wire                             we,
	input  wire [TCAM_ADDR_WIDTH+ID_BITS-1:0]       addr_wr,
	input  wire [TCAM_DATA_WIDTH-1:0]       din,
	output wire                             busy,
	input  wire [TCAM_DATA_WIDTH-1:0]       cmp_din,
	output wire                             match,
	output wire [TCAM_MATCH_ADDR_WIDTH+ID_BITS-1:0] match_addr
);

/* 
 * wires 
 */

reg                             we_0;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_0;
reg [TCAM_DATA_WIDTH-1:0] 	     din_0;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_0;
wire                       	     busy_0;
wire 				             match_0;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_0;

reg                             we_1;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_1;
reg [TCAM_DATA_WIDTH-1:0] 	     din_1;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_1;
wire                       	     busy_1;
wire 				             match_1;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_1;

reg                             we_2;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_2;
reg [TCAM_DATA_WIDTH-1:0] 	     din_2;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_2;
wire                       	     busy_2;
wire 				             match_2;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_2;

reg                             we_3;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_3;
reg [TCAM_DATA_WIDTH-1:0] 	     din_3;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_3;
wire                       	     busy_3;
wire 				             match_3;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_3;

reg                             we_4;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_4;
reg [TCAM_DATA_WIDTH-1:0] 	     din_4;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_4;
wire                       	     busy_4;
wire 				             match_4;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_4;

reg                             we_5;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_5;
reg [TCAM_DATA_WIDTH-1:0] 	     din_5;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_5;
wire                       	     busy_5;
wire 				             match_5;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_5;

reg                             we_6;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_6;
reg [TCAM_DATA_WIDTH-1:0] 	     din_6;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_6;
wire                       	     busy_6;
wire 				             match_6;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_6;

reg                             we_7;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_7;
reg [TCAM_DATA_WIDTH-1:0] 	     din_7;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_7;
wire                       	     busy_7;
wire 				             match_7;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_7;

reg                             we_8;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_8;
reg [TCAM_DATA_WIDTH-1:0] 	     din_8;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_8;
wire                       	     busy_8;
wire 				             match_8;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_8;

reg                             we_9;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_9;
reg [TCAM_DATA_WIDTH-1:0] 	     din_9;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_9;
wire                       	     busy_9;
wire 				             match_9;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_9;

reg                             we_10;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_10;
reg [TCAM_DATA_WIDTH-1:0] 	     din_10;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_10;
wire                       	     busy_10;
wire 				             match_10;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_10;

reg                             we_11;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_11;
reg [TCAM_DATA_WIDTH-1:0] 	     din_11;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_11;
wire                       	     busy_11;
wire 				             match_11;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_11;

reg                             we_12;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_12;
reg [TCAM_DATA_WIDTH-1:0] 	     din_12;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_12;
wire                       	     busy_12;
wire 				             match_12;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_12;

reg                             we_13;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_13;
reg [TCAM_DATA_WIDTH-1:0] 	     din_13;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_13;
wire                       	     busy_13;
wire 				             match_13;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_13;

reg                             we_14;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_14;
reg [TCAM_DATA_WIDTH-1:0] 	     din_14;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_14;
wire                       	     busy_14;
wire 				             match_14;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_14;

reg                             we_15;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_15;
reg [TCAM_DATA_WIDTH-1:0] 	     din_15;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_15;
wire                       	     busy_15;
wire 				             match_15;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_15;

reg                             we_16;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_16;
reg [TCAM_DATA_WIDTH-1:0] 	     din_16;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_16;
wire                       	     busy_16;
wire 				             match_16;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_16;

reg                             we_17;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_17;
reg [TCAM_DATA_WIDTH-1:0] 	     din_17;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_17;
wire                       	     busy_17;
wire 				             match_17;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_17;

reg                             we_18;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_18;
reg [TCAM_DATA_WIDTH-1:0] 	     din_18;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_18;
wire                       	     busy_18;
wire 				             match_18;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_18;

reg                             we_19;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_19;
reg [TCAM_DATA_WIDTH-1:0] 	     din_19;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_19;
wire                       	     busy_19;
wire 				             match_19;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_19;

reg                             we_20;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_20;
reg [TCAM_DATA_WIDTH-1:0] 	     din_20;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_20;
wire                       	     busy_20;
wire 				             match_20;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_20;

reg                             we_21;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_21;
reg [TCAM_DATA_WIDTH-1:0] 	     din_21;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_21;
wire                       	     busy_21;
wire 				             match_21;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_21;

reg                             we_22;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_22;
reg [TCAM_DATA_WIDTH-1:0] 	     din_22;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_22;
wire                       	     busy_22;
wire 				             match_22;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_22;

reg                             we_23;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_23;
reg [TCAM_DATA_WIDTH-1:0] 	     din_23;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_23;
wire                       	     busy_23;
wire 				             match_23;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_23;

reg                             we_24;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_24;
reg [TCAM_DATA_WIDTH-1:0] 	     din_24;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_24;
wire                       	     busy_24;
wire 				             match_24;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_24;

reg                             we_25;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_25;
reg [TCAM_DATA_WIDTH-1:0] 	     din_25;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_25;
wire                       	     busy_25;
wire 				             match_25;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_25;

reg                             we_26;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_26;
reg [TCAM_DATA_WIDTH-1:0] 	     din_26;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_26;
wire                       	     busy_26;
wire 				             match_26;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_26;

reg                             we_27;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_27;
reg [TCAM_DATA_WIDTH-1:0] 	     din_27;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_27;
wire                       	     busy_27;
wire 				             match_27;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_27;

reg                             we_28;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_28;
reg [TCAM_DATA_WIDTH-1:0] 	     din_28;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_28;
wire                       	     busy_28;
wire 				             match_28;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_28;

reg                             we_29;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_29;
reg [TCAM_DATA_WIDTH-1:0] 	     din_29;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_29;
wire                       	     busy_29;
wire 				             match_29;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_29;

reg                             we_30;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_30;
reg [TCAM_DATA_WIDTH-1:0] 	     din_30;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_30;
wire                       	     busy_30;
wire 				             match_30;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_30;

reg                             we_31;
reg [TCAM_ADDR_WIDTH-1:0]       addr_wr_31;
reg [TCAM_DATA_WIDTH-1:0] 	     din_31;
reg [TCAM_DATA_WIDTH-1:0] 	     cmp_din_31;
wire                       	     busy_31;
wire 				             match_31;
wire [TCAM_MATCH_ADDR_WIDTH-1:0] match_addr_31;



always @ (posedge clk) 
	if (rst) begin
		we_0 <= 0;
		addr_wr_0 <= 0;
		din_0 <= 0;
		cmp_din_0 <= 0;
	end else begin
		we_0 <= (addr_wr[ID_BITS-1:0] == 0) ? we : 0;
		addr_wr_0 <= (addr_wr[ID_BITS-1:0] == 0) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_0 <= din;
		cmp_din_0 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_1 <= 0;
		addr_wr_1 <= 0;
		din_1 <= 0;
		cmp_din_1 <= 0;
	end else begin
		we_1 <= (addr_wr[ID_BITS-1:0] == 1) ? we : 0;
		addr_wr_1 <= (addr_wr[ID_BITS-1:0] == 1) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_1 <= din;
		cmp_din_1 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_2 <= 0;
		addr_wr_2 <= 0;
		din_2 <= 0;
		cmp_din_2 <= 0;
	end else begin
		we_2 <= (addr_wr[ID_BITS-1:0] == 2) ? we : 0;
		addr_wr_2 <= (addr_wr[ID_BITS-1:0] == 2) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_2 <= din;
		cmp_din_2 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_3 <= 0;
		addr_wr_3 <= 0;
		din_3 <= 0;
		cmp_din_3 <= 0;
	end else begin
		we_3 <= (addr_wr[ID_BITS-1:0] == 3) ? we : 0;
		addr_wr_3 <= (addr_wr[ID_BITS-1:0] == 3) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_3 <= din;
		cmp_din_3 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_4 <= 0;
		addr_wr_4 <= 0;
		din_4 <= 0;
		cmp_din_4 <= 0;
	end else begin
		we_4 <= (addr_wr[ID_BITS-1:0] == 4) ? we : 0;
		addr_wr_4 <= (addr_wr[ID_BITS-1:0] == 4) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_4 <= din;
		cmp_din_4 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_5 <= 0;
		addr_wr_5 <= 0;
		din_5 <= 0;
		cmp_din_5 <= 0;
	end else begin
		we_5 <= (addr_wr[ID_BITS-1:0] == 5) ? we : 0;
		addr_wr_5 <= (addr_wr[ID_BITS-1:0] == 5) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_5 <= din;
		cmp_din_5 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_6 <= 0;
		addr_wr_6 <= 0;
		din_6 <= 0;
		cmp_din_6 <= 0;
	end else begin
		we_6 <= (addr_wr[ID_BITS-1:0] == 6) ? we : 0;
		addr_wr_6 <= (addr_wr[ID_BITS-1:0] == 6) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_6 <= din;
		cmp_din_6 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_7 <= 0;
		addr_wr_7 <= 0;
		din_7 <= 0;
		cmp_din_7 <= 0;
	end else begin
		we_7 <= (addr_wr[ID_BITS-1:0] == 7) ? we : 0;
		addr_wr_7 <= (addr_wr[ID_BITS-1:0] == 7) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_7 <= din;
		cmp_din_7 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_8 <= 0;
		addr_wr_8 <= 0;
		din_8 <= 0;
		cmp_din_8 <= 0;
	end else begin
		we_8 <= (addr_wr[ID_BITS-1:0] == 8) ? we : 0;
		addr_wr_8 <= (addr_wr[ID_BITS-1:0] == 8) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_8 <= din;
		cmp_din_8 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_9 <= 0;
		addr_wr_9 <= 0;
		din_9 <= 0;
		cmp_din_9 <= 0;
	end else begin
		we_9 <= (addr_wr[ID_BITS-1:0] == 9) ? we : 0;
		addr_wr_9 <= (addr_wr[ID_BITS-1:0] == 9) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_9 <= din;
		cmp_din_9 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_10 <= 0;
		addr_wr_10 <= 0;
		din_10 <= 0;
		cmp_din_10 <= 0;
	end else begin
		we_10 <= (addr_wr[ID_BITS-1:0] == 10) ? we : 0;
		addr_wr_10 <= (addr_wr[ID_BITS-1:0] == 10) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_10 <= din;
		cmp_din_10 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_11 <= 0;
		addr_wr_11 <= 0;
		din_11 <= 0;
		cmp_din_11 <= 0;
	end else begin
		we_11 <= (addr_wr[ID_BITS-1:0] == 11) ? we : 0;
		addr_wr_11 <= (addr_wr[ID_BITS-1:0] == 11) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_11 <= din;
		cmp_din_11 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_12 <= 0;
		addr_wr_12 <= 0;
		din_12 <= 0;
		cmp_din_12 <= 0;
	end else begin
		we_12 <= (addr_wr[ID_BITS-1:0] == 12) ? we : 0;
		addr_wr_12 <= (addr_wr[ID_BITS-1:0] == 12) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_12 <= din;
		cmp_din_12 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_13 <= 0;
		addr_wr_13 <= 0;
		din_13 <= 0;
		cmp_din_13 <= 0;
	end else begin
		we_13 <= (addr_wr[ID_BITS-1:0] == 13) ? we : 0;
		addr_wr_13 <= (addr_wr[ID_BITS-1:0] == 13) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_13 <= din;
		cmp_din_13 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_14 <= 0;
		addr_wr_14 <= 0;
		din_14 <= 0;
		cmp_din_14 <= 0;
	end else begin
		we_14 <= (addr_wr[ID_BITS-1:0] == 14) ? we : 0;
		addr_wr_14 <= (addr_wr[ID_BITS-1:0] == 14) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_14 <= din;
		cmp_din_14 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_15 <= 0;
		addr_wr_15 <= 0;
		din_15 <= 0;
		cmp_din_15 <= 0;
	end else begin
		we_15 <= (addr_wr[ID_BITS-1:0] == 15) ? we : 0;
		addr_wr_15 <= (addr_wr[ID_BITS-1:0] == 15) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_15 <= din;
		cmp_din_15 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_16 <= 0;
		addr_wr_16 <= 0;
		din_16 <= 0;
		cmp_din_16 <= 0;
	end else begin
		we_16 <= (addr_wr[ID_BITS-1:0] == 16) ? we : 0;
		addr_wr_16 <= (addr_wr[ID_BITS-1:0] == 16) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_16 <= din;
		cmp_din_16 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_17 <= 0;
		addr_wr_17 <= 0;
		din_17 <= 0;
		cmp_din_17 <= 0;
	end else begin
		we_17 <= (addr_wr[ID_BITS-1:0] == 17) ? we : 0;
		addr_wr_17 <= (addr_wr[ID_BITS-1:0] == 17) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_17 <= din;
		cmp_din_17 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_18 <= 0;
		addr_wr_18 <= 0;
		din_18 <= 0;
		cmp_din_18 <= 0;
	end else begin
		we_18 <= (addr_wr[ID_BITS-1:0] == 18) ? we : 0;
		addr_wr_18 <= (addr_wr[ID_BITS-1:0] == 18) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_18 <= din;
		cmp_din_18 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_19 <= 0;
		addr_wr_19 <= 0;
		din_19 <= 0;
		cmp_din_19 <= 0;
	end else begin
		we_19 <= (addr_wr[ID_BITS-1:0] == 19) ? we : 0;
		addr_wr_19 <= (addr_wr[ID_BITS-1:0] == 19) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_19 <= din;
		cmp_din_19 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_20 <= 0;
		addr_wr_20 <= 0;
		din_20 <= 0;
		cmp_din_20 <= 0;
	end else begin
		we_20 <= (addr_wr[ID_BITS-1:0] == 20) ? we : 0;
		addr_wr_20 <= (addr_wr[ID_BITS-1:0] == 20) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_20 <= din;
		cmp_din_20 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_21 <= 0;
		addr_wr_21 <= 0;
		din_21 <= 0;
		cmp_din_21 <= 0;
	end else begin
		we_21 <= (addr_wr[ID_BITS-1:0] == 21) ? we : 0;
		addr_wr_21 <= (addr_wr[ID_BITS-1:0] == 21) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_21 <= din;
		cmp_din_21 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_22 <= 0;
		addr_wr_22 <= 0;
		din_22 <= 0;
		cmp_din_22 <= 0;
	end else begin
		we_22 <= (addr_wr[ID_BITS-1:0] == 22) ? we : 0;
		addr_wr_22 <= (addr_wr[ID_BITS-1:0] == 22) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_22 <= din;
		cmp_din_22 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_23 <= 0;
		addr_wr_23 <= 0;
		din_23 <= 0;
		cmp_din_23 <= 0;
	end else begin
		we_23 <= (addr_wr[ID_BITS-1:0] == 23) ? we : 0;
		addr_wr_23 <= (addr_wr[ID_BITS-1:0] == 23) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_23 <= din;
		cmp_din_23 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_24 <= 0;
		addr_wr_24 <= 0;
		din_24 <= 0;
		cmp_din_24 <= 0;
	end else begin
		we_24 <= (addr_wr[ID_BITS-1:0] == 24) ? we : 0;
		addr_wr_24 <= (addr_wr[ID_BITS-1:0] == 24) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_24 <= din;
		cmp_din_24 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_25 <= 0;
		addr_wr_25 <= 0;
		din_25 <= 0;
		cmp_din_25 <= 0;
	end else begin
		we_25 <= (addr_wr[ID_BITS-1:0] == 25) ? we : 0;
		addr_wr_25 <= (addr_wr[ID_BITS-1:0] == 25) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_25 <= din;
		cmp_din_25 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_26 <= 0;
		addr_wr_26 <= 0;
		din_26 <= 0;
		cmp_din_26 <= 0;
	end else begin
		we_26 <= (addr_wr[ID_BITS-1:0] == 26) ? we : 0;
		addr_wr_26 <= (addr_wr[ID_BITS-1:0] == 26) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_26 <= din;
		cmp_din_26 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_27 <= 0;
		addr_wr_27 <= 0;
		din_27 <= 0;
		cmp_din_27 <= 0;
	end else begin
		we_27 <= (addr_wr[ID_BITS-1:0] == 27) ? we : 0;
		addr_wr_27 <= (addr_wr[ID_BITS-1:0] == 27) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_27 <= din;
		cmp_din_27 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_28 <= 0;
		addr_wr_28 <= 0;
		din_28 <= 0;
		cmp_din_28 <= 0;
	end else begin
		we_28 <= (addr_wr[ID_BITS-1:0] == 28) ? we : 0;
		addr_wr_28 <= (addr_wr[ID_BITS-1:0] == 28) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_28 <= din;
		cmp_din_28 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_29 <= 0;
		addr_wr_29 <= 0;
		din_29 <= 0;
		cmp_din_29 <= 0;
	end else begin
		we_29 <= (addr_wr[ID_BITS-1:0] == 29) ? we : 0;
		addr_wr_29 <= (addr_wr[ID_BITS-1:0] == 29) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_29 <= din;
		cmp_din_29 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_30 <= 0;
		addr_wr_30 <= 0;
		din_30 <= 0;
		cmp_din_30 <= 0;
	end else begin
		we_30 <= (addr_wr[ID_BITS-1:0] == 30) ? we : 0;
		addr_wr_30 <= (addr_wr[ID_BITS-1:0] == 30) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_30 <= din;
		cmp_din_30 <= cmp_din;
	end

always @ (posedge clk) 
	if (rst) begin
		we_31 <= 0;
		addr_wr_31 <= 0;
		din_31 <= 0;
		cmp_din_31 <= 0;
	end else begin
		we_31 <= (addr_wr[ID_BITS-1:0] == 31) ? we : 0;
		addr_wr_31 <= (addr_wr[ID_BITS-1:0] == 31) ? addr_wr[TCAM_ADDR_WIDTH+ID_BITS-1:ID_BITS] : 0;
		din_31 <= din;
		cmp_din_31 <= cmp_din;
	end


assign busy = busy_0 & busy_1 & busy_2 & busy_3 & busy_4 & busy_5 & busy_6 & busy_7 & busy_8 & busy_9 & busy_10 & busy_11 & busy_12 & busy_13 & busy_14 & busy_15 & busy_16 & busy_17 & busy_18 & busy_19 & busy_20 & busy_21 & busy_22 & busy_23 & busy_24 & busy_25 & busy_26 & busy_27 & busy_28 & busy_29 & busy_30 & busy_31;

/*
 * CAM instances
 */
cam #(
	.ID                       (0),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_0 (
	.CLK         (clk),             //input					
	.WE          (we_0),         //input					
	.ADDR_WR     (addr_wr_0),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_0),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_0),       //output        			

	.CMP_DIN     (cmp_din_0),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_0),      //output         			
	.MATCH_ADDR  (match_addr_0)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (1),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_1 (
	.CLK         (clk),             //input					
	.WE          (we_1),         //input					
	.ADDR_WR     (addr_wr_1),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_1),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_1),       //output        			

	.CMP_DIN     (cmp_din_1),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_1),      //output         			
	.MATCH_ADDR  (match_addr_1)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (2),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_2 (
	.CLK         (clk),             //input					
	.WE          (we_2),         //input					
	.ADDR_WR     (addr_wr_2),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_2),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_2),       //output        			

	.CMP_DIN     (cmp_din_2),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_2),      //output         			
	.MATCH_ADDR  (match_addr_2)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (3),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_3 (
	.CLK         (clk),             //input					
	.WE          (we_3),         //input					
	.ADDR_WR     (addr_wr_3),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_3),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_3),       //output        			

	.CMP_DIN     (cmp_din_3),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_3),      //output         			
	.MATCH_ADDR  (match_addr_3)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (4),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_4 (
	.CLK         (clk),             //input					
	.WE          (we_4),         //input					
	.ADDR_WR     (addr_wr_4),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_4),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_4),       //output        			

	.CMP_DIN     (cmp_din_4),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_4),      //output         			
	.MATCH_ADDR  (match_addr_4)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (5),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_5 (
	.CLK         (clk),             //input					
	.WE          (we_5),         //input					
	.ADDR_WR     (addr_wr_5),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_5),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_5),       //output        			

	.CMP_DIN     (cmp_din_5),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_5),      //output         			
	.MATCH_ADDR  (match_addr_5)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (6),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_6 (
	.CLK         (clk),             //input					
	.WE          (we_6),         //input					
	.ADDR_WR     (addr_wr_6),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_6),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_6),       //output        			

	.CMP_DIN     (cmp_din_6),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_6),      //output         			
	.MATCH_ADDR  (match_addr_6)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (7),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_7 (
	.CLK         (clk),             //input					
	.WE          (we_7),         //input					
	.ADDR_WR     (addr_wr_7),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_7),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_7),       //output        			

	.CMP_DIN     (cmp_din_7),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_7),      //output         			
	.MATCH_ADDR  (match_addr_7)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (8),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_8 (
	.CLK         (clk),             //input					
	.WE          (we_8),         //input					
	.ADDR_WR     (addr_wr_8),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_8),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_8),       //output        			

	.CMP_DIN     (cmp_din_8),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_8),      //output         			
	.MATCH_ADDR  (match_addr_8)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (9),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_9 (
	.CLK         (clk),             //input					
	.WE          (we_9),         //input					
	.ADDR_WR     (addr_wr_9),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_9),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_9),       //output        			

	.CMP_DIN     (cmp_din_9),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_9),      //output         			
	.MATCH_ADDR  (match_addr_9)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (10),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_10 (
	.CLK         (clk),             //input					
	.WE          (we_10),         //input					
	.ADDR_WR     (addr_wr_10),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_10),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_10),       //output        			

	.CMP_DIN     (cmp_din_10),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_10),      //output         			
	.MATCH_ADDR  (match_addr_10)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (11),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_11 (
	.CLK         (clk),             //input					
	.WE          (we_11),         //input					
	.ADDR_WR     (addr_wr_11),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_11),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_11),       //output        			

	.CMP_DIN     (cmp_din_11),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_11),      //output         			
	.MATCH_ADDR  (match_addr_11)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (12),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_12 (
	.CLK         (clk),             //input					
	.WE          (we_12),         //input					
	.ADDR_WR     (addr_wr_12),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_12),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_12),       //output        			

	.CMP_DIN     (cmp_din_12),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_12),      //output         			
	.MATCH_ADDR  (match_addr_12)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (13),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_13 (
	.CLK         (clk),             //input					
	.WE          (we_13),         //input					
	.ADDR_WR     (addr_wr_13),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_13),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_13),       //output        			

	.CMP_DIN     (cmp_din_13),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_13),      //output         			
	.MATCH_ADDR  (match_addr_13)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (14),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_14 (
	.CLK         (clk),             //input					
	.WE          (we_14),         //input					
	.ADDR_WR     (addr_wr_14),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_14),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_14),       //output        			

	.CMP_DIN     (cmp_din_14),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_14),      //output         			
	.MATCH_ADDR  (match_addr_14)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (15),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_15 (
	.CLK         (clk),             //input					
	.WE          (we_15),         //input					
	.ADDR_WR     (addr_wr_15),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_15),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_15),       //output        			

	.CMP_DIN     (cmp_din_15),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_15),      //output         			
	.MATCH_ADDR  (match_addr_15)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (16),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_16 (
	.CLK         (clk),             //input					
	.WE          (we_16),         //input					
	.ADDR_WR     (addr_wr_16),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_16),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_16),       //output        			

	.CMP_DIN     (cmp_din_16),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_16),      //output         			
	.MATCH_ADDR  (match_addr_16)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (17),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_17 (
	.CLK         (clk),             //input					
	.WE          (we_17),         //input					
	.ADDR_WR     (addr_wr_17),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_17),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_17),       //output        			

	.CMP_DIN     (cmp_din_17),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_17),      //output         			
	.MATCH_ADDR  (match_addr_17)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (18),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_18 (
	.CLK         (clk),             //input					
	.WE          (we_18),         //input					
	.ADDR_WR     (addr_wr_18),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_18),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_18),       //output        			

	.CMP_DIN     (cmp_din_18),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_18),      //output         			
	.MATCH_ADDR  (match_addr_18)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (19),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_19 (
	.CLK         (clk),             //input					
	.WE          (we_19),         //input					
	.ADDR_WR     (addr_wr_19),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_19),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_19),       //output        			

	.CMP_DIN     (cmp_din_19),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_19),      //output         			
	.MATCH_ADDR  (match_addr_19)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (20),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_20 (
	.CLK         (clk),             //input					
	.WE          (we_20),         //input					
	.ADDR_WR     (addr_wr_20),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_20),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_20),       //output        			

	.CMP_DIN     (cmp_din_20),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_20),      //output         			
	.MATCH_ADDR  (match_addr_20)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (21),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_21 (
	.CLK         (clk),             //input					
	.WE          (we_21),         //input					
	.ADDR_WR     (addr_wr_21),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_21),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_21),       //output        			

	.CMP_DIN     (cmp_din_21),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_21),      //output         			
	.MATCH_ADDR  (match_addr_21)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (22),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_22 (
	.CLK         (clk),             //input					
	.WE          (we_22),         //input					
	.ADDR_WR     (addr_wr_22),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_22),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_22),       //output        			

	.CMP_DIN     (cmp_din_22),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_22),      //output         			
	.MATCH_ADDR  (match_addr_22)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (23),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_23 (
	.CLK         (clk),             //input					
	.WE          (we_23),         //input					
	.ADDR_WR     (addr_wr_23),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_23),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_23),       //output        			

	.CMP_DIN     (cmp_din_23),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_23),      //output         			
	.MATCH_ADDR  (match_addr_23)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (24),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_24 (
	.CLK         (clk),             //input					
	.WE          (we_24),         //input					
	.ADDR_WR     (addr_wr_24),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_24),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_24),       //output        			

	.CMP_DIN     (cmp_din_24),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_24),      //output         			
	.MATCH_ADDR  (match_addr_24)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (25),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_25 (
	.CLK         (clk),             //input					
	.WE          (we_25),         //input					
	.ADDR_WR     (addr_wr_25),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_25),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_25),       //output        			

	.CMP_DIN     (cmp_din_25),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_25),      //output         			
	.MATCH_ADDR  (match_addr_25)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (26),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_26 (
	.CLK         (clk),             //input					
	.WE          (we_26),         //input					
	.ADDR_WR     (addr_wr_26),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_26),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_26),       //output        			

	.CMP_DIN     (cmp_din_26),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_26),      //output         			
	.MATCH_ADDR  (match_addr_26)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (27),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_27 (
	.CLK         (clk),             //input					
	.WE          (we_27),         //input					
	.ADDR_WR     (addr_wr_27),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_27),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_27),       //output        			

	.CMP_DIN     (cmp_din_27),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_27),      //output         			
	.MATCH_ADDR  (match_addr_27)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (28),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_28 (
	.CLK         (clk),             //input					
	.WE          (we_28),         //input					
	.ADDR_WR     (addr_wr_28),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_28),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_28),       //output        			

	.CMP_DIN     (cmp_din_28),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_28),      //output         			
	.MATCH_ADDR  (match_addr_28)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (29),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_29 (
	.CLK         (clk),             //input					
	.WE          (we_29),         //input					
	.ADDR_WR     (addr_wr_29),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_29),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_29),       //output        			

	.CMP_DIN     (cmp_din_29),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_29),      //output         			
	.MATCH_ADDR  (match_addr_29)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (30),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_30 (
	.CLK         (clk),             //input					
	.WE          (we_30),         //input					
	.ADDR_WR     (addr_wr_30),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_30),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_30),       //output        			

	.CMP_DIN     (cmp_din_30),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_30),      //output         			
	.MATCH_ADDR  (match_addr_30)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);

cam #(
	.ID                       (31),
	.ID_BITS                  (ID_BITS),
	.MEM_TYPE                 (MEM_TYPE),
	.CAM_MODE                 (CAM_MODE),
	.C_TCAM_ADDR_WIDTH  	  (TCAM_ADDR_WIDTH), 
	.C_TCAM_DATA_WIDTH   	  (TCAM_DATA_WIDTH), 
	.C_TCAM_ADDR_TYPE	      (TCAM_ADDR_TYPE),
	.C_TCAM_MATCH_ADDR_WIDTH  (TCAM_MATCH_ADDR_WIDTH)
) u_cam_31 (
	.CLK         (clk),             //input					
	.WE          (we_31),         //input					
	.ADDR_WR     (addr_wr_31),    //input   [C_TCAM_ADDR_WIDTH-1:0]	
	.DIN         (din_31),        //input   [C_TCAM_DATA_WIDTH-1:0]	
	.BUSY        (busy_31),       //output        			

	.CMP_DIN     (cmp_din_31),    //input   [C_TCAM_DATA_WIDTH-1:0]	
	.MATCH       (match_31),      //output         			
	.MATCH_ADDR  (match_addr_31)  //output  [C_TCAM_MATCH_ADDR_WIDTH-1:0]	
);



/*
 * Priority Encoder instances
 */



wire [TCAM_MATCH_ADDR_WIDTH+ID_BITS-1:0] l1_prio_match_addr_0;
wire                             l1_prio_match_0;
wire                             l1_prio_match_en_0;
assign l1_prio_match_en_0 = match_0  | match_1  | match_2  | match_3 ;

prio_enc1 #(
	.DATA_WIDTH (TCAM_MATCH_ADDR_WIDTH+ID_BITS)
) u_prio_enc_l1_0 (
	.clk        (clk),
	.rst_n      (!rst),
	.en         (l1_prio_match_en_0),

	.en_0       (match_0),
	.din_0      ({match_addr_0, 5'd0}),
	.en_1       (match_1),
	.din_1      ({match_addr_1, 5'd1}),
	.en_2       (match_2),
	.din_2      ({match_addr_2, 5'd2}),
	.en_3       (match_3),
	.din_3      ({match_addr_3, 5'd3}),

	.dout_en    (l1_prio_match_0),
	.dout       (l1_prio_match_addr_0)
);



wire [TCAM_MATCH_ADDR_WIDTH+ID_BITS-1:0] l1_prio_match_addr_1;
wire                             l1_prio_match_1;
wire                             l1_prio_match_en_1;
assign l1_prio_match_en_1 = match_4  | match_5  | match_6  | match_7 ;

prio_enc1 #(
	.DATA_WIDTH (TCAM_MATCH_ADDR_WIDTH+ID_BITS)
) u_prio_enc_l1_1 (
	.clk        (clk),
	.rst_n      (!rst),
	.en         (l1_prio_match_en_1),

	.en_0       (match_4),
	.din_0      ({match_addr_4, 5'd4}),
	.en_1       (match_5),
	.din_1      ({match_addr_5, 5'd5}),
	.en_2       (match_6),
	.din_2      ({match_addr_6, 5'd6}),
	.en_3       (match_7),
	.din_3      ({match_addr_7, 5'd7}),

	.dout_en    (l1_prio_match_1),
	.dout       (l1_prio_match_addr_1)
);



wire [TCAM_MATCH_ADDR_WIDTH+ID_BITS-1:0] l1_prio_match_addr_2;
wire                             l1_prio_match_2;
wire                             l1_prio_match_en_2;
assign l1_prio_match_en_2 = match_8  | match_9  | match_10  | match_11 ;

prio_enc1 #(
	.DATA_WIDTH (TCAM_MATCH_ADDR_WIDTH+ID_BITS)
) u_prio_enc_l1_2 (
	.clk        (clk),
	.rst_n      (!rst),
	.en         (l1_prio_match_en_2),

	.en_0       (match_8),
	.din_0      ({match_addr_8, 5'd8}),
	.en_1       (match_9),
	.din_1      ({match_addr_9, 5'd9}),
	.en_2       (match_10),
	.din_2      ({match_addr_10, 5'd10}),
	.en_3       (match_11),
	.din_3      ({match_addr_11, 5'd11}),

	.dout_en    (l1_prio_match_2),
	.dout       (l1_prio_match_addr_2)
);



wire [TCAM_MATCH_ADDR_WIDTH+ID_BITS-1:0] l1_prio_match_addr_3;
wire                             l1_prio_match_3;
wire                             l1_prio_match_en_3;
assign l1_prio_match_en_3 = match_12  | match_13  | match_14  | match_15 ;

prio_enc1 #(
	.DATA_WIDTH (TCAM_MATCH_ADDR_WIDTH+ID_BITS)
) u_prio_enc_l1_3 (
	.clk        (clk),
	.rst_n      (!rst),
	.en         (l1_prio_match_en_3),

	.en_0       (match_12),
	.din_0      ({match_addr_12, 5'd12}),
	.en_1       (match_13),
	.din_1      ({match_addr_13, 5'd13}),
	.en_2       (match_14),
	.din_2      ({match_addr_14, 5'd14}),
	.en_3       (match_15),
	.din_3      ({match_addr_15, 5'd15}),

	.dout_en    (l1_prio_match_3),
	.dout       (l1_prio_match_addr_3)
);



wire [TCAM_MATCH_ADDR_WIDTH+ID_BITS-1:0] l1_prio_match_addr_4;
wire                             l1_prio_match_4;
wire                             l1_prio_match_en_4;
assign l1_prio_match_en_4 = match_16  | match_17  | match_18  | match_19 ;

prio_enc1 #(
	.DATA_WIDTH (TCAM_MATCH_ADDR_WIDTH+ID_BITS)
) u_prio_enc_l1_4 (
	.clk        (clk),
	.rst_n      (!rst),
	.en         (l1_prio_match_en_4),

	.en_0       (match_16),
	.din_0      ({match_addr_16, 5'd16}),
	.en_1       (match_17),
	.din_1      ({match_addr_17, 5'd17}),
	.en_2       (match_18),
	.din_2      ({match_addr_18, 5'd18}),
	.en_3       (match_19),
	.din_3      ({match_addr_19, 5'd19}),

	.dout_en    (l1_prio_match_4),
	.dout       (l1_prio_match_addr_4)
);



wire [TCAM_MATCH_ADDR_WIDTH+ID_BITS-1:0] l1_prio_match_addr_5;
wire                             l1_prio_match_5;
wire                             l1_prio_match_en_5;
assign l1_prio_match_en_5 = match_20  | match_21  | match_22  | match_23 ;

prio_enc1 #(
	.DATA_WIDTH (TCAM_MATCH_ADDR_WIDTH+ID_BITS)
) u_prio_enc_l1_5 (
	.clk        (clk),
	.rst_n      (!rst),
	.en         (l1_prio_match_en_5),

	.en_0       (match_20),
	.din_0      ({match_addr_20, 5'd20}),
	.en_1       (match_21),
	.din_1      ({match_addr_21, 5'd21}),
	.en_2       (match_22),
	.din_2      ({match_addr_22, 5'd22}),
	.en_3       (match_23),
	.din_3      ({match_addr_23, 5'd23}),

	.dout_en    (l1_prio_match_5),
	.dout       (l1_prio_match_addr_5)
);



wire [TCAM_MATCH_ADDR_WIDTH+ID_BITS-1:0] l1_prio_match_addr_6;
wire                             l1_prio_match_6;
wire                             l1_prio_match_en_6;
assign l1_prio_match_en_6 = match_24  | match_25  | match_26  | match_27 ;

prio_enc1 #(
	.DATA_WIDTH (TCAM_MATCH_ADDR_WIDTH+ID_BITS)
) u_prio_enc_l1_6 (
	.clk        (clk),
	.rst_n      (!rst),
	.en         (l1_prio_match_en_6),

	.en_0       (match_24),
	.din_0      ({match_addr_24, 5'd24}),
	.en_1       (match_25),
	.din_1      ({match_addr_25, 5'd25}),
	.en_2       (match_26),
	.din_2      ({match_addr_26, 5'd26}),
	.en_3       (match_27),
	.din_3      ({match_addr_27, 5'd27}),

	.dout_en    (l1_prio_match_6),
	.dout       (l1_prio_match_addr_6)
);



wire [TCAM_MATCH_ADDR_WIDTH+ID_BITS-1:0] l1_prio_match_addr_7;
wire                             l1_prio_match_7;
wire                             l1_prio_match_en_7;
assign l1_prio_match_en_7 = match_28  | match_29  | match_30  | match_31 ;

prio_enc1 #(
	.DATA_WIDTH (TCAM_MATCH_ADDR_WIDTH+ID_BITS)
) u_prio_enc_l1_7 (
	.clk        (clk),
	.rst_n      (!rst),
	.en         (l1_prio_match_en_7),

	.en_0       (match_28),
	.din_0      ({match_addr_28, 5'd28}),
	.en_1       (match_29),
	.din_1      ({match_addr_29, 5'd29}),
	.en_2       (match_30),
	.din_2      ({match_addr_30, 5'd30}),
	.en_3       (match_31),
	.din_3      ({match_addr_31, 5'd31}),

	.dout_en    (l1_prio_match_7),
	.dout       (l1_prio_match_addr_7)
);




wire [TCAM_MATCH_ADDR_WIDTH+ID_BITS-1:0] l2_prio_match_addr_0;
wire                             l2_prio_match_0;
wire                             l2_prio_match_en_0;
assign l2_prio_match_en_0 = l1_prio_match_0  | l1_prio_match_1  | l1_prio_match_2  | l1_prio_match_3  | l1_prio_match_4  | l1_prio_match_5  | l1_prio_match_6  | l1_prio_match_7 ;

prio_enc2 #(
	.DATA_WIDTH (TCAM_MATCH_ADDR_WIDTH+ID_BITS)
) u_prio_enc_l2_0 (
	.clk        (clk),
	.rst_n      (!rst),
	.en         (l2_prio_match_en_0),

	.en_0       (l1_prio_match_0),
	.din_0      (l1_prio_match_addr_0),
	.en_1       (l1_prio_match_1),
	.din_1      (l1_prio_match_addr_1),
	.en_2       (l1_prio_match_2),
	.din_2      (l1_prio_match_addr_2),
	.en_3       (l1_prio_match_3),
	.din_3      (l1_prio_match_addr_3),
	.en_4       (l1_prio_match_4),
	.din_4      (l1_prio_match_addr_4),
	.en_5       (l1_prio_match_5),
	.din_5      (l1_prio_match_addr_5),
	.en_6       (l1_prio_match_6),
	.din_6      (l1_prio_match_addr_6),
	.en_7       (l1_prio_match_7),
	.din_7      (l1_prio_match_addr_7),

	.dout_en    (l2_prio_match_0),
	.dout       (l2_prio_match_addr_0)
);



assign match = l2_prio_match_0;
assign match_addr = l2_prio_match_addr_0;

endmodule

