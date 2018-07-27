/////////////////////////////////////////////////////////////////////////////
//  
// Copyright (c) 2015 Digilent Inc.
// All rights reserved.
//
// File:
// nf_sume_10g_interface_pcs_pma_wrapper.v
//  
// Library:
// hw/std/nf_sume_10g_interface
//
// Author:
// Tinghui Wang (Steve)
//
// Description:
// Wrapper for NetFPGA-SUME 10Gb Ethernet PCS PMA Core
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

`timescale 1ns / 1ps

module nf_sume_10g_interface_pcs_pma_wrapper # (
	parameter USE_SHARED_TXUSRCLK = "TRUE"
	) (
    // Global Clock Input
    input           coreclk,
    input           dclk,
    input           qplllock,
    input           qplloutclk,
    input           qplloutrefclk,
	input           txusrclk_shared,
	output          txusrclk_out,
    // Global Reset Inputs
    input           areset,
    input           areset_coreclk,
    input           gttxreset,
    input           gtrxreset,
    input           reset_counter_done,
    
    // Serial Interface
    output          txp,
    output          txn,
    input           rxp,
    input           rxn,

    // Internal XGMII Interface
    input  [63:0]   xgmii_txd,
    input  [7:0]    xgmii_txc,
    output [63:0]   xgmii_rxd,
    output [7:0]    xgmii_rxc,
    // MDIO Interface
    input           mdc,
    input           mdio_in,
    output          mdio_out,
    output          mdio_tri,
    input  [2:0]    pma_pmd_type,
    
    // Status and Miscellaneous Signals
    input  [4 : 0]  prtad,
    output [7 : 0]  core_status,
    output          tx_resetdone,
    output          rx_resetdone,
    input           signal_detect,
    input           tx_fault,
    output          tx_disable
    );

    wire            txusrclk;
    wire            txusrclk2;
    wire            txoutclk;
    reg             qplllock_txusrclk2;
    reg             gttxreset_txusrclk2;
    
    reg             txuserrdy;

/* Decide whether txusrclk is shared or not */
generate if (USE_SHARED_TXUSRCLK == "TRUE")
	begin : txusrclk_bypass
		assign txusrclk = txusrclk_shared;
		assign txusrclk_out = 1'b0;
	end
else
	begin
		BUFG tx322clk_bufg_i
		(
		    .I (txoutclk),
		    .O (txusrclk)
		);
		assign txusrclk_out = txusrclk;
	end
endgenerate

    assign txusrclk2 = txusrclk;

	/* Synchronize qplllock and gttxreset signals */
	(* shreg_extract = "no", ASYNC_REG = "TRUE" *)
	reg [3:0] qplllock_txusrclk2_sync_reg;
	(* shreg_extract = "no", ASYNC_REG = "TRUE" *)
	reg [3:0] gttxreset_txusrclk2_sync_reg;

	always @(posedge txusrclk2 or negedge qplllock)
	begin
		if (!qplllock)
			qplllock_txusrclk2_sync_reg <= { 4{1'b0} };
		else
			qplllock_txusrclk2_sync_reg <= {qplllock_txusrclk2_sync_reg[2:0], qplllock};
	end

	always @(posedge txusrclk2)
	begin
		qplllock_txusrclk2 <= qplllock_txusrclk2_sync_reg[3];
	end
	
	always @(posedge txusrclk2 or posedge gttxreset)
	begin
		if (gttxreset)
			gttxreset_txusrclk2_sync_reg <= { 4{1'b1} };
		else
			gttxreset_txusrclk2_sync_reg <= {gttxreset_txusrclk2_sync_reg[2:0], gttxreset};
	end

	always @(posedge txusrclk2)
	begin
		gttxreset_txusrclk2 <= gttxreset_txusrclk2_sync_reg[3];
	end

    always @(posedge txusrclk2 or posedge gttxreset_txusrclk2)
    begin
        if(gttxreset_txusrclk2)
            txuserrdy <= 1'b0;
        else
            txuserrdy <= qplllock_txusrclk2;
    end

    // 10G Eth PCS PMA Core 
     nf_sume_10g_interface_pcs_pma nf_sume_10g_interface_pcs_pma_inst (
     // XGMII - MAC Side Interface
     .xgmii_txd(xgmii_txd),
     .xgmii_txc(xgmii_txc),
     .xgmii_rxd(xgmii_rxd),
     .xgmii_rxc(xgmii_rxc),
     
     // Serial Data Ports
     .txp      (txp),    
     .txn      (txn),    
     .rxp      (rxp),    
     .rxn      (rxn),

     // Optical Module Interface
     .signal_detect(signal_detect),  
     .tx_fault(tx_fault),
     .tx_disable(tx_disable),
     
     // Management Interface (MDIO) - Optional
     .mdc      (mdc),
     .mdio_in  (mdio_in),
     .mdio_out (mdio_out),
     .mdio_tri (mdio_tri),                 
     .prtad    (prtad),
     
     // Configuration and Status Vectors

     // Clocking and Reset
     .coreclk     (coreclk),                       // System Clock for the Core 
     .dclk       (dclk),                         // DRP Clock (must be the same as clk156)
     .txusrclk   (txusrclk),                     // Tx Clock, Derived from TXCLKOUT
     .txusrclk2  (txusrclk2),                    // Tx Clock, Derived from TXCLKOUT
     .txoutclk   (txoutclk),                     // TXCLKOUT

     .areset     (areset),                       // Async (Master) Reset
     .areset_coreclk  (areset_coreclk),            // Sync Reset in clk156 Domain

     .gttxreset  (gttxreset),                    // TX Reset in refclk domain
     .gtrxreset  (gtrxreset),                    // RX Reset in refclk domain
     .qplllock   (qplllock),                     // QPLL lock signal
     .qplloutclk (qplloutclk),                   // QPLL clock
     .qplloutrefclk  (qplloutrefclk),            // QPLL refclk

     .reset_counter_done (reset_counter_done),   // Indicate that 500ns have passed after configuration
     .tx_resetdone(tx_resetdone),                // TX reset done
     .rx_resetdone(rx_resetdone),                // RX reset done
     
     .txuserrdy  (txuserrdy),                    // ! Not Mentioned in Data Sheet
     
     // Miscellaneous Signals
     .pma_pmd_type (pma_pmd_type),               // Define PMA/PMD Type (BASE-R Only)
                                                 //   111 = 10GBASE-SR
                                                 //   110 = 10GBASE-LR
                                                 //   101 = 10GBASE-ER
     .core_status(core_status)                   // [7:6] Reserved
                                                 //     [5] an_link_up (auto-negotiation)
                                                 //       [4] AN enable
                                                 //         [3] AN complete
                                                 //           [2] pmd signal detect (Training Done)
                                                 //             [1] FEC signal OK
                                                 //               [0] PCS Block Lock
     );
    
endmodule

