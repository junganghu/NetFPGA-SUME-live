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

module blueswitch_top 
#(
   parameter   C_S_AXI_DATA_WIDTH      = 32,          
   parameter   C_S_AXI_ADDR_WIDTH      = 32,          

   parameter   C_M_AXIS_TDATA_WIDTH    = 64,
   parameter   C_S_AXIS_TDATA_WIDTH    = 64,
   parameter   C_M_AXIS_TUSER_WIDTH    = 128,
   parameter   C_S_AXIS_TUSER_WIDTH    = 128
)
(
   // Slave AXI Ports
   input                                              Bus2IP_Clk,
   input                                              Bus2IP_Resetn,
   input       [C_S_AXI_ADDR_WIDTH-1:0]               Bus2IP_Addr,
   input       [0:0]                                  Bus2IP_CS,
   input                                              Bus2IP_RNW,
   input       [C_S_AXI_DATA_WIDTH-1:0]               Bus2IP_Data,
   input       [C_S_AXI_DATA_WIDTH/8-1:0]             Bus2IP_BE,
   output      [C_S_AXI_DATA_WIDTH-1:0]               IP2Bus_Data,
   output                                             IP2Bus_RdAck,
   output                                             IP2Bus_WrAck,

   input                                              axi_aclk,
   input                                              axi_resetn,

   // Slave Stream Ports (interface to data path)
   input       [C_S_AXIS_TDATA_WIDTH-1:0]             s_axis_tdata_0,
   input       [((C_S_AXIS_TDATA_WIDTH/8))-1:0]       s_axis_tstrb_0,
   input       [C_S_AXIS_TUSER_WIDTH-1:0]             s_axis_tuser_0,
   input                                              s_axis_tvalid_0,
   output                                             s_axis_tready_0,
   input                                              s_axis_tlast_0,

   // Master Stream Ports (interface to TX queues)
   output      [C_M_AXIS_TDATA_WIDTH-1:0]             m_axis_tdata_0,
   output      [((C_M_AXIS_TDATA_WIDTH/8))-1:0]       m_axis_tstrb_0,
   output      [C_M_AXIS_TUSER_WIDTH-1:0]             m_axis_tuser_0,
   output                                             m_axis_tvalid_0,
   input                                              m_axis_tready_0,
   output                                             m_axis_tlast_0,

   // Slave Stream Ports (interface to data path)
   input       [C_S_AXIS_TDATA_WIDTH-1:0]             s_axis_tdata_1,
   input       [((C_S_AXIS_TDATA_WIDTH/8))-1:0]       s_axis_tstrb_1,
   input       [C_S_AXIS_TUSER_WIDTH-1:0]             s_axis_tuser_1,
   input                                              s_axis_tvalid_1,
   output                                             s_axis_tready_1,
   input                                              s_axis_tlast_1,

   // Master Stream Ports (interface to TX queues)
   output      [C_M_AXIS_TDATA_WIDTH-1:0]             m_axis_tdata_1,
   output      [((C_M_AXIS_TDATA_WIDTH/8))-1:0]       m_axis_tstrb_1,
   output      [C_M_AXIS_TUSER_WIDTH-1:0]             m_axis_tuser_1,
   output                                             m_axis_tvalid_1,
   input                                              m_axis_tready_1,
   output                                             m_axis_tlast_1,

   // Slave Stream Ports (interface to data path)
   input       [C_S_AXIS_TDATA_WIDTH-1:0]             s_axis_tdata_2,
   input       [((C_S_AXIS_TDATA_WIDTH/8))-1:0]       s_axis_tstrb_2,
   input       [C_S_AXIS_TUSER_WIDTH-1:0]             s_axis_tuser_2,
   input                                              s_axis_tvalid_2,
   output                                             s_axis_tready_2,
   input                                              s_axis_tlast_2,

   // Master Stream Ports (interface to TX queues)
   output      [C_M_AXIS_TDATA_WIDTH-1:0]             m_axis_tdata_2,
   output      [((C_M_AXIS_TDATA_WIDTH/8))-1:0]       m_axis_tstrb_2,
   output      [C_M_AXIS_TUSER_WIDTH-1:0]             m_axis_tuser_2,
   output                                             m_axis_tvalid_2,
   input                                              m_axis_tready_2,
   output                                             m_axis_tlast_2,

   // Slave Stream Ports (interface to data path)
   input       [C_S_AXIS_TDATA_WIDTH-1:0]             s_axis_tdata_3,
   input       [((C_S_AXIS_TDATA_WIDTH/8))-1:0]       s_axis_tstrb_3,
   input       [C_S_AXIS_TUSER_WIDTH-1:0]             s_axis_tuser_3,
   input                                              s_axis_tvalid_3,
   output                                             s_axis_tready_3,
   input                                              s_axis_tlast_3,

   // Master Stream Ports (interface to TX queues)
   output      [C_M_AXIS_TDATA_WIDTH-1:0]             m_axis_tdata_3,
   output      [((C_M_AXIS_TDATA_WIDTH/8))-1:0]       m_axis_tstrb_3,
   output      [C_M_AXIS_TUSER_WIDTH-1:0]             m_axis_tuser_3,
   output                                             m_axis_tvalid_3,
   input                                              m_axis_tready_3,
   output                                             m_axis_tlast_3,

   // Slave Stream Ports (interface to data path)
   input       [C_S_AXIS_TDATA_WIDTH-1:0]             s_axis_tdata_4,
   input       [((C_S_AXIS_TDATA_WIDTH/8))-1:0]       s_axis_tstrb_4,
   input       [C_S_AXIS_TUSER_WIDTH-1:0]             s_axis_tuser_4,
   input                                              s_axis_tvalid_4,
   output                                             s_axis_tready_4,
   input                                              s_axis_tlast_4,

   // Master Stream Ports (interface to TX queues)
   output      [C_M_AXIS_TDATA_WIDTH-1:0]             m_axis_tdata_4,
   output      [((C_M_AXIS_TDATA_WIDTH/8))-1:0]       m_axis_tstrb_4,
   output      [C_M_AXIS_TUSER_WIDTH-1:0]             m_axis_tuser_4,
   output                                             m_axis_tvalid_4,
   input                                              m_axis_tready_4,
   output                                             m_axis_tlast_4,

   input       [63:0]                                 ref_counter
);

