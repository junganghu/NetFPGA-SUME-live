//
// Copyright (c) 2015 University of Cambridge
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

module blueswitch_flow_table_processor 
#(
   parameter   C_S_AXI_DATA_WIDTH         = 32,          
   parameter   C_S_AXI_ADDR_WIDTH         = 32,          
   parameter   BASEADDR_OFFSET            = 16'hFFFF,
   //miss, hit, vlan[32], miss, hit, dst port[8].
   parameter   C_M_ACT_TDATA_WIDTH        = 256,
   parameter   C_M_ACT_TUSER_WIDTH        = 8,
   //header fields of header parser.
   //header fields must be aligned following outputs of header parser.
   //{
   parameter   C_S_HDR_TDATA_WIDTH        = 256,
   parameter   C_S_HDR_TUSER_WIDTH        = 8,
   //no of data paths including host dma path.
   parameter   NUM_QUEUES                 = 5,
   //header fields width parameter.
   parameter   HDR_MAC_ADDR_WIDTH         = 48,
   parameter   HDR_ETH_TYPE_WIDTH         = 16,
   parameter   HDR_IP_ADDR_WIDTH          = 32,
   parameter   HDR_IP_PROT_WIDTH          = 16,
   parameter   HDR_PORT_NO_WIDTH          = 16,
   parameter   HDR_VLAN_WIDTH             = 32,
   //flow table address width parameter.
   parameter   MAC_TBL_ADDR_WIDTH         = 5,
   parameter   IP_TBL_ADDR_WIDTH          = 5,
   parameter   PORT_NO_TBL_ADDR_WIDTH     = 5,
   //action data width parameter.
   //Destination port, hit, miss, VLAN, vlan action.
   //8 + 2 + 16 + 2 = 28
   //{vlan action(2), vlan(16), miss(1), hit(1), destination port(8)} 
   parameter   ACT_DATA_WIDTH             = 8,
   parameter   ACT_TBL_DATA_WIDTH         = 8
)
(
   input                                              Bus2IP_Clk,
   input                                              Bus2IP_Resetn,
   input          [C_S_AXI_ADDR_WIDTH-1:0]            Bus2IP_Addr,
   input          [0:0]                               Bus2IP_CS,
   input                                              Bus2IP_RNW,
   input          [C_S_AXI_DATA_WIDTH-1:0]            Bus2IP_Data,
   input          [C_S_AXI_DATA_WIDTH/8-1:0]          Bus2IP_BE,
   output         [C_S_AXI_DATA_WIDTH-1:0]            IP2Bus_Data,
   output                                             IP2Bus_RdAck,
   output                                             IP2Bus_WrAck,

   input                                              axi_aclk,
   input                                              axi_resetn,

   input          [C_S_HDR_TDATA_WIDTH-1:0]           s_axis_tdata_0,
   input          [C_S_HDR_TUSER_WIDTH-1:0]           s_axis_tuser_0,
   input                                              s_axis_tvalid_0,
   output                                             s_axis_tready_0,

   input          [C_S_HDR_TDATA_WIDTH-1:0]           s_axis_tdata_1,
   input          [C_S_HDR_TUSER_WIDTH-1:0]           s_axis_tuser_1,
   input                                              s_axis_tvalid_1,
   output                                             s_axis_tready_1,

   input          [C_S_HDR_TDATA_WIDTH-1:0]           s_axis_tdata_2,
   input          [C_S_HDR_TUSER_WIDTH-1:0]           s_axis_tuser_2,
   input                                              s_axis_tvalid_2,
   output                                             s_axis_tready_2,

   input          [C_S_HDR_TDATA_WIDTH-1:0]           s_axis_tdata_3,
   input          [C_S_HDR_TUSER_WIDTH-1:0]           s_axis_tuser_3,
   input                                              s_axis_tvalid_3,
   output                                             s_axis_tready_3,

   input          [C_S_HDR_TDATA_WIDTH-1:0]           s_axis_tdata_4,
   input          [C_S_HDR_TUSER_WIDTH-1:0]           s_axis_tuser_4,
   input                                              s_axis_tvalid_4,
   output                                             s_axis_tready_4,

   //master stream data going to each data path, including action
   //results of flow table processor.
   output         [C_M_ACT_TDATA_WIDTH-1:0]           m_axis_tdata_0,
   output         [C_M_ACT_TUSER_WIDTH-1:0]           m_axis_tuser_0,
   output                                             m_axis_tvalid_0,
   input                                              m_axis_tready_0,

   output         [C_M_ACT_TDATA_WIDTH-1:0]           m_axis_tdata_1,
   output         [C_M_ACT_TUSER_WIDTH-1:0]           m_axis_tuser_1,
   output                                             m_axis_tvalid_1,
   input                                              m_axis_tready_1,

   output         [C_M_ACT_TDATA_WIDTH-1:0]           m_axis_tdata_2,
   output         [C_M_ACT_TUSER_WIDTH-1:0]           m_axis_tuser_2,
   output                                             m_axis_tvalid_2,
   input                                              m_axis_tready_2,

   output         [C_M_ACT_TDATA_WIDTH-1:0]           m_axis_tdata_3,
   output         [C_M_ACT_TUSER_WIDTH-1:0]           m_axis_tuser_3,
   output                                             m_axis_tvalid_3,
   input                                              m_axis_tready_3,

   output         [C_M_ACT_TDATA_WIDTH-1:0]           m_axis_tdata_4,
   output         [C_M_ACT_TUSER_WIDTH-1:0]           m_axis_tuser_4,
   output                                             m_axis_tvalid_4,
   input                                              m_axis_tready_4,

   input          [MAC_TBL_ADDR_WIDTH-1:0]            axis_mac_tbl_addr,
   input                                              axis_mac_tbl_wren,
   output                                             axis_mac_tbl_busy,
   input          [HDR_MAC_ADDR_WIDTH-1:0]            axis_mac_tbl_wr_data,

   input          [IP_TBL_ADDR_WIDTH-1:0]             axis_ip_tbl_addr,
   input                                              axis_ip_tbl_wren,
   output                                             axis_ip_tbl_busy,
   input          [HDR_IP_ADDR_WIDTH-1:0]             axis_ip_tbl_wr_data,

   input          [PORT_NO_TBL_ADDR_WIDTH-1:0]        axis_port_tbl_addr,
   input                                              axis_port_tbl_wren,
   output                                             axis_port_tbl_busy,
   input          [HDR_PORT_NO_WIDTH-1:0]             axis_port_tbl_wr_data,
  
   input          [MAC_TBL_ADDR_WIDTH-1:0]            axis_port_act_addr,
   input                                              axis_port_act_wren,
   input          [ACT_TBL_DATA_WIDTH-1:0]            axis_port_act_wr_data,

   input          [MAC_TBL_ADDR_WIDTH-1:0]            axis_vlan_act_addr,
   input                                              axis_vlan_act_wren,
   input          [ACT_TBL_DATA_WIDTH-1:0]            axis_vlan_act_wr_data,

   input          [63:0]                              stream_update_start,
   input          [63:0]                              stream_update_end,
   output                                             stream_cnt_clear,

   input          [63:0]                              ref_counter
);

