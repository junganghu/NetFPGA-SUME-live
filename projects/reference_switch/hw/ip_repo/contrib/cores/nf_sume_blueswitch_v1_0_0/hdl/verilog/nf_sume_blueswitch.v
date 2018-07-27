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

module nf_sume_blueswitch
#(
   parameter   C_FAMILY                = "virtex7",
   parameter   C_S_AXI_DATA_WIDTH      = 32,          
   parameter   C_S_AXI_ADDR_WIDTH      = 32,          
   parameter   C_USE_WSTRB             = 0,
   parameter   C_DPHASE_TIMEOUT        = 0,
   parameter   C_BASEADDR              = 32'hFFFFFFFF,
   parameter   C_HIGHADDR              = 32'h00000000,

   parameter   C_M_AXIS_DATA_WIDTH     = 64,
   parameter   C_S_AXIS_DATA_WIDTH     = 64,
   parameter   C_M_AXIS_TUSER_WIDTH    = 128,
   parameter   C_S_AXIS_TUSER_WIDTH    = 128,

   parameter   C_DMA_SRC_PORT          = 8'h02
)
(
   // Slave AXI Ports
   input                                              S_AXI_ACLK,
   input                                              S_AXI_ARESETN,
   input       [C_S_AXI_ADDR_WIDTH-1:0]               S_AXI_AWADDR,
   input                                              S_AXI_AWVALID,
   input       [C_S_AXI_DATA_WIDTH-1:0]               S_AXI_WDATA,
   input       [C_S_AXI_DATA_WIDTH/8-1:0]             S_AXI_WSTRB,
   input                                              S_AXI_WVALID,
   input                                              S_AXI_BREADY,
   input       [C_S_AXI_ADDR_WIDTH-1:0]               S_AXI_ARADDR,
   input                                              S_AXI_ARVALID,
   input                                              S_AXI_RREADY,
   output                                             S_AXI_ARREADY,
   output      [C_S_AXI_DATA_WIDTH-1:0]               S_AXI_RDATA,
   output      [1:0]                                  S_AXI_RRESP,
   output                                             S_AXI_RVALID,
   output                                             S_AXI_WREADY,
   output      [1:0]                                  S_AXI_BRESP,
   output                                             S_AXI_BVALID,
   output                                             S_AXI_AWREADY,

   input                                              axis_aclk,
   input                                              axis_resetn,

   // Slave Stream Ports (interface to data path)
   input       [C_S_AXIS_DATA_WIDTH-1:0]              s0_axis_tdata,
   input       [((C_S_AXIS_DATA_WIDTH/8))-1:0]        s0_axis_tkeep,
   input       [C_S_AXIS_TUSER_WIDTH-1:0]             s0_axis_tuser,
   input                                              s0_axis_tvalid,
   output                                             s0_axis_tready,
   input                                              s0_axis_tlast,

   // Master Stream Ports (interface to TX queues)
   output      [C_M_AXIS_DATA_WIDTH-1:0]              m0_axis_tdata,
   output      [((C_M_AXIS_DATA_WIDTH/8))-1:0]        m0_axis_tkeep,
   output      [C_M_AXIS_TUSER_WIDTH-1:0]             m0_axis_tuser,
   output                                             m0_axis_tvalid,
   input                                              m0_axis_tready,
   output                                             m0_axis_tlast,

   // Slave Stream Ports (interface to data path)
   input       [C_S_AXIS_DATA_WIDTH-1:0]              s1_axis_tdata,
   input       [((C_S_AXIS_DATA_WIDTH/8))-1:0]        s1_axis_tkeep,
   input       [C_S_AXIS_TUSER_WIDTH-1:0]             s1_axis_tuser,
   input                                              s1_axis_tvalid,
   output                                             s1_axis_tready,
   input                                              s1_axis_tlast,

   // Master Stream Ports (interface to TX queues)
   output      [C_M_AXIS_DATA_WIDTH-1:0]              m1_axis_tdata,
   output      [((C_M_AXIS_DATA_WIDTH/8))-1:0]        m1_axis_tkeep,
   output      [C_M_AXIS_TUSER_WIDTH-1:0]             m1_axis_tuser,
   output                                             m1_axis_tvalid,
   input                                              m1_axis_tready,
   output                                             m1_axis_tlast,

   // Slave Stream Ports (interface to data path)
   input       [C_S_AXIS_DATA_WIDTH-1:0]              s2_axis_tdata,
   input       [((C_S_AXIS_DATA_WIDTH/8))-1:0]        s2_axis_tkeep,
   input       [C_S_AXIS_TUSER_WIDTH-1:0]             s2_axis_tuser,
   input                                              s2_axis_tvalid,
   output                                             s2_axis_tready,
   input                                              s2_axis_tlast,

   // Master Stream Ports (interface to TX queues)
   output      [C_M_AXIS_DATA_WIDTH-1:0]              m2_axis_tdata,
   output      [((C_M_AXIS_DATA_WIDTH/8))-1:0]        m2_axis_tkeep,
   output      [C_M_AXIS_TUSER_WIDTH-1:0]             m2_axis_tuser,
   output                                             m2_axis_tvalid,
   input                                              m2_axis_tready,
   output                                             m2_axis_tlast,

   // Slave Stream Ports (interface to data path)
   input       [C_S_AXIS_DATA_WIDTH-1:0]              s3_axis_tdata,
   input       [((C_S_AXIS_DATA_WIDTH/8))-1:0]        s3_axis_tkeep,
   input       [C_S_AXIS_TUSER_WIDTH-1:0]             s3_axis_tuser,
   input                                              s3_axis_tvalid,
   output                                             s3_axis_tready,
   input                                              s3_axis_tlast,

   // Master Stream Ports (interface to TX queues)
   output      [C_M_AXIS_DATA_WIDTH-1:0]              m3_axis_tdata,
   output      [((C_M_AXIS_DATA_WIDTH/8))-1:0]        m3_axis_tkeep,
   output      [C_M_AXIS_TUSER_WIDTH-1:0]             m3_axis_tuser,
   output                                             m3_axis_tvalid,
   input                                              m3_axis_tready,
   output                                             m3_axis_tlast,

   // Slave Stream Ports (interface to data path)
   input       [C_S_AXIS_DATA_WIDTH-1:0]              s4_axis_tdata,
   input       [((C_S_AXIS_DATA_WIDTH/8))-1:0]        s4_axis_tkeep,
   input       [C_S_AXIS_TUSER_WIDTH-1:0]             s4_axis_tuser,
   input                                              s4_axis_tvalid,
   output                                             s4_axis_tready,
   input                                              s4_axis_tlast,

   // Master Stream Ports (interface to TX queues)
   output      [C_M_AXIS_DATA_WIDTH-1:0]              m4_axis_tdata,
   output      [((C_M_AXIS_DATA_WIDTH/8))-1:0]        m4_axis_tkeep,
   output      [C_M_AXIS_TUSER_WIDTH-1:0]             m4_axis_tuser,
   output                                             m4_axis_tvalid,
   input                                              m4_axis_tready,
   output                                             m4_axis_tlast,

   output   reg   [63:0]                              ref_counter
);

