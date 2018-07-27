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

module action_table_double
#(
   parameter   C_S_AXI_DATA_WIDTH      = 32,
   parameter   ACT_ADDR_WIDTH          = 4,
   parameter   ACT_TBL_DATA_WIDTH      = 8
)
(
   input                                     axi_aclk,
   input                                     axi_resetn,

   //One clock cycle pulse
   input                                     action_tcam_match_en,
   input                                     action_tcam_miss,
   input                                     action_tcam_hit,
   input          [ACT_ADDR_WIDTH-1:0]       action_tcam_match_result,

   //Register trigger to select table.
   input                                     action_sel,
   input                                     flow_buffer_sel,
   //TCAM write control configuration.
   //0: Trigger, 1: Select TCAM_0, 2: Select TCAM_1;
   input          [1:0]                      action_wr_ctrl,
   output                                    action_status,
   //Action table register access.
   input          [ACT_ADDR_WIDTH-1:0]       action_addr_wr,
   input                                     action_wren,
   input                                     action_rden,
   input          [ACT_TBL_DATA_WIDTH-1:0]   action_din,
   output         [ACT_TBL_DATA_WIDTH-1:0]   action_dout,
   //Action table stats.
   input                                     action_stat_clr,
   input                                     action_stat_addr_rd,
   input                                     action_stat_rden,
   output   reg   [C_S_AXI_DATA_WIDTH-1:0]   action_stat_data_rd,
   //Action result outputs.
   output         [ACT_TBL_DATA_WIDTH-1:0]   action_result,
   output                                    action_miss,
   output                                    action_hit,
   output                                    action_result_en
);

reg   r_action_sel;
always @(posedge axi_aclk)
   if (~axi_resetn)
      r_action_sel  <= 0;
   else if (action_tcam_match_en)
      r_action_sel  <= action_sel;

wire  w_action_sel = (action_tcam_match_en) ? action_sel : r_action_sel;

//assign action_status = r_action_sel;
assign action_status = (action_wr_ctrl == 1) ? 0 :
                       (action_wr_ctrl == 2) ? 1 : flow_buffer_sel;

wire  action_wren_0, action_rden_0;
wire  [ACT_ADDR_WIDTH-1:0]       act_set_wr_addr_0, act_set_rd_addr_0;
wire  [ACT_TBL_DATA_WIDTH-1:0]   action_din_0, action_dout_0;

wire  action_wren_1, action_rden_1;
wire  [ACT_ADDR_WIDTH-1:0]       act_set_wr_addr_1, act_set_rd_addr_1;
wire  [ACT_TBL_DATA_WIDTH-1:0]   action_din_1, action_dout_1;

reg   action_tcam_match_en_d, action_tcam_miss_d, action_tcam_hit_d;
reg   action_sel_d;
always @(posedge  axi_aclk)
   if (~axi_resetn) begin
      action_tcam_match_en_d  <= 0;//Synch to Action results.
      action_tcam_miss_d      <= 0;//Synch to Action results.
      action_tcam_hit_d       <= 0;//Synch to Action results.
      action_sel_d            <= 0;//Synch to Action results.
   end
   else begin
      action_tcam_match_en_d  <= action_tcam_match_en;
      action_tcam_miss_d      <= action_tcam_miss;
      action_tcam_hit_d       <= action_tcam_hit;
      action_sel_d            <= w_action_sel;//Synch to Action results.
  end

assign action_wren_0 = (action_wr_ctrl != 0) ? action_wr_ctrl[0] & action_wren :
                       (flow_buffer_sel == 1)   ? action_wren : 0;
assign act_set_wr_addr_0 = (flow_buffer_sel == 1 || action_wr_ctrl == 1) ? action_addr_wr :0;
assign action_din_0 = (action_wr_ctrl == 1 || flow_buffer_sel == 1) ? action_din :  0;

//'w_action_sel' below action results must be reverse to the wr signal values.
assign action_rden_0 = (action_wr_ctrl != 0) ? action_tcam_hit :
                       (w_action_sel == 0)   ? action_tcam_hit : 0;
assign act_set_rd_addr_0 = (action_wr_ctrl != 0 || w_action_sel == 0) ? action_tcam_match_result : 0;

assign action_dout = action_dout_0;

bram_mem
#(
   .ADDR_WIDTH          (  ACT_ADDR_WIDTH          ),
   .DATA_WIDTH          (  ACT_TBL_DATA_WIDTH      )
)
action_set_0
(
   .CLK                 (  axi_aclk                ),
   .WR                  (  action_wren_0           ),
   .ADDR_WR             (  act_set_wr_addr_0       ),
   .DIN                 (  action_din_0            ),
   .RD                  (  action_rden_0           ),
   .ADDR_RD             (  act_set_rd_addr_0       ),
   .DOUT                (  action_dout_0           )
);

assign action_wren_1 = (action_wr_ctrl != 0) ? action_wr_ctrl[1] & action_wren :
                       (flow_buffer_sel == 0)   ? action_wren : 0;
assign act_set_wr_addr_1 = (flow_buffer_sel == 0 || action_wr_ctrl == 2) ? action_addr_wr : 0;
assign action_din_1 = (action_wr_ctrl == 2 || flow_buffer_sel == 0) ? action_din : 0;

assign action_rden_1 = (action_wr_ctrl != 0) ? action_tcam_hit :
                       (w_action_sel == 1)   ? action_tcam_hit : 0;
assign act_set_rd_addr_1 = (action_wr_ctrl != 0 || w_action_sel == 1) ? action_tcam_match_result : 0;

