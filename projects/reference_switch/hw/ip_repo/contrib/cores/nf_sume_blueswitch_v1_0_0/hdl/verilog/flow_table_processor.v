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

module flow_table_processor
#(
   parameter   C_S_AXI_DATA_WIDTH      = 32,
   
   parameter   HDR_TDATA_WIDTH         = 32,

   parameter   HDR_ACT_TDATA_WIDTH     = 32,
   parameter   HDR_ACT_TUSER_WIDTH     = 32,

   parameter   HDR_MAC_ADDR_WIDTH      = 48,
   parameter   HDR_ETH_TYPE_WIDTH      = 16,
   parameter   HDR_IP_ADDR_WIDTH       = 32,
   parameter   HDR_IP_PROT_WIDTH       = 16,
   parameter   HDR_PORT_NO_WIDTH       = 16,

   parameter   MAC_TBL_ADDR_WIDTH      = 5,
   parameter   IP_TBL_ADDR_WIDTH       = 5,
   parameter   PORT_NO_TBL_ADDR_WIDTH  = 5,

   //action data width parameter.
   //Destination port, hit, miss, VLAN, vlan action.
   //8 + 2 + 16 + 2 = 28
   //{vlan action(2), vlan(16), miss(1), hit(1), destination port(8)} 
   parameter   ACT_DATA_WIDTH          = 8,
   parameter   ACT_TBL_DATA_WIDTH      = 8
)
(
   input                                        axi_aclk,
   input                                        axi_resetn,

   //Header fields, action results (initial is 0), tcam and action
   //selection.
   input          [HDR_ACT_TDATA_WIDTH-1:0]     s_axis_hdr_act_tdata,
   //Source physical port information.
   input          [HDR_ACT_TUSER_WIDTH-1:0]     s_axis_hdr_act_tuser,
   input                                        s_axis_hdr_act_tvalid,
   output                                       s_axis_hdr_act_tready,

   output         [HDR_ACT_TDATA_WIDTH-1:0]     m_axis_hdr_act_tdata,
   output         [HDR_ACT_TUSER_WIDTH-1:0]     m_axis_hdr_act_tuser,
   output                                       m_axis_hdr_act_tvalid,
   input                                        m_axis_hdr_act_tready,

   //CPU control
   input          [C_S_AXI_DATA_WIDTH-1:0]      bus_configuration,
   input          [5:0]                         bus_flow_table_config,
   //Override mode selction.
   //0: hw triger control,
   //1: tcam_0 (act_0),
   //2: tcam_1 (act_1).
   //[1:0]:ip, [3:2]:mac, [5:4]:port_no
   input          [5:0]                         bus_flow_table_sel,
   input                                        flow_buffer_sel,

   output         [5:0]                         bus_flow_table_status,
   input          [2:0]                         bus_flow_stat_cnt_clr,
   input          [5:0]                         bus_entry_stat_mem_clr,

   //From blueswitch_controller
   input          [MAC_TBL_ADDR_WIDTH-1:0]      bus_mac_tcam_addr,
   input          [HDR_MAC_ADDR_WIDTH-1:0]      bus_mac_tcam_din,
   input          [HDR_MAC_ADDR_WIDTH-1:0]      bus_mac_tcam_din_mask,
   input                                        bus_mac_tcam_wren,
   input                                        bus_mac_tcam_stat_rden,
   output         [C_S_AXI_DATA_WIDTH-1:0]      bus_mac_tcam_stat_rd_data,

   input          [MAC_TBL_ADDR_WIDTH-1:0]      bus_mac_act_addr,
   input          [ACT_TBL_DATA_WIDTH-1:0]      bus_mac_act_din,
   input                                        bus_mac_act_wren,
   input                                        bus_mac_act_stat_rden,
   output         [C_S_AXI_DATA_WIDTH-1:0]      bus_mac_act_stat_rd_data,

   //From blueswitch_controller
   input          [IP_TBL_ADDR_WIDTH-1:0]       bus_ip_tcam_addr,
   input          [HDR_IP_ADDR_WIDTH-1:0]       bus_ip_tcam_din,
   input          [HDR_IP_ADDR_WIDTH-1:0]       bus_ip_tcam_din_mask,
   input                                        bus_ip_tcam_wren,
   input                                        bus_ip_tcam_stat_rden,
   output         [C_S_AXI_DATA_WIDTH-1:0]      bus_ip_tcam_stat_rd_data,

   input          [IP_TBL_ADDR_WIDTH-1:0]       bus_ip_act_addr,
   input          [ACT_TBL_DATA_WIDTH-1:0]      bus_ip_act_din,
   input                                        bus_ip_act_wren,
   input                                        bus_ip_act_stat_rden,
   output         [C_S_AXI_DATA_WIDTH-1:0]      bus_ip_act_stat_rd_data,

   //From blueswitch_controller
   input          [PORT_NO_TBL_ADDR_WIDTH-1:0]  bus_port_no_tcam_addr,
   input          [HDR_PORT_NO_WIDTH-1:0]       bus_port_no_tcam_din,
   input          [HDR_PORT_NO_WIDTH-1:0]       bus_port_no_tcam_din_mask,
   input                                        bus_port_no_tcam_wren,
   input                                        bus_port_no_tcam_stat_rden,
   output         [C_S_AXI_DATA_WIDTH-1:0]      bus_port_no_tcam_stat_rd_data,

   input          [PORT_NO_TBL_ADDR_WIDTH-1:0]  bus_port_no_act_addr,
   input          [ACT_TBL_DATA_WIDTH-1:0]      bus_port_no_act_din,
   input                                        bus_port_no_act_wren,
   input                                        bus_port_no_act_stat_rden,
   output         [C_S_AXI_DATA_WIDTH-1:0]      bus_port_no_act_stat_rd_data,

   output         [C_S_AXI_DATA_WIDTH-1:0]      bus_ip_hit_count,
   output         [C_S_AXI_DATA_WIDTH-1:0]      bus_ip_miss_count,
   output         [C_S_AXI_DATA_WIDTH-1:0]      bus_ip_tot_count,//total input packet counter

   output         [C_S_AXI_DATA_WIDTH-1:0]      bus_mac_hit_count,
   output         [C_S_AXI_DATA_WIDTH-1:0]      bus_mac_miss_count,
   output         [C_S_AXI_DATA_WIDTH-1:0]      bus_mac_tot_count,//total input packet counter

   output         [C_S_AXI_DATA_WIDTH-1:0]      bus_port_no_hit_count,
   output         [C_S_AXI_DATA_WIDTH-1:0]      bus_port_no_miss_count,
   output         [C_S_AXI_DATA_WIDTH-1:0]      bus_port_no_tot_count,//total input packet counter

   output         [ACT_DATA_WIDTH-1:0]          out_action,
   output                                       out_valid,

   input          [MAC_TBL_ADDR_WIDTH-1:0]      axis_mac_tbl_addr,
   input                                        axis_mac_tbl_wren,
   output                                       axis_mac_tbl_busy,
   input          [HDR_MAC_ADDR_WIDTH-1:0]      axis_mac_tbl_wr_data,

   input          [IP_TBL_ADDR_WIDTH-1:0]       axis_ip_tbl_addr,
   input                                        axis_ip_tbl_wren,
   output                                       axis_ip_tbl_busy,
   input          [HDR_IP_ADDR_WIDTH-1:0]       axis_ip_tbl_wr_data,

   input          [PORT_NO_TBL_ADDR_WIDTH-1:0]  axis_port_tbl_addr,
   input                                        axis_port_tbl_wren,
   output                                       axis_port_tbl_busy,
   input          [HDR_PORT_NO_WIDTH-1:0]       axis_port_tbl_wr_data,
  
   input          [MAC_TBL_ADDR_WIDTH-1:0]      axis_port_act_addr,
   input                                        axis_port_act_wren,
   input          [ACT_TBL_DATA_WIDTH-1:0]      axis_port_act_wr_data,

   input          [MAC_TBL_ADDR_WIDTH-1:0]      axis_vlan_act_addr,
   input                                        axis_vlan_act_wren,
   input          [ACT_TBL_DATA_WIDTH-1:0]      axis_vlan_act_wr_data
);