localparam  HDR_MAC_ADDR_WIDTH         = 48;
localparam  HDR_ETH_TYPE_WIDTH         = 16;
localparam  HDR_IP_ADDR_WIDTH          = 32;
localparam  HDR_IP_PROT_WIDTH          = 8;
localparam  HDR_PORT_NO_WIDTH          = 16;
localparam  HDR_VLAN_WIDTH             = 32;

localparam  MAC_TBL_ADDR_WIDTH         = `DEF_TCAM_WIDTH;
localparam  IP_TBL_ADDR_WIDTH          = `DEF_TCAM_WIDTH;
localparam  PORT_NO_TBL_ADDR_WIDTH     = `DEF_TCAM_WIDTH;

//48*2 + 8 + 16 + 16*2 + 32*2 + 32 + 4 = 252
localparam  C_M_HDR_TDATA_WIDTH        = HDR_MAC_ADDR_WIDTH*2 + HDR_IP_PROT_WIDTH + 
                                         HDR_ETH_TYPE_WIDTH + HDR_PORT_NO_WIDTH*2 +
                                         HDR_IP_ADDR_WIDTH*2 +
                                         `DEF_SW_TAG + `DEF_SW_TAG_VAL;
//Source physical port
localparam  C_M_HDR_TUSER_WIDTH        = 8;

//sw tag, sw tag val, destination port, hit, miss, VLAN, vlan action.
//32 + 4 + 8 + 2 + 16 + 2 = 64
//{sw tag(32), sw tag val(4), vlan action(2), vlan(16), miss(1), hit(1), destination port(8)}
localparam  ACT_RESULT                 = 2; //miss, hit.
localparam  ACT_DST_PORT_WIDTH         = 8;
localparam  ACT_VLAN_WIDTH             = 2+16;
localparam  ACT_DATA_WIDTH             = ACT_DST_PORT_WIDTH + ACT_VLAN_WIDTH + ACT_RESULT + `DEF_SW_TAG + `DEF_SW_TAG_VAL;
localparam  C_S_ACT_TDATA_WIDTH        = ACT_DATA_WIDTH;
localparam  C_S_ACT_TUSER_WIDTH        = 8;

// -- Signals
wire  [C_S_AXI_DATA_WIDTH-1:0]         IP2Bus_Data_0;
wire                                   IP2Bus_RdAck_0;
wire                                   IP2Bus_WrAck_0;
wire  [C_S_AXI_DATA_WIDTH-1:0]         IP2Bus_Data_1;
wire                                   IP2Bus_RdAck_1;
wire                                   IP2Bus_WrAck_1;
wire  [C_S_AXI_DATA_WIDTH-1:0]         IP2Bus_Data_2;
wire                                   IP2Bus_RdAck_2;
wire                                   IP2Bus_WrAck_2;
wire  [C_S_AXI_DATA_WIDTH-1:0]         IP2Bus_Data_3;
wire                                   IP2Bus_RdAck_3;
wire                                   IP2Bus_WrAck_3;
wire  [C_S_AXI_DATA_WIDTH-1:0]         IP2Bus_Data_4;
wire                                   IP2Bus_RdAck_4;
wire                                   IP2Bus_WrAck_4;
wire  [C_S_AXI_DATA_WIDTH-1:0]         IP2Bus_Data_5;
wire                                   IP2Bus_RdAck_5;
wire                                   IP2Bus_WrAck_5;
wire                                   IP2Bus_Error = 0;

assign IP2Bus_Data = (Bus2IP_Addr[12+:4] == 0  || Bus2IP_Addr[12+:4] == 1)  ? IP2Bus_Data_0 :
                     (Bus2IP_Addr[12+:4] == 2  || Bus2IP_Addr[12+:4] == 3)  ? IP2Bus_Data_1 :
                     (Bus2IP_Addr[12+:4] == 4  || Bus2IP_Addr[12+:4] == 5)  ? IP2Bus_Data_2 :
                     (Bus2IP_Addr[12+:4] == 6  || Bus2IP_Addr[12+:4] == 7)  ? IP2Bus_Data_3 :
                     (Bus2IP_Addr[12+:4] == 8  || Bus2IP_Addr[12+:4] == 9)  ? IP2Bus_Data_4 :
                     (Bus2IP_Addr[12+:4] == 10 || Bus2IP_Addr[12+:4] == 11) ? IP2Bus_Data_5 : 
                                                                              IP2Bus_Data_0;

assign IP2Bus_RdAck = (Bus2IP_Addr[12+:4] == 0  || Bus2IP_Addr[12+:4] == 1)  ? IP2Bus_RdAck_0 :
                      (Bus2IP_Addr[12+:4] == 2  || Bus2IP_Addr[12+:4] == 3)  ? IP2Bus_RdAck_1 :
                      (Bus2IP_Addr[12+:4] == 4  || Bus2IP_Addr[12+:4] == 5)  ? IP2Bus_RdAck_2 :
                      (Bus2IP_Addr[12+:4] == 6  || Bus2IP_Addr[12+:4] == 7)  ? IP2Bus_RdAck_3 :
                      (Bus2IP_Addr[12+:4] == 8  || Bus2IP_Addr[12+:4] == 9)  ? IP2Bus_RdAck_4 :
                      (Bus2IP_Addr[12+:4] == 10 || Bus2IP_Addr[12+:4] == 11) ? IP2Bus_RdAck_5 :
                                                                               IP2Bus_RdAck_0;

assign IP2Bus_WrAck = (Bus2IP_Addr[12+:4] == 0  || Bus2IP_Addr[12+:4] == 1)  ? IP2Bus_WrAck_0 :
                      (Bus2IP_Addr[12+:4] == 2  || Bus2IP_Addr[12+:4] == 3)  ? IP2Bus_WrAck_1 :
                      (Bus2IP_Addr[12+:4] == 4  || Bus2IP_Addr[12+:4] == 5)  ? IP2Bus_WrAck_2 :
                      (Bus2IP_Addr[12+:4] == 6  || Bus2IP_Addr[12+:4] == 7)  ? IP2Bus_WrAck_3 :
                      (Bus2IP_Addr[12+:4] == 8  || Bus2IP_Addr[12+:4] == 9)  ? IP2Bus_WrAck_4 :
                      (Bus2IP_Addr[12+:4] == 10 || Bus2IP_Addr[12+:4] == 11) ? IP2Bus_WrAck_5 : 
                                                                               IP2Bus_WrAck_0;

wire  [C_S_ACT_TDATA_WIDTH-1:0]  s_match_tdata_0, s_match_tdata_1, s_match_tdata_2, s_match_tdata_3, s_match_tdata_4;
wire  [C_S_ACT_TUSER_WIDTH-1:0]  s_match_tuser_0, s_match_tuser_1, s_match_tuser_2, s_match_tuser_3, s_match_tuser_4;
wire  s_match_tvalid_0, s_match_tvalid_1, s_match_tvalid_2, s_match_tvalid_3, s_match_tvalid_4;
wire  s_match_tready_0, s_match_tready_1, s_match_tready_2, s_match_tready_3, s_match_tready_4;

wire  [C_M_HDR_TDATA_WIDTH-1:0]  m_match_tdata_0, m_match_tdata_1, m_match_tdata_2, m_match_tdata_3, m_match_tdata_4;
wire  [C_M_HDR_TUSER_WIDTH-1:0]  m_match_tuser_0, m_match_tuser_1, m_match_tuser_2, m_match_tuser_3, m_match_tuser_4;
wire  m_match_tvalid_0, m_match_tvalid_1, m_match_tvalid_2, m_match_tvalid_3, m_match_tvalid_4;
wire  m_match_tready_0, m_match_tready_1, m_match_tready_2, m_match_tready_3, m_match_tready_4;

blueswitch_data_processor
#(
   .C_S_AXI_DATA_WIDTH        (  C_S_AXI_DATA_WIDTH         ),          
   .C_S_AXI_ADDR_WIDTH        (  C_S_AXI_ADDR_WIDTH         ),          
   .BASEADDR_OFFSET           (  16'h0000                   ),

   .C_M_AXIS_TDATA_WIDTH      (  C_M_AXIS_TDATA_WIDTH       ),
   .C_S_AXIS_TDATA_WIDTH      (  C_S_AXIS_TDATA_WIDTH       ),
   .C_M_AXIS_TUSER_WIDTH      (  C_M_AXIS_TUSER_WIDTH       ),
   .C_S_AXIS_TUSER_WIDTH      (  C_S_AXIS_TUSER_WIDTH       ),

   .HDR_MAC_ADDR_WIDTH        (  HDR_MAC_ADDR_WIDTH         ),
   .HDR_ETH_TYPE_WIDTH        (  HDR_ETH_TYPE_WIDTH         ),
   .HDR_IP_ADDR_WIDTH         (  HDR_IP_ADDR_WIDTH          ),
   .HDR_IP_PROT_WIDTH         (  HDR_IP_PROT_WIDTH          ),
   .HDR_PORT_NO_WIDTH         (  HDR_PORT_NO_WIDTH          ),
   .HDR_VLAN_WIDTH            (  HDR_VLAN_WIDTH             ),

   .C_M_HDR_TDATA_WIDTH       (  C_M_HDR_TDATA_WIDTH        ),
   .C_M_HDR_TUSER_WIDTH       (  C_M_HDR_TUSER_WIDTH        ),

   .C_S_ACT_TDATA_WIDTH       (  C_S_ACT_TDATA_WIDTH        ),
   .C_S_ACT_TUSER_WIDTH       (  C_S_ACT_TUSER_WIDTH        ),
   //NF10 Physical port 0
   //8'h01=0, 8'h02=1, 8'h04=2, 8'h08=3, 8'h10=host DMA.
   .SOURCE_PORT               (  8'h01                      ),
   .TUSER_SRC_PORT            (  8'h01                      )
)
blueswitch_data_processor_0
(
   // Slave AXI Ports
   .Bus2IP_Clk                (  Bus2IP_Clk                 ),
   .Bus2IP_Resetn             (  Bus2IP_Resetn              ),
   .Bus2IP_Addr               (  Bus2IP_Addr                ),
   .Bus2IP_CS                 (  Bus2IP_CS                  ),
   .Bus2IP_RNW                (  Bus2IP_RNW                 ),
   .Bus2IP_Data               (  Bus2IP_Data                ),
   .Bus2IP_BE                 (  Bus2IP_BE                  ),
   .IP2Bus_Data               (  IP2Bus_Data_0              ),
   .IP2Bus_RdAck              (  IP2Bus_RdAck_0             ),
   .IP2Bus_WrAck              (  IP2Bus_WrAck_0             ),

   .axi_aclk                  (  axi_aclk                   ),
   .axi_resetn                (  axi_resetn                 ),

   // Slave Stream Ports (interface to data path)
   .s_axis_tdata              (  s_axis_tdata_0             ),
   .s_axis_tstrb              (  s_axis_tstrb_0             ),
   .s_axis_tuser              (  s_axis_tuser_0             ),
   .s_axis_tvalid             (  s_axis_tvalid_0            ),
   .s_axis_tready             (  s_axis_tready_0            ),
   .s_axis_tlast              (  s_axis_tlast_0             ),

   // Master Stream Ports (interface to TX queues)
   .m_axis_tdata              (  m_axis_tdata_0             ),
   .m_axis_tstrb              (  m_axis_tstrb_0             ),
   .m_axis_tuser              (  m_axis_tuser_0             ),
   .m_axis_tvalid             (  m_axis_tvalid_0            ),
   .m_axis_tready             (  m_axis_tready_0            ),
   .m_axis_tlast              (  m_axis_tlast_0             ),

   //Paser and match results
   .s_match_tdata             (  s_match_tdata_0            ),
   .s_match_tuser             (  s_match_tuser_0            ),
   .s_match_tvalid            (  s_match_tvalid_0           ),
   .s_match_tready            (  s_match_tready_0           ),

   .m_match_tdata             (  m_match_tdata_0            ),
   .m_match_tuser             (  m_match_tuser_0            ),
   .m_match_tvalid            (  m_match_tvalid_0           ),
   .m_match_tready            (  m_match_tready_0           ),

   .ref_counter               (  ref_counter                )
);

blueswitch_data_processor
#(
   .C_S_AXI_DATA_WIDTH        (  C_S_AXI_DATA_WIDTH         ),          
   .C_S_AXI_ADDR_WIDTH        (  C_S_AXI_ADDR_WIDTH         ),          
   .BASEADDR_OFFSET           (  16'h2000                   ),

   .C_M_AXIS_TDATA_WIDTH      (  C_M_AXIS_TDATA_WIDTH       ),
   .C_S_AXIS_TDATA_WIDTH      (  C_S_AXIS_TDATA_WIDTH       ),
   .C_M_AXIS_TUSER_WIDTH      (  C_M_AXIS_TUSER_WIDTH       ),
   .C_S_AXIS_TUSER_WIDTH      (  C_S_AXIS_TUSER_WIDTH       ),

   .HDR_MAC_ADDR_WIDTH        (  HDR_MAC_ADDR_WIDTH         ),
   .HDR_ETH_TYPE_WIDTH        (  HDR_ETH_TYPE_WIDTH         ),
   .HDR_IP_ADDR_WIDTH         (  HDR_IP_ADDR_WIDTH          ),
   .HDR_IP_PROT_WIDTH         (  HDR_IP_PROT_WIDTH          ),
   .HDR_PORT_NO_WIDTH         (  HDR_PORT_NO_WIDTH          ),
   .HDR_VLAN_WIDTH            (  HDR_VLAN_WIDTH             ),

   .C_M_HDR_TDATA_WIDTH       (  C_M_HDR_TDATA_WIDTH        ),
   .C_M_HDR_TUSER_WIDTH       (  C_M_HDR_TUSER_WIDTH        ),

   .C_S_ACT_TDATA_WIDTH       (  C_S_ACT_TDATA_WIDTH        ),
   .C_S_ACT_TUSER_WIDTH       (  C_S_ACT_TUSER_WIDTH        ),
   //NF10 Physical port 1 for meta data arbitration
   .SOURCE_PORT               (  8'h02                      ),
   .TUSER_SRC_PORT            (  8'h04                      )
)
blueswitch_data_processor_1
(
   // Slave AXI Ports
   .Bus2IP_Clk                (  Bus2IP_Clk                 ),
   .Bus2IP_Resetn             (  Bus2IP_Resetn              ),
   .Bus2IP_Addr               (  Bus2IP_Addr                ),
   .Bus2IP_CS                 (  Bus2IP_CS                  ),
   .Bus2IP_RNW                (  Bus2IP_RNW                 ),
   .Bus2IP_Data               (  Bus2IP_Data                ),
   .Bus2IP_BE                 (  Bus2IP_BE                  ),
   .IP2Bus_Data               (  IP2Bus_Data_1              ),
   .IP2Bus_RdAck              (  IP2Bus_RdAck_1             ),
   .IP2Bus_WrAck              (  IP2Bus_WrAck_1             ),

   .axi_aclk                  (  axi_aclk                   ),
   .axi_resetn                (  axi_resetn                 ),

   // Slave Stream Ports (interface to data path)
   .s_axis_tdata              (  s_axis_tdata_1             ),
   .s_axis_tstrb              (  s_axis_tstrb_1             ),
   .s_axis_tuser              (  s_axis_tuser_1             ),
   .s_axis_tvalid             (  s_axis_tvalid_1            ),
   .s_axis_tready             (  s_axis_tready_1            ),
   .s_axis_tlast              (  s_axis_tlast_1             ),

   // Master Stream Ports (interface to TX queues)
   .m_axis_tdata              (  m_axis_tdata_1             ),
   .m_axis_tstrb              (  m_axis_tstrb_1             ),
   .m_axis_tuser              (  m_axis_tuser_1             ),
   .m_axis_tvalid             (  m_axis_tvalid_1            ),
   .m_axis_tready             (  m_axis_tready_1            ),
   .m_axis_tlast              (  m_axis_tlast_1             ),

   //Paser and match results
   .s_match_tdata             (  s_match_tdata_1            ),
   .s_match_tuser             (  s_match_tuser_1            ),
   .s_match_tvalid            (  s_match_tvalid_1           ),
   .s_match_tready            (  s_match_tready_1           ),

   .m_match_tdata             (  m_match_tdata_1            ),
   .m_match_tuser             (  m_match_tuser_1            ),
   .m_match_tvalid            (  m_match_tvalid_1           ),
   .m_match_tready            (  m_match_tready_1           ),

   .ref_counter               (  ref_counter                )
);

blueswitch_data_processor
#(
   .C_S_AXI_DATA_WIDTH        (  C_S_AXI_DATA_WIDTH         ),          
   .C_S_AXI_ADDR_WIDTH        (  C_S_AXI_ADDR_WIDTH         ),          
   .BASEADDR_OFFSET           (  16'h4000                   ),

   .C_M_AXIS_TDATA_WIDTH      (  C_M_AXIS_TDATA_WIDTH       ),
   .C_S_AXIS_TDATA_WIDTH      (  C_S_AXIS_TDATA_WIDTH       ),
   .C_M_AXIS_TUSER_WIDTH      (  C_M_AXIS_TUSER_WIDTH       ),
   .C_S_AXIS_TUSER_WIDTH      (  C_S_AXIS_TUSER_WIDTH       ),

   .HDR_MAC_ADDR_WIDTH        (  HDR_MAC_ADDR_WIDTH         ),
   .HDR_ETH_TYPE_WIDTH        (  HDR_ETH_TYPE_WIDTH         ),
   .HDR_IP_ADDR_WIDTH         (  HDR_IP_ADDR_WIDTH          ),
   .HDR_IP_PROT_WIDTH         (  HDR_IP_PROT_WIDTH          ),
   .HDR_PORT_NO_WIDTH         (  HDR_PORT_NO_WIDTH          ),
   .HDR_VLAN_WIDTH            (  HDR_VLAN_WIDTH             ),

   .C_M_HDR_TDATA_WIDTH       (  C_M_HDR_TDATA_WIDTH        ),
   .C_M_HDR_TUSER_WIDTH       (  C_M_HDR_TUSER_WIDTH        ),

   .C_S_ACT_TDATA_WIDTH       (  C_S_ACT_TDATA_WIDTH        ),
   .C_S_ACT_TUSER_WIDTH       (  C_S_ACT_TUSER_WIDTH        ),
   //NF10 Physical port 2
   .SOURCE_PORT               (  8'h04                      ),
   .TUSER_SRC_PORT            (  8'h10                      )
)
blueswitch_data_processor_2
(
   // Slave AXI Ports
   .Bus2IP_Clk                (  Bus2IP_Clk                 ),
   .Bus2IP_Resetn             (  Bus2IP_Resetn              ),
   .Bus2IP_Addr               (  Bus2IP_Addr                ),
   .Bus2IP_CS                 (  Bus2IP_CS                  ),
   .Bus2IP_RNW                (  Bus2IP_RNW                 ),
   .Bus2IP_Data               (  Bus2IP_Data                ),
   .Bus2IP_BE                 (  Bus2IP_BE                  ),
   .IP2Bus_Data               (  IP2Bus_Data_2              ),
   .IP2Bus_RdAck              (  IP2Bus_RdAck_2             ),
   .IP2Bus_WrAck              (  IP2Bus_WrAck_2             ),

   .axi_aclk                  (  axi_aclk                   ),
   .axi_resetn                (  axi_resetn                 ),

   // Slave Stream Ports (interface to data path)
   .s_axis_tdata              (  s_axis_tdata_2             ),
   .s_axis_tstrb              (  s_axis_tstrb_2             ),
   .s_axis_tuser              (  s_axis_tuser_2             ),
   .s_axis_tvalid             (  s_axis_tvalid_2            ),
   .s_axis_tready             (  s_axis_tready_2            ),
   .s_axis_tlast              (  s_axis_tlast_2             ),

   // Master Stream Ports (interface to TX queues)
   .m_axis_tdata              (  m_axis_tdata_2             ),
   .m_axis_tstrb              (  m_axis_tstrb_2             ),
   .m_axis_tuser              (  m_axis_tuser_2             ),
   .m_axis_tvalid             (  m_axis_tvalid_2            ),
   .m_axis_tready             (  m_axis_tready_2            ),
   .m_axis_tlast              (  m_axis_tlast_2             ),

   //Paser and match results
   .s_match_tdata             (  s_match_tdata_2            ),
   .s_match_tuser             (  s_match_tuser_2            ),
   .s_match_tvalid            (  s_match_tvalid_2           ),
   .s_match_tready            (  s_match_tready_2           ),

   .m_match_tdata             (  m_match_tdata_2            ),
   .m_match_tuser             (  m_match_tuser_2            ),
   .m_match_tvalid            (  m_match_tvalid_2           ),
   .m_match_tready            (  m_match_tready_2           ),

   .ref_counter               (  ref_counter                )
);

blueswitch_data_processor
#(
   .C_S_AXI_DATA_WIDTH        (  C_S_AXI_DATA_WIDTH         ),          
   .C_S_AXI_ADDR_WIDTH        (  C_S_AXI_ADDR_WIDTH         ),          
   .BASEADDR_OFFSET           (  16'h6000                   ),

   .C_M_AXIS_TDATA_WIDTH      (  C_M_AXIS_TDATA_WIDTH       ),
   .C_S_AXIS_TDATA_WIDTH      (  C_S_AXIS_TDATA_WIDTH       ),
   .C_M_AXIS_TUSER_WIDTH      (  C_M_AXIS_TUSER_WIDTH       ),
   .C_S_AXIS_TUSER_WIDTH      (  C_S_AXIS_TUSER_WIDTH       ),

   .HDR_MAC_ADDR_WIDTH        (  HDR_MAC_ADDR_WIDTH         ),
   .HDR_ETH_TYPE_WIDTH        (  HDR_ETH_TYPE_WIDTH         ),
   .HDR_IP_ADDR_WIDTH         (  HDR_IP_ADDR_WIDTH          ),
   .HDR_IP_PROT_WIDTH         (  HDR_IP_PROT_WIDTH          ),
   .HDR_PORT_NO_WIDTH         (  HDR_PORT_NO_WIDTH          ),
   .HDR_VLAN_WIDTH            (  HDR_VLAN_WIDTH             ),

   .C_M_HDR_TDATA_WIDTH       (  C_M_HDR_TDATA_WIDTH        ),
   .C_M_HDR_TUSER_WIDTH       (  C_M_HDR_TUSER_WIDTH        ),

   .C_S_ACT_TDATA_WIDTH       (  C_S_ACT_TDATA_WIDTH        ),
   .C_S_ACT_TUSER_WIDTH       (  C_S_ACT_TUSER_WIDTH        ),
   //NF10 physical port 3
   .SOURCE_PORT               (  8'h08                      ),
   .TUSER_SRC_PORT            (  8'h40                      )
)
blueswitch_data_processor_3
(
   // Slave AXI Ports
   .Bus2IP_Clk                (  Bus2IP_Clk                 ),
   .Bus2IP_Resetn             (  Bus2IP_Resetn              ),
   .Bus2IP_Addr               (  Bus2IP_Addr                ),
   .Bus2IP_CS                 (  Bus2IP_CS                  ),
   .Bus2IP_RNW                (  Bus2IP_RNW                 ),
   .Bus2IP_Data               (  Bus2IP_Data                ),
   .Bus2IP_BE                 (  Bus2IP_BE                  ),
   .IP2Bus_Data               (  IP2Bus_Data_3              ),
   .IP2Bus_RdAck              (  IP2Bus_RdAck_3             ),
   .IP2Bus_WrAck              (  IP2Bus_WrAck_3             ),

   .axi_aclk                  (  axi_aclk                   ),
   .axi_resetn                (  axi_resetn                 ),

   // Slave Stream Ports (interface to data path)
   .s_axis_tdata              (  s_axis_tdata_3             ),
   .s_axis_tstrb              (  s_axis_tstrb_3             ),
   .s_axis_tuser              (  s_axis_tuser_3             ),
   .s_axis_tvalid             (  s_axis_tvalid_3            ),
   .s_axis_tready             (  s_axis_tready_3            ),
   .s_axis_tlast              (  s_axis_tlast_3             ),

   // Master Stream Ports (interface to TX queues)
   .m_axis_tdata              (  m_axis_tdata_3             ),
   .m_axis_tstrb              (  m_axis_tstrb_3             ),
   .m_axis_tuser              (  m_axis_tuser_3             ),
   .m_axis_tvalid             (  m_axis_tvalid_3            ),
   .m_axis_tready             (  m_axis_tready_3            ),
   .m_axis_tlast              (  m_axis_tlast_3             ),

   //Paser and match results
   .s_match_tdata             (  s_match_tdata_3            ),
   .s_match_tuser             (  s_match_tuser_3            ),
   .s_match_tvalid            (  s_match_tvalid_3           ),
   .s_match_tready            (  s_match_tready_3           ),

   .m_match_tdata             (  m_match_tdata_3            ),
   .m_match_tuser             (  m_match_tuser_3            ),
   .m_match_tvalid            (  m_match_tvalid_3           ),
   .m_match_tready            (  m_match_tready_3           ),

   .ref_counter               (  ref_counter                )
);


wire  [MAC_TBL_ADDR_WIDTH-1:0]         axis_mac_tbl_addr;
wire                                   axis_mac_tbl_wren;
wire                                   axis_mac_tbl_busy;
wire  [HDR_MAC_ADDR_WIDTH-1:0]         axis_mac_tbl_wr_data;

wire  [IP_TBL_ADDR_WIDTH-1:0]          axis_ip_tbl_addr;
wire                                   axis_ip_tbl_wren;
wire                                   axis_ip_tbl_busy;
wire  [HDR_IP_ADDR_WIDTH-1:0]          axis_ip_tbl_wr_data;

wire  [PORT_NO_TBL_ADDR_WIDTH-1:0]     axis_port_tbl_addr;
wire                                   axis_port_tbl_wren;
wire                                   axis_port_tbl_busy;
wire  [HDR_PORT_NO_WIDTH-1:0]          axis_port_tbl_wr_data;

wire  [MAC_TBL_ADDR_WIDTH-1:0]         axis_port_act_addr;
wire                                   axis_port_act_wren;
wire  [ACT_DATA_WIDTH-1:0]             axis_port_act_wr_data;

wire  [MAC_TBL_ADDR_WIDTH-1:0]         axis_vlan_act_addr;
wire                                   axis_vlan_act_wren;
wire  [ACT_VLAN_WIDTH-1:0]             axis_vlan_act_wr_data;

// Slave Stream Ports (interface to data path)
wire  [C_S_AXIS_TDATA_WIDTH-1:0]       w_s_axis_tdata_4;
wire  [(C_S_AXIS_TDATA_WIDTH/8)-1:0]   w_s_axis_tstrb_4;
wire  [C_S_AXIS_TUSER_WIDTH-1:0]       w_s_axis_tuser_4;
wire  w_s_axis_tvalid_4, w_s_axis_tready_4, w_s_axis_tlast_4;

wire  [63:0]   stream_update_start, stream_update_end;
wire  stream_cnt_clear;

stream_update_processor
#(
   .C_S_AXI_DATA_WIDTH        (  C_S_AXI_DATA_WIDTH         ),
   .C_S_AXI_ADDR_WIDTH        (  C_S_AXI_ADDR_WIDTH         ),

   .C_M_AXIS_TDATA_WIDTH      (  C_M_AXIS_TDATA_WIDTH       ),
   .C_S_AXIS_TDATA_WIDTH      (  C_S_AXIS_TDATA_WIDTH       ),
   .C_M_AXIS_TUSER_WIDTH      (  C_M_AXIS_TUSER_WIDTH       ),
   .C_S_AXIS_TUSER_WIDTH      (  C_S_AXIS_TUSER_WIDTH       ),

   .MAC_TBL_ADDR_WIDTH        (  MAC_TBL_ADDR_WIDTH         ),
   .IP_TBL_ADDR_WIDTH         (  IP_TBL_ADDR_WIDTH          ),
   .PORT_NO_TBL_ADDR_WIDTH    (  PORT_NO_TBL_ADDR_WIDTH     ),

   .HDR_MAC_ADDR_WIDTH        (  HDR_MAC_ADDR_WIDTH         ),
   .HDR_IP_ADDR_WIDTH         (  HDR_IP_ADDR_WIDTH          ),
   .HDR_PORT_NO_WIDTH         (  HDR_PORT_NO_WIDTH          ),

   .ACT_ADDR_WIDTH            (  MAC_TBL_ADDR_WIDTH         ),

   .ACT_DATA_WIDTH            (  ACT_DATA_WIDTH             ),
   .ACT_VLAN_WIDTH            (  ACT_VLAN_WIDTH             )
)
stream_update_processor
(
   .axi_aclk                  (  axi_aclk                   ),
   .axi_resetn                (  axi_resetn                 ),

   .s_axis_tdata              (  s_axis_tdata_4             ),
   .s_axis_tstrb              (  s_axis_tstrb_4             ),
   .s_axis_tuser              (  s_axis_tuser_4             ),
   .s_axis_tvalid             (  s_axis_tvalid_4            ),
   .s_axis_tready             (  s_axis_tready_4            ),
   .s_axis_tlast              (  s_axis_tlast_4             ),

   .m_axis_tdata              (  w_s_axis_tdata_4           ),
   .m_axis_tstrb              (  w_s_axis_tstrb_4           ),
   .m_axis_tuser              (  w_s_axis_tuser_4           ),
   .m_axis_tvalid             (  w_s_axis_tvalid_4          ),
   .m_axis_tready             (  w_s_axis_tready_4          ),
   .m_axis_tlast              (  w_s_axis_tlast_4           ),

   .axis_mac_tbl_addr         (  axis_mac_tbl_addr          ),
   .axis_mac_tbl_wren         (  axis_mac_tbl_wren          ),
   .axis_mac_tbl_busy         (  axis_mac_tbl_busy          ),
   .axis_mac_tbl_wr_data      (  axis_mac_tbl_wr_data       ),

   .axis_ip_tbl_addr          (  axis_ip_tbl_addr           ),
   .axis_ip_tbl_wren          (  axis_ip_tbl_wren           ),
   .axis_ip_tbl_busy          (  axis_ip_tbl_busy           ),
   .axis_ip_tbl_wr_data       (  axis_ip_tbl_wr_data        ),

   .axis_port_tbl_addr        (  axis_port_tbl_addr         ),
   .axis_port_tbl_wren        (  axis_port_tbl_wren         ),
   .axis_port_tbl_busy        (  axis_port_tbl_busy         ),
   .axis_port_tbl_wr_data     (  axis_port_tbl_wr_data      ),

   .axis_port_act_addr        (  axis_port_act_addr         ),
   .axis_port_act_wren        (  axis_port_act_wren         ),
   .axis_port_act_wr_data     (  axis_port_act_wr_data      ),

   .axis_vlan_act_addr        (  axis_vlan_act_addr         ),
   .axis_vlan_act_wren        (  axis_vlan_act_wren         ),
   .axis_vlan_act_wr_data     (  axis_vlan_act_wr_data      ),

   .stream_update_start       (  stream_update_start        ),
   .stream_update_end         (  stream_update_end          ),
   .stream_cnt_clear          (  stream_cnt_clear           ),

   .ref_counter               (  ref_counter                )
);


blueswitch_data_processor
#(
   .C_S_AXI_DATA_WIDTH        (  C_S_AXI_DATA_WIDTH         ),          
   .C_S_AXI_ADDR_WIDTH        (  C_S_AXI_ADDR_WIDTH         ),          
   .BASEADDR_OFFSET           (  16'h8000                   ),

   .C_M_AXIS_TDATA_WIDTH      (  C_M_AXIS_TDATA_WIDTH       ),
   .C_S_AXIS_TDATA_WIDTH      (  C_S_AXIS_TDATA_WIDTH       ),
   .C_M_AXIS_TUSER_WIDTH      (  C_M_AXIS_TUSER_WIDTH       ),
   .C_S_AXIS_TUSER_WIDTH      (  C_S_AXIS_TUSER_WIDTH       ),

   .HDR_MAC_ADDR_WIDTH        (  HDR_MAC_ADDR_WIDTH         ),
   .HDR_ETH_TYPE_WIDTH        (  HDR_ETH_TYPE_WIDTH         ),
   .HDR_IP_ADDR_WIDTH         (  HDR_IP_ADDR_WIDTH          ),
   .HDR_IP_PROT_WIDTH         (  HDR_IP_PROT_WIDTH          ),
   .HDR_PORT_NO_WIDTH         (  HDR_PORT_NO_WIDTH          ),
   .HDR_VLAN_WIDTH            (  HDR_VLAN_WIDTH             ),

   .C_M_HDR_TDATA_WIDTH       (  C_M_HDR_TDATA_WIDTH        ),
   .C_M_HDR_TUSER_WIDTH       (  C_M_HDR_TUSER_WIDTH        ),

   .C_S_ACT_TDATA_WIDTH       (  C_S_ACT_TDATA_WIDTH        ),
   .C_S_ACT_TUSER_WIDTH       (  C_S_ACT_TUSER_WIDTH        ),
   //DMA host 
   .SOURCE_PORT               (  8'h10                      ),
   .TUSER_SRC_PORT            (  8'h80|8'h20|8'h08|8'h02    )
)
blueswitch_data_processor_4
(
   // Slave AXI Ports
   .Bus2IP_Clk                (  Bus2IP_Clk                 ),
   .Bus2IP_Resetn             (  Bus2IP_Resetn              ),
   .Bus2IP_Addr               (  Bus2IP_Addr                ),
   .Bus2IP_CS                 (  Bus2IP_CS                  ),
   .Bus2IP_RNW                (  Bus2IP_RNW                 ),
   .Bus2IP_Data               (  Bus2IP_Data                ),
   .Bus2IP_BE                 (  Bus2IP_BE                  ),
   .IP2Bus_Data               (  IP2Bus_Data_4              ),
   .IP2Bus_RdAck              (  IP2Bus_RdAck_4             ),
   .IP2Bus_WrAck              (  IP2Bus_WrAck_4             ),

   .axi_aclk                  (  axi_aclk                   ),
   .axi_resetn                (  axi_resetn                 ),

   // Slave Stream Ports (interface to data path)
   .s_axis_tdata              (  w_s_axis_tdata_4           ),
   .s_axis_tstrb              (  w_s_axis_tstrb_4           ),
   .s_axis_tuser              (  w_s_axis_tuser_4           ),
   .s_axis_tvalid             (  w_s_axis_tvalid_4          ),
   .s_axis_tready             (  w_s_axis_tready_4          ),
   .s_axis_tlast              (  w_s_axis_tlast_4           ),

   // Master Stream Ports (interface to TX queues)
   .m_axis_tdata              (  m_axis_tdata_4             ),
   .m_axis_tstrb              (  m_axis_tstrb_4             ),
   .m_axis_tuser              (  m_axis_tuser_4             ),
   .m_axis_tvalid             (  m_axis_tvalid_4            ),
   .m_axis_tready             (  m_axis_tready_4            ),
   .m_axis_tlast              (  m_axis_tlast_4             ),

   //Paser and match results
   .s_match_tdata             (  s_match_tdata_4            ),
   .s_match_tuser             (  s_match_tuser_4            ),
   .s_match_tvalid            (  s_match_tvalid_4           ),
   .s_match_tready            (  s_match_tready_4           ),

   .m_match_tdata             (  m_match_tdata_4            ),
   .m_match_tuser             (  m_match_tuser_4            ),
   .m_match_tvalid            (  m_match_tvalid_4           ),
   .m_match_tready            (  m_match_tready_4           ),

   .ref_counter               (  ref_counter                )
);

blueswitch_flow_table_processor
#(
   .C_S_AXI_DATA_WIDTH        (  C_S_AXI_DATA_WIDTH         ),          
   .C_S_AXI_ADDR_WIDTH        (  C_S_AXI_ADDR_WIDTH         ),          
   .BASEADDR_OFFSET           (  16'ha000                   ),

   .C_M_ACT_TDATA_WIDTH       (  C_S_ACT_TDATA_WIDTH        ),
   .C_M_ACT_TUSER_WIDTH       (  C_S_ACT_TUSER_WIDTH        ),

   .C_S_HDR_TDATA_WIDTH       (  C_M_HDR_TDATA_WIDTH        ),
   .C_S_HDR_TUSER_WIDTH       (  C_M_HDR_TUSER_WIDTH        ),

   .NUM_QUEUES                (  5                          ),

   .HDR_MAC_ADDR_WIDTH        (  HDR_MAC_ADDR_WIDTH         ),
   .HDR_ETH_TYPE_WIDTH        (  HDR_ETH_TYPE_WIDTH         ),
   .HDR_IP_ADDR_WIDTH         (  HDR_IP_ADDR_WIDTH          ),
   .HDR_IP_PROT_WIDTH         (  HDR_IP_PROT_WIDTH          ),
   .HDR_PORT_NO_WIDTH         (  HDR_PORT_NO_WIDTH          ),
   .HDR_VLAN_WIDTH            (  HDR_VLAN_WIDTH             ),

   .MAC_TBL_ADDR_WIDTH        (  MAC_TBL_ADDR_WIDTH         ),
   .IP_TBL_ADDR_WIDTH         (  IP_TBL_ADDR_WIDTH          ),
   .PORT_NO_TBL_ADDR_WIDTH    (  PORT_NO_TBL_ADDR_WIDTH     ),

   .ACT_DATA_WIDTH            (  ACT_DATA_WIDTH             ),
   .ACT_TBL_DATA_WIDTH        (  `DEF_ACT_TBL_DATA_WIDTH    )
)
blueswitch_flow_table_processor
(
   // Slave AXI Ports
   .Bus2IP_Clk                (  Bus2IP_Clk                 ),
   .Bus2IP_Resetn             (  Bus2IP_Resetn              ),
   .Bus2IP_Addr               (  Bus2IP_Addr                ),
   .Bus2IP_CS                 (  Bus2IP_CS                  ),
   .Bus2IP_RNW                (  Bus2IP_RNW                 ),
   .Bus2IP_Data               (  Bus2IP_Data                ),
   .Bus2IP_BE                 (  Bus2IP_BE                  ),
   .IP2Bus_Data               (  IP2Bus_Data_5              ),
   .IP2Bus_RdAck              (  IP2Bus_RdAck_5             ),
   .IP2Bus_WrAck              (  IP2Bus_WrAck_5             ),

   .axi_aclk                  (  axi_aclk                   ),
   .axi_resetn                (  axi_resetn                 ),
   //Header information stream data with meta-data of physical and dma
   //data paths..
   .s_axis_tdata_0            (  m_match_tdata_0            ),
   .s_axis_tuser_0            (  m_match_tuser_0            ),
   .s_axis_tvalid_0           (  m_match_tvalid_0           ),
   .s_axis_tready_0           (  m_match_tready_0           ),

   .m_axis_tdata_0            (  s_match_tdata_0            ),
   .m_axis_tuser_0            (  s_match_tuser_0            ),
   .m_axis_tvalid_0           (  s_match_tvalid_0           ),
   .m_axis_tready_0           (  s_match_tready_0           ),

   .s_axis_tdata_1            (  m_match_tdata_1            ),
   .s_axis_tuser_1            (  m_match_tuser_1            ),
   .s_axis_tvalid_1           (  m_match_tvalid_1           ),
   .s_axis_tready_1           (  m_match_tready_1           ),

   .m_axis_tdata_1            (  s_match_tdata_1            ),
   .m_axis_tuser_1            (  s_match_tuser_1            ),
   .m_axis_tvalid_1           (  s_match_tvalid_1           ),
   .m_axis_tready_1           (  s_match_tready_1           ),

   .s_axis_tdata_2            (  m_match_tdata_2            ),
   .s_axis_tuser_2            (  m_match_tuser_2            ),
   .s_axis_tvalid_2           (  m_match_tvalid_2           ),
   .s_axis_tready_2           (  m_match_tready_2           ),

   .m_axis_tdata_2            (  s_match_tdata_2            ),
   .m_axis_tuser_2            (  s_match_tuser_2            ),
   .m_axis_tvalid_2           (  s_match_tvalid_2           ),
   .m_axis_tready_2           (  s_match_tready_2           ),

   .s_axis_tdata_3            (  m_match_tdata_3            ),
   .s_axis_tuser_3            (  m_match_tuser_3            ),
   .s_axis_tvalid_3           (  m_match_tvalid_3           ),
   .s_axis_tready_3           (  m_match_tready_3           ),

   .m_axis_tdata_3            (  s_match_tdata_3            ),
   .m_axis_tuser_3            (  s_match_tuser_3            ),
   .m_axis_tvalid_3           (  s_match_tvalid_3           ),
   .m_axis_tready_3           (  s_match_tready_3           ),

   .s_axis_tdata_4            (  m_match_tdata_4            ),
   .s_axis_tuser_4            (  m_match_tuser_4            ),
   .s_axis_tvalid_4           (  m_match_tvalid_4           ),
   .s_axis_tready_4           (  m_match_tready_4           ),

   .m_axis_tdata_4            (  s_match_tdata_4            ),
   .m_axis_tuser_4            (  s_match_tuser_4            ),
   .m_axis_tvalid_4           (  s_match_tvalid_4           ),
   .m_axis_tready_4           (  s_match_tready_4           ),
   //To do
   //Data-plane path for flow-table updates.
   .axis_mac_tbl_addr         (  axis_mac_tbl_addr          ),
   .axis_mac_tbl_wren         (  axis_mac_tbl_wren          ),
   .axis_mac_tbl_busy         (  axis_mac_tbl_busy          ),
   .axis_mac_tbl_wr_data      (  axis_mac_tbl_wr_data       ),

   .axis_ip_tbl_addr          (  axis_ip_tbl_addr           ),
   .axis_ip_tbl_wren          (  axis_ip_tbl_wren           ),
   .axis_ip_tbl_busy          (  axis_ip_tbl_busy           ),
   .axis_ip_tbl_wr_data       (  axis_ip_tbl_wr_data        ),

   .axis_port_tbl_addr        (  axis_port_tbl_addr         ),
   .axis_port_tbl_wren        (  axis_port_tbl_wren         ),
   .axis_port_tbl_busy        (  axis_port_tbl_busy         ),
   .axis_port_tbl_wr_data     (  axis_port_tbl_wr_data      ),
 
   .axis_port_act_addr        (  axis_port_act_addr         ),
   .axis_port_act_wren        (  axis_port_act_wren         ),
   .axis_port_act_wr_data     (  axis_port_act_wr_data      ),

   .axis_vlan_act_addr        (  axis_vlan_act_addr         ),
   .axis_vlan_act_wren        (  axis_vlan_act_wren         ),
   .axis_vlan_act_wr_data     (  axis_vlan_act_wr_data      ),

   .stream_update_start       (  stream_update_start        ),
   .stream_update_end         (  stream_update_end          ),
   .stream_cnt_clear          (  stream_cnt_clear           ),

   .ref_counter               (  ref_counter                )
);

endmodule
