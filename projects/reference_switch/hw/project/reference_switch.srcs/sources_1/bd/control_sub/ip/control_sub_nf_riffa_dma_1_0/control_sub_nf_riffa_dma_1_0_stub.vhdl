-- Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
-- Date        : Sat Jul 28 21:39:59 2018
-- Host        : sume running 64-bit Ubuntu 14.04.5 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_nf_riffa_dma_1_0/control_sub_nf_riffa_dma_1_0_stub.vhdl
-- Design      : control_sub_nf_riffa_dma_1_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7vx690tffg1761-3
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity control_sub_nf_riffa_dma_1_0 is
  Port ( 
    user_clk : in STD_LOGIC;
    user_reset : in STD_LOGIC;
    user_lnk_up : in STD_LOGIC;
    s_axis_rq_tready : in STD_LOGIC;
    s_axis_rq_tvalid : out STD_LOGIC;
    s_axis_rq_tlast : out STD_LOGIC;
    s_axis_rq_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_rq_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_rq_tuser : out STD_LOGIC_VECTOR ( 59 downto 0 );
    m_axis_rc_tready : out STD_LOGIC_VECTOR ( 21 downto 0 );
    m_axis_rc_tvalid : in STD_LOGIC;
    m_axis_rc_tlast : in STD_LOGIC;
    m_axis_rc_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_rc_tuser : in STD_LOGIC_VECTOR ( 74 downto 0 );
    m_axis_rc_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_cq_tready : out STD_LOGIC_VECTOR ( 21 downto 0 );
    m_axis_cq_tvalid : in STD_LOGIC;
    m_axis_cq_tlast : in STD_LOGIC;
    m_axis_cq_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_cq_tkeep : in STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axis_cq_tuser : in STD_LOGIC_VECTOR ( 84 downto 0 );
    s_axis_cc_tready : in STD_LOGIC;
    s_axis_cc_tvalid : out STD_LOGIC;
    s_axis_cc_tlast : out STD_LOGIC;
    s_axis_cc_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_cc_tkeep : out STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axis_cc_tuser : out STD_LOGIC_VECTOR ( 32 downto 0 );
    pcie_rq_seq_num : in STD_LOGIC_VECTOR ( 3 downto 0 );
    pcie_rq_seq_num_vld : in STD_LOGIC;
    pcie_rq_tag : in STD_LOGIC_VECTOR ( 5 downto 0 );
    pcie_rq_tag_vld : in STD_LOGIC;
    pcie_cq_np_req : out STD_LOGIC;
    pcie_cq_np_req_count : in STD_LOGIC_VECTOR ( 5 downto 0 );
    cfg_phy_link_down : in STD_LOGIC;
    cfg_phy_link_status : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_negotiated_width : in STD_LOGIC_VECTOR ( 3 downto 0 );
    cfg_current_speed : in STD_LOGIC_VECTOR ( 2 downto 0 );
    cfg_max_payload : in STD_LOGIC_VECTOR ( 2 downto 0 );
    cfg_max_read_req : in STD_LOGIC_VECTOR ( 2 downto 0 );
    cfg_function_status : in STD_LOGIC_VECTOR ( 7 downto 0 );
    cfg_function_power_state : in STD_LOGIC_VECTOR ( 5 downto 0 );
    cfg_vf_status : in STD_LOGIC_VECTOR ( 11 downto 0 );
    cfg_vf_power_state : in STD_LOGIC_VECTOR ( 17 downto 0 );
    cfg_link_power_state : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_err_cor_out : in STD_LOGIC;
    cfg_err_nonfatal_out : in STD_LOGIC;
    cfg_err_fatal_out : in STD_LOGIC;
    cfg_ltr_enable : in STD_LOGIC;
    cfg_ltssm_state : in STD_LOGIC_VECTOR ( 5 downto 0 );
    cfg_rcb_status : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_dpa_substate_change : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_obff_enable : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_pl_status_change : in STD_LOGIC;
    cfg_tph_requester_enable : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_tph_st_mode : in STD_LOGIC_VECTOR ( 5 downto 0 );
    cfg_vf_tph_requester_enable : in STD_LOGIC_VECTOR ( 5 downto 0 );
    cfg_vf_tph_st_mode : in STD_LOGIC_VECTOR ( 17 downto 0 );
    cfg_fc_ph : in STD_LOGIC_VECTOR ( 7 downto 0 );
    cfg_fc_pd : in STD_LOGIC_VECTOR ( 11 downto 0 );
    cfg_fc_nph : in STD_LOGIC_VECTOR ( 7 downto 0 );
    cfg_fc_npd : in STD_LOGIC_VECTOR ( 11 downto 0 );
    cfg_fc_cplh : in STD_LOGIC_VECTOR ( 7 downto 0 );
    cfg_fc_cpld : in STD_LOGIC_VECTOR ( 11 downto 0 );
    cfg_fc_sel : out STD_LOGIC_VECTOR ( 2 downto 0 );
    cfg_interrupt_int : out STD_LOGIC_VECTOR ( 3 downto 0 );
    cfg_interrupt_pending : out STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_interrupt_sent : in STD_LOGIC;
    cfg_interrupt_msi_enable : in STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_interrupt_msi_vf_enable : in STD_LOGIC_VECTOR ( 5 downto 0 );
    cfg_interrupt_msi_mmenable : in STD_LOGIC_VECTOR ( 5 downto 0 );
    cfg_interrupt_msi_mask_update : in STD_LOGIC;
    cfg_interrupt_msi_data : in STD_LOGIC_VECTOR ( 31 downto 0 );
    cfg_interrupt_msi_select : out STD_LOGIC_VECTOR ( 3 downto 0 );
    cfg_interrupt_msi_int : out STD_LOGIC_VECTOR ( 31 downto 0 );
    cfg_interrupt_msi_pending_status : out STD_LOGIC_VECTOR ( 63 downto 0 );
    cfg_interrupt_msi_sent : in STD_LOGIC;
    cfg_interrupt_msi_fail : in STD_LOGIC;
    cfg_interrupt_msi_attr : out STD_LOGIC_VECTOR ( 2 downto 0 );
    cfg_interrupt_msi_tph_present : out STD_LOGIC;
    cfg_interrupt_msi_tph_type : out STD_LOGIC_VECTOR ( 1 downto 0 );
    cfg_interrupt_msi_tph_st_tag : out STD_LOGIC_VECTOR ( 8 downto 0 );
    cfg_interrupt_msi_function_number : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axis_xge_tx_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_xge_tx_tkeep : out STD_LOGIC_VECTOR ( 15 downto 0 );
    m_axis_xge_tx_tuser : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m_axis_xge_tx_tlast : out STD_LOGIC;
    m_axis_xge_tx_tvalid : out STD_LOGIC;
    m_axis_xge_tx_tready : in STD_LOGIC;
    s_axis_xge_rx_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_xge_rx_tkeep : in STD_LOGIC_VECTOR ( 15 downto 0 );
    s_axis_xge_rx_tuser : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s_axis_xge_rx_tlast : in STD_LOGIC;
    s_axis_xge_rx_tvalid : in STD_LOGIC;
    s_axis_xge_rx_tready : out STD_LOGIC;
    m_axi_lite_aclk : in STD_LOGIC;
    m_axi_lite_aresetn : in STD_LOGIC;
    m_axi_lite_arready : in STD_LOGIC;
    m_axi_lite_arvalid : out STD_LOGIC;
    m_axi_lite_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_lite_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_lite_rready : out STD_LOGIC;
    m_axi_lite_rvalid : in STD_LOGIC;
    m_axi_lite_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_lite_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_lite_awready : in STD_LOGIC;
    m_axi_lite_awvalid : out STD_LOGIC;
    m_axi_lite_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_lite_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_lite_wready : in STD_LOGIC;
    m_axi_lite_wvalid : out STD_LOGIC;
    m_axi_lite_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_lite_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_lite_bready : out STD_LOGIC;
    m_axi_lite_bvalid : in STD_LOGIC;
    m_axi_lite_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_awaddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_lite_awvalid : in STD_LOGIC;
    s_axi_lite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_lite_wvalid : in STD_LOGIC;
    s_axi_lite_bready : in STD_LOGIC;
    s_axi_lite_araddr : in STD_LOGIC_VECTOR ( 11 downto 0 );
    s_axi_lite_arvalid : in STD_LOGIC;
    s_axi_lite_rready : in STD_LOGIC;
    s_axi_lite_arready : out STD_LOGIC;
    s_axi_lite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_lite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_rvalid : out STD_LOGIC;
    s_axi_lite_wready : out STD_LOGIC;
    s_axi_lite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_lite_bvalid : out STD_LOGIC;
    s_axi_lite_awready : out STD_LOGIC;
    md_error : out STD_LOGIC
  );

