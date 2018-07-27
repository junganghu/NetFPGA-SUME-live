// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Fri Jul 27 13:12:39 2018
// Host        : sume running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ control_sub_nf_riffa_dma_1_0_stub.v
// Design      : control_sub_nf_riffa_dma_1_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7vx690tffg1761-3
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "nf_riffa_dma,Vivado 2016.4" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(user_clk, user_reset, user_lnk_up, 
  s_axis_rq_tready, s_axis_rq_tvalid, s_axis_rq_tlast, s_axis_rq_tdata, s_axis_rq_tkeep, 
  s_axis_rq_tuser, m_axis_rc_tready, m_axis_rc_tvalid, m_axis_rc_tlast, m_axis_rc_tdata, 
  m_axis_rc_tuser, m_axis_rc_tkeep, m_axis_cq_tready, m_axis_cq_tvalid, m_axis_cq_tlast, 
  m_axis_cq_tdata, m_axis_cq_tkeep, m_axis_cq_tuser, s_axis_cc_tready, s_axis_cc_tvalid, 
  s_axis_cc_tlast, s_axis_cc_tdata, s_axis_cc_tkeep, s_axis_cc_tuser, pcie_rq_seq_num, 
  pcie_rq_seq_num_vld, pcie_rq_tag, pcie_rq_tag_vld, pcie_cq_np_req, pcie_cq_np_req_count, 
  cfg_phy_link_down, cfg_phy_link_status, cfg_negotiated_width, cfg_current_speed, 
  cfg_max_payload, cfg_max_read_req, cfg_function_status, cfg_function_power_state, 
  cfg_vf_status, cfg_vf_power_state, cfg_link_power_state, cfg_err_cor_out, 
  cfg_err_nonfatal_out, cfg_err_fatal_out, cfg_ltr_enable, cfg_ltssm_state, cfg_rcb_status, 
  cfg_dpa_substate_change, cfg_obff_enable, cfg_pl_status_change, 
  cfg_tph_requester_enable, cfg_tph_st_mode, cfg_vf_tph_requester_enable, 
  cfg_vf_tph_st_mode, cfg_fc_ph, cfg_fc_pd, cfg_fc_nph, cfg_fc_npd, cfg_fc_cplh, cfg_fc_cpld, 
  cfg_fc_sel, cfg_interrupt_int, cfg_interrupt_pending, cfg_interrupt_sent, 
  cfg_interrupt_msi_enable, cfg_interrupt_msi_vf_enable, cfg_interrupt_msi_mmenable, 
  cfg_interrupt_msi_mask_update, cfg_interrupt_msi_data, cfg_interrupt_msi_select, 
  cfg_interrupt_msi_int, cfg_interrupt_msi_pending_status, cfg_interrupt_msi_sent, 
  cfg_interrupt_msi_fail, cfg_interrupt_msi_attr, cfg_interrupt_msi_tph_present, 
  cfg_interrupt_msi_tph_type, cfg_interrupt_msi_tph_st_tag, 
  cfg_interrupt_msi_function_number, m_axis_xge_tx_tdata, m_axis_xge_tx_tkeep, 
  m_axis_xge_tx_tuser, m_axis_xge_tx_tlast, m_axis_xge_tx_tvalid, m_axis_xge_tx_tready, 
  s_axis_xge_rx_tdata, s_axis_xge_rx_tkeep, s_axis_xge_rx_tuser, s_axis_xge_rx_tlast, 
  s_axis_xge_rx_tvalid, s_axis_xge_rx_tready, m_axi_lite_aclk, m_axi_lite_aresetn, 
  m_axi_lite_arready, m_axi_lite_arvalid, m_axi_lite_araddr, m_axi_lite_arprot, 
  m_axi_lite_rready, m_axi_lite_rvalid, m_axi_lite_rdata, m_axi_lite_rresp, 
  m_axi_lite_awready, m_axi_lite_awvalid, m_axi_lite_awaddr, m_axi_lite_awprot, 
  m_axi_lite_wready, m_axi_lite_wvalid, m_axi_lite_wdata, m_axi_lite_wstrb, 
  m_axi_lite_bready, m_axi_lite_bvalid, m_axi_lite_bresp, s_axi_lite_awaddr, 
  s_axi_lite_awvalid, s_axi_lite_wdata, s_axi_lite_wstrb, s_axi_lite_wvalid, 
  s_axi_lite_bready, s_axi_lite_araddr, s_axi_lite_arvalid, s_axi_lite_rready, 
  s_axi_lite_arready, s_axi_lite_rdata, s_axi_lite_rresp, s_axi_lite_rvalid, 
  s_axi_lite_wready, s_axi_lite_bresp, s_axi_lite_bvalid, s_axi_lite_awready, md_error)
