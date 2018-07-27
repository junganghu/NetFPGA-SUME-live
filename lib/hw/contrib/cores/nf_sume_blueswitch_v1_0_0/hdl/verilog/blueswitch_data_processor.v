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


// blueswitch_data_processor.v --+ timestamp_pad_proc.v
//                               + fifo_depth_monitor.v - 
//                               + fallthrough_smal_fifo.v - rx_packet_fifo,
//                               tx_pack_fifo
//                               + checksum_processor.v
//                               + packet_header_parser.v
//                               + data_processor_controller.v


`timescale 1 ns/1ps 
 
`include "nf_sume_blueswitch_register_define.v" 
`include "nf_sume_blueswitch_parameter_define.v" 
 
module blueswitch_data_processor 
#( 
   parameter   C_S_AXI_DATA_WIDTH         = 32,           
   parameter   C_S_AXI_ADDR_WIDTH         = 32,           
   parameter   BASEADDR_OFFSET            = 16'hFFFF, 
 
   parameter   C_M_AXIS_TDATA_WIDTH       = 256, 
   parameter   C_S_AXIS_TDATA_WIDTH       = 256, 
   parameter   C_M_AXIS_TUSER_WIDTH       = 128, 
   parameter   C_S_AXIS_TUSER_WIDTH       = 128, 
 
   parameter   HDR_MAC_ADDR_WIDTH         = 48, 
   parameter   HDR_ETH_TYPE_WIDTH         = 16, 
   parameter   HDR_IP_ADDR_WIDTH          = 32, 
   parameter   HDR_IP_PROT_WIDTH          = 8, 
   parameter   HDR_PORT_NO_WIDTH          = 16, 
   parameter   HDR_VLAN_WIDTH             = 32, 

   //HDR_MAC_ADDR_WIDTH*2 + HDR_IP_PROT_WIDTH + HDR_ETH_TYPE_WIDTH*3 + HDR_IP_ADDR_WIDTH*2
   parameter   C_M_HDR_TDATA_WIDTH        = 32, 
   parameter   C_M_HDR_TUSER_WIDTH        = 8,
 
   parameter   C_S_ACT_TDATA_WIDTH        = 10, 
   parameter   C_S_ACT_TUSER_WIDTH        = 8, 
 
   parameter   SOURCE_PORT                = 8'h01,
   parameter   TUSER_SRC_PORT             = 0
) 
( 
   // Slave AXI Ports 
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
 
   // Slave Stream Ports (interface to data path) 
   input          [C_S_AXIS_TDATA_WIDTH-1:0]          s_axis_tdata, 
   input          [((C_S_AXIS_TDATA_WIDTH/8))-1:0]    s_axis_tstrb, 
   input          [C_S_AXIS_TUSER_WIDTH-1:0]          s_axis_tuser, 
   input                                              s_axis_tvalid, 
   output                                             s_axis_tready, 
   input                                              s_axis_tlast, 
 
   // Master Stream Ports (interface to TX queues) 
   output         [C_M_AXIS_TDATA_WIDTH-1:0]          m_axis_tdata, 
   output         [((C_M_AXIS_TDATA_WIDTH/8))-1:0]    m_axis_tstrb, 
   output         [C_M_AXIS_TUSER_WIDTH-1:0]          m_axis_tuser, 
   output                                             m_axis_tvalid, 
   input                                              m_axis_tready, 
   output                                             m_axis_tlast, 
 
   // Slave Stream Ports (interface to data path) 
   // Destination port, hit, miss, VLAN, vlan action.
   //32 + 4 + 8 + 2 + 16 + 2 = 64
   //{sw tag(32), sw tag val(4), vlan action(2), vlan(16), miss(1), hit(1), destination port(8)}
   input          [C_S_ACT_TDATA_WIDTH-1:0]           s_match_tdata, 
   input          [C_S_ACT_TUSER_WIDTH-1:0]           s_match_tuser, 
   input                                              s_match_tvalid, 
   output                                             s_match_tready, 
 
   // Master Stream Ports (interface to TX queues) 
   output         [C_M_HDR_TDATA_WIDTH-1:0]           m_match_tdata, 
   output         [C_M_HDR_TUSER_WIDTH-1:0]           m_match_tuser, 
   output                                             m_match_tvalid, 
   input                                              m_match_tready, 
 
   input          [63:0]                              ref_counter 
); 
 
//log2
function integer log2; 
   input integer number; 
   begin 
      log2=0; 
      while(2**log2<number) begin 
         log2=log2+1; 
      end 
   end 
endfunction
 
localparam  BUFFER_SIZE          = 2048;//Buffer size 4096B 
localparam  BUFFER_SIZE_WIDTH    = log2(BUFFER_SIZE/(C_S_AXIS_TDATA_WIDTH/8)); 

 
wire  [C_S_AXIS_TDATA_WIDTH-1:0]       rx_fifo_tdata; 
wire  [(C_S_AXIS_TDATA_WIDTH/8)-1:0]   rx_fifo_tstrb; 
wire  [C_S_AXIS_TUSER_WIDTH-1:0]       rx_fifo_tuser; 
wire                                   rx_fifo_tlast; 
wire  rx_fifo_empty, rx_fifo_full, rx_fifo_tready; 
 
wire  [C_M_AXIS_TDATA_WIDTH-1:0]       tx_fifo_tdata; 
wire  [(C_M_AXIS_TDATA_WIDTH/8)-1:0]   tx_fifo_tstrb; 
wire  [C_M_AXIS_TUSER_WIDTH-1:0]       tx_fifo_tuser; 
wire                                   tx_fifo_tlast; 
wire  tx_fifo_wren; 
wire  tx_fifo_empty, tx_fifo_full, tx_fifo_tvalid; 
 
wire  [HDR_MAC_ADDR_WIDTH-1:0]         w_dst_mac_addr, w_src_mac_addr; 
wire  [HDR_ETH_TYPE_WIDTH-1:0]         w_eth_type; 
wire  [HDR_IP_PROT_WIDTH-1:0]          w_ip_pro; 
wire  [HDR_IP_ADDR_WIDTH-1:0]          w_src_ip_addr, w_dst_ip_addr; 
wire  [HDR_PORT_NO_WIDTH-1:0]          w_src_port_no, w_dst_port_no;
wire  [`DEF_SW_TAG-1:0]                w_sw_tag;
wire  [`DEF_SW_TAG_VAL-1:0]            w_sw_tag_val;
wire  parser_en; 

wire  bus_ts_valid; 
wire  [7:0]    bus_slave_ts_position, bus_master_ts_position;
wire  [C_S_AXI_DATA_WIDTH-1:0]   bus_sw_tag;
wire  [`DEF_SW_TAG_VAL-1:0]      bus_sw_tag_val;
wire  clear_sw_tag_val;
 