reg   parser_en;
reg   [HDR_MAC_ADDR_WIDTH-1:0]   mac_addr, src_mac_addr;
reg   [HDR_ETH_TYPE_WIDTH-1:0]   eth_type;
reg   [HDR_IP_PROT_WIDTH-1:0]    ip_pro;
reg   [HDR_IP_ADDR_WIDTH-1:0]    src_ip_addr, ip_addr;
reg   [HDR_PORT_NO_WIDTH-1:0]    src_port_no, port_no_no;

wire  [C_S_HDR_TDATA_WIDTH-1:0]  parser_tdata;
wire  [C_S_HDR_TUSER_WIDTH-1:0]  parser_tuser;
wire  parser_tvalid;
reg   parser_tready;

wire  out_valid;
wire  [C_M_ACT_TDATA_WIDTH-1:0]  out_action;

wire  [C_S_AXI_DATA_WIDTH-1:0]   bus_configuration;

wire  [5:0] bus_flow_table_config;
wire  [2:0] bus_flow_table_trig;
wire  [5:0] bus_entry_stat_mem_clr;

//From blueswitch_controller
wire  [MAC_TBL_ADDR_WIDTH-1:0]      bus_mac_tcam_addr;
wire  [HDR_MAC_ADDR_WIDTH-1:0]      bus_mac_tcam_din;
wire  [HDR_MAC_ADDR_WIDTH-1:0]      bus_mac_tcam_din_mask;
wire  bus_mac_tcam_wren, bus_mac_tcam_stat_rden;
wire  [C_S_AXI_DATA_WIDTH-1:0]      bus_mac_tcam_stat_rd_data;