bram_mem
#(
   .ADDR_WIDTH          (  ACT_ADDR_WIDTH          ),
   .DATA_WIDTH          (  ACT_TBL_DATA_WIDTH      )
)
action_set_1
(
   .CLK                 (  axi_aclk                ),
   .WR                  (  action_wren_1           ),
   .ADDR_WR             (  act_set_wr_addr_1       ),
   .DIN                 (  action_din_1            ),
   .RD                  (  action_rden_1           ),
   .ADDR_RD             (  act_set_rd_addr_1       ),
   .DOUT                (  action_dout_1           )
);


assign action_miss = action_tcam_miss_d;
assign action_hit = action_tcam_hit_d;
assign action_result = (action_tcam_match_en_d & action_tcam_hit_d) ? (action_wr_ctrl == 1) ? action_dout_0 :
                                                                      (action_wr_ctrl == 2) ? action_dout_1 :
                                                                      (~action_sel_d) ? action_dout_0 : action_dout_1 :
                                                                      0;
assign action_result_en = action_tcam_match_en_d;

//Entry statistics
//Entry stats memory clear
reg   [ACT_ADDR_WIDTH-1:0]    stat_mem_clr_addr;
reg   stat_mem_clr_wr;

always @(posedge axi_aclk)
   if (~axi_resetn) begin
      stat_mem_clr_addr <= 0;
      stat_mem_clr_wr   <= 0;
   end
   else if (stat_mem_clr_addr > 0) begin
      stat_mem_clr_addr <= (stat_mem_clr_addr == (2**ACT_ADDR_WIDTH-1)) ? 0 : stat_mem_clr_addr + 1;
      stat_mem_clr_wr   <= (stat_mem_clr_addr == (2**ACT_ADDR_WIDTH-1)) ? 0 : 1;
   end
   else if (action_stat_clr) begin
      stat_mem_clr_addr <= 1;
      stat_mem_clr_wr   <= 1;
   end

wire  [ACT_ADDR_WIDTH-1:0]    action_stat_wr_addr, action_stat_rd_addr_0, action_stat_rd_addr_1;
wire  action_stat_wren, action_stat_rden_0;
wire  [C_S_AXI_DATA_WIDTH-1:0]  action_stat_wr_data, action_stat_rd_data_0, action_stat_rd_data_1;

assign action_stat_rd_addr_0 = action_tcam_match_result;
assign action_stat_rden_0 = action_tcam_hit;

assign action_stat_rd_addr_1 = action_stat_addr_rd;
assign action_stat_rden_1 = action_stat_rden;

reg   [ACT_ADDR_WIDTH-1:0]    action_stat_rd_addr_d1, action_stat_rd_addr_d2;
reg   action_stat_rden_d, action_stat_wren_d1, action_stat_wren_d2;
always @(posedge axi_aclk)
   if (~axi_resetn) begin
      action_stat_rd_addr_d1  <= 0;
      action_stat_rd_addr_d2  <= 0;
      action_stat_wren_d1     <= 0;
      action_stat_wren_d2     <= 0;
      action_stat_rden_d      <= 0;
   end
   else begin
      action_stat_rd_addr_d1  <= action_stat_rd_addr_0;
      action_stat_rd_addr_d2  <= action_stat_rd_addr_d1;
      action_stat_wren_d1     <= action_tcam_hit;
      action_stat_wren_d2     <= action_stat_wren_d1;
      action_stat_rden_d      <= action_stat_rden;
   end

reg   [C_S_AXI_DATA_WIDTH-1:0]   action_stat_rd_data_0_d;
always @(posedge axi_aclk)
   if (~axi_resetn) begin
      action_stat_rd_data_0_d <= 0;
   end
   else if (action_stat_wren_d1) begin
      action_stat_rd_data_0_d <= action_stat_rd_data_0;
   end      

assign action_stat_wr_addr = (stat_mem_clr_wr) ? stat_mem_clr_addr : action_stat_rd_addr_d2;
assign action_stat_wren = (stat_mem_clr_wr) ? 1 : action_stat_wren_d2;
assign action_stat_wr_data = (stat_mem_clr_wr) ? 0 : action_stat_rd_data_0_d + 1;

//Send to blueswitch_controller for register read.
always @(posedge axi_aclk)
   if (~axi_resetn)
      action_stat_data_rd  <= 0;
   else if (action_stat_rden_d)
      action_stat_data_rd  <= action_stat_rd_data_1;

bram_mem_true_dual
#(
   .ADDR_WIDTH    (  ACT_ADDR_WIDTH          ),
   .DATA_WIDTH    (  C_S_AXI_DATA_WIDTH      )
)
action_stat_mem
(
   .CLK_0         (  axi_aclk                ),
   .WR_0          (  action_stat_wren        ),
   .ADDR_WR_0     (  action_stat_wr_addr     ),
   .DIN_0         (  action_stat_wr_data     ),
   .RD_0          (  action_stat_rden_0      ),
   .ADDR_RD_0     (  action_stat_rd_addr_0   ),
   .DOUT_0        (  action_stat_rd_data_0   ),

   .CLK_1         (  axi_aclk                ),
   .WR_1          (0),
   .ADDR_WR_1     (0),
   .DIN_1         (0),
   .RD_1          (  action_stat_rden_1      ),
   .ADDR_RD_1     (  action_stat_rd_addr_1   ),
   .DOUT_1        (  action_stat_rd_data_1   )
);

endmodule
