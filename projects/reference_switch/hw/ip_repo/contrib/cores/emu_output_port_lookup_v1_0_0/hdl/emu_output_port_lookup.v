//
// Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
//                          Junior University
// Copyright (C) 2010, 2011 Adam Covington
// Copyright (C) 2015 Noa Zilberman
// Copyright (C) 2016 Salvator Galea
// All rights reserved.
//
// This software was developed by
// Stanford University and the University of Cambridge Computer Laboratory
// under National Science Foundation under Grant No. CNS-0855268,
// the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
// by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
// as part of the DARPA MRC research programme.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
// license agreements.  See the NOTICE file distributed with this work for
// additional information regarding copyright ownership.  NetFPGA licenses this
// file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
// "License"); you may not use this file except in compliance with the
// License.  You may obtain a copy of the License at:
//
//   http://www.netfpga-cic.org
//
// Unless required by applicable law or agreed to in writing, Work distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@
//
/*******************************************************************************
 *  File:
 *        emu_output_port_lookup.v
 *
 *  Library:
 *        hw/contrib/cores/emu_output_port_lookup
 *
 *  Module:
 *        emu_output_port_lookup
 *
 *  Author:
 *        Adam Covington
 *        Modified by Noa Zilberman, Salvator Galea
 * 
 *  Description:
 *        Output port lookup for the reference Emu project
 *
 */


