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

module stream_update_processor
#(
   parameter   C_S_AXI_DATA_WIDTH      = 32,          
   parameter   C_S_AXI_ADDR_WIDTH      = 32,          

   parameter   C_M_AXIS_TDATA_WIDTH    = 64,
   parameter   C_S_AXIS_TDATA_WIDTH    = 64,
   parameter   C_M_AXIS_TUSER_WIDTH    = 128,
   parameter   C_S_AXIS_TUSER_WIDTH    = 128,

   parameter   MAC_TBL_ADDR_WIDTH      = 4,
   parameter   IP_TBL_ADDR_WIDTH       = 4,
   parameter   PORT_NO_TBL_ADDR_WIDTH  = 4,

   parameter   HDR_MAC_ADDR_WIDTH      = 48,
   parameter   HDR_IP_ADDR_WIDTH       = 32,
   parameter   HDR_PORT_NO_WIDTH       = 16,

   parameter   ACT_ADDR_WIDTH          = 4,

   parameter   ACT_DATA_WIDTH          = 8,
   parameter   ACT_VLAN_WIDTH          = 32
)
(
   input                                              axi_aclk,
   input                                              axi_resetn,

  // Slave Stream Ports (interface to data path)
   input       [C_S_AXIS_TDATA_WIDTH-1:0]              s_axis_tdata,
   input       [((C_S_AXIS_TDATA_WIDTH/8))-1:0]        s_axis_tstrb,
   input       [C_S_AXIS_TUSER_WIDTH-1:0]             s_axis_tuser,
   input                                              s_axis_tvalid,
   output                                             s_axis_tready,
   input                                              s_axis_tlast,

   // Master Stream Ports (interface to TX queues)
   output   reg   [C_M_AXIS_TDATA_WIDTH-1:0]           m_axis_tdata,
   output   reg   [((C_M_AXIS_TDATA_WIDTH/8))-1:0]     m_axis_tstrb,
   output   reg   [C_M_AXIS_TUSER_WIDTH-1:0]          m_axis_tuser,
   output   reg                                       m_axis_tvalid,
   input                                              m_axis_tready,
   output   reg                                       m_axis_tlast,

   output   reg   [MAC_TBL_ADDR_WIDTH-1:0]           axis_mac_tbl_addr,
   output   reg                                       axis_mac_tbl_wren,
   input                                              axis_mac_tbl_busy,
   output   reg   [HDR_MAC_ADDR_WIDTH-1:0]                axis_mac_tbl_wr_data,

   output   reg   [IP_TBL_ADDR_WIDTH-1:0]            axis_ip_tbl_addr,
   output   reg                                       axis_ip_tbl_wren,
   input                                              axis_ip_tbl_busy,
   output   reg   [HDR_IP_ADDR_WIDTH-1:0]                 axis_ip_tbl_wr_data,

   output   reg   [PORT_NO_TBL_ADDR_WIDTH-1:0]          axis_port_tbl_addr,
   output   reg                                       axis_port_tbl_wren,
   input                                              axis_port_tbl_busy,
   output   reg   [HDR_PORT_NO_WIDTH-1:0]                    axis_port_tbl_wr_data,

  
   output   reg   [ACT_ADDR_WIDTH-1:0]                axis_port_act_addr,
   output   reg                                       axis_port_act_wren,
   output   reg   [ACT_DATA_WIDTH-1:0]                axis_port_act_wr_data,

   output   reg   [ACT_ADDR_WIDTH-1:0]                axis_vlan_act_addr,
   output   reg                                       axis_vlan_act_wren,
   output   reg   [ACT_VLAN_WIDTH-1:0]           axis_vlan_act_wr_data,

   output   reg   [63:0]                              stream_update_start,
   output   reg   [63:0]                              stream_update_end,
   input                                              stream_cnt_clear,

   input          [63:0]                              ref_counter
);

//Check packet from DMA host (or agent).
function integer log2;
   input integer number;
   begin
      log2=0;
      while(2**log2<number) begin
         log2=log2+1;
      end
   end
endfunction // log2

localparam  BUFFER_SIZE          = 2048; // Buffer size 4096B
localparam  BUFFER_SIZE_WIDTH    = log2(BUFFER_SIZE/(C_S_AXIS_TDATA_WIDTH/8));

//This fifo stores packets sent from a host pc regarded as a switch agent.
//This packet is not formatted in ethernet packet. However, if the packet is
//formatted in a right format of the ethernet, then it should be forwarded
//into the normal data packet processor.
//It has an information of new rule updates. Thus, the packet needs to be
//checked and parsed into address and data to update the table in match and
//action processors.
//Here we assume that
//00:0000000000000000
//01:0000000000000000
//02:00010a0a0a0a0a0a -> msb 4bits: table, next msb 12bits:address, lsb 48bits:data.
//03:00020b0b0b0b0b0b
//04.....