localparam  DST_IP_ADDR_POS = `DEF_IP_PROT + `DEF_ETH_TYPE + `DEF_MAC_ADDR*2;
localparam  IP_HW_TRIG_POS = HDR_TDATA_WIDTH + ACT_DATA_WIDTH;

localparam  DST_MAC_ADDR_POS = 0;
localparam  MAC_HW_TRIG_POS = HDR_TDATA_WIDTH + ACT_DATA_WIDTH;

localparam  DST_PORT_NO_ADDR_POS = `DEF_IP_ADDR*2 + `DEF_IP_PROT + `DEF_ETH_TYPE + `DEF_MAC_ADDR*2;
localparam  PORT_NO_HW_TRIG_POS = HDR_TDATA_WIDTH + ACT_DATA_WIDTH;


wire  [ACT_TBL_DATA_WIDTH-1:0]  w_action_result_ip;
wire  w_action_miss_ip, w_action_hit_ip, w_action_result_en_ip;

wire  [ACT_TBL_DATA_WIDTH-1:0]  w_action_result_mac;
wire  w_action_miss_mac, w_action_hit_mac, w_action_result_en_mac;

wire  [ACT_TBL_DATA_WIDTH-1:0]  w_action_result_port_no;
wire  w_action_miss_port_no, w_action_hit_port_no, w_action_result_en_port_no;

wire  [HDR_ACT_TDATA_WIDTH-1:0]  axis_hdr_act_tdata_0;
wire  [HDR_ACT_TUSER_WIDTH-1:0]  axis_hdr_act_tuser_0;
wire  axis_hdr_act_tvalid_0, axis_hdr_act_tready_0;

wire  [HDR_ACT_TDATA_WIDTH-1:0]  axis_hdr_act_tdata_1;
wire  [HDR_ACT_TUSER_WIDTH-1:0]  axis_hdr_act_tuser_1;
wire  axis_hdr_act_tvalid_1, axis_hdr_act_tready_1;

wire  [HDR_ACT_TDATA_WIDTH-1:0]  axis_hdr_act_tdata_2;
wire  [HDR_ACT_TUSER_WIDTH-1:0]  axis_hdr_act_tuser_2;
wire  axis_hdr_act_tvalid_2, axis_hdr_act_tready_2;

wire  [1:0] flow_table_status_0, flow_table_status_1, flow_table_status_2;

assign bus_flow_table_status = {flow_table_status_2, flow_table_status_1, flow_table_status_0};

flow_table
#(
   .C_S_AXI_DATA_WIDTH        (  C_S_AXI_DATA_WIDTH               ),
   .HDR_ACT_TDATA_WIDTH       (  HDR_ACT_TDATA_WIDTH              ),
   .HDR_ACT_TUSER_WIDTH       (  HDR_ACT_TUSER_WIDTH              ),
   .TBL_ADDR_WIDTH            (  IP_TBL_ADDR_WIDTH                ),
   .TCAM_DATA_WIDTH           (  HDR_IP_ADDR_WIDTH                ),
   .ACT_DATA_WIDTH            (  ACT_DATA_WIDTH                   ),
   .ACT_TBL_DATA_WIDTH        (  ACT_TBL_DATA_WIDTH               ),
   
   .HDR_ENTRY_POS             (  DST_IP_ADDR_POS                  ),
   .HW_TRIG_POS               (  IP_HW_TRIG_POS                   ),
   //0:mac, 1:ip, 2:port_no
   .ENTRY_TYPE                (  1                                ),
   .TCAM_DUMMY_ENTRY          (  32'hace0_face                    )
)
flow_table_ip
(
   .axi_aclk                  (  axi_aclk                         ),
   .axi_resetn                (  axi_resetn                       ),

   //Header fields, action results (initial is 0), tcam and action
   //selection.
   .s_axis_hdr_act_tdata      (  s_axis_hdr_act_tdata             ),
   //Source physical port information.
   .s_axis_hdr_act_tuser      (  s_axis_hdr_act_tuser             ),
   .s_axis_hdr_act_tvalid     (  s_axis_hdr_act_tvalid            ),
   .s_axis_hdr_act_tready     (  s_axis_hdr_act_tready            ),

   .m_axis_hdr_act_tdata      (  axis_hdr_act_tdata_0             ),
   .m_axis_hdr_act_tuser      (  axis_hdr_act_tuser_0             ),
   .m_axis_hdr_act_tvalid     (  axis_hdr_act_tvalid_0            ),
   .m_axis_hdr_act_tready     (  axis_hdr_act_tready_0            ),
   
   .flow_table_status         (  flow_table_status_0              ),
   .flow_table_config         (  bus_flow_table_config[1:0]       ),
   .flow_buffer_sel           (  flow_buffer_sel                  ),

   .tcam_wr_ctrl              (  bus_flow_table_sel[1:0]          ),
   .tcam_addr_wr              (  bus_ip_tcam_addr                 ),
   .tcam_wren                 (  bus_ip_tcam_wren                 ),
   .tcam_din                  (  bus_ip_tcam_din                  ),
   .tcam_din_mask             (  bus_ip_tcam_din_mask             ),
   .tcam_busy                 (  ),

   .tcam_hit_total            (  bus_ip_hit_count                 ),
   .tcam_miss_total           (  bus_ip_miss_count                ),
   .tcam_total                (  bus_ip_tot_count                 ),
   .tcam_flow_stat_clr        (  bus_flow_stat_cnt_clr[0]         ),

   .tcam_stat_addr_rd         (  bus_ip_tcam_addr                 ),
   .tcam_stat_rden            (  bus_ip_tcam_stat_rden            ),
   .tcam_stat_data_rd         (  bus_ip_tcam_stat_rd_data         ),
   .tcam_stat_clr             (  bus_entry_stat_mem_clr[0]        ),
                                                      
   .action_wr_ctrl            (  bus_flow_table_sel[1:0]          ),
   .action_addr_wr            (  bus_ip_act_addr                  ),
   .action_wren               (  bus_ip_act_wren                  ),
   .action_rden               (  ),
   .action_din                (  bus_ip_act_din                   ),
   .action_dout               (  ),

   .action_stat_clr           (  bus_entry_stat_mem_clr[1]        ),
   .action_stat_addr_rd       (  bus_ip_act_addr                  ),
   .action_stat_rden          (  bus_ip_act_stat_rden             ),
   .action_stat_data_rd       (  bus_ip_act_stat_rd_data          ),

   .action_result             (  w_action_result_ip               ),
   .action_miss               (  w_action_miss_ip                 ),
   .action_hit                (  w_action_hit_ip                  ),
   .action_result_en          (  w_action_result_en_ip            )
);

flow_table
#(
   .C_S_AXI_DATA_WIDTH        (  C_S_AXI_DATA_WIDTH               ),
   .HDR_ACT_TDATA_WIDTH       (  HDR_ACT_TDATA_WIDTH              ),
   .HDR_ACT_TUSER_WIDTH       (  HDR_ACT_TUSER_WIDTH              ),
   .TBL_ADDR_WIDTH            (  MAC_TBL_ADDR_WIDTH               ),
   .TCAM_DATA_WIDTH           (  HDR_MAC_ADDR_WIDTH               ),
   .ACT_DATA_WIDTH            (  ACT_DATA_WIDTH                   ),
   .ACT_TBL_DATA_WIDTH        (  ACT_TBL_DATA_WIDTH               ),
   
   .HDR_ENTRY_POS             (  DST_MAC_ADDR_POS                 ),
   .HW_TRIG_POS               (  MAC_HW_TRIG_POS                  ),
   //0:mac, 1:ip, 2:port_no
   .ENTRY_TYPE                (  0                                ),
   .TCAM_DUMMY_ENTRY          (  48'hface_ace0_face               )
)
flow_table_mac
(
   .axi_aclk                  (  axi_aclk                         ),
   .axi_resetn                (  axi_resetn                       ),

   //Header fields, action results (initial is 0), tcam and action
   //selection.
   .s_axis_hdr_act_tdata      (  axis_hdr_act_tdata_0             ),
   //Source physical port information.
   .s_axis_hdr_act_tuser      (  axis_hdr_act_tuser_0             ),
   .s_axis_hdr_act_tvalid     (  axis_hdr_act_tvalid_0            ),
   .s_axis_hdr_act_tready     (  axis_hdr_act_tready_0            ),

   .m_axis_hdr_act_tdata      (  axis_hdr_act_tdata_1             ),
   .m_axis_hdr_act_tuser      (  axis_hdr_act_tuser_1             ),
   .m_axis_hdr_act_tvalid     (  axis_hdr_act_tvalid_1            ),
   .m_axis_hdr_act_tready     (  axis_hdr_act_tready_1            ),

   .flow_table_status         (  flow_table_status_1              ),
   .flow_table_config         (  bus_flow_table_config[3:2]       ),
   .flow_buffer_sel           (  flow_buffer_sel                  ),

   .tcam_wr_ctrl              (  bus_flow_table_sel[3:2]          ),
   .tcam_addr_wr              (  bus_mac_tcam_addr                ),
   .tcam_wren                 (  bus_mac_tcam_wren                ),
   .tcam_din                  (  bus_mac_tcam_din                 ),
   .tcam_din_mask             (  bus_mac_tcam_din_mask            ),
   .tcam_busy                 (  ),

   .tcam_hit_total            (  bus_mac_hit_count                ),
   .tcam_miss_total           (  bus_mac_miss_count               ),
   .tcam_total                (  bus_mac_tot_count                ),
   .tcam_flow_stat_clr        (  bus_flow_stat_cnt_clr[1]         ),

   .tcam_stat_addr_rd         (  bus_mac_tcam_addr                ),
   .tcam_stat_rden            (  bus_mac_tcam_stat_rden           ),
   .tcam_stat_data_rd         (  bus_mac_tcam_stat_rd_data        ),
   .tcam_stat_clr             (  bus_entry_stat_mem_clr[2]        ),
                                                      
   .action_wr_ctrl            (  bus_flow_table_sel[3:2]          ),
   .action_addr_wr            (  bus_mac_act_addr                 ),
   .action_wren               (  bus_mac_act_wren                 ),
   .action_rden               (  ),
   .action_din                (  bus_mac_act_din                  ),
   .action_dout               (  ),

   .action_stat_clr           (  bus_entry_stat_mem_clr[3]        ),
   .action_stat_addr_rd       (  bus_mac_act_addr                 ),
   .action_stat_rden          (  bus_mac_act_stat_rden            ),
   .action_stat_data_rd       (  bus_mac_act_stat_rd_data         ),

   .action_result             (  w_action_result_mac              ),
   .action_miss               (  w_action_miss_mac                ),
   .action_hit                (  w_action_hit_mac                 ),
   .action_result_en          (  w_action_result_en_mac           )
);


flow_table
#(
   .C_S_AXI_DATA_WIDTH        (  C_S_AXI_DATA_WIDTH               ),
   .HDR_ACT_TDATA_WIDTH       (  HDR_ACT_TDATA_WIDTH              ),
   .HDR_ACT_TUSER_WIDTH       (  HDR_ACT_TUSER_WIDTH              ),
   .TBL_ADDR_WIDTH            (  PORT_NO_TBL_ADDR_WIDTH           ),
   .TCAM_DATA_WIDTH           (  HDR_PORT_NO_WIDTH                ),
   .ACT_DATA_WIDTH            (  ACT_DATA_WIDTH                   ),
   .ACT_TBL_DATA_WIDTH        (  ACT_TBL_DATA_WIDTH               ),
   
   .HDR_ENTRY_POS             (  DST_PORT_NO_ADDR_POS             ),
   .HW_TRIG_POS               (  PORT_NO_HW_TRIG_POS              ),
   //0:port_no, 1:ip, 2:port_no
   .ENTRY_TYPE                (  2                                ),
   .TCAM_DUMMY_ENTRY          (  16'hface                         )
)
flow_table_port_no
(
   .axi_aclk                  (  axi_aclk                         ),
   .axi_resetn                (  axi_resetn                       ),

   //Header fields, action results (initial is 0), tcam and action
   //selection.
   .s_axis_hdr_act_tdata      (  axis_hdr_act_tdata_1             ),
   //Source physical port information.
   .s_axis_hdr_act_tuser      (  axis_hdr_act_tuser_1             ),
   .s_axis_hdr_act_tvalid     (  axis_hdr_act_tvalid_1            ),
   .s_axis_hdr_act_tready     (  axis_hdr_act_tready_1            ),

   .m_axis_hdr_act_tdata      (  m_axis_hdr_act_tdata             ),
   .m_axis_hdr_act_tuser      (  m_axis_hdr_act_tuser             ),
   .m_axis_hdr_act_tvalid     (  m_axis_hdr_act_tvalid            ),
   .m_axis_hdr_act_tready     (  m_axis_hdr_act_tready            ),

   .flow_table_status         (  flow_table_status_2              ),
   .flow_table_config         (  bus_flow_table_config[5:4]       ),
   .flow_buffer_sel           (  flow_buffer_sel                  ),

   .tcam_wr_ctrl              (  bus_flow_table_sel[5:4]          ),
   .tcam_addr_wr              (  bus_port_no_tcam_addr            ),
   .tcam_wren                 (  bus_port_no_tcam_wren            ),
   .tcam_din                  (  bus_port_no_tcam_din             ),
   .tcam_din_mask             (  bus_port_no_tcam_din_mask        ),
   .tcam_busy                 (  ),

   .tcam_hit_total            (  bus_port_no_hit_count            ),
   .tcam_miss_total           (  bus_port_no_miss_count           ),
   .tcam_total                (  bus_port_no_tot_count            ),
   .tcam_flow_stat_clr        (  bus_flow_stat_cnt_clr[2]         ),

   .tcam_stat_addr_rd         (  bus_port_no_tcam_addr            ),
   .tcam_stat_rden            (  bus_port_no_tcam_stat_rden       ),
   .tcam_stat_data_rd         (  bus_port_no_tcam_stat_rd_data    ),
   .tcam_stat_clr             (  bus_entry_stat_mem_clr[4]        ),
                                                      
   .action_wr_ctrl            (  bus_flow_table_sel[5:4]          ),
   .action_addr_wr            (  bus_port_no_act_addr             ),
   .action_wren               (  bus_port_no_act_wren             ),
   .action_rden               (  ),
   .action_din                (  bus_port_no_act_din              ),
   .action_dout               (  ),

   .action_stat_clr           (  bus_entry_stat_mem_clr[5]        ),
   .action_stat_addr_rd       (  bus_port_no_act_addr             ),
   .action_stat_rden          (  bus_port_no_act_stat_rden        ),
   .action_stat_data_rd       (  bus_port_no_act_stat_rd_data     ),

   .action_result             (  w_action_result_port_no          ),
   .action_miss               (  w_action_miss_port_no            ),
   .action_hit                (  w_action_hit_port_no             ),
   .action_result_en          (  w_action_result_en_port_no       )
);

assign out_action = {w_action_miss_ip, w_action_hit_ip, w_action_result_ip};
assign out_valid = w_action_result_en_ip;

endmodule
