//////////////////////////////////////////////////////////////////////////////
//  
// Copyright (c) 2015 Digilent Inc.
// All rights reserved.
//
// File:
// d_sdctrl.v
//  
// Library:
// hw/contrib/d_sdctrl_1.0
//
// Author:
// Tinghui Wang (Steve)
//
// Description:
// 4-bit SDIO controller for reading micro-SD card in 4-bit mode
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
// license agreements. See the NOTICE file distributed with this work for
// additional information regarding copyright ownership. NetFPGA licenses this
// file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
// "License"); you may not use this file except in compliance with the
// License. You may obtain a copy of the License at:
//
// http://www.netfpga-cic.org
//
// Unless required by applicable law or agreed to in writing, Work distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@
//  

`timescale 1 ps / 1 ps

	module d_sdctrl #
	(
		// Users to add parameters here

		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S_AXI
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_ADDR_WIDTH	= 6
	)
	(
		// Users to add ports here
		output wire sd_sck_o,
        inout wire sd_cmd_io,
        input wire sd_dat0_i,
        input wire sd_dat1_i,
        input wire sd_dat2_i,
        input wire sd_dat3_i,
		// User ports ends
		// Do not modify the ports beyond this line


		// Ports of Axi Slave Bus Interface S_AXI
		input wire  s_axi_aclk,
		input wire  s_axi_aresetn,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_awaddr,
		input wire [2 : 0] s_axi_awprot,
		input wire  s_axi_awvalid,
		output wire  s_axi_awready,
		input wire [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_wdata,
		input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] s_axi_wstrb,
		input wire  s_axi_wvalid,
		output wire  s_axi_wready,
		output wire [1 : 0] s_axi_bresp,
		output wire  s_axi_bvalid,
		input wire  s_axi_bready,
		input wire [C_S_AXI_ADDR_WIDTH-1 : 0] s_axi_araddr,
		input wire [2 : 0] s_axi_arprot,
		input wire  s_axi_arvalid,
		output wire  s_axi_arready,
		output wire [C_S_AXI_DATA_WIDTH-1 : 0] s_axi_rdata,
		output wire [1 : 0] s_axi_rresp,
		output wire  s_axi_rvalid,
		input wire  s_axi_rready
	);
	
	wire [C_S_AXI_DATA_WIDTH-1 : 0]  command_reg;
    wire [C_S_AXI_DATA_WIDTH-1 : 0]  argument_reg;
    wire [C_S_AXI_DATA_WIDTH-1 : 0]  status_reg;
    wire [C_S_AXI_DATA_WIDTH-1 : 0]  response_reg0;
    wire [C_S_AXI_DATA_WIDTH-1 : 0]  response_reg1;
    wire [C_S_AXI_DATA_WIDTH-1 : 0]  response_reg2;
    wire [C_S_AXI_DATA_WIDTH-1 : 0]  response_reg3;
    wire [C_S_AXI_DATA_WIDTH-1 : 0]  dbg_reg0;
    wire [C_S_AXI_DATA_WIDTH-1 : 0]  dbg_reg1;
    wire [C_S_AXI_DATA_WIDTH-1 : 0]  dbg_reg2;
    wire [C_S_AXI_DATA_WIDTH-1 : 0]  dbg_reg3;
    (* mark_debug = "true" *)
    wire cmd_send;
	
// Instantiation of Axi Bus Interface S_AXI
	d_sdctrl_S_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
	) d_sdctrl_S_AXI_inst (
		.command_reg	(command_reg),
    	.argument_reg	(argument_reg),
    	.status_reg		(status_reg),
    	.response_reg0	(response_reg0),
    	.response_reg1	(response_reg1),
    	.response_reg2	(response_reg2),
    	.response_reg3	(response_reg3),
    	.dbg_reg0		(dbg_reg0),
    	.dbg_reg1		(dbg_reg1),
    	.dbg_reg2		(dbg_reg2),
    	.dbg_reg3		(dbg_reg3),
    	.command_send   (cmd_send),
		.S_AXI_ACLK(s_axi_aclk),
		.S_AXI_ARESETN(s_axi_aresetn),
		.S_AXI_AWADDR(s_axi_awaddr),
		.S_AXI_AWPROT(s_axi_awprot),
		.S_AXI_AWVALID(s_axi_awvalid),
		.S_AXI_AWREADY(s_axi_awready),
		.S_AXI_WDATA(s_axi_wdata),
		.S_AXI_WSTRB(s_axi_wstrb),
		.S_AXI_WVALID(s_axi_wvalid),
		.S_AXI_WREADY(s_axi_wready),
		.S_AXI_BRESP(s_axi_bresp),
		.S_AXI_BVALID(s_axi_bvalid),
		.S_AXI_BREADY(s_axi_bready),
		.S_AXI_ARADDR(s_axi_araddr),
		.S_AXI_ARPROT(s_axi_arprot),
		.S_AXI_ARVALID(s_axi_arvalid),
		.S_AXI_ARREADY(s_axi_arready),
		.S_AXI_RDATA(s_axi_rdata),
		.S_AXI_RRESP(s_axi_rresp),
		.S_AXI_RVALID(s_axi_rvalid),
		.S_AXI_RREADY(s_axi_rready)
	);

	(* mark_debug = "true" *)
    wire resp_timeout;
	(* mark_debug = "true" *)
    wire resp_done;
	(* mark_debug = "true" *)
    wire resp_en;
	(* mark_debug = "true" *)
    wire [125:0]    resp_data;
	(* mark_debug = "true" *)
    wire [1:0]      resp_type;
	(* mark_debug = "true" *)
    wire cmd_done;
	(* mark_debug = "true" *)
    wire [31:0] cmd_arg;
	(* mark_debug = "true" *)
    wire [7:0] cmd_index;
	(* mark_debug = "true" *)
    wire sck_en;
	(* mark_debug = "true" *)
    wire [2:0] sck_div;
	(* mark_debug = "true" *)
    wire rst;
	(* mark_debug = "true" *)
    wire data_transfer;
	(* mark_debug = "true" *)
    wire data_crc0_err;
	(* mark_debug = "true" *)
    wire data_crc1_err;
	(* mark_debug = "true" *)
    wire data_crc2_err;
	(* mark_debug = "true" *)
    wire data_crc3_err;
	(* mark_debug = "true" *)
    wire data_zero0;
	(* mark_debug = "true" *)
    wire data_zero1;
	(* mark_debug = "true" *)
    wire data_zero2;
	(* mark_debug = "true" *)
    wire data_zero3;
	(* mark_debug = "true" *)
    wire data_done;
	(* mark_debug = "true" *)
    wire [15:0] dbg_crc0_decoded;
	(* mark_debug = "true" *)
    wire [15:0] dbg_crc1_decoded;
	(* mark_debug = "true" *)
    wire [15:0] dbg_crc2_decoded;
	(* mark_debug = "true" *)
    wire [15:0] dbg_crc3_decoded;
	(* mark_debug = "true" *)
    wire [15:0] dbg_crc0_actual;
	(* mark_debug = "true" *)
    wire [15:0] dbg_crc1_actual;
	(* mark_debug = "true" *)
    wire [15:0] dbg_crc2_actual;
	(* mark_debug = "true" *)
    wire [15:0] dbg_crc3_actual;
    (* mark_debug = "true" *)
    wire sd_cmd_i;
    (* mark_debug = "true" *)
    wire sd_cmd_t;
    (* mark_debug = "true" *)
    wire sd_cmd_o;
   
    assign rst = ~s_axi_aresetn;
    assign sck_en = command_reg[0]; 
    assign sck_div = command_reg[3:1];
    assign resp_type = command_reg[5:4];
    assign data_transfer = command_reg[7];
    assign cmd_index = command_reg[15:8];
    assign cmd_arg = argument_reg;
    
    assign status_reg[31:18] = 'd0;
    assign status_reg[17:14] = {data_crc3_err, data_crc2_err, data_crc1_err, data_crc0_err};
    assign status_reg[13:10] = {data_zero3, data_zero2, data_zero1, data_zero0};
    assign status_reg[9:4] = {1'b0, data_done, 1'b0, resp_timeout, 1'b0, resp_done};
    assign status_reg[3:0] = {3'd0, cmd_done};
    assign response_reg0 = resp_data[31:0];
    assign response_reg1 = resp_data[63:32];
    assign response_reg2 = resp_data[95:64];
    assign response_reg3 = {2'd0, resp_data[125:96]};
    assign dbg_reg0 = {dbg_crc0_actual, dbg_crc0_decoded};
    assign dbg_reg1 = {dbg_crc1_actual, dbg_crc1_decoded};
    assign dbg_reg2 = {dbg_crc2_actual, dbg_crc2_decoded};
    assign dbg_reg3 = {dbg_crc3_actual, dbg_crc3_decoded};
    
	// Add user logic here
   cmd_rxtx command (
      .clk_i             (s_axi_aclk),
      .rst_i             (rst),
      .sck_div_i         (sck_div),
      .sck_en_i          (sck_en),
      .cmd_index_i       (cmd_index),
      .cmd_arg_i         (cmd_arg),
      .cmd_send_i        (cmd_send),
      .cmd_done_o        (cmd_done),
      .dbg_crc0_decoded  (dbg_crc0_decoded),
      .dbg_crc1_decoded  (dbg_crc1_decoded),
      .dbg_crc2_decoded  (dbg_crc2_decoded),
      .dbg_crc3_decoded  (dbg_crc3_decoded),
      .dbg_crc0_actual   (dbg_crc0_actual),
      .dbg_crc1_actual   (dbg_crc1_actual),
      .dbg_crc2_actual   (dbg_crc2_actual),
      .dbg_crc3_actual   (dbg_crc3_actual),
      .resp_type_i       (resp_type),
      .resp_data_o       (resp_data),
      .resp_done_o       (resp_done),
      .resp_timeout_o    (resp_timeout),
      .data_transfer_i   (data_transfer),
      .data_crc0_err_o   (data_crc0_err),
      .data_crc1_err_o   (data_crc1_err),
      .data_crc2_err_o   (data_crc2_err),
      .data_crc3_err_o   (data_crc3_err),
      .data_zero0_o      (data_zero0),
      .data_zero1_o      (data_zero1),
      .data_zero2_o      (data_zero2),
      .data_zero3_o      (data_zero3),
      .data_done_o       (data_done), 
      .sd_sck_o          (sd_sck_o),
      .sd_cmd_i          (sd_cmd_i),
      .sd_cmd_t          (sd_cmd_t),
      .sd_cmd_o          (sd_cmd_o),
      .sd_dat0_i         (sd_dat0_i),
      .sd_dat1_i         (sd_dat1_i),
      .sd_dat2_i         (sd_dat2_i),
      .sd_dat3_i         (sd_dat3_i)
    );
	// User logic ends

    assign sd_cmd_io = (sd_cmd_t == 1'b0) ? sd_cmd_o : 1'bz;
    assign sd_cmd_i = sd_cmd_io;

	endmodule
