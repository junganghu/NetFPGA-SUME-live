/***************************************************************************
*
* Copyright (c) 2015 Digilent Inc.
* Copyright (C) 2010, 2011 Xilinx, Inc.
* All rights reserved.
*
* File:
* nf_axis_gen_chk.v
*
* Library:
* hw/std/nf_axis_gen_chk
*
* Author:
* Michaela Blott, Tinghui Wang (Steve)
*
* Description:
* Hardware component that generates and checks packets.
* Currently the generator generates bit-wise shifted pattern. No valid
* packet pattern and/or higher layer structure is programmed.
* Ported form NetFPGA 10G base Package
*
* @NETFPGA_LICENSE_HEADER_START@
*
* Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
* license agreements. See the NOTICE file distributed with this work for
* additional information regarding copyright ownership. NetFPGA licenses this
* file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
* "License"); you may not use this file except in compliance with the
* License. You may obtain a copy of the License at:
*
* http://www.netfpga-cic.org
*
* Unless required by applicable law or agreed to in writing, Work distributed
* under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
* CONDITIONS OF ANY KIND, either express or implied. See the License for the
* specific language governing permissions and limitations under the License.
*
* @NETFPGA_LICENSE_HEADER_END@
*/

`timescale 1 ns / 1 ps

	module nf_axis_gen_chk#
	(
		// Users to add parameters here
        parameter integer C_GEN_PKT_SIZE        = 16, // in words
        parameter integer C_CHK_PKT_SIZE        = 16, // in words
        parameter integer C_IFG_SIZE            = 5, // in words
		// Parameters of Axi Slave Bus Interface S_AXIS
        parameter integer C_S_AXIS_TDATA_WIDTH    = 64,
        // Parameters of Axi Master Bus Interface M_AXIS
        parameter integer C_M_AXIS_TDATA_WIDTH    = 64,
		// Do not modify the parameters beyond this line


		// Parameters of Axi Slave Bus Interface S_AXI
		parameter integer C_S_AXI_DATA_WIDTH	= 32,
		parameter integer C_S_AXI_ADDR_WIDTH	= 4
	)
	(
		// Users to add ports here
        // Ports of Axi Slave Bus Interface S_AXIS
        input wire  s_axis_aclk,
        input wire  s_axis_aresetn,
        output wire  s_axis_tready,
        input wire [C_S_AXIS_TDATA_WIDTH-1 : 0] s_axis_tdata,
        input wire [(C_S_AXIS_TDATA_WIDTH/8)-1 : 0] s_axis_tkeep,
        input wire  s_axis_tlast,
        input wire  s_axis_tvalid,
 
        // Ports of Axi Master Bus Interface M_AXIS
        input wire  m_axis_aclk,
        input wire  m_axis_aresetn,
        output reg  m_axis_tvalid,
        output reg [C_M_AXIS_TDATA_WIDTH-1 : 0] m_axis_tdata,
        output reg [(C_M_AXIS_TDATA_WIDTH/8)-1 : 0] m_axis_tkeep,
        output wire  m_axis_tlast,
        input wire  m_axis_tready,
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
	
    reg [C_S_AXI_DATA_WIDTH-1 : 0] tx_count;
    reg [C_S_AXI_DATA_WIDTH-1 : 0] rx_count;
    reg [C_S_AXI_DATA_WIDTH-1 : 0] err_count;
    wire count_reset;
    
// Instantiation of Axi Bus Interface S_AXI
	nf_axis_gen_chk_S_AXI # ( 
		.C_S_AXI_DATA_WIDTH(C_S_AXI_DATA_WIDTH),
		.C_S_AXI_ADDR_WIDTH(C_S_AXI_ADDR_WIDTH)
	) nf_axis_gen_chk_S_AXI_inst (
	    // Register Interface
        .tx_count(tx_count),
        .rx_count(rx_count),
        .err_count(err_count),
        .count_reset(count_reset),
        // AXI-Lite Interface
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
    localparam GEN_PKT = 2'd0;
    localparam GEN_IFG = 2'd1;
    localparam GEN_FINISH = 2'd3;
    
    localparam CHK_IDLE = 2'd0;
    localparam CHK_FINISH = 2'd1;
    localparam CHK_COMPARE = 2'd3;
    localparam CHK_WAIT_LAST = 2'd2;

    wire [255:0] seed;
    
    reg [1:0] gen_state;
    reg [1:0] chk_state;
    
    reg [15:0] gen_word_num;
    reg [15:0] chk_word_num;
    
    reg ok;
    reg [C_M_AXIS_TDATA_WIDTH-1 : 0] pkt_tx_buf;
    reg [C_M_AXIS_TDATA_WIDTH-1 : 0] pkt_rx_buf;
        
    assign seed = 256'hCAFEBEEFCAFEBEEFCAFEBEEFCAFEBEEFCAFEBEEFCAFEBEEFCAFEBEEFCAFEBEEF;
    
    assign m_axis_tlast = (gen_word_num == C_GEN_PKT_SIZE-1) ? 1'b1 : 1'b0;
    // assign m_axis_tuser = 'd0;
    
    always @( posedge m_axis_aclk or negedge m_axis_aresetn)
    begin
        if(m_axis_aresetn == 1'b0)
        begin
            m_axis_tkeep <= {(C_M_AXIS_TDATA_WIDTH/8) {1'b1}};
            m_axis_tvalid <= 1'b0;
            gen_word_num <= {16 {1'b0}};
            tx_count <= {32 {1'b0}};
            gen_state <= GEN_IFG; // Initiate to Between Frames
        end
        else
        begin
            if (gen_state == GEN_PKT)
            begin
                m_axis_tkeep = {(C_M_AXIS_TDATA_WIDTH/8) {1'b1}};
                m_axis_tvalid = 1'b1;
                if (m_axis_tready == 1'b1)
                begin
                    if (gen_word_num == C_GEN_PKT_SIZE - 1)
                    begin
                        m_axis_tkeep <= {(C_M_AXIS_TDATA_WIDTH/8) {1'b0}};
                        m_axis_tvalid <= 1'b0;
                        tx_count <= tx_count + 1'b1;
                        gen_state <= GEN_IFG;
                    end
                    else
                    begin
                        pkt_tx_buf <= {pkt_tx_buf[0], pkt_tx_buf[C_M_AXIS_TDATA_WIDTH-1:1]};
                        m_axis_tdata <= {pkt_tx_buf[0], pkt_tx_buf[C_M_AXIS_TDATA_WIDTH-1:1]};
                    end
                    gen_word_num <= gen_word_num + 1'b1;
                end
            end
            else if (gen_state == GEN_IFG)
            begin
                m_axis_tkeep <= {(C_M_AXIS_TDATA_WIDTH/8) {1'b0}};
                m_axis_tvalid <= 1'b0;
                if (m_axis_tready == 1'b1)
                begin
                    gen_word_num <= gen_word_num + 1'b1;
                    if (gen_word_num == C_GEN_PKT_SIZE + C_IFG_SIZE - 1)
                    begin
                        if (count_reset == 1'b1)
                        begin
                            gen_state <= GEN_IFG; // Hold state at GEN_IFG gently
                            tx_count <= {32 {1'b0}};
                        end
                        else
                            gen_state <= GEN_FINISH;
                    end 
                end
            end
            else if (gen_state == GEN_FINISH)
            begin
                m_axis_tkeep <= {(C_M_AXIS_TDATA_WIDTH/8) {1'b1}};
                m_axis_tvalid <= 1'b1;
                m_axis_tdata <= seed[C_M_AXIS_TDATA_WIDTH-1:0];
                pkt_tx_buf <= seed[C_M_AXIS_TDATA_WIDTH-1:0];
                gen_word_num <= {16 {1'b0}};
                gen_state <= GEN_PKT;
            end
        end
    end

    assign s_axis_tready = 1'b1;
 
    always @( posedge s_axis_aclk or negedge s_axis_aresetn)
    begin
        if(s_axis_aresetn == 1'b0)
        begin
            chk_state <= CHK_IDLE;
            rx_count <= {C_S_AXI_DATA_WIDTH {1'b0}};
            err_count <= {C_S_AXI_DATA_WIDTH {1'b0}};
            ok <= 1'b1;
            chk_word_num <= {16 {1'b0}};
        end
        else
        begin
            if (chk_state == CHK_IDLE) // Waiting for a Packet
            begin
                if (s_axis_tvalid == 1'b1)
                begin
                    ok <= 1'b1;
                    pkt_rx_buf <= {s_axis_tdata[0],s_axis_tdata[C_S_AXIS_TDATA_WIDTH-1:1]};
                    chk_word_num <= 16'd0;
                    chk_state <= CHK_COMPARE;
                end
            end
            else if(chk_state == CHK_COMPARE) // Checking packet
            begin
                if (s_axis_tvalid == 1'b1)
                begin
                    pkt_rx_buf <= {pkt_rx_buf[0],pkt_rx_buf[C_S_AXIS_TDATA_WIDTH-1:1]};
                    chk_word_num <= chk_word_num + 1'b1;
                    if (s_axis_tdata == pkt_rx_buf)
                        ok <= 1'b1;
                    else
                        ok <= 1'b0;
                    if (chk_word_num == C_CHK_PKT_SIZE-2)
                        if (s_axis_tlast == 1'b1)
                            chk_state <= CHK_FINISH;
                        else
                        begin
                            ok <= 1'b0;
                            chk_state <= CHK_WAIT_LAST;
                        end
                end
            end
            else if (chk_state == CHK_FINISH) // Finish up
            begin
                if (ok == 1'b1)
                    rx_count <= rx_count + 1'b1;
                else
                    err_count <= err_count + 1'b1;
                chk_state <= CHK_IDLE;
                ok <= 1'b1;
            end
            else if (chk_state == CHK_WAIT_LAST)
            begin
                if ((s_axis_tlast == 1'b1) && (s_axis_tvalid == 1'b1))
                    chk_state <= CHK_FINISH;
            end

            if (count_reset == 1'b1)
            begin
                rx_count <= {C_S_AXI_DATA_WIDTH {1'b0}};
                err_count <= {C_S_AXI_DATA_WIDTH {1'b0}};
            end
        end
    end
	// User logic ends

	endmodule
