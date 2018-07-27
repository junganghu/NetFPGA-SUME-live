/////////////////////////////////////////////////////////////////////////////
//  
// Copyright (c) 2015 Digilent Inc.
// All rights reserved.
//
// File:
// nf_sume_10g_interface.v
//  
// Library:
// hw/std/cores/nf_sume_10g_interface
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

`timescale 1 ns / 1 ps

module nf_sume_10g_interface #
(
	// Users to add parameters here
	parameter USE_SHARED_TXUSRCLK = "TRUE",
	parameter integer FIFO_SIZE = 512,
    parameter integer C_PRTAD = 5'h0,
	parameter integer C_PMA_PMD_TYPE = 3'b101,
	// User parameters ends
	// Do not modify the parameters beyond this line

	// Parameters of Axi Slave Bus Interface S_AXI
	parameter integer C_S_AXI_DATA_WIDTH	= 32,
	parameter integer C_S_AXI_ADDR_WIDTH	= 7
)
(
    // Global Clock Input
    input           clk156,
    input           dclk,
    input           qplllock,
    input           qplloutclk,
    input           qplloutrefclk,

	// Shared TXUSRCLK
	input           txusrclk_shared,
	output          txusrclk_out,

    // Global Reset Inputs
    input           areset,
    input           areset_clk156,
    input           gttxreset,
    input           gtrxreset,
    input           reset_counter_done,
    
    // Serial Interface
    output          xphy_txp,
    output          xphy_txn,
    input           xphy_rxp,
    input           xphy_rxn,

	// Optical Module Interface
	input  xphy_abs,  
	input  xphy_tx_fault,
	output xphy_tx_disable,
	
	// Status LEDs
	output tx_led,
	output rx_led,
    
    // MDIO Controller
    input           mdio_mdc,
    input           mdio_mdio_i,
    output          mdio_mdio_o,
    output          mdio_mdio_t,
    
    // RX AXIS Interface
    input           rx_axis_fifo_aresetn,
    input           rx_axis_aclk,
    output [63:0]   rx_axis_tdata,
    output [7:0]    rx_axis_tkeep,
    output          rx_axis_tvalid,
    output          rx_axis_tlast,
    input           rx_axis_tready,
    
    // TX AXIS Interface
    input           tx_axis_fifo_aresetn,
    input           tx_axis_aclk,
    input [63:0]    tx_axis_tdata,
    input [7:0]     tx_axis_tkeep,
    input           tx_axis_tvalid,
    input           tx_axis_tlast,
    output          tx_axis_tready,

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

	localparam NF_SUME_10G_INT_VER = 'h100;

	// AXI-Lite MAC TX/RX Configuation Vector
	wire [79:0] tx_configuration_vector;
	wire [79:0] rx_configuration_vector;
	wire [C_S_AXI_DATA_WIDTH-1 : 0] interface_10g_status;
	wire [C_S_AXI_DATA_WIDTH-1 : 0] counter_reset;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] bad_frames_counter;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] good_frames_counter;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] bytes_from_mac;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] pkts_from_mac;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] rx_enqueued_pkts;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] rx_enqueued_bytes;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] rx_dequeued_pkts;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] rx_dequeued_bytes;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] tx_enqueued_pkts;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] tx_enqueued_bytes;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] tx_dequeued_pkts;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] tx_dequeued_bytes;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] rx_pkts_in_queue;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] rx_bytes_in_queue;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] tx_pkts_in_queue;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] tx_bytes_in_queue;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] rx_pkts_dropped;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] rx_bytes_dropped;
	
	// Reset
	wire aresetn_clk156;
	assign aresetn_clk156 = ~areset_clk156;

// Instantiation of Axi Bus Interface S_AXI
	nf_sume_10g_interface_S_AXI # ( 
		.NF_SUME_10G_INT_VER(NF_SUME_10G_INT_VER),
		.C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
	) nf_sume_10g_interface_S_AXI_inst (
		// to Mac
		.tx_configuration_vector(tx_configuration_vector),
		.rx_configuration_vector(rx_configuration_vector),
		// From Mac and PCS PMA
		.interface_10g_status	(interface_10g_status),
		// Statistics Collection
		.counter_reset			(counter_reset),
		.bad_frames_counter		(bad_frames_counter),
		.good_frames_counter	(good_frames_counter),
		.bytes_from_mac			(bytes_from_mac),
		.rx_enqueued_pkts		(rx_enqueued_pkts),
		.rx_enqueued_bytes		(rx_enqueued_bytes),
		.rx_dequeued_pkts		(rx_dequeued_pkts),
		.rx_dequeued_bytes		(rx_dequeued_bytes),
		.tx_enqueued_pkts		(tx_enqueued_pkts),
		.tx_enqueued_bytes		(tx_enqueued_bytes),
		.tx_dequeued_pkts		(tx_dequeued_pkts),
		.tx_dequeued_bytes		(tx_dequeued_bytes),
		.rx_pkts_in_queue		(rx_pkts_in_queue),
		.rx_bytes_in_queue		(rx_bytes_in_queue),
		.tx_pkts_in_queue		(tx_pkts_in_queue),
		.tx_bytes_in_queue		(tx_bytes_in_queue),
		.rx_pkts_dropped		(rx_pkts_dropped),
		.rx_bytes_dropped		(rx_bytes_dropped),
		// Default AXI-Lite interface
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

	// Internal XGMII Interface
    (* syn_keep = "true", mark_debug = "true" *)
    wire  [63:0]   xgmii_txd_core;
    (* syn_keep = "true", mark_debug = "true" *)
    wire  [7:0]    xgmii_txc_core;
    (* syn_keep = "true", mark_debug = "true" *)
    wire  [63:0]   xgmii_rxd_core;
    (* syn_keep = "true", mark_debug = "true" *)
    wire  [7:0]    xgmii_rxc_core;
	// Reset Done signal from PCS_PMA Module
	(* syn_keep = "true", mark_debug = "true" *) 
	wire xphy_tx_resetdone;
	(* syn_keep = "true", mark_debug = "true" *) 
	wire xphy_rx_resetdone;
	(* syn_keep = "true", mark_debug = "true" *) 
	wire [7:0] xphy_core_status;

    // 10G Eth PCS PMA Core 
    nf_sume_10g_interface_pcs_pma_wrapper # (
        .USE_SHARED_TXUSRCLK(USE_SHARED_TXUSRCLK)
    ) nf_sume_10g_interface_pcs_pma_wrapper_inst (
        // Clocking and Reset
        .coreclk     (clk156),                       // System Clock for the Core 
        .dclk       (dclk),                         // DRP Clock (must be the same as clk156)   
        .qplllock   (qplllock),                     // QPLL lock signal
        .qplloutclk (qplloutclk),                   // QPLL clock
        .qplloutrefclk  (qplloutrefclk),            // QPLL refclk

		.txusrclk_shared(txusrclk_shared),			// Shared txusrclk Input
		.txusrclk_out(txusrclk_out),				// Shared txusrclk Output
     
        .areset     (areset),                       // Async (Master) Reset
        .areset_coreclk  (areset_clk156),            // Sync Reset in clk156 Domain
        .gttxreset  (gttxreset),                    // TX Reset in refclk domain
        .gtrxreset  (gtrxreset),                    // RX Reset in refclk domain
        .reset_counter_done (reset_counter_done),   // Indicate that 500ns have passed after configuration
        
        // XGMII - To MAC
        .xgmii_txd(xgmii_txd_core),
        .xgmii_txc(xgmii_txc_core),
        .xgmii_rxd(xgmii_rxd_core),
        .xgmii_rxc(xgmii_rxc_core),
        
        // Serial Data Ports
        .txp      (xphy_txp),    
        .txn      (xphy_txn),    
        .rxp      (xphy_rxp),    
        .rxn      (xphy_rxn),
        
        // Management Interface (MDIO) - Optional
        .mdc      (mdio_mdc),
        .mdio_in  (mdio_mdio_i),
        .mdio_out (mdio_mdio_o),
        .mdio_tri (mdio_mdio_t),
        .prtad    (C_PRTAD),
		.pma_pmd_type (C_PMA_PMD_TYPE),           
    
        // Optical Module Interface
        .signal_detect(~xphy_abs),  
        .tx_fault(xphy_tx_fault),
        .tx_disable(xphy_tx_disable),
            
        // Configuration and Status Vectors
        .tx_resetdone(xphy_tx_resetdone),                // TX reset done
        .rx_resetdone(xphy_rx_resetdone),                // RX reset done
        
        // Miscellaneous Signals
        .core_status(xphy_core_status)        // [7:6] Reserved
                                              //       [4] AN enable
                                              //         [3] AN complete
                                              //           [2] pmd signal detect (Training Done)
                                              //             [1] FEC signal OK
                                              //               [0] PCS Block Lock
    );
    
    // MAC AXIS Signals
    (* KEEP = "true" *)
    wire [63:0] tx_axis_mac_tdata;
    (* KEEP = "true" *)
    wire  [7:0] tx_axis_mac_tkeep;
    (* KEEP = "true" *)
    wire        tx_axis_mac_tvalid;
    (* KEEP = "true" *)
    wire        tx_axis_mac_tlast;
    (* KEEP = "true" *)
    wire        tx_axis_mac_tready;
  
    (* KEEP = "true" *)
    wire [63:0] rx_axis_mac_tdata;
    (* KEEP = "true" *)
    wire  [7:0] rx_axis_mac_tkeep;
    (* KEEP = "true" *)
    wire        rx_axis_mac_tvalid;
    (* KEEP = "true" *)
    wire        rx_axis_mac_tuser;
    (* KEEP = "true" *)
    wire        rx_axis_mac_tlast;

	(* syn_keep = "true", mark_debug = "true" *) 
	wire [1:0] mac_status_vector;

    assign rx_axis_fifo_aresetn_i = aresetn_clk156 | rx_axis_fifo_aresetn;
    assign tx_axis_fifo_aresetn_i = aresetn_clk156 | tx_axis_fifo_aresetn;

    // 10G Eth MAC
    nf_sume_10g_interface_mac nf10_sume_xge_mac_inst (
		// Reset Signals
        .reset(areset_clk156),                              // input reset
		// Clock Signals
        .tx_clk0(clk156),                                   // input tx_clk0
        .tx_dcm_locked(1'b1),                               // input tx_dcm_locked
        .rx_clk0(clk156),                                   // input rx_clk0
        .rx_dcm_locked(1'b1),                               // input rx_dcm_locked
        .tx_ifg_delay(8'd0),                                // input [7 : 0] tx_ifg_delay
		// TX AXIS Signal, From User to MAC
        .tx_axis_aresetn(aresetn_clk156),                   // input tx_axis_aresetn
        .tx_axis_tdata(tx_axis_mac_tdata),                  // input [63 : 0] tx_axis_tdata
        .tx_axis_tvalid(tx_axis_mac_tvalid),                // input tx_axis_tvalid
        .tx_axis_tlast(tx_axis_mac_tlast),                  // input tx_axis_tlast
        .tx_axis_tuser(1'b0),                               // input [0 : 0] tx_axis_tuser
        .tx_axis_tkeep(tx_axis_mac_tkeep),                  // input [7 : 0] tx_axis_tkeep
        .tx_axis_tready(tx_axis_mac_tready),                // output tx_axis_tready
		// RX AXIS Signal, From MAC to User
        .rx_axis_aresetn(aresetn_clk156),                   // input rx_axis_aresetn
        .rx_axis_tdata(rx_axis_mac_tdata),                  // output [7 : 0] rx_axis_tkeep
        .rx_axis_tkeep(rx_axis_mac_tkeep),                  // output [63 : 0] rx_axis_tdata
        .rx_axis_tvalid(rx_axis_mac_tvalid),                // output rx_axis_tvalid
        .rx_axis_tuser(rx_axis_mac_tuser),                  // output rx_axis_tuser
        .rx_axis_tlast(rx_axis_mac_tlast),                  // output rx_axis_tlast

 		// Statistics Vectors 
        .tx_statistics_vector(tx_statistics_vector),        // output [25 : 0] tx_statistics_vector
        .tx_statistics_valid(tx_statistics_valid),          // output tx_statistics_valid
        .rx_statistics_vector(rx_statistics_vector),        // output [29 : 0] rx_statistics_vector
        .rx_statistics_valid(rx_statistics_valid),          // output rx_statistics_valid

		// No Pause
        .pause_val(16'h0),                                  // input [15 : 0] pause_val
        .pause_req(1'b0),                                   // input pause_req

		// Configuration Vectors - To Register Interface
        .tx_configuration_vector(tx_configuration_vector),  // input [79 : 0] tx_configuration_vector
        .rx_configuration_vector(rx_configuration_vector),  // input [79 : 0] rx_configuration_vector
		// Status Vector - To Register Interface
        .status_vector(mac_status_vector),                  // output [1 : 0] status_vector
        // Internal XGMII Interface - Goes to PCS PMA Core
        .xgmii_txd(xgmii_txd_core),                         // output [63 : 0] xgmii_txd
        .xgmii_txc(xgmii_txc_core),                         // output [7 : 0] xgmii_txc
        .xgmii_rxd(xgmii_rxd_core),                         // input [63 : 0] xgmii_rxd
        .xgmii_rxc(xgmii_rxc_core)                          // input [7 : 0] xgmii_rxc
    );

	// 10G Eth MAC AXIS FIFO
	nf_sume_10g_interface_mac_xgmac_fifo #(FIFO_SIZE,FIFO_SIZE) 
	nf_sume_10g_interface_mac_fifo  (
		// AXIS Interface for User
        .tx_axis_fifo_aresetn(tx_axis_fifo_aresetn_i),
        .tx_axis_fifo_aclk   (tx_axis_aclk),
        .tx_axis_fifo_tdata  (tx_axis_tdata),
        .tx_axis_fifo_tkeep  (tx_axis_tkeep),
        .tx_axis_fifo_tvalid (tx_axis_tvalid),
        .tx_axis_fifo_tlast  (tx_axis_tlast),
        .tx_axis_fifo_tready (tx_axis_tready),
        .tx_fifo_full        (),
        .tx_fifo_status (),
        .rx_axis_fifo_aresetn(rx_axis_fifo_aresetn_i),
        .rx_axis_fifo_aclk   (rx_axis_aclk),
        .rx_axis_fifo_tdata  (rx_axis_tdata),
        .rx_axis_fifo_tkeep  (rx_axis_tkeep),
        .rx_axis_fifo_tvalid (rx_axis_tvalid),
        .rx_axis_fifo_tlast  (rx_axis_tlast),
        .rx_axis_fifo_tready (rx_axis_tready),
        .rx_fifo_status (),
		// AXIS Interface to MAC
        .tx_axis_mac_aresetn (aresetn_clk156),
        .tx_axis_mac_aclk    (clk156),
        .tx_axis_mac_tdata   (tx_axis_mac_tdata),
        .tx_axis_mac_tkeep   (tx_axis_mac_tkeep),
        .tx_axis_mac_tvalid  (tx_axis_mac_tvalid),
        .tx_axis_mac_tlast   (tx_axis_mac_tlast),
        .tx_axis_mac_tready  (tx_axis_mac_tready),
        .rx_axis_mac_aresetn (aresetn_clk156),
        .rx_axis_mac_aclk    (clk156),
        .rx_axis_mac_tdata   (rx_axis_mac_tdata),
        .rx_axis_mac_tkeep   (rx_axis_mac_tkeep),
        .rx_axis_mac_tvalid  (rx_axis_mac_tvalid),
        .rx_axis_mac_tlast   (rx_axis_mac_tlast),
        .rx_axis_mac_tuser   (rx_axis_mac_tuser),
        .rx_fifo_full        (rx_axis_mac_fifo_full)
    );

/* Statistics Collection Logic
 * -------------------------------------------------------------------
 */
	assign interface_10g_status = {8'd0, xphy_core_status, 14'd0, mac_status_vector};

	wire cnt_rst;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] bytes_from_mac_sig;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] pkts_from_mac_sig;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] bad_frames_counter_sig;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] good_frames_counter_sig;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] rx_enqueued_pkts_sig;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] rx_enqueued_bytes_sig;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] rx_dequeued_pkts_sig;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] rx_dequeued_bytes_sig;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] tx_enqueued_pkts_sig;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] tx_enqueued_bytes_sig;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] tx_dequeued_pkts_sig;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] tx_dequeued_bytes_sig;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] rx_pkts_in_queue_sig;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] rx_bytes_in_queue_sig;
	reg  [C_S_AXI_DATA_WIDTH-1 : 0] tx_pkts_in_queue_sig;

	assign cnt_rst = (~ s_axi_aresetn) | counter_reset[0];

	// Count good/bad frames
	always @ (posedge clk156)
	begin
		if (cnt_rst == 1'b1)
			good_frames_counter_sig <= 'd0;
		else if (rx_axis_mac_tlast == 1'b1 && rx_axis_mac_tuser == 1'b1)
			good_frames_counter_sig <= good_frames_counter_sig + 1'b1;
		else
			good_frames_counter_sig <= good_frames_counter_sig;
	end

	always @ (posedge clk156)
	begin
		if (cnt_rst == 1'b1)
			bad_frames_counter_sig <= 'd0;
		else if (rx_axis_mac_tlast == 1'b1 && rx_axis_mac_tuser == 1'b0)
			bad_frames_counter_sig <= bad_frames_counter_sig + 1'b1;
		else
			bad_frames_counter_sig <= bad_frames_counter_sig;
	end

	// Bytes Interpretation
	reg [3:0] rx_mac_byte_num;
	reg [3:0] rx_byte_num;
	reg [3:0] tx_mac_byte_num;
	reg [3:0] tx_byte_num;

	always @ (rx_axis_mac_tkeep)
	begin
		case(rx_axis_mac_tkeep)
			8'h01: rx_mac_byte_num = 4'd1;
			8'h03: rx_mac_byte_num = 4'd2;
			8'h07: rx_mac_byte_num = 4'd3;
			8'h0F: rx_mac_byte_num = 4'd4;
			8'h1F: rx_mac_byte_num = 4'd5;
			8'h3F: rx_mac_byte_num = 4'd6;
			8'h7F: rx_mac_byte_num = 4'd7;
			8'hFF: rx_mac_byte_num = 4'd8;
			default: rx_mac_byte_num = 4'd0;
		endcase
	end

	always @ (tx_axis_mac_tkeep)
	begin
		case(tx_axis_mac_tkeep)
			8'h01: tx_mac_byte_num = 4'd1;
			8'h03: tx_mac_byte_num = 4'd2;
			8'h07: tx_mac_byte_num = 4'd3;
			8'h0F: tx_mac_byte_num = 4'd4;
			8'h1F: tx_mac_byte_num = 4'd5;
			8'h3F: tx_mac_byte_num = 4'd6;
			8'h7F: tx_mac_byte_num = 4'd7;
			8'hFF: tx_mac_byte_num = 4'd8;
			default: tx_mac_byte_num = 4'd0;
		endcase
	end

	always @ (rx_axis_tkeep)
	begin
		case(rx_axis_tkeep)
			8'h01: rx_byte_num = 4'd1;
			8'h03: rx_byte_num = 4'd2;
			8'h07: rx_byte_num = 4'd3;
			8'h0F: rx_byte_num = 4'd4;
			8'h1F: rx_byte_num = 4'd5;
			8'h3F: rx_byte_num = 4'd6;
			8'h7F: rx_byte_num = 4'd7;
			8'hFF: rx_byte_num = 4'd8;
			default: rx_byte_num = 4'd0;
		endcase
	end

	always @ (tx_axis_tkeep)
	begin
		case(tx_axis_tkeep)
			8'h01: tx_byte_num = 4'd1;
			8'h03: tx_byte_num = 4'd2;
			8'h07: tx_byte_num = 4'd3;
			8'h0F: tx_byte_num = 4'd4;
			8'h1F: tx_byte_num = 4'd5;
			8'h3F: tx_byte_num = 4'd6;
			8'h7F: tx_byte_num = 4'd7;
			8'hFF: tx_byte_num = 4'd8;
			default: tx_byte_num = 4'd0;
		endcase
	end

	// counts bytes, pkts from MAC
	// Bytes from MAC does not need to care about dropped packets
	always @ (posedge clk156)
	begin
		if (cnt_rst == 1'b1)
			bytes_from_mac_sig <= 'd0;
		else if (rx_axis_mac_tvalid == 1'b1)
			bytes_from_mac_sig <= bytes_from_mac_sig + rx_mac_byte_num;
		else
			bytes_from_mac_sig <= bytes_from_mac_sig;
	end

	always @ (posedge clk156)
	begin
		if (cnt_rst == 1'b1)
			pkts_from_mac_sig <= 'd0;
		else if (rx_axis_mac_tlast == 1'b1)
			pkts_from_mac_sig <= pkts_from_mac_sig + 1'b1;
		else
			pkts_from_mac_sig <= pkts_from_mac_sig;
	end

	// Rx Check if FIFO Full before packet ends
	// Signal is sychronous to clk156 and kept to be high till the end of frame
	// THere is one clock delay
	reg full_before_eof;

	always @ (posedge clk156)
	begin
		if (cnt_rst == 1'b1)
			full_before_eof <= 1'b0;
		else if (rx_axis_mac_tvalid == 1'b1 && rx_axis_mac_fifo_full == 1'b1)
			full_before_eof <= 1'b1;
		else if (rx_axis_mac_tlast == 1'b1)
			full_before_eof <= 1'b0;
		else
			full_before_eof <= full_before_eof;
	end

	// Rx Enqueue/Dequeue Counters
	// Enqueue - MAC Side
	always @ (posedge clk156)
	begin
		if (cnt_rst == 1'b1)
			rx_enqueued_pkts_sig <= 'd0;
		// Add one if 
		// 1. Fifo not full (Packet Dropped)
		// 2. No Bad Frames (Packet Dropped)
		else if (rx_axis_mac_tlast == 1'b1 && rx_axis_mac_tuser == 1'b1 && 
					rx_axis_mac_fifo_full == 1'b0 && full_before_eof == 1'b0)
			rx_enqueued_pkts_sig <= rx_enqueued_pkts_sig + 1'b1;
		else
			rx_enqueued_pkts_sig <= rx_enqueued_pkts_sig;
	end

	// Need to hold temporary bytes count incase packet gets dropped
	reg [32:0] rx_bytes_tmp;

	always @ (posedge clk156)
	begin
		if (cnt_rst == 1'b1)
			rx_bytes_tmp <= 'd0;
		else if (rx_axis_mac_tvalid == 1'b1)
			rx_bytes_tmp <= rx_bytes_tmp + rx_mac_byte_num;
		else if (rx_axis_mac_tlast == 1'b1)
			rx_bytes_tmp <= 'd0;
	end

	always @ (posedge clk156)
	begin
		if (cnt_rst == 1'b1)
			rx_enqueued_bytes_sig <= 'd0;
		else if (rx_axis_mac_tlast == 1'b1 && rx_axis_mac_tuser == 1'b1 && 
					rx_axis_mac_fifo_full == 1'b0 && full_before_eof == 1'b0)
			rx_enqueued_bytes_sig <= rx_enqueued_bytes_sig + rx_bytes_tmp;
		else
			rx_enqueued_bytes_sig <= rx_enqueued_bytes_sig;
	end

	// Dequeue - User Side
	always @ (posedge rx_axis_aclk)
	begin
		if (cnt_rst == 1'b1)
			rx_dequeued_pkts_sig <= 'd0;
		else if (rx_axis_tlast == 1'b1)
			rx_dequeued_pkts_sig <= rx_dequeued_pkts_sig + 1'b1;
		else
			rx_dequeued_pkts_sig <= rx_dequeued_pkts_sig;
	end

	always @ (posedge rx_axis_aclk)
	begin
		if (cnt_rst == 1'b1)
			rx_dequeued_bytes_sig <= 'd0;
		else if (rx_axis_tvalid == 1'b1 && rx_axis_tready == 1'b1)
			rx_dequeued_bytes_sig <= rx_dequeued_bytes_sig + rx_byte_num;
		else
			rx_dequeued_bytes_sig <= rx_dequeued_bytes_sig;
	end

	// Tx Enqueue/Dequeue Counters
	// Enqueue - MAC Side
	always @ (posedge clk156)
	begin
		if (cnt_rst == 1'b1)
			tx_enqueued_pkts_sig <= 'd0;
		else if (tx_axis_mac_tlast == 1'b1)
			tx_enqueued_pkts_sig <= tx_enqueued_pkts_sig + 1'b1;
		else
			tx_enqueued_pkts_sig <= tx_enqueued_pkts_sig;
	end

	always @ (posedge clk156)
	begin
		if (cnt_rst == 1'b1)
			tx_enqueued_bytes_sig <= 'd0;
		else if (tx_axis_mac_tvalid == 1'b1 && tx_axis_mac_tready == 1'b1)
			tx_enqueued_bytes_sig <= tx_enqueued_bytes_sig + tx_mac_byte_num;
		else
			tx_enqueued_bytes_sig <= tx_enqueued_bytes_sig;
	end

	// Dequeue - User Side
	always @ (posedge tx_axis_aclk)
	begin
		if (cnt_rst == 1'b1)
			tx_dequeued_pkts_sig <= 'd0;
		else if (tx_axis_tlast == 1'b1)
			tx_dequeued_pkts_sig <= tx_dequeued_pkts_sig + 1'b1;
		else
			tx_dequeued_pkts_sig <= tx_dequeued_pkts_sig;
	end

	always @ (posedge tx_axis_aclk)
	begin
		if (cnt_rst == 1'b1)
			tx_dequeued_bytes_sig <= 'd0;
		else if (tx_axis_tvalid == 1'b1 && tx_axis_tready == 1'b1)
			tx_dequeued_bytes_sig <= tx_dequeued_bytes_sig + tx_byte_num;
		else
			tx_dequeued_bytes_sig <= tx_dequeued_bytes_sig;
	end

	// Register Synchronization
	always @ (posedge s_axi_aclk)
	begin
		if (cnt_rst == 1'b1)
		begin
			good_frames_counter <= 'd0;
			bad_frames_counter <= 'd0;
			bytes_from_mac <= 'd0;
			rx_enqueued_pkts <= 'd0;
			rx_enqueued_bytes <= 'd0;
			rx_dequeued_pkts <= 'd0;
			rx_dequeued_bytes <= 'd0;
			tx_enqueued_pkts <= 'd0;
			tx_enqueued_bytes <= 'd0;
			tx_dequeued_pkts <= 'd0;
			tx_dequeued_bytes <= 'd0;
			rx_pkts_in_queue <= 'd0;
			rx_bytes_in_queue <= 'd0;
			tx_pkts_in_queue <= 'd0;
			tx_bytes_in_queue <= 'd0;
			rx_pkts_dropped <= 'd0;
			rx_bytes_dropped <= 'd0;
		end
		else
		begin
			good_frames_counter <= good_frames_counter_sig;
			bad_frames_counter <= bad_frames_counter_sig;
			rx_enqueued_pkts <= rx_enqueued_pkts_sig;
			rx_enqueued_bytes <= rx_enqueued_bytes_sig;
			rx_dequeued_pkts <= rx_dequeued_pkts_sig;
			rx_dequeued_bytes <= rx_dequeued_bytes_sig;
			tx_enqueued_pkts <= tx_enqueued_pkts_sig;
			tx_enqueued_bytes <= tx_enqueued_bytes_sig;
			tx_dequeued_pkts <= tx_dequeued_pkts_sig;
			tx_dequeued_bytes <= tx_dequeued_bytes_sig;
			rx_pkts_in_queue <= rx_enqueued_pkts_sig - rx_dequeued_pkts_sig;
			rx_bytes_in_queue <= rx_enqueued_bytes_sig - rx_dequeued_pkts_sig;
			tx_pkts_in_queue <= tx_enqueued_pkts_sig - tx_dequeued_pkts_sig;
			tx_bytes_in_queue <= tx_enqueued_bytes_sig - tx_dequeued_bytes_sig;
			rx_pkts_dropped <= pkts_from_mac_sig - rx_enqueued_pkts_sig;
			rx_bytes_dropped <= bytes_from_mac_sig - rx_enqueued_bytes_sig;
			bytes_from_mac <= bytes_from_mac_sig;
		end
	end
 
/* Tx/Rx LEDs logic
 * -------------------------------------------------------------------
 * Blink LEDs at AXI Clock Frequency / 2^23 when data is transmitted.
 * Data transmission is defined by checking tvalid and tready signal are both high
 */
    wire xge_link_up;
    wire tx_transmitting;
    wire rx_transmitting;
    reg led_clk;
    reg [25:0] led_clk_cnt;
    
    always @ (posedge s_axi_aclk)
    begin
        if(s_axi_aresetn == 1'b0)
        begin
            led_clk_cnt <= 'd0;
       end
       else
       begin
           led_clk_cnt <= led_clk_cnt + 1'b1;
       end
    end
    
    assign xge_link_up = qplllock & reset_counter_done & xphy_tx_resetdone & xphy_rx_resetdone;
    assign tx_transmitting = tx_axis_tvalid & tx_axis_tready;
    assign rx_transmitting = rx_axis_tvalid & rx_axis_tready;

    assign tx_led = (tx_transmitting == 1'b1) ? led_clk_cnt[23] : xge_link_up;
    assign rx_led = (rx_transmitting == 1'b1) ? led_clk_cnt[23] : xge_link_up;
 
	endmodule