end control_sub_nf_riffa_dma_1_0;

architecture stub of control_sub_nf_riffa_dma_1_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "user_clk,user_reset,user_lnk_up,s_axis_rq_tready,s_axis_rq_tvalid,s_axis_rq_tlast,s_axis_rq_tdata[127:0],s_axis_rq_tkeep[3:0],s_axis_rq_tuser[59:0],m_axis_rc_tready[21:0],m_axis_rc_tvalid,m_axis_rc_tlast,m_axis_rc_tdata[127:0],m_axis_rc_tuser[74:0],m_axis_rc_tkeep[3:0],m_axis_cq_tready[21:0],m_axis_cq_tvalid,m_axis_cq_tlast,m_axis_cq_tdata[127:0],m_axis_cq_tkeep[3:0],m_axis_cq_tuser[84:0],s_axis_cc_tready,s_axis_cc_tvalid,s_axis_cc_tlast,s_axis_cc_tdata[127:0],s_axis_cc_tkeep[3:0],s_axis_cc_tuser[32:0],pcie_rq_seq_num[3:0],pcie_rq_seq_num_vld,pcie_rq_tag[5:0],pcie_rq_tag_vld,pcie_cq_np_req,pcie_cq_np_req_count[5:0],cfg_phy_link_down,cfg_phy_link_status[1:0],cfg_negotiated_width[3:0],cfg_current_speed[2:0],cfg_max_payload[2:0],cfg_max_read_req[2:0],cfg_function_status[7:0],cfg_function_power_state[5:0],cfg_vf_status[11:0],cfg_vf_power_state[17:0],cfg_link_power_state[1:0],cfg_err_cor_out,cfg_err_nonfatal_out,cfg_err_fatal_out,cfg_ltr_enable,cfg_ltssm_state[5:0],cfg_rcb_status[1:0],cfg_dpa_substate_change[1:0],cfg_obff_enable[1:0],cfg_pl_status_change,cfg_tph_requester_enable[1:0],cfg_tph_st_mode[5:0],cfg_vf_tph_requester_enable[5:0],cfg_vf_tph_st_mode[17:0],cfg_fc_ph[7:0],cfg_fc_pd[11:0],cfg_fc_nph[7:0],cfg_fc_npd[11:0],cfg_fc_cplh[7:0],cfg_fc_cpld[11:0],cfg_fc_sel[2:0],cfg_interrupt_int[3:0],cfg_interrupt_pending[1:0],cfg_interrupt_sent,cfg_interrupt_msi_enable[1:0],cfg_interrupt_msi_vf_enable[5:0],cfg_interrupt_msi_mmenable[5:0],cfg_interrupt_msi_mask_update,cfg_interrupt_msi_data[31:0],cfg_interrupt_msi_select[3:0],cfg_interrupt_msi_int[31:0],cfg_interrupt_msi_pending_status[63:0],cfg_interrupt_msi_sent,cfg_interrupt_msi_fail,cfg_interrupt_msi_attr[2:0],cfg_interrupt_msi_tph_present,cfg_interrupt_msi_tph_type[1:0],cfg_interrupt_msi_tph_st_tag[8:0],cfg_interrupt_msi_function_number[2:0],m_axis_xge_tx_tdata[127:0],m_axis_xge_tx_tkeep[15:0],m_axis_xge_tx_tuser[127:0],m_axis_xge_tx_tlast,m_axis_xge_tx_tvalid,m_axis_xge_tx_tready,s_axis_xge_rx_tdata[127:0],s_axis_xge_rx_tkeep[15:0],s_axis_xge_rx_tuser[127:0],s_axis_xge_rx_tlast,s_axis_xge_rx_tvalid,s_axis_xge_rx_tready,m_axi_lite_aclk,m_axi_lite_aresetn,m_axi_lite_arready,m_axi_lite_arvalid,m_axi_lite_araddr[31:0],m_axi_lite_arprot[2:0],m_axi_lite_rready,m_axi_lite_rvalid,m_axi_lite_rdata[31:0],m_axi_lite_rresp[1:0],m_axi_lite_awready,m_axi_lite_awvalid,m_axi_lite_awaddr[31:0],m_axi_lite_awprot[2:0],m_axi_lite_wready,m_axi_lite_wvalid,m_axi_lite_wdata[31:0],m_axi_lite_wstrb[3:0],m_axi_lite_bready,m_axi_lite_bvalid,m_axi_lite_bresp[1:0],s_axi_lite_awaddr[11:0],s_axi_lite_awvalid,s_axi_lite_wdata[31:0],s_axi_lite_wstrb[3:0],s_axi_lite_wvalid,s_axi_lite_bready,s_axi_lite_araddr[11:0],s_axi_lite_arvalid,s_axi_lite_rready,s_axi_lite_arready,s_axi_lite_rdata[31:0],s_axi_lite_rresp[1:0],s_axi_lite_rvalid,s_axi_lite_wready,s_axi_lite_bresp[1:0],s_axi_lite_bvalid,s_axi_lite_awready,md_error";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "nf_riffa_dma,Vivado 2016.4";
begin
end;