wire  [MAC_TBL_ADDR_WIDTH-1:0]      bus_mac_act_addr;
wire  [ACT_TBL_DATA_WIDTH-1:0]      bus_mac_act_din;
wire  bus_mac_act_wren, bus_mac_act_stat_rden;
wire  [C_S_AXI_DATA_WIDTH-1:0]      bus_mac_act_stat_rd_data;

wire  [IP_TBL_ADDR_WIDTH-1:0]       bus_ip_tcam_addr;
wire  [HDR_IP_ADDR_WIDTH-1:0]       bus_ip_tcam_din;
wire  [HDR_IP_ADDR_WIDTH-1:0]       bus_ip_tcam_din_mask;
wire  bus_ip_tcam_wren, bus_ip_tcam_stat_rden;
wire  [C_S_AXI_DATA_WIDTH-1:0]      bus_ip_tcam_stat_rd_data;

wire  [IP_TBL_ADDR_WIDTH-1:0]       bus_ip_act_addr;
wire  [ACT_TBL_DATA_WIDTH-1:0]      bus_ip_act_din;
wire  bus_ip_act_wren, bus_ip_act_stat_rden;
wire  [C_S_AXI_DATA_WIDTH-1:0]      bus_ip_act_stat_rd_data;


wire  [PORT_NO_TBL_ADDR_WIDTH-1:0]  bus_port_no_tcam_addr;
wire  [HDR_PORT_NO_WIDTH-1:0]       bus_port_no_tcam_din;
wire  [HDR_PORT_NO_WIDTH-1:0]       bus_port_no_tcam_din_mask;
wire  bus_port_no_tcam_wren, bus_port_no_tcam_stat_rden;
wire  [C_S_AXI_DATA_WIDTH-1:0]      bus_port_no_tcam_stat_rd_data;

wire  [PORT_NO_TBL_ADDR_WIDTH-1:0]  bus_port_no_act_addr;
wire  [ACT_TBL_DATA_WIDTH-1:0]      bus_port_no_act_din;
wire  bus_port_no_act_wren, bus_port_no_act_stat_rden;
wire  [C_S_AXI_DATA_WIDTH-1:0]      bus_port_no_act_stat_rd_data;

wire  [2:0] bus_flow_stat_cnt_clr;
  
wire  [C_S_AXI_DATA_WIDTH-1:0]      bus_mac_hit_count,
bus_mac_miss_count, bus_mac_tot_count;

wire  [C_S_AXI_DATA_WIDTH-1:0]      bus_ip_hit_count,
bus_ip_miss_count, bus_ip_tot_count;

wire  [C_S_AXI_DATA_WIDTH-1:0]      bus_port_no_hit_count,
bus_port_no_miss_count, bus_port_no_tot_count;

wire  [5:0] bus_flow_table_sel;
wire  [5:0] bus_flow_table_status;

input_header_arbiter
#(
   .C_M_HDR_TDATA_WIDTH       (  C_S_HDR_TDATA_WIDTH     ),
   .C_M_HDR_TUSER_WIDTH       (  C_S_HDR_TUSER_WIDTH     ),

   .C_S_HDR_TDATA_WIDTH       (  C_S_HDR_TDATA_WIDTH     ),
   .C_S_HDR_TUSER_WIDTH       (  C_S_HDR_TUSER_WIDTH     ),

   .NUM_QUEUES                (  NUM_QUEUES              )
)
input_header_arbiter
(
   .axi_aclk                  (  axi_aclk                ),
   .axi_resetn                (  axi_resetn              ),

   .s_axis_tdata_0            (  s_axis_tdata_0          ),
   .s_axis_tuser_0            (  s_axis_tuser_0          ),
   .s_axis_tvalid_0           (  s_axis_tvalid_0         ),
   .s_axis_tready_0           (  s_axis_tready_0         ),

   .s_axis_tdata_1            (  s_axis_tdata_1          ),
   .s_axis_tuser_1            (  s_axis_tuser_1          ),
   .s_axis_tvalid_1           (  s_axis_tvalid_1         ),
   .s_axis_tready_1           (  s_axis_tready_1         ),

   .s_axis_tdata_2            (  s_axis_tdata_2          ),
   .s_axis_tuser_2            (  s_axis_tuser_2          ),
   .s_axis_tvalid_2           (  s_axis_tvalid_2         ),
   .s_axis_tready_2           (  s_axis_tready_2         ),

   .s_axis_tdata_3            (  s_axis_tdata_3          ),
   .s_axis_tuser_3            (  s_axis_tuser_3          ),
   .s_axis_tvalid_3           (  s_axis_tvalid_3         ),
   .s_axis_tready_3           (  s_axis_tready_3         ),

   .s_axis_tdata_4            (  s_axis_tdata_4          ),
   .s_axis_tuser_4            (  s_axis_tuser_4          ),
   .s_axis_tvalid_4           (  s_axis_tvalid_4         ),
   .s_axis_tready_4           (  s_axis_tready_4         ),
   // Master Stream Ports (interface to TX queues)
   // parser_tdata = {srt_port_no[16], dst_port_no[16], src_ip_addr[32], dst_ip_addr[32],
   // ip_pro[8],eth_type[16],src_mac_addr[48],dst_mac_addr[48]}
   .m_axis_tdata              (  parser_tdata            ),
   .m_axis_tuser              (  parser_tuser            ),
   .m_axis_tvalid             (  parser_tvalid           ),
   .m_axis_tready             (  parser_tready           )
);

