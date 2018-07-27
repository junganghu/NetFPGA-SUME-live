//////////////////////////////////////////////////////////////////////////////
//  
// Copyright (c) 2015 Digilent Inc.
// All rights reserved.
//
// File:
// nf_sume_xge_shared_logic.v
//  
// Library:
// hw/std/cores/nf_sume_10g_interface_shared_logic_1.0
//
// Author:
// Tinghui Wang (Steve)
//
// Description:
// 10GBASE-R shared clocking and reset logic which can be shared between multiple xge interfacores
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

module nf_sume_10g_interface_shared_logic(
    // GTX REFCLK
    input refclk,
    // Async Reset
    input areset,
    
    // clk156, DRP clock for PMA/PCS
    output clk156,
    output dclk,
    // Sync Reset in clk156 Domain
    output areset_clk156,
    // Sync Reset for GTX_TX GTX_RX
    output gttxreset,
    output gtrxreset,
    output reset_counter_done,
    // QPLL Signals
    output qplllock,
    output qplloutclk,
    output qplloutrefclk
    );
    
    reg [7:0] reset_counter = 8'h00;
    reg [3:0] reset_pulse = 4'b1110;

    // BUFG for clk156 (Shared by all PMA_PCS core)
    BUFG clk156_bufg_inst 
    (
        .I     (refclk),
        .O     (clk156) 
    );
    
    // DRP Clock (must be the same as clk156)
    assign dclk = clk156;
    
    // Async Reset Synchronizer
    nf_sume_10g_pcs_pma_ff_synchronizer_rst2 
      #(
        .C_NUM_SYNC_REGS(4),
        .C_RVAL(1'b1)) 
    areset_clk156_sync_i
      (
       .clk(clk156),
       .rst(areset),
       .data_in(1'b0),
       .data_out(areset_clk156)
      );

    // Hold off release the GT resets until 500ns after configuration.
    // 128 ticks at 6.4ns period will be >> 500 ns.
    always @(posedge clk156)
    begin
      if (!reset_counter[7])
        reset_counter   <=   reset_counter + 1'b1;   
      else
        reset_counter   <=   reset_counter;
    end
    
    always @(posedge clk156)
    begin
      if (areset_clk156 == 1'b1)  
        reset_pulse   <=   4'b1110;
      else if(reset_counter[7])
        reset_pulse   <=   {1'b0, reset_pulse[3:1]};
    end
    assign   qpllreset  =     reset_pulse[0];
    assign   gttxreset  =     reset_pulse[0];
    assign   gtrxreset  =     reset_pulse[0];  

    assign reset_counter_done = reset_counter[7];

    // Instantiate the 10GBASER/KR GT Common block
    nf_sume_10g_pcs_pma_gt_common # (
        .WRAPPER_SIM_GTRESET_SPEEDUP("TRUE") ) //Does not affect hardware
    nf_sume_10g_pcs_pma_gt_common_block
      (
       .refclk(refclk),
       .qpllreset(qpllreset),
       .qplllock(qplllock),
       .qplloutclk(qplloutclk),
       .qplloutrefclk(qplloutrefclk)
      );
      
endmodule
