// (c) Copyright 1995-2018 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: NetFPGA:NetFPGA:output_queues:1.00
// IP Revision: 1

`timescale 1ns/1ps

(* DowngradeIPIdentifiedWarnings = "yes" *)
module output_queues_ip (
  axis_aclk,
  axis_resetn,
  s_axis_tdata,
  s_axis_tkeep,
  s_axis_tuser,
  s_axis_tvalid,
  s_axis_tready,
  s_axis_tlast,
  m_axis_0_tdata,
  m_axis_0_tkeep,
  m_axis_0_tuser,
  m_axis_0_tvalid,
  m_axis_0_tready,
  m_axis_0_tlast,
  m_axis_1_tdata,
  m_axis_1_tkeep,
  m_axis_1_tuser,
  m_axis_1_tvalid,
  m_axis_1_tready,
  m_axis_1_tlast,
  m_axis_2_tdata,
  m_axis_2_tkeep,
  m_axis_2_tuser,
  m_axis_2_tvalid,
  m_axis_2_tready,
  m_axis_2_tlast,
  m_axis_3_tdata,
  m_axis_3_tkeep,
  m_axis_3_tuser,
  m_axis_3_tvalid,
  m_axis_3_tready,
  m_axis_3_tlast,
  m_axis_4_tdata,
  m_axis_4_tkeep,
  m_axis_4_tuser,
  m_axis_4_tvalid,
  m_axis_4_tready,
  m_axis_4_tlast,
  bytes_stored,
  pkt_stored,
  bytes_removed_0,
  bytes_removed_1,
  bytes_removed_2,
  bytes_removed_3,
  bytes_removed_4,
  pkt_removed_0,
  pkt_removed_1,
  pkt_removed_2,
  pkt_removed_3,
  pkt_removed_4,
  S_AXI_ACLK,
  S_AXI_ARESETN,
  S_AXI_AWADDR,
  S_AXI_AWVALID,
  S_AXI_WDATA,
  S_AXI_WSTRB,
  S_AXI_WVALID,
  S_AXI_BREADY,
  S_AXI_ARADDR,
  S_AXI_ARVALID,
  S_AXI_RREADY,
  S_AXI_ARREADY,
  S_AXI_RDATA,
  S_AXI_RRESP,
  S_AXI_RVALID,
  S_AXI_WREADY,
  S_AXI_BRESP,
  S_AXI_BVALID,
  S_AXI_AWREADY,
  bytes_dropped,
  pkt_dropped
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 axis_aclk CLK" *)
input wire axis_aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axis_resetn RST" *)
input wire axis_resetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TDATA" *)
input wire [255 : 0] s_axis_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TKEEP" *)
input wire [31 : 0] s_axis_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TUSER" *)
input wire [127 : 0] s_axis_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TVALID" *)
input wire s_axis_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TREADY" *)
output wire s_axis_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis TLAST" *)
input wire s_axis_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TDATA" *)
output wire [255 : 0] m_axis_0_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TKEEP" *)
output wire [31 : 0] m_axis_0_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TUSER" *)
output wire [127 : 0] m_axis_0_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TVALID" *)
output wire m_axis_0_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TREADY" *)
input wire m_axis_0_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TLAST" *)
output wire m_axis_0_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_1 TDATA" *)
output wire [255 : 0] m_axis_1_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_1 TKEEP" *)
output wire [31 : 0] m_axis_1_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_1 TUSER" *)
output wire [127 : 0] m_axis_1_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_1 TVALID" *)
output wire m_axis_1_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_1 TREADY" *)
input wire m_axis_1_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_1 TLAST" *)
output wire m_axis_1_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_2 TDATA" *)
output wire [255 : 0] m_axis_2_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_2 TKEEP" *)
output wire [31 : 0] m_axis_2_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_2 TUSER" *)
output wire [127 : 0] m_axis_2_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_2 TVALID" *)
output wire m_axis_2_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_2 TREADY" *)
input wire m_axis_2_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_2 TLAST" *)
output wire m_axis_2_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_3 TDATA" *)
output wire [255 : 0] m_axis_3_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_3 TKEEP" *)
output wire [31 : 0] m_axis_3_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_3 TUSER" *)
output wire [127 : 0] m_axis_3_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_3 TVALID" *)
output wire m_axis_3_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_3 TREADY" *)
input wire m_axis_3_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_3 TLAST" *)
output wire m_axis_3_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_4 TDATA" *)
output wire [255 : 0] m_axis_4_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_4 TKEEP" *)
output wire [31 : 0] m_axis_4_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_4 TUSER" *)
output wire [127 : 0] m_axis_4_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_4 TVALID" *)
output wire m_axis_4_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_4 TREADY" *)
input wire m_axis_4_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_4 TLAST" *)
output wire m_axis_4_tlast;
output wire [31 : 0] bytes_stored;
output wire [4 : 0] pkt_stored;
output wire [31 : 0] bytes_removed_0;
output wire [31 : 0] bytes_removed_1;
output wire [31 : 0] bytes_removed_2;
output wire [31 : 0] bytes_removed_3;
output wire [31 : 0] bytes_removed_4;
output wire pkt_removed_0;
output wire pkt_removed_1;
output wire pkt_removed_2;
output wire pkt_removed_3;
output wire pkt_removed_4;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_AXI_ACLK CLK" *)
input wire S_AXI_ACLK;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_AXI_ARESETN RST" *)
input wire S_AXI_ARESETN;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWADDR" *)
input wire [11 : 0] S_AXI_AWADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWVALID" *)
input wire S_AXI_AWVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WDATA" *)
input wire [31 : 0] S_AXI_WDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WSTRB" *)
input wire [3 : 0] S_AXI_WSTRB;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WVALID" *)
input wire S_AXI_WVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BREADY" *)
input wire S_AXI_BREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARADDR" *)
input wire [11 : 0] S_AXI_ARADDR;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARVALID" *)
input wire S_AXI_ARVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RREADY" *)
input wire S_AXI_RREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI ARREADY" *)
output wire S_AXI_ARREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RDATA" *)
output wire [31 : 0] S_AXI_RDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RRESP" *)
output wire [1 : 0] S_AXI_RRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI RVALID" *)
output wire S_AXI_RVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI WREADY" *)
output wire S_AXI_WREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BRESP" *)
output wire [1 : 0] S_AXI_BRESP;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI BVALID" *)
output wire S_AXI_BVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S_AXI AWREADY" *)
output wire S_AXI_AWREADY;
output wire [31 : 0] bytes_dropped;
output wire [4 : 0] pkt_dropped;

  output_queues #(
    .C_M_AXIS_DATA_WIDTH(256),
    .C_S_AXIS_DATA_WIDTH(256),
    .C_M_AXIS_TUSER_WIDTH(128),
    .C_S_AXIS_TUSER_WIDTH(128),
    .NUM_QUEUES(5),
    .C_S_AXI_DATA_WIDTH(32),
    .C_S_AXI_ADDR_WIDTH(12),
    .C_BASEADDR(32'H00000000)
  ) inst (
    .axis_aclk(axis_aclk),
    .axis_resetn(axis_resetn),
    .s_axis_tdata(s_axis_tdata),
    .s_axis_tkeep(s_axis_tkeep),
    .s_axis_tuser(s_axis_tuser),
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tready(s_axis_tready),
    .s_axis_tlast(s_axis_tlast),
    .m_axis_0_tdata(m_axis_0_tdata),
    .m_axis_0_tkeep(m_axis_0_tkeep),
    .m_axis_0_tuser(m_axis_0_tuser),
    .m_axis_0_tvalid(m_axis_0_tvalid),
    .m_axis_0_tready(m_axis_0_tready),
    .m_axis_0_tlast(m_axis_0_tlast),
    .m_axis_1_tdata(m_axis_1_tdata),
    .m_axis_1_tkeep(m_axis_1_tkeep),
    .m_axis_1_tuser(m_axis_1_tuser),
    .m_axis_1_tvalid(m_axis_1_tvalid),
    .m_axis_1_tready(m_axis_1_tready),
    .m_axis_1_tlast(m_axis_1_tlast),
    .m_axis_2_tdata(m_axis_2_tdata),
    .m_axis_2_tkeep(m_axis_2_tkeep),
    .m_axis_2_tuser(m_axis_2_tuser),
    .m_axis_2_tvalid(m_axis_2_tvalid),
    .m_axis_2_tready(m_axis_2_tready),
    .m_axis_2_tlast(m_axis_2_tlast),
    .m_axis_3_tdata(m_axis_3_tdata),
    .m_axis_3_tkeep(m_axis_3_tkeep),
    .m_axis_3_tuser(m_axis_3_tuser),
    .m_axis_3_tvalid(m_axis_3_tvalid),
    .m_axis_3_tready(m_axis_3_tready),
    .m_axis_3_tlast(m_axis_3_tlast),
    .m_axis_4_tdata(m_axis_4_tdata),
    .m_axis_4_tkeep(m_axis_4_tkeep),
    .m_axis_4_tuser(m_axis_4_tuser),
    .m_axis_4_tvalid(m_axis_4_tvalid),
    .m_axis_4_tready(m_axis_4_tready),
    .m_axis_4_tlast(m_axis_4_tlast),
    .bytes_stored(bytes_stored),
    .pkt_stored(pkt_stored),
    .bytes_removed_0(bytes_removed_0),
    .bytes_removed_1(bytes_removed_1),
    .bytes_removed_2(bytes_removed_2),
    .bytes_removed_3(bytes_removed_3),
    .bytes_removed_4(bytes_removed_4),
    .pkt_removed_0(pkt_removed_0),
    .pkt_removed_1(pkt_removed_1),
    .pkt_removed_2(pkt_removed_2),
    .pkt_removed_3(pkt_removed_3),
    .pkt_removed_4(pkt_removed_4),
    .S_AXI_ACLK(S_AXI_ACLK),
    .S_AXI_ARESETN(S_AXI_ARESETN),
    .S_AXI_AWADDR(S_AXI_AWADDR),
    .S_AXI_AWVALID(S_AXI_AWVALID),
    .S_AXI_WDATA(S_AXI_WDATA),
    .S_AXI_WSTRB(S_AXI_WSTRB),
    .S_AXI_WVALID(S_AXI_WVALID),
    .S_AXI_BREADY(S_AXI_BREADY),
    .S_AXI_ARADDR(S_AXI_ARADDR),
    .S_AXI_ARVALID(S_AXI_ARVALID),
    .S_AXI_RREADY(S_AXI_RREADY),
    .S_AXI_ARREADY(S_AXI_ARREADY),
    .S_AXI_RDATA(S_AXI_RDATA),
    .S_AXI_RRESP(S_AXI_RRESP),
    .S_AXI_RVALID(S_AXI_RVALID),
    .S_AXI_WREADY(S_AXI_WREADY),
    .S_AXI_BRESP(S_AXI_BRESP),
    .S_AXI_BVALID(S_AXI_BVALID),
    .S_AXI_AWREADY(S_AXI_AWREADY),
    .bytes_dropped(bytes_dropped),
    .pkt_dropped(pkt_dropped)
  );
endmodule
