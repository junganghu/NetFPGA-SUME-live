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

module flow_table
#(
   parameter   C_S_AXI_DATA_WIDTH      = 32,

   parameter   HDR_ACT_TDATA_WIDTH     = 32,
   parameter   HDR_ACT_TUSER_WIDTH     = 32,

   parameter   TBL_ADDR_WIDTH          = 4,
   parameter   TCAM_DATA_WIDTH         = 32,
   parameter   ACT_DATA_WIDTH          = 8,
   parameter   ACT_TBL_DATA_WIDTH      = 8,
   parameter   HDR_ENTRY_POS           = 32,
   parameter   HW_TRIG_POS             = 32,
   //0: mac, 1:ip, 2:port_no.
   parameter   ENTRY_TYPE              = 1,
   //use for tcam in idle state.
   parameter   TCAM_DUMMY_ENTRY        = 32'hace0_face
)
(
   input                                     axi_aclk,
   input                                     axi_resetn,
   
   //Header fields, action results (initial is 0), tcam and action
   //selection.
   input          [HDR_ACT_TDATA_WIDTH-1:0]  s_axis_hdr_act_tdata,
   //Source physical port information.
   input          [HDR_ACT_TUSER_WIDTH-1:0]  s_axis_hdr_act_tuser,
   input                                     s_axis_hdr_act_tvalid,
   output                                    s_axis_hdr_act_tready,

   output         [HDR_ACT_TDATA_WIDTH-1:0]  m_axis_hdr_act_tdata,
   output         [HDR_ACT_TUSER_WIDTH-1:0]  m_axis_hdr_act_tuser,
   output                                    m_axis_hdr_act_tvalid,
   input                                     m_axis_hdr_act_tready,

   //TCAM table signals.
   output         [1:0]                      flow_table_status,
   //Flow table configuration set. bitmap type.
   //2'b00 : active, 2'b01 : bypass, 2'b10 : action update if hit.
   input          [1:0]                      flow_table_config,
   input                                     flow_buffer_sel,
   
   input          [1:0]                      tcam_wr_ctrl,

   //Address mapped registers
   input          [TBL_ADDR_WIDTH-1:0]       tcam_addr_wr,
   input                                     tcam_wren,//Pulse
   input          [TCAM_DATA_WIDTH-1:0]      tcam_din,
   input          [TCAM_DATA_WIDTH-1:0]      tcam_din_mask,
   output                                    tcam_busy,
   output         [C_S_AXI_DATA_WIDTH-1:0]   tcam_hit_total,
   output         [C_S_AXI_DATA_WIDTH-1:0]   tcam_miss_total,
   output         [C_S_AXI_DATA_WIDTH-1:0]   tcam_total,
   input                                     tcam_flow_stat_clr,
   input          [TBL_ADDR_WIDTH-1:0]       tcam_stat_addr_rd,
   input                                     tcam_stat_rden,
   output         [C_S_AXI_DATA_WIDTH-1:0]   tcam_stat_data_rd,
   input                                     tcam_stat_clr,

   //Action table signals.
   input                                     action_sel_trig,
   input          [1:0]                      action_wr_ctrl,
   //From blueswitch_controller CPU
   input          [TBL_ADDR_WIDTH-1:0]       action_addr_wr,
   input                                     action_wren,
   input                                     action_rden,
   input          [ACT_TBL_DATA_WIDTH-1:0]   action_din,
   output         [ACT_TBL_DATA_WIDTH-1:0]   action_dout,
   input                                     action_stat_clr,
   input          [TBL_ADDR_WIDTH-1:0]       action_stat_addr_rd,
   input                                     action_stat_rden,
   output         [C_S_AXI_DATA_WIDTH-1:0]   action_stat_data_rd,
   output         [ACT_TBL_DATA_WIDTH-1:0]   action_result,
   output                                    action_miss,
   output                                    action_hit,
   output                                    action_result_en
);

localparam HDR_ACT_TOT_WIDTH = HDR_ACT_TDATA_WIDTH + HDR_ACT_TUSER_WIDTH;

wire  tcam_hit, tcam_miss, tcam_match_en, tcam_sel, tcam_entry_en;
wire  [TCAM_DATA_WIDTH-1:0]   tcam_entry;
wire  [TBL_ADDR_WIDTH-1:0]    tcam_match_result;

wire  header_act_rden, header_act_full, header_act_empty,
header_act_wren;
wire  [HDR_ACT_TOT_WIDTH-1:0] header_act_din, header_act_dout;