//
localparam TBL_SEL = 1;//3 tcam and 3 action
localparam HDR_ACT_TDATA_WIDTH = TBL_SEL + ACT_DATA_WIDTH + C_S_HDR_TDATA_WIDTH;

//ToDo
//flow_table_sel_bitmap should include
//tcam and action memory selection - switch all memories.
//action results priorities - mac, ip, port_no, etc.
wire  [`DEF_SW_TAG_VAL-1:0]   sw_tag_val;
assign sw_tag_val = parser_tdata[(C_S_HDR_TDATA_WIDTH-`DEF_SW_TAG-`DEF_SW_TAG_VAL)+:`DEF_SW_TAG_VAL];

reg   flow_buffer_sel;
always @(posedge axi_aclk)
   if (~axi_resetn)
      flow_buffer_sel   <= 0;
   // Trigger signal comes from register or header parser along the the
   // parsing fileds.
   else if (bus_flow_table_trig[0] || sw_tag_val == 1 || sw_tag_val == 3 || sw_tag_val == 4)
      flow_buffer_sel   <= ~flow_buffer_sel;

// TODO this is workaround and needs to be fixed properly.
wire  w_flow_buffer_sel = (sw_tag_val == 1 || sw_tag_val == 3 || sw_tag_val == 4) ? ~flow_buffer_sel : flow_buffer_sel;

reg   [HDR_ACT_TDATA_WIDTH-1:0]   header_act_tdata;
reg   [C_S_HDR_TUSER_WIDTH-1:0]   header_act_tuser;
reg   header_act_tvalid;
wire  header_act_tready;

