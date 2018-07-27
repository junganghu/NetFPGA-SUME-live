//
// Copyright (c) 2015-2016 Jong Hun Han
// Copyright (c) 2015 SRI International
// All rights reserved
//
// This software was developed by Stanford University and the University of
// Cambridge Computer Laboratory under National Science Foundation under Grant
// No. CNS-0855268, the University of Cambridge Computer Laboratory under EPSRC
// INTERNET Project EP/H040536/1 and by the University of Cambridge Computer
// Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), as part of
// the DARPA MRC research programme.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor license
// agreements.  See the NOTICE file distributed with this work for additional
// information regarding copyright ownership.  NetFPGA licenses this file to you
// under the NetFPGA Hardware-Software License, Version 1.0 (the "License"); you
// may not use this file except in compliance with the License.  You may obtain
// a copy of the License at:
//
//   http://www.netfpga-cic.org
//
// Unless required by applicable law or agreed to in writing, Work distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@

`timescale 1ns/1ps

`include "nf_sume_blueswitch_register_define.v"
`include "nf_sume_blueswitch_parameter_define.v"

module tcam_table_double
#(
   parameter   C_S_AXI_DATA_WIDTH   = 32,
   parameter   TCAM_ADDR_WIDTH      = 4,
   parameter   TCAM_DATA_WIDTH      = 32,
   //Input to TCAM in idle state, not output wrong match results.
   parameter   TCAM_DUMMY_ENTRY     = 32'hace0_face
)
(
   input                                     axi_aclk,
   input                                     axi_resetn,

   //One clock cycle pulse
   input                                     tcam_entry_en,
   //Packet header fields
   input          [TCAM_DATA_WIDTH-1:0]      tcam_entry,
   
   input                                     tcam_sel,
   input                                     flow_buffer_sel,
   //TCAM write control configuration.
   //0: Trigger, 1: Select TCAM_0, 2: Select TCAM_1;
   input          [1:0]                      tcam_wr_ctrl,
   output                                    tcam_status,
   //TCAM input signals.
   input          [TCAM_ADDR_WIDTH-1:0]      tcam_addr_wr,
   input                                     tcam_wren,
   input          [TCAM_DATA_WIDTH-1:0]      tcam_din,
   input          [TCAM_DATA_WIDTH-1:0]      tcam_din_mask,
   output                                    tcam_busy,
   //Match result outputs.
   output                                    tcam_hit,
   output                                    tcam_miss,
   output         [TCAM_ADDR_WIDTH-1:0]      tcam_match_result,
   output                                    tcam_match_en,
   //Match result counts.
   output   reg   [C_S_AXI_DATA_WIDTH-1:0]   tcam_hit_total,
   output   reg   [C_S_AXI_DATA_WIDTH-1:0]   tcam_miss_total,
   output   reg   [C_S_AXI_DATA_WIDTH-1:0]   tcam_total,
   //Clear hit, miss, and total counters and stats.
   input                                     tcam_flow_stat_clr,
   //Match stats access signals.
   input          [TCAM_ADDR_WIDTH-1:0]      tcam_stat_addr_rd,
   input                                     tcam_stat_rden,
   output   reg   [C_S_AXI_DATA_WIDTH-1:0]   tcam_stat_data_rd,
   //Clear all contents of stats memory.
   input                                     tcam_stat_clr
);

wire  tcam_wren_0, tcam_busy_0, tcam_match_0;
wire  [TCAM_ADDR_WIDTH-1:0]   tcam_wr_addr_0, tcam_result_0;
wire  [TCAM_DATA_WIDTH-1:0]   tcam_wr_din_0, tcam_wr_din_mask_0, tcam_cmp_0;

wire  tcam_wren_1, tcam_busy_1, tcam_match_1;
wire  [TCAM_ADDR_WIDTH-1:0]   tcam_wr_addr_1, tcam_result_1;
wire  [TCAM_DATA_WIDTH-1:0]   tcam_wr_din_1, tcam_wr_din_mask_1, tcam_cmp_1;

assign tcam_busy = tcam_busy_0 | tcam_busy_1;

reg   r_tcam_sel;
always @(posedge axi_aclk)
   if (~axi_resetn)
      r_tcam_sel <= 0;
   else if (tcam_entry_en)
      r_tcam_sel <= tcam_sel;

wire  w_tcam_sel = (tcam_entry_en) ? tcam_sel : r_tcam_sel;

//assign tcam_status = r_tcam_sel;
assign tcam_status = (tcam_wr_ctrl == 1) ? 0 :
                     (tcam_wr_ctrl == 2) ? 1 : flow_buffer_sel;


reg   [2:0] r_tcam_entry_en;
always @(posedge  axi_aclk)
   if (~axi_resetn) begin
      r_tcam_entry_en   <= 0;
   end
   else begin
      r_tcam_entry_en   <= {r_tcam_entry_en[1:0], tcam_entry_en};
   end

reg   [2:0] r_tcam_sel_d;
always @(posedge  axi_aclk)
   if (~axi_resetn) begin
      r_tcam_sel_d   <= 0;
   end
   else begin
      r_tcam_sel_d   <= {r_tcam_sel_d[1:0], w_tcam_sel};
   end

//TCAM in/out assign
assign tcam_wren_0 = (tcam_wr_ctrl != 0) ? tcam_wr_ctrl[0] & tcam_wren :
                     (flow_buffer_sel == 1)   ? tcam_wren : 0;
assign tcam_wr_addr_0 = (tcam_wr_ctrl == 1 || flow_buffer_sel == 1) ? tcam_addr_wr : 0;
assign tcam_wr_din_0 = (tcam_wr_ctrl == 1 || flow_buffer_sel == 1) ? tcam_din : 0;

assign tcam_cmp_0 = (tcam_entry_en & tcam_wr_ctrl == 1) ? tcam_entry : 
                    (tcam_entry_en & tcam_wr_ctrl == 2) ? TCAM_DUMMY_ENTRY : 
                    (tcam_entry_en & w_tcam_sel == 0)   ? tcam_entry : TCAM_DUMMY_ENTRY;

`ifdef TCAM_MULTI
tcam_multi_wrapper
`else
tcam_module
`endif
#(
   .TCAM_ADDR_WIDTH  (  TCAM_ADDR_WIDTH         ),
   .TCAM_DATA_WIDTH  (  TCAM_DATA_WIDTH         )
)
tcam_table_0 (
   .CLK              (  axi_aclk                ),
   .RSTN             (  axi_resetn              ),
   .WR               (  tcam_wren_0             ), 
   .ADDR_WR          (  tcam_wr_addr_0          ),
   .DIN              (  tcam_wr_din_0           ), 
   .DIN_MASK         (  {TCAM_DATA_WIDTH{1'b0}} ), 
   .BUSY             (  tcam_busy_0          ), 
`ifdef EN_TCAM_RD
   .RD               (                          ),  
   .ADDR_RD          (  0                       ),
   .DOUT             (                          ),
`endif
   .CAM_DIN          (  tcam_cmp_0              ),
   .CAM_DATA_MASK    (  {TCAM_DATA_WIDTH{1'b0}} ),
   .MATCH            (  tcam_match_0            ),// = r_tcam_entry_en[2]
   .MATCH_ADDR       (  tcam_result_0           )
);

//TCAM in/out assign
assign tcam_wren_1 = (tcam_wr_ctrl != 0) ? tcam_wr_ctrl[1] & tcam_wren :
                     (flow_buffer_sel == 0) ? tcam_wren : 0;
assign tcam_wr_addr_1 = (tcam_wr_ctrl == 2 || flow_buffer_sel == 0) ? tcam_addr_wr : 0;
assign tcam_wr_din_1 = (tcam_wr_ctrl == 2 || flow_buffer_sel == 0) ? tcam_din : 0;

assign tcam_cmp_1 = (tcam_entry_en & tcam_wr_ctrl == 2) ? tcam_entry :
                    (tcam_entry_en & tcam_wr_ctrl == 1) ? TCAM_DUMMY_ENTRY :
                    (tcam_entry_en & w_tcam_sel == 1)   ? tcam_entry : TCAM_DUMMY_ENTRY;

`ifdef TCAM_MULTI
tcam_multi_wrapper
`else
tcam_module
`endif
#(
   .TCAM_ADDR_WIDTH  (  TCAM_ADDR_WIDTH         ),
   .TCAM_DATA_WIDTH  (  TCAM_DATA_WIDTH         )
)
tcam_table_1 (
   .CLK              (  axi_aclk                ),
   .RSTN             (  axi_resetn              ),
   .WR               (  tcam_wren_1             ), 
   .ADDR_WR          (  tcam_wr_addr_1          ),
   .DIN              (  tcam_wr_din_1           ), 
   .DIN_MASK         (  {TCAM_DATA_WIDTH{1'b0}} ), 
   .BUSY             (  tcam_busy_1          ), 
`ifdef EN_TCAM_RD
   .RD               (                          ),  
   .ADDR_RD          (  0                       ),
   .DOUT             (                          ),
`endif
   .CAM_DIN          (  tcam_cmp_1              ),
   .CAM_DATA_MASK    (  {TCAM_DATA_WIDTH{1'b0}} ),
   .MATCH            (  tcam_match_1            ),// = r_tcam_entry_en[2]
   .MATCH_ADDR       (  tcam_result_1           )
);


assign tcam_hit = (r_tcam_entry_en[2]) ? (tcam_wr_ctrl == 1)    ? tcam_match_0 :
                                         (tcam_wr_ctrl == 2)    ? tcam_match_1 :
                                         (r_tcam_sel_d[2] == 0) ? tcam_match_0 : tcam_match_1 :
                                         0;
assign tcam_miss = (r_tcam_entry_en[2]) ? (tcam_wr_ctrl == 1)    ? ~tcam_match_0 :
                                          (tcam_wr_ctrl == 2)    ? ~tcam_match_1 :
                                          (r_tcam_sel_d[2] == 0) ? ~tcam_match_0 : ~tcam_match_1 :
                                          0;
assign tcam_match_result = (r_tcam_entry_en[2] & (tcam_match_0 | tcam_match_1)) ? (tcam_wr_ctrl == 1) ? tcam_result_0 :
                                                                                  (tcam_wr_ctrl == 2) ? tcam_result_1 :
                                                                                  (r_tcam_sel_d[2] == 0) ? tcam_result_0 : tcam_result_1 :
                                                                                  0;
assign tcam_match_en = r_tcam_entry_en[2];

//Flow stats, hit, miss, and total.
always @(posedge axi_aclk)
   if (~axi_resetn) begin
      tcam_hit_total    <= 0;
      tcam_miss_total   <= 0;
      tcam_total        <= 0;
   end
   else if (tcam_flow_stat_clr) begin
      tcam_hit_total    <= 0;
      tcam_miss_total   <= 0;
      tcam_total        <= 0;
   end
   else if (r_tcam_entry_en[2]) begin
      tcam_hit_total    <= (tcam_hit) ? tcam_hit_total + 1 : tcam_hit_total;
      tcam_miss_total   <= (tcam_miss) ? tcam_miss_total + 1 : tcam_miss_total;
      tcam_total        <= tcam_total + 1;
   end

//Entry statistics
//Entry stats memory clear
reg   [TCAM_ADDR_WIDTH-1:0]   stat_mem_clr_addr;
reg   stat_mem_clr_wr;

always @(posedge axi_aclk)
   if (~axi_resetn) begin
      stat_mem_clr_addr  <= 0;
      stat_mem_clr_wr    <= 0;
   end
   else if (stat_mem_clr_addr > 0) begin
      stat_mem_clr_addr  <= (stat_mem_clr_addr == (2**TCAM_ADDR_WIDTH-1)) ? 0 : stat_mem_clr_addr + 1;
      stat_mem_clr_wr    <= (stat_mem_clr_addr == (2**TCAM_ADDR_WIDTH-1)) ? 0 : 1;
   end
   else if (tcam_stat_clr) begin
      stat_mem_clr_addr  <= 1;
      stat_mem_clr_wr    <= 1;
   end

wire  [TCAM_ADDR_WIDTH-1:0]   tcam_stat_addr_wr_0, tcam_stat_addr_rd_0, tcam_stat_addr_rd_1;
wire  tcam_stat_wr_0, tcam_stat_rd_0;
wire  [C_S_AXI_DATA_WIDTH-1:0]   tcam_stat_data_wr_0, tcam_stat_data_rd_0, tcam_stat_data_rd_1;

assign tcam_stat_addr_rd_0 = tcam_match_result;
assign tcam_stat_rd_0 = tcam_hit;

assign tcam_stat_addr_rd_1 = tcam_stat_addr_rd;
assign tcam_stat_rd_1 = tcam_stat_rden;

reg   [TCAM_ADDR_WIDTH-1:0]  tcam_stat_addr_rd_0_d1, tcam_stat_addr_rd_0_d2;
reg   tcam_stat_rd_1_d, tcam_stat_wr_0_d1, tcam_stat_wr_0_d2;
always @(posedge axi_aclk)
   if (~axi_resetn) begin
      tcam_stat_addr_rd_0_d1  <= 0;
      tcam_stat_addr_rd_0_d2  <= 0;
      tcam_stat_wr_0_d1       <= 0;
      tcam_stat_wr_0_d2       <= 0;
      tcam_stat_rd_1_d        <= 0;
   end
   else begin
      tcam_stat_addr_rd_0_d1  <= tcam_stat_addr_rd_0;
      tcam_stat_addr_rd_0_d2  <= tcam_stat_addr_rd_0_d1;
      tcam_stat_wr_0_d1       <= tcam_hit;
      tcam_stat_wr_0_d2       <= tcam_stat_wr_0_d1;
      tcam_stat_rd_1_d        <= tcam_stat_rden;
   end

reg   [TCAM_DATA_WIDTH-1:0]   tcam_stat_data_rd_0_d;
always @(posedge axi_aclk)
   if (~axi_resetn) begin
      tcam_stat_data_rd_0_d <= 0;
   end
   else if (tcam_stat_wr_0_d1) begin
      tcam_stat_data_rd_0_d <= tcam_stat_data_rd_0;
   end      

assign tcam_stat_addr_wr_0 = (stat_mem_clr_wr) ? stat_mem_clr_addr : tcam_stat_addr_rd_0_d2;
assign tcam_stat_wr_0 = (stat_mem_clr_wr) ? 1 : tcam_stat_wr_0_d2;
assign tcam_stat_data_wr_0 = (stat_mem_clr_wr) ? 0 : tcam_stat_data_rd_0_d + 1;

//Send to blueswitch_controller for register read.
always @(posedge axi_aclk)
   if (~axi_resetn)
      tcam_stat_data_rd <= 0;
   else if (tcam_stat_rd_1_d)
      tcam_stat_data_rd <= tcam_stat_data_rd_1;

bram_mem_true_dual
#(
   .ADDR_WIDTH    (  TCAM_ADDR_WIDTH         ),
   .DATA_WIDTH    (  C_S_AXI_DATA_WIDTH      )
)
entry_stats_match_mem
(
   .CLK_0         (  axi_aclk                ),
   .WR_0          (  tcam_stat_wr_0          ),
   .ADDR_WR_0     (  tcam_stat_addr_wr_0     ),
   .DIN_0         (  tcam_stat_data_wr_0     ),
   .RD_0          (  tcam_stat_rd_0          ),
   .ADDR_RD_0     (  tcam_stat_addr_rd_0     ),
   .DOUT_0        (  tcam_stat_data_rd_0     ),
   
   //Read stats interface for api.
   .CLK_1         (  axi_aclk                ),
   .WR_1          (0),
   .ADDR_WR_1     (0),
   .DIN_1         (0),
   .RD_1          (  tcam_stat_rd_1          ),
   .ADDR_RD_1     (  tcam_stat_addr_rd_1     ),
   .DOUT_1        (  tcam_stat_data_rd_1     )
);


endmodule