`define  ST_IDLE           0
`define  ST_WR_TABLE       1
`define  ST_FWD            2
`define  ST_WR_WAIT        3
`define  ST_TCAM_BUSY      4

reg   [3:0] StNext, StCurrent;

always @(posedge axi_aclk)
   if (~axi_resetn)
      StCurrent   <= 0;
   else
      StCurrent   <= StNext;


wire  [C_S_AXIS_TDATA_WIDTH-1:0]        dma_tdata;
wire  [((C_S_AXIS_TDATA_WIDTH/8))-1:0]  dma_tstrb;
wire  [C_S_AXIS_TUSER_WIDTH-1:0]       dma_tuser;
wire  dma_tlast;
wire  dma_pkt_full, dma_pkt_empty;
reg   dma_pkt_rden;

assign s_axis_tready = ~dma_pkt_full;


`ifdef XIL_FIFO
`ifdef TUSER_32
fifo_256x105 dma_packet_fifo
`else
fifo_256x201 dma_packet_fifo
`endif
(
  .dout  (  {dma_tlast, dma_tstrb, dma_tuser, dma_tdata}                ),
  .rd_en (  dma_pkt_rden                                                ),
  .full  (  dma_pkt_full                                                ),
  .empty (  dma_pkt_empty                                               ),
  .din   (  {s_axis_tlast, s_axis_tstrb, s_axis_tuser, s_axis_tdata}    ),
  .wr_en (  s_axis_tvalid & s_axis_tready                               ),
  .clk   (  axi_aclk                                                    )
);

`else

localparam  DMA_FIFO_WIDTH       = C_S_AXIS_TDATA_WIDTH+C_S_AXIS_TUSER_WIDTH+(C_S_AXIS_TDATA_WIDTH/8)+1;
fallthrough_small_fifo
#(
   .WIDTH                  (  DMA_FIFO_WIDTH                                              ),
   .MAX_DEPTH_BITS         (  BUFFER_SIZE_WIDTH                                           )
)
dma_packet_fifo
(
   // Outputs
   .dout                   (  {dma_tlast, dma_tstrb, dma_tuser, dma_tdata}                ),
   .rd_en                  (  dma_pkt_rden                                                ),
   .full                   (),
   .nearly_full            (),
   .prog_full              (  dma_pkt_full                                                ),
   .empty                  (  dma_pkt_empty                                               ),
   // Inputs
   .din                    (  {s_axis_tlast, s_axis_tstrb, s_axis_tuser, s_axis_tdata}    ),
   .wr_en                  (  s_axis_tvalid & s_axis_tready                               ),
   .reset                  (  ~axi_resetn                                                 ),
   .clk                    (  axi_aclk                                                    )
);