always @(*) begin
   header_act_tdata     = 0;
   header_act_tuser     = 0;
   header_act_tvalid    = 0;
   parser_tready        = 0;
   if (parser_tvalid & header_act_tready) begin
      header_act_tdata     = {w_flow_buffer_sel,
                              //{ACT_DATA_WIDTH{1'b0}}, //default set to 0.
                              parser_tdata[(C_S_HDR_TDATA_WIDTH-`DEF_SW_TAG_VAL-`DEF_SW_TAG)+:(`DEF_SW_TAG_VAL + `DEF_SW_TAG)],
                              {(ACT_DATA_WIDTH-`DEF_SW_TAG_VAL-`DEF_SW_TAG){1'b0}},
                              parser_tdata};
      header_act_tuser     = parser_tuser;
      header_act_tvalid    = 1;
      parser_tready        = 1;
   end
end
      
wire  [HDR_ACT_TDATA_WIDTH-1:0]   flow_table_tdata;
wire  [C_S_HDR_TUSER_WIDTH-1:0]   flow_table_tuser;
wire  flow_table_tvalid;
wire  flow_table_tready;

flow_table_processor
#(
   .C_S_AXI_DATA_WIDTH              (  C_S_AXI_DATA_WIDTH               ),

   .HDR_TDATA_WIDTH                 (  C_S_HDR_TDATA_WIDTH              ),

   .HDR_ACT_TDATA_WIDTH             (  HDR_ACT_TDATA_WIDTH              ),
   .HDR_ACT_TUSER_WIDTH             (  C_S_HDR_TUSER_WIDTH              ),

   .HDR_MAC_ADDR_WIDTH              (  HDR_MAC_ADDR_WIDTH               ),
   .HDR_ETH_TYPE_WIDTH              (  HDR_ETH_TYPE_WIDTH               ),
   .HDR_IP_ADDR_WIDTH               (  HDR_IP_ADDR_WIDTH                ),
   .HDR_IP_PROT_WIDTH               (  HDR_IP_PROT_WIDTH                ),
   .HDR_PORT_NO_WIDTH               (  HDR_PORT_NO_WIDTH                ),

   .MAC_TBL_ADDR_WIDTH              (  MAC_TBL_ADDR_WIDTH               ),
   .IP_TBL_ADDR_WIDTH               (  IP_TBL_ADDR_WIDTH                ),
   .PORT_NO_TBL_ADDR_WIDTH          (  PORT_NO_TBL_ADDR_WIDTH           ),

   .ACT_DATA_WIDTH                  (  ACT_DATA_WIDTH                   ),
   .ACT_TBL_DATA_WIDTH              (  ACT_TBL_DATA_WIDTH               )
)
flow_table_processor
(
   .axi_aclk                        (  axi_aclk                         ),
   .axi_resetn                      (  axi_resetn                       ),

   //Header fields, action results (initial is 0), tcam and action
   //selection.
   .s_axis_hdr_act_tdata            (  header_act_tdata                 ),
   //Source physical port information.
   .s_axis_hdr_act_tuser            (  header_act_tuser                 ),
   .s_axis_hdr_act_tvalid           (  header_act_tvalid                ),
   //tready must be always zero.
   .s_axis_hdr_act_tready           (  header_act_tready                ),

   .m_axis_hdr_act_tdata            (  flow_table_tdata                 ),
   .m_axis_hdr_act_tuser            (  flow_table_tuser                 ),
   .m_axis_hdr_act_tvalid           (  flow_table_tvalid                ),
   .m_axis_hdr_act_tready           (  flow_table_tready                ),

   .bus_configuration               (  bus_configuration                ),
   .bus_flow_table_config           (  bus_flow_table_config            ),
                                                          
   .bus_flow_table_sel              (  bus_flow_table_sel               ),
   .flow_buffer_sel                 (  flow_buffer_sel                  ),

   .bus_flow_table_status           (  bus_flow_table_status            ),

   .bus_flow_stat_cnt_clr           (  bus_flow_stat_cnt_clr            ),

   .bus_entry_stat_mem_clr          (  bus_entry_stat_mem_clr           ),

     //MAC
   .bus_mac_tcam_addr               (  bus_mac_tcam_addr                ),
   .bus_mac_tcam_din                (  bus_mac_tcam_din                 ),
   .bus_mac_tcam_din_mask           (  bus_mac_tcam_din_mask            ),
   .bus_mac_tcam_wren               (  bus_mac_tcam_wren                ),
   .bus_mac_tcam_stat_rden          (  bus_mac_tcam_stat_rden           ),
   .bus_mac_tcam_stat_rd_data       (  bus_mac_tcam_stat_rd_data        ),

   .bus_mac_act_addr                (  bus_mac_act_addr                 ),
   .bus_mac_act_din                 (  bus_mac_act_din                  ),
   .bus_mac_act_wren                (  bus_mac_act_wren                 ),
   .bus_mac_act_stat_rden           (  bus_mac_act_stat_rden            ),
   .bus_mac_act_stat_rd_data        (  bus_mac_act_stat_rd_data         ),


   .bus_ip_tcam_addr                (  bus_ip_tcam_addr                 ),
   .bus_ip_tcam_din                 (  bus_ip_tcam_din                  ),
   .bus_ip_tcam_din_mask            (  bus_ip_tcam_din_mask             ),
   .bus_ip_tcam_wren                (  bus_ip_tcam_wren                 ),
   .bus_ip_tcam_stat_rden           (  bus_ip_tcam_stat_rden            ),
   .bus_ip_tcam_stat_rd_data        (  bus_ip_tcam_stat_rd_data         ),

   .bus_ip_act_addr                 (  bus_ip_act_addr                  ),
   .bus_ip_act_din                  (  bus_ip_act_din                   ),
   .bus_ip_act_wren                 (  bus_ip_act_wren                  ),
   .bus_ip_act_stat_rden            (  bus_ip_act_stat_rden             ),
   .bus_ip_act_stat_rd_data         (  bus_ip_act_stat_rd_data          ),

   //PORT
   .bus_port_no_tcam_addr           (  bus_port_no_tcam_addr            ),
   .bus_port_no_tcam_din            (  bus_port_no_tcam_din             ),
   .bus_port_no_tcam_din_mask       (  bus_port_no_tcam_din_mask        ),
   .bus_port_no_tcam_wren           (  bus_port_no_tcam_wren            ),
   .bus_port_no_tcam_stat_rden      (  bus_port_no_tcam_stat_rden       ),
   .bus_port_no_tcam_stat_rd_data   (  bus_port_no_tcam_stat_rd_data    ),

   .bus_port_no_act_addr            (  bus_port_no_act_addr             ),
   .bus_port_no_act_din             (  bus_port_no_act_din              ),
   .bus_port_no_act_wren            (  bus_port_no_act_wren             ),
   .bus_port_no_act_stat_rden       (  bus_port_no_act_stat_rden        ),
   .bus_port_no_act_stat_rd_data    (  bus_port_no_act_stat_rd_data     ),


   .bus_ip_hit_count                (  bus_ip_hit_count                 ),
   .bus_ip_miss_count               (  bus_ip_miss_count                ),
   .bus_ip_tot_count                (  bus_ip_tot_count                 ),

   .bus_mac_hit_count               (  bus_mac_hit_count                ),
   .bus_mac_miss_count              (  bus_mac_miss_count               ),
   .bus_mac_tot_count               (  bus_mac_tot_count                ),
   
   .bus_port_no_hit_count           (  bus_port_no_hit_count            ),
   .bus_port_no_miss_count          (  bus_port_no_miss_count           ),
   .bus_port_no_tot_count           (  bus_port_no_tot_count            ),

   .out_action                      (  out_action                       ),
   .out_valid                       (  out_valid                        ),

   .axis_mac_tbl_addr               (  axis_mac_tbl_addr                ),
   .axis_mac_tbl_wren               (  axis_mac_tbl_wren                ),
   .axis_mac_tbl_busy               (  axis_mac_tbl_busy                ),
   .axis_mac_tbl_wr_data            (  axis_mac_tbl_wr_data             ),

   .axis_ip_tbl_addr                (  axis_ip_tbl_addr                 ),
   .axis_ip_tbl_wren                (  axis_ip_tbl_wren                 ),
   .axis_ip_tbl_busy                (  axis_ip_tbl_busy                 ),
   .axis_ip_tbl_wr_data             (  axis_ip_tbl_wr_data              ),

   .axis_port_tbl_addr              (  axis_port_tbl_addr               ),
   .axis_port_tbl_wren              (  axis_port_tbl_wren               ),
   .axis_port_tbl_busy              (  axis_port_tbl_busy               ),
   .axis_port_tbl_wr_data           (  axis_port_tbl_wr_data            ),
 
   .axis_port_act_addr              (  axis_port_act_addr               ),
   .axis_port_act_wren              (  axis_port_act_wren               ),
   .axis_port_act_wr_data           (  axis_port_act_wr_data            ),

   .axis_vlan_act_addr              (  axis_vlan_act_addr               ),
   .axis_vlan_act_wren              (  axis_vlan_act_wren               ),
   .axis_vlan_act_wr_data           (  axis_vlan_act_wr_data            )
);


output_action_arbiter
#(
   .C_S_AXI_DATA_WIDTH              (  C_S_AXI_DATA_WIDTH                  ),
   //Flow table processor result, miss, his, dst port, miss, hit,
   //vlan.
   .C_M_ACT_TDATA_WIDTH             (  ACT_DATA_WIDTH                      ),
   .C_M_ACT_TUSER_WIDTH             (  C_M_ACT_TUSER_WIDTH                 ),
   .C_S_ACT_TDATA_WIDTH             (  ACT_DATA_WIDTH                      ),
   .C_S_ACT_TUSER_WIDTH             (  C_M_ACT_TUSER_WIDTH                 )
)
output_action_arbiter
(
   .axi_aclk                        (  axi_aclk                            ),
   .axi_resetn                      (  axi_resetn                          ),

   .out_arb_counter                 (  out_arb_counter                     ),
   .out_arb_rd_counter              (  out_arb_rd_counter                  ),

   // Master Stream Ports (interface to TX queues)
   .s_axis_tdata                    (  flow_table_tdata[C_S_HDR_TDATA_WIDTH+:ACT_DATA_WIDTH]   ),
   .s_axis_tuser                    (  flow_table_tuser                    ),
   .s_axis_tvalid                   (  flow_table_tvalid                   ),
   .s_axis_tready                   (  flow_table_tready                   ),

   .m_axis_tdata_0                  (  m_axis_tdata_0                      ),
   .m_axis_tuser_0                  (  m_axis_tuser_0                      ),
   .m_axis_tvalid_0                 (  m_axis_tvalid_0                     ),
   .m_axis_tready_0                 (  m_axis_tready_0                     ),

   .m_axis_tdata_1                  (  m_axis_tdata_1                      ),
   .m_axis_tuser_1                  (  m_axis_tuser_1                      ),
   .m_axis_tvalid_1                 (  m_axis_tvalid_1                     ),
   .m_axis_tready_1                 (  m_axis_tready_1                     ),

   .m_axis_tdata_2                  (  m_axis_tdata_2                      ),
   .m_axis_tuser_2                  (  m_axis_tuser_2                      ),
   .m_axis_tvalid_2                 (  m_axis_tvalid_2                     ),
   .m_axis_tready_2                 (  m_axis_tready_2                     ),

   .m_axis_tdata_3                  (  m_axis_tdata_3                      ),
   .m_axis_tuser_3                  (  m_axis_tuser_3                      ),
   .m_axis_tvalid_3                 (  m_axis_tvalid_3                     ),
   .m_axis_tready_3                 (  m_axis_tready_3                     ),

   .m_axis_tdata_4                  (  m_axis_tdata_4                      ),
   .m_axis_tuser_4                  (  m_axis_tuser_4                      ),
   .m_axis_tvalid_4                 (  m_axis_tvalid_4                     ),
   .m_axis_tready_4                 (  m_axis_tready_4                     )
);