/* synthesis syn_black_box black_box_pad_pin="user_clk,user_reset,user_lnk_up,s_axis_rq_tready,s_axis_rq_tvalid,s_axis_rq_tlast,s_axis_rq_tdata[127:0],s_axis_rq_tkeep[3:0],s_axis_rq_tuser[59:0],m_axis_rc_tready[21:0],m_axis_rc_tvalid,m_axis_rc_tlast,m_axis_rc_tdata[127:0],m_axis_rc_tuser[74:0],m_axis_rc_tkeep[3:0],m_axis_cq_tready[21:0],m_axis_cq_tvalid,m_axis_cq_tlast,m_axis_cq_tdata[127:0],m_axis_cq_tkeep[3:0],m_axis_cq_tuser[84:0],s_axis_cc_tready,s_axis_cc_tvalid,s_axis_cc_tlast,s_axis_cc_tdata[127:0],s_axis_cc_tkeep[3:0],s_axis_cc_tuser[32:0],pcie_rq_seq_num[3:0],pcie_rq_seq_num_vld,pcie_rq_tag[5:0],pcie_rq_tag_vld,pcie_cq_np_req,pcie_cq_np_req_count[5:0],cfg_phy_link_down,cfg_phy_link_status[1:0],cfg_negotiated_width[3:0],cfg_current_speed[2:0],cfg_max_payload[2:0],cfg_max_read_req[2:0],cfg_function_status[7:0],cfg_function_power_state[5:0],cfg_vf_status[11:0],cfg_vf_power_state[17:0],cfg_link_power_state[1:0],cfg_err_cor_out,cfg_err_nonfatal_out,cfg_err_fatal_out,cfg_ltr_enable,cfg_ltssm_state[5:0],cfg_rcb_status[1:0],cfg_dpa_substate_change[1:0],cfg_obff_enable[1:0],cfg_pl_status_change,cfg_tph_requester_enable[1:0],cfg_tph_st_mode[5:0],cfg_vf_tph_requester_enable[5:0],cfg_vf_tph_st_mode[17:0],cfg_fc_ph[7:0],cfg_fc_pd[11:0],cfg_fc_nph[7:0],cfg_fc_npd[11:0],cfg_fc_cplh[7:0],cfg_fc_cpld[11:0],cfg_fc_sel[2:0],cfg_interrupt_int[3:0],cfg_interrupt_pending[1:0],cfg_interrupt_sent,cfg_interrupt_msi_enable[1:0],cfg_interrupt_msi_vf_enable[5:0],cfg_interrupt_msi_mmenable[5:0],cfg_interrupt_msi_mask_update,cfg_interrupt_msi_data[31:0],cfg_interrupt_msi_select[3:0],cfg_interrupt_msi_int[31:0],cfg_interrupt_msi_pending_status[63:0],cfg_interrupt_msi_sent,cfg_interrupt_msi_fail,cfg_interrupt_msi_attr[2:0],cfg_interrupt_msi_tph_present,cfg_interrupt_msi_tph_type[1:0],cfg_interrupt_msi_tph_st_tag[8:0],cfg_interrupt_msi_function_number[2:0],m_axis_xge_tx_tdata[127:0],m_axis_xge_tx_tkeep[15:0],m_axis_xge_tx_tuser[127:0],m_axis_xge_tx_tlast,m_axis_xge_tx_tvalid,m_axis_xge_tx_tready,s_axis_xge_rx_tdata[127:0],s_axis_xge_rx_tkeep[15:0],s_axis_xge_rx_tuser[127:0],s_axis_xge_rx_tlast,s_axis_xge_rx_tvalid,s_axis_xge_rx_tready,m_axi_lite_aclk,m_axi_lite_aresetn,m_axi_lite_arready,m_axi_lite_arvalid,m_axi_lite_araddr[31:0],m_axi_lite_arprot[2:0],m_axi_lite_rready,m_axi_lite_rvalid,m_axi_lite_rdata[31:0],m_axi_lite_rresp[1:0],m_axi_lite_awready,m_axi_lite_awvalid,m_axi_lite_awaddr[31:0],m_axi_lite_awprot[2:0],m_axi_lite_wready,m_axi_lite_wvalid,m_axi_lite_wdata[31:0],m_axi_lite_wstrb[3:0],m_axi_lite_bready,m_axi_lite_bvalid,m_axi_lite_bresp[1:0],s_axi_lite_awaddr[11:0],s_axi_lite_awvalid,s_axi_lite_wdata[31:0],s_axi_lite_wstrb[3:0],s_axi_lite_wvalid,s_axi_lite_bready,s_axi_lite_araddr[11:0],s_axi_lite_arvalid,s_axi_lite_rready,s_axi_lite_arready,s_axi_lite_rdata[31:0],s_axi_lite_rresp[1:0],s_axi_lite_rvalid,s_axi_lite_wready,s_axi_lite_bresp[1:0],s_axi_lite_bvalid,s_axi_lite_awready,md_error" */;
  input user_clk;
  input user_reset;
  input user_lnk_up;
  input s_axis_rq_tready;
  output s_axis_rq_tvalid;
  output s_axis_rq_tlast;
  output [127:0]s_axis_rq_tdata;
  output [3:0]s_axis_rq_tkeep;
  output [59:0]s_axis_rq_tuser;
  output [21:0]m_axis_rc_tready;
  input m_axis_rc_tvalid;
  input m_axis_rc_tlast;
  input [127:0]m_axis_rc_tdata;
  input [74:0]m_axis_rc_tuser;
  input [3:0]m_axis_rc_tkeep;
  output [21:0]m_axis_cq_tready;
  input m_axis_cq_tvalid;
  input m_axis_cq_tlast;
  input [127:0]m_axis_cq_tdata;
  input [3:0]m_axis_cq_tkeep;
  input [84:0]m_axis_cq_tuser;
  input s_axis_cc_tready;
  output s_axis_cc_tvalid;
  output s_axis_cc_tlast;
  output [127:0]s_axis_cc_tdata;
  output [3:0]s_axis_cc_tkeep;
  output [32:0]s_axis_cc_tuser;
  input [3:0]pcie_rq_seq_num;
  input pcie_rq_seq_num_vld;
  input [5:0]pcie_rq_tag;
  input pcie_rq_tag_vld;
  output pcie_cq_np_req;
  input [5:0]pcie_cq_np_req_count;
  input cfg_phy_link_down;
  input [1:0]cfg_phy_link_status;
  input [3:0]cfg_negotiated_width;
  input [2:0]cfg_current_speed;
  input [2:0]cfg_max_payload;
  input [2:0]cfg_max_read_req;
  input [7:0]cfg_function_status;
  input [5:0]cfg_function_power_state;
  input [11:0]cfg_vf_status;
  input [17:0]cfg_vf_power_state;
  input [1:0]cfg_link_power_state;
  input cfg_err_cor_out;
  input cfg_err_nonfatal_out;
  input cfg_err_fatal_out;
  input cfg_ltr_enable;
  input [5:0]cfg_ltssm_state;
  input [1:0]cfg_rcb_status;
  input [1:0]cfg_dpa_substate_change;
  input [1:0]cfg_obff_enable;
  input cfg_pl_status_change;
  input [1:0]cfg_tph_requester_enable;
  input [5:0]cfg_tph_st_mode;
  input [5:0]cfg_vf_tph_requester_enable;
  input [17:0]cfg_vf_tph_st_mode;
  input [7:0]cfg_fc_ph;
  input [11:0]cfg_fc_pd;
  input [7:0]cfg_fc_nph;
  input [11:0]cfg_fc_npd;
  input [7:0]cfg_fc_cplh;
  input [11:0]cfg_fc_cpld;
  output [2:0]cfg_fc_sel;
  output [3:0]cfg_interrupt_int;
  output [1:0]cfg_interrupt_pending;
  input cfg_interrupt_sent;
  input [1:0]cfg_interrupt_msi_enable;
  input [5:0]cfg_interrupt_msi_vf_enable;
  input [5:0]cfg_interrupt_msi_mmenable;
  input cfg_interrupt_msi_mask_update;
  input [31:0]cfg_interrupt_msi_data;
  output [3:0]cfg_interrupt_msi_select;
  output [31:0]cfg_interrupt_msi_int;
  output [63:0]cfg_interrupt_msi_pending_status;
  input cfg_interrupt_msi_sent;
  input cfg_interrupt_msi_fail;
  output [2:0]cfg_interrupt_msi_attr;
  output cfg_interrupt_msi_tph_present;
  output [1:0]cfg_interrupt_msi_tph_type;
  output [8:0]cfg_interrupt_msi_tph_st_tag;
  output [2:0]cfg_interrupt_msi_function_number;
  output [127:0]m_axis_xge_tx_tdata;
  output [15:0]m_axis_xge_tx_tkeep;
  output [127:0]m_axis_xge_tx_tuser;
  output m_axis_xge_tx_tlast;
  output m_axis_xge_tx_tvalid;
  input m_axis_xge_tx_tready;
  input [127:0]s_axis_xge_rx_tdata;
  input [15:0]s_axis_xge_rx_tkeep;
  input [127:0]s_axis_xge_rx_tuser;
  input s_axis_xge_rx_tlast;
  input s_axis_xge_rx_tvalid;
  output s_axis_xge_rx_tready;
  input m_axi_lite_aclk;
  input m_axi_lite_aresetn;
  input m_axi_lite_arready;
  output m_axi_lite_arvalid;
  output [31:0]m_axi_lite_araddr;
  output [2:0]m_axi_lite_arprot;
  output m_axi_lite_rready;
  input m_axi_lite_rvalid;
  input [31:0]m_axi_lite_rdata;
  input [1:0]m_axi_lite_rresp;
  input m_axi_lite_awready;
  output m_axi_lite_awvalid;
  output [31:0]m_axi_lite_awaddr;
  output [2:0]m_axi_lite_awprot;
  input m_axi_lite_wready;
  output m_axi_lite_wvalid;
  output [31:0]m_axi_lite_wdata;
  output [3:0]m_axi_lite_wstrb;
  output m_axi_lite_bready;
  input m_axi_lite_bvalid;
  input [1:0]m_axi_lite_bresp;
  input [11:0]s_axi_lite_awaddr;
  input s_axi_lite_awvalid;
  input [31:0]s_axi_lite_wdata;
  input [3:0]s_axi_lite_wstrb;
  input s_axi_lite_wvalid;
  input s_axi_lite_bready;
  input [11:0]s_axi_lite_araddr;
  input s_axi_lite_arvalid;
  input s_axi_lite_rready;
  output s_axi_lite_arready;
  output [31:0]s_axi_lite_rdata;
  output [1:0]s_axi_lite_rresp;
  output s_axi_lite_rvalid;
  output s_axi_lite_wready;
  output [1:0]s_axi_lite_bresp;
  output s_axi_lite_bvalid;
  output s_axi_lite_awready;
  output md_error;
endmodule