`endif


reg   [C_S_AXIS_TDATA_WIDTH-1:0]  r_dma_tdata;
reg   [(C_S_AXIS_TDATA_WIDTH/8)-1:0]  r_dma_tstrb;
reg   r_dma_pkt_empty, r_dma_tlast;

always @(posedge axi_aclk)
   if (~axi_resetn) begin
      r_dma_tdata       <= 0;
      r_dma_tstrb       <= 0;
      r_dma_tlast       <= 0;
      r_dma_pkt_empty   <= 0;
   end
   else begin
      r_dma_tdata       <= dma_tdata;
      r_dma_tstrb       <= dma_tstrb;
      r_dma_tlast       <= dma_tlast;
      r_dma_pkt_empty   <= dma_pkt_empty;
   end

wire  fwd_enable = (r_dma_tdata != 0) && (r_dma_tstrb == 8'hff) && ~r_dma_pkt_empty;
wire  update_enable = (r_dma_tdata == 0) && (r_dma_tstrb == 8'hff) && ~r_dma_pkt_empty && ~r_dma_tlast;
wire  update_end = (r_dma_tdata == 0) && (r_dma_tstrb == 8'hff) && ~r_dma_pkt_empty && r_dma_tlast;

always @(posedge axi_aclk)
   if (~axi_resetn) begin
      stream_update_start  <= 0;
      stream_update_end    <= 0;
   end
   else if (stream_cnt_clear) begin
      stream_update_start  <= 0;
      stream_update_end    <= 0;
   end
   //else if (StCurrent == `ST_TCAM_BUSY && StNext == `ST_IDLE) begin
   else if (update_end) begin
      stream_update_end    <= ref_counter;
   end
   else if (update_enable) begin
      stream_update_start  <= ref_counter;
   end


reg   [MAC_TBL_ADDR_WIDTH-1:0]     r_axis_mac_tbl_addr;
reg                                 r_axis_mac_tbl_wren;
reg   [HDR_MAC_ADDR_WIDTH-1:0]          r_axis_mac_tbl_wr_data;

reg   [IP_TBL_ADDR_WIDTH-1:0]      r_axis_ip_tbl_addr;
reg                                 r_axis_ip_tbl_wren;
reg   [HDR_IP_ADDR_WIDTH-1:0]           r_axis_ip_tbl_wr_data;

reg   [PORT_NO_TBL_ADDR_WIDTH-1:0]  r_axis_port_tbl_addr;
reg                                 r_axis_port_tbl_wren;
reg   [HDR_PORT_NO_WIDTH-1:0]              r_axis_port_tbl_wr_data;

reg   [ACT_ADDR_WIDTH-1:0]          r_axis_port_act_addr;
reg                                 r_axis_port_act_wren;
reg   [ACT_DATA_WIDTH-1:0]          r_axis_port_act_wr_data;

reg   [ACT_ADDR_WIDTH-1:0]          r_axis_vlan_act_addr;
reg                                 r_axis_vlan_act_wren;
reg   [ACT_VLAN_WIDTH-1:0]     r_axis_vlan_act_wr_data;


always @(*) begin
   m_axis_tdata               = 0;
   m_axis_tstrb               = 0;
   m_axis_tuser               = 0;
   m_axis_tvalid              = 0;
   m_axis_tlast               = 0;
   r_axis_mac_tbl_addr        = 0;
   r_axis_mac_tbl_wren        = 0;
   r_axis_mac_tbl_wr_data     = 0;
   r_axis_ip_tbl_addr         = 0;
   r_axis_ip_tbl_wren         = 0;
   r_axis_ip_tbl_wr_data      = 0;
   r_axis_port_tbl_addr       = 0;
   r_axis_port_tbl_wren       = 0;
   r_axis_port_tbl_wr_data    = 0;
   r_axis_port_act_addr       = 0;
   r_axis_port_act_wren       = 0;
   r_axis_port_act_wr_data    = 0;
   r_axis_vlan_act_addr       = 0;
   r_axis_vlan_act_wren       = 0;
   r_axis_vlan_act_wr_data    = 0;
   dma_pkt_rden               = 0;
   StNext                     = `ST_IDLE;
   case (StCurrent)
      `ST_IDLE : begin
         m_axis_tdata            = 0;
         m_axis_tstrb            = 0;
         m_axis_tuser            = 0;
         m_axis_tvalid           = 0;
         m_axis_tlast            = 0;
         r_axis_mac_tbl_addr     = 0;
         r_axis_mac_tbl_wren     = 0;
         r_axis_mac_tbl_wr_data  = 0;
         r_axis_ip_tbl_addr      = 0;
         r_axis_ip_tbl_wren      = 0;
         r_axis_ip_tbl_wr_data   = 0;
         r_axis_port_tbl_addr    = 0;
         r_axis_port_tbl_wren    = 0;
         r_axis_port_tbl_wr_data = 0;
         r_axis_port_act_addr    = 0;
         r_axis_port_act_wren    = 0;
         r_axis_port_act_wr_data = 0;
         r_axis_vlan_act_addr    = 0;
         r_axis_vlan_act_wren    = 0;
         r_axis_vlan_act_wr_data = 0;
         dma_pkt_rden            = (update_enable) ? 1 : 0;
         StNext                  = (update_enable) ? `ST_WR_TABLE : (fwd_enable) ? `ST_FWD : `ST_IDLE;
      end
      `ST_FWD : begin
         m_axis_tdata            = dma_tdata;
         m_axis_tstrb            = dma_tstrb;
         m_axis_tuser            = dma_tuser;
         m_axis_tvalid           = ~dma_pkt_empty;
         m_axis_tlast            = dma_tlast;
         dma_pkt_rden            = m_axis_tready & ~dma_pkt_empty;
         StNext                  = (dma_tlast && ~dma_pkt_empty && m_axis_tready) ? `ST_IDLE : `ST_FWD;
      end
      `ST_WR_TABLE : begin
         case (dma_tdata[63:60])
            4'h1 : begin //Write mac table entry.
               r_axis_mac_tbl_addr     = dma_tdata[48+:MAC_TBL_ADDR_WIDTH];
               r_axis_mac_tbl_wren     = ~dma_pkt_empty;
               r_axis_mac_tbl_wr_data  = dma_tdata[0+:HDR_MAC_ADDR_WIDTH];
               StNext                  = `ST_WR_WAIT;
            end
            4'h2 : begin
               r_axis_ip_tbl_addr      = dma_tdata[48+:IP_TBL_ADDR_WIDTH];
               r_axis_ip_tbl_wren      = ~dma_pkt_empty;
               r_axis_ip_tbl_wr_data   = dma_tdata[0+:HDR_IP_ADDR_WIDTH];
               StNext                  = `ST_WR_WAIT;
            end
            4'h3 : begin
               r_axis_port_tbl_addr    = dma_tdata[48+:PORT_NO_TBL_ADDR_WIDTH];
               r_axis_port_tbl_wren    = ~dma_pkt_empty;
               r_axis_port_tbl_wr_data = dma_tdata[0+:HDR_PORT_NO_WIDTH];
               StNext                  = `ST_WR_WAIT;
            end
            //Act table.
            4'ha : begin
               r_axis_port_act_addr    = dma_tdata[48+:ACT_ADDR_WIDTH];
               r_axis_port_act_wren    = ~dma_pkt_empty;
               r_axis_port_act_wr_data = dma_tdata[0+:ACT_DATA_WIDTH];
               dma_pkt_rden            = ~dma_pkt_empty;
               StNext                  = (dma_tlast && ~dma_pkt_empty) ? `ST_IDLE : `ST_WR_TABLE;
            end
            4'hb : begin
               r_axis_vlan_act_addr    = dma_tdata[48+:ACT_ADDR_WIDTH];
               r_axis_vlan_act_wren    = ~dma_pkt_empty;
               r_axis_vlan_act_wr_data = dma_tdata[0+:ACT_VLAN_WIDTH];
               dma_pkt_rden            = ~dma_pkt_empty;
               StNext                  = (dma_tlast && ~dma_pkt_empty) ? `ST_IDLE : `ST_WR_TABLE;
            end
            default : begin
               dma_pkt_rden            = ~dma_pkt_empty;
               StNext                  = (dma_tlast && ~dma_pkt_empty) ? `ST_IDLE : `ST_WR_TABLE;
            end               
         endcase
      end
      `ST_WR_WAIT: begin //Wait, tCAM is busy to write data.
         StNext         = (axis_mac_tbl_busy || axis_ip_tbl_busy || axis_port_tbl_busy) ? `ST_TCAM_BUSY : `ST_WR_WAIT;
      end
      `ST_TCAM_BUSY: begin
         StNext         = ~(axis_mac_tbl_busy || axis_ip_tbl_busy || axis_port_tbl_busy) ? (dma_tlast && ~dma_pkt_empty) ? `ST_IDLE : `ST_WR_TABLE : `ST_TCAM_BUSY;
         dma_pkt_rden   = ~(axis_mac_tbl_busy || axis_ip_tbl_busy || axis_port_tbl_busy) ? ~dma_pkt_empty : 0;
      end
   endcase