// -- Signals
wire                                   Bus2IP_Clk;
wire                                   Bus2IP_Resetn;
wire  [C_S_AXI_ADDR_WIDTH-1:0]         Bus2IP_Addr;
wire  [0:0]                            Bus2IP_CS;
wire                                   Bus2IP_RNW;
wire  [C_S_AXI_DATA_WIDTH-1:0]         Bus2IP_Data;
wire  [C_S_AXI_DATA_WIDTH/8-1:0]       Bus2IP_BE;
wire  [C_S_AXI_DATA_WIDTH-1:0]         IP2Bus_Data;
wire                                   IP2Bus_RdAck;
wire                                   IP2Bus_WrAck;
wire                                   IP2Bus_Error = 0;

//Reference counter for timestamping.
always @(posedge axis_aclk)
   if (~axis_resetn)
      ref_counter    <= 0;
   else
      ref_counter    <= ref_counter + 1;

blueswitch_top
#(
   .C_S_AXI_DATA_WIDTH        (  C_S_AXI_DATA_WIDTH      ),          
   .C_S_AXI_ADDR_WIDTH        (  C_S_AXI_ADDR_WIDTH      ),          

   .C_M_AXIS_TDATA_WIDTH      (  C_M_AXIS_DATA_WIDTH     ),
   .C_M_AXIS_TUSER_WIDTH      (  C_M_AXIS_TUSER_WIDTH    ),
   .C_S_AXIS_TDATA_WIDTH      (  C_S_AXIS_DATA_WIDTH     ),
   .C_S_AXIS_TUSER_WIDTH      (  C_S_AXIS_TUSER_WIDTH    )
)
blueswitch_top
(
   // Slave AXI Ports
   .Bus2IP_Clk                (  Bus2IP_Clk              ),
   .Bus2IP_Resetn             (  Bus2IP_Resetn           ),
   .Bus2IP_Addr               (  Bus2IP_Addr             ),
   .Bus2IP_CS                 (  Bus2IP_CS               ),
   .Bus2IP_RNW                (  Bus2IP_RNW              ),
   .Bus2IP_Data               (  Bus2IP_Data             ),
   .Bus2IP_BE                 (  Bus2IP_BE               ),
   .IP2Bus_Data               (  IP2Bus_Data             ),
   .IP2Bus_RdAck              (  IP2Bus_RdAck            ),
   .IP2Bus_WrAck              (  IP2Bus_WrAck            ),

   .axi_aclk                  (  axis_aclk               ),
   .axi_resetn                (  axis_resetn             ),

   // Slave Stream Ports (interface to data path)
   .s_axis_tdata_0            (  s0_axis_tdata           ),
   .s_axis_tstrb_0            (  s0_axis_tkeep           ),
   .s_axis_tuser_0            (  s0_axis_tuser           ),
   .s_axis_tvalid_0           (  s0_axis_tvalid          ),
   .s_axis_tready_0           (  s0_axis_tready          ),
   .s_axis_tlast_0            (  s0_axis_tlast           ),

   // Master Stream Ports (interface to TX queues)
   .m_axis_tdata_0            (  m0_axis_tdata           ),
   .m_axis_tstrb_0            (  m0_axis_tkeep           ),
   .m_axis_tuser_0            (  m0_axis_tuser           ),
   .m_axis_tvalid_0           (  m0_axis_tvalid          ),
   .m_axis_tready_0           (  m0_axis_tready          ),
   .m_axis_tlast_0            (  m0_axis_tlast           ),

   // Slave Stream Ports (interface to data path)
   .s_axis_tdata_1            (  s1_axis_tdata           ),
   .s_axis_tstrb_1            (  s1_axis_tkeep           ),
   .s_axis_tuser_1            (  s1_axis_tuser           ),
   .s_axis_tvalid_1           (  s1_axis_tvalid          ),
   .s_axis_tready_1           (  s1_axis_tready          ),
   .s_axis_tlast_1            (  s1_axis_tlast           ),

   // Master Stream Ports (interface to TX queues)
   .m_axis_tdata_1            (  m1_axis_tdata           ),
   .m_axis_tstrb_1            (  m1_axis_tkeep           ),
   .m_axis_tuser_1            (  m1_axis_tuser           ),
   .m_axis_tvalid_1           (  m1_axis_tvalid          ),
   .m_axis_tready_1           (  m1_axis_tready          ),
   .m_axis_tlast_1            (  m1_axis_tlast           ),

   // Slave Stream Ports (interface to data path)
   .s_axis_tdata_2            (  s2_axis_tdata           ),
   .s_axis_tstrb_2            (  s2_axis_tkeep           ),
   .s_axis_tuser_2            (  s2_axis_tuser           ),
   .s_axis_tvalid_2           (  s2_axis_tvalid          ),
   .s_axis_tready_2           (  s2_axis_tready          ),
   .s_axis_tlast_2            (  s2_axis_tlast           ),

   // Master Stream Ports (interface to TX queues)
   .m_axis_tdata_2            (  m2_axis_tdata           ),
   .m_axis_tstrb_2            (  m2_axis_tkeep           ),
   .m_axis_tuser_2            (  m2_axis_tuser           ),
   .m_axis_tvalid_2           (  m2_axis_tvalid          ),
   .m_axis_tready_2           (  m2_axis_tready          ),
   .m_axis_tlast_2            (  m2_axis_tlast           ),

   // Slave Stream Ports (interface to data path)
   .s_axis_tdata_3            (  s3_axis_tdata           ),
   .s_axis_tstrb_3            (  s3_axis_tkeep           ),
   .s_axis_tuser_3            (  s3_axis_tuser           ),
   .s_axis_tvalid_3           (  s3_axis_tvalid          ),
   .s_axis_tready_3           (  s3_axis_tready          ),
   .s_axis_tlast_3            (  s3_axis_tlast           ),

   // Master Stream Ports (interface to TX queues)
   .m_axis_tdata_3            (  m3_axis_tdata           ),
   .m_axis_tstrb_3            (  m3_axis_tkeep           ),
   .m_axis_tuser_3            (  m3_axis_tuser           ),
   .m_axis_tvalid_3           (  m3_axis_tvalid          ),
   .m_axis_tready_3           (  m3_axis_tready          ),
   .m_axis_tlast_3            (  m3_axis_tlast           ),

   // Slave Stream Ports (interface to data path)
   .s_axis_tdata_4            (  s4_axis_tdata           ),
   .s_axis_tstrb_4            (  s4_axis_tkeep           ),
   .s_axis_tuser_4            (  s4_axis_tuser           ),
   .s_axis_tvalid_4           (  s4_axis_tvalid          ),
   .s_axis_tready_4           (  s4_axis_tready          ),
   .s_axis_tlast_4            (  s4_axis_tlast           ),

   // Master Stream Ports (interface to TX queues)
   .m_axis_tdata_4            (  m4_axis_tdata           ),
   .m_axis_tstrb_4            (  m4_axis_tkeep           ),
   .m_axis_tuser_4            (  m4_axis_tuser           ),
   .m_axis_tvalid_4           (  m4_axis_tvalid          ),
   .m_axis_tready_4           (  m4_axis_tready          ),
   .m_axis_tlast_4            (  m4_axis_tlast           ),

   .ref_counter               (  ref_counter             )
);