reg   [C_S_AXI_DATA_WIDTH-1:0]   bus_rx_byte_cnt, bus_tx_byte_cnt; 
reg   [C_S_AXI_DATA_WIDTH-1:0]   bus_rx_pkt_cnt, bus_tx_pkt_cnt; 
wire  bus_clear_cnt; 
wire  [7:0] bus_miss_fwd_port_map; 
 
wire  s_axis_hold = 0; 
 
// Update tuser value for multiple switch implementation.
reg   [C_S_AXIS_TUSER_WIDTH-1:0]    r_s_axis_tuser;
always @(*) begin
   r_s_axis_tuser = s_axis_tuser;
   r_s_axis_tuser[16+:8] = TUSER_SRC_PORT;
end

assign s_axis_tready = ~rx_fifo_full;// & s_axis_hold; 
 
wire  [C_S_AXIS_TDATA_WIDTH-1:0]  s_axis_tdata_ts_pad; 
wire  [C_M_AXIS_TDATA_WIDTH-1:0]  m_axis_tdata_ts_pad, w_m_axis_tdata; 
 
timestamp_pad_proc
#( 
   .TS_POSITION_WIDTH      (  8                       ),
   .C_M_AXIS_TDATA_WIDTH   (  C_M_AXIS_TDATA_WIDTH    ),
   .C_S_AXIS_TDATA_WIDTH   (  C_S_AXIS_TDATA_WIDTH    )
) 
timestamp_pad_proc
( 
   .axi_aclk               (  axi_aclk                ),
   .axi_resetn             (  axi_resetn              ),
   .ref_counter            (  ref_counter             ),
   .ts_valid               (  bus_ts_valid            ),
   .slave_ts_position      (  bus_slave_ts_position   ),
   .master_ts_position     (  bus_master_ts_position  ),
   .s_axis_tdata           (  s_axis_tdata            ),
   .s_axis_tvalid          (  s_axis_tvalid           ),
   .s_axis_tready          (  s_axis_tready           ),
   .s_axis_tlast           (  s_axis_tlast            ),
   .s_axis_tdata_ts_pad    (  s_axis_tdata_ts_pad     ),
   .m_axis_tdata           (  w_m_axis_tdata          ), 
   .m_axis_tvalid          (  m_axis_tvalid           ),
   .m_axis_tready          (  m_axis_tready           ),
   .m_axis_tlast           (  m_axis_tlast            ),
   .m_axis_tdata_ts_pad    (  m_axis_tdata_ts_pad     )
); 
 
 
//Tx byte Count 
reg   r_m_axis_tvalid, r_m_axis_tready, r_m_axis_tlast; 
reg   [(C_S_AXIS_TDATA_WIDTH/8)-1:0]    r_m_axis_tstrb; 
always @(posedge axi_aclk) 
   if (~axi_resetn) begin 
      r_m_axis_tvalid   <= 0; 
      r_m_axis_tready   <= 0; 
      r_m_axis_tstrb    <= 0; 
      r_m_axis_tlast    <= 0; 
   end 
   else begin 
      r_m_axis_tvalid   <= m_axis_tvalid; 
      r_m_axis_tready   <= m_axis_tready; 
      r_m_axis_tstrb    <= m_axis_tstrb; 
      r_m_axis_tlast    <= m_axis_tlast; 
   end 
 
