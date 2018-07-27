//
// Copyright (C) 2015 Digilent Inc.
// All rights reserved.
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

`timescale 1 ps / 1 ps

	module d_clkfreq_detector #
	(
		// Users to add parameters here
        parameter integer C_AXI_CLK_FREQ    = 100000000,
		// User parameters ends
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S_AXI
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
        input wire  ref_clk,
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
	
	wire areset;
	reg [31:0] freq_reg;
	
// Instantiation of Axi Bus Interface S_AXI
	d_clkfreq_detector_S_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
	) d_clkfreq_detector_S_AXI_inst (
	    .areset(areset),
	    .freq_reg(freq_reg),
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

	// Add user logic here
    
    // Generate Synchronized Reset
    reg reset_refclk_i;
    reg reset_refclk;
    
    always @ (posedge ref_clk)
    begin
        reset_refclk_i <= areset;
        reset_refclk <= reset_refclk_i;
    end
    
    // Latching Signal
    reg [31:0] s_axi_aclk_counter;
    reg counter_latch_axiclk;
    
    always @ (posedge s_axi_aclk)
    begin
        if(s_axi_aresetn == 1'b0)
        begin
            s_axi_aclk_counter <= 'd0;
            counter_latch_axiclk <= 1'b0;
        end
        else
        begin
            if(s_axi_aclk_counter == C_AXI_CLK_FREQ)
            begin
                s_axi_aclk_counter <= 'd0;
                counter_latch_axiclk <= 1'b1;
            end
            else
            begin
                s_axi_aclk_counter <= s_axi_aclk_counter + 1'b1;
                counter_latch_axiclk <= 1'b0;
            end
        end
    end
    
    // Synchronizing Latch Signal to refclk
    reg counter_latch_refclk;
    reg counter_latch_refclk_d;
    reg counter_latch_sig_refclk;
    
    always @ (posedge ref_clk)
    begin
        if(reset_refclk == 1'b1)
            counter_latch_refclk <= 1'b0;
        else if (counter_latch_axiclk == 1'b1)
            counter_latch_refclk <= 1'b1;
        else
            counter_latch_refclk <= 1'b0;
    end
    
    always @ (posedge ref_clk)
    begin
        counter_latch_refclk_d <= counter_latch_refclk;
    end
    
    always @ (posedge ref_clk)
    begin
        if(reset_refclk == 1'b1)
            counter_latch_sig_refclk <= 1'b1;
        else
            counter_latch_sig_refclk <= counter_latch_refclk_d & ~counter_latch_refclk;
    end
    
    // Counter Refclk Frequency
    reg [31:0] refclk_cycle_count;
    reg [31:0] refclk_freq;

    always @ (posedge ref_clk)
    begin
        if(reset_refclk == 1'b1)
        begin
            refclk_cycle_count <= 'd0;
            refclk_freq <= 'd0;
        end
        else if (counter_latch_sig_refclk == 1'b1)
        begin
            refclk_freq <= refclk_cycle_count;
            refclk_cycle_count <= 'd0;
        end
        else
        begin
            refclk_cycle_count <= refclk_cycle_count + 1'b1;
            refclk_freq <= refclk_freq;
        end
    end
    
    // Sync back to axiclk domain
    always @ (posedge s_axi_aclk)
    begin
        freq_reg <= refclk_freq;
    end
    
    // User logic ends

	endmodule