// -- AXILITE IPIF
axi_lite_ipif_1bar #
(
   .C_S_AXI_DATA_WIDTH        (  C_S_AXI_DATA_WIDTH      ),
   .C_S_AXI_ADDR_WIDTH        (  C_S_AXI_ADDR_WIDTH      ),
   .C_USE_WSTRB               (  C_USE_WSTRB             ),
   .C_DPHASE_TIMEOUT          (  C_DPHASE_TIMEOUT        ),
   .C_BAR0_BASEADDR           (  C_BASEADDR              ),
   .C_BAR0_HIGHADDR           (  C_HIGHADDR              )
)
axi_lite_ipif_inst
(
   .S_AXI_ACLK                (  S_AXI_ACLK              ),
   .S_AXI_ARESETN             (  S_AXI_ARESETN           ),
   .S_AXI_AWADDR              (  S_AXI_AWADDR            ),
   .S_AXI_AWVALID             (  S_AXI_AWVALID           ),
   .S_AXI_WDATA               (  S_AXI_WDATA             ),
   .S_AXI_WSTRB               (  S_AXI_WSTRB             ),
   .S_AXI_WVALID              (  S_AXI_WVALID            ),
   .S_AXI_BREADY              (  S_AXI_BREADY            ),
   .S_AXI_ARADDR              (  S_AXI_ARADDR            ),
   .S_AXI_ARVALID             (  S_AXI_ARVALID           ),
   .S_AXI_RREADY              (  S_AXI_RREADY            ),
   .S_AXI_ARREADY             (  S_AXI_ARREADY           ),
   .S_AXI_RDATA               (  S_AXI_RDATA             ),
   .S_AXI_RRESP               (  S_AXI_RRESP             ),
   .S_AXI_RVALID              (  S_AXI_RVALID            ),
   .S_AXI_WREADY              (  S_AXI_WREADY            ),
   .S_AXI_BRESP               (  S_AXI_BRESP             ),
   .S_AXI_BVALID              (  S_AXI_BVALID            ),
   .S_AXI_AWREADY             (  S_AXI_AWREADY           ),
   // Controls to the IP/IPIF modules
   .Bus2IP_Clk                ( Bus2IP_Clk               ),
   .Bus2IP_Resetn             ( Bus2IP_Resetn            ),
   .Bus2IP_Addr               ( Bus2IP_Addr              ),
   .Bus2IP_RNW                ( Bus2IP_RNW               ),
   .Bus2IP_BE                 ( Bus2IP_BE                ),
   .Bus2IP_CS                 ( Bus2IP_CS                ),
   .Bus2IP_Data               ( Bus2IP_Data              ),
   .IP2Bus_Data               ( IP2Bus_Data              ),
   .IP2Bus_WrAck              ( IP2Bus_WrAck             ),
   .IP2Bus_RdAck              ( IP2Bus_RdAck             ),
   .IP2Bus_Error              ( IP2Bus_Error             )
);

endmodule