wire  action_tcam_match_en, action_tcam_miss, action_tcam_hit;
wire  [TBL_ADDR_WIDTH-1:0]    action_tcam_match_result;

wire  action_result_rden, action_result_full, action_result_empty,
action_result_wren;
//Including miss, hit, action result(destination physical port).
wire  [ACT_TBL_DATA_WIDTH+2-1:0] action_result_dout, action_result_din;

wire  tcam_status, action_status;

assign flow_table_status = {action_status, tcam_status};



assign header_act_rden = (flow_table_config[0]) ?
                          ~header_act_empty & m_axis_hdr_act_tready :
                          ~action_result_empty & ~header_act_empty & m_axis_hdr_act_tready;
assign header_act_wren = s_axis_hdr_act_tvalid & ~header_act_full;

//Merge header and action data with header action meta (source ports).
assign header_act_din = {s_axis_hdr_act_tuser, s_axis_hdr_act_tdata};
assign s_axis_hdr_act_tready = ~header_act_full;

//Packet header fields buffer for passing to next flow table.
fallthrough_small_fifo 
#( 
   .WIDTH                  (  HDR_ACT_TOT_WIDTH    ),
   .MAX_DEPTH_BITS         (  4                    )
) 
header_act_fifo
( 
   //Outputs 
   .dout                   (  header_act_dout      ),
   .rd_en                  (  header_act_rden      ),
   .full                   (),
   .nearly_full            (),
   .prog_full              (  header_act_full      ),
   .empty                  (  header_act_empty     ),
   //Inputs 
   .din                    (  header_act_din       ),
   .wr_en                  (  header_act_wren      ),
   .reset                  (  ~axi_resetn          ), 
   .clk                    (  axi_aclk             )
);


assign tcam_entry_en = (flow_table_config[0]) ?
                        0 :
                        s_axis_hdr_act_tvalid & ~header_act_full;
//TCAM entry selection.
assign tcam_entry = header_act_din[HDR_ENTRY_POS+:TCAM_DATA_WIDTH];
assign tcam_sel = header_act_din[HW_TRIG_POS+:1];

reg   [2:0] r_tcam_sel;
always @(posedge axi_aclk)
   if (~axi_resetn)
      r_tcam_sel  <= 0;
   else
      r_tcam_sel  <= {r_tcam_sel[1:0], tcam_sel};

tcam_table_double
#(
   .C_S_AXI_DATA_WIDTH     (  C_S_AXI_DATA_WIDTH         ),
   .TCAM_ADDR_WIDTH        (  TBL_ADDR_WIDTH             ),
   .TCAM_DATA_WIDTH        (  TCAM_DATA_WIDTH            ),
   .TCAM_DUMMY_ENTRY       (  TCAM_DUMMY_ENTRY           )
)
tcam_table_double
(
   .axi_aclk               (  axi_aclk                   ),
   .axi_resetn             (  axi_resetn                 ),
   .tcam_entry_en          (  tcam_entry_en              ),
   .tcam_entry             (  tcam_entry                 ),
   .tcam_sel               (  tcam_sel                   ),
   .flow_buffer_sel        (  flow_buffer_sel            ),
   .tcam_wr_ctrl           (  tcam_wr_ctrl               ),
   .tcam_status            (  tcam_status                ),
   .tcam_addr_wr           (  tcam_addr_wr               ),
   .tcam_wren              (  tcam_wren                  ),
   .tcam_din               (  tcam_din                   ),
   .tcam_din_mask          (  tcam_din_mask              ),
   .tcam_busy              (  tcam_busy                  ),
   .tcam_hit               (  tcam_hit                   ),
   .tcam_miss              (  tcam_miss                  ),
   .tcam_match_result      (  tcam_match_result          ),
   .tcam_match_en          (  tcam_match_en              ),
   .tcam_hit_total         (  tcam_hit_total             ),
   .tcam_miss_total        (  tcam_miss_total            ),
   .tcam_total             (  tcam_total                 ),
   .tcam_flow_stat_clr     (  tcam_flow_stat_clr         ),
   .tcam_stat_clr          (  tcam_stat_clr              ),
   .tcam_stat_addr_rd      (  tcam_stat_addr_rd          ),
   .tcam_stat_rden         (  tcam_stat_rden             ),
   .tcam_stat_data_rd      (  tcam_stat_data_rd          )
);


assign action_tcam_match_en = (flow_table_config[0]) ? 0 : tcam_match_en;
assign action_tcam_miss = tcam_miss;
assign action_tcam_hit = tcam_hit;
assign action_tcam_match_result = tcam_match_result;
//assign action_sel = (header_act_wren_1) ? header_act_dout_0[HW_TRIG_POS+:1] : 0;
assign action_sel = r_tcam_sel[2];