`include "output_port_lookup_cpu_regs_defines.v"

module emu_output_port_lookup
#(
	//Master AXI Stream Data Width
	parameter C_M_AXIS_DATA_WIDTH=256,
	parameter C_S_AXIS_DATA_WIDTH=256,
	parameter C_M_AXIS_TUSER_WIDTH=128,
	parameter C_S_AXIS_TUSER_WIDTH=128,
	parameter SRC_PORT_POS=16,
	parameter DST_PORT_POS=24,

	// AXI Registers Data Width
	parameter C_S_AXI_DATA_WIDTH    = 32,          
	parameter C_S_AXI_ADDR_WIDTH    = 12,          
	parameter C_BASEADDR            = 32'h00000000


)
(
	// Global Ports
	input axis_aclk,
	input axis_resetn,

	// Master Stream Ports (interface to data path)
	output [C_M_AXIS_DATA_WIDTH - 1:0] m_axis_tdata,
	output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_tkeep,
	output [C_M_AXIS_TUSER_WIDTH-1:0] m_axis_tuser,
	output m_axis_tvalid,
	input  m_axis_tready,
	output m_axis_tlast,

	// Slave Stream Ports (interface to RX queues)
	input [C_S_AXIS_DATA_WIDTH - 1:0] s_axis_tdata,
	input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s_axis_tkeep,
	input [C_S_AXIS_TUSER_WIDTH-1:0] s_axis_tuser,
	input  s_axis_tvalid,
	output s_axis_tready,
	input  s_axis_tlast,

	// Slave AXI Ports
	input                                     S_AXI_ACLK,
	input                                     S_AXI_ARESETN,
	input      [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_AWADDR,
	input                                     S_AXI_AWVALID,
	input      [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_WDATA,
	input      [C_S_AXI_DATA_WIDTH/8-1 : 0]   S_AXI_WSTRB,
	input                                     S_AXI_WVALID,
	input                                     S_AXI_BREADY,
	input      [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_ARADDR,
	input                                     S_AXI_ARVALID,
	input                                     S_AXI_RREADY,
	output                                    S_AXI_ARREADY,
	output     [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_RDATA,
	output     [1 : 0]                        S_AXI_RRESP,
	output                                    S_AXI_RVALID,
	output                                    S_AXI_WREADY,
	output     [1 :0]                         S_AXI_BRESP,
	output                                    S_AXI_BVALID,
	output                                    S_AXI_AWREADY
);

	reg      [`REG_ID_BITS]		id_reg;
	reg      [`REG_VERSION_BITS]	version_reg;
	wire     [`REG_RESET_BITS]	reset_reg;
	reg      [`REG_FLIP_BITS]	ip2cpu_flip_reg;
	wire     [`REG_FLIP_BITS]	cpu2ip_flip_reg;
	reg      [`REG_PKTIN_BITS]	pktin_reg;
	wire				pktin_reg_clear;
	reg      [`REG_PKTOUT_BITS]	pktout_reg;
	wire				pktout_reg_clear;
	reg      [`REG_DEBUG_BITS]	ip2cpu_debug_reg;
	wire     [`REG_DEBUG_BITS]	cpu2ip_debug_reg;

	wire     [`REG_DEBUG_BITS]	debug_reg;

	wire clear_counters;
	wire reset_registers;

	function integer log2;
	input integer number;
	begin
		log2=0;
		while(2**log2<number) begin
			log2=log2+1;
		end
	end
	endfunction // log2

	// ------------ Internal Params --------
	localparam MODULE_HEADER = 0;
	localparam IN_PACKET     = 1;

	//------------- Wires ------------------
	wire [63:0] m_axis_tdata_256;  
	wire [7:0] m_axis_tkeep_256;   
	wire m_axis_tlast_256;   
	wire m_axis_tvalid_256;   
	wire m_axis_tready_256;  
	wire [63:0] m_axis_tuser_hi_256;
	wire [63:0] m_axis_tuser_low_256;

	wire [63:0] s_axis_tdata_256;  
	wire [7:0] s_axis_tkeep_256;   
	wire s_axis_tlast_256;   
	wire s_axis_tvalid_256;   
	wire s_axis_tready_256;  
	wire [63:0] s_axis_tuser_hi_256;
	wire [63:0] s_axis_tuser_low_256; 

	wire cam_busy;
	wire cam_match;
	wire [7:0] cam_match_addr;
	wire [63:0] cam_cmp_din;

	wire [63:0] cam_din;
	wire cam_we;
	wire [7:0] cam_wr_addr;   

	//-------------------- Modules and Logic ---------------------------
	nf_axis_converter
	#(
		.C_M_AXIS_DATA_WIDTH(64),
		.C_S_AXIS_DATA_WIDTH(256)
	)
	conv_in
	(
		.axi_aclk(axis_aclk),
		.axi_resetn(axis_resetn),
		.interface_number(8'h0),

		// Master Stream Ports
		.m_axis_tdata(m_axis_tdata_256),
		.m_axis_tkeep(m_axis_tkeep_256),
		.m_axis_tuser({m_axis_tuser_hi_256,m_axis_tuser_low_256}),
		.m_axis_tvalid(m_axis_tvalid_256),
		.m_axis_tready(m_axis_tready_256),
		.m_axis_tlast(m_axis_tlast_256),

		// Slave Stream Ports
		.s_axis_tdata(s_axis_tdata),
		.s_axis_tkeep(s_axis_tkeep),
		.s_axis_tuser(s_axis_tuser),
		.s_axis_tvalid(s_axis_tvalid),
		.s_axis_tready(s_axis_tready),
		.s_axis_tlast(s_axis_tlast)
	);


	Emu the_Emu
	(  
		.reset(~axis_resetn),   
		.clk(axis_aclk),   

		// Slave Stream Ports 
		.s_axis_tdata(m_axis_tdata_256),
		.s_axis_tkeep(m_axis_tkeep_256),   
		.s_axis_tlast(m_axis_tlast_256),   
		.s_axis_tvalid(m_axis_tvalid_256),   
		.s_axis_tready(m_axis_tready_256),  
		.s_axis_tuser_hi(m_axis_tuser_hi_256),
		.s_axis_tuser_low(m_axis_tuser_low_256),

		// Master Stream Ports
		.m_axis_tdata(s_axis_tdata_256),
		.m_axis_tkeep(s_axis_tkeep_256),
		.m_axis_tlast(s_axis_tlast_256),
		.m_axis_tvalid(s_axis_tvalid_256),
		.m_axis_tready(s_axis_tready_256),
		.m_axis_tuser_hi(s_axis_tuser_hi_256),
		.m_axis_tuser_low(s_axis_tuser_low_256),

		// CAM Ports
		// Outputs
		.cam_busy(cam_busy),
		.cam_match(cam_match),
		.cam_match_addr(cam_match_addr[7:0]),
		// Inputs
		.cam_cmp_din(cam_cmp_din[63:0]),
		.cam_din(cam_din[63:0]),
		.cam_we(cam_we),
		.cam_wr_addr(cam_wr_addr[7:0]),

		// Debug register
		.debug_reg(debug_reg)
	);

	// BRAM-based CAM
	// 1 cycle read latency, 2 cycles write latency, width=64b, depth=256entries
//	cam 
//	#(
//		.C_TCAM_ADDR_WIDTH	(8), 
//		.C_TCAM_DATA_WIDTH	(64),
//		.C_TCAM_ADDR_TYPE	(0),
//		.C_TCAM_MATCH_ADDR_WIDTH(8)
//	)
//	mac_cam
//	(  
//		(* box_type = "user_black_box" *)
//		// Outputs
//		.BUSY                             (cam_busy),
//		.MATCH                            (cam_match),
//		.MATCH_ADDR                       (cam_match_addr[7:0]),
//		// Inputs
//		.CLK                              (axis_aclk),
//		.CMP_DIN                          (cam_cmp_din[63:0]),
//		.DIN                              (cam_din[63:0]),
//		.WE                               (cam_we),
//		.ADDR_WR                          (cam_wr_addr[7:0])
//	);

	nf_axis_converter
	#(
		.C_M_AXIS_DATA_WIDTH(256),
		.C_S_AXIS_DATA_WIDTH(64)
	)
	conv_out
	(
		.axi_aclk(axis_aclk),
		.axi_resetn(axis_resetn),

		.interface_number(8'h0),

		// Master Stream Ports
		.m_axis_tdata(m_axis_tdata),
		.m_axis_tkeep(m_axis_tkeep),
		.m_axis_tuser(m_axis_tuser),
		.m_axis_tvalid(m_axis_tvalid),
		.m_axis_tready(m_axis_tready),
		.m_axis_tlast(m_axis_tlast),

		// Slave Stream Ports
		.s_axis_tdata(s_axis_tdata_256),
		.s_axis_tkeep(s_axis_tkeep_256),
		.s_axis_tuser({s_axis_tuser_hi_256,s_axis_tuser_low_256}),
		.s_axis_tvalid(s_axis_tvalid_256),
		.s_axis_tready(s_axis_tready_256),
		.s_axis_tlast(s_axis_tlast_256)
	);

	//Registers section
	output_port_lookup_cpu_regs 
	#(
		.C_BASE_ADDRESS        (C_BASEADDR),
		.C_S_AXI_DATA_WIDTH (C_S_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH (C_S_AXI_ADDR_WIDTH)
	) 
	opl_cpu_regs_inst
	(   
		// General ports
		.clk                    (axis_aclk),
		.resetn                 (axis_resetn),
		// AXI Lite ports
		.S_AXI_ACLK             (S_AXI_ACLK),
		.S_AXI_ARESETN          (S_AXI_ARESETN),
		.S_AXI_AWADDR           (S_AXI_AWADDR),
		.S_AXI_AWVALID          (S_AXI_AWVALID),
		.S_AXI_WDATA            (S_AXI_WDATA),
		.S_AXI_WSTRB            (S_AXI_WSTRB),
		.S_AXI_WVALID           (S_AXI_WVALID),
		.S_AXI_BREADY           (S_AXI_BREADY),
		.S_AXI_ARADDR           (S_AXI_ARADDR),
		.S_AXI_ARVALID          (S_AXI_ARVALID),
		.S_AXI_RREADY           (S_AXI_RREADY),
		.S_AXI_ARREADY          (S_AXI_ARREADY),
		.S_AXI_RDATA            (S_AXI_RDATA),
		.S_AXI_RRESP            (S_AXI_RRESP),
		.S_AXI_RVALID           (S_AXI_RVALID),
		.S_AXI_WREADY           (S_AXI_WREADY),
		.S_AXI_BRESP            (S_AXI_BRESP),
		.S_AXI_BVALID           (S_AXI_BVALID),
		.S_AXI_AWREADY          (S_AXI_AWREADY),


		// Register ports
		.id_reg          (id_reg),
		.version_reg          (version_reg),
		.reset_reg          (reset_reg),
		.ip2cpu_flip_reg          (ip2cpu_flip_reg),
		.cpu2ip_flip_reg          (cpu2ip_flip_reg),
		.pktin_reg          (pktin_reg),
		.pktin_reg_clear    (pktin_reg_clear),
		.pktout_reg          (pktout_reg),
		.pktout_reg_clear    (pktout_reg_clear),
		.ip2cpu_debug_reg          (ip2cpu_debug_reg),
		.cpu2ip_debug_reg          (cpu2ip_debug_reg),
		// Global Registers - user can select if to use
		.cpu_resetn_soft(),//software reset, after cpu module
		.resetn_soft    (),//software reset to cpu module (from central reset management)
		.resetn_sync    (resetn_sync)//synchronized reset, use for better timing
	);

	assign clear_counters = reset_reg[0];
	assign reset_registers = reset_reg[4];


	//registers logic, current logic is just a placeholder for initial compil, required to be changed by the user
	always @(posedge axis_aclk)
	if (~resetn_sync | reset_registers) begin
		id_reg <= #1    `REG_ID_DEFAULT;
		version_reg <= #1    `REG_VERSION_DEFAULT;
		ip2cpu_flip_reg <= #1    `REG_FLIP_DEFAULT;
		pktin_reg <= #1    `REG_PKTIN_DEFAULT;
		pktout_reg <= #1    `REG_PKTOUT_DEFAULT;
		ip2cpu_debug_reg <= #1    `REG_DEBUG_DEFAULT;
	end
	else begin
		id_reg <= #1    `REG_ID_DEFAULT;
		version_reg <= #1    `REG_VERSION_DEFAULT;
		ip2cpu_flip_reg <= #1    ~cpu2ip_flip_reg;
		pktin_reg[`REG_PKTIN_WIDTH -2: 0] <= #1  clear_counters | pktin_reg_clear ? 'h0  : pktin_reg[`REG_PKTIN_WIDTH-2:0] + (s_axis_tlast && s_axis_tvalid && s_axis_tready) ;
                pktin_reg[`REG_PKTIN_WIDTH-1] <= #1 clear_counters | pktin_reg_clear ? 1'h0 : pktin_reg_clear ? 'h0  : pktin_reg[`REG_PKTIN_WIDTH-2:0] + (s_axis_tlast && s_axis_tvalid && s_axis_tready) 
                                                     > {(`REG_PKTIN_WIDTH-1){1'b1}} ? 1'b1 : pktin_reg[`REG_PKTIN_WIDTH-1];
                                                               
		pktout_reg [`REG_PKTOUT_WIDTH-2:0]<= #1  clear_counters | pktout_reg_clear ? 'h0  : pktout_reg [`REG_PKTOUT_WIDTH-2:0] + (m_axis_tlast && m_axis_tvalid && m_axis_tready) ;
                pktout_reg [`REG_PKTOUT_WIDTH-1]<= #1  clear_counters | pktout_reg_clear ? 'h0  : pktout_reg [`REG_PKTOUT_WIDTH-2:0] + (m_axis_tlast && m_axis_tvalid && m_axis_tready)  > {(`REG_PKTOUT_WIDTH-1){1'b1}} ?
                                                                1'b1 : pktout_reg [`REG_PKTOUT_WIDTH-1];
		ip2cpu_debug_reg <= #1 debug_reg;
	end

endmodule // output_port_lookup