wire  [3:0] sum_tx_strb = r_m_axis_tstrb[0] + r_m_axis_tstrb[1] + r_m_axis_tstrb[2] + r_m_axis_tstrb[3] +  
                          r_m_axis_tstrb[4] + r_m_axis_tstrb[5] + r_m_axis_tstrb[6] + r_m_axis_tstrb[7]; 
 
wire  w_tx_byte_cnt_valid = r_m_axis_tvalid & r_m_axis_tready; 
 
//Pass to CPU 
always @(posedge axi_aclk) 
   if (~axi_resetn) 
      bus_tx_byte_cnt    <= 0; 
   else if (bus_clear_cnt) 
      bus_tx_byte_cnt    <= 0; 
   else if (w_tx_byte_cnt_valid) 
      bus_tx_byte_cnt    <= bus_tx_byte_cnt + sum_tx_strb; 
 
wire  w_tx_pkt_cnt_en = (m_axis_tvalid & m_axis_tready & ~m_axis_tlast) & ~(r_m_axis_tvalid & r_m_axis_tready & ~r_m_axis_tlast); 
 
always @(posedge axi_aclk) 
   if (~axi_resetn) 
      bus_tx_pkt_cnt    <= 0; 
   else if (bus_clear_cnt) 
      bus_tx_pkt_cnt    <= 0; 
   else if (w_tx_pkt_cnt_en) 
      bus_tx_pkt_cnt    <= bus_tx_pkt_cnt + 1; 
 
 
//Rx byte Count 
reg   r_s_axis_tvalid, r_s_axis_tready, r_s_axis_tlast; 
reg   [(C_S_AXIS_TDATA_WIDTH/8)-1:0]    r_s_axis_tstrb; 
always @(posedge axi_aclk) 
   if (~axi_resetn) begin 
      r_s_axis_tvalid   <= 0; 
      r_s_axis_tready   <= 0; 
      r_s_axis_tstrb    <= 0; 
      r_s_axis_tlast    <= 0; 
   end 
   else begin 
      r_s_axis_tvalid   <= s_axis_tvalid; 
      r_s_axis_tready   <= s_axis_tready; 
      r_s_axis_tstrb    <= s_axis_tstrb; 
      r_s_axis_tlast    <= s_axis_tlast; 
   end 
 
wire  [3:0] sum_rx_strb = r_s_axis_tstrb[0] + r_s_axis_tstrb[1] + r_s_axis_tstrb[2] + r_s_axis_tstrb[3] +  
                          r_s_axis_tstrb[4] + r_s_axis_tstrb[5] + r_s_axis_tstrb[6] + r_s_axis_tstrb[7]; 
 
