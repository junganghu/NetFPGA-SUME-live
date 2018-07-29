// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Sat Jul 28 21:15:03 2018
// Host        : sume running 64-bit Ubuntu 14.04.5 LTS
// Command     : write_verilog -force -mode funcsim
//               /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_dwidth_dma_tx_0/control_sub_axis_dwidth_dma_tx_0_sim_netlist.v
// Design      : control_sub_axis_dwidth_dma_tx_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7vx690tffg1761-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "control_sub_axis_dwidth_dma_tx_0,axis_dwidth_converter_v1_1_10_axis_dwidth_converter,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* X_CORE_INFO = "axis_dwidth_converter_v1_1_10_axis_dwidth_converter,Vivado 2016.4" *) 
(* NotValidForBitStream *)
module control_sub_axis_dwidth_dma_tx_0
   (aclk,
    aresetn,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tdata,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tuser,
    m_axis_tvalid,
    m_axis_tready,
    m_axis_tdata,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tuser);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLKIF CLK" *) input aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RSTIF RST" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TVALID" *) input s_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TREADY" *) output s_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TDATA" *) input [127:0]s_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TKEEP" *) input [15:0]s_axis_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TLAST" *) input s_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 S_AXIS TUSER" *) input [127:0]s_axis_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TVALID" *) output m_axis_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TREADY" *) input m_axis_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TDATA" *) output [255:0]m_axis_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TKEEP" *) output [31:0]m_axis_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TLAST" *) output m_axis_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 M_AXIS TUSER" *) output [255:0]m_axis_tuser;

  wire aclk;
  wire aresetn;
  wire [255:0]m_axis_tdata;
  wire [31:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [255:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire [127:0]s_axis_tdata;
  wire [15:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [127:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire [0:0]NLW_inst_m_axis_tdest_UNCONNECTED;
  wire [0:0]NLW_inst_m_axis_tid_UNCONNECTED;
  wire [31:0]NLW_inst_m_axis_tstrb_UNCONNECTED;

  (* C_AXIS_SIGNAL_SET = "32'b00000000000000000000000010011011" *) 
  (* C_AXIS_TDEST_WIDTH = "1" *) 
  (* C_AXIS_TID_WIDTH = "1" *) 
  (* C_FAMILY = "virtex7" *) 
  (* C_M_AXIS_TDATA_WIDTH = "256" *) 
  (* C_M_AXIS_TUSER_WIDTH = "256" *) 
  (* C_S_AXIS_TDATA_WIDTH = "128" *) 
  (* C_S_AXIS_TUSER_WIDTH = "128" *) 
  (* DowngradeIPIdentifiedWarnings = "yes" *) 
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
  (* P_AXIS_SIGNAL_SET = "32'b00000000000000000000000010011011" *) 
  (* P_D1_REG_CONFIG = "0" *) 
  (* P_D1_TUSER_WIDTH = "128" *) 
  (* P_D2_TDATA_WIDTH = "256" *) 
  (* P_D2_TUSER_WIDTH = "256" *) 
  (* P_D3_REG_CONFIG = "0" *) 
  (* P_D3_TUSER_WIDTH = "256" *) 
  (* P_M_RATIO = "1" *) 
  (* P_SS_TKEEP_REQUIRED = "8" *) 
  (* P_S_RATIO = "2" *) 
  control_sub_axis_dwidth_dma_tx_0_axis_dwidth_converter_v1_1_10_axis_dwidth_converter inst
       (.aclk(aclk),
        .aclken(1'b1),
        .aresetn(aresetn),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tdest(NLW_inst_m_axis_tdest_UNCONNECTED[0]),
        .m_axis_tid(NLW_inst_m_axis_tid_UNCONNECTED[0]),
        .m_axis_tkeep(m_axis_tkeep),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tstrb(NLW_inst_m_axis_tstrb_UNCONNECTED[31:0]),
        .m_axis_tuser(m_axis_tuser),
        .m_axis_tvalid(m_axis_tvalid),
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

(* C_AXIS_SIGNAL_SET = "32'b00000000000000000000000010011011" *) (* C_AXIS_TDEST_WIDTH = "1" *) (* C_AXIS_TID_WIDTH = "1" *) 
(* C_FAMILY = "virtex7" *) (* C_M_AXIS_TDATA_WIDTH = "256" *) (* C_M_AXIS_TUSER_WIDTH = "256" *) 
(* C_S_AXIS_TDATA_WIDTH = "128" *) (* C_S_AXIS_TUSER_WIDTH = "128" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* G_INDX_SS_TDATA = "1" *) (* G_INDX_SS_TDEST = "6" *) (* G_INDX_SS_TID = "5" *) 
(* G_INDX_SS_TKEEP = "3" *) (* G_INDX_SS_TLAST = "4" *) (* G_INDX_SS_TREADY = "0" *) 
(* G_INDX_SS_TSTRB = "2" *) (* G_INDX_SS_TUSER = "7" *) (* G_MASK_SS_TDATA = "2" *) 
(* G_MASK_SS_TDEST = "64" *) (* G_MASK_SS_TID = "32" *) (* G_MASK_SS_TKEEP = "8" *) 
(* G_MASK_SS_TLAST = "16" *) (* G_MASK_SS_TREADY = "1" *) (* G_MASK_SS_TSTRB = "4" *) 
(* G_MASK_SS_TUSER = "128" *) (* G_TASK_SEVERITY_ERR = "2" *) (* G_TASK_SEVERITY_INFO = "0" *) 
(* G_TASK_SEVERITY_WARNING = "1" *) (* ORIG_REF_NAME = "axis_dwidth_converter_v1_1_10_axis_dwidth_converter" *) (* P_AXIS_SIGNAL_SET = "32'b00000000000000000000000010011011" *) 
(* P_D1_REG_CONFIG = "0" *) (* P_D1_TUSER_WIDTH = "128" *) (* P_D2_TDATA_WIDTH = "256" *) 
(* P_D2_TUSER_WIDTH = "256" *) (* P_D3_REG_CONFIG = "0" *) (* P_D3_TUSER_WIDTH = "256" *) 
(* P_M_RATIO = "1" *) (* P_SS_TKEEP_REQUIRED = "8" *) (* P_S_RATIO = "2" *) 
module control_sub_axis_dwidth_dma_tx_0_axis_dwidth_converter_v1_1_10_axis_dwidth_converter
   (aclk,
    aresetn,
    aclken,
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
    m_axis_tuser);
  input aclk;
  input aresetn;
  input aclken;
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
  output [255:0]m_axis_tdata;
  output [31:0]m_axis_tstrb;
  output [31:0]m_axis_tkeep;
  output m_axis_tlast;
  output [0:0]m_axis_tid;
  output [0:0]m_axis_tdest;
  output [255:0]m_axis_tuser;

  wire \<const0> ;
  wire aclk;
  wire aclken;
  wire areset_r;
  wire aresetn;
  wire [255:0]m_axis_tdata;
  wire [31:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [255:0]m_axis_tuser;
  wire m_axis_tvalid;
  wire p_0_in;
  wire [127:0]s_axis_tdata;
  wire [15:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire s_axis_tready;
  wire [127:0]s_axis_tuser;
  wire s_axis_tvalid;

  assign m_axis_tdest[0] = \<const0> ;
  assign m_axis_tid[0] = \<const0> ;
  assign m_axis_tstrb[31] = \<const0> ;
  assign m_axis_tstrb[30] = \<const0> ;
  assign m_axis_tstrb[29] = \<const0> ;
  assign m_axis_tstrb[28] = \<const0> ;
  assign m_axis_tstrb[27] = \<const0> ;
  assign m_axis_tstrb[26] = \<const0> ;
  assign m_axis_tstrb[25] = \<const0> ;
  assign m_axis_tstrb[24] = \<const0> ;
  assign m_axis_tstrb[23] = \<const0> ;
  assign m_axis_tstrb[22] = \<const0> ;
  assign m_axis_tstrb[21] = \<const0> ;
  assign m_axis_tstrb[20] = \<const0> ;
  assign m_axis_tstrb[19] = \<const0> ;
  assign m_axis_tstrb[18] = \<const0> ;
  assign m_axis_tstrb[17] = \<const0> ;
  assign m_axis_tstrb[16] = \<const0> ;
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
  LUT1 #(
    .INIT(2'h1)) 
    areset_r_i_1
       (.I0(aresetn),
        .O(p_0_in));
  FDRE areset_r_reg
       (.C(aclk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(areset_r),
        .R(1'b0));
  control_sub_axis_dwidth_dma_tx_0_axis_dwidth_converter_v1_1_10_axisc_upsizer \gen_upsizer_conversion.axisc_upsizer_0 
       (.Q({m_axis_tvalid,s_axis_tready}),
        .SR(areset_r),
        .aclk(aclk),
        .aclken(aclken),
        .m_axis_tdata(m_axis_tdata),
        .m_axis_tkeep(m_axis_tkeep),
        .m_axis_tlast(m_axis_tlast),
        .m_axis_tready(m_axis_tready),
        .m_axis_tuser(m_axis_tuser),
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tvalid(s_axis_tvalid));
endmodule

(* ORIG_REF_NAME = "axis_dwidth_converter_v1_1_10_axisc_upsizer" *) 
module control_sub_axis_dwidth_dma_tx_0_axis_dwidth_converter_v1_1_10_axisc_upsizer
   (m_axis_tlast,
    Q,
    m_axis_tdata,
    m_axis_tkeep,
    m_axis_tuser,
    aclk,
    s_axis_tlast,
    aclken,
    SR,
    m_axis_tready,
    s_axis_tdata,
    s_axis_tkeep,
    s_axis_tuser,
    s_axis_tvalid);
  output m_axis_tlast;
  output [1:0]Q;
  output [255:0]m_axis_tdata;
  output [31:0]m_axis_tkeep;
  output [255:0]m_axis_tuser;
  input aclk;
  input s_axis_tlast;
  input aclken;
  input [0:0]SR;
  input m_axis_tready;
  input [127:0]s_axis_tdata;
  input [15:0]s_axis_tkeep;
  input [127:0]s_axis_tuser;
  input s_axis_tvalid;

  wire \FSM_onehot_state[0]_i_1_n_0 ;
  wire \FSM_onehot_state[0]_i_2_n_0 ;
  wire \FSM_onehot_state[0]_i_3_n_0 ;
  wire \FSM_onehot_state[0]_i_4_n_0 ;
  wire \FSM_onehot_state[2]_i_1_n_0 ;
  wire \FSM_onehot_state[2]_i_2_n_0 ;
  wire \FSM_onehot_state[2]_i_3_n_0 ;
  wire \FSM_onehot_state[3]_i_1_n_0 ;
  wire \FSM_onehot_state[3]_i_2_n_0 ;
  wire \FSM_onehot_state[3]_i_3_n_0 ;
  wire \FSM_onehot_state[4]_i_1_n_0 ;
  wire \FSM_onehot_state[4]_i_2_n_0 ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_state_reg_n_0_[0] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_state_reg_n_0_[1] ;
  (* RTL_KEEP = "yes" *) wire \FSM_onehot_state_reg_n_0_[2] ;
  wire [1:0]Q;
  wire [0:0]SR;
  wire acc_data;
  wire \acc_data[255]_i_1_n_0 ;
  wire acc_last;
  wire acc_last_i_1_n_0;
  wire acc_strb;
  wire aclk;
  wire aclken;
  wire [255:0]m_axis_tdata;
  wire [31:0]m_axis_tkeep;
  wire m_axis_tlast;
  wire m_axis_tready;
  wire [255:0]m_axis_tuser;
  (* RTL_KEEP = "yes" *) wire p_0_in5_in;
  (* RTL_KEEP = "yes" *) wire p_1_in;
  wire [127:0]r0_data;
  wire [15:0]r0_keep;
  wire r0_last;
  wire r0_last_i_1_n_0;
  wire r0_last_reg_n_0;
  wire \r0_reg_sel[0]_i_1_n_0 ;
  wire \r0_reg_sel[1]_i_1_n_0 ;
  wire \r0_reg_sel[1]_i_2_n_0 ;
  wire \r0_reg_sel_reg_n_0_[0] ;
  wire \r0_reg_sel_reg_n_0_[1] ;
  wire [127:0]r0_user;
  wire [127:0]s_axis_tdata;
  wire [15:0]s_axis_tkeep;
  wire s_axis_tlast;
  wire [127:0]s_axis_tuser;
  wire s_axis_tvalid;
  wire [2:0]state;
  wire state1;
  wire state16_out;
  wire \state[2]_i_2_n_0 ;
  wire \state_reg_n_0_[2] ;

  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFF10)) 
    \FSM_onehot_state[0]_i_1 
       (.I0(state1),
        .I1(s_axis_tvalid),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(\FSM_onehot_state[0]_i_2_n_0 ),
        .I4(\FSM_onehot_state[0]_i_3_n_0 ),
        .I5(\FSM_onehot_state[0]_i_4_n_0 ),
        .O(\FSM_onehot_state[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF0001)) 
    \FSM_onehot_state[0]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[2] ),
        .I1(p_1_in),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(p_0_in5_in),
        .I4(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\FSM_onehot_state[0]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00040000)) 
    \FSM_onehot_state[0]_i_3 
       (.I0(s_axis_tvalid),
        .I1(m_axis_tready),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(p_0_in5_in),
        .I4(\FSM_onehot_state_reg_n_0_[2] ),
        .O(\FSM_onehot_state[0]_i_3_n_0 ));
  LUT4 #(
    .INIT(16'h0004)) 
    \FSM_onehot_state[0]_i_4 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(p_0_in5_in),
        .I2(s_axis_tvalid),
        .I3(r0_last_reg_n_0),
        .O(\FSM_onehot_state[0]_i_4_n_0 ));
  LUT5 #(
    .INIT(32'h0000FFF8)) 
    \FSM_onehot_state[2]_i_1 
       (.I0(state1),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state[2]_i_2_n_0 ),
        .I3(\FSM_onehot_state[2]_i_3_n_0 ),
        .I4(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\FSM_onehot_state[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0055540000000000)) 
    \FSM_onehot_state[2]_i_2 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(\r0_reg_sel_reg_n_0_[1] ),
        .I2(\r0_reg_sel_reg_n_0_[0] ),
        .I3(s_axis_tvalid),
        .I4(r0_last_reg_n_0),
        .I5(p_0_in5_in),
        .O(\FSM_onehot_state[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00010000)) 
    \FSM_onehot_state[2]_i_3 
       (.I0(s_axis_tvalid),
        .I1(m_axis_tready),
        .I2(\FSM_onehot_state_reg_n_0_[0] ),
        .I3(p_0_in5_in),
        .I4(\FSM_onehot_state_reg_n_0_[2] ),
        .O(\FSM_onehot_state[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h000000002222FFF0)) 
    \FSM_onehot_state[3]_i_1 
       (.I0(s_axis_tvalid),
        .I1(state1),
        .I2(\FSM_onehot_state[3]_i_2_n_0 ),
        .I3(\FSM_onehot_state[3]_i_3_n_0 ),
        .I4(\FSM_onehot_state_reg_n_0_[0] ),
        .I5(\FSM_onehot_state_reg_n_0_[1] ),
        .O(\FSM_onehot_state[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000AC00)) 
    \FSM_onehot_state[3]_i_2 
       (.I0(s_axis_tvalid),
        .I1(p_1_in),
        .I2(\FSM_onehot_state_reg_n_0_[2] ),
        .I3(m_axis_tready),
        .I4(p_0_in5_in),
        .O(\FSM_onehot_state[3]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h00000200)) 
    \FSM_onehot_state[3]_i_3 
       (.I0(s_axis_tvalid),
        .I1(r0_last_reg_n_0),
        .I2(\r0_reg_sel_reg_n_0_[1] ),
        .I3(p_0_in5_in),
        .I4(\r0_reg_sel_reg_n_0_[0] ),
        .O(\FSM_onehot_state[3]_i_3_n_0 ));
  LUT3 #(
    .INIT(8'h10)) 
    \FSM_onehot_state[4]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[1] ),
        .I1(\FSM_onehot_state_reg_n_0_[0] ),
        .I2(\FSM_onehot_state[4]_i_2_n_0 ),
        .O(\FSM_onehot_state[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFF54001000540010)) 
    \FSM_onehot_state[4]_i_2 
       (.I0(m_axis_tready),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .I2(p_1_in),
        .I3(p_0_in5_in),
        .I4(s_axis_tvalid),
        .I5(r0_last_reg_n_0),
        .O(\FSM_onehot_state[4]_i_2_n_0 ));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[0] 
       (.C(aclk),
        .CE(aclken),
        .D(\FSM_onehot_state[0]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[0] ),
        .R(SR));
  (* KEEP = "yes" *) 
  FDSE #(
    .INIT(1'b1)) 
    \FSM_onehot_state_reg[1] 
       (.C(aclk),
        .CE(aclken),
        .D(1'b0),
        .Q(\FSM_onehot_state_reg_n_0_[1] ),
        .S(SR));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[2] 
       (.C(aclk),
        .CE(aclken),
        .D(\FSM_onehot_state[2]_i_1_n_0 ),
        .Q(\FSM_onehot_state_reg_n_0_[2] ),
        .R(SR));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[3] 
       (.C(aclk),
        .CE(aclken),
        .D(\FSM_onehot_state[3]_i_1_n_0 ),
        .Q(p_0_in5_in),
        .R(SR));
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_onehot_state_reg[4] 
       (.C(aclk),
        .CE(aclken),
        .D(\FSM_onehot_state[4]_i_1_n_0 ),
        .Q(p_1_in),
        .R(SR));
  LUT3 #(
    .INIT(8'h80)) 
    \acc_data[127]_i_1 
       (.I0(\r0_reg_sel_reg_n_0_[0] ),
        .I1(p_0_in5_in),
        .I2(aclken),
        .O(acc_data));
  LUT3 #(
    .INIT(8'hC8)) 
    \acc_data[255]_i_1 
       (.I0(\FSM_onehot_state_reg_n_0_[0] ),
        .I1(aclken),
        .I2(p_0_in5_in),
        .O(\acc_data[255]_i_1_n_0 ));
  FDRE \acc_data_reg[0] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[0]),
        .Q(m_axis_tdata[0]),
        .R(1'b0));
  FDRE \acc_data_reg[100] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[100]),
        .Q(m_axis_tdata[100]),
        .R(1'b0));
  FDRE \acc_data_reg[101] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[101]),
        .Q(m_axis_tdata[101]),
        .R(1'b0));
  FDRE \acc_data_reg[102] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[102]),
        .Q(m_axis_tdata[102]),
        .R(1'b0));
  FDRE \acc_data_reg[103] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[103]),
        .Q(m_axis_tdata[103]),
        .R(1'b0));
  FDRE \acc_data_reg[104] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[104]),
        .Q(m_axis_tdata[104]),
        .R(1'b0));
  FDRE \acc_data_reg[105] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[105]),
        .Q(m_axis_tdata[105]),
        .R(1'b0));
  FDRE \acc_data_reg[106] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[106]),
        .Q(m_axis_tdata[106]),
        .R(1'b0));
  FDRE \acc_data_reg[107] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[107]),
        .Q(m_axis_tdata[107]),
        .R(1'b0));
  FDRE \acc_data_reg[108] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[108]),
        .Q(m_axis_tdata[108]),
        .R(1'b0));
  FDRE \acc_data_reg[109] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[109]),
        .Q(m_axis_tdata[109]),
        .R(1'b0));
  FDRE \acc_data_reg[10] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[10]),
        .Q(m_axis_tdata[10]),
        .R(1'b0));
  FDRE \acc_data_reg[110] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[110]),
        .Q(m_axis_tdata[110]),
        .R(1'b0));
  FDRE \acc_data_reg[111] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[111]),
        .Q(m_axis_tdata[111]),
        .R(1'b0));
  FDRE \acc_data_reg[112] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[112]),
        .Q(m_axis_tdata[112]),
        .R(1'b0));
  FDRE \acc_data_reg[113] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[113]),
        .Q(m_axis_tdata[113]),
        .R(1'b0));
  FDRE \acc_data_reg[114] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[114]),
        .Q(m_axis_tdata[114]),
        .R(1'b0));
  FDRE \acc_data_reg[115] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[115]),
        .Q(m_axis_tdata[115]),
        .R(1'b0));
  FDRE \acc_data_reg[116] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[116]),
        .Q(m_axis_tdata[116]),
        .R(1'b0));
  FDRE \acc_data_reg[117] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[117]),
        .Q(m_axis_tdata[117]),
        .R(1'b0));
  FDRE \acc_data_reg[118] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[118]),
        .Q(m_axis_tdata[118]),
        .R(1'b0));
  FDRE \acc_data_reg[119] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[119]),
        .Q(m_axis_tdata[119]),
        .R(1'b0));
  FDRE \acc_data_reg[11] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[11]),
        .Q(m_axis_tdata[11]),
        .R(1'b0));
  FDRE \acc_data_reg[120] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[120]),
        .Q(m_axis_tdata[120]),
        .R(1'b0));
  FDRE \acc_data_reg[121] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[121]),
        .Q(m_axis_tdata[121]),
        .R(1'b0));
  FDRE \acc_data_reg[122] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[122]),
        .Q(m_axis_tdata[122]),
        .R(1'b0));
  FDRE \acc_data_reg[123] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[123]),
        .Q(m_axis_tdata[123]),
        .R(1'b0));
  FDRE \acc_data_reg[124] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[124]),
        .Q(m_axis_tdata[124]),
        .R(1'b0));
  FDRE \acc_data_reg[125] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[125]),
        .Q(m_axis_tdata[125]),
        .R(1'b0));
  FDRE \acc_data_reg[126] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[126]),
        .Q(m_axis_tdata[126]),
        .R(1'b0));
  FDRE \acc_data_reg[127] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[127]),
        .Q(m_axis_tdata[127]),
        .R(1'b0));
  FDRE \acc_data_reg[128] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[0]),
        .Q(m_axis_tdata[128]),
        .R(1'b0));
  FDRE \acc_data_reg[129] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[1]),
        .Q(m_axis_tdata[129]),
        .R(1'b0));
  FDRE \acc_data_reg[12] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[12]),
        .Q(m_axis_tdata[12]),
        .R(1'b0));
  FDRE \acc_data_reg[130] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[2]),
        .Q(m_axis_tdata[130]),
        .R(1'b0));
  FDRE \acc_data_reg[131] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[3]),
        .Q(m_axis_tdata[131]),
        .R(1'b0));
  FDRE \acc_data_reg[132] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[4]),
        .Q(m_axis_tdata[132]),
        .R(1'b0));
  FDRE \acc_data_reg[133] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[5]),
        .Q(m_axis_tdata[133]),
        .R(1'b0));
  FDRE \acc_data_reg[134] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[6]),
        .Q(m_axis_tdata[134]),
        .R(1'b0));
  FDRE \acc_data_reg[135] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[7]),
        .Q(m_axis_tdata[135]),
        .R(1'b0));
  FDRE \acc_data_reg[136] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[8]),
        .Q(m_axis_tdata[136]),
        .R(1'b0));
  FDRE \acc_data_reg[137] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[9]),
        .Q(m_axis_tdata[137]),
        .R(1'b0));
  FDRE \acc_data_reg[138] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[10]),
        .Q(m_axis_tdata[138]),
        .R(1'b0));
  FDRE \acc_data_reg[139] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[11]),
        .Q(m_axis_tdata[139]),
        .R(1'b0));
  FDRE \acc_data_reg[13] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[13]),
        .Q(m_axis_tdata[13]),
        .R(1'b0));
  FDRE \acc_data_reg[140] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[12]),
        .Q(m_axis_tdata[140]),
        .R(1'b0));
  FDRE \acc_data_reg[141] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[13]),
        .Q(m_axis_tdata[141]),
        .R(1'b0));
  FDRE \acc_data_reg[142] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[14]),
        .Q(m_axis_tdata[142]),
        .R(1'b0));
  FDRE \acc_data_reg[143] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[15]),
        .Q(m_axis_tdata[143]),
        .R(1'b0));
  FDRE \acc_data_reg[144] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[16]),
        .Q(m_axis_tdata[144]),
        .R(1'b0));
  FDRE \acc_data_reg[145] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[17]),
        .Q(m_axis_tdata[145]),
        .R(1'b0));
  FDRE \acc_data_reg[146] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[18]),
        .Q(m_axis_tdata[146]),
        .R(1'b0));
  FDRE \acc_data_reg[147] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[19]),
        .Q(m_axis_tdata[147]),
        .R(1'b0));
  FDRE \acc_data_reg[148] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[20]),
        .Q(m_axis_tdata[148]),
        .R(1'b0));
  FDRE \acc_data_reg[149] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[21]),
        .Q(m_axis_tdata[149]),
        .R(1'b0));
  FDRE \acc_data_reg[14] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[14]),
        .Q(m_axis_tdata[14]),
        .R(1'b0));
  FDRE \acc_data_reg[150] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[22]),
        .Q(m_axis_tdata[150]),
        .R(1'b0));
  FDRE \acc_data_reg[151] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[23]),
        .Q(m_axis_tdata[151]),
        .R(1'b0));
  FDRE \acc_data_reg[152] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[24]),
        .Q(m_axis_tdata[152]),
        .R(1'b0));
  FDRE \acc_data_reg[153] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[25]),
        .Q(m_axis_tdata[153]),
        .R(1'b0));
  FDRE \acc_data_reg[154] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[26]),
        .Q(m_axis_tdata[154]),
        .R(1'b0));
  FDRE \acc_data_reg[155] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[27]),
        .Q(m_axis_tdata[155]),
        .R(1'b0));
  FDRE \acc_data_reg[156] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[28]),
        .Q(m_axis_tdata[156]),
        .R(1'b0));
  FDRE \acc_data_reg[157] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[29]),
        .Q(m_axis_tdata[157]),
        .R(1'b0));
  FDRE \acc_data_reg[158] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[30]),
        .Q(m_axis_tdata[158]),
        .R(1'b0));
  FDRE \acc_data_reg[159] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[31]),
        .Q(m_axis_tdata[159]),
        .R(1'b0));
  FDRE \acc_data_reg[15] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[15]),
        .Q(m_axis_tdata[15]),
        .R(1'b0));
  FDRE \acc_data_reg[160] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[32]),
        .Q(m_axis_tdata[160]),
        .R(1'b0));
  FDRE \acc_data_reg[161] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[33]),
        .Q(m_axis_tdata[161]),
        .R(1'b0));
  FDRE \acc_data_reg[162] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[34]),
        .Q(m_axis_tdata[162]),
        .R(1'b0));
  FDRE \acc_data_reg[163] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[35]),
        .Q(m_axis_tdata[163]),
        .R(1'b0));
  FDRE \acc_data_reg[164] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[36]),
        .Q(m_axis_tdata[164]),
        .R(1'b0));
  FDRE \acc_data_reg[165] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[37]),
        .Q(m_axis_tdata[165]),
        .R(1'b0));
  FDRE \acc_data_reg[166] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[38]),
        .Q(m_axis_tdata[166]),
        .R(1'b0));
  FDRE \acc_data_reg[167] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[39]),
        .Q(m_axis_tdata[167]),
        .R(1'b0));
  FDRE \acc_data_reg[168] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[40]),
        .Q(m_axis_tdata[168]),
        .R(1'b0));
  FDRE \acc_data_reg[169] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[41]),
        .Q(m_axis_tdata[169]),
        .R(1'b0));
  FDRE \acc_data_reg[16] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[16]),
        .Q(m_axis_tdata[16]),
        .R(1'b0));
  FDRE \acc_data_reg[170] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[42]),
        .Q(m_axis_tdata[170]),
        .R(1'b0));
  FDRE \acc_data_reg[171] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[43]),
        .Q(m_axis_tdata[171]),
        .R(1'b0));
  FDRE \acc_data_reg[172] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[44]),
        .Q(m_axis_tdata[172]),
        .R(1'b0));
  FDRE \acc_data_reg[173] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[45]),
        .Q(m_axis_tdata[173]),
        .R(1'b0));
  FDRE \acc_data_reg[174] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[46]),
        .Q(m_axis_tdata[174]),
        .R(1'b0));
  FDRE \acc_data_reg[175] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[47]),
        .Q(m_axis_tdata[175]),
        .R(1'b0));
  FDRE \acc_data_reg[176] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[48]),
        .Q(m_axis_tdata[176]),
        .R(1'b0));
  FDRE \acc_data_reg[177] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[49]),
        .Q(m_axis_tdata[177]),
        .R(1'b0));
  FDRE \acc_data_reg[178] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[50]),
        .Q(m_axis_tdata[178]),
        .R(1'b0));
  FDRE \acc_data_reg[179] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[51]),
        .Q(m_axis_tdata[179]),
        .R(1'b0));
  FDRE \acc_data_reg[17] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[17]),
        .Q(m_axis_tdata[17]),
        .R(1'b0));
  FDRE \acc_data_reg[180] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[52]),
        .Q(m_axis_tdata[180]),
        .R(1'b0));
  FDRE \acc_data_reg[181] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[53]),
        .Q(m_axis_tdata[181]),
        .R(1'b0));
  FDRE \acc_data_reg[182] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[54]),
        .Q(m_axis_tdata[182]),
        .R(1'b0));
  FDRE \acc_data_reg[183] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[55]),
        .Q(m_axis_tdata[183]),
        .R(1'b0));
  FDRE \acc_data_reg[184] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[56]),
        .Q(m_axis_tdata[184]),
        .R(1'b0));
  FDRE \acc_data_reg[185] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[57]),
        .Q(m_axis_tdata[185]),
        .R(1'b0));
  FDRE \acc_data_reg[186] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[58]),
        .Q(m_axis_tdata[186]),
        .R(1'b0));
  FDRE \acc_data_reg[187] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[59]),
        .Q(m_axis_tdata[187]),
        .R(1'b0));
  FDRE \acc_data_reg[188] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[60]),
        .Q(m_axis_tdata[188]),
        .R(1'b0));
  FDRE \acc_data_reg[189] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[61]),
        .Q(m_axis_tdata[189]),
        .R(1'b0));
  FDRE \acc_data_reg[18] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[18]),
        .Q(m_axis_tdata[18]),
        .R(1'b0));
  FDRE \acc_data_reg[190] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[62]),
        .Q(m_axis_tdata[190]),
        .R(1'b0));
  FDRE \acc_data_reg[191] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[63]),
        .Q(m_axis_tdata[191]),
        .R(1'b0));
  FDRE \acc_data_reg[192] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[64]),
        .Q(m_axis_tdata[192]),
        .R(1'b0));
  FDRE \acc_data_reg[193] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[65]),
        .Q(m_axis_tdata[193]),
        .R(1'b0));
  FDRE \acc_data_reg[194] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[66]),
        .Q(m_axis_tdata[194]),
        .R(1'b0));
  FDRE \acc_data_reg[195] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[67]),
        .Q(m_axis_tdata[195]),
        .R(1'b0));
  FDRE \acc_data_reg[196] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[68]),
        .Q(m_axis_tdata[196]),
        .R(1'b0));
  FDRE \acc_data_reg[197] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[69]),
        .Q(m_axis_tdata[197]),
        .R(1'b0));
  FDRE \acc_data_reg[198] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[70]),
        .Q(m_axis_tdata[198]),
        .R(1'b0));
  FDRE \acc_data_reg[199] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[71]),
        .Q(m_axis_tdata[199]),
        .R(1'b0));
  FDRE \acc_data_reg[19] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[19]),
        .Q(m_axis_tdata[19]),
        .R(1'b0));
  FDRE \acc_data_reg[1] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[1]),
        .Q(m_axis_tdata[1]),
        .R(1'b0));
  FDRE \acc_data_reg[200] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[72]),
        .Q(m_axis_tdata[200]),
        .R(1'b0));
  FDRE \acc_data_reg[201] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[73]),
        .Q(m_axis_tdata[201]),
        .R(1'b0));
  FDRE \acc_data_reg[202] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[74]),
        .Q(m_axis_tdata[202]),
        .R(1'b0));
  FDRE \acc_data_reg[203] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[75]),
        .Q(m_axis_tdata[203]),
        .R(1'b0));
  FDRE \acc_data_reg[204] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[76]),
        .Q(m_axis_tdata[204]),
        .R(1'b0));
  FDRE \acc_data_reg[205] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[77]),
        .Q(m_axis_tdata[205]),
        .R(1'b0));
  FDRE \acc_data_reg[206] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[78]),
        .Q(m_axis_tdata[206]),
        .R(1'b0));
  FDRE \acc_data_reg[207] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[79]),
        .Q(m_axis_tdata[207]),
        .R(1'b0));
  FDRE \acc_data_reg[208] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[80]),
        .Q(m_axis_tdata[208]),
        .R(1'b0));
  FDRE \acc_data_reg[209] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[81]),
        .Q(m_axis_tdata[209]),
        .R(1'b0));
  FDRE \acc_data_reg[20] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[20]),
        .Q(m_axis_tdata[20]),
        .R(1'b0));
  FDRE \acc_data_reg[210] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[82]),
        .Q(m_axis_tdata[210]),
        .R(1'b0));
  FDRE \acc_data_reg[211] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[83]),
        .Q(m_axis_tdata[211]),
        .R(1'b0));
  FDRE \acc_data_reg[212] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[84]),
        .Q(m_axis_tdata[212]),
        .R(1'b0));
  FDRE \acc_data_reg[213] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[85]),
        .Q(m_axis_tdata[213]),
        .R(1'b0));
  FDRE \acc_data_reg[214] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[86]),
        .Q(m_axis_tdata[214]),
        .R(1'b0));
  FDRE \acc_data_reg[215] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[87]),
        .Q(m_axis_tdata[215]),
        .R(1'b0));
  FDRE \acc_data_reg[216] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[88]),
        .Q(m_axis_tdata[216]),
        .R(1'b0));
  FDRE \acc_data_reg[217] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[89]),
        .Q(m_axis_tdata[217]),
        .R(1'b0));
  FDRE \acc_data_reg[218] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[90]),
        .Q(m_axis_tdata[218]),
        .R(1'b0));
  FDRE \acc_data_reg[219] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[91]),
        .Q(m_axis_tdata[219]),
        .R(1'b0));
  FDRE \acc_data_reg[21] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[21]),
        .Q(m_axis_tdata[21]),
        .R(1'b0));
  FDRE \acc_data_reg[220] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[92]),
        .Q(m_axis_tdata[220]),
        .R(1'b0));
  FDRE \acc_data_reg[221] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[93]),
        .Q(m_axis_tdata[221]),
        .R(1'b0));
  FDRE \acc_data_reg[222] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[94]),
        .Q(m_axis_tdata[222]),
        .R(1'b0));
  FDRE \acc_data_reg[223] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[95]),
        .Q(m_axis_tdata[223]),
        .R(1'b0));
  FDRE \acc_data_reg[224] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[96]),
        .Q(m_axis_tdata[224]),
        .R(1'b0));
  FDRE \acc_data_reg[225] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[97]),
        .Q(m_axis_tdata[225]),
        .R(1'b0));
  FDRE \acc_data_reg[226] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[98]),
        .Q(m_axis_tdata[226]),
        .R(1'b0));
  FDRE \acc_data_reg[227] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[99]),
        .Q(m_axis_tdata[227]),
        .R(1'b0));
  FDRE \acc_data_reg[228] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[100]),
        .Q(m_axis_tdata[228]),
        .R(1'b0));
  FDRE \acc_data_reg[229] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[101]),
        .Q(m_axis_tdata[229]),
        .R(1'b0));
  FDRE \acc_data_reg[22] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[22]),
        .Q(m_axis_tdata[22]),
        .R(1'b0));
  FDRE \acc_data_reg[230] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[102]),
        .Q(m_axis_tdata[230]),
        .R(1'b0));
  FDRE \acc_data_reg[231] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[103]),
        .Q(m_axis_tdata[231]),
        .R(1'b0));
  FDRE \acc_data_reg[232] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[104]),
        .Q(m_axis_tdata[232]),
        .R(1'b0));
  FDRE \acc_data_reg[233] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[105]),
        .Q(m_axis_tdata[233]),
        .R(1'b0));
  FDRE \acc_data_reg[234] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[106]),
        .Q(m_axis_tdata[234]),
        .R(1'b0));
  FDRE \acc_data_reg[235] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[107]),
        .Q(m_axis_tdata[235]),
        .R(1'b0));
  FDRE \acc_data_reg[236] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[108]),
        .Q(m_axis_tdata[236]),
        .R(1'b0));
  FDRE \acc_data_reg[237] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[109]),
        .Q(m_axis_tdata[237]),
        .R(1'b0));
  FDRE \acc_data_reg[238] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[110]),
        .Q(m_axis_tdata[238]),
        .R(1'b0));
  FDRE \acc_data_reg[239] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[111]),
        .Q(m_axis_tdata[239]),
        .R(1'b0));
  FDRE \acc_data_reg[23] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[23]),
        .Q(m_axis_tdata[23]),
        .R(1'b0));
  FDRE \acc_data_reg[240] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[112]),
        .Q(m_axis_tdata[240]),
        .R(1'b0));
  FDRE \acc_data_reg[241] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[113]),
        .Q(m_axis_tdata[241]),
        .R(1'b0));
  FDRE \acc_data_reg[242] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[114]),
        .Q(m_axis_tdata[242]),
        .R(1'b0));
  FDRE \acc_data_reg[243] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[115]),
        .Q(m_axis_tdata[243]),
        .R(1'b0));
  FDRE \acc_data_reg[244] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[116]),
        .Q(m_axis_tdata[244]),
        .R(1'b0));
  FDRE \acc_data_reg[245] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[117]),
        .Q(m_axis_tdata[245]),
        .R(1'b0));
  FDRE \acc_data_reg[246] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[118]),
        .Q(m_axis_tdata[246]),
        .R(1'b0));
  FDRE \acc_data_reg[247] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[119]),
        .Q(m_axis_tdata[247]),
        .R(1'b0));
  FDRE \acc_data_reg[248] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[120]),
        .Q(m_axis_tdata[248]),
        .R(1'b0));
  FDRE \acc_data_reg[249] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[121]),
        .Q(m_axis_tdata[249]),
        .R(1'b0));
  FDRE \acc_data_reg[24] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[24]),
        .Q(m_axis_tdata[24]),
        .R(1'b0));
  FDRE \acc_data_reg[250] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[122]),
        .Q(m_axis_tdata[250]),
        .R(1'b0));
  FDRE \acc_data_reg[251] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[123]),
        .Q(m_axis_tdata[251]),
        .R(1'b0));
  FDRE \acc_data_reg[252] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[124]),
        .Q(m_axis_tdata[252]),
        .R(1'b0));
  FDRE \acc_data_reg[253] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[125]),
        .Q(m_axis_tdata[253]),
        .R(1'b0));
  FDRE \acc_data_reg[254] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[126]),
        .Q(m_axis_tdata[254]),
        .R(1'b0));
  FDRE \acc_data_reg[255] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tdata[127]),
        .Q(m_axis_tdata[255]),
        .R(1'b0));
  FDRE \acc_data_reg[25] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[25]),
        .Q(m_axis_tdata[25]),
        .R(1'b0));
  FDRE \acc_data_reg[26] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[26]),
        .Q(m_axis_tdata[26]),
        .R(1'b0));
  FDRE \acc_data_reg[27] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[27]),
        .Q(m_axis_tdata[27]),
        .R(1'b0));
  FDRE \acc_data_reg[28] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[28]),
        .Q(m_axis_tdata[28]),
        .R(1'b0));
  FDRE \acc_data_reg[29] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[29]),
        .Q(m_axis_tdata[29]),
        .R(1'b0));
  FDRE \acc_data_reg[2] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[2]),
        .Q(m_axis_tdata[2]),
        .R(1'b0));
  FDRE \acc_data_reg[30] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[30]),
        .Q(m_axis_tdata[30]),
        .R(1'b0));
  FDRE \acc_data_reg[31] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[31]),
        .Q(m_axis_tdata[31]),
        .R(1'b0));
  FDRE \acc_data_reg[32] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[32]),
        .Q(m_axis_tdata[32]),
        .R(1'b0));
  FDRE \acc_data_reg[33] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[33]),
        .Q(m_axis_tdata[33]),
        .R(1'b0));
  FDRE \acc_data_reg[34] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[34]),
        .Q(m_axis_tdata[34]),
        .R(1'b0));
  FDRE \acc_data_reg[35] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[35]),
        .Q(m_axis_tdata[35]),
        .R(1'b0));
  FDRE \acc_data_reg[36] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[36]),
        .Q(m_axis_tdata[36]),
        .R(1'b0));
  FDRE \acc_data_reg[37] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[37]),
        .Q(m_axis_tdata[37]),
        .R(1'b0));
  FDRE \acc_data_reg[38] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[38]),
        .Q(m_axis_tdata[38]),
        .R(1'b0));
  FDRE \acc_data_reg[39] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[39]),
        .Q(m_axis_tdata[39]),
        .R(1'b0));
  FDRE \acc_data_reg[3] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[3]),
        .Q(m_axis_tdata[3]),
        .R(1'b0));
  FDRE \acc_data_reg[40] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[40]),
        .Q(m_axis_tdata[40]),
        .R(1'b0));
  FDRE \acc_data_reg[41] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[41]),
        .Q(m_axis_tdata[41]),
        .R(1'b0));
  FDRE \acc_data_reg[42] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[42]),
        .Q(m_axis_tdata[42]),
        .R(1'b0));
  FDRE \acc_data_reg[43] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[43]),
        .Q(m_axis_tdata[43]),
        .R(1'b0));
  FDRE \acc_data_reg[44] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[44]),
        .Q(m_axis_tdata[44]),
        .R(1'b0));
  FDRE \acc_data_reg[45] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[45]),
        .Q(m_axis_tdata[45]),
        .R(1'b0));
  FDRE \acc_data_reg[46] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[46]),
        .Q(m_axis_tdata[46]),
        .R(1'b0));
  FDRE \acc_data_reg[47] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[47]),
        .Q(m_axis_tdata[47]),
        .R(1'b0));
  FDRE \acc_data_reg[48] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[48]),
        .Q(m_axis_tdata[48]),
        .R(1'b0));
  FDRE \acc_data_reg[49] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[49]),
        .Q(m_axis_tdata[49]),
        .R(1'b0));
  FDRE \acc_data_reg[4] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[4]),
        .Q(m_axis_tdata[4]),
        .R(1'b0));
  FDRE \acc_data_reg[50] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[50]),
        .Q(m_axis_tdata[50]),
        .R(1'b0));
  FDRE \acc_data_reg[51] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[51]),
        .Q(m_axis_tdata[51]),
        .R(1'b0));
  FDRE \acc_data_reg[52] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[52]),
        .Q(m_axis_tdata[52]),
        .R(1'b0));
  FDRE \acc_data_reg[53] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[53]),
        .Q(m_axis_tdata[53]),
        .R(1'b0));
  FDRE \acc_data_reg[54] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[54]),
        .Q(m_axis_tdata[54]),
        .R(1'b0));
  FDRE \acc_data_reg[55] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[55]),
        .Q(m_axis_tdata[55]),
        .R(1'b0));
  FDRE \acc_data_reg[56] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[56]),
        .Q(m_axis_tdata[56]),
        .R(1'b0));
  FDRE \acc_data_reg[57] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[57]),
        .Q(m_axis_tdata[57]),
        .R(1'b0));
  FDRE \acc_data_reg[58] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[58]),
        .Q(m_axis_tdata[58]),
        .R(1'b0));
  FDRE \acc_data_reg[59] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[59]),
        .Q(m_axis_tdata[59]),
        .R(1'b0));
  FDRE \acc_data_reg[5] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[5]),
        .Q(m_axis_tdata[5]),
        .R(1'b0));
  FDRE \acc_data_reg[60] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[60]),
        .Q(m_axis_tdata[60]),
        .R(1'b0));
  FDRE \acc_data_reg[61] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[61]),
        .Q(m_axis_tdata[61]),
        .R(1'b0));
  FDRE \acc_data_reg[62] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[62]),
        .Q(m_axis_tdata[62]),
        .R(1'b0));
  FDRE \acc_data_reg[63] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[63]),
        .Q(m_axis_tdata[63]),
        .R(1'b0));
  FDRE \acc_data_reg[64] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[64]),
        .Q(m_axis_tdata[64]),
        .R(1'b0));
  FDRE \acc_data_reg[65] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[65]),
        .Q(m_axis_tdata[65]),
        .R(1'b0));
  FDRE \acc_data_reg[66] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[66]),
        .Q(m_axis_tdata[66]),
        .R(1'b0));
  FDRE \acc_data_reg[67] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[67]),
        .Q(m_axis_tdata[67]),
        .R(1'b0));
  FDRE \acc_data_reg[68] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[68]),
        .Q(m_axis_tdata[68]),
        .R(1'b0));
  FDRE \acc_data_reg[69] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[69]),
        .Q(m_axis_tdata[69]),
        .R(1'b0));
  FDRE \acc_data_reg[6] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[6]),
        .Q(m_axis_tdata[6]),
        .R(1'b0));
  FDRE \acc_data_reg[70] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[70]),
        .Q(m_axis_tdata[70]),
        .R(1'b0));
  FDRE \acc_data_reg[71] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[71]),
        .Q(m_axis_tdata[71]),
        .R(1'b0));
  FDRE \acc_data_reg[72] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[72]),
        .Q(m_axis_tdata[72]),
        .R(1'b0));
  FDRE \acc_data_reg[73] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[73]),
        .Q(m_axis_tdata[73]),
        .R(1'b0));
  FDRE \acc_data_reg[74] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[74]),
        .Q(m_axis_tdata[74]),
        .R(1'b0));
  FDRE \acc_data_reg[75] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[75]),
        .Q(m_axis_tdata[75]),
        .R(1'b0));
  FDRE \acc_data_reg[76] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[76]),
        .Q(m_axis_tdata[76]),
        .R(1'b0));
  FDRE \acc_data_reg[77] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[77]),
        .Q(m_axis_tdata[77]),
        .R(1'b0));
  FDRE \acc_data_reg[78] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[78]),
        .Q(m_axis_tdata[78]),
        .R(1'b0));
  FDRE \acc_data_reg[79] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[79]),
        .Q(m_axis_tdata[79]),
        .R(1'b0));
  FDRE \acc_data_reg[7] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[7]),
        .Q(m_axis_tdata[7]),
        .R(1'b0));
  FDRE \acc_data_reg[80] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[80]),
        .Q(m_axis_tdata[80]),
        .R(1'b0));
  FDRE \acc_data_reg[81] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[81]),
        .Q(m_axis_tdata[81]),
        .R(1'b0));
  FDRE \acc_data_reg[82] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[82]),
        .Q(m_axis_tdata[82]),
        .R(1'b0));
  FDRE \acc_data_reg[83] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[83]),
        .Q(m_axis_tdata[83]),
        .R(1'b0));
  FDRE \acc_data_reg[84] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[84]),
        .Q(m_axis_tdata[84]),
        .R(1'b0));
  FDRE \acc_data_reg[85] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[85]),
        .Q(m_axis_tdata[85]),
        .R(1'b0));
  FDRE \acc_data_reg[86] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[86]),
        .Q(m_axis_tdata[86]),
        .R(1'b0));
  FDRE \acc_data_reg[87] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[87]),
        .Q(m_axis_tdata[87]),
        .R(1'b0));
  FDRE \acc_data_reg[88] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[88]),
        .Q(m_axis_tdata[88]),
        .R(1'b0));
  FDRE \acc_data_reg[89] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[89]),
        .Q(m_axis_tdata[89]),
        .R(1'b0));
  FDRE \acc_data_reg[8] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[8]),
        .Q(m_axis_tdata[8]),
        .R(1'b0));
  FDRE \acc_data_reg[90] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[90]),
        .Q(m_axis_tdata[90]),
        .R(1'b0));
  FDRE \acc_data_reg[91] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[91]),
        .Q(m_axis_tdata[91]),
        .R(1'b0));
  FDRE \acc_data_reg[92] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[92]),
        .Q(m_axis_tdata[92]),
        .R(1'b0));
  FDRE \acc_data_reg[93] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[93]),
        .Q(m_axis_tdata[93]),
        .R(1'b0));
  FDRE \acc_data_reg[94] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[94]),
        .Q(m_axis_tdata[94]),
        .R(1'b0));
  FDRE \acc_data_reg[95] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[95]),
        .Q(m_axis_tdata[95]),
        .R(1'b0));
  FDRE \acc_data_reg[96] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[96]),
        .Q(m_axis_tdata[96]),
        .R(1'b0));
  FDRE \acc_data_reg[97] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[97]),
        .Q(m_axis_tdata[97]),
        .R(1'b0));
  FDRE \acc_data_reg[98] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[98]),
        .Q(m_axis_tdata[98]),
        .R(1'b0));
  FDRE \acc_data_reg[99] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[99]),
        .Q(m_axis_tdata[99]),
        .R(1'b0));
  FDRE \acc_data_reg[9] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_data[9]),
        .Q(m_axis_tdata[9]),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h80)) 
    \acc_keep[31]_i_1 
       (.I0(p_0_in5_in),
        .I1(aclken),
        .I2(r0_last_reg_n_0),
        .O(acc_strb));
  FDRE \acc_keep_reg[0] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_keep[0]),
        .Q(m_axis_tkeep[0]),
        .R(1'b0));
  FDRE \acc_keep_reg[10] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_keep[10]),
        .Q(m_axis_tkeep[10]),
        .R(1'b0));
  FDRE \acc_keep_reg[11] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_keep[11]),
        .Q(m_axis_tkeep[11]),
        .R(1'b0));
  FDRE \acc_keep_reg[12] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_keep[12]),
        .Q(m_axis_tkeep[12]),
        .R(1'b0));
  FDRE \acc_keep_reg[13] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_keep[13]),
        .Q(m_axis_tkeep[13]),
        .R(1'b0));
  FDRE \acc_keep_reg[14] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_keep[14]),
        .Q(m_axis_tkeep[14]),
        .R(1'b0));
  FDRE \acc_keep_reg[15] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_keep[15]),
        .Q(m_axis_tkeep[15]),
        .R(1'b0));
  FDRE \acc_keep_reg[16] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tkeep[0]),
        .Q(m_axis_tkeep[16]),
        .R(acc_strb));
  FDRE \acc_keep_reg[17] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tkeep[1]),
        .Q(m_axis_tkeep[17]),
        .R(acc_strb));
  FDRE \acc_keep_reg[18] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tkeep[2]),
        .Q(m_axis_tkeep[18]),
        .R(acc_strb));
  FDRE \acc_keep_reg[19] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tkeep[3]),
        .Q(m_axis_tkeep[19]),
        .R(acc_strb));
  FDRE \acc_keep_reg[1] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_keep[1]),
        .Q(m_axis_tkeep[1]),
        .R(1'b0));
  FDRE \acc_keep_reg[20] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tkeep[4]),
        .Q(m_axis_tkeep[20]),
        .R(acc_strb));
  FDRE \acc_keep_reg[21] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tkeep[5]),
        .Q(m_axis_tkeep[21]),
        .R(acc_strb));
  FDRE \acc_keep_reg[22] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tkeep[6]),
        .Q(m_axis_tkeep[22]),
        .R(acc_strb));
  FDRE \acc_keep_reg[23] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tkeep[7]),
        .Q(m_axis_tkeep[23]),
        .R(acc_strb));
  FDRE \acc_keep_reg[24] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tkeep[8]),
        .Q(m_axis_tkeep[24]),
        .R(acc_strb));
  FDRE \acc_keep_reg[25] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tkeep[9]),
        .Q(m_axis_tkeep[25]),
        .R(acc_strb));
  FDRE \acc_keep_reg[26] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tkeep[10]),
        .Q(m_axis_tkeep[26]),
        .R(acc_strb));
  FDRE \acc_keep_reg[27] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tkeep[11]),
        .Q(m_axis_tkeep[27]),
        .R(acc_strb));
  FDRE \acc_keep_reg[28] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tkeep[12]),
        .Q(m_axis_tkeep[28]),
        .R(acc_strb));
  FDRE \acc_keep_reg[29] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tkeep[13]),
        .Q(m_axis_tkeep[29]),
        .R(acc_strb));
  FDRE \acc_keep_reg[2] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_keep[2]),
        .Q(m_axis_tkeep[2]),
        .R(1'b0));
  FDRE \acc_keep_reg[30] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tkeep[14]),
        .Q(m_axis_tkeep[30]),
        .R(acc_strb));
  FDRE \acc_keep_reg[31] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tkeep[15]),
        .Q(m_axis_tkeep[31]),
        .R(acc_strb));
  FDRE \acc_keep_reg[3] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_keep[3]),
        .Q(m_axis_tkeep[3]),
        .R(1'b0));
  FDRE \acc_keep_reg[4] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_keep[4]),
        .Q(m_axis_tkeep[4]),
        .R(1'b0));
  FDRE \acc_keep_reg[5] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_keep[5]),
        .Q(m_axis_tkeep[5]),
        .R(1'b0));
  FDRE \acc_keep_reg[6] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_keep[6]),
        .Q(m_axis_tkeep[6]),
        .R(1'b0));
  FDRE \acc_keep_reg[7] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_keep[7]),
        .Q(m_axis_tkeep[7]),
        .R(1'b0));
  FDRE \acc_keep_reg[8] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_keep[8]),
        .Q(m_axis_tkeep[8]),
        .R(1'b0));
  FDRE \acc_keep_reg[9] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_keep[9]),
        .Q(m_axis_tkeep[9]),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFCAACCAA)) 
    acc_last_i_1
       (.I0(m_axis_tlast),
        .I1(s_axis_tlast),
        .I2(r0_last_reg_n_0),
        .I3(acc_last),
        .I4(p_0_in5_in),
        .O(acc_last_i_1_n_0));
  LUT3 #(
    .INIT(8'h10)) 
    acc_last_i_2
       (.I0(p_1_in),
        .I1(\FSM_onehot_state_reg_n_0_[2] ),
        .I2(aclken),
        .O(acc_last));
  FDRE acc_last_reg
       (.C(aclk),
        .CE(1'b1),
        .D(acc_last_i_1_n_0),
        .Q(m_axis_tlast),
        .R(1'b0));
  FDRE \acc_user_reg[0] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[0]),
        .Q(m_axis_tuser[0]),
        .R(1'b0));
  FDRE \acc_user_reg[100] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[100]),
        .Q(m_axis_tuser[100]),
        .R(1'b0));
  FDRE \acc_user_reg[101] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[101]),
        .Q(m_axis_tuser[101]),
        .R(1'b0));
  FDRE \acc_user_reg[102] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[102]),
        .Q(m_axis_tuser[102]),
        .R(1'b0));
  FDRE \acc_user_reg[103] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[103]),
        .Q(m_axis_tuser[103]),
        .R(1'b0));
  FDRE \acc_user_reg[104] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[104]),
        .Q(m_axis_tuser[104]),
        .R(1'b0));
  FDRE \acc_user_reg[105] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[105]),
        .Q(m_axis_tuser[105]),
        .R(1'b0));
  FDRE \acc_user_reg[106] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[106]),
        .Q(m_axis_tuser[106]),
        .R(1'b0));
  FDRE \acc_user_reg[107] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[107]),
        .Q(m_axis_tuser[107]),
        .R(1'b0));
  FDRE \acc_user_reg[108] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[108]),
        .Q(m_axis_tuser[108]),
        .R(1'b0));
  FDRE \acc_user_reg[109] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[109]),
        .Q(m_axis_tuser[109]),
        .R(1'b0));
  FDRE \acc_user_reg[10] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[10]),
        .Q(m_axis_tuser[10]),
        .R(1'b0));
  FDRE \acc_user_reg[110] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[110]),
        .Q(m_axis_tuser[110]),
        .R(1'b0));
  FDRE \acc_user_reg[111] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[111]),
        .Q(m_axis_tuser[111]),
        .R(1'b0));
  FDRE \acc_user_reg[112] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[112]),
        .Q(m_axis_tuser[112]),
        .R(1'b0));
  FDRE \acc_user_reg[113] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[113]),
        .Q(m_axis_tuser[113]),
        .R(1'b0));
  FDRE \acc_user_reg[114] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[114]),
        .Q(m_axis_tuser[114]),
        .R(1'b0));
  FDRE \acc_user_reg[115] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[115]),
        .Q(m_axis_tuser[115]),
        .R(1'b0));
  FDRE \acc_user_reg[116] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[116]),
        .Q(m_axis_tuser[116]),
        .R(1'b0));
  FDRE \acc_user_reg[117] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[117]),
        .Q(m_axis_tuser[117]),
        .R(1'b0));
  FDRE \acc_user_reg[118] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[118]),
        .Q(m_axis_tuser[118]),
        .R(1'b0));
  FDRE \acc_user_reg[119] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[119]),
        .Q(m_axis_tuser[119]),
        .R(1'b0));
  FDRE \acc_user_reg[11] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[11]),
        .Q(m_axis_tuser[11]),
        .R(1'b0));
  FDRE \acc_user_reg[120] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[120]),
        .Q(m_axis_tuser[120]),
        .R(1'b0));
  FDRE \acc_user_reg[121] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[121]),
        .Q(m_axis_tuser[121]),
        .R(1'b0));
  FDRE \acc_user_reg[122] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[122]),
        .Q(m_axis_tuser[122]),
        .R(1'b0));
  FDRE \acc_user_reg[123] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[123]),
        .Q(m_axis_tuser[123]),
        .R(1'b0));
  FDRE \acc_user_reg[124] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[124]),
        .Q(m_axis_tuser[124]),
        .R(1'b0));
  FDRE \acc_user_reg[125] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[125]),
        .Q(m_axis_tuser[125]),
        .R(1'b0));
  FDRE \acc_user_reg[126] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[126]),
        .Q(m_axis_tuser[126]),
        .R(1'b0));
  FDRE \acc_user_reg[127] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[127]),
        .Q(m_axis_tuser[127]),
        .R(1'b0));
  FDRE \acc_user_reg[128] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[0]),
        .Q(m_axis_tuser[128]),
        .R(1'b0));
  FDRE \acc_user_reg[129] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[1]),
        .Q(m_axis_tuser[129]),
        .R(1'b0));
  FDRE \acc_user_reg[12] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[12]),
        .Q(m_axis_tuser[12]),
        .R(1'b0));
  FDRE \acc_user_reg[130] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[2]),
        .Q(m_axis_tuser[130]),
        .R(1'b0));
  FDRE \acc_user_reg[131] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[3]),
        .Q(m_axis_tuser[131]),
        .R(1'b0));
  FDRE \acc_user_reg[132] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[4]),
        .Q(m_axis_tuser[132]),
        .R(1'b0));
  FDRE \acc_user_reg[133] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[5]),
        .Q(m_axis_tuser[133]),
        .R(1'b0));
  FDRE \acc_user_reg[134] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[6]),
        .Q(m_axis_tuser[134]),
        .R(1'b0));
  FDRE \acc_user_reg[135] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[7]),
        .Q(m_axis_tuser[135]),
        .R(1'b0));
  FDRE \acc_user_reg[136] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[8]),
        .Q(m_axis_tuser[136]),
        .R(1'b0));
  FDRE \acc_user_reg[137] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[9]),
        .Q(m_axis_tuser[137]),
        .R(1'b0));
  FDRE \acc_user_reg[138] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[10]),
        .Q(m_axis_tuser[138]),
        .R(1'b0));
  FDRE \acc_user_reg[139] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[11]),
        .Q(m_axis_tuser[139]),
        .R(1'b0));
  FDRE \acc_user_reg[13] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[13]),
        .Q(m_axis_tuser[13]),
        .R(1'b0));
  FDRE \acc_user_reg[140] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[12]),
        .Q(m_axis_tuser[140]),
        .R(1'b0));
  FDRE \acc_user_reg[141] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[13]),
        .Q(m_axis_tuser[141]),
        .R(1'b0));
  FDRE \acc_user_reg[142] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[14]),
        .Q(m_axis_tuser[142]),
        .R(1'b0));
  FDRE \acc_user_reg[143] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[15]),
        .Q(m_axis_tuser[143]),
        .R(1'b0));
  FDRE \acc_user_reg[144] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[16]),
        .Q(m_axis_tuser[144]),
        .R(1'b0));
  FDRE \acc_user_reg[145] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[17]),
        .Q(m_axis_tuser[145]),
        .R(1'b0));
  FDRE \acc_user_reg[146] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[18]),
        .Q(m_axis_tuser[146]),
        .R(1'b0));
  FDRE \acc_user_reg[147] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[19]),
        .Q(m_axis_tuser[147]),
        .R(1'b0));
  FDRE \acc_user_reg[148] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[20]),
        .Q(m_axis_tuser[148]),
        .R(1'b0));
  FDRE \acc_user_reg[149] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[21]),
        .Q(m_axis_tuser[149]),
        .R(1'b0));
  FDRE \acc_user_reg[14] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[14]),
        .Q(m_axis_tuser[14]),
        .R(1'b0));
  FDRE \acc_user_reg[150] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[22]),
        .Q(m_axis_tuser[150]),
        .R(1'b0));
  FDRE \acc_user_reg[151] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[23]),
        .Q(m_axis_tuser[151]),
        .R(1'b0));
  FDRE \acc_user_reg[152] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[24]),
        .Q(m_axis_tuser[152]),
        .R(1'b0));
  FDRE \acc_user_reg[153] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[25]),
        .Q(m_axis_tuser[153]),
        .R(1'b0));
  FDRE \acc_user_reg[154] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[26]),
        .Q(m_axis_tuser[154]),
        .R(1'b0));
  FDRE \acc_user_reg[155] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[27]),
        .Q(m_axis_tuser[155]),
        .R(1'b0));
  FDRE \acc_user_reg[156] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[28]),
        .Q(m_axis_tuser[156]),
        .R(1'b0));
  FDRE \acc_user_reg[157] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[29]),
        .Q(m_axis_tuser[157]),
        .R(1'b0));
  FDRE \acc_user_reg[158] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[30]),
        .Q(m_axis_tuser[158]),
        .R(1'b0));
  FDRE \acc_user_reg[159] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[31]),
        .Q(m_axis_tuser[159]),
        .R(1'b0));
  FDRE \acc_user_reg[15] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[15]),
        .Q(m_axis_tuser[15]),
        .R(1'b0));
  FDRE \acc_user_reg[160] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[32]),
        .Q(m_axis_tuser[160]),
        .R(1'b0));
  FDRE \acc_user_reg[161] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[33]),
        .Q(m_axis_tuser[161]),
        .R(1'b0));
  FDRE \acc_user_reg[162] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[34]),
        .Q(m_axis_tuser[162]),
        .R(1'b0));
  FDRE \acc_user_reg[163] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[35]),
        .Q(m_axis_tuser[163]),
        .R(1'b0));
  FDRE \acc_user_reg[164] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[36]),
        .Q(m_axis_tuser[164]),
        .R(1'b0));
  FDRE \acc_user_reg[165] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[37]),
        .Q(m_axis_tuser[165]),
        .R(1'b0));
  FDRE \acc_user_reg[166] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[38]),
        .Q(m_axis_tuser[166]),
        .R(1'b0));
  FDRE \acc_user_reg[167] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[39]),
        .Q(m_axis_tuser[167]),
        .R(1'b0));
  FDRE \acc_user_reg[168] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[40]),
        .Q(m_axis_tuser[168]),
        .R(1'b0));
  FDRE \acc_user_reg[169] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[41]),
        .Q(m_axis_tuser[169]),
        .R(1'b0));
  FDRE \acc_user_reg[16] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[16]),
        .Q(m_axis_tuser[16]),
        .R(1'b0));
  FDRE \acc_user_reg[170] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[42]),
        .Q(m_axis_tuser[170]),
        .R(1'b0));
  FDRE \acc_user_reg[171] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[43]),
        .Q(m_axis_tuser[171]),
        .R(1'b0));
  FDRE \acc_user_reg[172] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[44]),
        .Q(m_axis_tuser[172]),
        .R(1'b0));
  FDRE \acc_user_reg[173] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[45]),
        .Q(m_axis_tuser[173]),
        .R(1'b0));
  FDRE \acc_user_reg[174] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[46]),
        .Q(m_axis_tuser[174]),
        .R(1'b0));
  FDRE \acc_user_reg[175] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[47]),
        .Q(m_axis_tuser[175]),
        .R(1'b0));
  FDRE \acc_user_reg[176] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[48]),
        .Q(m_axis_tuser[176]),
        .R(1'b0));
  FDRE \acc_user_reg[177] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[49]),
        .Q(m_axis_tuser[177]),
        .R(1'b0));
  FDRE \acc_user_reg[178] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[50]),
        .Q(m_axis_tuser[178]),
        .R(1'b0));
  FDRE \acc_user_reg[179] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[51]),
        .Q(m_axis_tuser[179]),
        .R(1'b0));
  FDRE \acc_user_reg[17] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[17]),
        .Q(m_axis_tuser[17]),
        .R(1'b0));
  FDRE \acc_user_reg[180] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[52]),
        .Q(m_axis_tuser[180]),
        .R(1'b0));
  FDRE \acc_user_reg[181] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[53]),
        .Q(m_axis_tuser[181]),
        .R(1'b0));
  FDRE \acc_user_reg[182] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[54]),
        .Q(m_axis_tuser[182]),
        .R(1'b0));
  FDRE \acc_user_reg[183] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[55]),
        .Q(m_axis_tuser[183]),
        .R(1'b0));
  FDRE \acc_user_reg[184] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[56]),
        .Q(m_axis_tuser[184]),
        .R(1'b0));
  FDRE \acc_user_reg[185] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[57]),
        .Q(m_axis_tuser[185]),
        .R(1'b0));
  FDRE \acc_user_reg[186] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[58]),
        .Q(m_axis_tuser[186]),
        .R(1'b0));
  FDRE \acc_user_reg[187] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[59]),
        .Q(m_axis_tuser[187]),
        .R(1'b0));
  FDRE \acc_user_reg[188] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[60]),
        .Q(m_axis_tuser[188]),
        .R(1'b0));
  FDRE \acc_user_reg[189] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[61]),
        .Q(m_axis_tuser[189]),
        .R(1'b0));
  FDRE \acc_user_reg[18] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[18]),
        .Q(m_axis_tuser[18]),
        .R(1'b0));
  FDRE \acc_user_reg[190] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[62]),
        .Q(m_axis_tuser[190]),
        .R(1'b0));
  FDRE \acc_user_reg[191] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[63]),
        .Q(m_axis_tuser[191]),
        .R(1'b0));
  FDRE \acc_user_reg[192] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[64]),
        .Q(m_axis_tuser[192]),
        .R(1'b0));
  FDRE \acc_user_reg[193] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[65]),
        .Q(m_axis_tuser[193]),
        .R(1'b0));
  FDRE \acc_user_reg[194] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[66]),
        .Q(m_axis_tuser[194]),
        .R(1'b0));
  FDRE \acc_user_reg[195] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[67]),
        .Q(m_axis_tuser[195]),
        .R(1'b0));
  FDRE \acc_user_reg[196] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[68]),
        .Q(m_axis_tuser[196]),
        .R(1'b0));
  FDRE \acc_user_reg[197] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[69]),
        .Q(m_axis_tuser[197]),
        .R(1'b0));
  FDRE \acc_user_reg[198] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[70]),
        .Q(m_axis_tuser[198]),
        .R(1'b0));
  FDRE \acc_user_reg[199] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[71]),
        .Q(m_axis_tuser[199]),
        .R(1'b0));
  FDRE \acc_user_reg[19] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[19]),
        .Q(m_axis_tuser[19]),
        .R(1'b0));
  FDRE \acc_user_reg[1] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[1]),
        .Q(m_axis_tuser[1]),
        .R(1'b0));
  FDRE \acc_user_reg[200] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[72]),
        .Q(m_axis_tuser[200]),
        .R(1'b0));
  FDRE \acc_user_reg[201] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[73]),
        .Q(m_axis_tuser[201]),
        .R(1'b0));
  FDRE \acc_user_reg[202] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[74]),
        .Q(m_axis_tuser[202]),
        .R(1'b0));
  FDRE \acc_user_reg[203] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[75]),
        .Q(m_axis_tuser[203]),
        .R(1'b0));
  FDRE \acc_user_reg[204] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[76]),
        .Q(m_axis_tuser[204]),
        .R(1'b0));
  FDRE \acc_user_reg[205] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[77]),
        .Q(m_axis_tuser[205]),
        .R(1'b0));
  FDRE \acc_user_reg[206] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[78]),
        .Q(m_axis_tuser[206]),
        .R(1'b0));
  FDRE \acc_user_reg[207] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[79]),
        .Q(m_axis_tuser[207]),
        .R(1'b0));
  FDRE \acc_user_reg[208] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[80]),
        .Q(m_axis_tuser[208]),
        .R(1'b0));
  FDRE \acc_user_reg[209] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[81]),
        .Q(m_axis_tuser[209]),
        .R(1'b0));
  FDRE \acc_user_reg[20] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[20]),
        .Q(m_axis_tuser[20]),
        .R(1'b0));
  FDRE \acc_user_reg[210] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[82]),
        .Q(m_axis_tuser[210]),
        .R(1'b0));
  FDRE \acc_user_reg[211] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[83]),
        .Q(m_axis_tuser[211]),
        .R(1'b0));
  FDRE \acc_user_reg[212] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[84]),
        .Q(m_axis_tuser[212]),
        .R(1'b0));
  FDRE \acc_user_reg[213] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[85]),
        .Q(m_axis_tuser[213]),
        .R(1'b0));
  FDRE \acc_user_reg[214] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[86]),
        .Q(m_axis_tuser[214]),
        .R(1'b0));
  FDRE \acc_user_reg[215] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[87]),
        .Q(m_axis_tuser[215]),
        .R(1'b0));
  FDRE \acc_user_reg[216] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[88]),
        .Q(m_axis_tuser[216]),
        .R(1'b0));
  FDRE \acc_user_reg[217] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[89]),
        .Q(m_axis_tuser[217]),
        .R(1'b0));
  FDRE \acc_user_reg[218] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[90]),
        .Q(m_axis_tuser[218]),
        .R(1'b0));
  FDRE \acc_user_reg[219] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[91]),
        .Q(m_axis_tuser[219]),
        .R(1'b0));
  FDRE \acc_user_reg[21] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[21]),
        .Q(m_axis_tuser[21]),
        .R(1'b0));
  FDRE \acc_user_reg[220] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[92]),
        .Q(m_axis_tuser[220]),
        .R(1'b0));
  FDRE \acc_user_reg[221] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[93]),
        .Q(m_axis_tuser[221]),
        .R(1'b0));
  FDRE \acc_user_reg[222] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[94]),
        .Q(m_axis_tuser[222]),
        .R(1'b0));
  FDRE \acc_user_reg[223] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[95]),
        .Q(m_axis_tuser[223]),
        .R(1'b0));
  FDRE \acc_user_reg[224] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[96]),
        .Q(m_axis_tuser[224]),
        .R(1'b0));
  FDRE \acc_user_reg[225] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[97]),
        .Q(m_axis_tuser[225]),
        .R(1'b0));
  FDRE \acc_user_reg[226] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[98]),
        .Q(m_axis_tuser[226]),
        .R(1'b0));
  FDRE \acc_user_reg[227] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[99]),
        .Q(m_axis_tuser[227]),
        .R(1'b0));
  FDRE \acc_user_reg[228] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[100]),
        .Q(m_axis_tuser[228]),
        .R(1'b0));
  FDRE \acc_user_reg[229] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[101]),
        .Q(m_axis_tuser[229]),
        .R(1'b0));
  FDRE \acc_user_reg[22] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[22]),
        .Q(m_axis_tuser[22]),
        .R(1'b0));
  FDRE \acc_user_reg[230] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[102]),
        .Q(m_axis_tuser[230]),
        .R(1'b0));
  FDRE \acc_user_reg[231] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[103]),
        .Q(m_axis_tuser[231]),
        .R(1'b0));
  FDRE \acc_user_reg[232] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[104]),
        .Q(m_axis_tuser[232]),
        .R(1'b0));
  FDRE \acc_user_reg[233] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[105]),
        .Q(m_axis_tuser[233]),
        .R(1'b0));
  FDRE \acc_user_reg[234] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[106]),
        .Q(m_axis_tuser[234]),
        .R(1'b0));
  FDRE \acc_user_reg[235] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[107]),
        .Q(m_axis_tuser[235]),
        .R(1'b0));
  FDRE \acc_user_reg[236] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[108]),
        .Q(m_axis_tuser[236]),
        .R(1'b0));
  FDRE \acc_user_reg[237] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[109]),
        .Q(m_axis_tuser[237]),
        .R(1'b0));
  FDRE \acc_user_reg[238] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[110]),
        .Q(m_axis_tuser[238]),
        .R(1'b0));
  FDRE \acc_user_reg[239] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[111]),
        .Q(m_axis_tuser[239]),
        .R(1'b0));
  FDRE \acc_user_reg[23] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[23]),
        .Q(m_axis_tuser[23]),
        .R(1'b0));
  FDRE \acc_user_reg[240] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[112]),
        .Q(m_axis_tuser[240]),
        .R(1'b0));
  FDRE \acc_user_reg[241] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[113]),
        .Q(m_axis_tuser[241]),
        .R(1'b0));
  FDRE \acc_user_reg[242] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[114]),
        .Q(m_axis_tuser[242]),
        .R(1'b0));
  FDRE \acc_user_reg[243] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[115]),
        .Q(m_axis_tuser[243]),
        .R(1'b0));
  FDRE \acc_user_reg[244] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[116]),
        .Q(m_axis_tuser[244]),
        .R(1'b0));
  FDRE \acc_user_reg[245] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[117]),
        .Q(m_axis_tuser[245]),
        .R(1'b0));
  FDRE \acc_user_reg[246] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[118]),
        .Q(m_axis_tuser[246]),
        .R(1'b0));
  FDRE \acc_user_reg[247] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[119]),
        .Q(m_axis_tuser[247]),
        .R(1'b0));
  FDRE \acc_user_reg[248] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[120]),
        .Q(m_axis_tuser[248]),
        .R(1'b0));
  FDRE \acc_user_reg[249] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[121]),
        .Q(m_axis_tuser[249]),
        .R(1'b0));
  FDRE \acc_user_reg[24] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[24]),
        .Q(m_axis_tuser[24]),
        .R(1'b0));
  FDRE \acc_user_reg[250] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[122]),
        .Q(m_axis_tuser[250]),
        .R(1'b0));
  FDRE \acc_user_reg[251] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[123]),
        .Q(m_axis_tuser[251]),
        .R(1'b0));
  FDRE \acc_user_reg[252] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[124]),
        .Q(m_axis_tuser[252]),
        .R(1'b0));
  FDRE \acc_user_reg[253] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[125]),
        .Q(m_axis_tuser[253]),
        .R(1'b0));
  FDRE \acc_user_reg[254] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[126]),
        .Q(m_axis_tuser[254]),
        .R(1'b0));
  FDRE \acc_user_reg[255] 
       (.C(aclk),
        .CE(\acc_data[255]_i_1_n_0 ),
        .D(s_axis_tuser[127]),
        .Q(m_axis_tuser[255]),
        .R(1'b0));
  FDRE \acc_user_reg[25] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[25]),
        .Q(m_axis_tuser[25]),
        .R(1'b0));
  FDRE \acc_user_reg[26] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[26]),
        .Q(m_axis_tuser[26]),
        .R(1'b0));
  FDRE \acc_user_reg[27] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[27]),
        .Q(m_axis_tuser[27]),
        .R(1'b0));
  FDRE \acc_user_reg[28] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[28]),
        .Q(m_axis_tuser[28]),
        .R(1'b0));
  FDRE \acc_user_reg[29] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[29]),
        .Q(m_axis_tuser[29]),
        .R(1'b0));
  FDRE \acc_user_reg[2] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[2]),
        .Q(m_axis_tuser[2]),
        .R(1'b0));
  FDRE \acc_user_reg[30] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[30]),
        .Q(m_axis_tuser[30]),
        .R(1'b0));
  FDRE \acc_user_reg[31] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[31]),
        .Q(m_axis_tuser[31]),
        .R(1'b0));
  FDRE \acc_user_reg[32] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[32]),
        .Q(m_axis_tuser[32]),
        .R(1'b0));
  FDRE \acc_user_reg[33] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[33]),
        .Q(m_axis_tuser[33]),
        .R(1'b0));
  FDRE \acc_user_reg[34] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[34]),
        .Q(m_axis_tuser[34]),
        .R(1'b0));
  FDRE \acc_user_reg[35] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[35]),
        .Q(m_axis_tuser[35]),
        .R(1'b0));
  FDRE \acc_user_reg[36] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[36]),
        .Q(m_axis_tuser[36]),
        .R(1'b0));
  FDRE \acc_user_reg[37] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[37]),
        .Q(m_axis_tuser[37]),
        .R(1'b0));
  FDRE \acc_user_reg[38] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[38]),
        .Q(m_axis_tuser[38]),
        .R(1'b0));
  FDRE \acc_user_reg[39] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[39]),
        .Q(m_axis_tuser[39]),
        .R(1'b0));
  FDRE \acc_user_reg[3] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[3]),
        .Q(m_axis_tuser[3]),
        .R(1'b0));
  FDRE \acc_user_reg[40] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[40]),
        .Q(m_axis_tuser[40]),
        .R(1'b0));
  FDRE \acc_user_reg[41] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[41]),
        .Q(m_axis_tuser[41]),
        .R(1'b0));
  FDRE \acc_user_reg[42] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[42]),
        .Q(m_axis_tuser[42]),
        .R(1'b0));
  FDRE \acc_user_reg[43] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[43]),
        .Q(m_axis_tuser[43]),
        .R(1'b0));
  FDRE \acc_user_reg[44] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[44]),
        .Q(m_axis_tuser[44]),
        .R(1'b0));
  FDRE \acc_user_reg[45] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[45]),
        .Q(m_axis_tuser[45]),
        .R(1'b0));
  FDRE \acc_user_reg[46] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[46]),
        .Q(m_axis_tuser[46]),
        .R(1'b0));
  FDRE \acc_user_reg[47] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[47]),
        .Q(m_axis_tuser[47]),
        .R(1'b0));
  FDRE \acc_user_reg[48] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[48]),
        .Q(m_axis_tuser[48]),
        .R(1'b0));
  FDRE \acc_user_reg[49] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[49]),
        .Q(m_axis_tuser[49]),
        .R(1'b0));
  FDRE \acc_user_reg[4] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[4]),
        .Q(m_axis_tuser[4]),
        .R(1'b0));
  FDRE \acc_user_reg[50] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[50]),
        .Q(m_axis_tuser[50]),
        .R(1'b0));
  FDRE \acc_user_reg[51] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[51]),
        .Q(m_axis_tuser[51]),
        .R(1'b0));
  FDRE \acc_user_reg[52] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[52]),
        .Q(m_axis_tuser[52]),
        .R(1'b0));
  FDRE \acc_user_reg[53] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[53]),
        .Q(m_axis_tuser[53]),
        .R(1'b0));
  FDRE \acc_user_reg[54] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[54]),
        .Q(m_axis_tuser[54]),
        .R(1'b0));
  FDRE \acc_user_reg[55] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[55]),
        .Q(m_axis_tuser[55]),
        .R(1'b0));
  FDRE \acc_user_reg[56] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[56]),
        .Q(m_axis_tuser[56]),
        .R(1'b0));
  FDRE \acc_user_reg[57] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[57]),
        .Q(m_axis_tuser[57]),
        .R(1'b0));
  FDRE \acc_user_reg[58] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[58]),
        .Q(m_axis_tuser[58]),
        .R(1'b0));
  FDRE \acc_user_reg[59] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[59]),
        .Q(m_axis_tuser[59]),
        .R(1'b0));
  FDRE \acc_user_reg[5] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[5]),
        .Q(m_axis_tuser[5]),
        .R(1'b0));
  FDRE \acc_user_reg[60] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[60]),
        .Q(m_axis_tuser[60]),
        .R(1'b0));
  FDRE \acc_user_reg[61] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[61]),
        .Q(m_axis_tuser[61]),
        .R(1'b0));
  FDRE \acc_user_reg[62] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[62]),
        .Q(m_axis_tuser[62]),
        .R(1'b0));
  FDRE \acc_user_reg[63] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[63]),
        .Q(m_axis_tuser[63]),
        .R(1'b0));
  FDRE \acc_user_reg[64] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[64]),
        .Q(m_axis_tuser[64]),
        .R(1'b0));
  FDRE \acc_user_reg[65] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[65]),
        .Q(m_axis_tuser[65]),
        .R(1'b0));
  FDRE \acc_user_reg[66] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[66]),
        .Q(m_axis_tuser[66]),
        .R(1'b0));
  FDRE \acc_user_reg[67] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[67]),
        .Q(m_axis_tuser[67]),
        .R(1'b0));
  FDRE \acc_user_reg[68] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[68]),
        .Q(m_axis_tuser[68]),
        .R(1'b0));
  FDRE \acc_user_reg[69] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[69]),
        .Q(m_axis_tuser[69]),
        .R(1'b0));
  FDRE \acc_user_reg[6] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[6]),
        .Q(m_axis_tuser[6]),
        .R(1'b0));
  FDRE \acc_user_reg[70] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[70]),
        .Q(m_axis_tuser[70]),
        .R(1'b0));
  FDRE \acc_user_reg[71] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[71]),
        .Q(m_axis_tuser[71]),
        .R(1'b0));
  FDRE \acc_user_reg[72] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[72]),
        .Q(m_axis_tuser[72]),
        .R(1'b0));
  FDRE \acc_user_reg[73] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[73]),
        .Q(m_axis_tuser[73]),
        .R(1'b0));
  FDRE \acc_user_reg[74] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[74]),
        .Q(m_axis_tuser[74]),
        .R(1'b0));
  FDRE \acc_user_reg[75] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[75]),
        .Q(m_axis_tuser[75]),
        .R(1'b0));
  FDRE \acc_user_reg[76] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[76]),
        .Q(m_axis_tuser[76]),
        .R(1'b0));
  FDRE \acc_user_reg[77] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[77]),
        .Q(m_axis_tuser[77]),
        .R(1'b0));
  FDRE \acc_user_reg[78] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[78]),
        .Q(m_axis_tuser[78]),
        .R(1'b0));
  FDRE \acc_user_reg[79] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[79]),
        .Q(m_axis_tuser[79]),
        .R(1'b0));
  FDRE \acc_user_reg[7] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[7]),
        .Q(m_axis_tuser[7]),
        .R(1'b0));
  FDRE \acc_user_reg[80] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[80]),
        .Q(m_axis_tuser[80]),
        .R(1'b0));
  FDRE \acc_user_reg[81] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[81]),
        .Q(m_axis_tuser[81]),
        .R(1'b0));
  FDRE \acc_user_reg[82] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[82]),
        .Q(m_axis_tuser[82]),
        .R(1'b0));
  FDRE \acc_user_reg[83] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[83]),
        .Q(m_axis_tuser[83]),
        .R(1'b0));
  FDRE \acc_user_reg[84] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[84]),
        .Q(m_axis_tuser[84]),
        .R(1'b0));
  FDRE \acc_user_reg[85] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[85]),
        .Q(m_axis_tuser[85]),
        .R(1'b0));
  FDRE \acc_user_reg[86] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[86]),
        .Q(m_axis_tuser[86]),
        .R(1'b0));
  FDRE \acc_user_reg[87] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[87]),
        .Q(m_axis_tuser[87]),
        .R(1'b0));
  FDRE \acc_user_reg[88] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[88]),
        .Q(m_axis_tuser[88]),
        .R(1'b0));
  FDRE \acc_user_reg[89] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[89]),
        .Q(m_axis_tuser[89]),
        .R(1'b0));
  FDRE \acc_user_reg[8] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[8]),
        .Q(m_axis_tuser[8]),
        .R(1'b0));
  FDRE \acc_user_reg[90] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[90]),
        .Q(m_axis_tuser[90]),
        .R(1'b0));
  FDRE \acc_user_reg[91] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[91]),
        .Q(m_axis_tuser[91]),
        .R(1'b0));
  FDRE \acc_user_reg[92] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[92]),
        .Q(m_axis_tuser[92]),
        .R(1'b0));
  FDRE \acc_user_reg[93] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[93]),
        .Q(m_axis_tuser[93]),
        .R(1'b0));
  FDRE \acc_user_reg[94] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[94]),
        .Q(m_axis_tuser[94]),
        .R(1'b0));
  FDRE \acc_user_reg[95] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[95]),
        .Q(m_axis_tuser[95]),
        .R(1'b0));
  FDRE \acc_user_reg[96] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[96]),
        .Q(m_axis_tuser[96]),
        .R(1'b0));
  FDRE \acc_user_reg[97] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[97]),
        .Q(m_axis_tuser[97]),
        .R(1'b0));
  FDRE \acc_user_reg[98] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[98]),
        .Q(m_axis_tuser[98]),
        .R(1'b0));
  FDRE \acc_user_reg[99] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[99]),
        .Q(m_axis_tuser[99]),
        .R(1'b0));
  FDRE \acc_user_reg[9] 
       (.C(aclk),
        .CE(acc_data),
        .D(r0_user[9]),
        .Q(m_axis_tuser[9]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \r0_data[127]_i_1 
       (.I0(aclken),
        .I1(Q[0]),
        .O(r0_last));
  FDRE \r0_data_reg[0] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[0]),
        .Q(r0_data[0]),
        .R(1'b0));
  FDRE \r0_data_reg[100] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[100]),
        .Q(r0_data[100]),
        .R(1'b0));
  FDRE \r0_data_reg[101] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[101]),
        .Q(r0_data[101]),
        .R(1'b0));
  FDRE \r0_data_reg[102] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[102]),
        .Q(r0_data[102]),
        .R(1'b0));
  FDRE \r0_data_reg[103] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[103]),
        .Q(r0_data[103]),
        .R(1'b0));
  FDRE \r0_data_reg[104] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[104]),
        .Q(r0_data[104]),
        .R(1'b0));
  FDRE \r0_data_reg[105] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[105]),
        .Q(r0_data[105]),
        .R(1'b0));
  FDRE \r0_data_reg[106] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[106]),
        .Q(r0_data[106]),
        .R(1'b0));
  FDRE \r0_data_reg[107] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[107]),
        .Q(r0_data[107]),
        .R(1'b0));
  FDRE \r0_data_reg[108] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[108]),
        .Q(r0_data[108]),
        .R(1'b0));
  FDRE \r0_data_reg[109] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[109]),
        .Q(r0_data[109]),
        .R(1'b0));
  FDRE \r0_data_reg[10] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[10]),
        .Q(r0_data[10]),
        .R(1'b0));
  FDRE \r0_data_reg[110] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[110]),
        .Q(r0_data[110]),
        .R(1'b0));
  FDRE \r0_data_reg[111] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[111]),
        .Q(r0_data[111]),
        .R(1'b0));
  FDRE \r0_data_reg[112] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[112]),
        .Q(r0_data[112]),
        .R(1'b0));
  FDRE \r0_data_reg[113] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[113]),
        .Q(r0_data[113]),
        .R(1'b0));
  FDRE \r0_data_reg[114] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[114]),
        .Q(r0_data[114]),
        .R(1'b0));
  FDRE \r0_data_reg[115] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[115]),
        .Q(r0_data[115]),
        .R(1'b0));
  FDRE \r0_data_reg[116] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[116]),
        .Q(r0_data[116]),
        .R(1'b0));
  FDRE \r0_data_reg[117] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[117]),
        .Q(r0_data[117]),
        .R(1'b0));
  FDRE \r0_data_reg[118] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[118]),
        .Q(r0_data[118]),
        .R(1'b0));
  FDRE \r0_data_reg[119] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[119]),
        .Q(r0_data[119]),
        .R(1'b0));
  FDRE \r0_data_reg[11] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[11]),
        .Q(r0_data[11]),
        .R(1'b0));
  FDRE \r0_data_reg[120] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[120]),
        .Q(r0_data[120]),
        .R(1'b0));
  FDRE \r0_data_reg[121] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[121]),
        .Q(r0_data[121]),
        .R(1'b0));
  FDRE \r0_data_reg[122] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[122]),
        .Q(r0_data[122]),
        .R(1'b0));
  FDRE \r0_data_reg[123] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[123]),
        .Q(r0_data[123]),
        .R(1'b0));
  FDRE \r0_data_reg[124] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[124]),
        .Q(r0_data[124]),
        .R(1'b0));
  FDRE \r0_data_reg[125] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[125]),
        .Q(r0_data[125]),
        .R(1'b0));
  FDRE \r0_data_reg[126] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[126]),
        .Q(r0_data[126]),
        .R(1'b0));
  FDRE \r0_data_reg[127] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[127]),
        .Q(r0_data[127]),
        .R(1'b0));
  FDRE \r0_data_reg[12] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[12]),
        .Q(r0_data[12]),
        .R(1'b0));
  FDRE \r0_data_reg[13] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[13]),
        .Q(r0_data[13]),
        .R(1'b0));
  FDRE \r0_data_reg[14] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[14]),
        .Q(r0_data[14]),
        .R(1'b0));
  FDRE \r0_data_reg[15] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[15]),
        .Q(r0_data[15]),
        .R(1'b0));
  FDRE \r0_data_reg[16] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[16]),
        .Q(r0_data[16]),
        .R(1'b0));
  FDRE \r0_data_reg[17] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[17]),
        .Q(r0_data[17]),
        .R(1'b0));
  FDRE \r0_data_reg[18] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[18]),
        .Q(r0_data[18]),
        .R(1'b0));
  FDRE \r0_data_reg[19] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[19]),
        .Q(r0_data[19]),
        .R(1'b0));
  FDRE \r0_data_reg[1] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[1]),
        .Q(r0_data[1]),
        .R(1'b0));
  FDRE \r0_data_reg[20] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[20]),
        .Q(r0_data[20]),
        .R(1'b0));
  FDRE \r0_data_reg[21] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[21]),
        .Q(r0_data[21]),
        .R(1'b0));
  FDRE \r0_data_reg[22] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[22]),
        .Q(r0_data[22]),
        .R(1'b0));
  FDRE \r0_data_reg[23] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[23]),
        .Q(r0_data[23]),
        .R(1'b0));
  FDRE \r0_data_reg[24] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[24]),
        .Q(r0_data[24]),
        .R(1'b0));
  FDRE \r0_data_reg[25] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[25]),
        .Q(r0_data[25]),
        .R(1'b0));
  FDRE \r0_data_reg[26] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[26]),
        .Q(r0_data[26]),
        .R(1'b0));
  FDRE \r0_data_reg[27] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[27]),
        .Q(r0_data[27]),
        .R(1'b0));
  FDRE \r0_data_reg[28] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[28]),
        .Q(r0_data[28]),
        .R(1'b0));
  FDRE \r0_data_reg[29] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[29]),
        .Q(r0_data[29]),
        .R(1'b0));
  FDRE \r0_data_reg[2] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[2]),
        .Q(r0_data[2]),
        .R(1'b0));
  FDRE \r0_data_reg[30] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[30]),
        .Q(r0_data[30]),
        .R(1'b0));
  FDRE \r0_data_reg[31] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[31]),
        .Q(r0_data[31]),
        .R(1'b0));
  FDRE \r0_data_reg[32] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[32]),
        .Q(r0_data[32]),
        .R(1'b0));
  FDRE \r0_data_reg[33] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[33]),
        .Q(r0_data[33]),
        .R(1'b0));
  FDRE \r0_data_reg[34] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[34]),
        .Q(r0_data[34]),
        .R(1'b0));
  FDRE \r0_data_reg[35] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[35]),
        .Q(r0_data[35]),
        .R(1'b0));
  FDRE \r0_data_reg[36] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[36]),
        .Q(r0_data[36]),
        .R(1'b0));
  FDRE \r0_data_reg[37] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[37]),
        .Q(r0_data[37]),
        .R(1'b0));
  FDRE \r0_data_reg[38] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[38]),
        .Q(r0_data[38]),
        .R(1'b0));
  FDRE \r0_data_reg[39] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[39]),
        .Q(r0_data[39]),
        .R(1'b0));
  FDRE \r0_data_reg[3] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[3]),
        .Q(r0_data[3]),
        .R(1'b0));
  FDRE \r0_data_reg[40] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[40]),
        .Q(r0_data[40]),
        .R(1'b0));
  FDRE \r0_data_reg[41] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[41]),
        .Q(r0_data[41]),
        .R(1'b0));
  FDRE \r0_data_reg[42] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[42]),
        .Q(r0_data[42]),
        .R(1'b0));
  FDRE \r0_data_reg[43] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[43]),
        .Q(r0_data[43]),
        .R(1'b0));
  FDRE \r0_data_reg[44] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[44]),
        .Q(r0_data[44]),
        .R(1'b0));
  FDRE \r0_data_reg[45] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[45]),
        .Q(r0_data[45]),
        .R(1'b0));
  FDRE \r0_data_reg[46] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[46]),
        .Q(r0_data[46]),
        .R(1'b0));
  FDRE \r0_data_reg[47] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[47]),
        .Q(r0_data[47]),
        .R(1'b0));
  FDRE \r0_data_reg[48] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[48]),
        .Q(r0_data[48]),
        .R(1'b0));
  FDRE \r0_data_reg[49] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[49]),
        .Q(r0_data[49]),
        .R(1'b0));
  FDRE \r0_data_reg[4] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[4]),
        .Q(r0_data[4]),
        .R(1'b0));
  FDRE \r0_data_reg[50] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[50]),
        .Q(r0_data[50]),
        .R(1'b0));
  FDRE \r0_data_reg[51] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[51]),
        .Q(r0_data[51]),
        .R(1'b0));
  FDRE \r0_data_reg[52] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[52]),
        .Q(r0_data[52]),
        .R(1'b0));
  FDRE \r0_data_reg[53] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[53]),
        .Q(r0_data[53]),
        .R(1'b0));
  FDRE \r0_data_reg[54] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[54]),
        .Q(r0_data[54]),
        .R(1'b0));
  FDRE \r0_data_reg[55] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[55]),
        .Q(r0_data[55]),
        .R(1'b0));
  FDRE \r0_data_reg[56] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[56]),
        .Q(r0_data[56]),
        .R(1'b0));
  FDRE \r0_data_reg[57] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[57]),
        .Q(r0_data[57]),
        .R(1'b0));
  FDRE \r0_data_reg[58] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[58]),
        .Q(r0_data[58]),
        .R(1'b0));
  FDRE \r0_data_reg[59] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[59]),
        .Q(r0_data[59]),
        .R(1'b0));
  FDRE \r0_data_reg[5] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[5]),
        .Q(r0_data[5]),
        .R(1'b0));
  FDRE \r0_data_reg[60] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[60]),
        .Q(r0_data[60]),
        .R(1'b0));
  FDRE \r0_data_reg[61] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[61]),
        .Q(r0_data[61]),
        .R(1'b0));
  FDRE \r0_data_reg[62] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[62]),
        .Q(r0_data[62]),
        .R(1'b0));
  FDRE \r0_data_reg[63] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[63]),
        .Q(r0_data[63]),
        .R(1'b0));
  FDRE \r0_data_reg[64] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[64]),
        .Q(r0_data[64]),
        .R(1'b0));
  FDRE \r0_data_reg[65] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[65]),
        .Q(r0_data[65]),
        .R(1'b0));
  FDRE \r0_data_reg[66] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[66]),
        .Q(r0_data[66]),
        .R(1'b0));
  FDRE \r0_data_reg[67] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[67]),
        .Q(r0_data[67]),
        .R(1'b0));
  FDRE \r0_data_reg[68] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[68]),
        .Q(r0_data[68]),
        .R(1'b0));
  FDRE \r0_data_reg[69] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[69]),
        .Q(r0_data[69]),
        .R(1'b0));
  FDRE \r0_data_reg[6] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[6]),
        .Q(r0_data[6]),
        .R(1'b0));
  FDRE \r0_data_reg[70] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[70]),
        .Q(r0_data[70]),
        .R(1'b0));
  FDRE \r0_data_reg[71] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[71]),
        .Q(r0_data[71]),
        .R(1'b0));
  FDRE \r0_data_reg[72] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[72]),
        .Q(r0_data[72]),
        .R(1'b0));
  FDRE \r0_data_reg[73] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[73]),
        .Q(r0_data[73]),
        .R(1'b0));
  FDRE \r0_data_reg[74] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[74]),
        .Q(r0_data[74]),
        .R(1'b0));
  FDRE \r0_data_reg[75] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[75]),
        .Q(r0_data[75]),
        .R(1'b0));
  FDRE \r0_data_reg[76] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[76]),
        .Q(r0_data[76]),
        .R(1'b0));
  FDRE \r0_data_reg[77] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[77]),
        .Q(r0_data[77]),
        .R(1'b0));
  FDRE \r0_data_reg[78] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[78]),
        .Q(r0_data[78]),
        .R(1'b0));
  FDRE \r0_data_reg[79] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[79]),
        .Q(r0_data[79]),
        .R(1'b0));
  FDRE \r0_data_reg[7] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[7]),
        .Q(r0_data[7]),
        .R(1'b0));
  FDRE \r0_data_reg[80] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[80]),
        .Q(r0_data[80]),
        .R(1'b0));
  FDRE \r0_data_reg[81] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[81]),
        .Q(r0_data[81]),
        .R(1'b0));
  FDRE \r0_data_reg[82] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[82]),
        .Q(r0_data[82]),
        .R(1'b0));
  FDRE \r0_data_reg[83] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[83]),
        .Q(r0_data[83]),
        .R(1'b0));
  FDRE \r0_data_reg[84] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[84]),
        .Q(r0_data[84]),
        .R(1'b0));
  FDRE \r0_data_reg[85] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[85]),
        .Q(r0_data[85]),
        .R(1'b0));
  FDRE \r0_data_reg[86] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[86]),
        .Q(r0_data[86]),
        .R(1'b0));
  FDRE \r0_data_reg[87] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[87]),
        .Q(r0_data[87]),
        .R(1'b0));
  FDRE \r0_data_reg[88] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[88]),
        .Q(r0_data[88]),
        .R(1'b0));
  FDRE \r0_data_reg[89] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[89]),
        .Q(r0_data[89]),
        .R(1'b0));
  FDRE \r0_data_reg[8] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[8]),
        .Q(r0_data[8]),
        .R(1'b0));
  FDRE \r0_data_reg[90] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[90]),
        .Q(r0_data[90]),
        .R(1'b0));
  FDRE \r0_data_reg[91] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[91]),
        .Q(r0_data[91]),
        .R(1'b0));
  FDRE \r0_data_reg[92] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[92]),
        .Q(r0_data[92]),
        .R(1'b0));
  FDRE \r0_data_reg[93] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[93]),
        .Q(r0_data[93]),
        .R(1'b0));
  FDRE \r0_data_reg[94] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[94]),
        .Q(r0_data[94]),
        .R(1'b0));
  FDRE \r0_data_reg[95] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[95]),
        .Q(r0_data[95]),
        .R(1'b0));
  FDRE \r0_data_reg[96] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[96]),
        .Q(r0_data[96]),
        .R(1'b0));
  FDRE \r0_data_reg[97] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[97]),
        .Q(r0_data[97]),
        .R(1'b0));
  FDRE \r0_data_reg[98] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[98]),
        .Q(r0_data[98]),
        .R(1'b0));
  FDRE \r0_data_reg[99] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[99]),
        .Q(r0_data[99]),
        .R(1'b0));
  FDRE \r0_data_reg[9] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tdata[9]),
        .Q(r0_data[9]),
        .R(1'b0));
  FDRE \r0_keep_reg[0] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tkeep[0]),
        .Q(r0_keep[0]),
        .R(1'b0));
  FDRE \r0_keep_reg[10] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tkeep[10]),
        .Q(r0_keep[10]),
        .R(1'b0));
  FDRE \r0_keep_reg[11] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tkeep[11]),
        .Q(r0_keep[11]),
        .R(1'b0));
  FDRE \r0_keep_reg[12] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tkeep[12]),
        .Q(r0_keep[12]),
        .R(1'b0));
  FDRE \r0_keep_reg[13] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tkeep[13]),
        .Q(r0_keep[13]),
        .R(1'b0));
  FDRE \r0_keep_reg[14] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tkeep[14]),
        .Q(r0_keep[14]),
        .R(1'b0));
  FDRE \r0_keep_reg[15] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tkeep[15]),
        .Q(r0_keep[15]),
        .R(1'b0));
  FDRE \r0_keep_reg[1] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tkeep[1]),
        .Q(r0_keep[1]),
        .R(1'b0));
  FDRE \r0_keep_reg[2] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tkeep[2]),
        .Q(r0_keep[2]),
        .R(1'b0));
  FDRE \r0_keep_reg[3] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tkeep[3]),
        .Q(r0_keep[3]),
        .R(1'b0));
  FDRE \r0_keep_reg[4] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tkeep[4]),
        .Q(r0_keep[4]),
        .R(1'b0));
  FDRE \r0_keep_reg[5] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tkeep[5]),
        .Q(r0_keep[5]),
        .R(1'b0));
  FDRE \r0_keep_reg[6] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tkeep[6]),
        .Q(r0_keep[6]),
        .R(1'b0));
  FDRE \r0_keep_reg[7] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tkeep[7]),
        .Q(r0_keep[7]),
        .R(1'b0));
  FDRE \r0_keep_reg[8] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tkeep[8]),
        .Q(r0_keep[8]),
        .R(1'b0));
  FDRE \r0_keep_reg[9] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tkeep[9]),
        .Q(r0_keep[9]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hF780)) 
    r0_last_i_1
       (.I0(aclken),
        .I1(Q[0]),
        .I2(s_axis_tlast),
        .I3(r0_last_reg_n_0),
        .O(r0_last_i_1_n_0));
  FDRE r0_last_reg
       (.C(aclk),
        .CE(1'b1),
        .D(r0_last_i_1_n_0),
        .Q(r0_last_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFF4FCFCF4F4FCFC)) 
    \r0_reg_sel[0]_i_1 
       (.I0(p_0_in5_in),
        .I1(\r0_reg_sel_reg_n_0_[0] ),
        .I2(SR),
        .I3(m_axis_tready),
        .I4(aclken),
        .I5(Q[1]),
        .O(\r0_reg_sel[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h0000EA2A)) 
    \r0_reg_sel[1]_i_1 
       (.I0(\r0_reg_sel_reg_n_0_[1] ),
        .I1(p_0_in5_in),
        .I2(aclken),
        .I3(\r0_reg_sel_reg_n_0_[0] ),
        .I4(\r0_reg_sel[1]_i_2_n_0 ),
        .O(\r0_reg_sel[1]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'hFF80)) 
    \r0_reg_sel[1]_i_2 
       (.I0(Q[1]),
        .I1(aclken),
        .I2(m_axis_tready),
        .I3(SR),
        .O(\r0_reg_sel[1]_i_2_n_0 ));
  FDRE \r0_reg_sel_reg[0] 
       (.C(aclk),
        .CE(1'b1),
        .D(\r0_reg_sel[0]_i_1_n_0 ),
        .Q(\r0_reg_sel_reg_n_0_[0] ),
        .R(1'b0));
  FDRE \r0_reg_sel_reg[1] 
       (.C(aclk),
        .CE(1'b1),
        .D(\r0_reg_sel[1]_i_1_n_0 ),
        .Q(\r0_reg_sel_reg_n_0_[1] ),
        .R(1'b0));
  FDRE \r0_user_reg[0] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[0]),
        .Q(r0_user[0]),
        .R(1'b0));
  FDRE \r0_user_reg[100] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[100]),
        .Q(r0_user[100]),
        .R(1'b0));
  FDRE \r0_user_reg[101] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[101]),
        .Q(r0_user[101]),
        .R(1'b0));
  FDRE \r0_user_reg[102] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[102]),
        .Q(r0_user[102]),
        .R(1'b0));
  FDRE \r0_user_reg[103] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[103]),
        .Q(r0_user[103]),
        .R(1'b0));
  FDRE \r0_user_reg[104] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[104]),
        .Q(r0_user[104]),
        .R(1'b0));
  FDRE \r0_user_reg[105] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[105]),
        .Q(r0_user[105]),
        .R(1'b0));
  FDRE \r0_user_reg[106] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[106]),
        .Q(r0_user[106]),
        .R(1'b0));
  FDRE \r0_user_reg[107] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[107]),
        .Q(r0_user[107]),
        .R(1'b0));
  FDRE \r0_user_reg[108] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[108]),
        .Q(r0_user[108]),
        .R(1'b0));
  FDRE \r0_user_reg[109] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[109]),
        .Q(r0_user[109]),
        .R(1'b0));
  FDRE \r0_user_reg[10] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[10]),
        .Q(r0_user[10]),
        .R(1'b0));
  FDRE \r0_user_reg[110] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[110]),
        .Q(r0_user[110]),
        .R(1'b0));
  FDRE \r0_user_reg[111] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[111]),
        .Q(r0_user[111]),
        .R(1'b0));
  FDRE \r0_user_reg[112] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[112]),
        .Q(r0_user[112]),
        .R(1'b0));
  FDRE \r0_user_reg[113] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[113]),
        .Q(r0_user[113]),
        .R(1'b0));
  FDRE \r0_user_reg[114] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[114]),
        .Q(r0_user[114]),
        .R(1'b0));
  FDRE \r0_user_reg[115] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[115]),
        .Q(r0_user[115]),
        .R(1'b0));
  FDRE \r0_user_reg[116] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[116]),
        .Q(r0_user[116]),
        .R(1'b0));
  FDRE \r0_user_reg[117] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[117]),
        .Q(r0_user[117]),
        .R(1'b0));
  FDRE \r0_user_reg[118] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[118]),
        .Q(r0_user[118]),
        .R(1'b0));
  FDRE \r0_user_reg[119] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[119]),
        .Q(r0_user[119]),
        .R(1'b0));
  FDRE \r0_user_reg[11] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[11]),
        .Q(r0_user[11]),
        .R(1'b0));
  FDRE \r0_user_reg[120] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[120]),
        .Q(r0_user[120]),
        .R(1'b0));
  FDRE \r0_user_reg[121] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[121]),
        .Q(r0_user[121]),
        .R(1'b0));
  FDRE \r0_user_reg[122] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[122]),
        .Q(r0_user[122]),
        .R(1'b0));
  FDRE \r0_user_reg[123] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[123]),
        .Q(r0_user[123]),
        .R(1'b0));
  FDRE \r0_user_reg[124] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[124]),
        .Q(r0_user[124]),
        .R(1'b0));
  FDRE \r0_user_reg[125] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[125]),
        .Q(r0_user[125]),
        .R(1'b0));
  FDRE \r0_user_reg[126] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[126]),
        .Q(r0_user[126]),
        .R(1'b0));
  FDRE \r0_user_reg[127] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[127]),
        .Q(r0_user[127]),
        .R(1'b0));
  FDRE \r0_user_reg[12] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[12]),
        .Q(r0_user[12]),
        .R(1'b0));
  FDRE \r0_user_reg[13] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[13]),
        .Q(r0_user[13]),
        .R(1'b0));
  FDRE \r0_user_reg[14] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[14]),
        .Q(r0_user[14]),
        .R(1'b0));
  FDRE \r0_user_reg[15] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[15]),
        .Q(r0_user[15]),
        .R(1'b0));
  FDRE \r0_user_reg[16] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[16]),
        .Q(r0_user[16]),
        .R(1'b0));
  FDRE \r0_user_reg[17] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[17]),
        .Q(r0_user[17]),
        .R(1'b0));
  FDRE \r0_user_reg[18] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[18]),
        .Q(r0_user[18]),
        .R(1'b0));
  FDRE \r0_user_reg[19] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[19]),
        .Q(r0_user[19]),
        .R(1'b0));
  FDRE \r0_user_reg[1] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[1]),
        .Q(r0_user[1]),
        .R(1'b0));
  FDRE \r0_user_reg[20] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[20]),
        .Q(r0_user[20]),
        .R(1'b0));
  FDRE \r0_user_reg[21] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[21]),
        .Q(r0_user[21]),
        .R(1'b0));
  FDRE \r0_user_reg[22] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[22]),
        .Q(r0_user[22]),
        .R(1'b0));
  FDRE \r0_user_reg[23] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[23]),
        .Q(r0_user[23]),
        .R(1'b0));
  FDRE \r0_user_reg[24] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[24]),
        .Q(r0_user[24]),
        .R(1'b0));
  FDRE \r0_user_reg[25] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[25]),
        .Q(r0_user[25]),
        .R(1'b0));
  FDRE \r0_user_reg[26] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[26]),
        .Q(r0_user[26]),
        .R(1'b0));
  FDRE \r0_user_reg[27] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[27]),
        .Q(r0_user[27]),
        .R(1'b0));
  FDRE \r0_user_reg[28] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[28]),
        .Q(r0_user[28]),
        .R(1'b0));
  FDRE \r0_user_reg[29] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[29]),
        .Q(r0_user[29]),
        .R(1'b0));
  FDRE \r0_user_reg[2] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[2]),
        .Q(r0_user[2]),
        .R(1'b0));
  FDRE \r0_user_reg[30] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[30]),
        .Q(r0_user[30]),
        .R(1'b0));
  FDRE \r0_user_reg[31] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[31]),
        .Q(r0_user[31]),
        .R(1'b0));
  FDRE \r0_user_reg[32] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[32]),
        .Q(r0_user[32]),
        .R(1'b0));
  FDRE \r0_user_reg[33] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[33]),
        .Q(r0_user[33]),
        .R(1'b0));
  FDRE \r0_user_reg[34] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[34]),
        .Q(r0_user[34]),
        .R(1'b0));
  FDRE \r0_user_reg[35] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[35]),
        .Q(r0_user[35]),
        .R(1'b0));
  FDRE \r0_user_reg[36] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[36]),
        .Q(r0_user[36]),
        .R(1'b0));
  FDRE \r0_user_reg[37] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[37]),
        .Q(r0_user[37]),
        .R(1'b0));
  FDRE \r0_user_reg[38] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[38]),
        .Q(r0_user[38]),
        .R(1'b0));
  FDRE \r0_user_reg[39] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[39]),
        .Q(r0_user[39]),
        .R(1'b0));
  FDRE \r0_user_reg[3] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[3]),
        .Q(r0_user[3]),
        .R(1'b0));
  FDRE \r0_user_reg[40] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[40]),
        .Q(r0_user[40]),
        .R(1'b0));
  FDRE \r0_user_reg[41] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[41]),
        .Q(r0_user[41]),
        .R(1'b0));
  FDRE \r0_user_reg[42] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[42]),
        .Q(r0_user[42]),
        .R(1'b0));
  FDRE \r0_user_reg[43] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[43]),
        .Q(r0_user[43]),
        .R(1'b0));
  FDRE \r0_user_reg[44] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[44]),
        .Q(r0_user[44]),
        .R(1'b0));
  FDRE \r0_user_reg[45] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[45]),
        .Q(r0_user[45]),
        .R(1'b0));
  FDRE \r0_user_reg[46] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[46]),
        .Q(r0_user[46]),
        .R(1'b0));
  FDRE \r0_user_reg[47] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[47]),
        .Q(r0_user[47]),
        .R(1'b0));
  FDRE \r0_user_reg[48] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[48]),
        .Q(r0_user[48]),
        .R(1'b0));
  FDRE \r0_user_reg[49] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[49]),
        .Q(r0_user[49]),
        .R(1'b0));
  FDRE \r0_user_reg[4] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[4]),
        .Q(r0_user[4]),
        .R(1'b0));
  FDRE \r0_user_reg[50] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[50]),
        .Q(r0_user[50]),
        .R(1'b0));
  FDRE \r0_user_reg[51] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[51]),
        .Q(r0_user[51]),
        .R(1'b0));
  FDRE \r0_user_reg[52] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[52]),
        .Q(r0_user[52]),
        .R(1'b0));
  FDRE \r0_user_reg[53] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[53]),
        .Q(r0_user[53]),
        .R(1'b0));
  FDRE \r0_user_reg[54] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[54]),
        .Q(r0_user[54]),
        .R(1'b0));
  FDRE \r0_user_reg[55] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[55]),
        .Q(r0_user[55]),
        .R(1'b0));
  FDRE \r0_user_reg[56] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[56]),
        .Q(r0_user[56]),
        .R(1'b0));
  FDRE \r0_user_reg[57] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[57]),
        .Q(r0_user[57]),
        .R(1'b0));
  FDRE \r0_user_reg[58] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[58]),
        .Q(r0_user[58]),
        .R(1'b0));
  FDRE \r0_user_reg[59] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[59]),
        .Q(r0_user[59]),
        .R(1'b0));
  FDRE \r0_user_reg[5] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[5]),
        .Q(r0_user[5]),
        .R(1'b0));
  FDRE \r0_user_reg[60] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[60]),
        .Q(r0_user[60]),
        .R(1'b0));
  FDRE \r0_user_reg[61] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[61]),
        .Q(r0_user[61]),
        .R(1'b0));
  FDRE \r0_user_reg[62] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[62]),
        .Q(r0_user[62]),
        .R(1'b0));
  FDRE \r0_user_reg[63] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[63]),
        .Q(r0_user[63]),
        .R(1'b0));
  FDRE \r0_user_reg[64] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[64]),
        .Q(r0_user[64]),
        .R(1'b0));
  FDRE \r0_user_reg[65] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[65]),
        .Q(r0_user[65]),
        .R(1'b0));
  FDRE \r0_user_reg[66] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[66]),
        .Q(r0_user[66]),
        .R(1'b0));
  FDRE \r0_user_reg[67] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[67]),
        .Q(r0_user[67]),
        .R(1'b0));
  FDRE \r0_user_reg[68] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[68]),
        .Q(r0_user[68]),
        .R(1'b0));
  FDRE \r0_user_reg[69] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[69]),
        .Q(r0_user[69]),
        .R(1'b0));
  FDRE \r0_user_reg[6] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[6]),
        .Q(r0_user[6]),
        .R(1'b0));
  FDRE \r0_user_reg[70] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[70]),
        .Q(r0_user[70]),
        .R(1'b0));
  FDRE \r0_user_reg[71] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[71]),
        .Q(r0_user[71]),
        .R(1'b0));
  FDRE \r0_user_reg[72] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[72]),
        .Q(r0_user[72]),
        .R(1'b0));
  FDRE \r0_user_reg[73] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[73]),
        .Q(r0_user[73]),
        .R(1'b0));
  FDRE \r0_user_reg[74] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[74]),
        .Q(r0_user[74]),
        .R(1'b0));
  FDRE \r0_user_reg[75] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[75]),
        .Q(r0_user[75]),
        .R(1'b0));
  FDRE \r0_user_reg[76] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[76]),
        .Q(r0_user[76]),
        .R(1'b0));
  FDRE \r0_user_reg[77] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[77]),
        .Q(r0_user[77]),
        .R(1'b0));
  FDRE \r0_user_reg[78] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[78]),
        .Q(r0_user[78]),
        .R(1'b0));
  FDRE \r0_user_reg[79] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[79]),
        .Q(r0_user[79]),
        .R(1'b0));
  FDRE \r0_user_reg[7] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[7]),
        .Q(r0_user[7]),
        .R(1'b0));
  FDRE \r0_user_reg[80] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[80]),
        .Q(r0_user[80]),
        .R(1'b0));
  FDRE \r0_user_reg[81] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[81]),
        .Q(r0_user[81]),
        .R(1'b0));
  FDRE \r0_user_reg[82] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[82]),
        .Q(r0_user[82]),
        .R(1'b0));
  FDRE \r0_user_reg[83] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[83]),
        .Q(r0_user[83]),
        .R(1'b0));
  FDRE \r0_user_reg[84] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[84]),
        .Q(r0_user[84]),
        .R(1'b0));
  FDRE \r0_user_reg[85] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[85]),
        .Q(r0_user[85]),
        .R(1'b0));
  FDRE \r0_user_reg[86] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[86]),
        .Q(r0_user[86]),
        .R(1'b0));
  FDRE \r0_user_reg[87] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[87]),
        .Q(r0_user[87]),
        .R(1'b0));
  FDRE \r0_user_reg[88] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[88]),
        .Q(r0_user[88]),
        .R(1'b0));
  FDRE \r0_user_reg[89] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[89]),
        .Q(r0_user[89]),
        .R(1'b0));
  FDRE \r0_user_reg[8] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[8]),
        .Q(r0_user[8]),
        .R(1'b0));
  FDRE \r0_user_reg[90] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[90]),
        .Q(r0_user[90]),
        .R(1'b0));
  FDRE \r0_user_reg[91] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[91]),
        .Q(r0_user[91]),
        .R(1'b0));
  FDRE \r0_user_reg[92] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[92]),
        .Q(r0_user[92]),
        .R(1'b0));
  FDRE \r0_user_reg[93] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[93]),
        .Q(r0_user[93]),
        .R(1'b0));
  FDRE \r0_user_reg[94] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[94]),
        .Q(r0_user[94]),
        .R(1'b0));
  FDRE \r0_user_reg[95] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[95]),
        .Q(r0_user[95]),
        .R(1'b0));
  FDRE \r0_user_reg[96] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[96]),
        .Q(r0_user[96]),
        .R(1'b0));
  FDRE \r0_user_reg[97] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[97]),
        .Q(r0_user[97]),
        .R(1'b0));
  FDRE \r0_user_reg[98] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[98]),
        .Q(r0_user[98]),
        .R(1'b0));
  FDRE \r0_user_reg[99] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[99]),
        .Q(r0_user[99]),
        .R(1'b0));
  FDRE \r0_user_reg[9] 
       (.C(aclk),
        .CE(r0_last),
        .D(s_axis_tuser[9]),
        .Q(r0_user[9]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFCFCFFFC77FFFFFF)) 
    \state[0]_i_1 
       (.I0(r0_last_reg_n_0),
        .I1(\state_reg_n_0_[2] ),
        .I2(m_axis_tready),
        .I3(Q[0]),
        .I4(s_axis_tvalid),
        .I5(Q[1]),
        .O(state[0]));
  LUT6 #(
    .INIT(64'h03FF038803000300)) 
    \state[1]_i_1 
       (.I0(r0_last_reg_n_0),
        .I1(\state_reg_n_0_[2] ),
        .I2(m_axis_tready),
        .I3(Q[1]),
        .I4(state1),
        .I5(Q[0]),
        .O(state[1]));
  LUT4 #(
    .INIT(16'hEA00)) 
    \state[1]_i_2 
       (.I0(\r0_reg_sel_reg_n_0_[1] ),
        .I1(\r0_reg_sel_reg_n_0_[0] ),
        .I2(p_0_in5_in),
        .I3(s_axis_tvalid),
        .O(state1));
  LUT6 #(
    .INIT(64'h3077300030003000)) 
    \state[2]_i_1 
       (.I0(r0_last_reg_n_0),
        .I1(\state_reg_n_0_[2] ),
        .I2(\state[2]_i_2_n_0 ),
        .I3(Q[1]),
        .I4(state16_out),
        .I5(Q[0]),
        .O(state[2]));
  LUT3 #(
    .INIT(8'hB0)) 
    \state[2]_i_2 
       (.I0(s_axis_tvalid),
        .I1(Q[0]),
        .I2(m_axis_tready),
        .O(\state[2]_i_2_n_0 ));
  LUT4 #(
    .INIT(16'h1500)) 
    \state[2]_i_3 
       (.I0(\r0_reg_sel_reg_n_0_[1] ),
        .I1(p_0_in5_in),
        .I2(\r0_reg_sel_reg_n_0_[0] ),
        .I3(s_axis_tvalid),
        .O(state16_out));
  FDRE \state_reg[0] 
       (.C(aclk),
        .CE(aclken),
        .D(state[0]),
        .Q(Q[0]),
        .R(SR));
  FDRE \state_reg[1] 
       (.C(aclk),
        .CE(aclken),
        .D(state[1]),
        .Q(Q[1]),
        .R(SR));
  FDRE \state_reg[2] 
       (.C(aclk),
        .CE(aclken),
        .D(state[2]),
        .Q(\state_reg_n_0_[2] ),
        .R(SR));
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