flow_table_processor_controller
#(
   .C_S_AXI_ADDR_WIDTH              (  C_S_AXI_ADDR_WIDTH                  ),
   .C_S_AXI_DATA_WIDTH              (  C_S_AXI_DATA_WIDTH                  ),
   .BASEADDR_OFFSET                 (  BASEADDR_OFFSET                     ),

   .HDR_MAC_ADDR_WIDTH              (  HDR_MAC_ADDR_WIDTH                  ),
   .HDR_ETH_TYPE_WIDTH              (  HDR_ETH_TYPE_WIDTH                  ),
   .HDR_IP_ADDR_WIDTH               (  HDR_IP_ADDR_WIDTH                   ),
   .HDR_IP_PROT_WIDTH               (  HDR_IP_PROT_WIDTH                   ),
   .HDR_PORT_NO_WIDTH               (  HDR_PORT_NO_WIDTH                   ),

   .MAC_TBL_ADDR_WIDTH              (  MAC_TBL_ADDR_WIDTH                  ),
   .IP_TBL_ADDR_WIDTH               (  IP_TBL_ADDR_WIDTH                   ),
   .PORT_NO_TBL_ADDR_WIDTH          (  PORT_NO_TBL_ADDR_WIDTH              ),

   //Substitute 2bits, hit and miss.
   .ACT_TBL_DATA_WIDTH              (  `DEF_ACT_TBL_DATA_WIDTH             )
)
flow_table_processor_controller
(
   .Bus2IP_Clk                      (  Bus2IP_Clk                          ),
   .Bus2IP_Resetn                   (  Bus2IP_Resetn                       ),
   .Bus2IP_Addr                     (  Bus2IP_Addr                         ),
   .Bus2IP_CS                       (  Bus2IP_CS                           ),
   .Bus2IP_RNW                      (  Bus2IP_RNW                          ),
   .Bus2IP_Data                     (  Bus2IP_Data                         ),
   .Bus2IP_BE                       (  Bus2IP_BE                           ),
   .IP2Bus_Data                     (  IP2Bus_Data                         ),
   .IP2Bus_RdAck                    (  IP2Bus_RdAck                        ),
   .IP2Bus_WrAck                    (  IP2Bus_WrAck                        ),

   .ref_counter                     (  ref_counter                         ),
                                                                     
   .bus_configuration               (  bus_configuration                   ),
   .bus_flow_table_config           (  bus_flow_table_config               ),
                                                                     
   .bus_flow_table_sel              (  bus_flow_table_sel                  ),

   .bus_flow_table_status           (  bus_flow_table_status               ),

   .stream_update_start             (  stream_update_start                 ),
   .stream_update_end               (  stream_update_end                   ),
   .stream_cnt_clear                (  stream_cnt_clear                    ),

   .bus_flow_table_trig             (  bus_flow_table_trig                 ),
                                                                     
   .bus_entry_stat_mem_clr          (  bus_entry_stat_mem_clr              ),
                                                                     
   .bus_mac_tcam_addr               (  bus_mac_tcam_addr                   ),
   .bus_mac_tcam_din                (  bus_mac_tcam_din                    ),
   .bus_mac_tcam_din_mask           (  bus_mac_tcam_din_mask               ),
   .bus_mac_tcam_wren               (  bus_mac_tcam_wren                   ),
   .bus_mac_tcam_stat_rden          (  bus_mac_tcam_stat_rden              ),
   .bus_mac_tcam_stat_rd_data       (  bus_mac_tcam_stat_rd_data           ),

   .bus_mac_act_addr                (  bus_mac_act_addr                    ),
   .bus_mac_act_din                 (  bus_mac_act_din                     ),
   .bus_mac_act_wren                (  bus_mac_act_wren                    ),
   .bus_mac_act_stat_rden           (  bus_mac_act_stat_rden               ),
   .bus_mac_act_stat_rd_data        (  bus_mac_act_stat_rd_data            ),


   .bus_ip_tcam_addr                (  bus_ip_tcam_addr                    ),
   .bus_ip_tcam_din                 (  bus_ip_tcam_din                     ),
   .bus_ip_tcam_din_mask            (  bus_ip_tcam_din_mask                ),
   .bus_ip_tcam_wren                (  bus_ip_tcam_wren                    ),
   .bus_ip_tcam_stat_rden           (  bus_ip_tcam_stat_rden               ),
   .bus_ip_tcam_stat_rd_data        (  bus_ip_tcam_stat_rd_data            ),

   .bus_ip_act_addr                 (  bus_ip_act_addr                     ),
   .bus_ip_act_din                  (  bus_ip_act_din                      ),
   .bus_ip_act_wren                 (  bus_ip_act_wren                     ),
   .bus_ip_act_stat_rden            (  bus_ip_act_stat_rden                ),
   .bus_ip_act_stat_rd_data         (  bus_ip_act_stat_rd_data             ),


   .bus_port_no_tcam_addr           (  bus_port_no_tcam_addr               ),
   .bus_port_no_tcam_din            (  bus_port_no_tcam_din                ),
   .bus_port_no_tcam_din_mask       (  bus_port_no_tcam_din_mask           ),
   .bus_port_no_tcam_wren           (  bus_port_no_tcam_wren               ),
   .bus_port_no_tcam_stat_rden      (  bus_port_no_tcam_stat_rden          ),
   .bus_port_no_tcam_stat_rd_data   (  bus_port_no_tcam_stat_rd_data       ),

   .bus_port_no_act_addr            (  bus_port_no_act_addr                ),
   .bus_port_no_act_din             (  bus_port_no_act_din                 ),
   .bus_port_no_act_wren            (  bus_port_no_act_wren                ),
   .bus_port_no_act_stat_rden       (  bus_port_no_act_stat_rden           ),
   .bus_port_no_act_stat_rd_data    (  bus_port_no_act_stat_rd_data        ),

                                                                       
   .bus_flow_stat_cnt_clr           (  bus_flow_stat_cnt_clr               ),

   .bus_mac_hit_count               (  bus_mac_hit_count                   ),
   .bus_mac_miss_count              (  bus_mac_miss_count                  ),
   .bus_mac_tot_count               (  bus_mac_tot_count                   ),

   .bus_ip_hit_count                (  bus_ip_hit_count                    ),
   .bus_ip_miss_count               (  bus_ip_miss_count                   ),
   .bus_ip_tot_count                (  bus_ip_tot_count                    ),

   .bus_port_no_hit_count           (  bus_port_no_hit_count               ),
   .bus_port_no_miss_count          (  bus_port_no_miss_count              ),
   .bus_port_no_tot_count           (  bus_port_no_tot_count               )
);

endmodule