wire  w_rx_byte_cnt_valid = r_s_axis_tvalid & r_s_axis_tready; 
 
//Pass to CPU 
always @(posedge axi_aclk) 
   if (~axi_resetn) 
      bus_rx_byte_cnt    <= 0; 
   else if (bus_clear_cnt) 
      bus_rx_byte_cnt    <= 0; 
   else if (w_rx_byte_cnt_valid) 
      bus_rx_byte_cnt    <= bus_rx_byte_cnt + sum_rx_strb; 
 
wire  w_rx_fifo_cnt_en = (s_axis_tvalid & s_axis_tready & ~s_axis_tlast) & ~(r_s_axis_tvalid & r_s_axis_tready & ~r_s_axis_tlast); 
 
always @(posedge axi_aclk) 
   if (~axi_resetn) 
      bus_rx_pkt_cnt    <= 0; 
   else if (bus_clear_cnt) 
      bus_rx_pkt_cnt    <= 0; 
   else if (w_rx_fifo_cnt_en) 
      bus_rx_pkt_cnt    <= bus_rx_pkt_cnt + 1; 
 
 
wire  [C_S_AXI_DATA_WIDTH-1:0]   bus_rx_fifo_depth, bus_rx_fifo_depth_max; 
 
fifo_depth_monitor 
#( 
   .C_S_AXI_DATA_WIDTH     (  C_S_AXI_DATA_WIDTH                  ) 
) 
rx_fifo_monitor 
( 
   .axi_aclk               (  axi_aclk                            ), 
   .axi_resetn             (  axi_resetn                          ), 
   .fifo_wren              (  r_s_axis_tvalid & r_s_axis_tready   ), 
   .fifo_rden              (  rx_fifo_rden_d1                     ), 
   .clear                  (  bus_clear_cnt                       ), 
   .fifo_depth             (  bus_rx_fifo_depth                   ), 
   .fifo_depth_max         (  bus_rx_fifo_depth_max               ) 
); 

wire  [C_S_AXIS_TDATA_WIDTH-1:0] w_s_axis_tdata = (bus_ts_valid) ? s_axis_tdata_ts_pad : s_axis_tdata;

localparam  RX_FIFO_WIDTH = C_S_AXIS_TDATA_WIDTH+C_S_AXIS_TUSER_WIDTH+(C_S_AXIS_TDATA_WIDTH/8)+1; 
fallthrough_small_fifo 
#( 
   .WIDTH                  (  RX_FIFO_WIDTH        ), 
   .MAX_DEPTH_BITS         (  BUFFER_SIZE_WIDTH    ) 
) 
rx_packet_fifo 
( 
   // Outputs 
   .dout                   (  {rx_fifo_tlast, rx_fifo_tstrb, rx_fifo_tuser, rx_fifo_tdata}      ), 
   .rd_en                  (  ~rx_fifo_empty & rx_fifo_tready                                   ), 
   .full                   (), 
   .nearly_full            (), 
   .prog_full              (  rx_fifo_full                                                      ), 
   .empty                  (  rx_fifo_empty                                                     ), 
   // Inputs 
   .din                    (  {s_axis_tlast, s_axis_tstrb, r_s_axis_tuser, w_s_axis_tdata}      ),
   .wr_en                  (  s_axis_tvalid & s_axis_tready                                     ), 
   .reset                  (  ~axi_resetn                                                       ), 
   .clk                    (  axi_aclk                                                          ) 
); 
 
 
checksum_processor
#( 
   .C_S_AXIS_TDATA_WIDTH   (  C_S_AXIS_TDATA_WIDTH             ),
   .C_S_AXIS_TUSER_WIDTH   (  C_S_AXIS_TUSER_WIDTH             )
) 
checksum_processor 
( 
   .axi_aclk               (  axi_aclk                         ),
   .axi_resetn             (  axi_resetn                       ),
                                                  
   .s_axis_tdata           (  s_axis_tdata                     ),
   .s_axis_tstrb           (  s_axis_tstrb                     ),
   .s_axis_tuser           (  r_s_axis_tuser                   ),
   .s_axis_tlast           (  s_axis_tlast                     ),
   .s_axis_tvalid          (  s_axis_tvalid & s_axis_tready    )
); 

