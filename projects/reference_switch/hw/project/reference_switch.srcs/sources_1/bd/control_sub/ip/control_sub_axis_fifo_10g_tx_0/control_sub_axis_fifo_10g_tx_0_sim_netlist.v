// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Fri Jul 27 12:54:41 2018
// Host        : sume running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode funcsim -rename_top control_sub_axis_fifo_10g_tx_0 -prefix
//               control_sub_axis_fifo_10g_tx_0_ control_sub_axis_fifo_10g_rx_0_sim_netlist.v
// Design      : control_sub_axis_fifo_10g_rx_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx690tffg1761-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* C_ACLKEN_CONV_MODE = "0" *) (* C_AXIS_SIGNAL_SET = "32'b00000000000000000000000010011011" *) (* C_AXIS_TDATA_WIDTH = "128" *) 
(* C_AXIS_TDEST_WIDTH = "1" *) (* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TUSER_WIDTH = "128" *) 
(* C_AXI_ADDR_WIDTH = "32" *) (* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) 
(* C_AXI_BUSER_WIDTH = "1" *) (* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "4" *) 
(* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_WUSER_WIDTH = "1" *) (* C_DATA_COUNT_WIDTH = "10" *) 
(* C_DIN_WIDTH = "18" *) (* C_DOUT_WIDTH = "18" *) (* C_FAMILY = "virtex7" *) 
(* C_FIFO_DEPTH = "32" *) (* C_FIFO_MODE = "1" *) (* C_IS_ACLK_ASYNC = "1" *) 
(* C_RD_DATA_COUNT_WIDTH = "10" *) (* C_RD_PNTR_WIDTH = "10" *) (* C_RD_PNTR_WIDTH_RACH = "4" *) 
(* C_RD_PNTR_WIDTH_RDCH = "10" *) (* C_RD_PNTR_WIDTH_WACH = "4" *) (* C_RD_PNTR_WIDTH_WDCH = "10" *) 
(* C_RD_PNTR_WIDTH_WRCH = "4" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_WR_DATA_COUNT_WIDTH = "10" *) 
(* C_WR_PNTR_WIDTH = "10" *) (* C_WR_PNTR_WIDTH_AXIS = "5" *) (* C_WR_PNTR_WIDTH_RACH = "4" *) 
(* C_WR_PNTR_WIDTH_RDCH = "10" *) (* C_WR_PNTR_WIDTH_WACH = "4" *) (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
(* C_WR_PNTR_WIDTH_WRCH = "4" *) (* G_INDX_SS_TDATA = "1" *) (* G_INDX_SS_TDEST = "6" *) 
(* G_INDX_SS_TID = "5" *) (* G_INDX_SS_TKEEP = "3" *) (* G_INDX_SS_TLAST = "4" *) 
(* G_INDX_SS_TREADY = "0" *) (* G_INDX_SS_TSTRB = "2" *) (* G_INDX_SS_TUSER = "7" *) 
(* G_MASK_SS_TDATA = "2" *) (* G_MASK_SS_TDEST = "64" *) (* G_MASK_SS_TID = "32" *) 
(* G_MASK_SS_TKEEP = "8" *) (* G_MASK_SS_TLAST = "16" *) (* G_MASK_SS_TREADY = "1" *) 
(* G_MASK_SS_TSTRB = "4" *) (* G_MASK_SS_TUSER = "128" *) (* G_TASK_SEVERITY_ERR = "2" *) 
(* G_TASK_SEVERITY_INFO = "0" *) (* G_TASK_SEVERITY_WARNING = "1" *) (* LP_M_ACLKEN_CAN_TOGGLE = "0" *) 
(* LP_S_ACLKEN_CAN_TOGGLE = "0" *) (* P_APPLICATION_TYPE_AXIS = "0" *) (* P_AXIS_PAYLOAD_WIDTH = "273" *) 
(* P_COMMON_CLOCK = "0" *) (* P_FIFO_COUNT_WIDTH = "6" *) (* P_FIFO_TYPE = "2" *) 
(* P_IMPLEMENTATION_TYPE_AXIS = "12" *) (* P_MSGON_VAL = "0" *) (* P_TDATA_EXISTS = "1" *) 
(* P_TDEST_EXISTS = "0" *) (* P_TID_EXISTS = "0" *) (* P_TKEEP_EXISTS = "1" *) 
(* P_TLAST_EXISTS = "1" *) (* P_TREADY_EXISTS = "1" *) (* P_TSTRB_EXISTS = "0" *) 
(* P_TUSER_EXISTS = "1" *) (* P_WR_PNTR_WIDTH = "5" *) 
module control_sub_axis_fifo_10g_tx_0_axis_data_fifo_v1_1_12_axis_data_fifo
   (s_axis_aresetn,
    m_axis_aresetn,
    s_axis_aclk,
    s_axis_aclken,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_aclk,
    m_axis_aclken,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    axis_data_count,
    axis_wr_data_count,
    axis_rd_data_count);
  input s_axis_aresetn;
  input m_axis_aresetn;
  input s_axis_aclk;
  input s_axis_aclken;
  input s_axis_tvalid;
  output s_axis_tready;
  input [127:0]s_axis_tdata;
  input [15:0]s_axis_tstrb;
  input [15:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [127:0]s_axis_tuser;
  input m_axis_aclk;
  input m_axis_aclken;
  output m_axis_tvalid;
  input m_axis_tready;
  output [127:0]m_axis_tdata;
  output [15:0]m_axis_tstrb;
  output [15:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [127:0]m_axis_tuser;
  output [31:0]axis_data_count;
  output [31:0]axis_wr_data_count;
  output [31:0]axis_rd_data_count;

  wire \<const0> ;
  wire [5:0]\^axis_rd_data_count ;
  wire [5:0]\^axis_wr_data_count ;
  wire m_axis_aclk;
  wire m_axis_aresetn;
  wire [127:0]m_axis_tdata;
  wire [15:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [127:0]m_axis_tuser;
  wire m_axis_tvalid;
  (* RTL_KEEP = "true" *) wire s_and_m_aresetn_i;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire [127:0]s_axis_tdata;
  wire [15:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [127:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_almost_empty_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_almost_full_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_dbiterr_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_overflow_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_prog_empty_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_prog_full_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_sbiterr_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_underflow_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_dbiterr_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_overflow_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_prog_empty_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_prog_full_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_sbiterr_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_underflow_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_dbiterr_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_overflow_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_prog_empty_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_prog_full_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_sbiterr_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_b_underflow_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_dbiterr_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_overflow_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_prog_empty_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_prog_full_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_sbiterr_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_r_underflow_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_dbiterr_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_overflow_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_prog_empty_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_prog_full_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_sbiterr_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axi_w_underflow_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axis_dbiterr_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axis_overflow_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axis_prog_empty_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axis_prog_full_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axis_sbiterr_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_axis_underflow_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_dbiterr_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_empty_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_full_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arvalid_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awvalid_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_bready_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_rready_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wlast_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wvalid_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_overflow_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_prog_empty_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_prog_full_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_rd_rst_busy_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_arready_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_awready_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_bvalid_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rlast_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rvalid_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_s_axi_wready_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_sbiterr_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_underflow_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_valid_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_wr_ack_UNCONNECTED ;
  wire \NLW_gen_fifo_generator.fifo_generator_inst_wr_rst_busy_UNCONNECTED ;
  wire [4:0]\NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_data_count_UNCONNECTED ;
  wire [4:0]\NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_rd_data_count_UNCONNECTED ;
  wire [4:0]\NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_wr_data_count_UNCONNECTED ;
  wire [4:0]\NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_data_count_UNCONNECTED ;
  wire [4:0]\NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_rd_data_count_UNCONNECTED ;
  wire [4:0]\NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_wr_data_count_UNCONNECTED ;
  wire [4:0]\NLW_gen_fifo_generator.fifo_generator_inst_axi_b_data_count_UNCONNECTED ;
  wire [4:0]\NLW_gen_fifo_generator.fifo_generator_inst_axi_b_rd_data_count_UNCONNECTED ;
  wire [4:0]\NLW_gen_fifo_generator.fifo_generator_inst_axi_b_wr_data_count_UNCONNECTED ;
  wire [10:0]\NLW_gen_fifo_generator.fifo_generator_inst_axi_r_data_count_UNCONNECTED ;
  wire [10:0]\NLW_gen_fifo_generator.fifo_generator_inst_axi_r_rd_data_count_UNCONNECTED ;
  wire [10:0]\NLW_gen_fifo_generator.fifo_generator_inst_axi_r_wr_data_count_UNCONNECTED ;
  wire [10:0]\NLW_gen_fifo_generator.fifo_generator_inst_axi_w_data_count_UNCONNECTED ;
  wire [10:0]\NLW_gen_fifo_generator.fifo_generator_inst_axi_w_rd_data_count_UNCONNECTED ;
  wire [10:0]\NLW_gen_fifo_generator.fifo_generator_inst_axi_w_wr_data_count_UNCONNECTED ;
  wire [5:0]\NLW_gen_fifo_generator.fifo_generator_inst_axis_data_count_UNCONNECTED ;
  wire [9:0]\NLW_gen_fifo_generator.fifo_generator_inst_data_count_UNCONNECTED ;
  wire [17:0]\NLW_gen_fifo_generator.fifo_generator_inst_dout_UNCONNECTED ;
  wire [31:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_araddr_UNCONNECTED ;
  wire [1:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arburst_UNCONNECTED ;
  wire [3:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arcache_UNCONNECTED ;
  wire [3:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arid_UNCONNECTED ;
  wire [7:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arlen_UNCONNECTED ;
  wire [1:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arlock_UNCONNECTED ;
  wire [2:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arprot_UNCONNECTED ;
  wire [3:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arqos_UNCONNECTED ;
  wire [3:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arregion_UNCONNECTED ;
  wire [2:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arsize_UNCONNECTED ;
  wire [0:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_aruser_UNCONNECTED ;
  wire [31:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awaddr_UNCONNECTED ;
  wire [1:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awburst_UNCONNECTED ;
  wire [3:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awcache_UNCONNECTED ;
  wire [3:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awid_UNCONNECTED ;
  wire [7:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awlen_UNCONNECTED ;
  wire [1:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awlock_UNCONNECTED ;
  wire [2:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awprot_UNCONNECTED ;
  wire [3:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awqos_UNCONNECTED ;
  wire [3:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awregion_UNCONNECTED ;
  wire [2:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awsize_UNCONNECTED ;
  wire [0:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awuser_UNCONNECTED ;
  wire [63:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wdata_UNCONNECTED ;
  wire [3:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wid_UNCONNECTED ;
  wire [7:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wstrb_UNCONNECTED ;
  wire [0:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wuser_UNCONNECTED ;
  wire [0:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axis_tdest_UNCONNECTED ;
  wire [0:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axis_tid_UNCONNECTED ;
  wire [15:0]\NLW_gen_fifo_generator.fifo_generator_inst_m_axis_tstrb_UNCONNECTED ;
  wire [9:0]\NLW_gen_fifo_generator.fifo_generator_inst_rd_data_count_UNCONNECTED ;
  wire [3:0]\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_bid_UNCONNECTED ;
  wire [1:0]\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_bresp_UNCONNECTED ;
  wire [0:0]\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_buser_UNCONNECTED ;
  wire [63:0]\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rdata_UNCONNECTED ;
  wire [3:0]\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rid_UNCONNECTED ;
  wire [1:0]\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rresp_UNCONNECTED ;
  wire [0:0]\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_ruser_UNCONNECTED ;
  wire [9:0]\NLW_gen_fifo_generator.fifo_generator_inst_wr_data_count_UNCONNECTED ;

  assign axis_data_count[31] = \<const0> ;
  assign axis_data_count[30] = \<const0> ;
  assign axis_data_count[29] = \<const0> ;
  assign axis_data_count[28] = \<const0> ;
  assign axis_data_count[27] = \<const0> ;
  assign axis_data_count[26] = \<const0> ;
  assign axis_data_count[25] = \<const0> ;
  assign axis_data_count[24] = \<const0> ;
  assign axis_data_count[23] = \<const0> ;
  assign axis_data_count[22] = \<const0> ;
  assign axis_data_count[21] = \<const0> ;
  assign axis_data_count[20] = \<const0> ;
  assign axis_data_count[19] = \<const0> ;
  assign axis_data_count[18] = \<const0> ;
  assign axis_data_count[17] = \<const0> ;
  assign axis_data_count[16] = \<const0> ;
  assign axis_data_count[15] = \<const0> ;
  assign axis_data_count[14] = \<const0> ;
  assign axis_data_count[13] = \<const0> ;
  assign axis_data_count[12] = \<const0> ;
  assign axis_data_count[11] = \<const0> ;
  assign axis_data_count[10] = \<const0> ;
  assign axis_data_count[9] = \<const0> ;
  assign axis_data_count[8] = \<const0> ;
  assign axis_data_count[7] = \<const0> ;
  assign axis_data_count[6] = \<const0> ;
  assign axis_data_count[5:0] = \^axis_wr_data_count [5:0];
  assign axis_rd_data_count[31] = \<const0> ;
  assign axis_rd_data_count[30] = \<const0> ;
  assign axis_rd_data_count[29] = \<const0> ;
  assign axis_rd_data_count[28] = \<const0> ;
  assign axis_rd_data_count[27] = \<const0> ;
  assign axis_rd_data_count[26] = \<const0> ;
  assign axis_rd_data_count[25] = \<const0> ;
  assign axis_rd_data_count[24] = \<const0> ;
  assign axis_rd_data_count[23] = \<const0> ;
  assign axis_rd_data_count[22] = \<const0> ;
  assign axis_rd_data_count[21] = \<const0> ;
  assign axis_rd_data_count[20] = \<const0> ;
  assign axis_rd_data_count[19] = \<const0> ;
  assign axis_rd_data_count[18] = \<const0> ;
  assign axis_rd_data_count[17] = \<const0> ;
  assign axis_rd_data_count[16] = \<const0> ;
  assign axis_rd_data_count[15] = \<const0> ;
  assign axis_rd_data_count[14] = \<const0> ;
  assign axis_rd_data_count[13] = \<const0> ;
  assign axis_rd_data_count[12] = \<const0> ;
  assign axis_rd_data_count[11] = \<const0> ;
  assign axis_rd_data_count[10] = \<const0> ;
  assign axis_rd_data_count[9] = \<const0> ;
  assign axis_rd_data_count[8] = \<const0> ;
  assign axis_rd_data_count[7] = \<const0> ;
  assign axis_rd_data_count[6] = \<const0> ;
  assign axis_rd_data_count[5:0] = \^axis_rd_data_count [5:0];
  assign axis_wr_data_count[31] = \<const0> ;
  assign axis_wr_data_count[30] = \<const0> ;
  assign axis_wr_data_count[29] = \<const0> ;
  assign axis_wr_data_count[28] = \<const0> ;
  assign axis_wr_data_count[27] = \<const0> ;
  assign axis_wr_data_count[26] = \<const0> ;
  assign axis_wr_data_count[25] = \<const0> ;
  assign axis_wr_data_count[24] = \<const0> ;
  assign axis_wr_data_count[23] = \<const0> ;
  assign axis_wr_data_count[22] = \<const0> ;
  assign axis_wr_data_count[21] = \<const0> ;
  assign axis_wr_data_count[20] = \<const0> ;
  assign axis_wr_data_count[19] = \<const0> ;
  assign axis_wr_data_count[18] = \<const0> ;
  assign axis_wr_data_count[17] = \<const0> ;
  assign axis_wr_data_count[16] = \<const0> ;
  assign axis_wr_data_count[15] = \<const0> ;
  assign axis_wr_data_count[14] = \<const0> ;
  assign axis_wr_data_count[13] = \<const0> ;
  assign axis_wr_data_count[12] = \<const0> ;
  assign axis_wr_data_count[11] = \<const0> ;
  assign axis_wr_data_count[10] = \<const0> ;
  assign axis_wr_data_count[9] = \<const0> ;
  assign axis_wr_data_count[8] = \<const0> ;
  assign axis_wr_data_count[7] = \<const0> ;
  assign axis_wr_data_count[6] = \<const0> ;
  assign axis_wr_data_count[5:0] = \^axis_wr_data_count [5:0];
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tstrb[15] = \<const0> ;
  assign m_axis_tstrb[14] = \<const0> ;
  assign m_axis_tstrb[13] = \<const0> ;
  assign m_axis_tstrb[12] = \<const0> ;
  assign m_axis_tstrb[11] = \<const0> ;
  assign m_axis_tstrb[10] = \<const0> ;
  assign m_axis_tstrb[9] = \<const0> ;
  assign m_axis_tstrb[8] = \<const0> ;
  assign m_axis_tstrb[7] = \<const0> ;
  assign m_axis_tstrb[6] = \<const0> ;
  assign m_axis_tstrb[5] = \<const0> ;
  assign m_axis_tstrb[4] = \<const0> ;
  assign m_axis_tstrb[3] = \<const0> ;
  assign m_axis_tstrb[2] = \<const0> ;
  assign m_axis_tstrb[1] = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ADD_NGC_CONSTRAINT = "0" *) 
  (* C_APPLICATION_TYPE_AXIS = "0" *) 
  (* C_APPLICATION_TYPE_RACH = "0" *) 
  (* C_APPLICATION_TYPE_RDCH = "0" *) 
  (* C_APPLICATION_TYPE_WACH = "0" *) 
  (* C_APPLICATION_TYPE_WDCH = "0" *) 
  (* C_APPLICATION_TYPE_WRCH = "0" *) 
  (* C_AXIS_TDATA_WIDTH = "128" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TKEEP_WIDTH = "16" *) 
  (* C_AXIS_TSTRB_WIDTH = "16" *) 
  (* C_AXIS_TUSER_WIDTH = "128" *) 
  (* C_AXIS_TYPE = "0" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_LEN_WIDTH = "8" *) 
  (* C_AXI_LOCK_WIDTH = "2" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_TYPE = "0" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_COMMON_CLOCK = "0" *) 
  (* C_COUNT_TYPE = "0" *) 
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DEFAULT_VALUE = "BlankString" *) 
  (* C_DIN_WIDTH = "18" *) 
  (* C_DIN_WIDTH_AXIS = "273" *) 
  (* C_DIN_WIDTH_RACH = "32" *) 
  (* C_DIN_WIDTH_RDCH = "64" *) 
  (* C_DIN_WIDTH_WACH = "32" *) 
  (* C_DIN_WIDTH_WDCH = "64" *) 
  (* C_DIN_WIDTH_WRCH = "2" *) 
  (* C_DOUT_RST_VAL = "0" *) 
  (* C_DOUT_WIDTH = "18" *) 
  (* C_ENABLE_RLOCS = "0" *) 
  (* C_ENABLE_RST_SYNC = "1" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_ERROR_INJECTION_TYPE = "0" *) 
  (* C_ERROR_INJECTION_TYPE_AXIS = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WACH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) 
  (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
  (* C_FAMILY = "virtex7" *) 
  (* C_FULL_FLAGS_RST_VAL = "1" *) 
  (* C_HAS_ALMOST_EMPTY = "0" *) 
  (* C_HAS_ALMOST_FULL = "0" *) 
  (* C_HAS_AXIS_TDATA = "1" *) 
  (* C_HAS_AXIS_TDEST = "0" *) 
  (* C_HAS_AXIS_TID = "0" *) 
  (* C_HAS_AXIS_TKEEP = "1" *) 
  (* C_HAS_AXIS_TLAST = "1" *) 
  (* C_HAS_AXIS_TREADY = "1" *) 
  (* C_HAS_AXIS_TSTRB = "0" *) 
  (* C_HAS_AXIS_TUSER = "1" *) 
  (* C_HAS_AXI_ARUSER = "0" *) 
  (* C_HAS_AXI_AWUSER = "0" *) 
  (* C_HAS_AXI_BUSER = "0" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_AXI_RD_CHANNEL = "0" *) 
  (* C_HAS_AXI_RUSER = "0" *) 
  (* C_HAS_AXI_WR_CHANNEL = "0" *) 
  (* C_HAS_AXI_WUSER = "0" *) 
  (* C_HAS_BACKUP = "0" *) 
  (* C_HAS_DATA_COUNT = "0" *) 
  (* C_HAS_DATA_COUNTS_AXIS = "1" *) 
  (* C_HAS_DATA_COUNTS_RACH = "0" *) 
  (* C_HAS_DATA_COUNTS_RDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WACH = "0" *) 
  (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
  (* C_HAS_DATA_COUNTS_WRCH = "0" *) 
  (* C_HAS_INT_CLK = "0" *) 
  (* C_HAS_MASTER_CE = "0" *) 
  (* C_HAS_MEMINIT_FILE = "0" *) 
  (* C_HAS_OVERFLOW = "0" *) 
  (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
  (* C_HAS_PROG_FLAGS_RACH = "0" *) 
  (* C_HAS_PROG_FLAGS_RDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WACH = "0" *) 
  (* C_HAS_PROG_FLAGS_WDCH = "0" *) 
  (* C_HAS_PROG_FLAGS_WRCH = "0" *) 
  (* C_HAS_RD_DATA_COUNT = "0" *) 
  (* C_HAS_RD_RST = "0" *) 
  (* C_HAS_RST = "1" *) 
  (* C_HAS_SLAVE_CE = "0" *) 
  (* C_HAS_SRST = "0" *) 
  (* C_HAS_UNDERFLOW = "0" *) 
  (* C_HAS_VALID = "0" *) 
  (* C_HAS_WR_ACK = "0" *) 
  (* C_HAS_WR_DATA_COUNT = "0" *) 
  (* C_HAS_WR_RST = "0" *) 
  (* C_IMPLEMENTATION_TYPE = "0" *) 
  (* C_IMPLEMENTATION_TYPE_AXIS = "12" *) 
  (* C_IMPLEMENTATION_TYPE_RACH = "2" *) 
  (* C_IMPLEMENTATION_TYPE_RDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WACH = "2" *) 
  (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
  (* C_IMPLEMENTATION_TYPE_WRCH = "2" *) 
  (* C_INIT_WR_PNTR_VAL = "0" *) 
  (* C_INTERFACE_TYPE = "1" *) 
  (* C_MEMORY_TYPE = "1" *) 
  (* C_MIF_FILE_NAME = "BlankString" *) 
  (* C_MSGON_VAL = "0" *) 
  (* C_OPTIMIZATION_MODE = "0" *) 
  (* C_OVERFLOW_LOW = "0" *) 
  (* C_POWER_SAVING_MODE = "0" *) 
  (* C_PRELOAD_LATENCY = "1" *) 
  (* C_PRELOAD_REGS = "0" *) 
  (* C_PRIM_FIFO_TYPE = "4kx4" *) 
  (* C_PRIM_FIFO_TYPE_AXIS = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_RDCH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WACH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WDCH = "512x36" *) 
  (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "30" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "14" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "14" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
  (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "14" *) 
  (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) 
  (* C_PROG_EMPTY_TYPE = "0" *) 
  (* C_PROG_EMPTY_TYPE_AXIS = "0" *) 
  (* C_PROG_EMPTY_TYPE_RACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WACH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WDCH = "0" *) 
  (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL = "1022" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "31" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "15" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "15" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
  (* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "15" *) 
  (* C_PROG_FULL_THRESH_NEGATE_VAL = "1021" *) 
  (* C_PROG_FULL_TYPE = "0" *) 
  (* C_PROG_FULL_TYPE_AXIS = "0" *) 
  (* C_PROG_FULL_TYPE_RACH = "0" *) 
  (* C_PROG_FULL_TYPE_RDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WACH = "0" *) 
  (* C_PROG_FULL_TYPE_WDCH = "0" *) 
  (* C_PROG_FULL_TYPE_WRCH = "0" *) 
  (* C_RACH_TYPE = "0" *) 
  (* C_RDCH_TYPE = "0" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_DEPTH = "1024" *) 
  (* C_RD_FREQ = "1" *) 
  (* C_RD_PNTR_WIDTH = "10" *) 
  (* C_REG_SLICE_MODE_AXIS = "0" *) 
  (* C_REG_SLICE_MODE_RACH = "0" *) 
  (* C_REG_SLICE_MODE_RDCH = "0" *) 
  (* C_REG_SLICE_MODE_WACH = "0" *) 
  (* C_REG_SLICE_MODE_WDCH = "0" *) 
  (* C_REG_SLICE_MODE_WRCH = "0" *) 
  (* C_SELECT_XPM = "0" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_UNDERFLOW_LOW = "0" *) 
  (* C_USE_COMMON_OVERFLOW = "0" *) 
  (* C_USE_COMMON_UNDERFLOW = "0" *) 
  (* C_USE_DEFAULT_SETTINGS = "0" *) 
  (* C_USE_DOUT_RST = "1" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_ECC_AXIS = "0" *) 
  (* C_USE_ECC_RACH = "0" *) 
  (* C_USE_ECC_RDCH = "0" *) 
  (* C_USE_ECC_WACH = "0" *) 
  (* C_USE_ECC_WDCH = "0" *) 
  (* C_USE_ECC_WRCH = "0" *) 
  (* C_USE_EMBEDDED_REG = "0" *) 
  (* C_USE_FIFO16_FLAGS = "0" *) 
  (* C_USE_FWFT_DATA_COUNT = "0" *) 
  (* C_USE_PIPELINE_REG = "0" *) 
  (* C_VALID_LOW = "0" *) 
  (* C_WACH_TYPE = "0" *) 
  (* C_WDCH_TYPE = "0" *) 
  (* C_WRCH_TYPE = "0" *) 
  (* C_WR_ACK_LOW = "0" *) 
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_DEPTH = "1024" *) 
  (* C_WR_DEPTH_AXIS = "32" *) 
  (* C_WR_DEPTH_RACH = "16" *) 
  (* C_WR_DEPTH_RDCH = "1024" *) 
  (* C_WR_DEPTH_WACH = "16" *) 
  (* C_WR_DEPTH_WDCH = "1024" *) 
  (* C_WR_DEPTH_WRCH = "16" *) 
  (* C_WR_FREQ = "1" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "5" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* C_WR_RESPONSE_LATENCY = "1" *) 
  control_sub_axis_fifo_10g_tx_0_fifo_generator_v13_1_3 \gen_fifo_generator.fifo_generator_inst 
       (.almost_empty(\NLW_gen_fifo_generator.fifo_generator_inst_almost_empty_UNCONNECTED ),
        .almost_full(\NLW_gen_fifo_generator.fifo_generator_inst_almost_full_UNCONNECTED ),
        .axi_ar_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_data_count_UNCONNECTED [4:0]),
        .axi_ar_dbiterr(\NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_dbiterr_UNCONNECTED ),
        .axi_ar_injectdbiterr(1'b0),
        .axi_ar_injectsbiterr(1'b0),
        .axi_ar_overflow(\NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_overflow_UNCONNECTED ),
        .axi_ar_prog_empty(\NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_prog_empty_UNCONNECTED ),
        .axi_ar_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_prog_full(\NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_prog_full_UNCONNECTED ),
        .axi_ar_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_ar_rd_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_rd_data_count_UNCONNECTED [4:0]),
        .axi_ar_sbiterr(\NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_sbiterr_UNCONNECTED ),
        .axi_ar_underflow(\NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_underflow_UNCONNECTED ),
        .axi_ar_wr_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_axi_ar_wr_data_count_UNCONNECTED [4:0]),
        .axi_aw_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_data_count_UNCONNECTED [4:0]),
        .axi_aw_dbiterr(\NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_dbiterr_UNCONNECTED ),
        .axi_aw_injectdbiterr(1'b0),
        .axi_aw_injectsbiterr(1'b0),
        .axi_aw_overflow(\NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_overflow_UNCONNECTED ),
        .axi_aw_prog_empty(\NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_prog_empty_UNCONNECTED ),
        .axi_aw_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_prog_full(\NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_prog_full_UNCONNECTED ),
        .axi_aw_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_aw_rd_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_rd_data_count_UNCONNECTED [4:0]),
        .axi_aw_sbiterr(\NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_sbiterr_UNCONNECTED ),
        .axi_aw_underflow(\NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_underflow_UNCONNECTED ),
        .axi_aw_wr_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_axi_aw_wr_data_count_UNCONNECTED [4:0]),
        .axi_b_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_axi_b_data_count_UNCONNECTED [4:0]),
        .axi_b_dbiterr(\NLW_gen_fifo_generator.fifo_generator_inst_axi_b_dbiterr_UNCONNECTED ),
        .axi_b_injectdbiterr(1'b0),
        .axi_b_injectsbiterr(1'b0),
        .axi_b_overflow(\NLW_gen_fifo_generator.fifo_generator_inst_axi_b_overflow_UNCONNECTED ),
        .axi_b_prog_empty(\NLW_gen_fifo_generator.fifo_generator_inst_axi_b_prog_empty_UNCONNECTED ),
        .axi_b_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_prog_full(\NLW_gen_fifo_generator.fifo_generator_inst_axi_b_prog_full_UNCONNECTED ),
        .axi_b_prog_full_thresh({1'b0,1'b0,1'b0,1'b0}),
        .axi_b_rd_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_axi_b_rd_data_count_UNCONNECTED [4:0]),
        .axi_b_sbiterr(\NLW_gen_fifo_generator.fifo_generator_inst_axi_b_sbiterr_UNCONNECTED ),
        .axi_b_underflow(\NLW_gen_fifo_generator.fifo_generator_inst_axi_b_underflow_UNCONNECTED ),
        .axi_b_wr_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_axi_b_wr_data_count_UNCONNECTED [4:0]),
        .axi_r_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_axi_r_data_count_UNCONNECTED [10:0]),
        .axi_r_dbiterr(\NLW_gen_fifo_generator.fifo_generator_inst_axi_r_dbiterr_UNCONNECTED ),
        .axi_r_injectdbiterr(1'b0),
        .axi_r_injectsbiterr(1'b0),
        .axi_r_overflow(\NLW_gen_fifo_generator.fifo_generator_inst_axi_r_overflow_UNCONNECTED ),
        .axi_r_prog_empty(\NLW_gen_fifo_generator.fifo_generator_inst_axi_r_prog_empty_UNCONNECTED ),
        .axi_r_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_prog_full(\NLW_gen_fifo_generator.fifo_generator_inst_axi_r_prog_full_UNCONNECTED ),
        .axi_r_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_r_rd_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_axi_r_rd_data_count_UNCONNECTED [10:0]),
        .axi_r_sbiterr(\NLW_gen_fifo_generator.fifo_generator_inst_axi_r_sbiterr_UNCONNECTED ),
        .axi_r_underflow(\NLW_gen_fifo_generator.fifo_generator_inst_axi_r_underflow_UNCONNECTED ),
        .axi_r_wr_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_axi_r_wr_data_count_UNCONNECTED [10:0]),
        .axi_w_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_axi_w_data_count_UNCONNECTED [10:0]),
        .axi_w_dbiterr(\NLW_gen_fifo_generator.fifo_generator_inst_axi_w_dbiterr_UNCONNECTED ),
        .axi_w_injectdbiterr(1'b0),
        .axi_w_injectsbiterr(1'b0),
        .axi_w_overflow(\NLW_gen_fifo_generator.fifo_generator_inst_axi_w_overflow_UNCONNECTED ),
        .axi_w_prog_empty(\NLW_gen_fifo_generator.fifo_generator_inst_axi_w_prog_empty_UNCONNECTED ),
        .axi_w_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_prog_full(\NLW_gen_fifo_generator.fifo_generator_inst_axi_w_prog_full_UNCONNECTED ),
        .axi_w_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axi_w_rd_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_axi_w_rd_data_count_UNCONNECTED [10:0]),
        .axi_w_sbiterr(\NLW_gen_fifo_generator.fifo_generator_inst_axi_w_sbiterr_UNCONNECTED ),
        .axi_w_underflow(\NLW_gen_fifo_generator.fifo_generator_inst_axi_w_underflow_UNCONNECTED ),
        .axi_w_wr_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_axi_w_wr_data_count_UNCONNECTED [10:0]),
        .axis_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_axis_data_count_UNCONNECTED [5:0]),
        .axis_dbiterr(\NLW_gen_fifo_generator.fifo_generator_inst_axis_dbiterr_UNCONNECTED ),
        .axis_injectdbiterr(1'b0),
        .axis_injectsbiterr(1'b0),
        .axis_overflow(\NLW_gen_fifo_generator.fifo_generator_inst_axis_overflow_UNCONNECTED ),
        .axis_prog_empty(\NLW_gen_fifo_generator.fifo_generator_inst_axis_prog_empty_UNCONNECTED ),
        .axis_prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_prog_full(\NLW_gen_fifo_generator.fifo_generator_inst_axis_prog_full_UNCONNECTED ),
        .axis_prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0}),
        .axis_rd_data_count(\^axis_rd_data_count ),
        .axis_sbiterr(\NLW_gen_fifo_generator.fifo_generator_inst_axis_sbiterr_UNCONNECTED ),
        .axis_underflow(\NLW_gen_fifo_generator.fifo_generator_inst_axis_underflow_UNCONNECTED ),
        .axis_wr_data_count(\^axis_wr_data_count ),
        .backup(1'b0),
        .backup_marker(1'b0),
        .clk(1'b0),
        .data_count(\NLW_gen_fifo_generator.fifo_generator_inst_data_count_UNCONNECTED [9:0]),
        .dbiterr(\NLW_gen_fifo_generator.fifo_generator_inst_dbiterr_UNCONNECTED ),
        .din({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dout(\NLW_gen_fifo_generator.fifo_generator_inst_dout_UNCONNECTED [17:0]),
        .empty(\NLW_gen_fifo_generator.fifo_generator_inst_empty_UNCONNECTED ),
        .full(\NLW_gen_fifo_generator.fifo_generator_inst_full_UNCONNECTED ),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .int_clk(1'b0),
        .m_aclk(m_axis_aclk),
        .m_aclk_en(1'b0),
        .m_axi_araddr(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_araddr_UNCONNECTED [31:0]),
        .m_axi_arburst(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arburst_UNCONNECTED [1:0]),
        .m_axi_arcache(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arcache_UNCONNECTED [3:0]),
        .m_axi_arid(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arid_UNCONNECTED [3:0]),
        .m_axi_arlen(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arlen_UNCONNECTED [7:0]),
        .m_axi_arlock(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arlock_UNCONNECTED [1:0]),
        .m_axi_arprot(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arprot_UNCONNECTED [2:0]),
        .m_axi_arqos(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arqos_UNCONNECTED [3:0]),
        .m_axi_arready(1'b0),
        .m_axi_arregion(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arregion_UNCONNECTED [3:0]),
        .m_axi_arsize(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arsize_UNCONNECTED [2:0]),
        .m_axi_aruser(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_aruser_UNCONNECTED [0]),
        .m_axi_arvalid(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_arvalid_UNCONNECTED ),
        .m_axi_awaddr(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awaddr_UNCONNECTED [31:0]),
        .m_axi_awburst(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awburst_UNCONNECTED [1:0]),
        .m_axi_awcache(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awcache_UNCONNECTED [3:0]),
        .m_axi_awid(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awid_UNCONNECTED [3:0]),
        .m_axi_awlen(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awlen_UNCONNECTED [7:0]),
        .m_axi_awlock(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awlock_UNCONNECTED [1:0]),
        .m_axi_awprot(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awprot_UNCONNECTED [2:0]),
        .m_axi_awqos(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awqos_UNCONNECTED [3:0]),
        .m_axi_awready(1'b0),
        .m_axi_awregion(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awregion_UNCONNECTED [3:0]),
        .m_axi_awsize(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awsize_UNCONNECTED [2:0]),
        .m_axi_awuser(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awuser_UNCONNECTED [0]),
        .m_axi_awvalid(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_awvalid_UNCONNECTED ),
        .m_axi_bid({1'b0,1'b0,1'b0,1'b0}),
        .m_axi_bready(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_bready_UNCONNECTED ),
        .m_axi_bresp({1'b0,1'b0}),
        .m_axi_buser(1'b0),
        .m_axi_bvalid(1'b0),
        .m_axi_rdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rid({1'b0,1'b0,1'b0,1'b0}),
        .m_axi_rlast(1'b0),
        .m_axi_rready(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_rready_UNCONNECTED ),
        .m_axi_rresp({1'b0,1'b0}),
        .m_axi_ruser(1'b0),
        .m_axi_rvalid(1'b0),
        .m_axi_wdata(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wdata_UNCONNECTED [63:0]),
        .m_axi_wid(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wid_UNCONNECTED [3:0]),
        .m_axi_wlast(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wlast_UNCONNECTED ),
        .m_axi_wready(1'b0),
        .m_axi_wstrb(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wstrb_UNCONNECTED [7:0]),
        .m_axi_wuser(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wuser_UNCONNECTED [0]),
        .m_axi_wvalid(\NLW_gen_fifo_generator.fifo_generator_inst_m_axi_wvalid_UNCONNECTED ),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(\NLW_gen_fifo_generator.fifo_generator_inst_m_axis_tdest_UNCONNECTED [0]),
        .m_axis_tid(\NLW_gen_fifo_generator.fifo_generator_inst_m_axis_tid_UNCONNECTED [0]),
        .m_axis_tkeep(m_axis_tkeep),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(\NLW_gen_fifo_generator.fifo_generator_inst_m_axis_tstrb_UNCONNECTED [15:0]),
        .m_axis_tuser(m_axis_tuser),
        .m_axis_tvalid(m_axis_tvalid),
        .overflow(\NLW_gen_fifo_generator.fifo_generator_inst_overflow_UNCONNECTED ),
        .prog_empty(\NLW_gen_fifo_generator.fifo_generator_inst_prog_empty_UNCONNECTED ),
        .prog_empty_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_empty_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full(\NLW_gen_fifo_generator.fifo_generator_inst_prog_full_UNCONNECTED ),
        .prog_full_thresh({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_assert({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .prog_full_thresh_negate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .rd_clk(1'b0),
        .rd_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_rd_data_count_UNCONNECTED [9:0]),
        .rd_en(1'b0),
        .rd_rst(1'b0),
        .rd_rst_busy(\NLW_gen_fifo_generator.fifo_generator_inst_rd_rst_busy_UNCONNECTED ),
        .rst(1'b0),
        .s_aclk(s_axis_aclk),
        .s_aclk_en(1'b0),
        .s_aresetn(s_and_m_aresetn_i),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlock({1'b0,1'b0}),
        .s_axi_arprot({1'b0,1'b0,1'b0}),
        .s_axi_arqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_arready_UNCONNECTED ),
        .s_axi_arregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_aruser(1'b0),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awcache({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlock({1'b0,1'b0}),
        .s_axi_awprot({1'b0,1'b0,1'b0}),
        .s_axi_awqos({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_awready_UNCONNECTED ),
        .s_axi_awregion({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awuser(1'b0),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_bid_UNCONNECTED [3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_bresp_UNCONNECTED [1:0]),
        .s_axi_buser(\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_buser_UNCONNECTED [0]),
        .s_axi_bvalid(\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_bvalid_UNCONNECTED ),
        .s_axi_rdata(\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rdata_UNCONNECTED [63:0]),
        .s_axi_rid(\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rid_UNCONNECTED [3:0]),
        .s_axi_rlast(\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rlast_UNCONNECTED ),
        .s_axi_rready(1'b0),
        .s_axi_rresp(\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rresp_UNCONNECTED [1:0]),
        .s_axi_ruser(\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_ruser_UNCONNECTED [0]),
        .s_axi_rvalid(\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_rvalid_UNCONNECTED ),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(\NLW_gen_fifo_generator.fifo_generator_inst_s_axi_wready_UNCONNECTED ),
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wuser(1'b0),
        .s_axi_wvalid(1'b0),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid),
        .sbiterr(\NLW_gen_fifo_generator.fifo_generator_inst_sbiterr_UNCONNECTED ),
        .sleep(1'b0),
        .srst(1'b0),
        .underflow(\NLW_gen_fifo_generator.fifo_generator_inst_underflow_UNCONNECTED ),
        .valid(\NLW_gen_fifo_generator.fifo_generator_inst_valid_UNCONNECTED ),
        .wr_ack(\NLW_gen_fifo_generator.fifo_generator_inst_wr_ack_UNCONNECTED ),
        .wr_clk(1'b0),
        .wr_data_count(\NLW_gen_fifo_generator.fifo_generator_inst_wr_data_count_UNCONNECTED [9:0]),
        .wr_en(1'b0),
        .wr_rst(1'b0),
        .wr_rst_busy(\NLW_gen_fifo_generator.fifo_generator_inst_wr_rst_busy_UNCONNECTED ));
  LUT2 #(
    .INIT(4'h8)) 
    s_and_m_aresetn_i_inferred_i_1
       (.I0(s_axis_aresetn),
        .I1(m_axis_aresetn),
        .O(s_and_m_aresetn_i));
endmodule

(* CHECK_LICENSE_TYPE = "control_sub_axis_fifo_10g_rx_0,axis_data_fifo_v1_1_12_axis_data_fifo,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axis_data_fifo_v1_1_12_axis_data_fifo,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module control_sub_axis_fifo_10g_tx_0
   (s_axis_aresetn,
    m_axis_aresetn,
    s_axis_aclk,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tuser,
    m_axis_aclk,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tuser,
    axis_data_count,
    axis_wr_data_count,
    axis_rd_data_count);
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 S_RSTIF RST" *) input s_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 M_RSTIF RST" *) input m_axis_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 S_CLKIF CLK" *) input s_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) input [127:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TKEEP" *) input [15:0]s_axis_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *) input s_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER" *) input [127:0]s_axis_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 M_CLKIF CLK" *) input m_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) output [127:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TKEEP" *) output [15:0]m_axis_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) output m_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TUSER" *) output [127:0]m_axis_tuser;
  output [31:0]axis_data_count;
  output [31:0]axis_wr_data_count;
  output [31:0]axis_rd_data_count;

  wire [31:0]axis_data_count;
  wire [31:0]axis_rd_data_count;
  wire [31:0]axis_wr_data_count;
  wire m_axis_aclk;
  wire m_axis_aresetn;
  wire [127:0]m_axis_tdata;
  wire [15:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [127:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire s_axis_aclk;
  wire s_axis_aresetn;
  wire [127:0]s_axis_tdata;
  wire [15:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [127:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire [0:0]NLW_inst_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tid_UNCONNECTED;
  wire [15:0]NLW_inst_m_axis_tstrb_UNCONNECTED;

  (* C_ACLKEN_CONV_MODE = "0" *) 
  (* C_AXIS_SIGNAL_SET = "32'b00000000000000000000000010011011" *) 
  (* C_AXIS_TDATA_WIDTH = "128" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_AXIS_TUSER_WIDTH = "128" *) 
  (* C_AXI_ADDR_WIDTH = "32" *) 
  (* C_AXI_ARUSER_WIDTH = "1" *) 
  (* C_AXI_AWUSER_WIDTH = "1" *) 
  (* C_AXI_BUSER_WIDTH = "1" *) 
  (* C_AXI_DATA_WIDTH = "64" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_RUSER_WIDTH = "1" *) 
  (* C_AXI_WUSER_WIDTH = "1" *) 
  (* C_DATA_COUNT_WIDTH = "10" *) 
  (* C_DIN_WIDTH = "18" *) 
  (* C_DOUT_WIDTH = "18" *) 
  (* C_FAMILY = "virtex7" *) 
  (* C_FIFO_DEPTH = "32" *) 
  (* C_FIFO_MODE = "1" *) 
  (* C_IS_ACLK_ASYNC = "1" *) 
  (* C_RD_DATA_COUNT_WIDTH = "10" *) 
  (* C_RD_PNTR_WIDTH = "10" *) 
  (* C_RD_PNTR_WIDTH_RACH = "4" *) 
  (* C_RD_PNTR_WIDTH_RDCH = "10" *) 
  (* C_RD_PNTR_WIDTH_WACH = "4" *) 
  (* C_RD_PNTR_WIDTH_WDCH = "10" *) 
  (* C_RD_PNTR_WIDTH_WRCH = "4" *) 
  (* C_SYNCHRONIZER_STAGE = "2" *) 
  (* C_WR_DATA_COUNT_WIDTH = "10" *) 
  (* C_WR_PNTR_WIDTH = "10" *) 
  (* C_WR_PNTR_WIDTH_AXIS = "5" *) 
  (* C_WR_PNTR_WIDTH_RACH = "4" *) 
  (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WACH = "4" *) 
  (* C_WR_PNTR_WIDTH_WDCH = "10" *) 
  (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
  (* G_INDX_SS_TDATA = "1" *) 
  (* G_INDX_SS_TDEST = "6" *) 
  (* G_INDX_SS_TID = "5" *) 
  (* G_INDX_SS_TKEEP = "3" *) 
  (* G_INDX_SS_TLAST = "4" *) 
  (* G_INDX_SS_TREADY = "0" *) 
  (* G_INDX_SS_TSTRB = "2" *) 
  (* G_INDX_SS_TUSER = "7" *) 
  (* G_MASK_SS_TDATA = "2" *) 
  (* G_MASK_SS_TDEST = "64" *) 
  (* G_MASK_SS_TID = "32" *) 
  (* G_MASK_SS_TKEEP = "8" *) 
  (* G_MASK_SS_TLAST = "16" *) 
  (* G_MASK_SS_TREADY = "1" *) 
  (* G_MASK_SS_TSTRB = "4" *) 
  (* G_MASK_SS_TUSER = "128" *) 
  (* G_TASK_SEVERITY_ERR = "2" *) 
  (* G_TASK_SEVERITY_INFO = "0" *) 
  (* G_TASK_SEVERITY_WARNING = "1" *) 
  (* LP_M_ACLKEN_CAN_TOGGLE = "0" *) 
  (* LP_S_ACLKEN_CAN_TOGGLE = "0" *) 
  (* P_APPLICATION_TYPE_AXIS = "0" *) 
  (* P_AXIS_PAYLOAD_WIDTH = "273" *) 
  (* P_COMMON_CLOCK = "0" *) 
  (* P_FIFO_COUNT_WIDTH = "6" *) 
  (* P_FIFO_TYPE = "2" *) 
  (* P_IMPLEMENTATION_TYPE_AXIS = "12" *) 
  (* P_MSGON_VAL = "0" *) 
  (* P_TDATA_EXISTS = "1" *) 
  (* P_TDEST_EXISTS = "0" *) 
  (* P_TID_EXISTS = "0" *) 
  (* P_TKEEP_EXISTS = "1" *) 
  (* P_TLAST_EXISTS = "1" *) 
  (* P_TREADY_EXISTS = "1" *) 
  (* P_TSTRB_EXISTS = "0" *) 
  (* P_TUSER_EXISTS = "1" *) 
  (* P_WR_PNTR_WIDTH = "5" *) 
  control_sub_axis_fifo_10g_tx_0_axis_data_fifo_v1_1_12_axis_data_fifo inst
       (.axis_data_count(axis_data_count),
        .axis_rd_data_count(axis_rd_data_count),
        .axis_wr_data_count(axis_wr_data_count),
        .m_axis_aclk(m_axis_aclk),
        .m_axis_aclken(1'b1),
        .m_axis_aresetn(m_axis_aresetn),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(NLW_inst_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_inst_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(m_axis_tkeep),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(NLW_inst_m_axis_tstrb_UNCONNECTED[15:0]),
        .m_axis_tuser(m_axis_tuser),
        .m_axis_tvalid(m_axis_tvalid),
        .s_axis_aclk(s_axis_aclk),
        .s_axis_aclken(1'b1),
        .s_axis_aresetn(s_axis_aresetn),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tdest(1'b0),
        .s_axis_tid(1'b0),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready),
        .s_axis_tstrb({1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1,1'b1}),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module control_sub_axis_fifo_10g_tx_0_clk_x_pntrs
   (out,
    ram_empty_fb_i_reg,
    Q,
    \g_rd.gvalid_low.rd_dc_i_reg[2] ,
    ram_full_i_reg,
    \wr_data_count_i_reg[4] ,
    \wr_data_count_i_reg[5] ,
    D,
    ram_empty_fb_i_reg_0,
    \gc0.count_d1_reg[4] ,
    \gc0.count_reg[4] ,
    \gic0.gc0.count_d1_reg[3] ,
    wr_rst_busy,
    \gic0.gc0.count_d2_reg[0] ,
    \gic0.gc0.count_d2_reg[4] ,
    s_aclk,
    AR,
    \gic0.gc0.count_d2_reg[3] ,
    m_aclk,
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ,
    \gc0.count_d1_reg[4]_0 );
  output [4:0]out;
  output ram_empty_fb_i_reg;
  output [4:0]Q;
  output \g_rd.gvalid_low.rd_dc_i_reg[2] ;
  output ram_full_i_reg;
  output [4:0]\wr_data_count_i_reg[4] ;
  output [1:0]\wr_data_count_i_reg[5] ;
  input [0:0]D;
  input ram_empty_fb_i_reg_0;
  input [4:0]\gc0.count_d1_reg[4] ;
  input [4:0]\gc0.count_reg[4] ;
  input [0:0]\gic0.gc0.count_d1_reg[3] ;
  input wr_rst_busy;
  input \gic0.gc0.count_d2_reg[0] ;
  input [4:0]\gic0.gc0.count_d2_reg[4] ;
  input s_aclk;
  input [0:0]AR;
  input [3:0]\gic0.gc0.count_d2_reg[3] ;
  input m_aclk;
  input [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ;
  input [3:0]\gc0.count_d1_reg[4]_0 ;

  wire [0:0]AR;
  wire [0:0]D;
  wire [4:0]Q;
  wire __2_n_0;
  wire __3_n_0;
  wire __4_n_0;
  wire \g_rd.gvalid_low.rd_dc_i_reg[2] ;
  wire [4:0]\gc0.count_d1_reg[4] ;
  wire [3:0]\gc0.count_d1_reg[4]_0 ;
  wire [4:0]\gc0.count_reg[4] ;
  wire [0:0]\gic0.gc0.count_d1_reg[3] ;
  wire \gic0.gc0.count_d2_reg[0] ;
  wire [3:0]\gic0.gc0.count_d2_reg[3] ;
  wire [4:0]\gic0.gc0.count_d2_reg[4] ;
  wire \gnxpm_cdc.gsync_stage[2].wr_stg_inst_n_5 ;
  wire [2:1]gray2bin;
  wire m_aclk;
  wire [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ;
  wire [4:0]out;
  wire p_0_out;
  wire [4:0]p_3_out;
  wire [4:0]p_4_out;
  wire [4:0]p_6_out;
  wire ram_empty_fb_i_reg;
  wire ram_empty_fb_i_reg_0;
  wire ram_empty_i_i_3_n_0;
  wire ram_empty_i_i_4_n_0;
  wire ram_empty_i_i_5_n_0;
  wire ram_empty_i_i_6_n_0;
  wire ram_full_i_reg;
  wire [4:0]rd_pntr_gc;
  wire s_aclk;
  wire \wr_data_count_i[5]_i_3_n_0 ;
  wire [4:0]\wr_data_count_i_reg[4] ;
  wire [1:0]\wr_data_count_i_reg[5] ;
  wire [4:0]wr_pntr_gc;
  wire wr_rst_busy;

  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    __0
       (.I0(out[2]),
        .I1(out[1]),
        .I2(out[4]),
        .I3(out[3]),
        .O(gray2bin[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h96)) 
    __1
       (.I0(out[3]),
        .I1(out[2]),
        .I2(out[4]),
        .O(gray2bin[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h96696996)) 
    __2
       (.I0(p_6_out[2]),
        .I1(p_6_out[0]),
        .I2(p_6_out[1]),
        .I3(p_6_out[4]),
        .I4(p_6_out[3]),
        .O(__2_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h6996)) 
    __3
       (.I0(p_6_out[2]),
        .I1(p_6_out[1]),
        .I2(p_6_out[4]),
        .I3(p_6_out[3]),
        .O(__3_n_0));
  LUT3 #(
    .INIT(8'h96)) 
    __4
       (.I0(p_6_out[3]),
        .I1(p_6_out[2]),
        .I2(p_6_out[4]),
        .O(__4_n_0));
  LUT2 #(
    .INIT(4'hB)) 
    \g_rd.gvalid_low.rd_dc_i[2]_i_2 
       (.I0(Q[0]),
        .I1(\gc0.count_d1_reg[4] [0]),
        .O(\g_rd.gvalid_low.rd_dc_i_reg[2] ));
  control_sub_axis_fifo_10g_tx_0_synchronizer_ff__parameterized0 \gnxpm_cdc.gsync_stage[1].rd_stg_inst 
       (.D(p_3_out),
        .Q(wr_pntr_gc),
        .m_aclk(m_aclk),
        .\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] (\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ));
  control_sub_axis_fifo_10g_tx_0_synchronizer_ff__parameterized1 \gnxpm_cdc.gsync_stage[1].wr_stg_inst 
       (.AR(AR),
        .D(p_4_out),
        .Q(rd_pntr_gc),
        .s_aclk(s_aclk));
  control_sub_axis_fifo_10g_tx_0_synchronizer_ff__parameterized2 \gnxpm_cdc.gsync_stage[2].rd_stg_inst 
       (.D(p_0_out),
        .\Q_reg_reg[4]_0 (p_3_out),
        .m_aclk(m_aclk),
        .\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] (\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .out(out));
  control_sub_axis_fifo_10g_tx_0_synchronizer_ff__parameterized3 \gnxpm_cdc.gsync_stage[2].wr_stg_inst 
       (.AR(AR),
        .D(\gnxpm_cdc.gsync_stage[2].wr_stg_inst_n_5 ),
        .\Q_reg_reg[4]_0 (p_4_out),
        .out(p_6_out),
        .s_aclk(s_aclk));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.rd_pntr_bin_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(__2_n_0),
        .Q(\wr_data_count_i_reg[4] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.rd_pntr_bin_reg[1] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(__3_n_0),
        .Q(\wr_data_count_i_reg[4] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.rd_pntr_bin_reg[2] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(__4_n_0),
        .Q(\wr_data_count_i_reg[4] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.rd_pntr_bin_reg[3] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\gnxpm_cdc.gsync_stage[2].wr_stg_inst_n_5 ),
        .Q(\wr_data_count_i_reg[4] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.rd_pntr_bin_reg[4] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(p_6_out[4]),
        .Q(\wr_data_count_i_reg[4] [4]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.rd_pntr_gc_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\gc0.count_d1_reg[4]_0 [0]),
        .Q(rd_pntr_gc[0]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.rd_pntr_gc_reg[1] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\gc0.count_d1_reg[4]_0 [1]),
        .Q(rd_pntr_gc[1]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.rd_pntr_gc_reg[2] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\gc0.count_d1_reg[4]_0 [2]),
        .Q(rd_pntr_gc[2]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.rd_pntr_gc_reg[3] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\gc0.count_d1_reg[4]_0 [3]),
        .Q(rd_pntr_gc[3]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.rd_pntr_gc_reg[4] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\gc0.count_d1_reg[4] [4]),
        .Q(rd_pntr_gc[4]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.wr_pntr_bin_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(D),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.wr_pntr_bin_reg[1] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(gray2bin[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.wr_pntr_bin_reg[2] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(gray2bin[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.wr_pntr_bin_reg[3] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(p_0_out),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.wr_pntr_bin_reg[4] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(out[4]),
        .Q(Q[4]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.wr_pntr_gc_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\gic0.gc0.count_d2_reg[3] [0]),
        .Q(wr_pntr_gc[0]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.wr_pntr_gc_reg[1] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\gic0.gc0.count_d2_reg[3] [1]),
        .Q(wr_pntr_gc[1]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.wr_pntr_gc_reg[2] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\gic0.gc0.count_d2_reg[3] [2]),
        .Q(wr_pntr_gc[2]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.wr_pntr_gc_reg[3] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\gic0.gc0.count_d2_reg[3] [3]),
        .Q(wr_pntr_gc[3]));
  FDCE #(
    .INIT(1'b0)) 
    \gnxpm_cdc.wr_pntr_gc_reg[4] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\gic0.gc0.count_d2_reg[4] [4]),
        .Q(wr_pntr_gc[4]));
  LUT5 #(
    .INIT(32'h10FF1010)) 
    ram_empty_i_i_1
       (.I0(ram_empty_fb_i_reg_0),
        .I1(ram_empty_i_i_3_n_0),
        .I2(ram_empty_i_i_4_n_0),
        .I3(ram_empty_i_i_5_n_0),
        .I4(ram_empty_i_i_6_n_0),
        .O(ram_empty_fb_i_reg));
  LUT4 #(
    .INIT(16'h6FF6)) 
    ram_empty_i_i_3
       (.I0(Q[1]),
        .I1(\gc0.count_reg[4] [1]),
        .I2(Q[2]),
        .I3(\gc0.count_reg[4] [2]),
        .O(ram_empty_i_i_3_n_0));
  LUT6 #(
    .INIT(64'h9009000000009009)) 
    ram_empty_i_i_4
       (.I0(Q[3]),
        .I1(\gc0.count_reg[4] [3]),
        .I2(\gc0.count_reg[4] [0]),
        .I3(Q[0]),
        .I4(\gc0.count_reg[4] [4]),
        .I5(Q[4]),
        .O(ram_empty_i_i_4_n_0));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    ram_empty_i_i_5
       (.I0(Q[0]),
        .I1(\gc0.count_d1_reg[4] [0]),
        .I2(\gc0.count_d1_reg[4] [4]),
        .I3(Q[4]),
        .I4(\gc0.count_d1_reg[4] [1]),
        .I5(Q[1]),
        .O(ram_empty_i_i_5_n_0));
  LUT4 #(
    .INIT(16'h9009)) 
    ram_empty_i_i_6
       (.I0(Q[3]),
        .I1(\gc0.count_d1_reg[4] [3]),
        .I2(Q[2]),
        .I3(\gc0.count_d1_reg[4] [2]),
        .O(ram_empty_i_i_6_n_0));
  LUT3 #(
    .INIT(8'h09)) 
    ram_full_i_i_7
       (.I0(\wr_data_count_i_reg[4] [3]),
        .I1(\gic0.gc0.count_d1_reg[3] ),
        .I2(wr_rst_busy),
        .O(ram_full_i_reg));
  LUT6 #(
    .INIT(64'h2B42D4BDD4BD2B42)) 
    \wr_data_count_i[4]_i_1 
       (.I0(\wr_data_count_i[5]_i_3_n_0 ),
        .I1(\gic0.gc0.count_d2_reg[0] ),
        .I2(\gic0.gc0.count_d2_reg[4] [3]),
        .I3(\wr_data_count_i_reg[4] [3]),
        .I4(\wr_data_count_i_reg[4] [4]),
        .I5(\gic0.gc0.count_d2_reg[4] [4]),
        .O(\wr_data_count_i_reg[5] [0]));
  LUT6 #(
    .INIT(64'h0000000009609009)) 
    \wr_data_count_i[5]_i_1 
       (.I0(\wr_data_count_i_reg[4] [4]),
        .I1(\gic0.gc0.count_d2_reg[4] [4]),
        .I2(\gic0.gc0.count_d2_reg[4] [3]),
        .I3(\wr_data_count_i_reg[4] [3]),
        .I4(\gic0.gc0.count_d2_reg[0] ),
        .I5(\wr_data_count_i[5]_i_3_n_0 ),
        .O(\wr_data_count_i_reg[5] [1]));
  LUT6 #(
    .INIT(64'hF6FF9F996F66F6FF)) 
    \wr_data_count_i[5]_i_3 
       (.I0(\wr_data_count_i_reg[4] [2]),
        .I1(\gic0.gc0.count_d2_reg[4] [2]),
        .I2(\gic0.gc0.count_d2_reg[4] [0]),
        .I3(\wr_data_count_i_reg[4] [0]),
        .I4(\wr_data_count_i_reg[4] [1]),
        .I5(\gic0.gc0.count_d2_reg[4] [1]),
        .O(\wr_data_count_i[5]_i_3_n_0 ));
endmodule

module control_sub_axis_fifo_10g_tx_0_dmem
   (dout_i,
    s_aclk,
    ram_full_fb_i_reg,
    DI,
    \gc0.count_d1_reg[4] ,
    \gic0.gc0.count_d2_reg[4] ,
    \gpregsm1.curr_fwft_state_reg[1] ,
    m_aclk);
  output [272:0]dout_i;
  input s_aclk;
  input [0:0]ram_full_fb_i_reg;
  input [272:0]DI;
  input [4:0]\gc0.count_d1_reg[4] ;
  input [4:0]\gic0.gc0.count_d2_reg[4] ;
  input [0:0]\gpregsm1.curr_fwft_state_reg[1] ;
  input m_aclk;

  wire [272:0]DI;
  wire RAM_reg_0_31_0_5_n_0;
  wire RAM_reg_0_31_0_5_n_1;
  wire RAM_reg_0_31_0_5_n_2;
  wire RAM_reg_0_31_0_5_n_3;
  wire RAM_reg_0_31_0_5_n_4;
  wire RAM_reg_0_31_0_5_n_5;
  wire RAM_reg_0_31_102_107_n_0;
  wire RAM_reg_0_31_102_107_n_1;
  wire RAM_reg_0_31_102_107_n_2;
  wire RAM_reg_0_31_102_107_n_3;
  wire RAM_reg_0_31_102_107_n_4;
  wire RAM_reg_0_31_102_107_n_5;
  wire RAM_reg_0_31_108_113_n_0;
  wire RAM_reg_0_31_108_113_n_1;
  wire RAM_reg_0_31_108_113_n_2;
  wire RAM_reg_0_31_108_113_n_3;
  wire RAM_reg_0_31_108_113_n_4;
  wire RAM_reg_0_31_108_113_n_5;
  wire RAM_reg_0_31_114_119_n_0;
  wire RAM_reg_0_31_114_119_n_1;
  wire RAM_reg_0_31_114_119_n_2;
  wire RAM_reg_0_31_114_119_n_3;
  wire RAM_reg_0_31_114_119_n_4;
  wire RAM_reg_0_31_114_119_n_5;
  wire RAM_reg_0_31_120_125_n_0;
  wire RAM_reg_0_31_120_125_n_1;
  wire RAM_reg_0_31_120_125_n_2;
  wire RAM_reg_0_31_120_125_n_3;
  wire RAM_reg_0_31_120_125_n_4;
  wire RAM_reg_0_31_120_125_n_5;
  wire RAM_reg_0_31_126_131_n_0;
  wire RAM_reg_0_31_126_131_n_1;
  wire RAM_reg_0_31_126_131_n_2;
  wire RAM_reg_0_31_126_131_n_3;
  wire RAM_reg_0_31_126_131_n_4;
  wire RAM_reg_0_31_126_131_n_5;
  wire RAM_reg_0_31_12_17_n_0;
  wire RAM_reg_0_31_12_17_n_1;
  wire RAM_reg_0_31_12_17_n_2;
  wire RAM_reg_0_31_12_17_n_3;
  wire RAM_reg_0_31_12_17_n_4;
  wire RAM_reg_0_31_12_17_n_5;
  wire RAM_reg_0_31_132_137_n_0;
  wire RAM_reg_0_31_132_137_n_1;
  wire RAM_reg_0_31_132_137_n_2;
  wire RAM_reg_0_31_132_137_n_3;
  wire RAM_reg_0_31_132_137_n_4;
  wire RAM_reg_0_31_132_137_n_5;
  wire RAM_reg_0_31_138_143_n_0;
  wire RAM_reg_0_31_138_143_n_1;
  wire RAM_reg_0_31_138_143_n_2;
  wire RAM_reg_0_31_138_143_n_3;
  wire RAM_reg_0_31_138_143_n_4;
  wire RAM_reg_0_31_138_143_n_5;
  wire RAM_reg_0_31_144_149_n_0;
  wire RAM_reg_0_31_144_149_n_1;
  wire RAM_reg_0_31_144_149_n_2;
  wire RAM_reg_0_31_144_149_n_3;
  wire RAM_reg_0_31_144_149_n_4;
  wire RAM_reg_0_31_144_149_n_5;
  wire RAM_reg_0_31_150_155_n_0;
  wire RAM_reg_0_31_150_155_n_1;
  wire RAM_reg_0_31_150_155_n_2;
  wire RAM_reg_0_31_150_155_n_3;
  wire RAM_reg_0_31_150_155_n_4;
  wire RAM_reg_0_31_150_155_n_5;
  wire RAM_reg_0_31_156_161_n_0;
  wire RAM_reg_0_31_156_161_n_1;
  wire RAM_reg_0_31_156_161_n_2;
  wire RAM_reg_0_31_156_161_n_3;
  wire RAM_reg_0_31_156_161_n_4;
  wire RAM_reg_0_31_156_161_n_5;
  wire RAM_reg_0_31_162_167_n_0;
  wire RAM_reg_0_31_162_167_n_1;
  wire RAM_reg_0_31_162_167_n_2;
  wire RAM_reg_0_31_162_167_n_3;
  wire RAM_reg_0_31_162_167_n_4;
  wire RAM_reg_0_31_162_167_n_5;
  wire RAM_reg_0_31_168_173_n_0;
  wire RAM_reg_0_31_168_173_n_1;
  wire RAM_reg_0_31_168_173_n_2;
  wire RAM_reg_0_31_168_173_n_3;
  wire RAM_reg_0_31_168_173_n_4;
  wire RAM_reg_0_31_168_173_n_5;
  wire RAM_reg_0_31_174_179_n_0;
  wire RAM_reg_0_31_174_179_n_1;
  wire RAM_reg_0_31_174_179_n_2;
  wire RAM_reg_0_31_174_179_n_3;
  wire RAM_reg_0_31_174_179_n_4;
  wire RAM_reg_0_31_174_179_n_5;
  wire RAM_reg_0_31_180_185_n_0;
  wire RAM_reg_0_31_180_185_n_1;
  wire RAM_reg_0_31_180_185_n_2;
  wire RAM_reg_0_31_180_185_n_3;
  wire RAM_reg_0_31_180_185_n_4;
  wire RAM_reg_0_31_180_185_n_5;
  wire RAM_reg_0_31_186_191_n_0;
  wire RAM_reg_0_31_186_191_n_1;
  wire RAM_reg_0_31_186_191_n_2;
  wire RAM_reg_0_31_186_191_n_3;
  wire RAM_reg_0_31_186_191_n_4;
  wire RAM_reg_0_31_186_191_n_5;
  wire RAM_reg_0_31_18_23_n_0;
  wire RAM_reg_0_31_18_23_n_1;
  wire RAM_reg_0_31_18_23_n_2;
  wire RAM_reg_0_31_18_23_n_3;
  wire RAM_reg_0_31_18_23_n_4;
  wire RAM_reg_0_31_18_23_n_5;
  wire RAM_reg_0_31_192_197_n_0;
  wire RAM_reg_0_31_192_197_n_1;
  wire RAM_reg_0_31_192_197_n_2;
  wire RAM_reg_0_31_192_197_n_3;
  wire RAM_reg_0_31_192_197_n_4;
  wire RAM_reg_0_31_192_197_n_5;
  wire RAM_reg_0_31_198_203_n_0;
  wire RAM_reg_0_31_198_203_n_1;
  wire RAM_reg_0_31_198_203_n_2;
  wire RAM_reg_0_31_198_203_n_3;
  wire RAM_reg_0_31_198_203_n_4;
  wire RAM_reg_0_31_198_203_n_5;
  wire RAM_reg_0_31_204_209_n_0;
  wire RAM_reg_0_31_204_209_n_1;
  wire RAM_reg_0_31_204_209_n_2;
  wire RAM_reg_0_31_204_209_n_3;
  wire RAM_reg_0_31_204_209_n_4;
  wire RAM_reg_0_31_204_209_n_5;
  wire RAM_reg_0_31_210_215_n_0;
  wire RAM_reg_0_31_210_215_n_1;
  wire RAM_reg_0_31_210_215_n_2;
  wire RAM_reg_0_31_210_215_n_3;
  wire RAM_reg_0_31_210_215_n_4;
  wire RAM_reg_0_31_210_215_n_5;
  wire RAM_reg_0_31_216_221_n_0;
  wire RAM_reg_0_31_216_221_n_1;
  wire RAM_reg_0_31_216_221_n_2;
  wire RAM_reg_0_31_216_221_n_3;
  wire RAM_reg_0_31_216_221_n_4;
  wire RAM_reg_0_31_216_221_n_5;
  wire RAM_reg_0_31_222_227_n_0;
  wire RAM_reg_0_31_222_227_n_1;
  wire RAM_reg_0_31_222_227_n_2;
  wire RAM_reg_0_31_222_227_n_3;
  wire RAM_reg_0_31_222_227_n_4;
  wire RAM_reg_0_31_222_227_n_5;
  wire RAM_reg_0_31_228_233_n_0;
  wire RAM_reg_0_31_228_233_n_1;
  wire RAM_reg_0_31_228_233_n_2;
  wire RAM_reg_0_31_228_233_n_3;
  wire RAM_reg_0_31_228_233_n_4;
  wire RAM_reg_0_31_228_233_n_5;
  wire RAM_reg_0_31_234_239_n_0;
  wire RAM_reg_0_31_234_239_n_1;
  wire RAM_reg_0_31_234_239_n_2;
  wire RAM_reg_0_31_234_239_n_3;
  wire RAM_reg_0_31_234_239_n_4;
  wire RAM_reg_0_31_234_239_n_5;
  wire RAM_reg_0_31_240_245_n_0;
  wire RAM_reg_0_31_240_245_n_1;
  wire RAM_reg_0_31_240_245_n_2;
  wire RAM_reg_0_31_240_245_n_3;
  wire RAM_reg_0_31_240_245_n_4;
  wire RAM_reg_0_31_240_245_n_5;
  wire RAM_reg_0_31_246_251_n_0;
  wire RAM_reg_0_31_246_251_n_1;
  wire RAM_reg_0_31_246_251_n_2;
  wire RAM_reg_0_31_246_251_n_3;
  wire RAM_reg_0_31_246_251_n_4;
  wire RAM_reg_0_31_246_251_n_5;
  wire RAM_reg_0_31_24_29_n_0;
  wire RAM_reg_0_31_24_29_n_1;
  wire RAM_reg_0_31_24_29_n_2;
  wire RAM_reg_0_31_24_29_n_3;
  wire RAM_reg_0_31_24_29_n_4;
  wire RAM_reg_0_31_24_29_n_5;
  wire RAM_reg_0_31_252_257_n_0;
  wire RAM_reg_0_31_252_257_n_1;
  wire RAM_reg_0_31_252_257_n_2;
  wire RAM_reg_0_31_252_257_n_3;
  wire RAM_reg_0_31_252_257_n_4;
  wire RAM_reg_0_31_252_257_n_5;
  wire RAM_reg_0_31_258_263_n_0;
  wire RAM_reg_0_31_258_263_n_1;
  wire RAM_reg_0_31_258_263_n_2;
  wire RAM_reg_0_31_258_263_n_3;
  wire RAM_reg_0_31_258_263_n_4;
  wire RAM_reg_0_31_258_263_n_5;
  wire RAM_reg_0_31_264_269_n_0;
  wire RAM_reg_0_31_264_269_n_1;
  wire RAM_reg_0_31_264_269_n_2;
  wire RAM_reg_0_31_264_269_n_3;
  wire RAM_reg_0_31_264_269_n_4;
  wire RAM_reg_0_31_264_269_n_5;
  wire RAM_reg_0_31_270_272_n_0;
  wire RAM_reg_0_31_270_272_n_1;
  wire RAM_reg_0_31_270_272_n_3;
  wire RAM_reg_0_31_30_35_n_0;
  wire RAM_reg_0_31_30_35_n_1;
  wire RAM_reg_0_31_30_35_n_2;
  wire RAM_reg_0_31_30_35_n_3;
  wire RAM_reg_0_31_30_35_n_4;
  wire RAM_reg_0_31_30_35_n_5;
  wire RAM_reg_0_31_36_41_n_0;
  wire RAM_reg_0_31_36_41_n_1;
  wire RAM_reg_0_31_36_41_n_2;
  wire RAM_reg_0_31_36_41_n_3;
  wire RAM_reg_0_31_36_41_n_4;
  wire RAM_reg_0_31_36_41_n_5;
  wire RAM_reg_0_31_42_47_n_0;
  wire RAM_reg_0_31_42_47_n_1;
  wire RAM_reg_0_31_42_47_n_2;
  wire RAM_reg_0_31_42_47_n_3;
  wire RAM_reg_0_31_42_47_n_4;
  wire RAM_reg_0_31_42_47_n_5;
  wire RAM_reg_0_31_48_53_n_0;
  wire RAM_reg_0_31_48_53_n_1;
  wire RAM_reg_0_31_48_53_n_2;
  wire RAM_reg_0_31_48_53_n_3;
  wire RAM_reg_0_31_48_53_n_4;
  wire RAM_reg_0_31_48_53_n_5;
  wire RAM_reg_0_31_54_59_n_0;
  wire RAM_reg_0_31_54_59_n_1;
  wire RAM_reg_0_31_54_59_n_2;
  wire RAM_reg_0_31_54_59_n_3;
  wire RAM_reg_0_31_54_59_n_4;
  wire RAM_reg_0_31_54_59_n_5;
  wire RAM_reg_0_31_60_65_n_0;
  wire RAM_reg_0_31_60_65_n_1;
  wire RAM_reg_0_31_60_65_n_2;
  wire RAM_reg_0_31_60_65_n_3;
  wire RAM_reg_0_31_60_65_n_4;
  wire RAM_reg_0_31_60_65_n_5;
  wire RAM_reg_0_31_66_71_n_0;
  wire RAM_reg_0_31_66_71_n_1;
  wire RAM_reg_0_31_66_71_n_2;
  wire RAM_reg_0_31_66_71_n_3;
  wire RAM_reg_0_31_66_71_n_4;
  wire RAM_reg_0_31_66_71_n_5;
  wire RAM_reg_0_31_6_11_n_0;
  wire RAM_reg_0_31_6_11_n_1;
  wire RAM_reg_0_31_6_11_n_2;
  wire RAM_reg_0_31_6_11_n_3;
  wire RAM_reg_0_31_6_11_n_4;
  wire RAM_reg_0_31_6_11_n_5;
  wire RAM_reg_0_31_72_77_n_0;
  wire RAM_reg_0_31_72_77_n_1;
  wire RAM_reg_0_31_72_77_n_2;
  wire RAM_reg_0_31_72_77_n_3;
  wire RAM_reg_0_31_72_77_n_4;
  wire RAM_reg_0_31_72_77_n_5;
  wire RAM_reg_0_31_78_83_n_0;
  wire RAM_reg_0_31_78_83_n_1;
  wire RAM_reg_0_31_78_83_n_2;
  wire RAM_reg_0_31_78_83_n_3;
  wire RAM_reg_0_31_78_83_n_4;
  wire RAM_reg_0_31_78_83_n_5;
  wire RAM_reg_0_31_84_89_n_0;
  wire RAM_reg_0_31_84_89_n_1;
  wire RAM_reg_0_31_84_89_n_2;
  wire RAM_reg_0_31_84_89_n_3;
  wire RAM_reg_0_31_84_89_n_4;
  wire RAM_reg_0_31_84_89_n_5;
  wire RAM_reg_0_31_90_95_n_0;
  wire RAM_reg_0_31_90_95_n_1;
  wire RAM_reg_0_31_90_95_n_2;
  wire RAM_reg_0_31_90_95_n_3;
  wire RAM_reg_0_31_90_95_n_4;
  wire RAM_reg_0_31_90_95_n_5;
  wire RAM_reg_0_31_96_101_n_0;
  wire RAM_reg_0_31_96_101_n_1;
  wire RAM_reg_0_31_96_101_n_2;
  wire RAM_reg_0_31_96_101_n_3;
  wire RAM_reg_0_31_96_101_n_4;
  wire RAM_reg_0_31_96_101_n_5;
  wire [272:0]dout_i;
  wire [4:0]\gc0.count_d1_reg[4] ;
  wire [4:0]\gic0.gc0.count_d2_reg[4] ;
  wire [0:0]\gpregsm1.curr_fwft_state_reg[1] ;
  wire m_aclk;
  wire [0:0]ram_full_fb_i_reg;
  wire s_aclk;
  wire [1:0]NLW_RAM_reg_0_31_0_5_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_102_107_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_108_113_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_114_119_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_120_125_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_126_131_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_12_17_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_132_137_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_138_143_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_144_149_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_150_155_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_156_161_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_162_167_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_168_173_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_174_179_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_180_185_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_186_191_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_18_23_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_192_197_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_198_203_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_204_209_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_210_215_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_216_221_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_222_227_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_228_233_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_234_239_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_240_245_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_246_251_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_24_29_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_252_257_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_258_263_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_264_269_DOD_UNCONNECTED;
  wire [1:1]NLW_RAM_reg_0_31_270_272_DOB_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_270_272_DOC_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_270_272_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_30_35_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_36_41_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_42_47_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_48_53_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_54_59_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_60_65_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_66_71_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_6_11_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_72_77_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_78_83_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_84_89_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_90_95_DOD_UNCONNECTED;
  wire [1:0]NLW_RAM_reg_0_31_96_101_DOD_UNCONNECTED;

  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_0_5
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[1:0]),
        .DIB(DI[3:2]),
        .DIC(DI[5:4]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_0_5_n_0,RAM_reg_0_31_0_5_n_1}),
        .DOB({RAM_reg_0_31_0_5_n_2,RAM_reg_0_31_0_5_n_3}),
        .DOC({RAM_reg_0_31_0_5_n_4,RAM_reg_0_31_0_5_n_5}),
        .DOD(NLW_RAM_reg_0_31_0_5_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_102_107
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[103:102]),
        .DIB(DI[105:104]),
        .DIC(DI[107:106]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_102_107_n_0,RAM_reg_0_31_102_107_n_1}),
        .DOB({RAM_reg_0_31_102_107_n_2,RAM_reg_0_31_102_107_n_3}),
        .DOC({RAM_reg_0_31_102_107_n_4,RAM_reg_0_31_102_107_n_5}),
        .DOD(NLW_RAM_reg_0_31_102_107_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_108_113
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[109:108]),
        .DIB(DI[111:110]),
        .DIC(DI[113:112]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_108_113_n_0,RAM_reg_0_31_108_113_n_1}),
        .DOB({RAM_reg_0_31_108_113_n_2,RAM_reg_0_31_108_113_n_3}),
        .DOC({RAM_reg_0_31_108_113_n_4,RAM_reg_0_31_108_113_n_5}),
        .DOD(NLW_RAM_reg_0_31_108_113_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_114_119
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[115:114]),
        .DIB(DI[117:116]),
        .DIC(DI[119:118]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_114_119_n_0,RAM_reg_0_31_114_119_n_1}),
        .DOB({RAM_reg_0_31_114_119_n_2,RAM_reg_0_31_114_119_n_3}),
        .DOC({RAM_reg_0_31_114_119_n_4,RAM_reg_0_31_114_119_n_5}),
        .DOD(NLW_RAM_reg_0_31_114_119_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_120_125
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[121:120]),
        .DIB(DI[123:122]),
        .DIC(DI[125:124]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_120_125_n_0,RAM_reg_0_31_120_125_n_1}),
        .DOB({RAM_reg_0_31_120_125_n_2,RAM_reg_0_31_120_125_n_3}),
        .DOC({RAM_reg_0_31_120_125_n_4,RAM_reg_0_31_120_125_n_5}),
        .DOD(NLW_RAM_reg_0_31_120_125_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_126_131
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[127:126]),
        .DIB(DI[129:128]),
        .DIC(DI[131:130]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_126_131_n_0,RAM_reg_0_31_126_131_n_1}),
        .DOB({RAM_reg_0_31_126_131_n_2,RAM_reg_0_31_126_131_n_3}),
        .DOC({RAM_reg_0_31_126_131_n_4,RAM_reg_0_31_126_131_n_5}),
        .DOD(NLW_RAM_reg_0_31_126_131_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_12_17
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[13:12]),
        .DIB(DI[15:14]),
        .DIC(DI[17:16]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_12_17_n_0,RAM_reg_0_31_12_17_n_1}),
        .DOB({RAM_reg_0_31_12_17_n_2,RAM_reg_0_31_12_17_n_3}),
        .DOC({RAM_reg_0_31_12_17_n_4,RAM_reg_0_31_12_17_n_5}),
        .DOD(NLW_RAM_reg_0_31_12_17_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_132_137
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[133:132]),
        .DIB(DI[135:134]),
        .DIC(DI[137:136]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_132_137_n_0,RAM_reg_0_31_132_137_n_1}),
        .DOB({RAM_reg_0_31_132_137_n_2,RAM_reg_0_31_132_137_n_3}),
        .DOC({RAM_reg_0_31_132_137_n_4,RAM_reg_0_31_132_137_n_5}),
        .DOD(NLW_RAM_reg_0_31_132_137_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_138_143
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[139:138]),
        .DIB(DI[141:140]),
        .DIC(DI[143:142]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_138_143_n_0,RAM_reg_0_31_138_143_n_1}),
        .DOB({RAM_reg_0_31_138_143_n_2,RAM_reg_0_31_138_143_n_3}),
        .DOC({RAM_reg_0_31_138_143_n_4,RAM_reg_0_31_138_143_n_5}),
        .DOD(NLW_RAM_reg_0_31_138_143_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_144_149
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[145:144]),
        .DIB(DI[147:146]),
        .DIC(DI[149:148]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_144_149_n_0,RAM_reg_0_31_144_149_n_1}),
        .DOB({RAM_reg_0_31_144_149_n_2,RAM_reg_0_31_144_149_n_3}),
        .DOC({RAM_reg_0_31_144_149_n_4,RAM_reg_0_31_144_149_n_5}),
        .DOD(NLW_RAM_reg_0_31_144_149_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_150_155
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[151:150]),
        .DIB(DI[153:152]),
        .DIC(DI[155:154]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_150_155_n_0,RAM_reg_0_31_150_155_n_1}),
        .DOB({RAM_reg_0_31_150_155_n_2,RAM_reg_0_31_150_155_n_3}),
        .DOC({RAM_reg_0_31_150_155_n_4,RAM_reg_0_31_150_155_n_5}),
        .DOD(NLW_RAM_reg_0_31_150_155_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_156_161
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[157:156]),
        .DIB(DI[159:158]),
        .DIC(DI[161:160]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_156_161_n_0,RAM_reg_0_31_156_161_n_1}),
        .DOB({RAM_reg_0_31_156_161_n_2,RAM_reg_0_31_156_161_n_3}),
        .DOC({RAM_reg_0_31_156_161_n_4,RAM_reg_0_31_156_161_n_5}),
        .DOD(NLW_RAM_reg_0_31_156_161_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_162_167
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[163:162]),
        .DIB(DI[165:164]),
        .DIC(DI[167:166]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_162_167_n_0,RAM_reg_0_31_162_167_n_1}),
        .DOB({RAM_reg_0_31_162_167_n_2,RAM_reg_0_31_162_167_n_3}),
        .DOC({RAM_reg_0_31_162_167_n_4,RAM_reg_0_31_162_167_n_5}),
        .DOD(NLW_RAM_reg_0_31_162_167_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_168_173
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[169:168]),
        .DIB(DI[171:170]),
        .DIC(DI[173:172]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_168_173_n_0,RAM_reg_0_31_168_173_n_1}),
        .DOB({RAM_reg_0_31_168_173_n_2,RAM_reg_0_31_168_173_n_3}),
        .DOC({RAM_reg_0_31_168_173_n_4,RAM_reg_0_31_168_173_n_5}),
        .DOD(NLW_RAM_reg_0_31_168_173_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_174_179
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[175:174]),
        .DIB(DI[177:176]),
        .DIC(DI[179:178]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_174_179_n_0,RAM_reg_0_31_174_179_n_1}),
        .DOB({RAM_reg_0_31_174_179_n_2,RAM_reg_0_31_174_179_n_3}),
        .DOC({RAM_reg_0_31_174_179_n_4,RAM_reg_0_31_174_179_n_5}),
        .DOD(NLW_RAM_reg_0_31_174_179_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_180_185
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[181:180]),
        .DIB(DI[183:182]),
        .DIC(DI[185:184]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_180_185_n_0,RAM_reg_0_31_180_185_n_1}),
        .DOB({RAM_reg_0_31_180_185_n_2,RAM_reg_0_31_180_185_n_3}),
        .DOC({RAM_reg_0_31_180_185_n_4,RAM_reg_0_31_180_185_n_5}),
        .DOD(NLW_RAM_reg_0_31_180_185_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_186_191
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[187:186]),
        .DIB(DI[189:188]),
        .DIC(DI[191:190]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_186_191_n_0,RAM_reg_0_31_186_191_n_1}),
        .DOB({RAM_reg_0_31_186_191_n_2,RAM_reg_0_31_186_191_n_3}),
        .DOC({RAM_reg_0_31_186_191_n_4,RAM_reg_0_31_186_191_n_5}),
        .DOD(NLW_RAM_reg_0_31_186_191_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_18_23
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[19:18]),
        .DIB(DI[21:20]),
        .DIC(DI[23:22]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_18_23_n_0,RAM_reg_0_31_18_23_n_1}),
        .DOB({RAM_reg_0_31_18_23_n_2,RAM_reg_0_31_18_23_n_3}),
        .DOC({RAM_reg_0_31_18_23_n_4,RAM_reg_0_31_18_23_n_5}),
        .DOD(NLW_RAM_reg_0_31_18_23_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_192_197
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[193:192]),
        .DIB(DI[195:194]),
        .DIC(DI[197:196]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_192_197_n_0,RAM_reg_0_31_192_197_n_1}),
        .DOB({RAM_reg_0_31_192_197_n_2,RAM_reg_0_31_192_197_n_3}),
        .DOC({RAM_reg_0_31_192_197_n_4,RAM_reg_0_31_192_197_n_5}),
        .DOD(NLW_RAM_reg_0_31_192_197_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_198_203
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[199:198]),
        .DIB(DI[201:200]),
        .DIC(DI[203:202]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_198_203_n_0,RAM_reg_0_31_198_203_n_1}),
        .DOB({RAM_reg_0_31_198_203_n_2,RAM_reg_0_31_198_203_n_3}),
        .DOC({RAM_reg_0_31_198_203_n_4,RAM_reg_0_31_198_203_n_5}),
        .DOD(NLW_RAM_reg_0_31_198_203_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_204_209
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[205:204]),
        .DIB(DI[207:206]),
        .DIC(DI[209:208]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_204_209_n_0,RAM_reg_0_31_204_209_n_1}),
        .DOB({RAM_reg_0_31_204_209_n_2,RAM_reg_0_31_204_209_n_3}),
        .DOC({RAM_reg_0_31_204_209_n_4,RAM_reg_0_31_204_209_n_5}),
        .DOD(NLW_RAM_reg_0_31_204_209_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_210_215
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[211:210]),
        .DIB(DI[213:212]),
        .DIC(DI[215:214]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_210_215_n_0,RAM_reg_0_31_210_215_n_1}),
        .DOB({RAM_reg_0_31_210_215_n_2,RAM_reg_0_31_210_215_n_3}),
        .DOC({RAM_reg_0_31_210_215_n_4,RAM_reg_0_31_210_215_n_5}),
        .DOD(NLW_RAM_reg_0_31_210_215_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_216_221
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[217:216]),
        .DIB(DI[219:218]),
        .DIC(DI[221:220]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_216_221_n_0,RAM_reg_0_31_216_221_n_1}),
        .DOB({RAM_reg_0_31_216_221_n_2,RAM_reg_0_31_216_221_n_3}),
        .DOC({RAM_reg_0_31_216_221_n_4,RAM_reg_0_31_216_221_n_5}),
        .DOD(NLW_RAM_reg_0_31_216_221_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_222_227
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[223:222]),
        .DIB(DI[225:224]),
        .DIC(DI[227:226]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_222_227_n_0,RAM_reg_0_31_222_227_n_1}),
        .DOB({RAM_reg_0_31_222_227_n_2,RAM_reg_0_31_222_227_n_3}),
        .DOC({RAM_reg_0_31_222_227_n_4,RAM_reg_0_31_222_227_n_5}),
        .DOD(NLW_RAM_reg_0_31_222_227_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_228_233
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[229:228]),
        .DIB(DI[231:230]),
        .DIC(DI[233:232]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_228_233_n_0,RAM_reg_0_31_228_233_n_1}),
        .DOB({RAM_reg_0_31_228_233_n_2,RAM_reg_0_31_228_233_n_3}),
        .DOC({RAM_reg_0_31_228_233_n_4,RAM_reg_0_31_228_233_n_5}),
        .DOD(NLW_RAM_reg_0_31_228_233_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_234_239
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[235:234]),
        .DIB(DI[237:236]),
        .DIC(DI[239:238]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_234_239_n_0,RAM_reg_0_31_234_239_n_1}),
        .DOB({RAM_reg_0_31_234_239_n_2,RAM_reg_0_31_234_239_n_3}),
        .DOC({RAM_reg_0_31_234_239_n_4,RAM_reg_0_31_234_239_n_5}),
        .DOD(NLW_RAM_reg_0_31_234_239_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_240_245
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[241:240]),
        .DIB(DI[243:242]),
        .DIC(DI[245:244]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_240_245_n_0,RAM_reg_0_31_240_245_n_1}),
        .DOB({RAM_reg_0_31_240_245_n_2,RAM_reg_0_31_240_245_n_3}),
        .DOC({RAM_reg_0_31_240_245_n_4,RAM_reg_0_31_240_245_n_5}),
        .DOD(NLW_RAM_reg_0_31_240_245_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_246_251
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[247:246]),
        .DIB(DI[249:248]),
        .DIC(DI[251:250]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_246_251_n_0,RAM_reg_0_31_246_251_n_1}),
        .DOB({RAM_reg_0_31_246_251_n_2,RAM_reg_0_31_246_251_n_3}),
        .DOC({RAM_reg_0_31_246_251_n_4,RAM_reg_0_31_246_251_n_5}),
        .DOD(NLW_RAM_reg_0_31_246_251_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_24_29
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[25:24]),
        .DIB(DI[27:26]),
        .DIC(DI[29:28]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_24_29_n_0,RAM_reg_0_31_24_29_n_1}),
        .DOB({RAM_reg_0_31_24_29_n_2,RAM_reg_0_31_24_29_n_3}),
        .DOC({RAM_reg_0_31_24_29_n_4,RAM_reg_0_31_24_29_n_5}),
        .DOD(NLW_RAM_reg_0_31_24_29_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_252_257
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[253:252]),
        .DIB(DI[255:254]),
        .DIC(DI[257:256]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_252_257_n_0,RAM_reg_0_31_252_257_n_1}),
        .DOB({RAM_reg_0_31_252_257_n_2,RAM_reg_0_31_252_257_n_3}),
        .DOC({RAM_reg_0_31_252_257_n_4,RAM_reg_0_31_252_257_n_5}),
        .DOD(NLW_RAM_reg_0_31_252_257_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_258_263
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[259:258]),
        .DIB(DI[261:260]),
        .DIC(DI[263:262]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_258_263_n_0,RAM_reg_0_31_258_263_n_1}),
        .DOB({RAM_reg_0_31_258_263_n_2,RAM_reg_0_31_258_263_n_3}),
        .DOC({RAM_reg_0_31_258_263_n_4,RAM_reg_0_31_258_263_n_5}),
        .DOD(NLW_RAM_reg_0_31_258_263_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_264_269
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[265:264]),
        .DIB(DI[267:266]),
        .DIC(DI[269:268]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_264_269_n_0,RAM_reg_0_31_264_269_n_1}),
        .DOB({RAM_reg_0_31_264_269_n_2,RAM_reg_0_31_264_269_n_3}),
        .DOC({RAM_reg_0_31_264_269_n_4,RAM_reg_0_31_264_269_n_5}),
        .DOD(NLW_RAM_reg_0_31_264_269_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_270_272
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[271:270]),
        .DIB({1'b0,DI[272]}),
        .DIC({1'b0,1'b0}),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_270_272_n_0,RAM_reg_0_31_270_272_n_1}),
        .DOB({NLW_RAM_reg_0_31_270_272_DOB_UNCONNECTED[1],RAM_reg_0_31_270_272_n_3}),
        .DOC(NLW_RAM_reg_0_31_270_272_DOC_UNCONNECTED[1:0]),
        .DOD(NLW_RAM_reg_0_31_270_272_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_30_35
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[31:30]),
        .DIB(DI[33:32]),
        .DIC(DI[35:34]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_30_35_n_0,RAM_reg_0_31_30_35_n_1}),
        .DOB({RAM_reg_0_31_30_35_n_2,RAM_reg_0_31_30_35_n_3}),
        .DOC({RAM_reg_0_31_30_35_n_4,RAM_reg_0_31_30_35_n_5}),
        .DOD(NLW_RAM_reg_0_31_30_35_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_36_41
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[37:36]),
        .DIB(DI[39:38]),
        .DIC(DI[41:40]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_36_41_n_0,RAM_reg_0_31_36_41_n_1}),
        .DOB({RAM_reg_0_31_36_41_n_2,RAM_reg_0_31_36_41_n_3}),
        .DOC({RAM_reg_0_31_36_41_n_4,RAM_reg_0_31_36_41_n_5}),
        .DOD(NLW_RAM_reg_0_31_36_41_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_42_47
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[43:42]),
        .DIB(DI[45:44]),
        .DIC(DI[47:46]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_42_47_n_0,RAM_reg_0_31_42_47_n_1}),
        .DOB({RAM_reg_0_31_42_47_n_2,RAM_reg_0_31_42_47_n_3}),
        .DOC({RAM_reg_0_31_42_47_n_4,RAM_reg_0_31_42_47_n_5}),
        .DOD(NLW_RAM_reg_0_31_42_47_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_48_53
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[49:48]),
        .DIB(DI[51:50]),
        .DIC(DI[53:52]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_48_53_n_0,RAM_reg_0_31_48_53_n_1}),
        .DOB({RAM_reg_0_31_48_53_n_2,RAM_reg_0_31_48_53_n_3}),
        .DOC({RAM_reg_0_31_48_53_n_4,RAM_reg_0_31_48_53_n_5}),
        .DOD(NLW_RAM_reg_0_31_48_53_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_54_59
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[55:54]),
        .DIB(DI[57:56]),
        .DIC(DI[59:58]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_54_59_n_0,RAM_reg_0_31_54_59_n_1}),
        .DOB({RAM_reg_0_31_54_59_n_2,RAM_reg_0_31_54_59_n_3}),
        .DOC({RAM_reg_0_31_54_59_n_4,RAM_reg_0_31_54_59_n_5}),
        .DOD(NLW_RAM_reg_0_31_54_59_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_60_65
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[61:60]),
        .DIB(DI[63:62]),
        .DIC(DI[65:64]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_60_65_n_0,RAM_reg_0_31_60_65_n_1}),
        .DOB({RAM_reg_0_31_60_65_n_2,RAM_reg_0_31_60_65_n_3}),
        .DOC({RAM_reg_0_31_60_65_n_4,RAM_reg_0_31_60_65_n_5}),
        .DOD(NLW_RAM_reg_0_31_60_65_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_66_71
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[67:66]),
        .DIB(DI[69:68]),
        .DIC(DI[71:70]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_66_71_n_0,RAM_reg_0_31_66_71_n_1}),
        .DOB({RAM_reg_0_31_66_71_n_2,RAM_reg_0_31_66_71_n_3}),
        .DOC({RAM_reg_0_31_66_71_n_4,RAM_reg_0_31_66_71_n_5}),
        .DOD(NLW_RAM_reg_0_31_66_71_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_6_11
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[7:6]),
        .DIB(DI[9:8]),
        .DIC(DI[11:10]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_6_11_n_0,RAM_reg_0_31_6_11_n_1}),
        .DOB({RAM_reg_0_31_6_11_n_2,RAM_reg_0_31_6_11_n_3}),
        .DOC({RAM_reg_0_31_6_11_n_4,RAM_reg_0_31_6_11_n_5}),
        .DOD(NLW_RAM_reg_0_31_6_11_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_72_77
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[73:72]),
        .DIB(DI[75:74]),
        .DIC(DI[77:76]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_72_77_n_0,RAM_reg_0_31_72_77_n_1}),
        .DOB({RAM_reg_0_31_72_77_n_2,RAM_reg_0_31_72_77_n_3}),
        .DOC({RAM_reg_0_31_72_77_n_4,RAM_reg_0_31_72_77_n_5}),
        .DOD(NLW_RAM_reg_0_31_72_77_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_78_83
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[79:78]),
        .DIB(DI[81:80]),
        .DIC(DI[83:82]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_78_83_n_0,RAM_reg_0_31_78_83_n_1}),
        .DOB({RAM_reg_0_31_78_83_n_2,RAM_reg_0_31_78_83_n_3}),
        .DOC({RAM_reg_0_31_78_83_n_4,RAM_reg_0_31_78_83_n_5}),
        .DOD(NLW_RAM_reg_0_31_78_83_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_84_89
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[85:84]),
        .DIB(DI[87:86]),
        .DIC(DI[89:88]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_84_89_n_0,RAM_reg_0_31_84_89_n_1}),
        .DOB({RAM_reg_0_31_84_89_n_2,RAM_reg_0_31_84_89_n_3}),
        .DOC({RAM_reg_0_31_84_89_n_4,RAM_reg_0_31_84_89_n_5}),
        .DOD(NLW_RAM_reg_0_31_84_89_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_90_95
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[91:90]),
        .DIB(DI[93:92]),
        .DIC(DI[95:94]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_90_95_n_0,RAM_reg_0_31_90_95_n_1}),
        .DOB({RAM_reg_0_31_90_95_n_2,RAM_reg_0_31_90_95_n_3}),
        .DOC({RAM_reg_0_31_90_95_n_4,RAM_reg_0_31_90_95_n_5}),
        .DOD(NLW_RAM_reg_0_31_90_95_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  (* METHODOLOGY_DRC_VIOS = "" *) 
  RAM32M RAM_reg_0_31_96_101
       (.ADDRA(\gc0.count_d1_reg[4] ),
        .ADDRB(\gc0.count_d1_reg[4] ),
        .ADDRC(\gc0.count_d1_reg[4] ),
        .ADDRD(\gic0.gc0.count_d2_reg[4] ),
        .DIA(DI[97:96]),
        .DIB(DI[99:98]),
        .DIC(DI[101:100]),
        .DID({1'b0,1'b0}),
        .DOA({RAM_reg_0_31_96_101_n_0,RAM_reg_0_31_96_101_n_1}),
        .DOB({RAM_reg_0_31_96_101_n_2,RAM_reg_0_31_96_101_n_3}),
        .DOC({RAM_reg_0_31_96_101_n_4,RAM_reg_0_31_96_101_n_5}),
        .DOD(NLW_RAM_reg_0_31_96_101_DOD_UNCONNECTED[1:0]),
        .WCLK(s_aclk),
        .WE(ram_full_fb_i_reg));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[0] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_0_5_n_1),
        .Q(dout_i[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[100] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_96_101_n_5),
        .Q(dout_i[100]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[101] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_96_101_n_4),
        .Q(dout_i[101]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[102] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_102_107_n_1),
        .Q(dout_i[102]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[103] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_102_107_n_0),
        .Q(dout_i[103]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[104] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_102_107_n_3),
        .Q(dout_i[104]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[105] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_102_107_n_2),
        .Q(dout_i[105]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[106] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_102_107_n_5),
        .Q(dout_i[106]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[107] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_102_107_n_4),
        .Q(dout_i[107]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[108] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_108_113_n_1),
        .Q(dout_i[108]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[109] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_108_113_n_0),
        .Q(dout_i[109]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[10] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_6_11_n_5),
        .Q(dout_i[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[110] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_108_113_n_3),
        .Q(dout_i[110]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[111] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_108_113_n_2),
        .Q(dout_i[111]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[112] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_108_113_n_5),
        .Q(dout_i[112]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[113] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_108_113_n_4),
        .Q(dout_i[113]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[114] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_114_119_n_1),
        .Q(dout_i[114]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[115] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_114_119_n_0),
        .Q(dout_i[115]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[116] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_114_119_n_3),
        .Q(dout_i[116]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[117] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_114_119_n_2),
        .Q(dout_i[117]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[118] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_114_119_n_5),
        .Q(dout_i[118]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[119] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_114_119_n_4),
        .Q(dout_i[119]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[11] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_6_11_n_4),
        .Q(dout_i[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[120] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_120_125_n_1),
        .Q(dout_i[120]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[121] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_120_125_n_0),
        .Q(dout_i[121]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[122] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_120_125_n_3),
        .Q(dout_i[122]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[123] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_120_125_n_2),
        .Q(dout_i[123]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[124] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_120_125_n_5),
        .Q(dout_i[124]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[125] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_120_125_n_4),
        .Q(dout_i[125]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[126] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_126_131_n_1),
        .Q(dout_i[126]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[127] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_126_131_n_0),
        .Q(dout_i[127]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[128] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_126_131_n_3),
        .Q(dout_i[128]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[129] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_126_131_n_2),
        .Q(dout_i[129]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[12] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_12_17_n_1),
        .Q(dout_i[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[130] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_126_131_n_5),
        .Q(dout_i[130]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[131] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_126_131_n_4),
        .Q(dout_i[131]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[132] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_132_137_n_1),
        .Q(dout_i[132]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[133] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_132_137_n_0),
        .Q(dout_i[133]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[134] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_132_137_n_3),
        .Q(dout_i[134]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[135] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_132_137_n_2),
        .Q(dout_i[135]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[136] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_132_137_n_5),
        .Q(dout_i[136]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[137] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_132_137_n_4),
        .Q(dout_i[137]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[138] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_138_143_n_1),
        .Q(dout_i[138]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[139] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_138_143_n_0),
        .Q(dout_i[139]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[13] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_12_17_n_0),
        .Q(dout_i[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[140] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_138_143_n_3),
        .Q(dout_i[140]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[141] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_138_143_n_2),
        .Q(dout_i[141]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[142] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_138_143_n_5),
        .Q(dout_i[142]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[143] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_138_143_n_4),
        .Q(dout_i[143]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[144] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_144_149_n_1),
        .Q(dout_i[144]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[145] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_144_149_n_0),
        .Q(dout_i[145]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[146] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_144_149_n_3),
        .Q(dout_i[146]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[147] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_144_149_n_2),
        .Q(dout_i[147]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[148] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_144_149_n_5),
        .Q(dout_i[148]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[149] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_144_149_n_4),
        .Q(dout_i[149]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[14] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_12_17_n_3),
        .Q(dout_i[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[150] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_150_155_n_1),
        .Q(dout_i[150]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[151] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_150_155_n_0),
        .Q(dout_i[151]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[152] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_150_155_n_3),
        .Q(dout_i[152]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[153] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_150_155_n_2),
        .Q(dout_i[153]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[154] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_150_155_n_5),
        .Q(dout_i[154]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[155] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_150_155_n_4),
        .Q(dout_i[155]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[156] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_156_161_n_1),
        .Q(dout_i[156]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[157] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_156_161_n_0),
        .Q(dout_i[157]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[158] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_156_161_n_3),
        .Q(dout_i[158]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[159] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_156_161_n_2),
        .Q(dout_i[159]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[15] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_12_17_n_2),
        .Q(dout_i[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[160] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_156_161_n_5),
        .Q(dout_i[160]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[161] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_156_161_n_4),
        .Q(dout_i[161]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[162] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_162_167_n_1),
        .Q(dout_i[162]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[163] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_162_167_n_0),
        .Q(dout_i[163]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[164] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_162_167_n_3),
        .Q(dout_i[164]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[165] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_162_167_n_2),
        .Q(dout_i[165]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[166] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_162_167_n_5),
        .Q(dout_i[166]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[167] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_162_167_n_4),
        .Q(dout_i[167]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[168] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_168_173_n_1),
        .Q(dout_i[168]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[169] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_168_173_n_0),
        .Q(dout_i[169]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[16] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_12_17_n_5),
        .Q(dout_i[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[170] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_168_173_n_3),
        .Q(dout_i[170]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[171] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_168_173_n_2),
        .Q(dout_i[171]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[172] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_168_173_n_5),
        .Q(dout_i[172]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[173] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_168_173_n_4),
        .Q(dout_i[173]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[174] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_174_179_n_1),
        .Q(dout_i[174]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[175] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_174_179_n_0),
        .Q(dout_i[175]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[176] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_174_179_n_3),
        .Q(dout_i[176]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[177] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_174_179_n_2),
        .Q(dout_i[177]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[178] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_174_179_n_5),
        .Q(dout_i[178]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[179] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_174_179_n_4),
        .Q(dout_i[179]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[17] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_12_17_n_4),
        .Q(dout_i[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[180] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_180_185_n_1),
        .Q(dout_i[180]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[181] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_180_185_n_0),
        .Q(dout_i[181]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[182] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_180_185_n_3),
        .Q(dout_i[182]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[183] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_180_185_n_2),
        .Q(dout_i[183]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[184] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_180_185_n_5),
        .Q(dout_i[184]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[185] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_180_185_n_4),
        .Q(dout_i[185]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[186] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_186_191_n_1),
        .Q(dout_i[186]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[187] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_186_191_n_0),
        .Q(dout_i[187]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[188] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_186_191_n_3),
        .Q(dout_i[188]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[189] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_186_191_n_2),
        .Q(dout_i[189]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[18] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_18_23_n_1),
        .Q(dout_i[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[190] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_186_191_n_5),
        .Q(dout_i[190]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[191] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_186_191_n_4),
        .Q(dout_i[191]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[192] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_192_197_n_1),
        .Q(dout_i[192]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[193] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_192_197_n_0),
        .Q(dout_i[193]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[194] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_192_197_n_3),
        .Q(dout_i[194]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[195] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_192_197_n_2),
        .Q(dout_i[195]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[196] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_192_197_n_5),
        .Q(dout_i[196]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[197] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_192_197_n_4),
        .Q(dout_i[197]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[198] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_198_203_n_1),
        .Q(dout_i[198]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[199] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_198_203_n_0),
        .Q(dout_i[199]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[19] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_18_23_n_0),
        .Q(dout_i[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[1] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_0_5_n_0),
        .Q(dout_i[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[200] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_198_203_n_3),
        .Q(dout_i[200]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[201] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_198_203_n_2),
        .Q(dout_i[201]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[202] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_198_203_n_5),
        .Q(dout_i[202]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[203] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_198_203_n_4),
        .Q(dout_i[203]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[204] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_204_209_n_1),
        .Q(dout_i[204]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[205] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_204_209_n_0),
        .Q(dout_i[205]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[206] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_204_209_n_3),
        .Q(dout_i[206]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[207] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_204_209_n_2),
        .Q(dout_i[207]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[208] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_204_209_n_5),
        .Q(dout_i[208]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[209] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_204_209_n_4),
        .Q(dout_i[209]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[20] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_18_23_n_3),
        .Q(dout_i[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[210] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_210_215_n_1),
        .Q(dout_i[210]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[211] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_210_215_n_0),
        .Q(dout_i[211]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[212] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_210_215_n_3),
        .Q(dout_i[212]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[213] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_210_215_n_2),
        .Q(dout_i[213]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[214] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_210_215_n_5),
        .Q(dout_i[214]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[215] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_210_215_n_4),
        .Q(dout_i[215]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[216] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_216_221_n_1),
        .Q(dout_i[216]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[217] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_216_221_n_0),
        .Q(dout_i[217]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[218] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_216_221_n_3),
        .Q(dout_i[218]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[219] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_216_221_n_2),
        .Q(dout_i[219]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[21] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_18_23_n_2),
        .Q(dout_i[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[220] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_216_221_n_5),
        .Q(dout_i[220]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[221] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_216_221_n_4),
        .Q(dout_i[221]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[222] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_222_227_n_1),
        .Q(dout_i[222]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[223] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_222_227_n_0),
        .Q(dout_i[223]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[224] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_222_227_n_3),
        .Q(dout_i[224]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[225] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_222_227_n_2),
        .Q(dout_i[225]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[226] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_222_227_n_5),
        .Q(dout_i[226]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[227] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_222_227_n_4),
        .Q(dout_i[227]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[228] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_228_233_n_1),
        .Q(dout_i[228]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[229] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_228_233_n_0),
        .Q(dout_i[229]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[22] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_18_23_n_5),
        .Q(dout_i[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[230] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_228_233_n_3),
        .Q(dout_i[230]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[231] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_228_233_n_2),
        .Q(dout_i[231]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[232] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_228_233_n_5),
        .Q(dout_i[232]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[233] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_228_233_n_4),
        .Q(dout_i[233]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[234] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_234_239_n_1),
        .Q(dout_i[234]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[235] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_234_239_n_0),
        .Q(dout_i[235]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[236] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_234_239_n_3),
        .Q(dout_i[236]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[237] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_234_239_n_2),
        .Q(dout_i[237]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[238] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_234_239_n_5),
        .Q(dout_i[238]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[239] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_234_239_n_4),
        .Q(dout_i[239]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[23] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_18_23_n_4),
        .Q(dout_i[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[240] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_240_245_n_1),
        .Q(dout_i[240]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[241] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_240_245_n_0),
        .Q(dout_i[241]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[242] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_240_245_n_3),
        .Q(dout_i[242]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[243] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_240_245_n_2),
        .Q(dout_i[243]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[244] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_240_245_n_5),
        .Q(dout_i[244]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[245] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_240_245_n_4),
        .Q(dout_i[245]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[246] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_246_251_n_1),
        .Q(dout_i[246]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[247] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_246_251_n_0),
        .Q(dout_i[247]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[248] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_246_251_n_3),
        .Q(dout_i[248]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[249] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_246_251_n_2),
        .Q(dout_i[249]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[24] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_24_29_n_1),
        .Q(dout_i[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[250] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_246_251_n_5),
        .Q(dout_i[250]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[251] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_246_251_n_4),
        .Q(dout_i[251]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[252] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_252_257_n_1),
        .Q(dout_i[252]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[253] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_252_257_n_0),
        .Q(dout_i[253]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[254] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_252_257_n_3),
        .Q(dout_i[254]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[255] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_252_257_n_2),
        .Q(dout_i[255]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[256] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_252_257_n_5),
        .Q(dout_i[256]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[257] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_252_257_n_4),
        .Q(dout_i[257]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[258] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_258_263_n_1),
        .Q(dout_i[258]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[259] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_258_263_n_0),
        .Q(dout_i[259]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[25] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_24_29_n_0),
        .Q(dout_i[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[260] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_258_263_n_3),
        .Q(dout_i[260]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[261] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_258_263_n_2),
        .Q(dout_i[261]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[262] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_258_263_n_5),
        .Q(dout_i[262]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[263] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_258_263_n_4),
        .Q(dout_i[263]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[264] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_264_269_n_1),
        .Q(dout_i[264]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[265] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_264_269_n_0),
        .Q(dout_i[265]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[266] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_264_269_n_3),
        .Q(dout_i[266]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[267] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_264_269_n_2),
        .Q(dout_i[267]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[268] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_264_269_n_5),
        .Q(dout_i[268]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[269] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_264_269_n_4),
        .Q(dout_i[269]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[26] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_24_29_n_3),
        .Q(dout_i[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[270] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_270_272_n_1),
        .Q(dout_i[270]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[271] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_270_272_n_0),
        .Q(dout_i[271]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[272] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_270_272_n_3),
        .Q(dout_i[272]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[27] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_24_29_n_2),
        .Q(dout_i[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[28] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_24_29_n_5),
        .Q(dout_i[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[29] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_24_29_n_4),
        .Q(dout_i[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[2] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_0_5_n_3),
        .Q(dout_i[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[30] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_30_35_n_1),
        .Q(dout_i[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[31] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_30_35_n_0),
        .Q(dout_i[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[32] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_30_35_n_3),
        .Q(dout_i[32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[33] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_30_35_n_2),
        .Q(dout_i[33]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[34] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_30_35_n_5),
        .Q(dout_i[34]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[35] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_30_35_n_4),
        .Q(dout_i[35]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[36] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_36_41_n_1),
        .Q(dout_i[36]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[37] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_36_41_n_0),
        .Q(dout_i[37]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[38] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_36_41_n_3),
        .Q(dout_i[38]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[39] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_36_41_n_2),
        .Q(dout_i[39]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[3] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_0_5_n_2),
        .Q(dout_i[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[40] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_36_41_n_5),
        .Q(dout_i[40]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[41] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_36_41_n_4),
        .Q(dout_i[41]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[42] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_42_47_n_1),
        .Q(dout_i[42]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[43] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_42_47_n_0),
        .Q(dout_i[43]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[44] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_42_47_n_3),
        .Q(dout_i[44]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[45] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_42_47_n_2),
        .Q(dout_i[45]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[46] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_42_47_n_5),
        .Q(dout_i[46]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[47] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_42_47_n_4),
        .Q(dout_i[47]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[48] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_48_53_n_1),
        .Q(dout_i[48]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[49] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_48_53_n_0),
        .Q(dout_i[49]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[4] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_0_5_n_5),
        .Q(dout_i[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[50] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_48_53_n_3),
        .Q(dout_i[50]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[51] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_48_53_n_2),
        .Q(dout_i[51]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[52] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_48_53_n_5),
        .Q(dout_i[52]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[53] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_48_53_n_4),
        .Q(dout_i[53]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[54] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_54_59_n_1),
        .Q(dout_i[54]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[55] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_54_59_n_0),
        .Q(dout_i[55]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[56] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_54_59_n_3),
        .Q(dout_i[56]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[57] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_54_59_n_2),
        .Q(dout_i[57]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[58] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_54_59_n_5),
        .Q(dout_i[58]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[59] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_54_59_n_4),
        .Q(dout_i[59]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[5] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_0_5_n_4),
        .Q(dout_i[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[60] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_60_65_n_1),
        .Q(dout_i[60]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[61] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_60_65_n_0),
        .Q(dout_i[61]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[62] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_60_65_n_3),
        .Q(dout_i[62]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[63] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_60_65_n_2),
        .Q(dout_i[63]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[64] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_60_65_n_5),
        .Q(dout_i[64]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[65] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_60_65_n_4),
        .Q(dout_i[65]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[66] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_66_71_n_1),
        .Q(dout_i[66]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[67] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_66_71_n_0),
        .Q(dout_i[67]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[68] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_66_71_n_3),
        .Q(dout_i[68]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[69] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_66_71_n_2),
        .Q(dout_i[69]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[6] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_6_11_n_1),
        .Q(dout_i[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[70] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_66_71_n_5),
        .Q(dout_i[70]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[71] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_66_71_n_4),
        .Q(dout_i[71]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[72] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_72_77_n_1),
        .Q(dout_i[72]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[73] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_72_77_n_0),
        .Q(dout_i[73]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[74] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_72_77_n_3),
        .Q(dout_i[74]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[75] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_72_77_n_2),
        .Q(dout_i[75]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[76] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_72_77_n_5),
        .Q(dout_i[76]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[77] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_72_77_n_4),
        .Q(dout_i[77]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[78] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_78_83_n_1),
        .Q(dout_i[78]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[79] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_78_83_n_0),
        .Q(dout_i[79]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[7] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_6_11_n_0),
        .Q(dout_i[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[80] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_78_83_n_3),
        .Q(dout_i[80]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[81] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_78_83_n_2),
        .Q(dout_i[81]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[82] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_78_83_n_5),
        .Q(dout_i[82]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[83] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_78_83_n_4),
        .Q(dout_i[83]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[84] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_84_89_n_1),
        .Q(dout_i[84]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[85] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_84_89_n_0),
        .Q(dout_i[85]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[86] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_84_89_n_3),
        .Q(dout_i[86]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[87] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_84_89_n_2),
        .Q(dout_i[87]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[88] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_84_89_n_5),
        .Q(dout_i[88]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[89] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_84_89_n_4),
        .Q(dout_i[89]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[8] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_6_11_n_3),
        .Q(dout_i[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[90] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_90_95_n_1),
        .Q(dout_i[90]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[91] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_90_95_n_0),
        .Q(dout_i[91]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[92] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_90_95_n_3),
        .Q(dout_i[92]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[93] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_90_95_n_2),
        .Q(dout_i[93]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[94] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_90_95_n_5),
        .Q(dout_i[94]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[95] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_90_95_n_4),
        .Q(dout_i[95]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[96] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_96_101_n_1),
        .Q(dout_i[96]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[97] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_96_101_n_0),
        .Q(dout_i[97]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[98] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_96_101_n_3),
        .Q(dout_i[98]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[99] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_96_101_n_2),
        .Q(dout_i[99]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \gpr1.dout_i_reg[9] 
       (.C(m_aclk),
        .CE(\gpregsm1.curr_fwft_state_reg[1] ),
        .D(RAM_reg_0_31_6_11_n_2),
        .Q(dout_i[9]),
        .R(1'b0));
endmodule

module control_sub_axis_fifo_10g_tx_0_fifo_generator_ramfifo
   (Q,
    axis_rd_data_count,
    axis_wr_data_count,
    s_axis_tready,
    m_axis_tvalid,
    m_aclk,
    s_aclk,
    DI,
    m_axis_tready,
    s_axis_tvalid,
    s_aresetn);
  output [272:0]Q;
  output [5:0]axis_rd_data_count;
  output [5:0]axis_wr_data_count;
  output s_axis_tready;
  output m_axis_tvalid;
  input m_aclk;
  input s_aclk;
  input [272:0]DI;
  input m_axis_tready;
  input s_axis_tvalid;
  input s_aresetn;

  wire [272:0]DI;
  wire [272:0]Q;
  wire [5:0]axis_rd_data_count;
  wire [5:0]axis_wr_data_count;
  wire [3:0]bin2gray;
  wire \gntv_or_sync_fifo.gcx.clkx_n_11 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_12 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_18 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_19 ;
  wire \gntv_or_sync_fifo.gcx.clkx_n_5 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_10 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_11 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_5 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_7 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_8 ;
  wire \gntv_or_sync_fifo.gl0.rd_n_9 ;
  wire \gntv_or_sync_fifo.gl0.wr_n_11 ;
  wire [0:0]gray2bin;
  wire m_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire [4:0]p_0_out_0;
  wire [4:0]p_12_out;
  wire [3:3]p_13_out;
  wire p_18_out;
  wire [4:0]p_22_out;
  wire [4:0]p_23_out;
  wire [4:0]p_5_out;
  wire ram_rd_en_i;
  wire [4:0]rd_pntr_plus1;
  wire [2:0]rd_rst_i;
  wire rst_full_ff_i;
  wire rstblk_n_6;
  wire s_aclk;
  wire s_aresetn;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire [1:0]wr_rst_i;

  control_sub_axis_fifo_10g_tx_0_clk_x_pntrs \gntv_or_sync_fifo.gcx.clkx 
       (.AR(wr_rst_i[0]),
        .D(gray2bin),
        .Q(p_22_out),
        .\g_rd.gvalid_low.rd_dc_i_reg[2] (\gntv_or_sync_fifo.gcx.clkx_n_11 ),
        .\gc0.count_d1_reg[4] (p_0_out_0),
        .\gc0.count_d1_reg[4]_0 ({\gntv_or_sync_fifo.gl0.rd_n_8 ,\gntv_or_sync_fifo.gl0.rd_n_9 ,\gntv_or_sync_fifo.gl0.rd_n_10 ,\gntv_or_sync_fifo.gl0.rd_n_11 }),
        .\gc0.count_reg[4] (rd_pntr_plus1),
        .\gic0.gc0.count_d1_reg[3] (p_13_out),
        .\gic0.gc0.count_d2_reg[0] (\gntv_or_sync_fifo.gl0.wr_n_11 ),
        .\gic0.gc0.count_d2_reg[3] (bin2gray),
        .\gic0.gc0.count_d2_reg[4] (p_12_out),
        .m_aclk(m_aclk),
        .\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] (rd_rst_i[1]),
        .out(p_5_out),
        .ram_empty_fb_i_reg(\gntv_or_sync_fifo.gcx.clkx_n_5 ),
        .ram_empty_fb_i_reg_0(\gntv_or_sync_fifo.gl0.rd_n_7 ),
        .ram_full_i_reg(\gntv_or_sync_fifo.gcx.clkx_n_12 ),
        .s_aclk(s_aclk),
        .\wr_data_count_i_reg[4] (p_23_out),
        .\wr_data_count_i_reg[5] ({\gntv_or_sync_fifo.gcx.clkx_n_18 ,\gntv_or_sync_fifo.gcx.clkx_n_19 }),
        .wr_rst_busy(rstblk_n_6));
  LUT5 #(
    .INIT(32'h96696996)) 
    \gntv_or_sync_fifo.gcx.clkx/ 
       (.I0(p_5_out[2]),
        .I1(p_5_out[0]),
        .I2(p_5_out[1]),
        .I3(p_5_out[4]),
        .I4(p_5_out[3]),
        .O(gray2bin));
  control_sub_axis_fifo_10g_tx_0_rd_logic \gntv_or_sync_fifo.gl0.rd 
       (.E(\gntv_or_sync_fifo.gl0.rd_n_5 ),
        .Q(rd_pntr_plus1),
        .axis_rd_data_count(axis_rd_data_count),
        .\gc0.count_reg[4] (ram_rd_en_i),
        .\gnxpm_cdc.rd_pntr_gc_reg[3] ({\gntv_or_sync_fifo.gl0.rd_n_8 ,\gntv_or_sync_fifo.gl0.rd_n_9 ,\gntv_or_sync_fifo.gl0.rd_n_10 ,\gntv_or_sync_fifo.gl0.rd_n_11 }),
        .\gnxpm_cdc.rd_pntr_gc_reg[4] (p_0_out_0),
        .\gnxpm_cdc.wr_pntr_bin_reg[0] (\gntv_or_sync_fifo.gcx.clkx_n_11 ),
        .\gnxpm_cdc.wr_pntr_bin_reg[4] (p_22_out),
        .m_aclk(m_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .out({rd_rst_i[2],rd_rst_i[0]}),
        .ram_empty_fb_i_reg(\gntv_or_sync_fifo.gl0.rd_n_7 ),
        .ram_empty_fb_i_reg_0(\gntv_or_sync_fifo.gcx.clkx_n_5 ));
  control_sub_axis_fifo_10g_tx_0_wr_logic \gntv_or_sync_fifo.gl0.wr 
       (.AR(wr_rst_i[1]),
        .D({\gntv_or_sync_fifo.gcx.clkx_n_18 ,\gntv_or_sync_fifo.gcx.clkx_n_19 }),
        .E(p_18_out),
        .Q(p_12_out),
        .axis_wr_data_count(axis_wr_data_count),
        .\gic0.gc0.count_d2_reg[3] (p_13_out),
        .\gnxpm_cdc.rd_pntr_bin_reg[3] (\gntv_or_sync_fifo.gcx.clkx_n_12 ),
        .\gnxpm_cdc.rd_pntr_bin_reg[4] (p_23_out),
        .\gnxpm_cdc.wr_pntr_gc_reg[3] (bin2gray),
        .out(rst_full_ff_i),
        .s_aclk(s_aclk),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .\wr_data_count_i_reg[4] (\gntv_or_sync_fifo.gl0.wr_n_11 ),
        .wr_rst_busy(rstblk_n_6));
  control_sub_axis_fifo_10g_tx_0_memory \gntv_or_sync_fifo.mem 
       (.DI(DI),
        .E(\gntv_or_sync_fifo.gl0.rd_n_5 ),
        .Q(Q),
        .\gc0.count_d1_reg[4] (p_0_out_0),
        .\gic0.gc0.count_d2_reg[4] (p_12_out),
        .\gpregsm1.curr_fwft_state_reg[1] (ram_rd_en_i),
        .m_aclk(m_aclk),
        .ram_full_fb_i_reg(p_18_out),
        .s_aclk(s_aclk));
  control_sub_axis_fifo_10g_tx_0_reset_blk_ramfifo rstblk
       (.\gc0.count_reg[1] (rd_rst_i),
        .\grstd1.grst_full.grst_f.rst_d3_reg_0 (rst_full_ff_i),
        .m_aclk(m_aclk),
        .out(wr_rst_i),
        .ram_full_i_reg(rstblk_n_6),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn));
endmodule

module control_sub_axis_fifo_10g_tx_0_fifo_generator_top
   (Q,
    axis_rd_data_count,
    axis_wr_data_count,
    s_axis_tready,
    m_axis_tvalid,
    m_aclk,
    s_aclk,
    DI,
    m_axis_tready,
    s_axis_tvalid,
    s_aresetn);
  output [272:0]Q;
  output [5:0]axis_rd_data_count;
  output [5:0]axis_wr_data_count;
  output s_axis_tready;
  output m_axis_tvalid;
  input m_aclk;
  input s_aclk;
  input [272:0]DI;
  input m_axis_tready;
  input s_axis_tvalid;
  input s_aresetn;

  wire [272:0]DI;
  wire [272:0]Q;
  wire [5:0]axis_rd_data_count;
  wire [5:0]axis_wr_data_count;
  wire m_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire s_axis_tready;
  wire s_axis_tvalid;

  control_sub_axis_fifo_10g_tx_0_fifo_generator_ramfifo \grf.rf 
       (.DI(DI),
        .Q(Q),
        .axis_rd_data_count(axis_rd_data_count),
        .axis_wr_data_count(axis_wr_data_count),
        .m_aclk(m_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* C_ADD_NGC_CONSTRAINT = "0" *) (* C_APPLICATION_TYPE_AXIS = "0" *) (* C_APPLICATION_TYPE_RACH = "0" *) 
(* C_APPLICATION_TYPE_RDCH = "0" *) (* C_APPLICATION_TYPE_WACH = "0" *) (* C_APPLICATION_TYPE_WDCH = "0" *) 
(* C_APPLICATION_TYPE_WRCH = "0" *) (* C_AXIS_TDATA_WIDTH = "128" *) (* C_AXIS_TDEST_WIDTH = "1" *) 
(* C_AXIS_TID_WIDTH = "1" *) (* C_AXIS_TKEEP_WIDTH = "16" *) (* C_AXIS_TSTRB_WIDTH = "16" *) 
(* C_AXIS_TUSER_WIDTH = "128" *) (* C_AXIS_TYPE = "0" *) (* C_AXI_ADDR_WIDTH = "32" *) 
(* C_AXI_ARUSER_WIDTH = "1" *) (* C_AXI_AWUSER_WIDTH = "1" *) (* C_AXI_BUSER_WIDTH = "1" *) 
(* C_AXI_DATA_WIDTH = "64" *) (* C_AXI_ID_WIDTH = "4" *) (* C_AXI_LEN_WIDTH = "8" *) 
(* C_AXI_LOCK_WIDTH = "2" *) (* C_AXI_RUSER_WIDTH = "1" *) (* C_AXI_TYPE = "0" *) 
(* C_AXI_WUSER_WIDTH = "1" *) (* C_COMMON_CLOCK = "0" *) (* C_COUNT_TYPE = "0" *) 
(* C_DATA_COUNT_WIDTH = "10" *) (* C_DEFAULT_VALUE = "BlankString" *) (* C_DIN_WIDTH = "18" *) 
(* C_DIN_WIDTH_AXIS = "273" *) (* C_DIN_WIDTH_RACH = "32" *) (* C_DIN_WIDTH_RDCH = "64" *) 
(* C_DIN_WIDTH_WACH = "32" *) (* C_DIN_WIDTH_WDCH = "64" *) (* C_DIN_WIDTH_WRCH = "2" *) 
(* C_DOUT_RST_VAL = "0" *) (* C_DOUT_WIDTH = "18" *) (* C_ENABLE_RLOCS = "0" *) 
(* C_ENABLE_RST_SYNC = "1" *) (* C_EN_SAFETY_CKT = "0" *) (* C_ERROR_INJECTION_TYPE = "0" *) 
(* C_ERROR_INJECTION_TYPE_AXIS = "0" *) (* C_ERROR_INJECTION_TYPE_RACH = "0" *) (* C_ERROR_INJECTION_TYPE_RDCH = "0" *) 
(* C_ERROR_INJECTION_TYPE_WACH = "0" *) (* C_ERROR_INJECTION_TYPE_WDCH = "0" *) (* C_ERROR_INJECTION_TYPE_WRCH = "0" *) 
(* C_FAMILY = "virtex7" *) (* C_FULL_FLAGS_RST_VAL = "1" *) (* C_HAS_ALMOST_EMPTY = "0" *) 
(* C_HAS_ALMOST_FULL = "0" *) (* C_HAS_AXIS_TDATA = "1" *) (* C_HAS_AXIS_TDEST = "0" *) 
(* C_HAS_AXIS_TID = "0" *) (* C_HAS_AXIS_TKEEP = "1" *) (* C_HAS_AXIS_TLAST = "1" *) 
(* C_HAS_AXIS_TREADY = "1" *) (* C_HAS_AXIS_TSTRB = "0" *) (* C_HAS_AXIS_TUSER = "1" *) 
(* C_HAS_AXI_ARUSER = "0" *) (* C_HAS_AXI_AWUSER = "0" *) (* C_HAS_AXI_BUSER = "0" *) 
(* C_HAS_AXI_ID = "0" *) (* C_HAS_AXI_RD_CHANNEL = "0" *) (* C_HAS_AXI_RUSER = "0" *) 
(* C_HAS_AXI_WR_CHANNEL = "0" *) (* C_HAS_AXI_WUSER = "0" *) (* C_HAS_BACKUP = "0" *) 
(* C_HAS_DATA_COUNT = "0" *) (* C_HAS_DATA_COUNTS_AXIS = "1" *) (* C_HAS_DATA_COUNTS_RACH = "0" *) 
(* C_HAS_DATA_COUNTS_RDCH = "0" *) (* C_HAS_DATA_COUNTS_WACH = "0" *) (* C_HAS_DATA_COUNTS_WDCH = "0" *) 
(* C_HAS_DATA_COUNTS_WRCH = "0" *) (* C_HAS_INT_CLK = "0" *) (* C_HAS_MASTER_CE = "0" *) 
(* C_HAS_MEMINIT_FILE = "0" *) (* C_HAS_OVERFLOW = "0" *) (* C_HAS_PROG_FLAGS_AXIS = "0" *) 
(* C_HAS_PROG_FLAGS_RACH = "0" *) (* C_HAS_PROG_FLAGS_RDCH = "0" *) (* C_HAS_PROG_FLAGS_WACH = "0" *) 
(* C_HAS_PROG_FLAGS_WDCH = "0" *) (* C_HAS_PROG_FLAGS_WRCH = "0" *) (* C_HAS_RD_DATA_COUNT = "0" *) 
(* C_HAS_RD_RST = "0" *) (* C_HAS_RST = "1" *) (* C_HAS_SLAVE_CE = "0" *) 
(* C_HAS_SRST = "0" *) (* C_HAS_UNDERFLOW = "0" *) (* C_HAS_VALID = "0" *) 
(* C_HAS_WR_ACK = "0" *) (* C_HAS_WR_DATA_COUNT = "0" *) (* C_HAS_WR_RST = "0" *) 
(* C_IMPLEMENTATION_TYPE = "0" *) (* C_IMPLEMENTATION_TYPE_AXIS = "12" *) (* C_IMPLEMENTATION_TYPE_RACH = "2" *) 
(* C_IMPLEMENTATION_TYPE_RDCH = "1" *) (* C_IMPLEMENTATION_TYPE_WACH = "2" *) (* C_IMPLEMENTATION_TYPE_WDCH = "1" *) 
(* C_IMPLEMENTATION_TYPE_WRCH = "2" *) (* C_INIT_WR_PNTR_VAL = "0" *) (* C_INTERFACE_TYPE = "1" *) 
(* C_MEMORY_TYPE = "1" *) (* C_MIF_FILE_NAME = "BlankString" *) (* C_MSGON_VAL = "0" *) 
(* C_OPTIMIZATION_MODE = "0" *) (* C_OVERFLOW_LOW = "0" *) (* C_POWER_SAVING_MODE = "0" *) 
(* C_PRELOAD_LATENCY = "1" *) (* C_PRELOAD_REGS = "0" *) (* C_PRIM_FIFO_TYPE = "4kx4" *) 
(* C_PRIM_FIFO_TYPE_AXIS = "512x36" *) (* C_PRIM_FIFO_TYPE_RACH = "512x36" *) (* C_PRIM_FIFO_TYPE_RDCH = "512x36" *) 
(* C_PRIM_FIFO_TYPE_WACH = "512x36" *) (* C_PRIM_FIFO_TYPE_WDCH = "512x36" *) (* C_PRIM_FIFO_TYPE_WRCH = "512x36" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL = "2" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_AXIS = "30" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_RACH = "14" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_RDCH = "1022" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WACH = "14" *) (* C_PROG_EMPTY_THRESH_ASSERT_VAL_WDCH = "1022" *) 
(* C_PROG_EMPTY_THRESH_ASSERT_VAL_WRCH = "14" *) (* C_PROG_EMPTY_THRESH_NEGATE_VAL = "3" *) (* C_PROG_EMPTY_TYPE = "0" *) 
(* C_PROG_EMPTY_TYPE_AXIS = "0" *) (* C_PROG_EMPTY_TYPE_RACH = "0" *) (* C_PROG_EMPTY_TYPE_RDCH = "0" *) 
(* C_PROG_EMPTY_TYPE_WACH = "0" *) (* C_PROG_EMPTY_TYPE_WDCH = "0" *) (* C_PROG_EMPTY_TYPE_WRCH = "0" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL = "1022" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_AXIS = "31" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_RACH = "15" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_RDCH = "1023" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WACH = "15" *) (* C_PROG_FULL_THRESH_ASSERT_VAL_WDCH = "1023" *) 
(* C_PROG_FULL_THRESH_ASSERT_VAL_WRCH = "15" *) (* C_PROG_FULL_THRESH_NEGATE_VAL = "1021" *) (* C_PROG_FULL_TYPE = "0" *) 
(* C_PROG_FULL_TYPE_AXIS = "0" *) (* C_PROG_FULL_TYPE_RACH = "0" *) (* C_PROG_FULL_TYPE_RDCH = "0" *) 
(* C_PROG_FULL_TYPE_WACH = "0" *) (* C_PROG_FULL_TYPE_WDCH = "0" *) (* C_PROG_FULL_TYPE_WRCH = "0" *) 
(* C_RACH_TYPE = "0" *) (* C_RDCH_TYPE = "0" *) (* C_RD_DATA_COUNT_WIDTH = "10" *) 
(* C_RD_DEPTH = "1024" *) (* C_RD_FREQ = "1" *) (* C_RD_PNTR_WIDTH = "10" *) 
(* C_REG_SLICE_MODE_AXIS = "0" *) (* C_REG_SLICE_MODE_RACH = "0" *) (* C_REG_SLICE_MODE_RDCH = "0" *) 
(* C_REG_SLICE_MODE_WACH = "0" *) (* C_REG_SLICE_MODE_WDCH = "0" *) (* C_REG_SLICE_MODE_WRCH = "0" *) 
(* C_SELECT_XPM = "0" *) (* C_SYNCHRONIZER_STAGE = "2" *) (* C_UNDERFLOW_LOW = "0" *) 
(* C_USE_COMMON_OVERFLOW = "0" *) (* C_USE_COMMON_UNDERFLOW = "0" *) (* C_USE_DEFAULT_SETTINGS = "0" *) 
(* C_USE_DOUT_RST = "1" *) (* C_USE_ECC = "0" *) (* C_USE_ECC_AXIS = "0" *) 
(* C_USE_ECC_RACH = "0" *) (* C_USE_ECC_RDCH = "0" *) (* C_USE_ECC_WACH = "0" *) 
(* C_USE_ECC_WDCH = "0" *) (* C_USE_ECC_WRCH = "0" *) (* C_USE_EMBEDDED_REG = "0" *) 
(* C_USE_FIFO16_FLAGS = "0" *) (* C_USE_FWFT_DATA_COUNT = "0" *) (* C_USE_PIPELINE_REG = "0" *) 
(* C_VALID_LOW = "0" *) (* C_WACH_TYPE = "0" *) (* C_WDCH_TYPE = "0" *) 
(* C_WRCH_TYPE = "0" *) (* C_WR_ACK_LOW = "0" *) (* C_WR_DATA_COUNT_WIDTH = "10" *) 
(* C_WR_DEPTH = "1024" *) (* C_WR_DEPTH_AXIS = "32" *) (* C_WR_DEPTH_RACH = "16" *) 
(* C_WR_DEPTH_RDCH = "1024" *) (* C_WR_DEPTH_WACH = "16" *) (* C_WR_DEPTH_WDCH = "1024" *) 
(* C_WR_DEPTH_WRCH = "16" *) (* C_WR_FREQ = "1" *) (* C_WR_PNTR_WIDTH = "10" *) 
(* C_WR_PNTR_WIDTH_AXIS = "5" *) (* C_WR_PNTR_WIDTH_RACH = "4" *) (* C_WR_PNTR_WIDTH_RDCH = "10" *) 
(* C_WR_PNTR_WIDTH_WACH = "4" *) (* C_WR_PNTR_WIDTH_WDCH = "10" *) (* C_WR_PNTR_WIDTH_WRCH = "4" *) 
(* C_WR_RESPONSE_LATENCY = "1" *) 
module control_sub_axis_fifo_10g_tx_0_fifo_generator_v13_1_3
   (backup,
    backup_marker,
    clk,
    rst,
    srst,
    wr_clk,
    wr_rst,
    rd_clk,
    rd_rst,
    din,
    wr_en,
    rd_en,
    prog_empty_thresh,
    prog_empty_thresh_assert,
    prog_empty_thresh_negate,
    prog_full_thresh,
    prog_full_thresh_assert,
    prog_full_thresh_negate,
    int_clk,
    injectdbiterr,
    injectsbiterr,
    sleep,
    dout,
    full,
    almost_full,
    wr_ack,
    overflow,
    empty,
    almost_empty,
    valid,
    underflow,
    data_count,
    rd_data_count,
    wr_data_count,
    prog_full,
    prog_empty,
    sbiterr,
    dbiterr,
    wr_rst_busy,
    rd_rst_busy,
    m_aclk,
    s_aclk,
    s_aresetn,
    m_aclk_en,
    s_aclk_en,
    s_axi_awid,
    s_axi_awaddr,
    s_axi_awlen,
    s_axi_awsize,
    s_axi_awburst,
    s_axi_awlock,
    s_axi_awcache,
    s_axi_awprot,
    s_axi_awqos,
    s_axi_awregion,
    s_axi_awuser,
    s_axi_awvalid,
    s_axi_awready,
    s_axi_wid,
    s_axi_wdata,
    s_axi_wstrb,
    s_axi_wlast,
    s_axi_wuser,
    s_axi_wvalid,
    s_axi_wready,
    s_axi_bid,
    s_axi_bresp,
    s_axi_buser,
    s_axi_bvalid,
    s_axi_bready,
    m_axi_awid,
    m_axi_awaddr,
    m_axi_awlen,
    m_axi_awsize,
    m_axi_awburst,
    m_axi_awlock,
    m_axi_awcache,
    m_axi_awprot,
    m_axi_awqos,
    m_axi_awregion,
    m_axi_awuser,
    m_axi_awvalid,
    m_axi_awready,
    m_axi_wid,
    m_axi_wdata,
    m_axi_wstrb,
    m_axi_wlast,
    m_axi_wuser,
    m_axi_wvalid,
    m_axi_wready,
    m_axi_bid,
    m_axi_bresp,
    m_axi_buser,
    m_axi_bvalid,
    m_axi_bready,
    s_axi_arid,
    s_axi_araddr,
    s_axi_arlen,
    s_axi_arsize,
    s_axi_arburst,
    s_axi_arlock,
    s_axi_arcache,
    s_axi_arprot,
    s_axi_arqos,
    s_axi_arregion,
    s_axi_aruser,
    s_axi_arvalid,
    s_axi_arready,
    s_axi_rid,
    s_axi_rdata,
    s_axi_rresp,
    s_axi_rlast,
    s_axi_ruser,
    s_axi_rvalid,
    s_axi_rready,
    m_axi_arid,
    m_axi_araddr,
    m_axi_arlen,
    m_axi_arsize,
    m_axi_arburst,
    m_axi_arlock,
    m_axi_arcache,
    m_axi_arprot,
    m_axi_arqos,
    m_axi_arregion,
    m_axi_aruser,
    m_axi_arvalid,
    m_axi_arready,
    m_axi_rid,
    m_axi_rdata,
    m_axi_rresp,
    m_axi_rlast,
    m_axi_ruser,
    m_axi_rvalid,
    m_axi_rready,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tid,
    s_axis_tdest,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tstrb,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tid,
    m_axis_tdest,
    m_axis_tuser,
    axi_aw_injectsbiterr,
    axi_aw_injectdbiterr,
    axi_aw_prog_full_thresh,
    axi_aw_prog_empty_thresh,
    axi_aw_data_count,
    axi_aw_wr_data_count,
    axi_aw_rd_data_count,
    axi_aw_sbiterr,
    axi_aw_dbiterr,
    axi_aw_overflow,
    axi_aw_underflow,
    axi_aw_prog_full,
    axi_aw_prog_empty,
    axi_w_injectsbiterr,
    axi_w_injectdbiterr,
    axi_w_prog_full_thresh,
    axi_w_prog_empty_thresh,
    axi_w_data_count,
    axi_w_wr_data_count,
    axi_w_rd_data_count,
    axi_w_sbiterr,
    axi_w_dbiterr,
    axi_w_overflow,
    axi_w_underflow,
    axi_w_prog_full,
    axi_w_prog_empty,
    axi_b_injectsbiterr,
    axi_b_injectdbiterr,
    axi_b_prog_full_thresh,
    axi_b_prog_empty_thresh,
    axi_b_data_count,
    axi_b_wr_data_count,
    axi_b_rd_data_count,
    axi_b_sbiterr,
    axi_b_dbiterr,
    axi_b_overflow,
    axi_b_underflow,
    axi_b_prog_full,
    axi_b_prog_empty,
    axi_ar_injectsbiterr,
    axi_ar_injectdbiterr,
    axi_ar_prog_full_thresh,
    axi_ar_prog_empty_thresh,
    axi_ar_data_count,
    axi_ar_wr_data_count,
    axi_ar_rd_data_count,
    axi_ar_sbiterr,
    axi_ar_dbiterr,
    axi_ar_overflow,
    axi_ar_underflow,
    axi_ar_prog_full,
    axi_ar_prog_empty,
    axi_r_injectsbiterr,
    axi_r_injectdbiterr,
    axi_r_prog_full_thresh,
    axi_r_prog_empty_thresh,
    axi_r_data_count,
    axi_r_wr_data_count,
    axi_r_rd_data_count,
    axi_r_sbiterr,
    axi_r_dbiterr,
    axi_r_overflow,
    axi_r_underflow,
    axi_r_prog_full,
    axi_r_prog_empty,
    axis_injectsbiterr,
    axis_injectdbiterr,
    axis_prog_full_thresh,
    axis_prog_empty_thresh,
    axis_data_count,
    axis_wr_data_count,
    axis_rd_data_count,
    axis_sbiterr,
    axis_dbiterr,
    axis_overflow,
    axis_underflow,
    axis_prog_full,
    axis_prog_empty);
  input backup;
  input backup_marker;
  input clk;
  input rst;
  input srst;
  input wr_clk;
  input wr_rst;
  input rd_clk;
  input rd_rst;
  input [17:0]din;
  input wr_en;
  input rd_en;
  input [9:0]prog_empty_thresh;
  input [9:0]prog_empty_thresh_assert;
  input [9:0]prog_empty_thresh_negate;
  input [9:0]prog_full_thresh;
  input [9:0]prog_full_thresh_assert;
  input [9:0]prog_full_thresh_negate;
  input int_clk;
  input injectdbiterr;
  input injectsbiterr;
  input sleep;
  output [17:0]dout;
  output full;
  output almost_full;
  output wr_ack;
  output overflow;
  output empty;
  output almost_empty;
  output valid;
  output underflow;
  output [9:0]data_count;
  output [9:0]rd_data_count;
  output [9:0]wr_data_count;
  output prog_full;
  output prog_empty;
  output sbiterr;
  output dbiterr;
  output wr_rst_busy;
  output rd_rst_busy;
  input m_aclk;
  input s_aclk;
  input s_aresetn;
  input m_aclk_en;
  input s_aclk_en;
  input [3:0]s_axi_awid;
  input [31:0]s_axi_awaddr;
  input [7:0]s_axi_awlen;
  input [2:0]s_axi_awsize;
  input [1:0]s_axi_awburst;
  input [1:0]s_axi_awlock;
  input [3:0]s_axi_awcache;
  input [2:0]s_axi_awprot;
  input [3:0]s_axi_awqos;
  input [3:0]s_axi_awregion;
  input [0:0]s_axi_awuser;
  input s_axi_awvalid;
  output s_axi_awready;
  input [3:0]s_axi_wid;
  input [63:0]s_axi_wdata;
  input [7:0]s_axi_wstrb;
  input s_axi_wlast;
  input [0:0]s_axi_wuser;
  input s_axi_wvalid;
  output s_axi_wready;
  output [3:0]s_axi_bid;
  output [1:0]s_axi_bresp;
  output [0:0]s_axi_buser;
  output s_axi_bvalid;
  input s_axi_bready;
  output [3:0]m_axi_awid;
  output [31:0]m_axi_awaddr;
  output [7:0]m_axi_awlen;
  output [2:0]m_axi_awsize;
  output [1:0]m_axi_awburst;
  output [1:0]m_axi_awlock;
  output [3:0]m_axi_awcache;
  output [2:0]m_axi_awprot;
  output [3:0]m_axi_awqos;
  output [3:0]m_axi_awregion;
  output [0:0]m_axi_awuser;
  output m_axi_awvalid;
  input m_axi_awready;
  output [3:0]m_axi_wid;
  output [63:0]m_axi_wdata;
  output [7:0]m_axi_wstrb;
  output m_axi_wlast;
  output [0:0]m_axi_wuser;
  output m_axi_wvalid;
  input m_axi_wready;
  input [3:0]m_axi_bid;
  input [1:0]m_axi_bresp;
  input [0:0]m_axi_buser;
  input m_axi_bvalid;
  output m_axi_bready;
  input [3:0]s_axi_arid;
  input [31:0]s_axi_araddr;
  input [7:0]s_axi_arlen;
  input [2:0]s_axi_arsize;
  input [1:0]s_axi_arburst;
  input [1:0]s_axi_arlock;
  input [3:0]s_axi_arcache;
  input [2:0]s_axi_arprot;
  input [3:0]s_axi_arqos;
  input [3:0]s_axi_arregion;
  input [0:0]s_axi_aruser;
  input s_axi_arvalid;
  output s_axi_arready;
  output [3:0]s_axi_rid;
  output [63:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rlast;
  output [0:0]s_axi_ruser;
  output s_axi_rvalid;
  input s_axi_rready;
  output [3:0]m_axi_arid;
  output [31:0]m_axi_araddr;
  output [7:0]m_axi_arlen;
  output [2:0]m_axi_arsize;
  output [1:0]m_axi_arburst;
  output [1:0]m_axi_arlock;
  output [3:0]m_axi_arcache;
  output [2:0]m_axi_arprot;
  output [3:0]m_axi_arqos;
  output [3:0]m_axi_arregion;
  output [0:0]m_axi_aruser;
  output m_axi_arvalid;
  input m_axi_arready;
  input [3:0]m_axi_rid;
  input [63:0]m_axi_rdata;
  input [1:0]m_axi_rresp;
  input m_axi_rlast;
  input [0:0]m_axi_ruser;
  input m_axi_rvalid;
  output m_axi_rready;
  input s_axis_tvalid;
  output s_axis_tready;
  input [127:0]s_axis_tdata;
  input [15:0]s_axis_tstrb;
  input [15:0]s_axis_tkeep;
  input s_axis_tlast;
  input [0:0]s_axis_tid;
  input [0:0]s_axis_tdest;
  input [127:0]s_axis_tuser;
  output m_axis_tvalid;
  input m_axis_tready;
  output [127:0]m_axis_tdata;
  output [15:0]m_axis_tstrb;
  output [15:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [127:0]m_axis_tuser;
  input axi_aw_injectsbiterr;
  input axi_aw_injectdbiterr;
  input [3:0]axi_aw_prog_full_thresh;
  input [3:0]axi_aw_prog_empty_thresh;
  output [4:0]axi_aw_data_count;
  output [4:0]axi_aw_wr_data_count;
  output [4:0]axi_aw_rd_data_count;
  output axi_aw_sbiterr;
  output axi_aw_dbiterr;
  output axi_aw_overflow;
  output axi_aw_underflow;
  output axi_aw_prog_full;
  output axi_aw_prog_empty;
  input axi_w_injectsbiterr;
  input axi_w_injectdbiterr;
  input [9:0]axi_w_prog_full_thresh;
  input [9:0]axi_w_prog_empty_thresh;
  output [10:0]axi_w_data_count;
  output [10:0]axi_w_wr_data_count;
  output [10:0]axi_w_rd_data_count;
  output axi_w_sbiterr;
  output axi_w_dbiterr;
  output axi_w_overflow;
  output axi_w_underflow;
  output axi_w_prog_full;
  output axi_w_prog_empty;
  input axi_b_injectsbiterr;
  input axi_b_injectdbiterr;
  input [3:0]axi_b_prog_full_thresh;
  input [3:0]axi_b_prog_empty_thresh;
  output [4:0]axi_b_data_count;
  output [4:0]axi_b_wr_data_count;
  output [4:0]axi_b_rd_data_count;
  output axi_b_sbiterr;
  output axi_b_dbiterr;
  output axi_b_overflow;
  output axi_b_underflow;
  output axi_b_prog_full;
  output axi_b_prog_empty;
  input axi_ar_injectsbiterr;
  input axi_ar_injectdbiterr;
  input [3:0]axi_ar_prog_full_thresh;
  input [3:0]axi_ar_prog_empty_thresh;
  output [4:0]axi_ar_data_count;
  output [4:0]axi_ar_wr_data_count;
  output [4:0]axi_ar_rd_data_count;
  output axi_ar_sbiterr;
  output axi_ar_dbiterr;
  output axi_ar_overflow;
  output axi_ar_underflow;
  output axi_ar_prog_full;
  output axi_ar_prog_empty;
  input axi_r_injectsbiterr;
  input axi_r_injectdbiterr;
  input [9:0]axi_r_prog_full_thresh;
  input [9:0]axi_r_prog_empty_thresh;
  output [10:0]axi_r_data_count;
  output [10:0]axi_r_wr_data_count;
  output [10:0]axi_r_rd_data_count;
  output axi_r_sbiterr;
  output axi_r_dbiterr;
  output axi_r_overflow;
  output axi_r_underflow;
  output axi_r_prog_full;
  output axi_r_prog_empty;
  input axis_injectsbiterr;
  input axis_injectdbiterr;
  input [4:0]axis_prog_full_thresh;
  input [4:0]axis_prog_empty_thresh;
  output [5:0]axis_data_count;
  output [5:0]axis_wr_data_count;
  output [5:0]axis_rd_data_count;
  output axis_sbiterr;
  output axis_dbiterr;
  output axis_overflow;
  output axis_underflow;
  output axis_prog_full;
  output axis_prog_empty;

  wire \<const0> ;
  wire [5:0]axis_rd_data_count;
  wire [5:0]axis_wr_data_count;
  wire m_aclk;
  wire [127:0]m_axis_tdata;
  wire [15:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [127:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire [127:0]s_axis_tdata;
  wire [15:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [127:0]s_axis_tuser;
  wire s_axis_tvalid;

  assign almost_empty = \<const0> ;
  assign almost_full = \<const0> ;
  assign axi_ar_data_count[4] = \<const0> ;
  assign axi_ar_data_count[3] = \<const0> ;
  assign axi_ar_data_count[2] = \<const0> ;
  assign axi_ar_data_count[1] = \<const0> ;
  assign axi_ar_data_count[0] = \<const0> ;
  assign axi_ar_dbiterr = \<const0> ;
  assign axi_ar_overflow = \<const0> ;
  assign axi_ar_prog_empty = \<const0> ;
  assign axi_ar_prog_full = \<const0> ;
  assign axi_ar_rd_data_count[4] = \<const0> ;
  assign axi_ar_rd_data_count[3] = \<const0> ;
  assign axi_ar_rd_data_count[2] = \<const0> ;
  assign axi_ar_rd_data_count[1] = \<const0> ;
  assign axi_ar_rd_data_count[0] = \<const0> ;
  assign axi_ar_sbiterr = \<const0> ;
  assign axi_ar_underflow = \<const0> ;
  assign axi_ar_wr_data_count[4] = \<const0> ;
  assign axi_ar_wr_data_count[3] = \<const0> ;
  assign axi_ar_wr_data_count[2] = \<const0> ;
  assign axi_ar_wr_data_count[1] = \<const0> ;
  assign axi_ar_wr_data_count[0] = \<const0> ;
  assign axi_aw_data_count[4] = \<const0> ;
  assign axi_aw_data_count[3] = \<const0> ;
  assign axi_aw_data_count[2] = \<const0> ;
  assign axi_aw_data_count[1] = \<const0> ;
  assign axi_aw_data_count[0] = \<const0> ;
  assign axi_aw_dbiterr = \<const0> ;
  assign axi_aw_overflow = \<const0> ;
  assign axi_aw_prog_empty = \<const0> ;
  assign axi_aw_prog_full = \<const0> ;
  assign axi_aw_rd_data_count[4] = \<const0> ;
  assign axi_aw_rd_data_count[3] = \<const0> ;
  assign axi_aw_rd_data_count[2] = \<const0> ;
  assign axi_aw_rd_data_count[1] = \<const0> ;
  assign axi_aw_rd_data_count[0] = \<const0> ;
  assign axi_aw_sbiterr = \<const0> ;
  assign axi_aw_underflow = \<const0> ;
  assign axi_aw_wr_data_count[4] = \<const0> ;
  assign axi_aw_wr_data_count[3] = \<const0> ;
  assign axi_aw_wr_data_count[2] = \<const0> ;
  assign axi_aw_wr_data_count[1] = \<const0> ;
  assign axi_aw_wr_data_count[0] = \<const0> ;
  assign axi_b_data_count[4] = \<const0> ;
  assign axi_b_data_count[3] = \<const0> ;
  assign axi_b_data_count[2] = \<const0> ;
  assign axi_b_data_count[1] = \<const0> ;
  assign axi_b_data_count[0] = \<const0> ;
  assign axi_b_dbiterr = \<const0> ;
  assign axi_b_overflow = \<const0> ;
  assign axi_b_prog_empty = \<const0> ;
  assign axi_b_prog_full = \<const0> ;
  assign axi_b_rd_data_count[4] = \<const0> ;
  assign axi_b_rd_data_count[3] = \<const0> ;
  assign axi_b_rd_data_count[2] = \<const0> ;
  assign axi_b_rd_data_count[1] = \<const0> ;
  assign axi_b_rd_data_count[0] = \<const0> ;
  assign axi_b_sbiterr = \<const0> ;
  assign axi_b_underflow = \<const0> ;
  assign axi_b_wr_data_count[4] = \<const0> ;
  assign axi_b_wr_data_count[3] = \<const0> ;
  assign axi_b_wr_data_count[2] = \<const0> ;
  assign axi_b_wr_data_count[1] = \<const0> ;
  assign axi_b_wr_data_count[0] = \<const0> ;
  assign axi_r_data_count[10] = \<const0> ;
  assign axi_r_data_count[9] = \<const0> ;
  assign axi_r_data_count[8] = \<const0> ;
  assign axi_r_data_count[7] = \<const0> ;
  assign axi_r_data_count[6] = \<const0> ;
  assign axi_r_data_count[5] = \<const0> ;
  assign axi_r_data_count[4] = \<const0> ;
  assign axi_r_data_count[3] = \<const0> ;
  assign axi_r_data_count[2] = \<const0> ;
  assign axi_r_data_count[1] = \<const0> ;
  assign axi_r_data_count[0] = \<const0> ;
  assign axi_r_dbiterr = \<const0> ;
  assign axi_r_overflow = \<const0> ;
  assign axi_r_prog_empty = \<const0> ;
  assign axi_r_prog_full = \<const0> ;
  assign axi_r_rd_data_count[10] = \<const0> ;
  assign axi_r_rd_data_count[9] = \<const0> ;
  assign axi_r_rd_data_count[8] = \<const0> ;
  assign axi_r_rd_data_count[7] = \<const0> ;
  assign axi_r_rd_data_count[6] = \<const0> ;
  assign axi_r_rd_data_count[5] = \<const0> ;
  assign axi_r_rd_data_count[4] = \<const0> ;
  assign axi_r_rd_data_count[3] = \<const0> ;
  assign axi_r_rd_data_count[2] = \<const0> ;
  assign axi_r_rd_data_count[1] = \<const0> ;
  assign axi_r_rd_data_count[0] = \<const0> ;
  assign axi_r_sbiterr = \<const0> ;
  assign axi_r_underflow = \<const0> ;
  assign axi_r_wr_data_count[10] = \<const0> ;
  assign axi_r_wr_data_count[9] = \<const0> ;
  assign axi_r_wr_data_count[8] = \<const0> ;
  assign axi_r_wr_data_count[7] = \<const0> ;
  assign axi_r_wr_data_count[6] = \<const0> ;
  assign axi_r_wr_data_count[5] = \<const0> ;
  assign axi_r_wr_data_count[4] = \<const0> ;
  assign axi_r_wr_data_count[3] = \<const0> ;
  assign axi_r_wr_data_count[2] = \<const0> ;
  assign axi_r_wr_data_count[1] = \<const0> ;
  assign axi_r_wr_data_count[0] = \<const0> ;
  assign axi_w_data_count[10] = \<const0> ;
  assign axi_w_data_count[9] = \<const0> ;
  assign axi_w_data_count[8] = \<const0> ;
  assign axi_w_data_count[7] = \<const0> ;
  assign axi_w_data_count[6] = \<const0> ;
  assign axi_w_data_count[5] = \<const0> ;
  assign axi_w_data_count[4] = \<const0> ;
  assign axi_w_data_count[3] = \<const0> ;
  assign axi_w_data_count[2] = \<const0> ;
  assign axi_w_data_count[1] = \<const0> ;
  assign axi_w_data_count[0] = \<const0> ;
  assign axi_w_dbiterr = \<const0> ;
  assign axi_w_overflow = \<const0> ;
  assign axi_w_prog_empty = \<const0> ;
  assign axi_w_prog_full = \<const0> ;
  assign axi_w_rd_data_count[10] = \<const0> ;
  assign axi_w_rd_data_count[9] = \<const0> ;
  assign axi_w_rd_data_count[8] = \<const0> ;
  assign axi_w_rd_data_count[7] = \<const0> ;
  assign axi_w_rd_data_count[6] = \<const0> ;
  assign axi_w_rd_data_count[5] = \<const0> ;
  assign axi_w_rd_data_count[4] = \<const0> ;
  assign axi_w_rd_data_count[3] = \<const0> ;
  assign axi_w_rd_data_count[2] = \<const0> ;
  assign axi_w_rd_data_count[1] = \<const0> ;
  assign axi_w_rd_data_count[0] = \<const0> ;
  assign axi_w_sbiterr = \<const0> ;
  assign axi_w_underflow = \<const0> ;
  assign axi_w_wr_data_count[10] = \<const0> ;
  assign axi_w_wr_data_count[9] = \<const0> ;
  assign axi_w_wr_data_count[8] = \<const0> ;
  assign axi_w_wr_data_count[7] = \<const0> ;
  assign axi_w_wr_data_count[6] = \<const0> ;
  assign axi_w_wr_data_count[5] = \<const0> ;
  assign axi_w_wr_data_count[4] = \<const0> ;
  assign axi_w_wr_data_count[3] = \<const0> ;
  assign axi_w_wr_data_count[2] = \<const0> ;
  assign axi_w_wr_data_count[1] = \<const0> ;
  assign axi_w_wr_data_count[0] = \<const0> ;
  assign axis_data_count[5] = \<const0> ;
  assign axis_data_count[4] = \<const0> ;
  assign axis_data_count[3] = \<const0> ;
  assign axis_data_count[2] = \<const0> ;
  assign axis_data_count[1] = \<const0> ;
  assign axis_data_count[0] = \<const0> ;
  assign axis_dbiterr = \<const0> ;
  assign axis_overflow = \<const0> ;
  assign axis_prog_empty = \<const0> ;
  assign axis_prog_full = \<const0> ;
  assign axis_sbiterr = \<const0> ;
  assign axis_underflow = \<const0> ;
  assign data_count[9] = \<const0> ;
  assign data_count[8] = \<const0> ;
  assign data_count[7] = \<const0> ;
  assign data_count[6] = \<const0> ;
  assign data_count[5] = \<const0> ;
  assign data_count[4] = \<const0> ;
  assign data_count[3] = \<const0> ;
  assign data_count[2] = \<const0> ;
  assign data_count[1] = \<const0> ;
  assign data_count[0] = \<const0> ;
  assign dbiterr = \<const0> ;
  assign dout[17] = \<const0> ;
  assign dout[16] = \<const0> ;
  assign dout[15] = \<const0> ;
  assign dout[14] = \<const0> ;
  assign dout[13] = \<const0> ;
  assign dout[12] = \<const0> ;
  assign dout[11] = \<const0> ;
  assign dout[10] = \<const0> ;
  assign dout[9] = \<const0> ;
  assign dout[8] = \<const0> ;
  assign dout[7] = \<const0> ;
  assign dout[6] = \<const0> ;
  assign dout[5] = \<const0> ;
  assign dout[4] = \<const0> ;
  assign dout[3] = \<const0> ;
  assign dout[2] = \<const0> ;
  assign dout[1] = \<const0> ;
  assign dout[0] = \<const0> ;
  assign empty = \<const0> ;
  assign full = \<const0> ;
  assign m_axi_araddr[31] = \<const0> ;
  assign m_axi_araddr[30] = \<const0> ;
  assign m_axi_araddr[29] = \<const0> ;
  assign m_axi_araddr[28] = \<const0> ;
  assign m_axi_araddr[27] = \<const0> ;
  assign m_axi_araddr[26] = \<const0> ;
  assign m_axi_araddr[25] = \<const0> ;
  assign m_axi_araddr[24] = \<const0> ;
  assign m_axi_araddr[23] = \<const0> ;
  assign m_axi_araddr[22] = \<const0> ;
  assign m_axi_araddr[21] = \<const0> ;
  assign m_axi_araddr[20] = \<const0> ;
  assign m_axi_araddr[19] = \<const0> ;
  assign m_axi_araddr[18] = \<const0> ;
  assign m_axi_araddr[17] = \<const0> ;
  assign m_axi_araddr[16] = \<const0> ;
  assign m_axi_araddr[15] = \<const0> ;
  assign m_axi_araddr[14] = \<const0> ;
  assign m_axi_araddr[13] = \<const0> ;
  assign m_axi_araddr[12] = \<const0> ;
  assign m_axi_araddr[11] = \<const0> ;
  assign m_axi_araddr[10] = \<const0> ;
  assign m_axi_araddr[9] = \<const0> ;
  assign m_axi_araddr[8] = \<const0> ;
  assign m_axi_araddr[7] = \<const0> ;
  assign m_axi_araddr[6] = \<const0> ;
  assign m_axi_araddr[5] = \<const0> ;
  assign m_axi_araddr[4] = \<const0> ;
  assign m_axi_araddr[3] = \<const0> ;
  assign m_axi_araddr[2] = \<const0> ;
  assign m_axi_araddr[1] = \<const0> ;
  assign m_axi_araddr[0] = \<const0> ;
  assign m_axi_arburst[1] = \<const0> ;
  assign m_axi_arburst[0] = \<const0> ;
  assign m_axi_arcache[3] = \<const0> ;
  assign m_axi_arcache[2] = \<const0> ;
  assign m_axi_arcache[1] = \<const0> ;
  assign m_axi_arcache[0] = \<const0> ;
  assign m_axi_arid[3] = \<const0> ;
  assign m_axi_arid[2] = \<const0> ;
  assign m_axi_arid[1] = \<const0> ;
  assign m_axi_arid[0] = \<const0> ;
  assign m_axi_arlen[7] = \<const0> ;
  assign m_axi_arlen[6] = \<const0> ;
  assign m_axi_arlen[5] = \<const0> ;
  assign m_axi_arlen[4] = \<const0> ;
  assign m_axi_arlen[3] = \<const0> ;
  assign m_axi_arlen[2] = \<const0> ;
  assign m_axi_arlen[1] = \<const0> ;
  assign m_axi_arlen[0] = \<const0> ;
  assign m_axi_arlock[1] = \<const0> ;
  assign m_axi_arlock[0] = \<const0> ;
  assign m_axi_arprot[2] = \<const0> ;
  assign m_axi_arprot[1] = \<const0> ;
  assign m_axi_arprot[0] = \<const0> ;
  assign m_axi_arqos[3] = \<const0> ;
  assign m_axi_arqos[2] = \<const0> ;
  assign m_axi_arqos[1] = \<const0> ;
  assign m_axi_arqos[0] = \<const0> ;
  assign m_axi_arregion[3] = \<const0> ;
  assign m_axi_arregion[2] = \<const0> ;
  assign m_axi_arregion[1] = \<const0> ;
  assign m_axi_arregion[0] = \<const0> ;
  assign m_axi_arsize[2] = \<const0> ;
  assign m_axi_arsize[1] = \<const0> ;
  assign m_axi_arsize[0] = \<const0> ;
  assign m_axi_aruser[0] = \<const0> ;
  assign m_axi_arvalid = \<const0> ;
  assign m_axi_awaddr[31] = \<const0> ;
  assign m_axi_awaddr[30] = \<const0> ;
  assign m_axi_awaddr[29] = \<const0> ;
  assign m_axi_awaddr[28] = \<const0> ;
  assign m_axi_awaddr[27] = \<const0> ;
  assign m_axi_awaddr[26] = \<const0> ;
  assign m_axi_awaddr[25] = \<const0> ;
  assign m_axi_awaddr[24] = \<const0> ;
  assign m_axi_awaddr[23] = \<const0> ;
  assign m_axi_awaddr[22] = \<const0> ;
  assign m_axi_awaddr[21] = \<const0> ;
  assign m_axi_awaddr[20] = \<const0> ;
  assign m_axi_awaddr[19] = \<const0> ;
  assign m_axi_awaddr[18] = \<const0> ;
  assign m_axi_awaddr[17] = \<const0> ;
  assign m_axi_awaddr[16] = \<const0> ;
  assign m_axi_awaddr[15] = \<const0> ;
  assign m_axi_awaddr[14] = \<const0> ;
  assign m_axi_awaddr[13] = \<const0> ;
  assign m_axi_awaddr[12] = \<const0> ;
  assign m_axi_awaddr[11] = \<const0> ;
  assign m_axi_awaddr[10] = \<const0> ;
  assign m_axi_awaddr[9] = \<const0> ;
  assign m_axi_awaddr[8] = \<const0> ;
  assign m_axi_awaddr[7] = \<const0> ;
  assign m_axi_awaddr[6] = \<const0> ;
  assign m_axi_awaddr[5] = \<const0> ;
  assign m_axi_awaddr[4] = \<const0> ;
  assign m_axi_awaddr[3] = \<const0> ;
  assign m_axi_awaddr[2] = \<const0> ;
  assign m_axi_awaddr[1] = \<const0> ;
  assign m_axi_awaddr[0] = \<const0> ;
  assign m_axi_awburst[1] = \<const0> ;
  assign m_axi_awburst[0] = \<const0> ;
  assign m_axi_awcache[3] = \<const0> ;
  assign m_axi_awcache[2] = \<const0> ;
  assign m_axi_awcache[1] = \<const0> ;
  assign m_axi_awcache[0] = \<const0> ;
  assign m_axi_awid[3] = \<const0> ;
  assign m_axi_awid[2] = \<const0> ;
  assign m_axi_awid[1] = \<const0> ;
  assign m_axi_awid[0] = \<const0> ;
  assign m_axi_awlen[7] = \<const0> ;
  assign m_axi_awlen[6] = \<const0> ;
  assign m_axi_awlen[5] = \<const0> ;
  assign m_axi_awlen[4] = \<const0> ;
  assign m_axi_awlen[3] = \<const0> ;
  assign m_axi_awlen[2] = \<const0> ;
  assign m_axi_awlen[1] = \<const0> ;
  assign m_axi_awlen[0] = \<const0> ;
  assign m_axi_awlock[1] = \<const0> ;
  assign m_axi_awlock[0] = \<const0> ;
  assign m_axi_awprot[2] = \<const0> ;
  assign m_axi_awprot[1] = \<const0> ;
  assign m_axi_awprot[0] = \<const0> ;
  assign m_axi_awqos[3] = \<const0> ;
  assign m_axi_awqos[2] = \<const0> ;
  assign m_axi_awqos[1] = \<const0> ;
  assign m_axi_awqos[0] = \<const0> ;
  assign m_axi_awregion[3] = \<const0> ;
  assign m_axi_awregion[2] = \<const0> ;
  assign m_axi_awregion[1] = \<const0> ;
  assign m_axi_awregion[0] = \<const0> ;
  assign m_axi_awsize[2] = \<const0> ;
  assign m_axi_awsize[1] = \<const0> ;
  assign m_axi_awsize[0] = \<const0> ;
  assign m_axi_awuser[0] = \<const0> ;
  assign m_axi_awvalid = \<const0> ;
  assign m_axi_bready = \<const0> ;
  assign m_axi_rready = \<const0> ;
  assign m_axi_wdata[63] = \<const0> ;
  assign m_axi_wdata[62] = \<const0> ;
  assign m_axi_wdata[61] = \<const0> ;
  assign m_axi_wdata[60] = \<const0> ;
  assign m_axi_wdata[59] = \<const0> ;
  assign m_axi_wdata[58] = \<const0> ;
  assign m_axi_wdata[57] = \<const0> ;
  assign m_axi_wdata[56] = \<const0> ;
  assign m_axi_wdata[55] = \<const0> ;
  assign m_axi_wdata[54] = \<const0> ;
  assign m_axi_wdata[53] = \<const0> ;
  assign m_axi_wdata[52] = \<const0> ;
  assign m_axi_wdata[51] = \<const0> ;
  assign m_axi_wdata[50] = \<const0> ;
  assign m_axi_wdata[49] = \<const0> ;
  assign m_axi_wdata[48] = \<const0> ;
  assign m_axi_wdata[47] = \<const0> ;
  assign m_axi_wdata[46] = \<const0> ;
  assign m_axi_wdata[45] = \<const0> ;
  assign m_axi_wdata[44] = \<const0> ;
  assign m_axi_wdata[43] = \<const0> ;
  assign m_axi_wdata[42] = \<const0> ;
  assign m_axi_wdata[41] = \<const0> ;
  assign m_axi_wdata[40] = \<const0> ;
  assign m_axi_wdata[39] = \<const0> ;
  assign m_axi_wdata[38] = \<const0> ;
  assign m_axi_wdata[37] = \<const0> ;
  assign m_axi_wdata[36] = \<const0> ;
  assign m_axi_wdata[35] = \<const0> ;
  assign m_axi_wdata[34] = \<const0> ;
  assign m_axi_wdata[33] = \<const0> ;
  assign m_axi_wdata[32] = \<const0> ;
  assign m_axi_wdata[31] = \<const0> ;
  assign m_axi_wdata[30] = \<const0> ;
  assign m_axi_wdata[29] = \<const0> ;
  assign m_axi_wdata[28] = \<const0> ;
  assign m_axi_wdata[27] = \<const0> ;
  assign m_axi_wdata[26] = \<const0> ;
  assign m_axi_wdata[25] = \<const0> ;
  assign m_axi_wdata[24] = \<const0> ;
  assign m_axi_wdata[23] = \<const0> ;
  assign m_axi_wdata[22] = \<const0> ;
  assign m_axi_wdata[21] = \<const0> ;
  assign m_axi_wdata[20] = \<const0> ;
  assign m_axi_wdata[19] = \<const0> ;
  assign m_axi_wdata[18] = \<const0> ;
  assign m_axi_wdata[17] = \<const0> ;
  assign m_axi_wdata[16] = \<const0> ;
  assign m_axi_wdata[15] = \<const0> ;
  assign m_axi_wdata[14] = \<const0> ;
  assign m_axi_wdata[13] = \<const0> ;
  assign m_axi_wdata[12] = \<const0> ;
  assign m_axi_wdata[11] = \<const0> ;
  assign m_axi_wdata[10] = \<const0> ;
  assign m_axi_wdata[9] = \<const0> ;
  assign m_axi_wdata[8] = \<const0> ;
  assign m_axi_wdata[7] = \<const0> ;
  assign m_axi_wdata[6] = \<const0> ;
  assign m_axi_wdata[5] = \<const0> ;
  assign m_axi_wdata[4] = \<const0> ;
  assign m_axi_wdata[3] = \<const0> ;
  assign m_axi_wdata[2] = \<const0> ;
  assign m_axi_wdata[1] = \<const0> ;
  assign m_axi_wdata[0] = \<const0> ;
  assign m_axi_wid[3] = \<const0> ;
  assign m_axi_wid[2] = \<const0> ;
  assign m_axi_wid[1] = \<const0> ;
  assign m_axi_wid[0] = \<const0> ;
  assign m_axi_wlast = \<const0> ;
  assign m_axi_wstrb[7] = \<const0> ;
  assign m_axi_wstrb[6] = \<const0> ;
  assign m_axi_wstrb[5] = \<const0> ;
  assign m_axi_wstrb[4] = \<const0> ;
  assign m_axi_wstrb[3] = \<const0> ;
  assign m_axi_wstrb[2] = \<const0> ;
  assign m_axi_wstrb[1] = \<const0> ;
  assign m_axi_wstrb[0] = \<const0> ;
  assign m_axi_wuser[0] = \<const0> ;
  assign m_axi_wvalid = \<const0> ;
  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tstrb[15] = \<const0> ;
  assign m_axis_tstrb[14] = \<const0> ;
  assign m_axis_tstrb[13] = \<const0> ;
  assign m_axis_tstrb[12] = \<const0> ;
  assign m_axis_tstrb[11] = \<const0> ;
  assign m_axis_tstrb[10] = \<const0> ;
  assign m_axis_tstrb[9] = \<const0> ;
  assign m_axis_tstrb[8] = \<const0> ;
  assign m_axis_tstrb[7] = \<const0> ;
  assign m_axis_tstrb[6] = \<const0> ;
  assign m_axis_tstrb[5] = \<const0> ;
  assign m_axis_tstrb[4] = \<const0> ;
  assign m_axis_tstrb[3] = \<const0> ;
  assign m_axis_tstrb[2] = \<const0> ;
  assign m_axis_tstrb[1] = \<const0> ;
  assign m_axis_tstrb[0] = \<const0> ;
  assign overflow = \<const0> ;
  assign prog_empty = \<const0> ;
  assign prog_full = \<const0> ;
  assign rd_data_count[9] = \<const0> ;
  assign rd_data_count[8] = \<const0> ;
  assign rd_data_count[7] = \<const0> ;
  assign rd_data_count[6] = \<const0> ;
  assign rd_data_count[5] = \<const0> ;
  assign rd_data_count[4] = \<const0> ;
  assign rd_data_count[3] = \<const0> ;
  assign rd_data_count[2] = \<const0> ;
  assign rd_data_count[1] = \<const0> ;
  assign rd_data_count[0] = \<const0> ;
  assign rd_rst_busy = \<const0> ;
  assign s_axi_arready = \<const0> ;
  assign s_axi_awready = \<const0> ;
  assign s_axi_bid[3] = \<const0> ;
  assign s_axi_bid[2] = \<const0> ;
  assign s_axi_bid[1] = \<const0> ;
  assign s_axi_bid[0] = \<const0> ;
  assign s_axi_bresp[1] = \<const0> ;
  assign s_axi_bresp[0] = \<const0> ;
  assign s_axi_buser[0] = \<const0> ;
  assign s_axi_bvalid = \<const0> ;
  assign s_axi_rdata[63] = \<const0> ;
  assign s_axi_rdata[62] = \<const0> ;
  assign s_axi_rdata[61] = \<const0> ;
  assign s_axi_rdata[60] = \<const0> ;
  assign s_axi_rdata[59] = \<const0> ;
  assign s_axi_rdata[58] = \<const0> ;
  assign s_axi_rdata[57] = \<const0> ;
  assign s_axi_rdata[56] = \<const0> ;
  assign s_axi_rdata[55] = \<const0> ;
  assign s_axi_rdata[54] = \<const0> ;
  assign s_axi_rdata[53] = \<const0> ;
  assign s_axi_rdata[52] = \<const0> ;
  assign s_axi_rdata[51] = \<const0> ;
  assign s_axi_rdata[50] = \<const0> ;
  assign s_axi_rdata[49] = \<const0> ;
  assign s_axi_rdata[48] = \<const0> ;
  assign s_axi_rdata[47] = \<const0> ;
  assign s_axi_rdata[46] = \<const0> ;
  assign s_axi_rdata[45] = \<const0> ;
  assign s_axi_rdata[44] = \<const0> ;
  assign s_axi_rdata[43] = \<const0> ;
  assign s_axi_rdata[42] = \<const0> ;
  assign s_axi_rdata[41] = \<const0> ;
  assign s_axi_rdata[40] = \<const0> ;
  assign s_axi_rdata[39] = \<const0> ;
  assign s_axi_rdata[38] = \<const0> ;
  assign s_axi_rdata[37] = \<const0> ;
  assign s_axi_rdata[36] = \<const0> ;
  assign s_axi_rdata[35] = \<const0> ;
  assign s_axi_rdata[34] = \<const0> ;
  assign s_axi_rdata[33] = \<const0> ;
  assign s_axi_rdata[32] = \<const0> ;
  assign s_axi_rdata[31] = \<const0> ;
  assign s_axi_rdata[30] = \<const0> ;
  assign s_axi_rdata[29] = \<const0> ;
  assign s_axi_rdata[28] = \<const0> ;
  assign s_axi_rdata[27] = \<const0> ;
  assign s_axi_rdata[26] = \<const0> ;
  assign s_axi_rdata[25] = \<const0> ;
  assign s_axi_rdata[24] = \<const0> ;
  assign s_axi_rdata[23] = \<const0> ;
  assign s_axi_rdata[22] = \<const0> ;
  assign s_axi_rdata[21] = \<const0> ;
  assign s_axi_rdata[20] = \<const0> ;
  assign s_axi_rdata[19] = \<const0> ;
  assign s_axi_rdata[18] = \<const0> ;
  assign s_axi_rdata[17] = \<const0> ;
  assign s_axi_rdata[16] = \<const0> ;
  assign s_axi_rdata[15] = \<const0> ;
  assign s_axi_rdata[14] = \<const0> ;
  assign s_axi_rdata[13] = \<const0> ;
  assign s_axi_rdata[12] = \<const0> ;
  assign s_axi_rdata[11] = \<const0> ;
  assign s_axi_rdata[10] = \<const0> ;
  assign s_axi_rdata[9] = \<const0> ;
  assign s_axi_rdata[8] = \<const0> ;
  assign s_axi_rdata[7] = \<const0> ;
  assign s_axi_rdata[6] = \<const0> ;
  assign s_axi_rdata[5] = \<const0> ;
  assign s_axi_rdata[4] = \<const0> ;
  assign s_axi_rdata[3] = \<const0> ;
  assign s_axi_rdata[2] = \<const0> ;
  assign s_axi_rdata[1] = \<const0> ;
  assign s_axi_rdata[0] = \<const0> ;
  assign s_axi_rid[3] = \<const0> ;
  assign s_axi_rid[2] = \<const0> ;
  assign s_axi_rid[1] = \<const0> ;
  assign s_axi_rid[0] = \<const0> ;
  assign s_axi_rlast = \<const0> ;
  assign s_axi_rresp[1] = \<const0> ;
  assign s_axi_rresp[0] = \<const0> ;
  assign s_axi_ruser[0] = \<const0> ;
  assign s_axi_rvalid = \<const0> ;
  assign s_axi_wready = \<const0> ;
  assign sbiterr = \<const0> ;
  assign underflow = \<const0> ;
  assign valid = \<const0> ;
  assign wr_ack = \<const0> ;
  assign wr_data_count[9] = \<const0> ;
  assign wr_data_count[8] = \<const0> ;
  assign wr_data_count[7] = \<const0> ;
  assign wr_data_count[6] = \<const0> ;
  assign wr_data_count[5] = \<const0> ;
  assign wr_data_count[4] = \<const0> ;
  assign wr_data_count[3] = \<const0> ;
  assign wr_data_count[2] = \<const0> ;
  assign wr_data_count[1] = \<const0> ;
  assign wr_data_count[0] = \<const0> ;
  assign wr_rst_busy = \<const0> ;
  GND GND
       (.G(\<const0> ));
  control_sub_axis_fifo_10g_tx_0_fifo_generator_v13_1_3_synth inst_fifo_gen
       (.DI({s_axis_tdata,s_axis_tkeep,s_axis_tuser,s_axis_tlast}),
        .Q({m_axis_tdata,m_axis_tkeep,m_axis_tuser,m_axis_tlast}),
        .axis_rd_data_count(axis_rd_data_count),
        .axis_wr_data_count(axis_wr_data_count),
        .m_aclk(m_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module control_sub_axis_fifo_10g_tx_0_fifo_generator_v13_1_3_synth
   (Q,
    axis_rd_data_count,
    axis_wr_data_count,
    s_axis_tready,
    m_axis_tvalid,
    m_aclk,
    s_aclk,
    DI,
    m_axis_tready,
    s_axis_tvalid,
    s_aresetn);
  output [272:0]Q;
  output [5:0]axis_rd_data_count;
  output [5:0]axis_wr_data_count;
  output s_axis_tready;
  output m_axis_tvalid;
  input m_aclk;
  input s_aclk;
  input [272:0]DI;
  input m_axis_tready;
  input s_axis_tvalid;
  input s_aresetn;

  wire [272:0]DI;
  wire [272:0]Q;
  wire [5:0]axis_rd_data_count;
  wire [5:0]axis_wr_data_count;
  wire m_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire s_aclk;
  wire s_aresetn;
  wire s_axis_tready;
  wire s_axis_tvalid;

  control_sub_axis_fifo_10g_tx_0_fifo_generator_top \gaxis_fifo.gaxisf.axisf 
       (.DI(DI),
        .Q(Q),
        .axis_rd_data_count(axis_rd_data_count),
        .axis_wr_data_count(axis_wr_data_count),
        .m_aclk(m_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .s_aclk(s_aclk),
        .s_aresetn(s_aresetn),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

module control_sub_axis_fifo_10g_tx_0_memory
   (Q,
    E,
    m_aclk,
    s_aclk,
    ram_full_fb_i_reg,
    DI,
    \gc0.count_d1_reg[4] ,
    \gic0.gc0.count_d2_reg[4] ,
    \gpregsm1.curr_fwft_state_reg[1] );
  output [272:0]Q;
  input [0:0]E;
  input m_aclk;
  input s_aclk;
  input [0:0]ram_full_fb_i_reg;
  input [272:0]DI;
  input [4:0]\gc0.count_d1_reg[4] ;
  input [4:0]\gic0.gc0.count_d2_reg[4] ;
  input [0:0]\gpregsm1.curr_fwft_state_reg[1] ;

  wire [272:0]DI;
  wire [0:0]E;
  wire [272:0]Q;
  wire [4:0]\gc0.count_d1_reg[4] ;
  wire \gdm.dm_gen.dm_n_0 ;
  wire \gdm.dm_gen.dm_n_1 ;
  wire \gdm.dm_gen.dm_n_10 ;
  wire \gdm.dm_gen.dm_n_100 ;
  wire \gdm.dm_gen.dm_n_101 ;
  wire \gdm.dm_gen.dm_n_102 ;
  wire \gdm.dm_gen.dm_n_103 ;
  wire \gdm.dm_gen.dm_n_104 ;
  wire \gdm.dm_gen.dm_n_105 ;
  wire \gdm.dm_gen.dm_n_106 ;
  wire \gdm.dm_gen.dm_n_107 ;
  wire \gdm.dm_gen.dm_n_108 ;
  wire \gdm.dm_gen.dm_n_109 ;
  wire \gdm.dm_gen.dm_n_11 ;
  wire \gdm.dm_gen.dm_n_110 ;
  wire \gdm.dm_gen.dm_n_111 ;
  wire \gdm.dm_gen.dm_n_112 ;
  wire \gdm.dm_gen.dm_n_113 ;
  wire \gdm.dm_gen.dm_n_114 ;
  wire \gdm.dm_gen.dm_n_115 ;
  wire \gdm.dm_gen.dm_n_116 ;
  wire \gdm.dm_gen.dm_n_117 ;
  wire \gdm.dm_gen.dm_n_118 ;
  wire \gdm.dm_gen.dm_n_119 ;
  wire \gdm.dm_gen.dm_n_12 ;
  wire \gdm.dm_gen.dm_n_120 ;
  wire \gdm.dm_gen.dm_n_121 ;
  wire \gdm.dm_gen.dm_n_122 ;
  wire \gdm.dm_gen.dm_n_123 ;
  wire \gdm.dm_gen.dm_n_124 ;
  wire \gdm.dm_gen.dm_n_125 ;
  wire \gdm.dm_gen.dm_n_126 ;
  wire \gdm.dm_gen.dm_n_127 ;
  wire \gdm.dm_gen.dm_n_128 ;
  wire \gdm.dm_gen.dm_n_129 ;
  wire \gdm.dm_gen.dm_n_13 ;
  wire \gdm.dm_gen.dm_n_130 ;
  wire \gdm.dm_gen.dm_n_131 ;
  wire \gdm.dm_gen.dm_n_132 ;
  wire \gdm.dm_gen.dm_n_133 ;
  wire \gdm.dm_gen.dm_n_134 ;
  wire \gdm.dm_gen.dm_n_135 ;
  wire \gdm.dm_gen.dm_n_136 ;
  wire \gdm.dm_gen.dm_n_137 ;
  wire \gdm.dm_gen.dm_n_138 ;
  wire \gdm.dm_gen.dm_n_139 ;
  wire \gdm.dm_gen.dm_n_14 ;
  wire \gdm.dm_gen.dm_n_140 ;
  wire \gdm.dm_gen.dm_n_141 ;
  wire \gdm.dm_gen.dm_n_142 ;
  wire \gdm.dm_gen.dm_n_143 ;
  wire \gdm.dm_gen.dm_n_144 ;
  wire \gdm.dm_gen.dm_n_145 ;
  wire \gdm.dm_gen.dm_n_146 ;
  wire \gdm.dm_gen.dm_n_147 ;
  wire \gdm.dm_gen.dm_n_148 ;
  wire \gdm.dm_gen.dm_n_149 ;
  wire \gdm.dm_gen.dm_n_15 ;
  wire \gdm.dm_gen.dm_n_150 ;
  wire \gdm.dm_gen.dm_n_151 ;
  wire \gdm.dm_gen.dm_n_152 ;
  wire \gdm.dm_gen.dm_n_153 ;
  wire \gdm.dm_gen.dm_n_154 ;
  wire \gdm.dm_gen.dm_n_155 ;
  wire \gdm.dm_gen.dm_n_156 ;
  wire \gdm.dm_gen.dm_n_157 ;
  wire \gdm.dm_gen.dm_n_158 ;
  wire \gdm.dm_gen.dm_n_159 ;
  wire \gdm.dm_gen.dm_n_16 ;
  wire \gdm.dm_gen.dm_n_160 ;
  wire \gdm.dm_gen.dm_n_161 ;
  wire \gdm.dm_gen.dm_n_162 ;
  wire \gdm.dm_gen.dm_n_163 ;
  wire \gdm.dm_gen.dm_n_164 ;
  wire \gdm.dm_gen.dm_n_165 ;
  wire \gdm.dm_gen.dm_n_166 ;
  wire \gdm.dm_gen.dm_n_167 ;
  wire \gdm.dm_gen.dm_n_168 ;
  wire \gdm.dm_gen.dm_n_169 ;
  wire \gdm.dm_gen.dm_n_17 ;
  wire \gdm.dm_gen.dm_n_170 ;
  wire \gdm.dm_gen.dm_n_171 ;
  wire \gdm.dm_gen.dm_n_172 ;
  wire \gdm.dm_gen.dm_n_173 ;
  wire \gdm.dm_gen.dm_n_174 ;
  wire \gdm.dm_gen.dm_n_175 ;
  wire \gdm.dm_gen.dm_n_176 ;
  wire \gdm.dm_gen.dm_n_177 ;
  wire \gdm.dm_gen.dm_n_178 ;
  wire \gdm.dm_gen.dm_n_179 ;
  wire \gdm.dm_gen.dm_n_18 ;
  wire \gdm.dm_gen.dm_n_180 ;
  wire \gdm.dm_gen.dm_n_181 ;
  wire \gdm.dm_gen.dm_n_182 ;
  wire \gdm.dm_gen.dm_n_183 ;
  wire \gdm.dm_gen.dm_n_184 ;
  wire \gdm.dm_gen.dm_n_185 ;
  wire \gdm.dm_gen.dm_n_186 ;
  wire \gdm.dm_gen.dm_n_187 ;
  wire \gdm.dm_gen.dm_n_188 ;
  wire \gdm.dm_gen.dm_n_189 ;
  wire \gdm.dm_gen.dm_n_19 ;
  wire \gdm.dm_gen.dm_n_190 ;
  wire \gdm.dm_gen.dm_n_191 ;
  wire \gdm.dm_gen.dm_n_192 ;
  wire \gdm.dm_gen.dm_n_193 ;
  wire \gdm.dm_gen.dm_n_194 ;
  wire \gdm.dm_gen.dm_n_195 ;
  wire \gdm.dm_gen.dm_n_196 ;
  wire \gdm.dm_gen.dm_n_197 ;
  wire \gdm.dm_gen.dm_n_198 ;
  wire \gdm.dm_gen.dm_n_199 ;
  wire \gdm.dm_gen.dm_n_2 ;
  wire \gdm.dm_gen.dm_n_20 ;
  wire \gdm.dm_gen.dm_n_200 ;
  wire \gdm.dm_gen.dm_n_201 ;
  wire \gdm.dm_gen.dm_n_202 ;
  wire \gdm.dm_gen.dm_n_203 ;
  wire \gdm.dm_gen.dm_n_204 ;
  wire \gdm.dm_gen.dm_n_205 ;
  wire \gdm.dm_gen.dm_n_206 ;
  wire \gdm.dm_gen.dm_n_207 ;
  wire \gdm.dm_gen.dm_n_208 ;
  wire \gdm.dm_gen.dm_n_209 ;
  wire \gdm.dm_gen.dm_n_21 ;
  wire \gdm.dm_gen.dm_n_210 ;
  wire \gdm.dm_gen.dm_n_211 ;
  wire \gdm.dm_gen.dm_n_212 ;
  wire \gdm.dm_gen.dm_n_213 ;
  wire \gdm.dm_gen.dm_n_214 ;
  wire \gdm.dm_gen.dm_n_215 ;
  wire \gdm.dm_gen.dm_n_216 ;
  wire \gdm.dm_gen.dm_n_217 ;
  wire \gdm.dm_gen.dm_n_218 ;
  wire \gdm.dm_gen.dm_n_219 ;
  wire \gdm.dm_gen.dm_n_22 ;
  wire \gdm.dm_gen.dm_n_220 ;
  wire \gdm.dm_gen.dm_n_221 ;
  wire \gdm.dm_gen.dm_n_222 ;
  wire \gdm.dm_gen.dm_n_223 ;
  wire \gdm.dm_gen.dm_n_224 ;
  wire \gdm.dm_gen.dm_n_225 ;
  wire \gdm.dm_gen.dm_n_226 ;
  wire \gdm.dm_gen.dm_n_227 ;
  wire \gdm.dm_gen.dm_n_228 ;
  wire \gdm.dm_gen.dm_n_229 ;
  wire \gdm.dm_gen.dm_n_23 ;
  wire \gdm.dm_gen.dm_n_230 ;
  wire \gdm.dm_gen.dm_n_231 ;
  wire \gdm.dm_gen.dm_n_232 ;
  wire \gdm.dm_gen.dm_n_233 ;
  wire \gdm.dm_gen.dm_n_234 ;
  wire \gdm.dm_gen.dm_n_235 ;
  wire \gdm.dm_gen.dm_n_236 ;
  wire \gdm.dm_gen.dm_n_237 ;
  wire \gdm.dm_gen.dm_n_238 ;
  wire \gdm.dm_gen.dm_n_239 ;
  wire \gdm.dm_gen.dm_n_24 ;
  wire \gdm.dm_gen.dm_n_240 ;
  wire \gdm.dm_gen.dm_n_241 ;
  wire \gdm.dm_gen.dm_n_242 ;
  wire \gdm.dm_gen.dm_n_243 ;
  wire \gdm.dm_gen.dm_n_244 ;
  wire \gdm.dm_gen.dm_n_245 ;
  wire \gdm.dm_gen.dm_n_246 ;
  wire \gdm.dm_gen.dm_n_247 ;
  wire \gdm.dm_gen.dm_n_248 ;
  wire \gdm.dm_gen.dm_n_249 ;
  wire \gdm.dm_gen.dm_n_25 ;
  wire \gdm.dm_gen.dm_n_250 ;
  wire \gdm.dm_gen.dm_n_251 ;
  wire \gdm.dm_gen.dm_n_252 ;
  wire \gdm.dm_gen.dm_n_253 ;
  wire \gdm.dm_gen.dm_n_254 ;
  wire \gdm.dm_gen.dm_n_255 ;
  wire \gdm.dm_gen.dm_n_256 ;
  wire \gdm.dm_gen.dm_n_257 ;
  wire \gdm.dm_gen.dm_n_258 ;
  wire \gdm.dm_gen.dm_n_259 ;
  wire \gdm.dm_gen.dm_n_26 ;
  wire \gdm.dm_gen.dm_n_260 ;
  wire \gdm.dm_gen.dm_n_261 ;
  wire \gdm.dm_gen.dm_n_262 ;
  wire \gdm.dm_gen.dm_n_263 ;
  wire \gdm.dm_gen.dm_n_264 ;
  wire \gdm.dm_gen.dm_n_265 ;
  wire \gdm.dm_gen.dm_n_266 ;
  wire \gdm.dm_gen.dm_n_267 ;
  wire \gdm.dm_gen.dm_n_268 ;
  wire \gdm.dm_gen.dm_n_269 ;
  wire \gdm.dm_gen.dm_n_27 ;
  wire \gdm.dm_gen.dm_n_270 ;
  wire \gdm.dm_gen.dm_n_271 ;
  wire \gdm.dm_gen.dm_n_272 ;
  wire \gdm.dm_gen.dm_n_28 ;
  wire \gdm.dm_gen.dm_n_29 ;
  wire \gdm.dm_gen.dm_n_3 ;
  wire \gdm.dm_gen.dm_n_30 ;
  wire \gdm.dm_gen.dm_n_31 ;
  wire \gdm.dm_gen.dm_n_32 ;
  wire \gdm.dm_gen.dm_n_33 ;
  wire \gdm.dm_gen.dm_n_34 ;
  wire \gdm.dm_gen.dm_n_35 ;
  wire \gdm.dm_gen.dm_n_36 ;
  wire \gdm.dm_gen.dm_n_37 ;
  wire \gdm.dm_gen.dm_n_38 ;
  wire \gdm.dm_gen.dm_n_39 ;
  wire \gdm.dm_gen.dm_n_4 ;
  wire \gdm.dm_gen.dm_n_40 ;
  wire \gdm.dm_gen.dm_n_41 ;
  wire \gdm.dm_gen.dm_n_42 ;
  wire \gdm.dm_gen.dm_n_43 ;
  wire \gdm.dm_gen.dm_n_44 ;
  wire \gdm.dm_gen.dm_n_45 ;
  wire \gdm.dm_gen.dm_n_46 ;
  wire \gdm.dm_gen.dm_n_47 ;
  wire \gdm.dm_gen.dm_n_48 ;
  wire \gdm.dm_gen.dm_n_49 ;
  wire \gdm.dm_gen.dm_n_5 ;
  wire \gdm.dm_gen.dm_n_50 ;
  wire \gdm.dm_gen.dm_n_51 ;
  wire \gdm.dm_gen.dm_n_52 ;
  wire \gdm.dm_gen.dm_n_53 ;
  wire \gdm.dm_gen.dm_n_54 ;
  wire \gdm.dm_gen.dm_n_55 ;
  wire \gdm.dm_gen.dm_n_56 ;
  wire \gdm.dm_gen.dm_n_57 ;
  wire \gdm.dm_gen.dm_n_58 ;
  wire \gdm.dm_gen.dm_n_59 ;
  wire \gdm.dm_gen.dm_n_6 ;
  wire \gdm.dm_gen.dm_n_60 ;
  wire \gdm.dm_gen.dm_n_61 ;
  wire \gdm.dm_gen.dm_n_62 ;
  wire \gdm.dm_gen.dm_n_63 ;
  wire \gdm.dm_gen.dm_n_64 ;
  wire \gdm.dm_gen.dm_n_65 ;
  wire \gdm.dm_gen.dm_n_66 ;
  wire \gdm.dm_gen.dm_n_67 ;
  wire \gdm.dm_gen.dm_n_68 ;
  wire \gdm.dm_gen.dm_n_69 ;
  wire \gdm.dm_gen.dm_n_7 ;
  wire \gdm.dm_gen.dm_n_70 ;
  wire \gdm.dm_gen.dm_n_71 ;
  wire \gdm.dm_gen.dm_n_72 ;
  wire \gdm.dm_gen.dm_n_73 ;
  wire \gdm.dm_gen.dm_n_74 ;
  wire \gdm.dm_gen.dm_n_75 ;
  wire \gdm.dm_gen.dm_n_76 ;
  wire \gdm.dm_gen.dm_n_77 ;
  wire \gdm.dm_gen.dm_n_78 ;
  wire \gdm.dm_gen.dm_n_79 ;
  wire \gdm.dm_gen.dm_n_8 ;
  wire \gdm.dm_gen.dm_n_80 ;
  wire \gdm.dm_gen.dm_n_81 ;
  wire \gdm.dm_gen.dm_n_82 ;
  wire \gdm.dm_gen.dm_n_83 ;
  wire \gdm.dm_gen.dm_n_84 ;
  wire \gdm.dm_gen.dm_n_85 ;
  wire \gdm.dm_gen.dm_n_86 ;
  wire \gdm.dm_gen.dm_n_87 ;
  wire \gdm.dm_gen.dm_n_88 ;
  wire \gdm.dm_gen.dm_n_89 ;
  wire \gdm.dm_gen.dm_n_9 ;
  wire \gdm.dm_gen.dm_n_90 ;
  wire \gdm.dm_gen.dm_n_91 ;
  wire \gdm.dm_gen.dm_n_92 ;
  wire \gdm.dm_gen.dm_n_93 ;
  wire \gdm.dm_gen.dm_n_94 ;
  wire \gdm.dm_gen.dm_n_95 ;
  wire \gdm.dm_gen.dm_n_96 ;
  wire \gdm.dm_gen.dm_n_97 ;
  wire \gdm.dm_gen.dm_n_98 ;
  wire \gdm.dm_gen.dm_n_99 ;
  wire [4:0]\gic0.gc0.count_d2_reg[4] ;
  wire [0:0]\gpregsm1.curr_fwft_state_reg[1] ;
  wire m_aclk;
  wire [0:0]ram_full_fb_i_reg;
  wire s_aclk;

  control_sub_axis_fifo_10g_tx_0_dmem \gdm.dm_gen.dm 
       (.DI(DI),
        .dout_i({\gdm.dm_gen.dm_n_0 ,\gdm.dm_gen.dm_n_1 ,\gdm.dm_gen.dm_n_2 ,\gdm.dm_gen.dm_n_3 ,\gdm.dm_gen.dm_n_4 ,\gdm.dm_gen.dm_n_5 ,\gdm.dm_gen.dm_n_6 ,\gdm.dm_gen.dm_n_7 ,\gdm.dm_gen.dm_n_8 ,\gdm.dm_gen.dm_n_9 ,\gdm.dm_gen.dm_n_10 ,\gdm.dm_gen.dm_n_11 ,\gdm.dm_gen.dm_n_12 ,\gdm.dm_gen.dm_n_13 ,\gdm.dm_gen.dm_n_14 ,\gdm.dm_gen.dm_n_15 ,\gdm.dm_gen.dm_n_16 ,\gdm.dm_gen.dm_n_17 ,\gdm.dm_gen.dm_n_18 ,\gdm.dm_gen.dm_n_19 ,\gdm.dm_gen.dm_n_20 ,\gdm.dm_gen.dm_n_21 ,\gdm.dm_gen.dm_n_22 ,\gdm.dm_gen.dm_n_23 ,\gdm.dm_gen.dm_n_24 ,\gdm.dm_gen.dm_n_25 ,\gdm.dm_gen.dm_n_26 ,\gdm.dm_gen.dm_n_27 ,\gdm.dm_gen.dm_n_28 ,\gdm.dm_gen.dm_n_29 ,\gdm.dm_gen.dm_n_30 ,\gdm.dm_gen.dm_n_31 ,\gdm.dm_gen.dm_n_32 ,\gdm.dm_gen.dm_n_33 ,\gdm.dm_gen.dm_n_34 ,\gdm.dm_gen.dm_n_35 ,\gdm.dm_gen.dm_n_36 ,\gdm.dm_gen.dm_n_37 ,\gdm.dm_gen.dm_n_38 ,\gdm.dm_gen.dm_n_39 ,\gdm.dm_gen.dm_n_40 ,\gdm.dm_gen.dm_n_41 ,\gdm.dm_gen.dm_n_42 ,\gdm.dm_gen.dm_n_43 ,\gdm.dm_gen.dm_n_44 ,\gdm.dm_gen.dm_n_45 ,\gdm.dm_gen.dm_n_46 ,\gdm.dm_gen.dm_n_47 ,\gdm.dm_gen.dm_n_48 ,\gdm.dm_gen.dm_n_49 ,\gdm.dm_gen.dm_n_50 ,\gdm.dm_gen.dm_n_51 ,\gdm.dm_gen.dm_n_52 ,\gdm.dm_gen.dm_n_53 ,\gdm.dm_gen.dm_n_54 ,\gdm.dm_gen.dm_n_55 ,\gdm.dm_gen.dm_n_56 ,\gdm.dm_gen.dm_n_57 ,\gdm.dm_gen.dm_n_58 ,\gdm.dm_gen.dm_n_59 ,\gdm.dm_gen.dm_n_60 ,\gdm.dm_gen.dm_n_61 ,\gdm.dm_gen.dm_n_62 ,\gdm.dm_gen.dm_n_63 ,\gdm.dm_gen.dm_n_64 ,\gdm.dm_gen.dm_n_65 ,\gdm.dm_gen.dm_n_66 ,\gdm.dm_gen.dm_n_67 ,\gdm.dm_gen.dm_n_68 ,\gdm.dm_gen.dm_n_69 ,\gdm.dm_gen.dm_n_70 ,\gdm.dm_gen.dm_n_71 ,\gdm.dm_gen.dm_n_72 ,\gdm.dm_gen.dm_n_73 ,\gdm.dm_gen.dm_n_74 ,\gdm.dm_gen.dm_n_75 ,\gdm.dm_gen.dm_n_76 ,\gdm.dm_gen.dm_n_77 ,\gdm.dm_gen.dm_n_78 ,\gdm.dm_gen.dm_n_79 ,\gdm.dm_gen.dm_n_80 ,\gdm.dm_gen.dm_n_81 ,\gdm.dm_gen.dm_n_82 ,\gdm.dm_gen.dm_n_83 ,\gdm.dm_gen.dm_n_84 ,\gdm.dm_gen.dm_n_85 ,\gdm.dm_gen.dm_n_86 ,\gdm.dm_gen.dm_n_87 ,\gdm.dm_gen.dm_n_88 ,\gdm.dm_gen.dm_n_89 ,\gdm.dm_gen.dm_n_90 ,\gdm.dm_gen.dm_n_91 ,\gdm.dm_gen.dm_n_92 ,\gdm.dm_gen.dm_n_93 ,\gdm.dm_gen.dm_n_94 ,\gdm.dm_gen.dm_n_95 ,\gdm.dm_gen.dm_n_96 ,\gdm.dm_gen.dm_n_97 ,\gdm.dm_gen.dm_n_98 ,\gdm.dm_gen.dm_n_99 ,\gdm.dm_gen.dm_n_100 ,\gdm.dm_gen.dm_n_101 ,\gdm.dm_gen.dm_n_102 ,\gdm.dm_gen.dm_n_103 ,\gdm.dm_gen.dm_n_104 ,\gdm.dm_gen.dm_n_105 ,\gdm.dm_gen.dm_n_106 ,\gdm.dm_gen.dm_n_107 ,\gdm.dm_gen.dm_n_108 ,\gdm.dm_gen.dm_n_109 ,\gdm.dm_gen.dm_n_110 ,\gdm.dm_gen.dm_n_111 ,\gdm.dm_gen.dm_n_112 ,\gdm.dm_gen.dm_n_113 ,\gdm.dm_gen.dm_n_114 ,\gdm.dm_gen.dm_n_115 ,\gdm.dm_gen.dm_n_116 ,\gdm.dm_gen.dm_n_117 ,\gdm.dm_gen.dm_n_118 ,\gdm.dm_gen.dm_n_119 ,\gdm.dm_gen.dm_n_120 ,\gdm.dm_gen.dm_n_121 ,\gdm.dm_gen.dm_n_122 ,\gdm.dm_gen.dm_n_123 ,\gdm.dm_gen.dm_n_124 ,\gdm.dm_gen.dm_n_125 ,\gdm.dm_gen.dm_n_126 ,\gdm.dm_gen.dm_n_127 ,\gdm.dm_gen.dm_n_128 ,\gdm.dm_gen.dm_n_129 ,\gdm.dm_gen.dm_n_130 ,\gdm.dm_gen.dm_n_131 ,\gdm.dm_gen.dm_n_132 ,\gdm.dm_gen.dm_n_133 ,\gdm.dm_gen.dm_n_134 ,\gdm.dm_gen.dm_n_135 ,\gdm.dm_gen.dm_n_136 ,\gdm.dm_gen.dm_n_137 ,\gdm.dm_gen.dm_n_138 ,\gdm.dm_gen.dm_n_139 ,\gdm.dm_gen.dm_n_140 ,\gdm.dm_gen.dm_n_141 ,\gdm.dm_gen.dm_n_142 ,\gdm.dm_gen.dm_n_143 ,\gdm.dm_gen.dm_n_144 ,\gdm.dm_gen.dm_n_145 ,\gdm.dm_gen.dm_n_146 ,\gdm.dm_gen.dm_n_147 ,\gdm.dm_gen.dm_n_148 ,\gdm.dm_gen.dm_n_149 ,\gdm.dm_gen.dm_n_150 ,\gdm.dm_gen.dm_n_151 ,\gdm.dm_gen.dm_n_152 ,\gdm.dm_gen.dm_n_153 ,\gdm.dm_gen.dm_n_154 ,\gdm.dm_gen.dm_n_155 ,\gdm.dm_gen.dm_n_156 ,\gdm.dm_gen.dm_n_157 ,\gdm.dm_gen.dm_n_158 ,\gdm.dm_gen.dm_n_159 ,\gdm.dm_gen.dm_n_160 ,\gdm.dm_gen.dm_n_161 ,\gdm.dm_gen.dm_n_162 ,\gdm.dm_gen.dm_n_163 ,\gdm.dm_gen.dm_n_164 ,\gdm.dm_gen.dm_n_165 ,\gdm.dm_gen.dm_n_166 ,\gdm.dm_gen.dm_n_167 ,\gdm.dm_gen.dm_n_168 ,\gdm.dm_gen.dm_n_169 ,\gdm.dm_gen.dm_n_170 ,\gdm.dm_gen.dm_n_171 ,\gdm.dm_gen.dm_n_172 ,\gdm.dm_gen.dm_n_173 ,\gdm.dm_gen.dm_n_174 ,\gdm.dm_gen.dm_n_175 ,\gdm.dm_gen.dm_n_176 ,\gdm.dm_gen.dm_n_177 ,\gdm.dm_gen.dm_n_178 ,\gdm.dm_gen.dm_n_179 ,\gdm.dm_gen.dm_n_180 ,\gdm.dm_gen.dm_n_181 ,\gdm.dm_gen.dm_n_182 ,\gdm.dm_gen.dm_n_183 ,\gdm.dm_gen.dm_n_184 ,\gdm.dm_gen.dm_n_185 ,\gdm.dm_gen.dm_n_186 ,\gdm.dm_gen.dm_n_187 ,\gdm.dm_gen.dm_n_188 ,\gdm.dm_gen.dm_n_189 ,\gdm.dm_gen.dm_n_190 ,\gdm.dm_gen.dm_n_191 ,\gdm.dm_gen.dm_n_192 ,\gdm.dm_gen.dm_n_193 ,\gdm.dm_gen.dm_n_194 ,\gdm.dm_gen.dm_n_195 ,\gdm.dm_gen.dm_n_196 ,\gdm.dm_gen.dm_n_197 ,\gdm.dm_gen.dm_n_198 ,\gdm.dm_gen.dm_n_199 ,\gdm.dm_gen.dm_n_200 ,\gdm.dm_gen.dm_n_201 ,\gdm.dm_gen.dm_n_202 ,\gdm.dm_gen.dm_n_203 ,\gdm.dm_gen.dm_n_204 ,\gdm.dm_gen.dm_n_205 ,\gdm.dm_gen.dm_n_206 ,\gdm.dm_gen.dm_n_207 ,\gdm.dm_gen.dm_n_208 ,\gdm.dm_gen.dm_n_209 ,\gdm.dm_gen.dm_n_210 ,\gdm.dm_gen.dm_n_211 ,\gdm.dm_gen.dm_n_212 ,\gdm.dm_gen.dm_n_213 ,\gdm.dm_gen.dm_n_214 ,\gdm.dm_gen.dm_n_215 ,\gdm.dm_gen.dm_n_216 ,\gdm.dm_gen.dm_n_217 ,\gdm.dm_gen.dm_n_218 ,\gdm.dm_gen.dm_n_219 ,\gdm.dm_gen.dm_n_220 ,\gdm.dm_gen.dm_n_221 ,\gdm.dm_gen.dm_n_222 ,\gdm.dm_gen.dm_n_223 ,\gdm.dm_gen.dm_n_224 ,\gdm.dm_gen.dm_n_225 ,\gdm.dm_gen.dm_n_226 ,\gdm.dm_gen.dm_n_227 ,\gdm.dm_gen.dm_n_228 ,\gdm.dm_gen.dm_n_229 ,\gdm.dm_gen.dm_n_230 ,\gdm.dm_gen.dm_n_231 ,\gdm.dm_gen.dm_n_232 ,\gdm.dm_gen.dm_n_233 ,\gdm.dm_gen.dm_n_234 ,\gdm.dm_gen.dm_n_235 ,\gdm.dm_gen.dm_n_236 ,\gdm.dm_gen.dm_n_237 ,\gdm.dm_gen.dm_n_238 ,\gdm.dm_gen.dm_n_239 ,\gdm.dm_gen.dm_n_240 ,\gdm.dm_gen.dm_n_241 ,\gdm.dm_gen.dm_n_242 ,\gdm.dm_gen.dm_n_243 ,\gdm.dm_gen.dm_n_244 ,\gdm.dm_gen.dm_n_245 ,\gdm.dm_gen.dm_n_246 ,\gdm.dm_gen.dm_n_247 ,\gdm.dm_gen.dm_n_248 ,\gdm.dm_gen.dm_n_249 ,\gdm.dm_gen.dm_n_250 ,\gdm.dm_gen.dm_n_251 ,\gdm.dm_gen.dm_n_252 ,\gdm.dm_gen.dm_n_253 ,\gdm.dm_gen.dm_n_254 ,\gdm.dm_gen.dm_n_255 ,\gdm.dm_gen.dm_n_256 ,\gdm.dm_gen.dm_n_257 ,\gdm.dm_gen.dm_n_258 ,\gdm.dm_gen.dm_n_259 ,\gdm.dm_gen.dm_n_260 ,\gdm.dm_gen.dm_n_261 ,\gdm.dm_gen.dm_n_262 ,\gdm.dm_gen.dm_n_263 ,\gdm.dm_gen.dm_n_264 ,\gdm.dm_gen.dm_n_265 ,\gdm.dm_gen.dm_n_266 ,\gdm.dm_gen.dm_n_267 ,\gdm.dm_gen.dm_n_268 ,\gdm.dm_gen.dm_n_269 ,\gdm.dm_gen.dm_n_270 ,\gdm.dm_gen.dm_n_271 ,\gdm.dm_gen.dm_n_272 }),
        .\gc0.count_d1_reg[4] (\gc0.count_d1_reg[4] ),
        .\gic0.gc0.count_d2_reg[4] (\gic0.gc0.count_d2_reg[4] ),
        .\gpregsm1.curr_fwft_state_reg[1] (\gpregsm1.curr_fwft_state_reg[1] ),
        .m_aclk(m_aclk),
        .ram_full_fb_i_reg(ram_full_fb_i_reg),
        .s_aclk(s_aclk));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[0] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_272 ),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[100] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_172 ),
        .Q(Q[100]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[101] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_171 ),
        .Q(Q[101]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[102] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_170 ),
        .Q(Q[102]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[103] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_169 ),
        .Q(Q[103]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[104] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_168 ),
        .Q(Q[104]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[105] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_167 ),
        .Q(Q[105]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[106] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_166 ),
        .Q(Q[106]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[107] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_165 ),
        .Q(Q[107]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[108] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_164 ),
        .Q(Q[108]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[109] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_163 ),
        .Q(Q[109]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[10] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_262 ),
        .Q(Q[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[110] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_162 ),
        .Q(Q[110]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[111] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_161 ),
        .Q(Q[111]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[112] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_160 ),
        .Q(Q[112]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[113] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_159 ),
        .Q(Q[113]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[114] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_158 ),
        .Q(Q[114]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[115] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_157 ),
        .Q(Q[115]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[116] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_156 ),
        .Q(Q[116]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[117] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_155 ),
        .Q(Q[117]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[118] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_154 ),
        .Q(Q[118]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[119] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_153 ),
        .Q(Q[119]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[11] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_261 ),
        .Q(Q[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[120] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_152 ),
        .Q(Q[120]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[121] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_151 ),
        .Q(Q[121]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[122] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_150 ),
        .Q(Q[122]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[123] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_149 ),
        .Q(Q[123]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[124] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_148 ),
        .Q(Q[124]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[125] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_147 ),
        .Q(Q[125]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[126] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_146 ),
        .Q(Q[126]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[127] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_145 ),
        .Q(Q[127]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[128] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_144 ),
        .Q(Q[128]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[129] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_143 ),
        .Q(Q[129]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[12] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_260 ),
        .Q(Q[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[130] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_142 ),
        .Q(Q[130]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[131] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_141 ),
        .Q(Q[131]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[132] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_140 ),
        .Q(Q[132]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[133] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_139 ),
        .Q(Q[133]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[134] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_138 ),
        .Q(Q[134]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[135] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_137 ),
        .Q(Q[135]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[136] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_136 ),
        .Q(Q[136]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[137] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_135 ),
        .Q(Q[137]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[138] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_134 ),
        .Q(Q[138]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[139] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_133 ),
        .Q(Q[139]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[13] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_259 ),
        .Q(Q[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[140] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_132 ),
        .Q(Q[140]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[141] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_131 ),
        .Q(Q[141]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[142] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_130 ),
        .Q(Q[142]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[143] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_129 ),
        .Q(Q[143]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[144] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_128 ),
        .Q(Q[144]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[145] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_127 ),
        .Q(Q[145]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[146] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_126 ),
        .Q(Q[146]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[147] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_125 ),
        .Q(Q[147]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[148] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_124 ),
        .Q(Q[148]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[149] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_123 ),
        .Q(Q[149]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[14] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_258 ),
        .Q(Q[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[150] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_122 ),
        .Q(Q[150]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[151] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_121 ),
        .Q(Q[151]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[152] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_120 ),
        .Q(Q[152]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[153] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_119 ),
        .Q(Q[153]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[154] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_118 ),
        .Q(Q[154]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[155] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_117 ),
        .Q(Q[155]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[156] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_116 ),
        .Q(Q[156]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[157] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_115 ),
        .Q(Q[157]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[158] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_114 ),
        .Q(Q[158]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[159] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_113 ),
        .Q(Q[159]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[15] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_257 ),
        .Q(Q[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[160] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_112 ),
        .Q(Q[160]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[161] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_111 ),
        .Q(Q[161]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[162] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_110 ),
        .Q(Q[162]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[163] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_109 ),
        .Q(Q[163]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[164] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_108 ),
        .Q(Q[164]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[165] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_107 ),
        .Q(Q[165]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[166] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_106 ),
        .Q(Q[166]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[167] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_105 ),
        .Q(Q[167]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[168] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_104 ),
        .Q(Q[168]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[169] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_103 ),
        .Q(Q[169]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[16] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_256 ),
        .Q(Q[16]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[170] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_102 ),
        .Q(Q[170]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[171] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_101 ),
        .Q(Q[171]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[172] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_100 ),
        .Q(Q[172]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[173] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_99 ),
        .Q(Q[173]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[174] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_98 ),
        .Q(Q[174]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[175] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_97 ),
        .Q(Q[175]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[176] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_96 ),
        .Q(Q[176]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[177] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_95 ),
        .Q(Q[177]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[178] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_94 ),
        .Q(Q[178]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[179] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_93 ),
        .Q(Q[179]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[17] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_255 ),
        .Q(Q[17]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[180] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_92 ),
        .Q(Q[180]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[181] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_91 ),
        .Q(Q[181]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[182] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_90 ),
        .Q(Q[182]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[183] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_89 ),
        .Q(Q[183]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[184] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_88 ),
        .Q(Q[184]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[185] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_87 ),
        .Q(Q[185]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[186] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_86 ),
        .Q(Q[186]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[187] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_85 ),
        .Q(Q[187]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[188] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_84 ),
        .Q(Q[188]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[189] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_83 ),
        .Q(Q[189]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[18] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_254 ),
        .Q(Q[18]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[190] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_82 ),
        .Q(Q[190]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[191] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_81 ),
        .Q(Q[191]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[192] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_80 ),
        .Q(Q[192]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[193] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_79 ),
        .Q(Q[193]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[194] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_78 ),
        .Q(Q[194]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[195] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_77 ),
        .Q(Q[195]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[196] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_76 ),
        .Q(Q[196]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[197] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_75 ),
        .Q(Q[197]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[198] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_74 ),
        .Q(Q[198]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[199] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_73 ),
        .Q(Q[199]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[19] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_253 ),
        .Q(Q[19]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[1] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_271 ),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[200] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_72 ),
        .Q(Q[200]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[201] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_71 ),
        .Q(Q[201]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[202] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_70 ),
        .Q(Q[202]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[203] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_69 ),
        .Q(Q[203]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[204] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_68 ),
        .Q(Q[204]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[205] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_67 ),
        .Q(Q[205]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[206] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_66 ),
        .Q(Q[206]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[207] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_65 ),
        .Q(Q[207]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[208] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_64 ),
        .Q(Q[208]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[209] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_63 ),
        .Q(Q[209]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[20] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_252 ),
        .Q(Q[20]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[210] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_62 ),
        .Q(Q[210]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[211] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_61 ),
        .Q(Q[211]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[212] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_60 ),
        .Q(Q[212]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[213] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_59 ),
        .Q(Q[213]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[214] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_58 ),
        .Q(Q[214]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[215] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_57 ),
        .Q(Q[215]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[216] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_56 ),
        .Q(Q[216]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[217] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_55 ),
        .Q(Q[217]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[218] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_54 ),
        .Q(Q[218]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[219] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_53 ),
        .Q(Q[219]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[21] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_251 ),
        .Q(Q[21]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[220] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_52 ),
        .Q(Q[220]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[221] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_51 ),
        .Q(Q[221]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[222] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_50 ),
        .Q(Q[222]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[223] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_49 ),
        .Q(Q[223]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[224] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_48 ),
        .Q(Q[224]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[225] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_47 ),
        .Q(Q[225]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[226] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_46 ),
        .Q(Q[226]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[227] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_45 ),
        .Q(Q[227]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[228] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_44 ),
        .Q(Q[228]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[229] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_43 ),
        .Q(Q[229]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[22] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_250 ),
        .Q(Q[22]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[230] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_42 ),
        .Q(Q[230]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[231] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_41 ),
        .Q(Q[231]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[232] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_40 ),
        .Q(Q[232]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[233] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_39 ),
        .Q(Q[233]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[234] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_38 ),
        .Q(Q[234]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[235] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_37 ),
        .Q(Q[235]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[236] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_36 ),
        .Q(Q[236]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[237] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_35 ),
        .Q(Q[237]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[238] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_34 ),
        .Q(Q[238]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[239] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_33 ),
        .Q(Q[239]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[23] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_249 ),
        .Q(Q[23]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[240] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_32 ),
        .Q(Q[240]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[241] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_31 ),
        .Q(Q[241]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[242] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_30 ),
        .Q(Q[242]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[243] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_29 ),
        .Q(Q[243]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[244] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_28 ),
        .Q(Q[244]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[245] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_27 ),
        .Q(Q[245]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[246] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_26 ),
        .Q(Q[246]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[247] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_25 ),
        .Q(Q[247]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[248] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_24 ),
        .Q(Q[248]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[249] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_23 ),
        .Q(Q[249]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[24] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_248 ),
        .Q(Q[24]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[250] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_22 ),
        .Q(Q[250]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[251] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_21 ),
        .Q(Q[251]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[252] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_20 ),
        .Q(Q[252]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[253] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_19 ),
        .Q(Q[253]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[254] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_18 ),
        .Q(Q[254]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[255] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_17 ),
        .Q(Q[255]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[256] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_16 ),
        .Q(Q[256]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[257] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_15 ),
        .Q(Q[257]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[258] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_14 ),
        .Q(Q[258]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[259] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_13 ),
        .Q(Q[259]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[25] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_247 ),
        .Q(Q[25]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[260] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_12 ),
        .Q(Q[260]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[261] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_11 ),
        .Q(Q[261]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[262] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_10 ),
        .Q(Q[262]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[263] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_9 ),
        .Q(Q[263]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[264] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_8 ),
        .Q(Q[264]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[265] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_7 ),
        .Q(Q[265]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[266] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_6 ),
        .Q(Q[266]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[267] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_5 ),
        .Q(Q[267]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[268] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_4 ),
        .Q(Q[268]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[269] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_3 ),
        .Q(Q[269]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[26] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_246 ),
        .Q(Q[26]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[270] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_2 ),
        .Q(Q[270]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[271] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_1 ),
        .Q(Q[271]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[272] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_0 ),
        .Q(Q[272]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[27] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_245 ),
        .Q(Q[27]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[28] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_244 ),
        .Q(Q[28]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[29] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_243 ),
        .Q(Q[29]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[2] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_270 ),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[30] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_242 ),
        .Q(Q[30]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[31] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_241 ),
        .Q(Q[31]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[32] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_240 ),
        .Q(Q[32]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[33] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_239 ),
        .Q(Q[33]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[34] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_238 ),
        .Q(Q[34]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[35] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_237 ),
        .Q(Q[35]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[36] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_236 ),
        .Q(Q[36]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[37] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_235 ),
        .Q(Q[37]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[38] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_234 ),
        .Q(Q[38]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[39] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_233 ),
        .Q(Q[39]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[3] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_269 ),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[40] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_232 ),
        .Q(Q[40]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[41] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_231 ),
        .Q(Q[41]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[42] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_230 ),
        .Q(Q[42]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[43] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_229 ),
        .Q(Q[43]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[44] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_228 ),
        .Q(Q[44]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[45] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_227 ),
        .Q(Q[45]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[46] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_226 ),
        .Q(Q[46]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[47] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_225 ),
        .Q(Q[47]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[48] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_224 ),
        .Q(Q[48]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[49] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_223 ),
        .Q(Q[49]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[4] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_268 ),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[50] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_222 ),
        .Q(Q[50]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[51] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_221 ),
        .Q(Q[51]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[52] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_220 ),
        .Q(Q[52]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[53] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_219 ),
        .Q(Q[53]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[54] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_218 ),
        .Q(Q[54]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[55] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_217 ),
        .Q(Q[55]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[56] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_216 ),
        .Q(Q[56]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[57] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_215 ),
        .Q(Q[57]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[58] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_214 ),
        .Q(Q[58]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[59] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_213 ),
        .Q(Q[59]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[5] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_267 ),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[60] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_212 ),
        .Q(Q[60]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[61] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_211 ),
        .Q(Q[61]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[62] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_210 ),
        .Q(Q[62]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[63] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_209 ),
        .Q(Q[63]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[64] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_208 ),
        .Q(Q[64]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[65] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_207 ),
        .Q(Q[65]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[66] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_206 ),
        .Q(Q[66]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[67] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_205 ),
        .Q(Q[67]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[68] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_204 ),
        .Q(Q[68]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[69] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_203 ),
        .Q(Q[69]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[6] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_266 ),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[70] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_202 ),
        .Q(Q[70]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[71] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_201 ),
        .Q(Q[71]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[72] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_200 ),
        .Q(Q[72]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[73] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_199 ),
        .Q(Q[73]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[74] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_198 ),
        .Q(Q[74]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[75] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_197 ),
        .Q(Q[75]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[76] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_196 ),
        .Q(Q[76]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[77] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_195 ),
        .Q(Q[77]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[78] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_194 ),
        .Q(Q[78]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[79] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_193 ),
        .Q(Q[79]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[7] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_265 ),
        .Q(Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[80] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_192 ),
        .Q(Q[80]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[81] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_191 ),
        .Q(Q[81]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[82] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_190 ),
        .Q(Q[82]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[83] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_189 ),
        .Q(Q[83]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[84] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_188 ),
        .Q(Q[84]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[85] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_187 ),
        .Q(Q[85]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[86] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_186 ),
        .Q(Q[86]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[87] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_185 ),
        .Q(Q[87]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[88] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_184 ),
        .Q(Q[88]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[89] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_183 ),
        .Q(Q[89]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[8] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_264 ),
        .Q(Q[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[90] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_182 ),
        .Q(Q[90]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[91] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_181 ),
        .Q(Q[91]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[92] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_180 ),
        .Q(Q[92]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[93] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_179 ),
        .Q(Q[93]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[94] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_178 ),
        .Q(Q[94]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[95] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_177 ),
        .Q(Q[95]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[96] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_176 ),
        .Q(Q[96]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[97] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_175 ),
        .Q(Q[97]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[98] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_174 ),
        .Q(Q[98]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[99] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_173 ),
        .Q(Q[99]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \goreg_dm.dout_i_reg[9] 
       (.C(m_aclk),
        .CE(E),
        .D(\gdm.dm_gen.dm_n_263 ),
        .Q(Q[9]),
        .R(1'b0));
endmodule

module control_sub_axis_fifo_10g_tx_0_rd_bin_cntr
   (Q,
    \gnxpm_cdc.rd_pntr_gc_reg[3] ,
    \gnxpm_cdc.rd_pntr_gc_reg[4] ,
    D,
    \gpregsm1.curr_fwft_state_reg[1] ,
    \gnxpm_cdc.wr_pntr_bin_reg[4] ,
    \gnxpm_cdc.wr_pntr_bin_reg[0] ,
    \gpregsm1.user_valid_reg ,
    out,
    E,
    m_aclk,
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] );
  output [4:0]Q;
  output [3:0]\gnxpm_cdc.rd_pntr_gc_reg[3] ;
  output [4:0]\gnxpm_cdc.rd_pntr_gc_reg[4] ;
  output [3:0]D;
  input \gpregsm1.curr_fwft_state_reg[1] ;
  input [4:0]\gnxpm_cdc.wr_pntr_bin_reg[4] ;
  input \gnxpm_cdc.wr_pntr_bin_reg[0] ;
  input \gpregsm1.user_valid_reg ;
  input [0:0]out;
  input [0:0]E;
  input m_aclk;
  input [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ;

  wire [3:0]D;
  wire [0:0]E;
  wire [4:0]Q;
  wire \g_rd.gvalid_low.rd_dc_i[5]_i_3_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[5]_i_4_n_0 ;
  wire \g_rd.gvalid_low.rd_dc_i[5]_i_5_n_0 ;
  wire [3:0]\gnxpm_cdc.rd_pntr_gc_reg[3] ;
  wire [4:0]\gnxpm_cdc.rd_pntr_gc_reg[4] ;
  wire \gnxpm_cdc.wr_pntr_bin_reg[0] ;
  wire [4:0]\gnxpm_cdc.wr_pntr_bin_reg[4] ;
  wire \gpregsm1.curr_fwft_state_reg[1] ;
  wire \gpregsm1.user_valid_reg ;
  wire m_aclk;
  wire [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ;
  wire [0:0]out;
  wire [4:0]plusOp;

  LUT6 #(
    .INIT(64'h0280A82AA82A0280)) 
    \g_rd.gvalid_low.rd_dc_i[2]_i_1 
       (.I0(\gpregsm1.curr_fwft_state_reg[1] ),
        .I1(\gnxpm_cdc.wr_pntr_bin_reg[0] ),
        .I2(\gnxpm_cdc.wr_pntr_bin_reg[4] [1]),
        .I3(\gnxpm_cdc.rd_pntr_gc_reg[4] [1]),
        .I4(\gnxpm_cdc.wr_pntr_bin_reg[4] [2]),
        .I5(\gnxpm_cdc.rd_pntr_gc_reg[4] [2]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h8008088008808008)) 
    \g_rd.gvalid_low.rd_dc_i[3]_i_1 
       (.I0(\gpregsm1.user_valid_reg ),
        .I1(out),
        .I2(\gnxpm_cdc.wr_pntr_bin_reg[4] [3]),
        .I3(\gnxpm_cdc.rd_pntr_gc_reg[4] [3]),
        .I4(\g_rd.gvalid_low.rd_dc_i[5]_i_4_n_0 ),
        .I5(\g_rd.gvalid_low.rd_dc_i[5]_i_3_n_0 ),
        .O(D[1]));
  LUT6 #(
    .INIT(64'hA82A80A802802A02)) 
    \g_rd.gvalid_low.rd_dc_i[4]_i_1 
       (.I0(\gpregsm1.curr_fwft_state_reg[1] ),
        .I1(\g_rd.gvalid_low.rd_dc_i[5]_i_3_n_0 ),
        .I2(\g_rd.gvalid_low.rd_dc_i[5]_i_4_n_0 ),
        .I3(\gnxpm_cdc.rd_pntr_gc_reg[4] [3]),
        .I4(\gnxpm_cdc.wr_pntr_bin_reg[4] [3]),
        .I5(\g_rd.gvalid_low.rd_dc_i[5]_i_5_n_0 ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h0080000008008008)) 
    \g_rd.gvalid_low.rd_dc_i[5]_i_1 
       (.I0(\gpregsm1.curr_fwft_state_reg[1] ),
        .I1(\g_rd.gvalid_low.rd_dc_i[5]_i_3_n_0 ),
        .I2(\g_rd.gvalid_low.rd_dc_i[5]_i_4_n_0 ),
        .I3(\gnxpm_cdc.rd_pntr_gc_reg[4] [3]),
        .I4(\gnxpm_cdc.wr_pntr_bin_reg[4] [3]),
        .I5(\g_rd.gvalid_low.rd_dc_i[5]_i_5_n_0 ),
        .O(D[3]));
  LUT6 #(
    .INIT(64'h0690900906900690)) 
    \g_rd.gvalid_low.rd_dc_i[5]_i_3 
       (.I0(\gnxpm_cdc.rd_pntr_gc_reg[4] [2]),
        .I1(\gnxpm_cdc.wr_pntr_bin_reg[4] [2]),
        .I2(\gnxpm_cdc.rd_pntr_gc_reg[4] [1]),
        .I3(\gnxpm_cdc.wr_pntr_bin_reg[4] [1]),
        .I4(\gnxpm_cdc.wr_pntr_bin_reg[4] [0]),
        .I5(\gnxpm_cdc.rd_pntr_gc_reg[4] [0]),
        .O(\g_rd.gvalid_low.rd_dc_i[5]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hD0FDFFFF0000D0FD)) 
    \g_rd.gvalid_low.rd_dc_i[5]_i_4 
       (.I0(\gnxpm_cdc.rd_pntr_gc_reg[4] [0]),
        .I1(\gnxpm_cdc.wr_pntr_bin_reg[4] [0]),
        .I2(\gnxpm_cdc.wr_pntr_bin_reg[4] [1]),
        .I3(\gnxpm_cdc.rd_pntr_gc_reg[4] [1]),
        .I4(\gnxpm_cdc.rd_pntr_gc_reg[4] [2]),
        .I5(\gnxpm_cdc.wr_pntr_bin_reg[4] [2]),
        .O(\g_rd.gvalid_low.rd_dc_i[5]_i_4_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \g_rd.gvalid_low.rd_dc_i[5]_i_5 
       (.I0(\gnxpm_cdc.rd_pntr_gc_reg[4] [4]),
        .I1(\gnxpm_cdc.wr_pntr_bin_reg[4] [4]),
        .O(\g_rd.gvalid_low.rd_dc_i[5]_i_5_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \gc0.count[0]_i_1 
       (.I0(Q[0]),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gc0.count[1]_i_1 
       (.I0(Q[1]),
        .I1(Q[0]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \gc0.count[2]_i_1 
       (.I0(Q[2]),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT4 #(
    .INIT(16'h6AAA)) 
    \gc0.count[3]_i_1 
       (.I0(Q[3]),
        .I1(Q[1]),
        .I2(Q[0]),
        .I3(Q[2]),
        .O(plusOp[3]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT5 #(
    .INIT(32'h6AAAAAAA)) 
    \gc0.count[4]_i_1 
       (.I0(Q[4]),
        .I1(Q[3]),
        .I2(Q[2]),
        .I3(Q[0]),
        .I4(Q[1]),
        .O(plusOp[4]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[0] 
       (.C(m_aclk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[0]),
        .Q(\gnxpm_cdc.rd_pntr_gc_reg[4] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[1] 
       (.C(m_aclk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[1]),
        .Q(\gnxpm_cdc.rd_pntr_gc_reg[4] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[2] 
       (.C(m_aclk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[2]),
        .Q(\gnxpm_cdc.rd_pntr_gc_reg[4] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[3] 
       (.C(m_aclk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[3]),
        .Q(\gnxpm_cdc.rd_pntr_gc_reg[4] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_d1_reg[4] 
       (.C(m_aclk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(Q[4]),
        .Q(\gnxpm_cdc.rd_pntr_gc_reg[4] [4]));
  FDPE #(
    .INIT(1'b1)) 
    \gc0.count_reg[0] 
       (.C(m_aclk),
        .CE(E),
        .D(plusOp[0]),
        .PRE(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .Q(Q[0]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_reg[1] 
       (.C(m_aclk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(plusOp[1]),
        .Q(Q[1]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_reg[2] 
       (.C(m_aclk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(plusOp[2]),
        .Q(Q[2]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_reg[3] 
       (.C(m_aclk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(plusOp[3]),
        .Q(Q[3]));
  FDCE #(
    .INIT(1'b0)) 
    \gc0.count_reg[4] 
       (.C(m_aclk),
        .CE(E),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .D(plusOp[4]),
        .Q(Q[4]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gnxpm_cdc.rd_pntr_gc[0]_i_1 
       (.I0(\gnxpm_cdc.rd_pntr_gc_reg[4] [1]),
        .I1(\gnxpm_cdc.rd_pntr_gc_reg[4] [0]),
        .O(\gnxpm_cdc.rd_pntr_gc_reg[3] [0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gnxpm_cdc.rd_pntr_gc[1]_i_1 
       (.I0(\gnxpm_cdc.rd_pntr_gc_reg[4] [2]),
        .I1(\gnxpm_cdc.rd_pntr_gc_reg[4] [1]),
        .O(\gnxpm_cdc.rd_pntr_gc_reg[3] [1]));
  LUT2 #(
    .INIT(4'h6)) 
    \gnxpm_cdc.rd_pntr_gc[2]_i_1 
       (.I0(\gnxpm_cdc.rd_pntr_gc_reg[4] [3]),
        .I1(\gnxpm_cdc.rd_pntr_gc_reg[4] [2]),
        .O(\gnxpm_cdc.rd_pntr_gc_reg[3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gnxpm_cdc.rd_pntr_gc[3]_i_1 
       (.I0(\gnxpm_cdc.rd_pntr_gc_reg[4] [4]),
        .I1(\gnxpm_cdc.rd_pntr_gc_reg[4] [3]),
        .O(\gnxpm_cdc.rd_pntr_gc_reg[3] [3]));
endmodule

module control_sub_axis_fifo_10g_tx_0_rd_dc_fwft_ext_as
   (axis_rd_data_count,
    D,
    m_aclk,
    out);
  output [5:0]axis_rd_data_count;
  input [5:0]D;
  input m_aclk;
  input [0:0]out;

  wire [5:0]D;
  wire [5:0]axis_rd_data_count;
  wire m_aclk;
  wire [0:0]out;

  FDCE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(out),
        .D(D[0]),
        .Q(axis_rd_data_count[0]));
  FDCE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[1] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(out),
        .D(D[1]),
        .Q(axis_rd_data_count[1]));
  FDCE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[2] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(out),
        .D(D[2]),
        .Q(axis_rd_data_count[2]));
  FDCE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[3] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(out),
        .D(D[3]),
        .Q(axis_rd_data_count[3]));
  FDCE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[4] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(out),
        .D(D[4]),
        .Q(axis_rd_data_count[4]));
  FDCE #(
    .INIT(1'b0)) 
    \g_rd.gvalid_low.rd_dc_i_reg[5] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(out),
        .D(D[5]),
        .Q(axis_rd_data_count[5]));
endmodule

module control_sub_axis_fifo_10g_tx_0_rd_fwft
   (out,
    \g_rd.gvalid_low.rd_dc_i_reg[1] ,
    E,
    \gc0.count_reg[4] ,
    ram_empty_fb_i_reg,
    D,
    \g_rd.gvalid_low.rd_dc_i_reg[4] ,
    m_axis_tvalid,
    m_aclk,
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ,
    m_axis_tready,
    ram_empty_fb_i_reg_0,
    Q,
    \gnxpm_cdc.wr_pntr_bin_reg[1] );
  output [0:0]out;
  output \g_rd.gvalid_low.rd_dc_i_reg[1] ;
  output [0:0]E;
  output [0:0]\gc0.count_reg[4] ;
  output ram_empty_fb_i_reg;
  output [1:0]D;
  output \g_rd.gvalid_low.rd_dc_i_reg[4] ;
  output m_axis_tvalid;
  input m_aclk;
  input [1:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ;
  input m_axis_tready;
  input ram_empty_fb_i_reg_0;
  input [1:0]Q;
  input [1:0]\gnxpm_cdc.wr_pntr_bin_reg[1] ;

  wire [1:0]D;
  wire [0:0]E;
  wire [1:0]Q;
  (* DONT_TOUCH *) wire aempty_fwft_fb_i;
  (* DONT_TOUCH *) wire aempty_fwft_i;
  wire aempty_fwft_i0;
  (* DONT_TOUCH *) wire [1:0]curr_fwft_state;
  (* DONT_TOUCH *) wire empty_fwft_fb_i;
  (* DONT_TOUCH *) wire empty_fwft_fb_o_i;
  wire empty_fwft_fb_o_i0;
  (* DONT_TOUCH *) wire empty_fwft_i;
  wire empty_fwft_i0;
  wire \g_rd.gvalid_low.rd_dc_i_reg[4] ;
  wire [0:0]\gc0.count_reg[4] ;
  wire [1:0]\gnxpm_cdc.wr_pntr_bin_reg[1] ;
  wire m_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire [1:0]next_fwft_state;
  wire [1:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ;
  wire ram_empty_fb_i_reg;
  wire ram_empty_fb_i_reg_0;
  (* DONT_TOUCH *) wire user_valid;

  assign \g_rd.gvalid_low.rd_dc_i_reg[1]  = user_valid;
  assign out[0] = curr_fwft_state[1];
  LUT5 #(
    .INIT(32'hEAA888AA)) 
    aempty_fwft_fb_i_i_1
       (.I0(aempty_fwft_fb_i),
        .I1(ram_empty_fb_i_reg_0),
        .I2(m_axis_tready),
        .I3(curr_fwft_state[1]),
        .I4(curr_fwft_state[0]),
        .O(aempty_fwft_i0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    aempty_fwft_fb_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(aempty_fwft_i0),
        .PRE(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] [1]),
        .Q(aempty_fwft_fb_i));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    aempty_fwft_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(aempty_fwft_i0),
        .PRE(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] [1]),
        .Q(aempty_fwft_i));
  LUT4 #(
    .INIT(16'hF320)) 
    empty_fwft_fb_i_i_1
       (.I0(m_axis_tready),
        .I1(curr_fwft_state[1]),
        .I2(curr_fwft_state[0]),
        .I3(empty_fwft_fb_i),
        .O(empty_fwft_i0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    empty_fwft_fb_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(empty_fwft_i0),
        .PRE(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] [1]),
        .Q(empty_fwft_fb_i));
  LUT4 #(
    .INIT(16'hF320)) 
    empty_fwft_fb_o_i_i_1
       (.I0(m_axis_tready),
        .I1(curr_fwft_state[1]),
        .I2(curr_fwft_state[0]),
        .I3(empty_fwft_fb_o_i),
        .O(empty_fwft_fb_o_i0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    empty_fwft_fb_o_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(empty_fwft_fb_o_i0),
        .PRE(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] [1]),
        .Q(empty_fwft_fb_o_i));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    empty_fwft_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(empty_fwft_i0),
        .PRE(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] [1]),
        .Q(empty_fwft_i));
  LUT4 #(
    .INIT(16'h28AA)) 
    \g_rd.gvalid_low.rd_dc_i[0]_i_1 
       (.I0(user_valid),
        .I1(Q[0]),
        .I2(\gnxpm_cdc.wr_pntr_bin_reg[1] [0]),
        .I3(curr_fwft_state[1]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h8008088080088008)) 
    \g_rd.gvalid_low.rd_dc_i[1]_i_1 
       (.I0(user_valid),
        .I1(curr_fwft_state[1]),
        .I2(Q[1]),
        .I3(\gnxpm_cdc.wr_pntr_bin_reg[1] [1]),
        .I4(\gnxpm_cdc.wr_pntr_bin_reg[1] [0]),
        .I5(Q[0]),
        .O(D[1]));
  LUT2 #(
    .INIT(4'h8)) 
    \g_rd.gvalid_low.rd_dc_i[5]_i_2 
       (.I0(curr_fwft_state[1]),
        .I1(user_valid),
        .O(\g_rd.gvalid_low.rd_dc_i_reg[4] ));
  LUT4 #(
    .INIT(16'h00F7)) 
    \gc0.count_d1[4]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(curr_fwft_state[0]),
        .I2(m_axis_tready),
        .I3(ram_empty_fb_i_reg_0),
        .O(\gc0.count_reg[4] ));
  LUT4 #(
    .INIT(16'h00D0)) 
    \goreg_dm.dout_i[272]_i_1 
       (.I0(curr_fwft_state[0]),
        .I1(m_axis_tready),
        .I2(curr_fwft_state[1]),
        .I3(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] [0]),
        .O(E));
  LUT3 #(
    .INIT(8'hBA)) 
    \gpregsm1.curr_fwft_state[0]_i_1 
       (.I0(curr_fwft_state[1]),
        .I1(m_axis_tready),
        .I2(curr_fwft_state[0]),
        .O(next_fwft_state[0]));
  LUT4 #(
    .INIT(16'h40FF)) 
    \gpregsm1.curr_fwft_state[1]_i_1 
       (.I0(m_axis_tready),
        .I1(curr_fwft_state[0]),
        .I2(curr_fwft_state[1]),
        .I3(ram_empty_fb_i_reg_0),
        .O(next_fwft_state[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] [1]),
        .D(next_fwft_state[0]),
        .Q(curr_fwft_state[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gpregsm1.curr_fwft_state_reg[1] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] [1]),
        .D(next_fwft_state[1]),
        .Q(curr_fwft_state[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDCE #(
    .INIT(1'b0)) 
    \gpregsm1.user_valid_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] [1]),
        .D(next_fwft_state[0]),
        .Q(user_valid));
  LUT1 #(
    .INIT(2'h1)) 
    m_axis_tvalid_INST_0
       (.I0(empty_fwft_i),
        .O(m_axis_tvalid));
  LUT4 #(
    .INIT(16'hBAAA)) 
    ram_empty_i_i_2
       (.I0(ram_empty_fb_i_reg_0),
        .I1(m_axis_tready),
        .I2(curr_fwft_state[0]),
        .I3(curr_fwft_state[1]),
        .O(ram_empty_fb_i_reg));
endmodule

module control_sub_axis_fifo_10g_tx_0_rd_logic
   (Q,
    E,
    \gc0.count_reg[4] ,
    ram_empty_fb_i_reg,
    \gnxpm_cdc.rd_pntr_gc_reg[3] ,
    \gnxpm_cdc.rd_pntr_gc_reg[4] ,
    m_axis_tvalid,
    axis_rd_data_count,
    ram_empty_fb_i_reg_0,
    m_aclk,
    out,
    m_axis_tready,
    \gnxpm_cdc.wr_pntr_bin_reg[4] ,
    \gnxpm_cdc.wr_pntr_bin_reg[0] );
  output [4:0]Q;
  output [0:0]E;
  output [0:0]\gc0.count_reg[4] ;
  output ram_empty_fb_i_reg;
  output [3:0]\gnxpm_cdc.rd_pntr_gc_reg[3] ;
  output [4:0]\gnxpm_cdc.rd_pntr_gc_reg[4] ;
  output m_axis_tvalid;
  output [5:0]axis_rd_data_count;
  input ram_empty_fb_i_reg_0;
  input m_aclk;
  input [1:0]out;
  input m_axis_tready;
  input [4:0]\gnxpm_cdc.wr_pntr_bin_reg[4] ;
  input \gnxpm_cdc.wr_pntr_bin_reg[0] ;

  wire [0:0]E;
  wire [4:0]Q;
  wire [5:0]axis_rd_data_count;
  wire [0:0]\gc0.count_reg[4] ;
  wire [3:0]\gnxpm_cdc.rd_pntr_gc_reg[3] ;
  wire [4:0]\gnxpm_cdc.rd_pntr_gc_reg[4] ;
  wire \gnxpm_cdc.wr_pntr_bin_reg[0] ;
  wire [4:0]\gnxpm_cdc.wr_pntr_bin_reg[4] ;
  wire \gr1.gr1_int.rfwft_n_5 ;
  wire \gr1.gr1_int.rfwft_n_6 ;
  wire \gr1.gr1_int.rfwft_n_7 ;
  wire m_aclk;
  wire m_axis_tready;
  wire m_axis_tvalid;
  wire [1:0]out;
  wire p_2_out;
  wire p_3_out;
  wire p_4_out;
  wire ram_empty_fb_i_reg;
  wire ram_empty_fb_i_reg_0;
  wire rpntr_n_14;
  wire rpntr_n_15;
  wire rpntr_n_16;
  wire rpntr_n_17;

  control_sub_axis_fifo_10g_tx_0_rd_fwft \gr1.gr1_int.rfwft 
       (.D({\gr1.gr1_int.rfwft_n_5 ,\gr1.gr1_int.rfwft_n_6 }),
        .E(E),
        .Q(\gnxpm_cdc.rd_pntr_gc_reg[4] [1:0]),
        .\g_rd.gvalid_low.rd_dc_i_reg[1] (p_4_out),
        .\g_rd.gvalid_low.rd_dc_i_reg[4] (\gr1.gr1_int.rfwft_n_7 ),
        .\gc0.count_reg[4] (\gc0.count_reg[4] ),
        .\gnxpm_cdc.wr_pntr_bin_reg[1] (\gnxpm_cdc.wr_pntr_bin_reg[4] [1:0]),
        .m_aclk(m_aclk),
        .m_axis_tready(m_axis_tready),
        .m_axis_tvalid(m_axis_tvalid),
        .\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] (out),
        .out(p_3_out),
        .ram_empty_fb_i_reg(ram_empty_fb_i_reg),
        .ram_empty_fb_i_reg_0(p_2_out));
  control_sub_axis_fifo_10g_tx_0_rd_dc_fwft_ext_as \gr1.grdc2.rdc 
       (.D({rpntr_n_14,rpntr_n_15,rpntr_n_16,rpntr_n_17,\gr1.gr1_int.rfwft_n_5 ,\gr1.gr1_int.rfwft_n_6 }),
        .axis_rd_data_count(axis_rd_data_count),
        .m_aclk(m_aclk),
        .out(out[1]));
  control_sub_axis_fifo_10g_tx_0_rd_status_flags_as \gras.rsts 
       (.m_aclk(m_aclk),
        .\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] (out[1]),
        .out(p_2_out),
        .ram_empty_fb_i_reg_0(ram_empty_fb_i_reg_0));
  control_sub_axis_fifo_10g_tx_0_rd_bin_cntr rpntr
       (.D({rpntr_n_14,rpntr_n_15,rpntr_n_16,rpntr_n_17}),
        .E(\gc0.count_reg[4] ),
        .Q(Q),
        .\gnxpm_cdc.rd_pntr_gc_reg[3] (\gnxpm_cdc.rd_pntr_gc_reg[3] ),
        .\gnxpm_cdc.rd_pntr_gc_reg[4] (\gnxpm_cdc.rd_pntr_gc_reg[4] ),
        .\gnxpm_cdc.wr_pntr_bin_reg[0] (\gnxpm_cdc.wr_pntr_bin_reg[0] ),
        .\gnxpm_cdc.wr_pntr_bin_reg[4] (\gnxpm_cdc.wr_pntr_bin_reg[4] ),
        .\gpregsm1.curr_fwft_state_reg[1] (\gr1.gr1_int.rfwft_n_7 ),
        .\gpregsm1.user_valid_reg (p_4_out),
        .m_aclk(m_aclk),
        .\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] (out[1]),
        .out(p_3_out));
endmodule

module control_sub_axis_fifo_10g_tx_0_rd_status_flags_as
   (out,
    ram_empty_fb_i_reg_0,
    m_aclk,
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] );
  output out;
  input ram_empty_fb_i_reg_0;
  input m_aclk;
  input [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ;

  wire m_aclk;
  wire [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ;
  (* DONT_TOUCH *) wire ram_empty_fb_i;
  wire ram_empty_fb_i_reg_0;
  (* DONT_TOUCH *) wire ram_empty_i;

  assign out = ram_empty_fb_i;
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    ram_empty_fb_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(ram_empty_fb_i_reg_0),
        .PRE(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .Q(ram_empty_fb_i));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    ram_empty_i_reg
       (.C(m_aclk),
        .CE(1'b1),
        .D(ram_empty_fb_i_reg_0),
        .PRE(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] ),
        .Q(ram_empty_i));
endmodule

module control_sub_axis_fifo_10g_tx_0_reset_blk_ramfifo
   (out,
    \gc0.count_reg[1] ,
    \grstd1.grst_full.grst_f.rst_d3_reg_0 ,
    ram_full_i_reg,
    m_aclk,
    s_aclk,
    s_aresetn);
  output [1:0]out;
  output [2:0]\gc0.count_reg[1] ;
  output \grstd1.grst_full.grst_f.rst_d3_reg_0 ;
  output ram_full_i_reg;
  input m_aclk;
  input s_aclk;
  input s_aresetn;

  wire inverted_reset;
  wire m_aclk;
  wire \ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[1].rrst_inst_n_1 ;
  wire \ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[1].wrst_inst_n_1 ;
  wire \ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[2].rrst_inst_n_0 ;
  wire \ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[2].wrst_inst_n_0 ;
  wire p_7_out;
  wire p_8_out;
  wire rd_rst_asreg;
  (* DONT_TOUCH *) wire [2:0]rd_rst_reg;
  (* async_reg = "true" *) (* msgon = "false" *) wire rst_d1;
  (* async_reg = "true" *) (* msgon = "false" *) wire rst_d2;
  (* async_reg = "true" *) (* msgon = "false" *) wire rst_d3;
  (* async_reg = "true" *) (* msgon = "false" *) wire rst_rd_reg1;
  (* async_reg = "true" *) (* msgon = "false" *) wire rst_rd_reg2;
  (* async_reg = "true" *) (* msgon = "false" *) wire rst_wr_reg1;
  (* async_reg = "true" *) (* msgon = "false" *) wire rst_wr_reg2;
  wire s_aclk;
  wire s_aresetn;
  wire wr_rst_asreg;
  (* DONT_TOUCH *) wire [2:0]wr_rst_reg;

  assign \gc0.count_reg[1] [2:0] = rd_rst_reg;
  assign \grstd1.grst_full.grst_f.rst_d3_reg_0  = rst_d2;
  assign out[1:0] = wr_rst_reg[1:0];
  assign ram_full_i_reg = rst_d3;
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "false" *) 
  FDPE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d1_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(rst_wr_reg2),
        .Q(rst_d1));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "false" *) 
  FDPE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d2_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rst_d1),
        .PRE(rst_wr_reg2),
        .Q(rst_d2));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "false" *) 
  FDPE #(
    .INIT(1'b1)) 
    \grstd1.grst_full.grst_f.rst_d3_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rst_d2),
        .PRE(rst_wr_reg2),
        .Q(rst_d3));
  control_sub_axis_fifo_10g_tx_0_synchronizer_ff \ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[1].rrst_inst 
       (.in0(rd_rst_asreg),
        .m_aclk(m_aclk),
        .\ngwrdrst.grst.g7serrst.rd_rst_asreg_reg (\ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[1].rrst_inst_n_1 ),
        .out(p_7_out));
  control_sub_axis_fifo_10g_tx_0_synchronizer_ff_0 \ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[1].wrst_inst 
       (.in0(wr_rst_asreg),
        .\ngwrdrst.grst.g7serrst.wr_rst_asreg_reg (\ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[1].wrst_inst_n_1 ),
        .out(p_8_out),
        .s_aclk(s_aclk));
  control_sub_axis_fifo_10g_tx_0_synchronizer_ff_1 \ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[2].rrst_inst 
       (.AS(\ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[2].rrst_inst_n_0 ),
        .in0(rd_rst_asreg),
        .m_aclk(m_aclk),
        .out(p_7_out));
  control_sub_axis_fifo_10g_tx_0_synchronizer_ff_2 \ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[2].wrst_inst 
       (.AS(\ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[2].wrst_inst_n_0 ),
        .in0(wr_rst_asreg),
        .out(p_8_out),
        .s_aclk(s_aclk));
  FDPE #(
    .INIT(1'b1)) 
    \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[1].rrst_inst_n_1 ),
        .PRE(rst_rd_reg2),
        .Q(rd_rst_asreg));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[2].rrst_inst_n_0 ),
        .Q(rd_rst_reg[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[2].rrst_inst_n_0 ),
        .Q(rd_rst_reg[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[2] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[2].rrst_inst_n_0 ),
        .Q(rd_rst_reg[2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "false" *) 
  FDPE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.rst_rd_reg1_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(inverted_reset),
        .Q(rst_rd_reg1));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "false" *) 
  FDPE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.rst_rd_reg2_reg 
       (.C(m_aclk),
        .CE(1'b1),
        .D(rst_rd_reg1),
        .PRE(inverted_reset),
        .Q(rst_rd_reg2));
  LUT1 #(
    .INIT(2'h1)) 
    \ngwrdrst.grst.g7serrst.rst_wr_reg1_i_1 
       (.I0(s_aresetn),
        .O(inverted_reset));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "false" *) 
  FDPE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.rst_wr_reg1_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(inverted_reset),
        .Q(rst_wr_reg1));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "false" *) 
  FDPE #(
    .INIT(1'b0)) 
    \ngwrdrst.grst.g7serrst.rst_wr_reg2_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(rst_wr_reg1),
        .PRE(inverted_reset),
        .Q(rst_wr_reg2));
  FDPE #(
    .INIT(1'b1)) 
    \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg 
       (.C(s_aclk),
        .CE(1'b1),
        .D(\ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[1].wrst_inst_n_1 ),
        .PRE(rst_wr_reg2),
        .Q(wr_rst_asreg));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[2].wrst_inst_n_0 ),
        .Q(wr_rst_reg[0]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[1] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[2].wrst_inst_n_0 ),
        .Q(wr_rst_reg[1]));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    \ngwrdrst.grst.g7serrst.wr_rst_reg_reg[2] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(1'b0),
        .PRE(\ngwrdrst.grst.g7serrst.gwrrd_rst_sync_stage[2].wrst_inst_n_0 ),
        .Q(wr_rst_reg[2]));
endmodule

module control_sub_axis_fifo_10g_tx_0_synchronizer_ff
   (out,
    \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg ,
    in0,
    m_aclk);
  output out;
  output \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg ;
  input [0:0]in0;
  input m_aclk;

  (* async_reg = "true" *) (* msgon = "true" *) wire Q_reg;
  wire [0:0]in0;
  wire m_aclk;
  wire \ngwrdrst.grst.g7serrst.rd_rst_asreg_reg ;

  assign out = Q_reg;
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(in0),
        .Q(Q_reg),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \ngwrdrst.grst.g7serrst.rd_rst_asreg_i_1 
       (.I0(in0),
        .I1(Q_reg),
        .O(\ngwrdrst.grst.g7serrst.rd_rst_asreg_reg ));
endmodule

(* ORIG_REF_NAME = "synchronizer_ff" *) 
module control_sub_axis_fifo_10g_tx_0_synchronizer_ff_0
   (out,
    \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg ,
    in0,
    s_aclk);
  output out;
  output \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg ;
  input [0:0]in0;
  input s_aclk;

  (* async_reg = "true" *) (* msgon = "true" *) wire Q_reg;
  wire [0:0]in0;
  wire \ngwrdrst.grst.g7serrst.wr_rst_asreg_reg ;
  wire s_aclk;

  assign out = Q_reg;
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(in0),
        .Q(Q_reg),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \ngwrdrst.grst.g7serrst.wr_rst_asreg_i_1 
       (.I0(in0),
        .I1(Q_reg),
        .O(\ngwrdrst.grst.g7serrst.wr_rst_asreg_reg ));
endmodule

(* ORIG_REF_NAME = "synchronizer_ff" *) 
module control_sub_axis_fifo_10g_tx_0_synchronizer_ff_1
   (AS,
    out,
    m_aclk,
    in0);
  output [0:0]AS;
  input out;
  input m_aclk;
  input [0:0]in0;

  wire [0:0]AS;
  (* async_reg = "true" *) (* msgon = "true" *) wire Q_reg;
  wire [0:0]in0;
  wire m_aclk;
  wire out;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .D(out),
        .Q(Q_reg),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \ngwrdrst.grst.g7serrst.rd_rst_reg[2]_i_1 
       (.I0(in0),
        .I1(Q_reg),
        .O(AS));
endmodule

(* ORIG_REF_NAME = "synchronizer_ff" *) 
module control_sub_axis_fifo_10g_tx_0_synchronizer_ff_2
   (AS,
    out,
    s_aclk,
    in0);
  output [0:0]AS;
  input out;
  input s_aclk;
  input [0:0]in0;

  wire [0:0]AS;
  (* async_reg = "true" *) (* msgon = "true" *) wire Q_reg;
  wire [0:0]in0;
  wire out;
  wire s_aclk;

  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDRE #(
    .INIT(1'b0)) 
    \Q_reg_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .D(out),
        .Q(Q_reg),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \ngwrdrst.grst.g7serrst.wr_rst_reg[2]_i_1 
       (.I0(in0),
        .I1(Q_reg),
        .O(AS));
endmodule

(* ORIG_REF_NAME = "synchronizer_ff" *) 
module control_sub_axis_fifo_10g_tx_0_synchronizer_ff__parameterized0
   (D,
    Q,
    m_aclk,
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] );
  output [4:0]D;
  input [4:0]Q;
  input m_aclk;
  input [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ;

  wire [4:0]Q;
  (* async_reg = "true" *) (* msgon = "true" *) wire [4:0]Q_reg;
  wire m_aclk;
  wire [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ;

  assign D[4:0] = Q_reg;
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(Q[0]),
        .Q(Q_reg[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[1] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(Q[1]),
        .Q(Q_reg[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[2] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(Q[2]),
        .Q(Q_reg[2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[3] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(Q[3]),
        .Q(Q_reg[3]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[4] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(Q[4]),
        .Q(Q_reg[4]));
endmodule

(* ORIG_REF_NAME = "synchronizer_ff" *) 
module control_sub_axis_fifo_10g_tx_0_synchronizer_ff__parameterized1
   (D,
    Q,
    s_aclk,
    AR);
  output [4:0]D;
  input [4:0]Q;
  input s_aclk;
  input [0:0]AR;

  wire [0:0]AR;
  wire [4:0]Q;
  (* async_reg = "true" *) (* msgon = "true" *) wire [4:0]Q_reg;
  wire s_aclk;

  assign D[4:0] = Q_reg;
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(Q[0]),
        .Q(Q_reg[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[1] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(Q[1]),
        .Q(Q_reg[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[2] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(Q[2]),
        .Q(Q_reg[2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[3] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(Q[3]),
        .Q(Q_reg[3]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[4] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(Q[4]),
        .Q(Q_reg[4]));
endmodule

(* ORIG_REF_NAME = "synchronizer_ff" *) 
module control_sub_axis_fifo_10g_tx_0_synchronizer_ff__parameterized2
   (out,
    D,
    \Q_reg_reg[4]_0 ,
    m_aclk,
    \ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] );
  output [4:0]out;
  output [0:0]D;
  input [4:0]\Q_reg_reg[4]_0 ;
  input m_aclk;
  input [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ;

  wire [0:0]D;
  (* async_reg = "true" *) (* msgon = "true" *) wire [4:0]Q_reg;
  wire [4:0]\Q_reg_reg[4]_0 ;
  wire m_aclk;
  wire [0:0]\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ;

  assign out[4:0] = Q_reg;
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[0] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\Q_reg_reg[4]_0 [0]),
        .Q(Q_reg[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[1] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\Q_reg_reg[4]_0 [1]),
        .Q(Q_reg[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[2] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\Q_reg_reg[4]_0 [2]),
        .Q(Q_reg[2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[3] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\Q_reg_reg[4]_0 [3]),
        .Q(Q_reg[3]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[4] 
       (.C(m_aclk),
        .CE(1'b1),
        .CLR(\ngwrdrst.grst.g7serrst.rd_rst_reg_reg[1] ),
        .D(\Q_reg_reg[4]_0 [4]),
        .Q(Q_reg[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \gnxpm_cdc.wr_pntr_bin[3]_i_1 
       (.I0(Q_reg[3]),
        .I1(Q_reg[4]),
        .O(D));
endmodule

(* ORIG_REF_NAME = "synchronizer_ff" *) 
module control_sub_axis_fifo_10g_tx_0_synchronizer_ff__parameterized3
   (out,
    D,
    \Q_reg_reg[4]_0 ,
    s_aclk,
    AR);
  output [4:0]out;
  output [0:0]D;
  input [4:0]\Q_reg_reg[4]_0 ;
  input s_aclk;
  input [0:0]AR;

  wire [0:0]AR;
  wire [0:0]D;
  (* async_reg = "true" *) (* msgon = "true" *) wire [4:0]Q_reg;
  wire [4:0]\Q_reg_reg[4]_0 ;
  wire s_aclk;

  assign out[4:0] = Q_reg;
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\Q_reg_reg[4]_0 [0]),
        .Q(Q_reg[0]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[1] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\Q_reg_reg[4]_0 [1]),
        .Q(Q_reg[1]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[2] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\Q_reg_reg[4]_0 [2]),
        .Q(Q_reg[2]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[3] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\Q_reg_reg[4]_0 [3]),
        .Q(Q_reg[3]));
  (* ASYNC_REG *) 
  (* KEEP = "yes" *) 
  (* msgon = "true" *) 
  FDCE #(
    .INIT(1'b0)) 
    \Q_reg_reg[4] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(\Q_reg_reg[4]_0 [4]),
        .Q(Q_reg[4]));
  LUT2 #(
    .INIT(4'h6)) 
    \gnxpm_cdc.rd_pntr_bin[3]_i_1 
       (.I0(Q_reg[3]),
        .I1(Q_reg[4]),
        .O(D));
endmodule

module control_sub_axis_fifo_10g_tx_0_wr_bin_cntr
   (Q,
    \gnxpm_cdc.wr_pntr_gc_reg[3] ,
    \gnxpm_cdc.wr_pntr_gc_reg[4] ,
    ram_full_i_reg,
    D,
    \wr_data_count_i_reg[4] ,
    \gic0.gc0.count_d2_reg[3]_0 ,
    \grstd1.grst_full.grst_f.rst_d3_reg ,
    \gnxpm_cdc.rd_pntr_bin_reg[3] ,
    \gnxpm_cdc.rd_pntr_bin_reg[4] ,
    E,
    s_aclk,
    AR);
  output [0:0]Q;
  output [3:0]\gnxpm_cdc.wr_pntr_gc_reg[3] ;
  output [4:0]\gnxpm_cdc.wr_pntr_gc_reg[4] ;
  output ram_full_i_reg;
  output [3:0]D;
  output \wr_data_count_i_reg[4] ;
  output [0:0]\gic0.gc0.count_d2_reg[3]_0 ;
  input \grstd1.grst_full.grst_f.rst_d3_reg ;
  input \gnxpm_cdc.rd_pntr_bin_reg[3] ;
  input [4:0]\gnxpm_cdc.rd_pntr_bin_reg[4] ;
  input [0:0]E;
  input s_aclk;
  input [0:0]AR;

  wire [0:0]AR;
  wire [3:0]D;
  wire [0:0]E;
  wire [0:0]Q;
  wire [0:0]\gic0.gc0.count_d2_reg[3]_0 ;
  wire \gnxpm_cdc.rd_pntr_bin_reg[3] ;
  wire [4:0]\gnxpm_cdc.rd_pntr_bin_reg[4] ;
  wire [3:0]\gnxpm_cdc.wr_pntr_gc_reg[3] ;
  wire [4:0]\gnxpm_cdc.wr_pntr_gc_reg[4] ;
  wire \grstd1.grst_full.grst_f.rst_d3_reg ;
  wire [4:0]p_13_out;
  wire [4:0]plusOp__0;
  wire ram_full_i_i_2_n_0;
  wire ram_full_i_i_3_n_0;
  wire ram_full_i_i_5_n_0;
  wire ram_full_i_i_6_n_0;
  wire ram_full_i_reg;
  wire s_aclk;
  wire \wr_data_count_i[3]_i_2_n_0 ;
  wire \wr_data_count_i[3]_i_3_n_0 ;
  wire \wr_data_count_i_reg[4] ;
  wire [4:0]wr_pntr_plus2;

  LUT1 #(
    .INIT(2'h1)) 
    \gic0.gc0.count[0]_i_1 
       (.I0(wr_pntr_plus2[0]),
        .O(plusOp__0[0]));
  LUT2 #(
    .INIT(4'h6)) 
    \gic0.gc0.count[1]_i_1 
       (.I0(wr_pntr_plus2[0]),
        .I1(wr_pntr_plus2[1]),
        .O(plusOp__0[1]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \gic0.gc0.count[2]_i_1 
       (.I0(wr_pntr_plus2[0]),
        .I1(wr_pntr_plus2[1]),
        .I2(wr_pntr_plus2[2]),
        .O(plusOp__0[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \gic0.gc0.count[3]_i_1 
       (.I0(wr_pntr_plus2[1]),
        .I1(wr_pntr_plus2[0]),
        .I2(wr_pntr_plus2[2]),
        .I3(Q),
        .O(plusOp__0[3]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \gic0.gc0.count[4]_i_1 
       (.I0(wr_pntr_plus2[2]),
        .I1(wr_pntr_plus2[0]),
        .I2(wr_pntr_plus2[1]),
        .I3(Q),
        .I4(wr_pntr_plus2[4]),
        .O(plusOp__0[4]));
  FDPE #(
    .INIT(1'b1)) 
    \gic0.gc0.count_d1_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .D(wr_pntr_plus2[0]),
        .PRE(AR),
        .Q(p_13_out[0]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[1]),
        .Q(p_13_out[1]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[2]),
        .Q(p_13_out[2]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(Q),
        .Q(\gic0.gc0.count_d2_reg[3]_0 ));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d1_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(wr_pntr_plus2[4]),
        .Q(p_13_out[4]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(p_13_out[0]),
        .Q(\gnxpm_cdc.wr_pntr_gc_reg[4] [0]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(p_13_out[1]),
        .Q(\gnxpm_cdc.wr_pntr_gc_reg[4] [1]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(p_13_out[2]),
        .Q(\gnxpm_cdc.wr_pntr_gc_reg[4] [2]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(\gic0.gc0.count_d2_reg[3]_0 ),
        .Q(\gnxpm_cdc.wr_pntr_gc_reg[4] [3]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_d2_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(p_13_out[4]),
        .Q(\gnxpm_cdc.wr_pntr_gc_reg[4] [4]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[0] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[0]),
        .Q(wr_pntr_plus2[0]));
  FDPE #(
    .INIT(1'b1)) 
    \gic0.gc0.count_reg[1] 
       (.C(s_aclk),
        .CE(E),
        .D(plusOp__0[1]),
        .PRE(AR),
        .Q(wr_pntr_plus2[1]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[2] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[2]),
        .Q(wr_pntr_plus2[2]));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[3] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[3]),
        .Q(Q));
  FDCE #(
    .INIT(1'b0)) 
    \gic0.gc0.count_reg[4] 
       (.C(s_aclk),
        .CE(E),
        .CLR(AR),
        .D(plusOp__0[4]),
        .Q(wr_pntr_plus2[4]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gnxpm_cdc.wr_pntr_gc[0]_i_1 
       (.I0(\gnxpm_cdc.wr_pntr_gc_reg[4] [0]),
        .I1(\gnxpm_cdc.wr_pntr_gc_reg[4] [1]),
        .O(\gnxpm_cdc.wr_pntr_gc_reg[3] [0]));
  LUT2 #(
    .INIT(4'h6)) 
    \gnxpm_cdc.wr_pntr_gc[1]_i_1 
       (.I0(\gnxpm_cdc.wr_pntr_gc_reg[4] [1]),
        .I1(\gnxpm_cdc.wr_pntr_gc_reg[4] [2]),
        .O(\gnxpm_cdc.wr_pntr_gc_reg[3] [1]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gnxpm_cdc.wr_pntr_gc[2]_i_1 
       (.I0(\gnxpm_cdc.wr_pntr_gc_reg[4] [2]),
        .I1(\gnxpm_cdc.wr_pntr_gc_reg[4] [3]),
        .O(\gnxpm_cdc.wr_pntr_gc_reg[3] [2]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \gnxpm_cdc.wr_pntr_gc[3]_i_1 
       (.I0(\gnxpm_cdc.wr_pntr_gc_reg[4] [3]),
        .I1(\gnxpm_cdc.wr_pntr_gc_reg[4] [4]),
        .O(\gnxpm_cdc.wr_pntr_gc_reg[3] [3]));
  LUT6 #(
    .INIT(64'h101010FF10101010)) 
    ram_full_i_i_1
       (.I0(ram_full_i_i_2_n_0),
        .I1(ram_full_i_i_3_n_0),
        .I2(\grstd1.grst_full.grst_f.rst_d3_reg ),
        .I3(ram_full_i_i_5_n_0),
        .I4(ram_full_i_i_6_n_0),
        .I5(\gnxpm_cdc.rd_pntr_bin_reg[3] ),
        .O(ram_full_i_reg));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    ram_full_i_i_2
       (.I0(wr_pntr_plus2[0]),
        .I1(\gnxpm_cdc.rd_pntr_bin_reg[4] [0]),
        .I2(wr_pntr_plus2[1]),
        .I3(\gnxpm_cdc.rd_pntr_bin_reg[4] [1]),
        .O(ram_full_i_i_2_n_0));
  LUT4 #(
    .INIT(16'h6FF6)) 
    ram_full_i_i_3
       (.I0(wr_pntr_plus2[2]),
        .I1(\gnxpm_cdc.rd_pntr_bin_reg[4] [2]),
        .I2(wr_pntr_plus2[4]),
        .I3(\gnxpm_cdc.rd_pntr_bin_reg[4] [4]),
        .O(ram_full_i_i_3_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT4 #(
    .INIT(16'h6FF6)) 
    ram_full_i_i_5
       (.I0(p_13_out[0]),
        .I1(\gnxpm_cdc.rd_pntr_bin_reg[4] [0]),
        .I2(p_13_out[1]),
        .I3(\gnxpm_cdc.rd_pntr_bin_reg[4] [1]),
        .O(ram_full_i_i_5_n_0));
  LUT4 #(
    .INIT(16'h6FF6)) 
    ram_full_i_i_6
       (.I0(p_13_out[2]),
        .I1(\gnxpm_cdc.rd_pntr_bin_reg[4] [2]),
        .I2(p_13_out[4]),
        .I3(\gnxpm_cdc.rd_pntr_bin_reg[4] [4]),
        .O(ram_full_i_i_6_n_0));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \wr_data_count_i[0]_i_1 
       (.I0(\gnxpm_cdc.wr_pntr_gc_reg[4] [0]),
        .I1(\gnxpm_cdc.rd_pntr_bin_reg[4] [0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT4 #(
    .INIT(16'hB44B)) 
    \wr_data_count_i[1]_i_1 
       (.I0(\gnxpm_cdc.wr_pntr_gc_reg[4] [0]),
        .I1(\gnxpm_cdc.rd_pntr_bin_reg[4] [0]),
        .I2(\gnxpm_cdc.rd_pntr_bin_reg[4] [1]),
        .I3(\gnxpm_cdc.wr_pntr_gc_reg[4] [1]),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h04B0FB4FFB4F04B0)) 
    \wr_data_count_i[2]_i_1 
       (.I0(\gnxpm_cdc.wr_pntr_gc_reg[4] [0]),
        .I1(\gnxpm_cdc.rd_pntr_bin_reg[4] [0]),
        .I2(\gnxpm_cdc.wr_pntr_gc_reg[4] [1]),
        .I3(\gnxpm_cdc.rd_pntr_bin_reg[4] [1]),
        .I4(\gnxpm_cdc.rd_pntr_bin_reg[4] [2]),
        .I5(\gnxpm_cdc.wr_pntr_gc_reg[4] [2]),
        .O(D[2]));
  LUT6 #(
    .INIT(64'h1781E87EE87E1781)) 
    \wr_data_count_i[3]_i_1 
       (.I0(\wr_data_count_i[3]_i_2_n_0 ),
        .I1(\wr_data_count_i[3]_i_3_n_0 ),
        .I2(\gnxpm_cdc.wr_pntr_gc_reg[4] [2]),
        .I3(\gnxpm_cdc.rd_pntr_bin_reg[4] [2]),
        .I4(\gnxpm_cdc.rd_pntr_bin_reg[4] [3]),
        .I5(\gnxpm_cdc.wr_pntr_gc_reg[4] [3]),
        .O(D[3]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'h6696)) 
    \wr_data_count_i[3]_i_2 
       (.I0(\gnxpm_cdc.wr_pntr_gc_reg[4] [1]),
        .I1(\gnxpm_cdc.rd_pntr_bin_reg[4] [1]),
        .I2(\gnxpm_cdc.rd_pntr_bin_reg[4] [0]),
        .I3(\gnxpm_cdc.wr_pntr_gc_reg[4] [0]),
        .O(\wr_data_count_i[3]_i_2_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT4 #(
    .INIT(16'hB0FB)) 
    \wr_data_count_i[3]_i_3 
       (.I0(\gnxpm_cdc.wr_pntr_gc_reg[4] [0]),
        .I1(\gnxpm_cdc.rd_pntr_bin_reg[4] [0]),
        .I2(\gnxpm_cdc.wr_pntr_gc_reg[4] [1]),
        .I3(\gnxpm_cdc.rd_pntr_bin_reg[4] [1]),
        .O(\wr_data_count_i[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hB0FB0000FFFFB0FB)) 
    \wr_data_count_i[5]_i_2 
       (.I0(\gnxpm_cdc.wr_pntr_gc_reg[4] [0]),
        .I1(\gnxpm_cdc.rd_pntr_bin_reg[4] [0]),
        .I2(\gnxpm_cdc.wr_pntr_gc_reg[4] [1]),
        .I3(\gnxpm_cdc.rd_pntr_bin_reg[4] [1]),
        .I4(\gnxpm_cdc.wr_pntr_gc_reg[4] [2]),
        .I5(\gnxpm_cdc.rd_pntr_bin_reg[4] [2]),
        .O(\wr_data_count_i_reg[4] ));
endmodule

module control_sub_axis_fifo_10g_tx_0_wr_dc_fwft_ext_as
   (axis_wr_data_count,
    D,
    s_aclk,
    AR);
  output [5:0]axis_wr_data_count;
  input [5:0]D;
  input s_aclk;
  input [0:0]AR;

  wire [0:0]AR;
  wire [5:0]D;
  wire [5:0]axis_wr_data_count;
  wire s_aclk;

  FDCE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[0] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[0]),
        .Q(axis_wr_data_count[0]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[1] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[1]),
        .Q(axis_wr_data_count[1]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[2] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[2]),
        .Q(axis_wr_data_count[2]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[3] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[3]),
        .Q(axis_wr_data_count[3]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[4] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[4]),
        .Q(axis_wr_data_count[4]));
  FDCE #(
    .INIT(1'b0)) 
    \wr_data_count_i_reg[5] 
       (.C(s_aclk),
        .CE(1'b1),
        .CLR(AR),
        .D(D[5]),
        .Q(axis_wr_data_count[5]));
endmodule

module control_sub_axis_fifo_10g_tx_0_wr_logic
   (\gnxpm_cdc.wr_pntr_gc_reg[3] ,
    Q,
    E,
    \gic0.gc0.count_d2_reg[3] ,
    \wr_data_count_i_reg[4] ,
    s_axis_tready,
    axis_wr_data_count,
    s_aclk,
    out,
    \gnxpm_cdc.rd_pntr_bin_reg[3] ,
    wr_rst_busy,
    s_axis_tvalid,
    \gnxpm_cdc.rd_pntr_bin_reg[4] ,
    AR,
    D);
  output [3:0]\gnxpm_cdc.wr_pntr_gc_reg[3] ;
  output [4:0]Q;
  output [0:0]E;
  output [0:0]\gic0.gc0.count_d2_reg[3] ;
  output \wr_data_count_i_reg[4] ;
  output s_axis_tready;
  output [5:0]axis_wr_data_count;
  input s_aclk;
  input out;
  input \gnxpm_cdc.rd_pntr_bin_reg[3] ;
  input wr_rst_busy;
  input s_axis_tvalid;
  input [4:0]\gnxpm_cdc.rd_pntr_bin_reg[4] ;
  input [0:0]AR;
  input [1:0]D;

  wire [0:0]AR;
  wire [1:0]D;
  wire [0:0]E;
  wire [4:0]Q;
  wire [5:0]axis_wr_data_count;
  wire [0:0]\gic0.gc0.count_d2_reg[3] ;
  wire \gnxpm_cdc.rd_pntr_bin_reg[3] ;
  wire [4:0]\gnxpm_cdc.rd_pntr_bin_reg[4] ;
  wire [3:0]\gnxpm_cdc.wr_pntr_gc_reg[3] ;
  wire \gwas.wsts_n_0 ;
  wire out;
  wire s_aclk;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire wpntr_n_10;
  wire wpntr_n_11;
  wire wpntr_n_12;
  wire wpntr_n_13;
  wire wpntr_n_14;
  wire \wr_data_count_i_reg[4] ;
  wire [3:3]wr_pntr_plus2;
  wire wr_rst_busy;

  control_sub_axis_fifo_10g_tx_0_wr_dc_fwft_ext_as \gwas.gwdc1.wdcext 
       (.AR(AR),
        .D({D,wpntr_n_11,wpntr_n_12,wpntr_n_13,wpntr_n_14}),
        .axis_wr_data_count(axis_wr_data_count),
        .s_aclk(s_aclk));
  control_sub_axis_fifo_10g_tx_0_wr_status_flags_as \gwas.wsts 
       (.E(E),
        .Q(wr_pntr_plus2),
        .\gic0.gc0.count_reg[0] (wpntr_n_10),
        .\gnxpm_cdc.rd_pntr_bin_reg[3] (\gnxpm_cdc.rd_pntr_bin_reg[4] [3]),
        .out(out),
        .ram_full_i_reg_0(\gwas.wsts_n_0 ),
        .s_aclk(s_aclk),
        .s_axis_tready(s_axis_tready),
        .s_axis_tvalid(s_axis_tvalid),
        .wr_rst_busy(wr_rst_busy));
  control_sub_axis_fifo_10g_tx_0_wr_bin_cntr wpntr
       (.AR(AR),
        .D({wpntr_n_11,wpntr_n_12,wpntr_n_13,wpntr_n_14}),
        .E(E),
        .Q(wr_pntr_plus2),
        .\gic0.gc0.count_d2_reg[3]_0 (\gic0.gc0.count_d2_reg[3] ),
        .\gnxpm_cdc.rd_pntr_bin_reg[3] (\gnxpm_cdc.rd_pntr_bin_reg[3] ),
        .\gnxpm_cdc.rd_pntr_bin_reg[4] (\gnxpm_cdc.rd_pntr_bin_reg[4] ),
        .\gnxpm_cdc.wr_pntr_gc_reg[3] (\gnxpm_cdc.wr_pntr_gc_reg[3] ),
        .\gnxpm_cdc.wr_pntr_gc_reg[4] (Q),
        .\grstd1.grst_full.grst_f.rst_d3_reg (\gwas.wsts_n_0 ),
        .ram_full_i_reg(wpntr_n_10),
        .s_aclk(s_aclk),
        .\wr_data_count_i_reg[4] (\wr_data_count_i_reg[4] ));
endmodule

module control_sub_axis_fifo_10g_tx_0_wr_status_flags_as
   (ram_full_i_reg_0,
    E,
    s_axis_tready,
    \gic0.gc0.count_reg[0] ,
    s_aclk,
    out,
    wr_rst_busy,
    s_axis_tvalid,
    Q,
    \gnxpm_cdc.rd_pntr_bin_reg[3] );
  output ram_full_i_reg_0;
  output [0:0]E;
  output s_axis_tready;
  input \gic0.gc0.count_reg[0] ;
  input s_aclk;
  input out;
  input wr_rst_busy;
  input s_axis_tvalid;
  input [0:0]Q;
  input [0:0]\gnxpm_cdc.rd_pntr_bin_reg[3] ;

  wire [0:0]E;
  wire [0:0]Q;
  wire \gic0.gc0.count_reg[0] ;
  wire [0:0]\gnxpm_cdc.rd_pntr_bin_reg[3] ;
  wire out;
  (* DONT_TOUCH *) wire ram_full_fb_i;
  (* DONT_TOUCH *) wire ram_full_i;
  wire ram_full_i_reg_0;
  wire s_aclk;
  wire s_axis_tready;
  wire s_axis_tvalid;
  wire wr_rst_busy;

  LUT2 #(
    .INIT(4'h2)) 
    \gic0.gc0.count_d1[4]_i_1 
       (.I0(s_axis_tvalid),
        .I1(ram_full_fb_i),
        .O(E));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    ram_full_fb_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(\gic0.gc0.count_reg[0] ),
        .PRE(out),
        .Q(ram_full_fb_i));
  LUT5 #(
    .INIT(32'h04000004)) 
    ram_full_i_i_4
       (.I0(wr_rst_busy),
        .I1(s_axis_tvalid),
        .I2(ram_full_fb_i),
        .I3(Q),
        .I4(\gnxpm_cdc.rd_pntr_bin_reg[3] ),
        .O(ram_full_i_reg_0));
  (* DONT_TOUCH *) 
  (* KEEP = "yes" *) 
  (* equivalent_register_removal = "no" *) 
  FDPE #(
    .INIT(1'b1)) 
    ram_full_i_reg
       (.C(s_aclk),
        .CE(1'b1),
        .D(\gic0.gc0.count_reg[0] ),
        .PRE(out),
        .Q(ram_full_i));
  LUT1 #(
    .INIT(2'h1)) 
    s_axis_tready_INST_0
       (.I0(ram_full_i),
        .O(s_axis_tready));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