action_table_double
#(
   .C_S_AXI_DATA_WIDTH        (  C_S_AXI_DATA_WIDTH         ),
   .ACT_ADDR_WIDTH            (  TBL_ADDR_WIDTH             ),
   .ACT_TBL_DATA_WIDTH        (  ACT_TBL_DATA_WIDTH         )
)
action_table_double
(
   .axi_aclk                  (  axi_aclk                   ),
   .axi_resetn                (  axi_resetn                 ),
   .action_tcam_match_en      (  action_tcam_match_en       ),
   .action_tcam_miss          (  action_tcam_miss           ),
   .action_tcam_hit           (  action_tcam_hit            ),
   .action_tcam_match_result  (  action_tcam_match_result   ),
   .action_sel                (  action_sel                 ),
   .flow_buffer_sel           (  flow_buffer_sel            ),
   .action_wr_ctrl            (  action_wr_ctrl             ),
   .action_status             (  action_status              ),
   .action_addr_wr            (  action_addr_wr             ),
   .action_wren               (  action_wren                ),
   .action_rden               (  action_rden                ),
   .action_din                (  action_din                 ),
   .action_dout               (  action_dout                ),
   .action_stat_addr_rd       (  action_stat_addr_rd        ),
   .action_stat_rden          (  action_stat_rden           ),
   .action_stat_data_rd       (  action_stat_data_rd        ),
   .action_stat_clr           (  action_stat_clr            ),
   .action_result             (  action_result              ),
   .action_miss               (  action_miss                ),
   .action_hit                (  action_hit                 ),
   .action_result_en          (  action_result_en           )
);


assign action_result_wren = action_result_en;
assign action_result_din = {action_miss, action_hit, action_result};
assign action_result_rden = (flow_table_config[0]) ?
                             1 :
                             ~header_act_empty & ~action_result_empty & m_axis_hdr_act_tready;

//Packet header fields buffer for passing to next flow table.
fallthrough_small_fifo 
#( 
   .WIDTH                  (  ACT_TBL_DATA_WIDTH+2          ),
   .MAX_DEPTH_BITS         (  4                             )
) 
action_result_fifo
( 
   //Outputs 
   .dout                   (  action_result_dout            ),
   .rd_en                  (  action_result_rden            ),
   .full                   (),
   .nearly_full            (),
   .prog_full              (  action_result_full            ),
   .empty                  (  action_result_empty           ),
   //Inputs 
   .din                    (  action_result_din             ), 
   .wr_en                  (  action_result_wren            ), 
   .reset                  (  ~axi_resetn                   ), 
   .clk                    (  axi_aclk                      ) 
);

// Action results updated to pass next flow table.
// This update can be determined by condition, priorities, etc of the
// rules and fields. (mac, ip, port no, etc).
reg   [HDR_ACT_TDATA_WIDTH-1:0]  r_header_act_update;
always @(*) begin
   r_header_act_update = header_act_dout;
   // if set up for update and action result hits.
   if (~flow_table_config[1] & action_result_dout[ACT_TBL_DATA_WIDTH]) begin
      // Update the action results including miss, hit, destination port. 
      r_header_act_update[HDR_ACT_TDATA_WIDTH-ACT_DATA_WIDTH-1+ACT_TBL_DATA_WIDTH+2-1:HDR_ACT_TDATA_WIDTH-ACT_DATA_WIDTH-1] = action_result_dout;
   end
end

//wire  [HDR_ACT_TDATA_WIDTH-1:0]  w_header_act_update = (~flow_table_config[1] & action_result_dout[ACT_TBL_DATA_WIDTH+1]) ?
//      {header_act_dout[(HDR_ACT_TDATA_WIDTH-1)+:1],
//       //Action results updated to pass next flow table.
//       //This update can be determined by condition, priorities, etc of the
//       //rules and fields. (mac, ip, port no, etc).
//       action_result_dout,
//       header_act_dout[0+:(HDR_ACT_TDATA_WIDTH-ACT_DATA_WIDTH-1)]} : header_act_dout;      

assign m_axis_hdr_act_tdata = (flow_table_config[0]) ? header_act_dout : r_header_act_update;
assign m_axis_hdr_act_tuser = header_act_dout[HDR_ACT_TDATA_WIDTH+:HDR_ACT_TUSER_WIDTH];
assign m_axis_hdr_act_tvalid = (flow_table_config[0]) ?
                               ~header_act_empty :
                               ~header_act_empty & ~action_result_empty;

endmodule