packet_header_parser 
#( 
   .C_S_AXIS_TDATA_WIDTH   (  C_S_AXIS_TDATA_WIDTH             ),
 
   .HDR_MAC_ADDR_WIDTH     (  HDR_MAC_ADDR_WIDTH               ),
   .HDR_ETH_TYPE_WIDTH     (  HDR_ETH_TYPE_WIDTH               ),
   .HDR_IP_ADDR_WIDTH      (  HDR_IP_ADDR_WIDTH                ),
   .HDR_IP_PROT_WIDTH      (  HDR_IP_PROT_WIDTH                ),
   .HDR_PORT_NO_WIDTH      (  HDR_PORT_NO_WIDTH                ),
   .HDR_VLAN_WIDTH         (  HDR_VLAN_WIDTH                   )
) 
packet_header_parser 
( 
   .axi_aclk               (  axi_aclk                         ),
   .axi_resetn             (  axi_resetn                       ),
                                                  
   .s_axis_tdata           (  s_axis_tdata                     ),
   .s_axis_tlast           (  s_axis_tlast                     ),
   .s_axis_tvalid          (  s_axis_tvalid & s_axis_tready    ),

   .bus_sw_tag_val         (  bus_sw_tag_val                   ),
   .clear_sw_tag_val       (  clear_sw_tag_val                 ),
   .bus_sw_tag             (  bus_sw_tag                       ),
                                                  
   .out_dst_mac_addr       (  w_dst_mac_addr                   ),
   .out_src_mac_addr       (  w_src_mac_addr                   ),
   .out_eth_type           (  w_eth_type                       ),
   .out_ip_pro             (  w_ip_pro                         ),
   .out_dst_ip_addr        (  w_dst_ip_addr                    ),
   .out_src_ip_addr        (  w_src_ip_addr                    ),
   .out_dst_port_no        (  w_dst_port_no                    ),
   .out_src_port_no        (  w_src_port_no                    ),
   .out_sw_tag             (  w_sw_tag                         ),
   .out_sw_tag_val         (  w_sw_tag_val                     ),

   .parser_en              (  parser_en                        ) 
); 

assign m_match_tdata = {w_sw_tag, w_sw_tag_val,
                        w_src_port_no, w_dst_port_no, 
                        w_src_ip_addr, w_dst_ip_addr,
                        w_ip_pro, w_eth_type, 
                        w_src_mac_addr, w_dst_mac_addr};

assign m_match_tuser = SOURCE_PORT; 
assign m_match_tvalid = parser_en; 

assign m_axis_tvalid = ~tx_fifo_empty;
assign m_axis_tdata = (bus_ts_valid) ? m_axis_tdata_ts_pad : w_m_axis_tdata;

packet_data_marshaller 
#( 
   .C_M_AXIS_TDATA_WIDTH      (  64                      ), 
   .C_S_AXIS_TDATA_WIDTH      (  64                      ), 
   .C_M_AXIS_TUSER_WIDTH      (  128                     ), 
   .C_S_AXIS_TUSER_WIDTH      (  128                     ), 
 
   .C_S_ACT_TDATA_WIDTH       (  C_S_ACT_TDATA_WIDTH     ), 
   .C_S_ACT_TUSER_WIDTH       (  8                       ),
   .SOURCE_PORT               (  SOURCE_PORT             )
)
packet_data_marshaller
( 
   .axis_aclk                 (  axi_aclk                ),
   .axis_resetn               (  axi_resetn              ),

   .bus_sw_tag                (  bus_sw_tag              ),

   .s_axis_tdata              (  rx_fifo_tdata           ),
   .s_axis_tstrb              (  rx_fifo_tstrb           ),
   .s_axis_tuser              (  rx_fifo_tuser           ),
   .s_axis_tvalid             (  ~rx_fifo_empty          ),
   .s_axis_tready             (  rx_fifo_tready          ),
   .s_axis_tlast              (  rx_fifo_tlast           ),
 
   .m_axis_tdata              (  tx_fifo_tdata           ),
   .m_axis_tstrb              (  tx_fifo_tstrb           ),
   .m_axis_tuser              (  tx_fifo_tuser           ),
   .m_axis_tvalid             (  tx_fifo_tvalid          ),
   .m_axis_tready             (  ~tx_fifo_full           ),
   .m_axis_tlast              (  tx_fifo_tlast           ),
 
   .s_action_tdata            (  s_match_tdata           ),
   .s_action_tuser            (  s_match_tuser           ),
   .s_action_tvalid           (  s_match_tvalid          ),
   .s_action_tready           (  s_match_tready          ),

   .bus_miss_fwd_port_map     (  bus_miss_fwd_port_map   )
); 
 
