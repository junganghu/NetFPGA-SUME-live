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


// IP VLNV: NetFPGA:NetFPGA:nf_riffa_dma:1.0
// IP Revision: 1

(* X_CORE_INFO = "nf_riffa_dma,Vivado 2016.4" *)
(* CHECK_LICENSE_TYPE = "control_sub_nf_riffa_dma_1_0,nf_riffa_dma,{}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module control_sub_nf_riffa_dma_1_0 (
  user_clk,
  user_reset,
  user_lnk_up,
  s_axis_rq_tready,
  s_axis_rq_tvalid,
  s_axis_rq_tlast,
  s_axis_rq_tdata,
  s_axis_rq_tkeep,
  s_axis_rq_tuser,
  m_axis_rc_tready,
  m_axis_rc_tvalid,
  m_axis_rc_tlast,
  m_axis_rc_tdata,
  m_axis_rc_tuser,
  m_axis_rc_tkeep,
  m_axis_cq_tready,
  m_axis_cq_tvalid,
  m_axis_cq_tlast,
  m_axis_cq_tdata,
  m_axis_cq_tkeep,
  m_axis_cq_tuser,
  s_axis_cc_tready,
  s_axis_cc_tvalid,
  s_axis_cc_tlast,
  s_axis_cc_tdata,
  s_axis_cc_tkeep,
  s_axis_cc_tuser,
  pcie_rq_seq_num,
  pcie_rq_seq_num_vld,
  pcie_rq_tag,
  pcie_rq_tag_vld,
  pcie_cq_np_req,
  pcie_cq_np_req_count,
  cfg_phy_link_down,
  cfg_phy_link_status,
  cfg_negotiated_width,
  cfg_current_speed,
  cfg_max_payload,
  cfg_max_read_req,
  cfg_function_status,
  cfg_function_power_state,
  cfg_vf_status,
  cfg_vf_power_state,
  cfg_link_power_state,
  cfg_err_cor_out,
  cfg_err_nonfatal_out,
  cfg_err_fatal_out,
  cfg_ltr_enable,
  cfg_ltssm_state,
  cfg_rcb_status,
  cfg_dpa_substate_change,
  cfg_obff_enable,
  cfg_pl_status_change,
  cfg_tph_requester_enable,
  cfg_tph_st_mode,
  cfg_vf_tph_requester_enable,
  cfg_vf_tph_st_mode,
  cfg_fc_ph,
  cfg_fc_pd,
  cfg_fc_nph,
  cfg_fc_npd,
  cfg_fc_cplh,
  cfg_fc_cpld,
  cfg_fc_sel,
  cfg_interrupt_int,
  cfg_interrupt_pending,
  cfg_interrupt_sent,
  cfg_interrupt_msi_enable,
  cfg_interrupt_msi_vf_enable,
  cfg_interrupt_msi_mmenable,
  cfg_interrupt_msi_mask_update,
  cfg_interrupt_msi_data,
  cfg_interrupt_msi_select,
  cfg_interrupt_msi_int,
  cfg_interrupt_msi_pending_status,
  cfg_interrupt_msi_sent,
  cfg_interrupt_msi_fail,
  cfg_interrupt_msi_attr,
  cfg_interrupt_msi_tph_present,
  cfg_interrupt_msi_tph_type,
  cfg_interrupt_msi_tph_st_tag,
  cfg_interrupt_msi_function_number,
  m_axis_xge_tx_tdata,
  m_axis_xge_tx_tkeep,
  m_axis_xge_tx_tuser,
  m_axis_xge_tx_tlast,
  m_axis_xge_tx_tvalid,
  m_axis_xge_tx_tready,
  s_axis_xge_rx_tdata,
  s_axis_xge_rx_tkeep,
  s_axis_xge_rx_tuser,
  s_axis_xge_rx_tlast,
  s_axis_xge_rx_tvalid,
  s_axis_xge_rx_tready,
  m_axi_lite_aclk,
  m_axi_lite_aresetn,
  m_axi_lite_arready,
  m_axi_lite_arvalid,
  m_axi_lite_araddr,
  m_axi_lite_arprot,
  m_axi_lite_rready,
  m_axi_lite_rvalid,
  m_axi_lite_rdata,
  m_axi_lite_rresp,
  m_axi_lite_awready,
  m_axi_lite_awvalid,
  m_axi_lite_awaddr,
  m_axi_lite_awprot,
  m_axi_lite_wready,
  m_axi_lite_wvalid,
  m_axi_lite_wdata,
  m_axi_lite_wstrb,
  m_axi_lite_bready,
  m_axi_lite_bvalid,
  m_axi_lite_bresp,
  s_axi_lite_awaddr,
  s_axi_lite_awvalid,
  s_axi_lite_wdata,
  s_axi_lite_wstrb,
  s_axi_lite_wvalid,
  s_axi_lite_bready,
  s_axi_lite_araddr,
  s_axi_lite_arvalid,
  s_axi_lite_rready,
  s_axi_lite_arready,
  s_axi_lite_rdata,
  s_axi_lite_rresp,
  s_axi_lite_rvalid,
  s_axi_lite_wready,
  s_axi_lite_bresp,
  s_axi_lite_bvalid,
  s_axi_lite_awready,
  md_error
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 user_clk CLK" *)
input wire user_clk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 user_reset RST" *)
input wire user_reset;
input wire user_lnk_up;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_rq TREADY" *)
input wire s_axis_rq_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_rq TVALID" *)
output wire s_axis_rq_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_rq TLAST" *)
output wire s_axis_rq_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_rq TDATA" *)
output wire [127 : 0] s_axis_rq_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_rq TKEEP" *)
output wire [3 : 0] s_axis_rq_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_rq TUSER" *)
output wire [59 : 0] s_axis_rq_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rc TREADY" *)
output wire [21 : 0] m_axis_rc_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rc TVALID" *)
input wire m_axis_rc_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rc TLAST" *)
input wire m_axis_rc_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rc TDATA" *)
input wire [127 : 0] m_axis_rc_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rc TUSER" *)
input wire [74 : 0] m_axis_rc_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_rc TKEEP" *)
input wire [3 : 0] m_axis_rc_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cq TREADY" *)
output wire [21 : 0] m_axis_cq_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cq TVALID" *)
input wire m_axis_cq_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cq TLAST" *)
input wire m_axis_cq_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cq TDATA" *)
input wire [127 : 0] m_axis_cq_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cq TKEEP" *)
input wire [3 : 0] m_axis_cq_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_cq TUSER" *)
input wire [84 : 0] m_axis_cq_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cc TREADY" *)
input wire s_axis_cc_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cc TVALID" *)
output wire s_axis_cc_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cc TLAST" *)
output wire s_axis_cc_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cc TDATA" *)
output wire [127 : 0] s_axis_cc_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cc TKEEP" *)
output wire [3 : 0] s_axis_cc_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_cc TUSER" *)
output wire [32 : 0] s_axis_cc_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg rq_seq_num" *)
input wire [3 : 0] pcie_rq_seq_num;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg rq_seq_num_vld" *)
input wire pcie_rq_seq_num_vld;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg rq_tag" *)
input wire [5 : 0] pcie_rq_tag;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg rq_tag_vld" *)
input wire pcie_rq_tag_vld;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg cq_np_req" *)
output wire pcie_cq_np_req;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg cq_np_req_count" *)
input wire [5 : 0] pcie_cq_np_req_count;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg phy_link_down" *)
input wire cfg_phy_link_down;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg phy_link_status" *)
input wire [1 : 0] cfg_phy_link_status;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg negotiated_width" *)
input wire [3 : 0] cfg_negotiated_width;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg current_speed" *)
input wire [2 : 0] cfg_current_speed;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg max_payload" *)
input wire [2 : 0] cfg_max_payload;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg max_read_req" *)
input wire [2 : 0] cfg_max_read_req;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg function_status" *)
input wire [7 : 0] cfg_function_status;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg function_power_state" *)
input wire [5 : 0] cfg_function_power_state;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg vf_status" *)
input wire [11 : 0] cfg_vf_status;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg vf_power_state" *)
input wire [17 : 0] cfg_vf_power_state;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg link_power_state" *)
input wire [1 : 0] cfg_link_power_state;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg err_cor_out" *)
input wire cfg_err_cor_out;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg err_nonfatal_out" *)
input wire cfg_err_nonfatal_out;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg err_fatal_out" *)
input wire cfg_err_fatal_out;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg ltr_enable" *)
input wire cfg_ltr_enable;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg ltssm_state" *)
input wire [5 : 0] cfg_ltssm_state;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg rcb_status" *)
input wire [1 : 0] cfg_rcb_status;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg dpa_substate_change" *)
input wire [1 : 0] cfg_dpa_substate_change;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg obff_enable" *)
input wire [1 : 0] cfg_obff_enable;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg pl_status_change" *)
input wire cfg_pl_status_change;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg tph_requester_enable" *)
input wire [1 : 0] cfg_tph_requester_enable;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg tph_st_mode" *)
input wire [5 : 0] cfg_tph_st_mode;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg vf_tph_requester_enable" *)
input wire [5 : 0] cfg_vf_tph_requester_enable;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_status:1.0 cfg vf_tph_st_mode" *)
input wire [17 : 0] cfg_vf_tph_st_mode;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_cfg_fc:1.0 cfg_fc PH" *)
input wire [7 : 0] cfg_fc_ph;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_cfg_fc:1.0 cfg_fc PD" *)
input wire [11 : 0] cfg_fc_pd;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_cfg_fc:1.0 cfg_fc NPH" *)
input wire [7 : 0] cfg_fc_nph;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_cfg_fc:1.0 cfg_fc NPD" *)
input wire [11 : 0] cfg_fc_npd;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_cfg_fc:1.0 cfg_fc CPLH" *)
input wire [7 : 0] cfg_fc_cplh;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_cfg_fc:1.0 cfg_fc CPLD" *)
input wire [11 : 0] cfg_fc_cpld;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie_cfg_fc:1.0 cfg_fc SEL" *)
output wire [2 : 0] cfg_fc_sel;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_interrupt:1.0 cfg_interrupt INTx_VECTOR" *)
output wire [3 : 0] cfg_interrupt_int;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_interrupt:1.0 cfg_interrupt PENDING" *)
output wire [1 : 0] cfg_interrupt_pending;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_interrupt:1.0 cfg_interrupt SENT" *)
input wire cfg_interrupt_sent;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 cfg_interrupt_msi enable" *)
input wire [1 : 0] cfg_interrupt_msi_enable;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 cfg_interrupt_msi vf_enable" *)
input wire [5 : 0] cfg_interrupt_msi_vf_enable;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 cfg_interrupt_msi mmenable" *)
input wire [5 : 0] cfg_interrupt_msi_mmenable;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 cfg_interrupt_msi mask_update" *)
input wire cfg_interrupt_msi_mask_update;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 cfg_interrupt_msi data" *)
input wire [31 : 0] cfg_interrupt_msi_data;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 cfg_interrupt_msi select" *)
output wire [3 : 0] cfg_interrupt_msi_select;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 cfg_interrupt_msi int_vector" *)
output wire [31 : 0] cfg_interrupt_msi_int;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 cfg_interrupt_msi pending_status" *)
output wire [63 : 0] cfg_interrupt_msi_pending_status;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 cfg_interrupt_msi sent" *)
input wire cfg_interrupt_msi_sent;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 cfg_interrupt_msi fail" *)
input wire cfg_interrupt_msi_fail;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 cfg_interrupt_msi attr" *)
output wire [2 : 0] cfg_interrupt_msi_attr;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 cfg_interrupt_msi tph_present" *)
output wire cfg_interrupt_msi_tph_present;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 cfg_interrupt_msi tph_type" *)
output wire [1 : 0] cfg_interrupt_msi_tph_type;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 cfg_interrupt_msi tph_st_tag" *)
output wire [8 : 0] cfg_interrupt_msi_tph_st_tag;
(* X_INTERFACE_INFO = "xilinx.com:interface:pcie3_cfg_msi:1.0 cfg_interrupt_msi function_number" *)
output wire [2 : 0] cfg_interrupt_msi_function_number;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_xge_tx TDATA" *)
output wire [127 : 0] m_axis_xge_tx_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_xge_tx TKEEP" *)
output wire [15 : 0] m_axis_xge_tx_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_xge_tx TUSER" *)
output wire [127 : 0] m_axis_xge_tx_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_xge_tx TLAST" *)
output wire m_axis_xge_tx_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_xge_tx TVALID" *)
output wire m_axis_xge_tx_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_xge_tx TREADY" *)
input wire m_axis_xge_tx_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_xge_rx TDATA" *)
input wire [127 : 0] s_axis_xge_rx_tdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_xge_rx TKEEP" *)
input wire [15 : 0] s_axis_xge_rx_tkeep;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_xge_rx TUSER" *)
input wire [127 : 0] s_axis_xge_rx_tuser;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_xge_rx TLAST" *)
input wire s_axis_xge_rx_tlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_xge_rx TVALID" *)
input wire s_axis_xge_rx_tvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s_axis_xge_rx TREADY" *)
output wire s_axis_xge_rx_tready;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 m_axi_lite_aclk CLK" *)
input wire m_axi_lite_aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 m_axi_lite_aresetn RST" *)
input wire m_axi_lite_aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite ARREADY" *)
input wire m_axi_lite_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite ARVALID" *)
output wire m_axi_lite_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite ARADDR" *)
output wire [31 : 0] m_axi_lite_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite ARPROT" *)
output wire [2 : 0] m_axi_lite_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite RREADY" *)
output wire m_axi_lite_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite RVALID" *)
input wire m_axi_lite_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite RDATA" *)
input wire [31 : 0] m_axi_lite_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite RRESP" *)
input wire [1 : 0] m_axi_lite_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite AWREADY" *)
input wire m_axi_lite_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite AWVALID" *)
output wire m_axi_lite_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite AWADDR" *)
output wire [31 : 0] m_axi_lite_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite AWPROT" *)
output wire [2 : 0] m_axi_lite_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite WREADY" *)
input wire m_axi_lite_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite WVALID" *)
output wire m_axi_lite_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite WDATA" *)
output wire [31 : 0] m_axi_lite_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite WSTRB" *)
output wire [3 : 0] m_axi_lite_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite BREADY" *)
output wire m_axi_lite_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite BVALID" *)
input wire m_axi_lite_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi_lite BRESP" *)
input wire [1 : 0] m_axi_lite_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWADDR" *)
input wire [11 : 0] s_axi_lite_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWVALID" *)
input wire s_axi_lite_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WDATA" *)
input wire [31 : 0] s_axi_lite_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WSTRB" *)
input wire [3 : 0] s_axi_lite_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WVALID" *)
input wire s_axi_lite_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BREADY" *)
input wire s_axi_lite_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARADDR" *)
input wire [11 : 0] s_axi_lite_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARVALID" *)
input wire s_axi_lite_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RREADY" *)
input wire s_axi_lite_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite ARREADY" *)
output wire s_axi_lite_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RDATA" *)
output wire [31 : 0] s_axi_lite_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RRESP" *)
output wire [1 : 0] s_axi_lite_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite RVALID" *)
output wire s_axi_lite_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite WREADY" *)
output wire s_axi_lite_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BRESP" *)
output wire [1 : 0] s_axi_lite_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite BVALID" *)
output wire s_axi_lite_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi_lite AWREADY" *)
output wire s_axi_lite_awready;
output wire md_error;

  nf_riffa_dma #(
    .C_NUM_CHNL(2),
    .C_PCI_DATA_WIDTH(128),
    .C_MAX_PAYLOAD_BYTES(128),
    .C_LOG_NUM_TAGS(6),
    .C_AXIS_TDATA_WIDTH(128),
    .C_AXIS_TKEEP_WIDTH(16),
    .C_AXIS_TUSER_WIDTH(128),
    .C_PREAM_VALUE(51966),
    .C_M_AXI_LITE_ADDR_WIDTH(32),
    .C_M_AXI_LITE_DATA_WIDTH(32),
    .C_M_AXI_LITE_STRB_WIDTH(4),
    .C_S_AXI_DATA_WIDTH(32),
    .C_S_AXI_ADDR_WIDTH(12),
    .C_BASEADDR(32'H00000000)
  ) inst (
    .user_clk(user_clk),
    .user_reset(user_reset),
    .user_lnk_up(user_lnk_up),
    .s_axis_rq_tready(s_axis_rq_tready),
    .s_axis_rq_tvalid(s_axis_rq_tvalid),
    .s_axis_rq_tlast(s_axis_rq_tlast),
    .s_axis_rq_tdata(s_axis_rq_tdata),
    .s_axis_rq_tkeep(s_axis_rq_tkeep),
    .s_axis_rq_tuser(s_axis_rq_tuser),
    .m_axis_rc_tready(m_axis_rc_tready),
    .m_axis_rc_tvalid(m_axis_rc_tvalid),
    .m_axis_rc_tlast(m_axis_rc_tlast),
    .m_axis_rc_tdata(m_axis_rc_tdata),
    .m_axis_rc_tuser(m_axis_rc_tuser),
    .m_axis_rc_tkeep(m_axis_rc_tkeep),
    .m_axis_cq_tready(m_axis_cq_tready),
    .m_axis_cq_tvalid(m_axis_cq_tvalid),
    .m_axis_cq_tlast(m_axis_cq_tlast),
    .m_axis_cq_tdata(m_axis_cq_tdata),
    .m_axis_cq_tkeep(m_axis_cq_tkeep),
    .m_axis_cq_tuser(m_axis_cq_tuser),
    .s_axis_cc_tready(s_axis_cc_tready),
    .s_axis_cc_tvalid(s_axis_cc_tvalid),
    .s_axis_cc_tlast(s_axis_cc_tlast),
    .s_axis_cc_tdata(s_axis_cc_tdata),
    .s_axis_cc_tkeep(s_axis_cc_tkeep),
    .s_axis_cc_tuser(s_axis_cc_tuser),
    .pcie_rq_seq_num(pcie_rq_seq_num),
    .pcie_rq_seq_num_vld(pcie_rq_seq_num_vld),
    .pcie_rq_tag(pcie_rq_tag),
    .pcie_rq_tag_vld(pcie_rq_tag_vld),
    .pcie_cq_np_req(pcie_cq_np_req),
    .pcie_cq_np_req_count(pcie_cq_np_req_count),
    .cfg_phy_link_down(cfg_phy_link_down),
    .cfg_phy_link_status(cfg_phy_link_status),
    .cfg_negotiated_width(cfg_negotiated_width),
    .cfg_current_speed(cfg_current_speed),
    .cfg_max_payload(cfg_max_payload),
    .cfg_max_read_req(cfg_max_read_req),
    .cfg_function_status(cfg_function_status),
    .cfg_function_power_state(cfg_function_power_state),
    .cfg_vf_status(cfg_vf_status),
    .cfg_vf_power_state(cfg_vf_power_state),
    .cfg_link_power_state(cfg_link_power_state),
    .cfg_err_cor_out(cfg_err_cor_out),
    .cfg_err_nonfatal_out(cfg_err_nonfatal_out),
    .cfg_err_fatal_out(cfg_err_fatal_out),
    .cfg_ltr_enable(cfg_ltr_enable),
    .cfg_ltssm_state(cfg_ltssm_state),
    .cfg_rcb_status(cfg_rcb_status),
    .cfg_dpa_substate_change(cfg_dpa_substate_change),
    .cfg_obff_enable(cfg_obff_enable),
    .cfg_pl_status_change(cfg_pl_status_change),
    .cfg_tph_requester_enable(cfg_tph_requester_enable),
    .cfg_tph_st_mode(cfg_tph_st_mode),
    .cfg_vf_tph_requester_enable(cfg_vf_tph_requester_enable),
    .cfg_vf_tph_st_mode(cfg_vf_tph_st_mode),
    .cfg_fc_ph(cfg_fc_ph),
    .cfg_fc_pd(cfg_fc_pd),
    .cfg_fc_nph(cfg_fc_nph),
    .cfg_fc_npd(cfg_fc_npd),
    .cfg_fc_cplh(cfg_fc_cplh),
    .cfg_fc_cpld(cfg_fc_cpld),
    .cfg_fc_sel(cfg_fc_sel),
    .cfg_interrupt_int(cfg_interrupt_int),
    .cfg_interrupt_pending(cfg_interrupt_pending),
    .cfg_interrupt_sent(cfg_interrupt_sent),
    .cfg_interrupt_msi_enable(cfg_interrupt_msi_enable),
    .cfg_interrupt_msi_vf_enable(cfg_interrupt_msi_vf_enable),
    .cfg_interrupt_msi_mmenable(cfg_interrupt_msi_mmenable),
    .cfg_interrupt_msi_mask_update(cfg_interrupt_msi_mask_update),
    .cfg_interrupt_msi_data(cfg_interrupt_msi_data),
    .cfg_interrupt_msi_select(cfg_interrupt_msi_select),
    .cfg_interrupt_msi_int(cfg_interrupt_msi_int),
    .cfg_interrupt_msi_pending_status(cfg_interrupt_msi_pending_status),
    .cfg_interrupt_msi_sent(cfg_interrupt_msi_sent),
    .cfg_interrupt_msi_fail(cfg_interrupt_msi_fail),
    .cfg_interrupt_msi_attr(cfg_interrupt_msi_attr),
    .cfg_interrupt_msi_tph_present(cfg_interrupt_msi_tph_present),
    .cfg_interrupt_msi_tph_type(cfg_interrupt_msi_tph_type),
    .cfg_interrupt_msi_tph_st_tag(cfg_interrupt_msi_tph_st_tag),
    .cfg_interrupt_msi_function_number(cfg_interrupt_msi_function_number),
    .m_axis_xge_tx_tdata(m_axis_xge_tx_tdata),
    .m_axis_xge_tx_tkeep(m_axis_xge_tx_tkeep),
    .m_axis_xge_tx_tuser(m_axis_xge_tx_tuser),
    .m_axis_xge_tx_tlast(m_axis_xge_tx_tlast),
    .m_axis_xge_tx_tvalid(m_axis_xge_tx_tvalid),
    .m_axis_xge_tx_tready(m_axis_xge_tx_tready),
    .s_axis_xge_rx_tdata(s_axis_xge_rx_tdata),
    .s_axis_xge_rx_tkeep(s_axis_xge_rx_tkeep),
    .s_axis_xge_rx_tuser(s_axis_xge_rx_tuser),
    .s_axis_xge_rx_tlast(s_axis_xge_rx_tlast),
    .s_axis_xge_rx_tvalid(s_axis_xge_rx_tvalid),
    .s_axis_xge_rx_tready(s_axis_xge_rx_tready),
    .m_axi_lite_aclk(m_axi_lite_aclk),
    .m_axi_lite_aresetn(m_axi_lite_aresetn),
    .m_axi_lite_arready(m_axi_lite_arready),
    .m_axi_lite_arvalid(m_axi_lite_arvalid),
    .m_axi_lite_araddr(m_axi_lite_araddr),
    .m_axi_lite_arprot(m_axi_lite_arprot),
    .m_axi_lite_rready(m_axi_lite_rready),
    .m_axi_lite_rvalid(m_axi_lite_rvalid),
    .m_axi_lite_rdata(m_axi_lite_rdata),
    .m_axi_lite_rresp(m_axi_lite_rresp),
    .m_axi_lite_awready(m_axi_lite_awready),
    .m_axi_lite_awvalid(m_axi_lite_awvalid),
    .m_axi_lite_awaddr(m_axi_lite_awaddr),
    .m_axi_lite_awprot(m_axi_lite_awprot),
    .m_axi_lite_wready(m_axi_lite_wready),
    .m_axi_lite_wvalid(m_axi_lite_wvalid),
    .m_axi_lite_wdata(m_axi_lite_wdata),
    .m_axi_lite_wstrb(m_axi_lite_wstrb),
    .m_axi_lite_bready(m_axi_lite_bready),
    .m_axi_lite_bvalid(m_axi_lite_bvalid),
    .m_axi_lite_bresp(m_axi_lite_bresp),
    .s_axi_lite_awaddr(s_axi_lite_awaddr),
    .s_axi_lite_awvalid(s_axi_lite_awvalid),
    .s_axi_lite_wdata(s_axi_lite_wdata),
    .s_axi_lite_wstrb(s_axi_lite_wstrb),
    .s_axi_lite_wvalid(s_axi_lite_wvalid),
    .s_axi_lite_bready(s_axi_lite_bready),
    .s_axi_lite_araddr(s_axi_lite_araddr),
    .s_axi_lite_arvalid(s_axi_lite_arvalid),
    .s_axi_lite_rready(s_axi_lite_rready),
    .s_axi_lite_arready(s_axi_lite_arready),
    .s_axi_lite_rdata(s_axi_lite_rdata),
    .s_axi_lite_rresp(s_axi_lite_rresp),
    .s_axi_lite_rvalid(s_axi_lite_rvalid),
    .s_axi_lite_wready(s_axi_lite_wready),
    .s_axi_lite_bresp(s_axi_lite_bresp),
    .s_axi_lite_bvalid(s_axi_lite_bvalid),
    .s_axi_lite_awready(s_axi_lite_awready),
    .md_error(md_error)
  );
endmodule