end

always @(posedge axi_aclk)
   if (~axi_resetn)  begin
      axis_mac_tbl_addr       <= 0;
      axis_mac_tbl_wren       <= 0;
      axis_mac_tbl_wr_data    <= 0;
      axis_ip_tbl_addr        <= 0;
      axis_ip_tbl_wren        <= 0;
      axis_ip_tbl_wr_data     <= 0;
      axis_port_tbl_addr      <= 0;
      axis_port_tbl_wren      <= 0;
      axis_port_tbl_wr_data   <= 0;
      axis_port_act_addr      <= 0;
      axis_port_act_wren      <= 0;
      axis_port_act_wr_data   <= 0;
      axis_vlan_act_addr      <= 0;
      axis_vlan_act_wren      <= 0;
      axis_vlan_act_wr_data   <= 0;
   end
   else begin
      axis_mac_tbl_addr       <= r_axis_mac_tbl_addr;
      axis_mac_tbl_wren       <= r_axis_mac_tbl_wren;
      axis_mac_tbl_wr_data    <= r_axis_mac_tbl_wr_data;
      axis_ip_tbl_addr        <= r_axis_ip_tbl_addr;
      axis_ip_tbl_wren        <= r_axis_ip_tbl_wren;
      axis_ip_tbl_wr_data     <= r_axis_ip_tbl_wr_data;
      axis_port_tbl_addr      <= r_axis_port_tbl_addr;
      axis_port_tbl_wren      <= r_axis_port_tbl_wren;
      axis_port_tbl_wr_data   <= r_axis_port_tbl_wr_data;
      axis_port_act_addr      <= r_axis_port_act_addr;
      axis_port_act_wren      <= r_axis_port_act_wren;
      axis_port_act_wr_data   <= r_axis_port_act_wr_data;
      axis_vlan_act_addr      <= r_axis_vlan_act_addr;
      axis_vlan_act_wren      <= r_axis_vlan_act_wren;
      axis_vlan_act_wr_data   <= r_axis_vlan_act_wr_data;
   end

endmodule