localparam  TX_FIFO_WIDTH = C_M_AXIS_TDATA_WIDTH+C_M_AXIS_TUSER_WIDTH+(C_M_AXIS_TDATA_WIDTH/8)+1;

fallthrough_small_fifo 
#( 
   .WIDTH            (  TX_FIFO_WIDTH        ), 
   .MAX_DEPTH_BITS   (  BUFFER_SIZE_WIDTH    ) 
) 
tx_packet_fifo 
( 
   //Outputs 
   .dout             (  {m_axis_tlast, m_axis_tstrb, m_axis_tuser, w_m_axis_tdata}     ), 
   .rd_en            (  m_axis_tready & m_axis_tvalid                                  ), 
   .full             (), 
   .nearly_full      (), 
   .prog_full        (  tx_fifo_full                                                   ), 
   .empty            (  tx_fifo_empty                                                  ), 
   //Inputs 
   .din              (  {tx_fifo_tlast, tx_fifo_tstrb, tx_fifo_tuser, tx_fifo_tdata}   ), 
   .wr_en            (  tx_fifo_tvalid & ~tx_fifo_full                                 ), 
   .reset            (  ~axi_resetn                                                    ), 
   .clk              (  axi_aclk                                                       ) 
); 
 
data_processor_controller 
#( 
   .C_S_AXI_DATA_WIDTH     (  C_S_AXI_DATA_WIDTH         ), 
   .C_S_AXI_ADDR_WIDTH     (  C_S_AXI_ADDR_WIDTH         ), 
   .BASEADDR_OFFSET        (  BASEADDR_OFFSET            ) 
) 
data_processor_controller 
( 
   .Bus2IP_Clk             (  Bus2IP_Clk                 ), 
   .Bus2IP_Resetn          (  Bus2IP_Resetn              ), 
   .Bus2IP_Addr            (  Bus2IP_Addr                ), 
   .Bus2IP_CS              (  Bus2IP_CS                  ), 
   .Bus2IP_RNW             (  Bus2IP_RNW                 ), 
   .Bus2IP_Data            (  Bus2IP_Data                ), 
   .Bus2IP_BE              (  Bus2IP_BE                  ), 
   .IP2Bus_Data            (  IP2Bus_Data                ), 
   .IP2Bus_RdAck           (  IP2Bus_RdAck               ), 
   .IP2Bus_WrAck           (  IP2Bus_WrAck               ), 
 
   .bus_ts_valid           (  bus_ts_valid               ),
   .bus_slave_ts_position  (  bus_slave_ts_position      ), 
   .bus_master_ts_position (  bus_master_ts_position     ),
   .bus_sw_tag             (  bus_sw_tag                 ),
   .bus_sw_tag_val         (  bus_sw_tag_val             ),
   .clear_sw_tag_val       (  clear_sw_tag_val           ),

   .bus_rx_byte_cnt        (  bus_rx_byte_cnt            ), 
   .bus_rx_pkt_cnt         (  bus_rx_pkt_cnt             ), 
   .bus_tx_byte_cnt        (  bus_tx_byte_cnt            ), 
   .bus_tx_pkt_cnt         (  bus_tx_pkt_cnt             ),
   .bus_clear_cnt          (  bus_clear_cnt              ),
   .bus_miss_fwd_port_map  (  bus_miss_fwd_port_map      ), 
   .bus_rx_fifo_depth      (  bus_rx_fifo_depth          ), 
   .bus_rx_fifo_depth_max  (  bus_rx_fifo_depth_max      ) 
); 
 
endmodule 
