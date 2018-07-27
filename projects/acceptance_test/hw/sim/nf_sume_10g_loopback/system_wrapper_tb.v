//////////////////////////////////////////////////////////////////////////////
//  
// Copyright (c) 2015 Digilent Inc.
// Copyright (c) 2015 Tinghui Wang (Steve)
// All rights reserved.
//
// File:
// system_wrapper_tb.v
//
// Project:
// loopback_test
//
// Author:
// Tinghui Wang (Steve)
//
// Description:
// Simulation testbench for loopback test
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

`timescale 100ps / 1ps

module system_tb;

wire eth0_xphy_rxn;
wire eth0_xphy_rxp;
wire eth0_xphy_txn;
wire eth0_xphy_txp;

wire eth0_xphy_abs;
wire eth0_xphy_tx_disable;
wire eth0_xphy_tx_fault;

wire eth1_xphy_rxn;
wire eth1_xphy_rxp;
wire eth1_xphy_txn;
wire eth1_xphy_txp;

wire eth1_xphy_abs;
wire eth1_xphy_tx_disable;
wire eth1_xphy_tx_fault;

wire eth2_xphy_rxn;
wire eth2_xphy_rxp;
wire eth2_xphy_txn;
wire eth2_xphy_txp;

wire eth2_xphy_abs;
wire eth2_xphy_tx_disable;
wire eth2_xphy_tx_fault;

wire eth3_xphy_rxn;
wire eth3_xphy_rxp;
wire eth3_xphy_txn;
wire eth3_xphy_txp;

wire eth3_xphy_abs;
wire eth3_xphy_tx_disable;
wire eth3_xphy_tx_fault;

wire iic_fpga_scl_io;
wire iic_fpga_sda_io;
wire [1:0] iic_reset;

wire uart_rxd;
wire uart_txd;

reg reset;

/* Clock Generation */

/* Sysclk: 200MHz - 5 ns */
reg fpga_sysclk_n = 1'b0;
reg fpga_sysclk_p = 1'b1;

always
begin
    #25 fpga_sysclk_n <= ~fpga_sysclk_n;
        fpga_sysclk_p <= ~fpga_sysclk_p;
end

/* Xge Reference Clock: 156.25MHz - 6.4 ns */
reg sfp_refclk_n = 1'b0;
reg sfp_refclk_p = 1'b1;

always
begin
    #32 sfp_refclk_n <= ~sfp_refclk_n;
        sfp_refclk_p <= ~sfp_refclk_p;
end

/* Ethernet Loopback Connection */
assign eth1_xphy_rxp = eth0_xphy_txp;
assign eth1_xphy_rxn = eth0_xphy_txn;
assign eth0_xphy_rxp = eth1_xphy_txp;
assign eth0_xphy_rxn = eth1_xphy_txn;

assign eth2_xphy_rxp = eth3_xphy_txp;
assign eth2_xphy_rxn = eth3_xphy_txn;
assign eth3_xphy_rxp = eth2_xphy_txp;
assign eth3_xphy_rxn = eth2_xphy_txn;

assign eth0_xphy_abs = 1'b0;
assign eth1_xphy_abs = 1'b0;
assign eth2_xphy_abs = 1'b0;
assign eth3_xphy_abs = 1'b0;
assign eth0_xphy_tx_fault = 1'b0;
assign eth1_xphy_tx_fault = 1'b0;
assign eth2_xphy_tx_fault = 1'b0;
assign eth3_xphy_tx_fault = 1'b0;

integer i;

system_wrapper uut (
       .eth0_xphy_rxn		  (eth0_xphy_rxn),
       .eth0_xphy_rxp		  (eth0_xphy_rxp),
       .eth0_xphy_txn		  (eth0_xphy_txn),
       .eth0_xphy_txp		  (eth0_xphy_txp),
       .eth0_xphy_abs		  (eth0_xphy_abs),
       .eth0_xphy_tx_disable  (eth0_xphy_tx_disable),
       .eth0_xphy_tx_fault	  (eth0_xphy_tx_fault),
       .eth1_xphy_rxn		  (eth1_xphy_rxn),
       .eth1_xphy_rxp		  (eth1_xphy_rxp),
       .eth1_xphy_txn		  (eth1_xphy_txn),
       .eth1_xphy_txp		  (eth1_xphy_txp),
       .eth1_xphy_abs		  (eth1_xphy_abs),
       .eth1_xphy_tx_disable  (eth1_xphy_tx_disable),
       .eth1_xphy_tx_fault	  (eth1_xphy_tx_fault),
       .eth2_xphy_rxn		  (eth2_xphy_rxn),
       .eth2_xphy_rxp		  (eth2_xphy_rxp),
       .eth2_xphy_txn		  (eth2_xphy_txn),
       .eth2_xphy_txp		  (eth2_xphy_txp),
       .eth2_xphy_abs		  (eth2_xphy_abs),
       .eth2_xphy_tx_disable  (eth2_xphy_tx_disable),
       .eth2_xphy_tx_fault	  (eth2_xphy_tx_fault),
       .eth3_xphy_rxn		  (eth3_xphy_rxn),
       .eth3_xphy_rxp		  (eth3_xphy_rxp),
       .eth3_xphy_txn		  (eth3_xphy_txn),
       .eth3_xphy_txp		  (eth3_xphy_txp),
       .eth3_xphy_abs		  (eth3_xphy_abs),
       .eth3_xphy_tx_disable  (eth3_xphy_tx_disable),
       .eth3_xphy_tx_fault	  (eth3_xphy_tx_fault),
       .iic_fpga_scl_io		  (iic_fpga_scl_io),
       .iic_fpga_sda_io		  (iic_fpga_sda_io),
       .iic_reset			  (iic_reset),
       .reset				  (reset),
       .fpga_sysclk_n		  (fpga_sysclk_n),
       .fpga_sysclk_p		  (fpga_sysclk_p),
       .uart_rxd			  (uart_rxd),
       .uart_txd			  (uart_txd),
       .sfp_refclk_n		  (sfp_refclk_n),
       .sfp_refclk_p		  (sfp_refclk_p)
       );

       /* Reset System Reset */
       initial
       begin
           #10 reset = 1'b1;
           #200 reset = 1'b0;
       end

endmodule
