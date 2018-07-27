//Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
//Date        : Fri Jul 27 12:34:51 2018
//Host        : sume running 64-bit Ubuntu 14.04.5 LTS
//Command     : generate_target control_sub.bd
//Design      : control_sub
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "control_sub,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=control_sub,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=54,numReposBlks=34,numNonXlnxBlks=1,numHierBlks=20,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "control_sub.hwdef" *) 
module control_sub
   (M00_AXI_araddr,
    M00_AXI_arprot,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awprot,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_AXI_araddr,
    M01_AXI_arprot,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awprot,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_AXI_araddr,
    M02_AXI_arprot,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awprot,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    M03_AXI_araddr,
    M03_AXI_arprot,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awprot,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_AXI_araddr,
    M04_AXI_arprot,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awprot,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    M05_AXI_araddr,
    M05_AXI_arprot,
    M05_AXI_arready,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awprot,
    M05_AXI_awready,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wready,
    M05_AXI_wstrb,
    M05_AXI_wvalid,
    M06_AXI_araddr,
    M06_AXI_arprot,
    M06_AXI_arready,
    M06_AXI_arvalid,
    M06_AXI_awaddr,
    M06_AXI_awprot,
    M06_AXI_awready,
    M06_AXI_awvalid,
    M06_AXI_bready,
    M06_AXI_bresp,
    M06_AXI_bvalid,
    M06_AXI_rdata,
    M06_AXI_rready,
    M06_AXI_rresp,
    M06_AXI_rvalid,
    M06_AXI_wdata,
    M06_AXI_wready,
    M06_AXI_wstrb,
    M06_AXI_wvalid,
    M07_AXI_araddr,
    M07_AXI_arprot,
    M07_AXI_arready,
    M07_AXI_arvalid,
    M07_AXI_awaddr,
    M07_AXI_awprot,
    M07_AXI_awready,
    M07_AXI_awvalid,
    M07_AXI_bready,
    M07_AXI_bresp,
    M07_AXI_bvalid,
    M07_AXI_rdata,
    M07_AXI_rready,
    M07_AXI_rresp,
    M07_AXI_rvalid,
    M07_AXI_wdata,
    M07_AXI_wready,
    M07_AXI_wstrb,
    M07_AXI_wvalid,
    axi_lite_aclk,
    axi_lite_aresetn,
    axis_datapath_aclk,
    axis_datapath_aresetn,
    iic_fpga_scl_i,
    iic_fpga_scl_o,
    iic_fpga_scl_t,
    iic_fpga_sda_i,
    iic_fpga_sda_o,
    iic_fpga_sda_t,
    iic_reset,
    m_axis_dma_tx_tdata,
    m_axis_dma_tx_tkeep,
    m_axis_dma_tx_tlast,
    m_axis_dma_tx_tready,
    m_axis_dma_tx_tuser,
    m_axis_dma_tx_tvalid,
    pcie_7x_mgt_rxn,
    pcie_7x_mgt_rxp,
    pcie_7x_mgt_txn,
    pcie_7x_mgt_txp,
    s_axis_dma_rx_tdata,
    s_axis_dma_rx_tkeep,
    s_axis_dma_rx_tlast,
    s_axis_dma_rx_tready,
    s_axis_dma_rx_tuser,
    s_axis_dma_rx_tvalid,
    sys_clk,
    sys_reset,
    uart_rxd,
    uart_txd);
  output [11:0]M00_AXI_araddr;
  output [2:0]M00_AXI_arprot;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [11:0]M00_AXI_awaddr;
  output [2:0]M00_AXI_awprot;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  output [11:0]M01_AXI_araddr;
  output [2:0]M01_AXI_arprot;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [11:0]M01_AXI_awaddr;
  output [2:0]M01_AXI_awprot;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output M01_AXI_wvalid;
  output [11:0]M02_AXI_araddr;
  output [2:0]M02_AXI_arprot;
  input M02_AXI_arready;
  output M02_AXI_arvalid;
  output [11:0]M02_AXI_awaddr;
  output [2:0]M02_AXI_awprot;
  input M02_AXI_awready;
  output M02_AXI_awvalid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output M02_AXI_wvalid;
  output [11:0]M03_AXI_araddr;
  output [2:0]M03_AXI_arprot;
  input M03_AXI_arready;
  output M03_AXI_arvalid;
  output [11:0]M03_AXI_awaddr;
  output [2:0]M03_AXI_awprot;
  input M03_AXI_awready;
  output M03_AXI_awvalid;
  output M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input M03_AXI_wready;
  output [3:0]M03_AXI_wstrb;
  output M03_AXI_wvalid;
  output [11:0]M04_AXI_araddr;
  output [2:0]M04_AXI_arprot;
  input M04_AXI_arready;
  output M04_AXI_arvalid;
  output [11:0]M04_AXI_awaddr;
  output [2:0]M04_AXI_awprot;
  input M04_AXI_awready;
  output M04_AXI_awvalid;
  output M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input M04_AXI_wready;
  output [3:0]M04_AXI_wstrb;
  output M04_AXI_wvalid;
  output [11:0]M05_AXI_araddr;
  output [2:0]M05_AXI_arprot;
  input M05_AXI_arready;
  output M05_AXI_arvalid;
  output [11:0]M05_AXI_awaddr;
  output [2:0]M05_AXI_awprot;
  input M05_AXI_awready;
  output M05_AXI_awvalid;
  output M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  output M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  input M05_AXI_wready;
  output [3:0]M05_AXI_wstrb;
  output M05_AXI_wvalid;
  output [11:0]M06_AXI_araddr;
  output [2:0]M06_AXI_arprot;
  input M06_AXI_arready;
  output M06_AXI_arvalid;
  output [11:0]M06_AXI_awaddr;
  output [2:0]M06_AXI_awprot;
  input M06_AXI_awready;
  output M06_AXI_awvalid;
  output M06_AXI_bready;
  input [1:0]M06_AXI_bresp;
  input M06_AXI_bvalid;
  input [31:0]M06_AXI_rdata;
  output M06_AXI_rready;
  input [1:0]M06_AXI_rresp;
  input M06_AXI_rvalid;
  output [31:0]M06_AXI_wdata;
  input M06_AXI_wready;
  output [3:0]M06_AXI_wstrb;
  output M06_AXI_wvalid;
  output [11:0]M07_AXI_araddr;
  output [2:0]M07_AXI_arprot;
  input M07_AXI_arready;
  output M07_AXI_arvalid;
  output [11:0]M07_AXI_awaddr;
  output [2:0]M07_AXI_awprot;
  input M07_AXI_awready;
  output M07_AXI_awvalid;
  output M07_AXI_bready;
  input [1:0]M07_AXI_bresp;
  input M07_AXI_bvalid;
  input [31:0]M07_AXI_rdata;
  output M07_AXI_rready;
  input [1:0]M07_AXI_rresp;
  input M07_AXI_rvalid;
  output [31:0]M07_AXI_wdata;
  input M07_AXI_wready;
  output [3:0]M07_AXI_wstrb;
  output M07_AXI_wvalid;
  input axi_lite_aclk;
  input axi_lite_aresetn;
  input axis_datapath_aclk;
  input axis_datapath_aresetn;
  input iic_fpga_scl_i;
  output iic_fpga_scl_o;
  output iic_fpga_scl_t;
  input iic_fpga_sda_i;
  output iic_fpga_sda_o;
  output iic_fpga_sda_t;
  output [1:0]iic_reset;
  output [255:0]m_axis_dma_tx_tdata;
  output [31:0]m_axis_dma_tx_tkeep;
  output m_axis_dma_tx_tlast;
  input m_axis_dma_tx_tready;
  output [255:0]m_axis_dma_tx_tuser;
  output m_axis_dma_tx_tvalid;
  input [7:0]pcie_7x_mgt_rxn;
  input [7:0]pcie_7x_mgt_rxp;
  output [7:0]pcie_7x_mgt_txn;
  output [7:0]pcie_7x_mgt_txp;
  input [255:0]s_axis_dma_rx_tdata;
  input [31:0]s_axis_dma_rx_tkeep;
  input s_axis_dma_rx_tlast;
  output s_axis_dma_rx_tready;
  input [255:0]s_axis_dma_rx_tuser;
  input s_axis_dma_rx_tvalid;
  input sys_clk;
  input sys_reset;
  input uart_rxd;
  output uart_txd;

  wire axi_lite_aclk_1;
  wire axi_lite_aresetn_1;
  wire axis_datapath_aclk_1;
  wire axis_datapath_aresetn_1;
  wire [11:0]dma_sub_M00_AXI_ARADDR;
  wire [2:0]dma_sub_M00_AXI_ARPROT;
  wire dma_sub_M00_AXI_ARREADY;
  wire dma_sub_M00_AXI_ARVALID;
  wire [11:0]dma_sub_M00_AXI_AWADDR;
  wire [2:0]dma_sub_M00_AXI_AWPROT;
  wire dma_sub_M00_AXI_AWREADY;
  wire dma_sub_M00_AXI_AWVALID;
  wire dma_sub_M00_AXI_BREADY;
  wire [1:0]dma_sub_M00_AXI_BRESP;
  wire dma_sub_M00_AXI_BVALID;
  wire [31:0]dma_sub_M00_AXI_RDATA;
  wire dma_sub_M00_AXI_RREADY;
  wire [1:0]dma_sub_M00_AXI_RRESP;
  wire dma_sub_M00_AXI_RVALID;
  wire [31:0]dma_sub_M00_AXI_WDATA;
  wire dma_sub_M00_AXI_WREADY;
  wire [3:0]dma_sub_M00_AXI_WSTRB;
  wire dma_sub_M00_AXI_WVALID;
  wire [11:0]dma_sub_M01_AXI_ARADDR;
  wire [2:0]dma_sub_M01_AXI_ARPROT;
  wire dma_sub_M01_AXI_ARREADY;
  wire dma_sub_M01_AXI_ARVALID;
  wire [11:0]dma_sub_M01_AXI_AWADDR;
  wire [2:0]dma_sub_M01_AXI_AWPROT;
  wire dma_sub_M01_AXI_AWREADY;
  wire dma_sub_M01_AXI_AWVALID;
  wire dma_sub_M01_AXI_BREADY;
  wire [1:0]dma_sub_M01_AXI_BRESP;
  wire dma_sub_M01_AXI_BVALID;
  wire [31:0]dma_sub_M01_AXI_RDATA;
  wire dma_sub_M01_AXI_RREADY;
  wire [1:0]dma_sub_M01_AXI_RRESP;
  wire dma_sub_M01_AXI_RVALID;
  wire [31:0]dma_sub_M01_AXI_WDATA;
  wire dma_sub_M01_AXI_WREADY;
  wire [3:0]dma_sub_M01_AXI_WSTRB;
  wire dma_sub_M01_AXI_WVALID;
  wire [11:0]dma_sub_M02_AXI_ARADDR;
  wire [2:0]dma_sub_M02_AXI_ARPROT;
  wire dma_sub_M02_AXI_ARREADY;
  wire dma_sub_M02_AXI_ARVALID;
  wire [11:0]dma_sub_M02_AXI_AWADDR;
  wire [2:0]dma_sub_M02_AXI_AWPROT;
  wire dma_sub_M02_AXI_AWREADY;
  wire dma_sub_M02_AXI_AWVALID;
  wire dma_sub_M02_AXI_BREADY;
  wire [1:0]dma_sub_M02_AXI_BRESP;
  wire dma_sub_M02_AXI_BVALID;
  wire [31:0]dma_sub_M02_AXI_RDATA;
  wire dma_sub_M02_AXI_RREADY;
  wire [1:0]dma_sub_M02_AXI_RRESP;
  wire dma_sub_M02_AXI_RVALID;
  wire [31:0]dma_sub_M02_AXI_WDATA;
  wire dma_sub_M02_AXI_WREADY;
  wire [3:0]dma_sub_M02_AXI_WSTRB;
  wire dma_sub_M02_AXI_WVALID;
  wire [11:0]dma_sub_M03_AXI_ARADDR;
  wire [2:0]dma_sub_M03_AXI_ARPROT;
  wire dma_sub_M03_AXI_ARREADY;
  wire dma_sub_M03_AXI_ARVALID;
  wire [11:0]dma_sub_M03_AXI_AWADDR;
  wire [2:0]dma_sub_M03_AXI_AWPROT;
  wire dma_sub_M03_AXI_AWREADY;
  wire dma_sub_M03_AXI_AWVALID;
  wire dma_sub_M03_AXI_BREADY;
  wire [1:0]dma_sub_M03_AXI_BRESP;
  wire dma_sub_M03_AXI_BVALID;
  wire [31:0]dma_sub_M03_AXI_RDATA;
  wire dma_sub_M03_AXI_RREADY;
  wire [1:0]dma_sub_M03_AXI_RRESP;
  wire dma_sub_M03_AXI_RVALID;
  wire [31:0]dma_sub_M03_AXI_WDATA;
  wire dma_sub_M03_AXI_WREADY;
  wire [3:0]dma_sub_M03_AXI_WSTRB;
  wire dma_sub_M03_AXI_WVALID;
  wire [11:0]dma_sub_M04_AXI_ARADDR;
  wire [2:0]dma_sub_M04_AXI_ARPROT;
  wire dma_sub_M04_AXI_ARREADY;
  wire dma_sub_M04_AXI_ARVALID;
  wire [11:0]dma_sub_M04_AXI_AWADDR;
  wire [2:0]dma_sub_M04_AXI_AWPROT;
  wire dma_sub_M04_AXI_AWREADY;
  wire dma_sub_M04_AXI_AWVALID;
  wire dma_sub_M04_AXI_BREADY;
  wire [1:0]dma_sub_M04_AXI_BRESP;
  wire dma_sub_M04_AXI_BVALID;
  wire [31:0]dma_sub_M04_AXI_RDATA;
  wire dma_sub_M04_AXI_RREADY;
  wire [1:0]dma_sub_M04_AXI_RRESP;
  wire dma_sub_M04_AXI_RVALID;
  wire [31:0]dma_sub_M04_AXI_WDATA;
  wire dma_sub_M04_AXI_WREADY;
  wire [3:0]dma_sub_M04_AXI_WSTRB;
  wire dma_sub_M04_AXI_WVALID;
  wire [11:0]dma_sub_M05_AXI_ARADDR;
  wire [2:0]dma_sub_M05_AXI_ARPROT;
  wire dma_sub_M05_AXI_ARREADY;
  wire dma_sub_M05_AXI_ARVALID;
  wire [11:0]dma_sub_M05_AXI_AWADDR;
  wire [2:0]dma_sub_M05_AXI_AWPROT;
  wire dma_sub_M05_AXI_AWREADY;
  wire dma_sub_M05_AXI_AWVALID;
  wire dma_sub_M05_AXI_BREADY;
  wire [1:0]dma_sub_M05_AXI_BRESP;
  wire dma_sub_M05_AXI_BVALID;
  wire [31:0]dma_sub_M05_AXI_RDATA;
  wire dma_sub_M05_AXI_RREADY;
  wire [1:0]dma_sub_M05_AXI_RRESP;
  wire dma_sub_M05_AXI_RVALID;
  wire [31:0]dma_sub_M05_AXI_WDATA;
  wire dma_sub_M05_AXI_WREADY;
  wire [3:0]dma_sub_M05_AXI_WSTRB;
  wire dma_sub_M05_AXI_WVALID;
  wire [11:0]dma_sub_M06_AXI_ARADDR;
  wire [2:0]dma_sub_M06_AXI_ARPROT;
  wire dma_sub_M06_AXI_ARREADY;
  wire dma_sub_M06_AXI_ARVALID;
  wire [11:0]dma_sub_M06_AXI_AWADDR;
  wire [2:0]dma_sub_M06_AXI_AWPROT;
  wire dma_sub_M06_AXI_AWREADY;
  wire dma_sub_M06_AXI_AWVALID;
  wire dma_sub_M06_AXI_BREADY;
  wire [1:0]dma_sub_M06_AXI_BRESP;
  wire dma_sub_M06_AXI_BVALID;
  wire [31:0]dma_sub_M06_AXI_RDATA;
  wire dma_sub_M06_AXI_RREADY;
  wire [1:0]dma_sub_M06_AXI_RRESP;
  wire dma_sub_M06_AXI_RVALID;
  wire [31:0]dma_sub_M06_AXI_WDATA;
  wire dma_sub_M06_AXI_WREADY;
  wire [3:0]dma_sub_M06_AXI_WSTRB;
  wire dma_sub_M06_AXI_WVALID;
  wire [11:0]dma_sub_M07_AXI_ARADDR;
  wire [2:0]dma_sub_M07_AXI_ARPROT;
  wire dma_sub_M07_AXI_ARREADY;
  wire dma_sub_M07_AXI_ARVALID;
  wire [11:0]dma_sub_M07_AXI_AWADDR;
  wire [2:0]dma_sub_M07_AXI_AWPROT;
  wire dma_sub_M07_AXI_AWREADY;
  wire dma_sub_M07_AXI_AWVALID;
  wire dma_sub_M07_AXI_BREADY;
  wire [1:0]dma_sub_M07_AXI_BRESP;
  wire dma_sub_M07_AXI_BVALID;
  wire [31:0]dma_sub_M07_AXI_RDATA;
  wire dma_sub_M07_AXI_RREADY;
  wire [1:0]dma_sub_M07_AXI_RRESP;
  wire dma_sub_M07_AXI_RVALID;
  wire [31:0]dma_sub_M07_AXI_WDATA;
  wire dma_sub_M07_AXI_WREADY;
  wire [3:0]dma_sub_M07_AXI_WSTRB;
  wire dma_sub_M07_AXI_WVALID;
  wire [255:0]dma_sub_m_axis_dma_tx_TDATA;
  wire [31:0]dma_sub_m_axis_dma_tx_TKEEP;
  wire dma_sub_m_axis_dma_tx_TLAST;
  wire dma_sub_m_axis_dma_tx_TREADY;
  wire [255:0]dma_sub_m_axis_dma_tx_TUSER;
  wire dma_sub_m_axis_dma_tx_TVALID;
  wire [7:0]dma_sub_pcie_7x_mgt_rxn;
  wire [7:0]dma_sub_pcie_7x_mgt_rxp;
  wire [7:0]dma_sub_pcie_7x_mgt_txn;
  wire [7:0]dma_sub_pcie_7x_mgt_txp;
  wire nf_mbsys_iic_fpga_SCL_I;
  wire nf_mbsys_iic_fpga_SCL_O;
  wire nf_mbsys_iic_fpga_SCL_T;
  wire nf_mbsys_iic_fpga_SDA_I;
  wire nf_mbsys_iic_fpga_SDA_O;
  wire nf_mbsys_iic_fpga_SDA_T;
  wire [1:0]nf_mbsys_iic_reset;
  wire nf_mbsys_uart_RxD;
  wire nf_mbsys_uart_TxD;
  wire [255:0]s_axis_dma_rx_1_TDATA;
  wire [31:0]s_axis_dma_rx_1_TKEEP;
  wire s_axis_dma_rx_1_TLAST;
  wire s_axis_dma_rx_1_TREADY;
  wire [255:0]s_axis_dma_rx_1_TUSER;
  wire s_axis_dma_rx_1_TVALID;
  wire sys_clk_1;
  wire sys_reset_1;

  assign M00_AXI_araddr[11:0] = dma_sub_M00_AXI_ARADDR;
  assign M00_AXI_arprot[2:0] = dma_sub_M00_AXI_ARPROT;
  assign M00_AXI_arvalid = dma_sub_M00_AXI_ARVALID;
  assign M00_AXI_awaddr[11:0] = dma_sub_M00_AXI_AWADDR;
  assign M00_AXI_awprot[2:0] = dma_sub_M00_AXI_AWPROT;
  assign M00_AXI_awvalid = dma_sub_M00_AXI_AWVALID;
  assign M00_AXI_bready = dma_sub_M00_AXI_BREADY;
  assign M00_AXI_rready = dma_sub_M00_AXI_RREADY;
  assign M00_AXI_wdata[31:0] = dma_sub_M00_AXI_WDATA;
  assign M00_AXI_wstrb[3:0] = dma_sub_M00_AXI_WSTRB;
  assign M00_AXI_wvalid = dma_sub_M00_AXI_WVALID;
  assign M01_AXI_araddr[11:0] = dma_sub_M01_AXI_ARADDR;
  assign M01_AXI_arprot[2:0] = dma_sub_M01_AXI_ARPROT;
  assign M01_AXI_arvalid = dma_sub_M01_AXI_ARVALID;
  assign M01_AXI_awaddr[11:0] = dma_sub_M01_AXI_AWADDR;
  assign M01_AXI_awprot[2:0] = dma_sub_M01_AXI_AWPROT;
  assign M01_AXI_awvalid = dma_sub_M01_AXI_AWVALID;
  assign M01_AXI_bready = dma_sub_M01_AXI_BREADY;
  assign M01_AXI_rready = dma_sub_M01_AXI_RREADY;
  assign M01_AXI_wdata[31:0] = dma_sub_M01_AXI_WDATA;
  assign M01_AXI_wstrb[3:0] = dma_sub_M01_AXI_WSTRB;
  assign M01_AXI_wvalid = dma_sub_M01_AXI_WVALID;
  assign M02_AXI_araddr[11:0] = dma_sub_M02_AXI_ARADDR;
  assign M02_AXI_arprot[2:0] = dma_sub_M02_AXI_ARPROT;
  assign M02_AXI_arvalid = dma_sub_M02_AXI_ARVALID;
  assign M02_AXI_awaddr[11:0] = dma_sub_M02_AXI_AWADDR;
  assign M02_AXI_awprot[2:0] = dma_sub_M02_AXI_AWPROT;
  assign M02_AXI_awvalid = dma_sub_M02_AXI_AWVALID;
  assign M02_AXI_bready = dma_sub_M02_AXI_BREADY;
  assign M02_AXI_rready = dma_sub_M02_AXI_RREADY;
  assign M02_AXI_wdata[31:0] = dma_sub_M02_AXI_WDATA;
  assign M02_AXI_wstrb[3:0] = dma_sub_M02_AXI_WSTRB;
  assign M02_AXI_wvalid = dma_sub_M02_AXI_WVALID;
  assign M03_AXI_araddr[11:0] = dma_sub_M03_AXI_ARADDR;
  assign M03_AXI_arprot[2:0] = dma_sub_M03_AXI_ARPROT;
  assign M03_AXI_arvalid = dma_sub_M03_AXI_ARVALID;
  assign M03_AXI_awaddr[11:0] = dma_sub_M03_AXI_AWADDR;
  assign M03_AXI_awprot[2:0] = dma_sub_M03_AXI_AWPROT;
  assign M03_AXI_awvalid = dma_sub_M03_AXI_AWVALID;
  assign M03_AXI_bready = dma_sub_M03_AXI_BREADY;
  assign M03_AXI_rready = dma_sub_M03_AXI_RREADY;
  assign M03_AXI_wdata[31:0] = dma_sub_M03_AXI_WDATA;
  assign M03_AXI_wstrb[3:0] = dma_sub_M03_AXI_WSTRB;
  assign M03_AXI_wvalid = dma_sub_M03_AXI_WVALID;
  assign M04_AXI_araddr[11:0] = dma_sub_M04_AXI_ARADDR;
  assign M04_AXI_arprot[2:0] = dma_sub_M04_AXI_ARPROT;
  assign M04_AXI_arvalid = dma_sub_M04_AXI_ARVALID;
  assign M04_AXI_awaddr[11:0] = dma_sub_M04_AXI_AWADDR;
  assign M04_AXI_awprot[2:0] = dma_sub_M04_AXI_AWPROT;
  assign M04_AXI_awvalid = dma_sub_M04_AXI_AWVALID;
  assign M04_AXI_bready = dma_sub_M04_AXI_BREADY;
  assign M04_AXI_rready = dma_sub_M04_AXI_RREADY;
  assign M04_AXI_wdata[31:0] = dma_sub_M04_AXI_WDATA;
  assign M04_AXI_wstrb[3:0] = dma_sub_M04_AXI_WSTRB;
  assign M04_AXI_wvalid = dma_sub_M04_AXI_WVALID;
  assign M05_AXI_araddr[11:0] = dma_sub_M05_AXI_ARADDR;
  assign M05_AXI_arprot[2:0] = dma_sub_M05_AXI_ARPROT;
  assign M05_AXI_arvalid = dma_sub_M05_AXI_ARVALID;
  assign M05_AXI_awaddr[11:0] = dma_sub_M05_AXI_AWADDR;
  assign M05_AXI_awprot[2:0] = dma_sub_M05_AXI_AWPROT;
  assign M05_AXI_awvalid = dma_sub_M05_AXI_AWVALID;
  assign M05_AXI_bready = dma_sub_M05_AXI_BREADY;
  assign M05_AXI_rready = dma_sub_M05_AXI_RREADY;
  assign M05_AXI_wdata[31:0] = dma_sub_M05_AXI_WDATA;
  assign M05_AXI_wstrb[3:0] = dma_sub_M05_AXI_WSTRB;
  assign M05_AXI_wvalid = dma_sub_M05_AXI_WVALID;
  assign M06_AXI_araddr[11:0] = dma_sub_M06_AXI_ARADDR;
  assign M06_AXI_arprot[2:0] = dma_sub_M06_AXI_ARPROT;
  assign M06_AXI_arvalid = dma_sub_M06_AXI_ARVALID;
  assign M06_AXI_awaddr[11:0] = dma_sub_M06_AXI_AWADDR;
  assign M06_AXI_awprot[2:0] = dma_sub_M06_AXI_AWPROT;
  assign M06_AXI_awvalid = dma_sub_M06_AXI_AWVALID;
  assign M06_AXI_bready = dma_sub_M06_AXI_BREADY;
  assign M06_AXI_rready = dma_sub_M06_AXI_RREADY;
  assign M06_AXI_wdata[31:0] = dma_sub_M06_AXI_WDATA;
  assign M06_AXI_wstrb[3:0] = dma_sub_M06_AXI_WSTRB;
  assign M06_AXI_wvalid = dma_sub_M06_AXI_WVALID;
  assign M07_AXI_araddr[11:0] = dma_sub_M07_AXI_ARADDR;
  assign M07_AXI_arprot[2:0] = dma_sub_M07_AXI_ARPROT;
  assign M07_AXI_arvalid = dma_sub_M07_AXI_ARVALID;
  assign M07_AXI_awaddr[11:0] = dma_sub_M07_AXI_AWADDR;
  assign M07_AXI_awprot[2:0] = dma_sub_M07_AXI_AWPROT;
  assign M07_AXI_awvalid = dma_sub_M07_AXI_AWVALID;
  assign M07_AXI_bready = dma_sub_M07_AXI_BREADY;
  assign M07_AXI_rready = dma_sub_M07_AXI_RREADY;
  assign M07_AXI_wdata[31:0] = dma_sub_M07_AXI_WDATA;
  assign M07_AXI_wstrb[3:0] = dma_sub_M07_AXI_WSTRB;
  assign M07_AXI_wvalid = dma_sub_M07_AXI_WVALID;
  assign axi_lite_aclk_1 = axi_lite_aclk;
  assign axi_lite_aresetn_1 = axi_lite_aresetn;
  assign axis_datapath_aclk_1 = axis_datapath_aclk;
  assign axis_datapath_aresetn_1 = axis_datapath_aresetn;
  assign dma_sub_M00_AXI_ARREADY = M00_AXI_arready;
  assign dma_sub_M00_AXI_AWREADY = M00_AXI_awready;
  assign dma_sub_M00_AXI_BRESP = M00_AXI_bresp[1:0];
  assign dma_sub_M00_AXI_BVALID = M00_AXI_bvalid;
  assign dma_sub_M00_AXI_RDATA = M00_AXI_rdata[31:0];
  assign dma_sub_M00_AXI_RRESP = M00_AXI_rresp[1:0];
  assign dma_sub_M00_AXI_RVALID = M00_AXI_rvalid;
  assign dma_sub_M00_AXI_WREADY = M00_AXI_wready;
  assign dma_sub_M01_AXI_ARREADY = M01_AXI_arready;
  assign dma_sub_M01_AXI_AWREADY = M01_AXI_awready;
  assign dma_sub_M01_AXI_BRESP = M01_AXI_bresp[1:0];
  assign dma_sub_M01_AXI_BVALID = M01_AXI_bvalid;
  assign dma_sub_M01_AXI_RDATA = M01_AXI_rdata[31:0];
  assign dma_sub_M01_AXI_RRESP = M01_AXI_rresp[1:0];
  assign dma_sub_M01_AXI_RVALID = M01_AXI_rvalid;
  assign dma_sub_M01_AXI_WREADY = M01_AXI_wready;
  assign dma_sub_M02_AXI_ARREADY = M02_AXI_arready;
  assign dma_sub_M02_AXI_AWREADY = M02_AXI_awready;
  assign dma_sub_M02_AXI_BRESP = M02_AXI_bresp[1:0];
  assign dma_sub_M02_AXI_BVALID = M02_AXI_bvalid;
  assign dma_sub_M02_AXI_RDATA = M02_AXI_rdata[31:0];
  assign dma_sub_M02_AXI_RRESP = M02_AXI_rresp[1:0];
  assign dma_sub_M02_AXI_RVALID = M02_AXI_rvalid;
  assign dma_sub_M02_AXI_WREADY = M02_AXI_wready;
  assign dma_sub_M03_AXI_ARREADY = M03_AXI_arready;
  assign dma_sub_M03_AXI_AWREADY = M03_AXI_awready;
  assign dma_sub_M03_AXI_BRESP = M03_AXI_bresp[1:0];
  assign dma_sub_M03_AXI_BVALID = M03_AXI_bvalid;
  assign dma_sub_M03_AXI_RDATA = M03_AXI_rdata[31:0];
  assign dma_sub_M03_AXI_RRESP = M03_AXI_rresp[1:0];
  assign dma_sub_M03_AXI_RVALID = M03_AXI_rvalid;
  assign dma_sub_M03_AXI_WREADY = M03_AXI_wready;
  assign dma_sub_M04_AXI_ARREADY = M04_AXI_arready;
  assign dma_sub_M04_AXI_AWREADY = M04_AXI_awready;
  assign dma_sub_M04_AXI_BRESP = M04_AXI_bresp[1:0];
  assign dma_sub_M04_AXI_BVALID = M04_AXI_bvalid;
  assign dma_sub_M04_AXI_RDATA = M04_AXI_rdata[31:0];
  assign dma_sub_M04_AXI_RRESP = M04_AXI_rresp[1:0];
  assign dma_sub_M04_AXI_RVALID = M04_AXI_rvalid;
  assign dma_sub_M04_AXI_WREADY = M04_AXI_wready;
  assign dma_sub_M05_AXI_ARREADY = M05_AXI_arready;
  assign dma_sub_M05_AXI_AWREADY = M05_AXI_awready;
  assign dma_sub_M05_AXI_BRESP = M05_AXI_bresp[1:0];
  assign dma_sub_M05_AXI_BVALID = M05_AXI_bvalid;
  assign dma_sub_M05_AXI_RDATA = M05_AXI_rdata[31:0];
  assign dma_sub_M05_AXI_RRESP = M05_AXI_rresp[1:0];
  assign dma_sub_M05_AXI_RVALID = M05_AXI_rvalid;
  assign dma_sub_M05_AXI_WREADY = M05_AXI_wready;
  assign dma_sub_M06_AXI_ARREADY = M06_AXI_arready;
  assign dma_sub_M06_AXI_AWREADY = M06_AXI_awready;
  assign dma_sub_M06_AXI_BRESP = M06_AXI_bresp[1:0];
  assign dma_sub_M06_AXI_BVALID = M06_AXI_bvalid;
  assign dma_sub_M06_AXI_RDATA = M06_AXI_rdata[31:0];
  assign dma_sub_M06_AXI_RRESP = M06_AXI_rresp[1:0];
  assign dma_sub_M06_AXI_RVALID = M06_AXI_rvalid;
  assign dma_sub_M06_AXI_WREADY = M06_AXI_wready;
  assign dma_sub_M07_AXI_ARREADY = M07_AXI_arready;
  assign dma_sub_M07_AXI_AWREADY = M07_AXI_awready;
  assign dma_sub_M07_AXI_BRESP = M07_AXI_bresp[1:0];
  assign dma_sub_M07_AXI_BVALID = M07_AXI_bvalid;
  assign dma_sub_M07_AXI_RDATA = M07_AXI_rdata[31:0];
  assign dma_sub_M07_AXI_RRESP = M07_AXI_rresp[1:0];
  assign dma_sub_M07_AXI_RVALID = M07_AXI_rvalid;
  assign dma_sub_M07_AXI_WREADY = M07_AXI_wready;
  assign dma_sub_m_axis_dma_tx_TREADY = m_axis_dma_tx_tready;
  assign dma_sub_pcie_7x_mgt_rxn = pcie_7x_mgt_rxn[7:0];
  assign dma_sub_pcie_7x_mgt_rxp = pcie_7x_mgt_rxp[7:0];
  assign iic_fpga_scl_o = nf_mbsys_iic_fpga_SCL_O;
  assign iic_fpga_scl_t = nf_mbsys_iic_fpga_SCL_T;
  assign iic_fpga_sda_o = nf_mbsys_iic_fpga_SDA_O;
  assign iic_fpga_sda_t = nf_mbsys_iic_fpga_SDA_T;
  assign iic_reset[1:0] = nf_mbsys_iic_reset;
  assign m_axis_dma_tx_tdata[255:0] = dma_sub_m_axis_dma_tx_TDATA;
  assign m_axis_dma_tx_tkeep[31:0] = dma_sub_m_axis_dma_tx_TKEEP;
  assign m_axis_dma_tx_tlast = dma_sub_m_axis_dma_tx_TLAST;
  assign m_axis_dma_tx_tuser[255:0] = dma_sub_m_axis_dma_tx_TUSER;
  assign m_axis_dma_tx_tvalid = dma_sub_m_axis_dma_tx_TVALID;
  assign nf_mbsys_iic_fpga_SCL_I = iic_fpga_scl_i;
  assign nf_mbsys_iic_fpga_SDA_I = iic_fpga_sda_i;
  assign nf_mbsys_uart_RxD = uart_rxd;
  assign pcie_7x_mgt_txn[7:0] = dma_sub_pcie_7x_mgt_txn;
  assign pcie_7x_mgt_txp[7:0] = dma_sub_pcie_7x_mgt_txp;
  assign s_axis_dma_rx_1_TDATA = s_axis_dma_rx_tdata[255:0];
  assign s_axis_dma_rx_1_TKEEP = s_axis_dma_rx_tkeep[31:0];
  assign s_axis_dma_rx_1_TLAST = s_axis_dma_rx_tlast;
  assign s_axis_dma_rx_1_TUSER = s_axis_dma_rx_tuser[255:0];
  assign s_axis_dma_rx_1_TVALID = s_axis_dma_rx_tvalid;
  assign s_axis_dma_rx_tready = s_axis_dma_rx_1_TREADY;
  assign sys_clk_1 = sys_clk;
  assign sys_reset_1 = sys_reset;
  assign uart_txd = nf_mbsys_uart_TxD;
  dma_sub_imp_ETY9Q3 dma_sub
       (.M00_ACLK(axis_datapath_aclk_1),
        .M00_ARESETN(axis_datapath_aresetn_1),
        .M00_AXI_araddr(dma_sub_M00_AXI_ARADDR),
        .M00_AXI_arprot(dma_sub_M00_AXI_ARPROT),
        .M00_AXI_arready(dma_sub_M00_AXI_ARREADY),
        .M00_AXI_arvalid(dma_sub_M00_AXI_ARVALID),
        .M00_AXI_awaddr(dma_sub_M00_AXI_AWADDR),
        .M00_AXI_awprot(dma_sub_M00_AXI_AWPROT),
        .M00_AXI_awready(dma_sub_M00_AXI_AWREADY),
        .M00_AXI_awvalid(dma_sub_M00_AXI_AWVALID),
        .M00_AXI_bready(dma_sub_M00_AXI_BREADY),
        .M00_AXI_bresp(dma_sub_M00_AXI_BRESP),
        .M00_AXI_bvalid(dma_sub_M00_AXI_BVALID),
        .M00_AXI_rdata(dma_sub_M00_AXI_RDATA),
        .M00_AXI_rready(dma_sub_M00_AXI_RREADY),
        .M00_AXI_rresp(dma_sub_M00_AXI_RRESP),
        .M00_AXI_rvalid(dma_sub_M00_AXI_RVALID),
        .M00_AXI_wdata(dma_sub_M00_AXI_WDATA),
        .M00_AXI_wready(dma_sub_M00_AXI_WREADY),
        .M00_AXI_wstrb(dma_sub_M00_AXI_WSTRB),
        .M00_AXI_wvalid(dma_sub_M00_AXI_WVALID),
        .M01_ACLK(axis_datapath_aclk_1),
        .M01_ARESETN(axis_datapath_aresetn_1),
        .M01_AXI_araddr(dma_sub_M01_AXI_ARADDR),
        .M01_AXI_arprot(dma_sub_M01_AXI_ARPROT),
        .M01_AXI_arready(dma_sub_M01_AXI_ARREADY),
        .M01_AXI_arvalid(dma_sub_M01_AXI_ARVALID),
        .M01_AXI_awaddr(dma_sub_M01_AXI_AWADDR),
        .M01_AXI_awprot(dma_sub_M01_AXI_AWPROT),
        .M01_AXI_awready(dma_sub_M01_AXI_AWREADY),
        .M01_AXI_awvalid(dma_sub_M01_AXI_AWVALID),
        .M01_AXI_bready(dma_sub_M01_AXI_BREADY),
        .M01_AXI_bresp(dma_sub_M01_AXI_BRESP),
        .M01_AXI_bvalid(dma_sub_M01_AXI_BVALID),
        .M01_AXI_rdata(dma_sub_M01_AXI_RDATA),
        .M01_AXI_rready(dma_sub_M01_AXI_RREADY),
        .M01_AXI_rresp(dma_sub_M01_AXI_RRESP),
        .M01_AXI_rvalid(dma_sub_M01_AXI_RVALID),
        .M01_AXI_wdata(dma_sub_M01_AXI_WDATA),
        .M01_AXI_wready(dma_sub_M01_AXI_WREADY),
        .M01_AXI_wstrb(dma_sub_M01_AXI_WSTRB),
        .M01_AXI_wvalid(dma_sub_M01_AXI_WVALID),
        .M02_ACLK(axis_datapath_aclk_1),
        .M02_ARESETN(axis_datapath_aresetn_1),
        .M02_AXI_araddr(dma_sub_M02_AXI_ARADDR),
        .M02_AXI_arprot(dma_sub_M02_AXI_ARPROT),
        .M02_AXI_arready(dma_sub_M02_AXI_ARREADY),
        .M02_AXI_arvalid(dma_sub_M02_AXI_ARVALID),
        .M02_AXI_awaddr(dma_sub_M02_AXI_AWADDR),
        .M02_AXI_awprot(dma_sub_M02_AXI_AWPROT),
        .M02_AXI_awready(dma_sub_M02_AXI_AWREADY),
        .M02_AXI_awvalid(dma_sub_M02_AXI_AWVALID),
        .M02_AXI_bready(dma_sub_M02_AXI_BREADY),
        .M02_AXI_bresp(dma_sub_M02_AXI_BRESP),
        .M02_AXI_bvalid(dma_sub_M02_AXI_BVALID),
        .M02_AXI_rdata(dma_sub_M02_AXI_RDATA),
        .M02_AXI_rready(dma_sub_M02_AXI_RREADY),
        .M02_AXI_rresp(dma_sub_M02_AXI_RRESP),
        .M02_AXI_rvalid(dma_sub_M02_AXI_RVALID),
        .M02_AXI_wdata(dma_sub_M02_AXI_WDATA),
        .M02_AXI_wready(dma_sub_M02_AXI_WREADY),
        .M02_AXI_wstrb(dma_sub_M02_AXI_WSTRB),
        .M02_AXI_wvalid(dma_sub_M02_AXI_WVALID),
        .M03_ACLK(axis_datapath_aclk_1),
        .M03_ARESETN(axis_datapath_aresetn_1),
        .M03_AXI_araddr(dma_sub_M03_AXI_ARADDR),
        .M03_AXI_arprot(dma_sub_M03_AXI_ARPROT),
        .M03_AXI_arready(dma_sub_M03_AXI_ARREADY),
        .M03_AXI_arvalid(dma_sub_M03_AXI_ARVALID),
        .M03_AXI_awaddr(dma_sub_M03_AXI_AWADDR),
        .M03_AXI_awprot(dma_sub_M03_AXI_AWPROT),
        .M03_AXI_awready(dma_sub_M03_AXI_AWREADY),
        .M03_AXI_awvalid(dma_sub_M03_AXI_AWVALID),
        .M03_AXI_bready(dma_sub_M03_AXI_BREADY),
        .M03_AXI_bresp(dma_sub_M03_AXI_BRESP),
        .M03_AXI_bvalid(dma_sub_M03_AXI_BVALID),
        .M03_AXI_rdata(dma_sub_M03_AXI_RDATA),
        .M03_AXI_rready(dma_sub_M03_AXI_RREADY),
        .M03_AXI_rresp(dma_sub_M03_AXI_RRESP),
        .M03_AXI_rvalid(dma_sub_M03_AXI_RVALID),
        .M03_AXI_wdata(dma_sub_M03_AXI_WDATA),
        .M03_AXI_wready(dma_sub_M03_AXI_WREADY),
        .M03_AXI_wstrb(dma_sub_M03_AXI_WSTRB),
        .M03_AXI_wvalid(dma_sub_M03_AXI_WVALID),
        .M04_ACLK(axis_datapath_aclk_1),
        .M04_ARESETN(axis_datapath_aresetn_1),
        .M04_AXI_araddr(dma_sub_M04_AXI_ARADDR),
        .M04_AXI_arprot(dma_sub_M04_AXI_ARPROT),
        .M04_AXI_arready(dma_sub_M04_AXI_ARREADY),
        .M04_AXI_arvalid(dma_sub_M04_AXI_ARVALID),
        .M04_AXI_awaddr(dma_sub_M04_AXI_AWADDR),
        .M04_AXI_awprot(dma_sub_M04_AXI_AWPROT),
        .M04_AXI_awready(dma_sub_M04_AXI_AWREADY),
        .M04_AXI_awvalid(dma_sub_M04_AXI_AWVALID),
        .M04_AXI_bready(dma_sub_M04_AXI_BREADY),
        .M04_AXI_bresp(dma_sub_M04_AXI_BRESP),
        .M04_AXI_bvalid(dma_sub_M04_AXI_BVALID),
        .M04_AXI_rdata(dma_sub_M04_AXI_RDATA),
        .M04_AXI_rready(dma_sub_M04_AXI_RREADY),
        .M04_AXI_rresp(dma_sub_M04_AXI_RRESP),
        .M04_AXI_rvalid(dma_sub_M04_AXI_RVALID),
        .M04_AXI_wdata(dma_sub_M04_AXI_WDATA),
        .M04_AXI_wready(dma_sub_M04_AXI_WREADY),
        .M04_AXI_wstrb(dma_sub_M04_AXI_WSTRB),
        .M04_AXI_wvalid(dma_sub_M04_AXI_WVALID),
        .M05_ACLK(axis_datapath_aclk_1),
        .M05_ARESETN(axis_datapath_aresetn_1),
        .M05_AXI_araddr(dma_sub_M05_AXI_ARADDR),
        .M05_AXI_arprot(dma_sub_M05_AXI_ARPROT),
        .M05_AXI_arready(dma_sub_M05_AXI_ARREADY),
        .M05_AXI_arvalid(dma_sub_M05_AXI_ARVALID),
        .M05_AXI_awaddr(dma_sub_M05_AXI_AWADDR),
        .M05_AXI_awprot(dma_sub_M05_AXI_AWPROT),
        .M05_AXI_awready(dma_sub_M05_AXI_AWREADY),
        .M05_AXI_awvalid(dma_sub_M05_AXI_AWVALID),
        .M05_AXI_bready(dma_sub_M05_AXI_BREADY),
        .M05_AXI_bresp(dma_sub_M05_AXI_BRESP),
        .M05_AXI_bvalid(dma_sub_M05_AXI_BVALID),
        .M05_AXI_rdata(dma_sub_M05_AXI_RDATA),
        .M05_AXI_rready(dma_sub_M05_AXI_RREADY),
        .M05_AXI_rresp(dma_sub_M05_AXI_RRESP),
        .M05_AXI_rvalid(dma_sub_M05_AXI_RVALID),
        .M05_AXI_wdata(dma_sub_M05_AXI_WDATA),
        .M05_AXI_wready(dma_sub_M05_AXI_WREADY),
        .M05_AXI_wstrb(dma_sub_M05_AXI_WSTRB),
        .M05_AXI_wvalid(dma_sub_M05_AXI_WVALID),
        .M06_ACLK(axis_datapath_aclk_1),
        .M06_ARESETN(axis_datapath_aresetn_1),
        .M06_AXI_araddr(dma_sub_M06_AXI_ARADDR),
        .M06_AXI_arprot(dma_sub_M06_AXI_ARPROT),
        .M06_AXI_arready(dma_sub_M06_AXI_ARREADY),
        .M06_AXI_arvalid(dma_sub_M06_AXI_ARVALID),
        .M06_AXI_awaddr(dma_sub_M06_AXI_AWADDR),
        .M06_AXI_awprot(dma_sub_M06_AXI_AWPROT),
        .M06_AXI_awready(dma_sub_M06_AXI_AWREADY),
        .M06_AXI_awvalid(dma_sub_M06_AXI_AWVALID),
        .M06_AXI_bready(dma_sub_M06_AXI_BREADY),
        .M06_AXI_bresp(dma_sub_M06_AXI_BRESP),
        .M06_AXI_bvalid(dma_sub_M06_AXI_BVALID),
        .M06_AXI_rdata(dma_sub_M06_AXI_RDATA),
        .M06_AXI_rready(dma_sub_M06_AXI_RREADY),
        .M06_AXI_rresp(dma_sub_M06_AXI_RRESP),
        .M06_AXI_rvalid(dma_sub_M06_AXI_RVALID),
        .M06_AXI_wdata(dma_sub_M06_AXI_WDATA),
        .M06_AXI_wready(dma_sub_M06_AXI_WREADY),
        .M06_AXI_wstrb(dma_sub_M06_AXI_WSTRB),
        .M06_AXI_wvalid(dma_sub_M06_AXI_WVALID),
        .M07_ACLK(axis_datapath_aclk_1),
        .M07_ARESETN(axis_datapath_aresetn_1),
        .M07_AXI_araddr(dma_sub_M07_AXI_ARADDR),
        .M07_AXI_arprot(dma_sub_M07_AXI_ARPROT),
        .M07_AXI_arready(dma_sub_M07_AXI_ARREADY),
        .M07_AXI_arvalid(dma_sub_M07_AXI_ARVALID),
        .M07_AXI_awaddr(dma_sub_M07_AXI_AWADDR),
        .M07_AXI_awprot(dma_sub_M07_AXI_AWPROT),
        .M07_AXI_awready(dma_sub_M07_AXI_AWREADY),
        .M07_AXI_awvalid(dma_sub_M07_AXI_AWVALID),
        .M07_AXI_bready(dma_sub_M07_AXI_BREADY),
        .M07_AXI_bresp(dma_sub_M07_AXI_BRESP),
        .M07_AXI_bvalid(dma_sub_M07_AXI_BVALID),
        .M07_AXI_rdata(dma_sub_M07_AXI_RDATA),
        .M07_AXI_rready(dma_sub_M07_AXI_RREADY),
        .M07_AXI_rresp(dma_sub_M07_AXI_RRESP),
        .M07_AXI_rvalid(dma_sub_M07_AXI_RVALID),
        .M07_AXI_wdata(dma_sub_M07_AXI_WDATA),
        .M07_AXI_wready(dma_sub_M07_AXI_WREADY),
        .M07_AXI_wstrb(dma_sub_M07_AXI_WSTRB),
        .M07_AXI_wvalid(dma_sub_M07_AXI_WVALID),
        .axi_lite_aclk(axi_lite_aclk_1),
        .axi_lite_aresetn(axi_lite_aresetn_1),
        .axis_datapath_aclk(axis_datapath_aclk_1),
        .axis_datapath_aresetn(axis_datapath_aresetn_1),
        .m_axis_dma_tx_tdata(dma_sub_m_axis_dma_tx_TDATA),
        .m_axis_dma_tx_tkeep(dma_sub_m_axis_dma_tx_TKEEP),
        .m_axis_dma_tx_tlast(dma_sub_m_axis_dma_tx_TLAST),
        .m_axis_dma_tx_tready(dma_sub_m_axis_dma_tx_TREADY),
        .m_axis_dma_tx_tuser(dma_sub_m_axis_dma_tx_TUSER),
        .m_axis_dma_tx_tvalid(dma_sub_m_axis_dma_tx_TVALID),
        .pcie_7x_mgt_rxn(dma_sub_pcie_7x_mgt_rxn),
        .pcie_7x_mgt_rxp(dma_sub_pcie_7x_mgt_rxp),
        .pcie_7x_mgt_txn(dma_sub_pcie_7x_mgt_txn),
        .pcie_7x_mgt_txp(dma_sub_pcie_7x_mgt_txp),
        .s_axis_dma_rx_tdata(s_axis_dma_rx_1_TDATA),
        .s_axis_dma_rx_tkeep(s_axis_dma_rx_1_TKEEP),
        .s_axis_dma_rx_tlast(s_axis_dma_rx_1_TLAST),
        .s_axis_dma_rx_tready(s_axis_dma_rx_1_TREADY),
        .s_axis_dma_rx_tuser(s_axis_dma_rx_1_TUSER),
        .s_axis_dma_rx_tvalid(s_axis_dma_rx_1_TVALID),
        .sys_clk(sys_clk_1),
        .sys_reset(sys_reset_1));
  nf_mbsys_imp_UPW3WD nf_mbsys
       (.iic_fpga_scl_i(nf_mbsys_iic_fpga_SCL_I),
        .iic_fpga_scl_o(nf_mbsys_iic_fpga_SCL_O),
        .iic_fpga_scl_t(nf_mbsys_iic_fpga_SCL_T),
        .iic_fpga_sda_i(nf_mbsys_iic_fpga_SDA_I),
        .iic_fpga_sda_o(nf_mbsys_iic_fpga_SDA_O),
        .iic_fpga_sda_t(nf_mbsys_iic_fpga_SDA_T),
        .iic_reset(nf_mbsys_iic_reset),
        .reset(sys_reset_1),
        .sysclk(sys_clk_1),
        .uart_rxd(nf_mbsys_uart_RxD),
        .uart_txd(nf_mbsys_uart_TxD));
endmodule

module control_sub_axi_interconnect_0_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arprot,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awprot,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arprot,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awprot,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arprot,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awprot,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    M03_ACLK,
    M03_ARESETN,
    M03_AXI_araddr,
    M03_AXI_arprot,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awprot,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_ACLK,
    M04_ARESETN,
    M04_AXI_araddr,
    M04_AXI_arprot,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awprot,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    M05_ACLK,
    M05_ARESETN,
    M05_AXI_araddr,
    M05_AXI_arprot,
    M05_AXI_arready,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awprot,
    M05_AXI_awready,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wready,
    M05_AXI_wstrb,
    M05_AXI_wvalid,
    M06_ACLK,
    M06_ARESETN,
    M06_AXI_araddr,
    M06_AXI_arprot,
    M06_AXI_arready,
    M06_AXI_arvalid,
    M06_AXI_awaddr,
    M06_AXI_awprot,
    M06_AXI_awready,
    M06_AXI_awvalid,
    M06_AXI_bready,
    M06_AXI_bresp,
    M06_AXI_bvalid,
    M06_AXI_rdata,
    M06_AXI_rready,
    M06_AXI_rresp,
    M06_AXI_rvalid,
    M06_AXI_wdata,
    M06_AXI_wready,
    M06_AXI_wstrb,
    M06_AXI_wvalid,
    M07_ACLK,
    M07_ARESETN,
    M07_AXI_araddr,
    M07_AXI_arprot,
    M07_AXI_arready,
    M07_AXI_arvalid,
    M07_AXI_awaddr,
    M07_AXI_awprot,
    M07_AXI_awready,
    M07_AXI_awvalid,
    M07_AXI_bready,
    M07_AXI_bresp,
    M07_AXI_bvalid,
    M07_AXI_rdata,
    M07_AXI_rready,
    M07_AXI_rresp,
    M07_AXI_rvalid,
    M07_AXI_wdata,
    M07_AXI_wready,
    M07_AXI_wstrb,
    M07_AXI_wvalid,
    M08_ACLK,
    M08_ARESETN,
    M08_AXI_araddr,
    M08_AXI_arprot,
    M08_AXI_arready,
    M08_AXI_arvalid,
    M08_AXI_awaddr,
    M08_AXI_awprot,
    M08_AXI_awready,
    M08_AXI_awvalid,
    M08_AXI_bready,
    M08_AXI_bresp,
    M08_AXI_bvalid,
    M08_AXI_rdata,
    M08_AXI_rready,
    M08_AXI_rresp,
    M08_AXI_rvalid,
    M08_AXI_wdata,
    M08_AXI_wready,
    M08_AXI_wstrb,
    M08_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [11:0]M00_AXI_araddr;
  output [2:0]M00_AXI_arprot;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [11:0]M00_AXI_awaddr;
  output [2:0]M00_AXI_awprot;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [11:0]M01_AXI_araddr;
  output [2:0]M01_AXI_arprot;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [11:0]M01_AXI_awaddr;
  output [2:0]M01_AXI_awprot;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [11:0]M02_AXI_araddr;
  output [2:0]M02_AXI_arprot;
  input M02_AXI_arready;
  output M02_AXI_arvalid;
  output [11:0]M02_AXI_awaddr;
  output [2:0]M02_AXI_awprot;
  input M02_AXI_awready;
  output M02_AXI_awvalid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output M02_AXI_wvalid;
  input M03_ACLK;
  input M03_ARESETN;
  output [11:0]M03_AXI_araddr;
  output [2:0]M03_AXI_arprot;
  input M03_AXI_arready;
  output M03_AXI_arvalid;
  output [11:0]M03_AXI_awaddr;
  output [2:0]M03_AXI_awprot;
  input M03_AXI_awready;
  output M03_AXI_awvalid;
  output M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input M03_AXI_wready;
  output [3:0]M03_AXI_wstrb;
  output M03_AXI_wvalid;
  input M04_ACLK;
  input M04_ARESETN;
  output [11:0]M04_AXI_araddr;
  output [2:0]M04_AXI_arprot;
  input M04_AXI_arready;
  output M04_AXI_arvalid;
  output [11:0]M04_AXI_awaddr;
  output [2:0]M04_AXI_awprot;
  input M04_AXI_awready;
  output M04_AXI_awvalid;
  output M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input M04_AXI_wready;
  output [3:0]M04_AXI_wstrb;
  output M04_AXI_wvalid;
  input M05_ACLK;
  input M05_ARESETN;
  output [11:0]M05_AXI_araddr;
  output [2:0]M05_AXI_arprot;
  input M05_AXI_arready;
  output M05_AXI_arvalid;
  output [11:0]M05_AXI_awaddr;
  output [2:0]M05_AXI_awprot;
  input M05_AXI_awready;
  output M05_AXI_awvalid;
  output M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  output M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  input M05_AXI_wready;
  output [3:0]M05_AXI_wstrb;
  output M05_AXI_wvalid;
  input M06_ACLK;
  input M06_ARESETN;
  output [11:0]M06_AXI_araddr;
  output [2:0]M06_AXI_arprot;
  input M06_AXI_arready;
  output M06_AXI_arvalid;
  output [11:0]M06_AXI_awaddr;
  output [2:0]M06_AXI_awprot;
  input M06_AXI_awready;
  output M06_AXI_awvalid;
  output M06_AXI_bready;
  input [1:0]M06_AXI_bresp;
  input M06_AXI_bvalid;
  input [31:0]M06_AXI_rdata;
  output M06_AXI_rready;
  input [1:0]M06_AXI_rresp;
  input M06_AXI_rvalid;
  output [31:0]M06_AXI_wdata;
  input M06_AXI_wready;
  output [3:0]M06_AXI_wstrb;
  output M06_AXI_wvalid;
  input M07_ACLK;
  input M07_ARESETN;
  output [11:0]M07_AXI_araddr;
  output [2:0]M07_AXI_arprot;
  input M07_AXI_arready;
  output M07_AXI_arvalid;
  output [11:0]M07_AXI_awaddr;
  output [2:0]M07_AXI_awprot;
  input M07_AXI_awready;
  output M07_AXI_awvalid;
  output M07_AXI_bready;
  input [1:0]M07_AXI_bresp;
  input M07_AXI_bvalid;
  input [31:0]M07_AXI_rdata;
  output M07_AXI_rready;
  input [1:0]M07_AXI_rresp;
  input M07_AXI_rvalid;
  output [31:0]M07_AXI_wdata;
  input M07_AXI_wready;
  output [3:0]M07_AXI_wstrb;
  output M07_AXI_wvalid;
  input M08_ACLK;
  input M08_ARESETN;
  output [11:0]M08_AXI_araddr;
  output [2:0]M08_AXI_arprot;
  input M08_AXI_arready;
  output M08_AXI_arvalid;
  output [11:0]M08_AXI_awaddr;
  output [2:0]M08_AXI_awprot;
  input M08_AXI_awready;
  output M08_AXI_awvalid;
  output M08_AXI_bready;
  input [1:0]M08_AXI_bresp;
  input M08_AXI_bvalid;
  input [31:0]M08_AXI_rdata;
  output M08_AXI_rready;
  input [1:0]M08_AXI_rresp;
  input M08_AXI_rvalid;
  output [31:0]M08_AXI_wdata;
  input M08_AXI_wready;
  output [3:0]M08_AXI_wstrb;
  output M08_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [2:0]S00_AXI_arprot;
  output S00_AXI_arready;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [2:0]S00_AXI_awprot;
  output S00_AXI_awready;
  input S00_AXI_awvalid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire M00_ACLK_1;
  wire M00_ARESETN_1;
  wire M01_ACLK_1;
  wire M01_ARESETN_1;
  wire M02_ACLK_1;
  wire M02_ARESETN_1;
  wire M03_ACLK_1;
  wire M03_ARESETN_1;
  wire M04_ACLK_1;
  wire M04_ARESETN_1;
  wire M05_ACLK_1;
  wire M05_ARESETN_1;
  wire M06_ACLK_1;
  wire M06_ARESETN_1;
  wire M07_ACLK_1;
  wire M07_ARESETN_1;
  wire M08_ACLK_1;
  wire M08_ARESETN_1;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire axi_interconnect_0_ACLK_net;
  wire axi_interconnect_0_ARESETN_net;
  wire [31:0]axi_interconnect_0_to_s00_couplers_ARADDR;
  wire [2:0]axi_interconnect_0_to_s00_couplers_ARPROT;
  wire axi_interconnect_0_to_s00_couplers_ARREADY;
  wire axi_interconnect_0_to_s00_couplers_ARVALID;
  wire [31:0]axi_interconnect_0_to_s00_couplers_AWADDR;
  wire [2:0]axi_interconnect_0_to_s00_couplers_AWPROT;
  wire axi_interconnect_0_to_s00_couplers_AWREADY;
  wire axi_interconnect_0_to_s00_couplers_AWVALID;
  wire axi_interconnect_0_to_s00_couplers_BREADY;
  wire [1:0]axi_interconnect_0_to_s00_couplers_BRESP;
  wire axi_interconnect_0_to_s00_couplers_BVALID;
  wire [31:0]axi_interconnect_0_to_s00_couplers_RDATA;
  wire axi_interconnect_0_to_s00_couplers_RREADY;
  wire [1:0]axi_interconnect_0_to_s00_couplers_RRESP;
  wire axi_interconnect_0_to_s00_couplers_RVALID;
  wire [31:0]axi_interconnect_0_to_s00_couplers_WDATA;
  wire axi_interconnect_0_to_s00_couplers_WREADY;
  wire [3:0]axi_interconnect_0_to_s00_couplers_WSTRB;
  wire axi_interconnect_0_to_s00_couplers_WVALID;
  wire [11:0]m00_couplers_to_axi_interconnect_0_ARADDR;
  wire [2:0]m00_couplers_to_axi_interconnect_0_ARPROT;
  wire m00_couplers_to_axi_interconnect_0_ARREADY;
  wire m00_couplers_to_axi_interconnect_0_ARVALID;
  wire [11:0]m00_couplers_to_axi_interconnect_0_AWADDR;
  wire [2:0]m00_couplers_to_axi_interconnect_0_AWPROT;
  wire m00_couplers_to_axi_interconnect_0_AWREADY;
  wire m00_couplers_to_axi_interconnect_0_AWVALID;
  wire m00_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_0_BRESP;
  wire m00_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_0_RDATA;
  wire m00_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m00_couplers_to_axi_interconnect_0_RRESP;
  wire m00_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m00_couplers_to_axi_interconnect_0_WDATA;
  wire m00_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m00_couplers_to_axi_interconnect_0_WSTRB;
  wire m00_couplers_to_axi_interconnect_0_WVALID;
  wire [11:0]m01_couplers_to_axi_interconnect_0_ARADDR;
  wire [2:0]m01_couplers_to_axi_interconnect_0_ARPROT;
  wire m01_couplers_to_axi_interconnect_0_ARREADY;
  wire m01_couplers_to_axi_interconnect_0_ARVALID;
  wire [11:0]m01_couplers_to_axi_interconnect_0_AWADDR;
  wire [2:0]m01_couplers_to_axi_interconnect_0_AWPROT;
  wire m01_couplers_to_axi_interconnect_0_AWREADY;
  wire m01_couplers_to_axi_interconnect_0_AWVALID;
  wire m01_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m01_couplers_to_axi_interconnect_0_BRESP;
  wire m01_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_0_RDATA;
  wire m01_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m01_couplers_to_axi_interconnect_0_RRESP;
  wire m01_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m01_couplers_to_axi_interconnect_0_WDATA;
  wire m01_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m01_couplers_to_axi_interconnect_0_WSTRB;
  wire m01_couplers_to_axi_interconnect_0_WVALID;
  wire [11:0]m02_couplers_to_axi_interconnect_0_ARADDR;
  wire [2:0]m02_couplers_to_axi_interconnect_0_ARPROT;
  wire m02_couplers_to_axi_interconnect_0_ARREADY;
  wire m02_couplers_to_axi_interconnect_0_ARVALID;
  wire [11:0]m02_couplers_to_axi_interconnect_0_AWADDR;
  wire [2:0]m02_couplers_to_axi_interconnect_0_AWPROT;
  wire m02_couplers_to_axi_interconnect_0_AWREADY;
  wire m02_couplers_to_axi_interconnect_0_AWVALID;
  wire m02_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m02_couplers_to_axi_interconnect_0_BRESP;
  wire m02_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m02_couplers_to_axi_interconnect_0_RDATA;
  wire m02_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m02_couplers_to_axi_interconnect_0_RRESP;
  wire m02_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m02_couplers_to_axi_interconnect_0_WDATA;
  wire m02_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m02_couplers_to_axi_interconnect_0_WSTRB;
  wire m02_couplers_to_axi_interconnect_0_WVALID;
  wire [11:0]m03_couplers_to_axi_interconnect_0_ARADDR;
  wire [2:0]m03_couplers_to_axi_interconnect_0_ARPROT;
  wire m03_couplers_to_axi_interconnect_0_ARREADY;
  wire m03_couplers_to_axi_interconnect_0_ARVALID;
  wire [11:0]m03_couplers_to_axi_interconnect_0_AWADDR;
  wire [2:0]m03_couplers_to_axi_interconnect_0_AWPROT;
  wire m03_couplers_to_axi_interconnect_0_AWREADY;
  wire m03_couplers_to_axi_interconnect_0_AWVALID;
  wire m03_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m03_couplers_to_axi_interconnect_0_BRESP;
  wire m03_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m03_couplers_to_axi_interconnect_0_RDATA;
  wire m03_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m03_couplers_to_axi_interconnect_0_RRESP;
  wire m03_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m03_couplers_to_axi_interconnect_0_WDATA;
  wire m03_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m03_couplers_to_axi_interconnect_0_WSTRB;
  wire m03_couplers_to_axi_interconnect_0_WVALID;
  wire [11:0]m04_couplers_to_axi_interconnect_0_ARADDR;
  wire [2:0]m04_couplers_to_axi_interconnect_0_ARPROT;
  wire m04_couplers_to_axi_interconnect_0_ARREADY;
  wire m04_couplers_to_axi_interconnect_0_ARVALID;
  wire [11:0]m04_couplers_to_axi_interconnect_0_AWADDR;
  wire [2:0]m04_couplers_to_axi_interconnect_0_AWPROT;
  wire m04_couplers_to_axi_interconnect_0_AWREADY;
  wire m04_couplers_to_axi_interconnect_0_AWVALID;
  wire m04_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m04_couplers_to_axi_interconnect_0_BRESP;
  wire m04_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m04_couplers_to_axi_interconnect_0_RDATA;
  wire m04_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m04_couplers_to_axi_interconnect_0_RRESP;
  wire m04_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m04_couplers_to_axi_interconnect_0_WDATA;
  wire m04_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m04_couplers_to_axi_interconnect_0_WSTRB;
  wire m04_couplers_to_axi_interconnect_0_WVALID;
  wire [11:0]m05_couplers_to_axi_interconnect_0_ARADDR;
  wire [2:0]m05_couplers_to_axi_interconnect_0_ARPROT;
  wire m05_couplers_to_axi_interconnect_0_ARREADY;
  wire m05_couplers_to_axi_interconnect_0_ARVALID;
  wire [11:0]m05_couplers_to_axi_interconnect_0_AWADDR;
  wire [2:0]m05_couplers_to_axi_interconnect_0_AWPROT;
  wire m05_couplers_to_axi_interconnect_0_AWREADY;
  wire m05_couplers_to_axi_interconnect_0_AWVALID;
  wire m05_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m05_couplers_to_axi_interconnect_0_BRESP;
  wire m05_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m05_couplers_to_axi_interconnect_0_RDATA;
  wire m05_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m05_couplers_to_axi_interconnect_0_RRESP;
  wire m05_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m05_couplers_to_axi_interconnect_0_WDATA;
  wire m05_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m05_couplers_to_axi_interconnect_0_WSTRB;
  wire m05_couplers_to_axi_interconnect_0_WVALID;
  wire [11:0]m06_couplers_to_axi_interconnect_0_ARADDR;
  wire [2:0]m06_couplers_to_axi_interconnect_0_ARPROT;
  wire m06_couplers_to_axi_interconnect_0_ARREADY;
  wire m06_couplers_to_axi_interconnect_0_ARVALID;
  wire [11:0]m06_couplers_to_axi_interconnect_0_AWADDR;
  wire [2:0]m06_couplers_to_axi_interconnect_0_AWPROT;
  wire m06_couplers_to_axi_interconnect_0_AWREADY;
  wire m06_couplers_to_axi_interconnect_0_AWVALID;
  wire m06_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m06_couplers_to_axi_interconnect_0_BRESP;
  wire m06_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m06_couplers_to_axi_interconnect_0_RDATA;
  wire m06_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m06_couplers_to_axi_interconnect_0_RRESP;
  wire m06_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m06_couplers_to_axi_interconnect_0_WDATA;
  wire m06_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m06_couplers_to_axi_interconnect_0_WSTRB;
  wire m06_couplers_to_axi_interconnect_0_WVALID;
  wire [11:0]m07_couplers_to_axi_interconnect_0_ARADDR;
  wire [2:0]m07_couplers_to_axi_interconnect_0_ARPROT;
  wire m07_couplers_to_axi_interconnect_0_ARREADY;
  wire m07_couplers_to_axi_interconnect_0_ARVALID;
  wire [11:0]m07_couplers_to_axi_interconnect_0_AWADDR;
  wire [2:0]m07_couplers_to_axi_interconnect_0_AWPROT;
  wire m07_couplers_to_axi_interconnect_0_AWREADY;
  wire m07_couplers_to_axi_interconnect_0_AWVALID;
  wire m07_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m07_couplers_to_axi_interconnect_0_BRESP;
  wire m07_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m07_couplers_to_axi_interconnect_0_RDATA;
  wire m07_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m07_couplers_to_axi_interconnect_0_RRESP;
  wire m07_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m07_couplers_to_axi_interconnect_0_WDATA;
  wire m07_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m07_couplers_to_axi_interconnect_0_WSTRB;
  wire m07_couplers_to_axi_interconnect_0_WVALID;
  wire [11:0]m08_couplers_to_axi_interconnect_0_ARADDR;
  wire [2:0]m08_couplers_to_axi_interconnect_0_ARPROT;
  wire m08_couplers_to_axi_interconnect_0_ARREADY;
  wire m08_couplers_to_axi_interconnect_0_ARVALID;
  wire [11:0]m08_couplers_to_axi_interconnect_0_AWADDR;
  wire [2:0]m08_couplers_to_axi_interconnect_0_AWPROT;
  wire m08_couplers_to_axi_interconnect_0_AWREADY;
  wire m08_couplers_to_axi_interconnect_0_AWVALID;
  wire m08_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]m08_couplers_to_axi_interconnect_0_BRESP;
  wire m08_couplers_to_axi_interconnect_0_BVALID;
  wire [31:0]m08_couplers_to_axi_interconnect_0_RDATA;
  wire m08_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]m08_couplers_to_axi_interconnect_0_RRESP;
  wire m08_couplers_to_axi_interconnect_0_RVALID;
  wire [31:0]m08_couplers_to_axi_interconnect_0_WDATA;
  wire m08_couplers_to_axi_interconnect_0_WREADY;
  wire [3:0]m08_couplers_to_axi_interconnect_0_WSTRB;
  wire m08_couplers_to_axi_interconnect_0_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire s00_couplers_to_xbar_AWVALID;
  wire s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [2:0]xbar_to_m00_couplers_ARPROT;
  wire xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [2:0]xbar_to_m00_couplers_AWPROT;
  wire xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire [5:3]xbar_to_m01_couplers_ARPROT;
  wire xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire [5:3]xbar_to_m01_couplers_AWPROT;
  wire xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [95:64]xbar_to_m02_couplers_ARADDR;
  wire [8:6]xbar_to_m02_couplers_ARPROT;
  wire xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [95:64]xbar_to_m02_couplers_AWADDR;
  wire [8:6]xbar_to_m02_couplers_AWPROT;
  wire xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire xbar_to_m02_couplers_WREADY;
  wire [11:8]xbar_to_m02_couplers_WSTRB;
  wire [2:2]xbar_to_m02_couplers_WVALID;
  wire [127:96]xbar_to_m03_couplers_ARADDR;
  wire [11:9]xbar_to_m03_couplers_ARPROT;
  wire xbar_to_m03_couplers_ARREADY;
  wire [3:3]xbar_to_m03_couplers_ARVALID;
  wire [127:96]xbar_to_m03_couplers_AWADDR;
  wire [11:9]xbar_to_m03_couplers_AWPROT;
  wire xbar_to_m03_couplers_AWREADY;
  wire [3:3]xbar_to_m03_couplers_AWVALID;
  wire [3:3]xbar_to_m03_couplers_BREADY;
  wire [1:0]xbar_to_m03_couplers_BRESP;
  wire xbar_to_m03_couplers_BVALID;
  wire [31:0]xbar_to_m03_couplers_RDATA;
  wire [3:3]xbar_to_m03_couplers_RREADY;
  wire [1:0]xbar_to_m03_couplers_RRESP;
  wire xbar_to_m03_couplers_RVALID;
  wire [127:96]xbar_to_m03_couplers_WDATA;
  wire xbar_to_m03_couplers_WREADY;
  wire [15:12]xbar_to_m03_couplers_WSTRB;
  wire [3:3]xbar_to_m03_couplers_WVALID;
  wire [159:128]xbar_to_m04_couplers_ARADDR;
  wire [14:12]xbar_to_m04_couplers_ARPROT;
  wire xbar_to_m04_couplers_ARREADY;
  wire [4:4]xbar_to_m04_couplers_ARVALID;
  wire [159:128]xbar_to_m04_couplers_AWADDR;
  wire [14:12]xbar_to_m04_couplers_AWPROT;
  wire xbar_to_m04_couplers_AWREADY;
  wire [4:4]xbar_to_m04_couplers_AWVALID;
  wire [4:4]xbar_to_m04_couplers_BREADY;
  wire [1:0]xbar_to_m04_couplers_BRESP;
  wire xbar_to_m04_couplers_BVALID;
  wire [31:0]xbar_to_m04_couplers_RDATA;
  wire [4:4]xbar_to_m04_couplers_RREADY;
  wire [1:0]xbar_to_m04_couplers_RRESP;
  wire xbar_to_m04_couplers_RVALID;
  wire [159:128]xbar_to_m04_couplers_WDATA;
  wire xbar_to_m04_couplers_WREADY;
  wire [19:16]xbar_to_m04_couplers_WSTRB;
  wire [4:4]xbar_to_m04_couplers_WVALID;
  wire [191:160]xbar_to_m05_couplers_ARADDR;
  wire [17:15]xbar_to_m05_couplers_ARPROT;
  wire xbar_to_m05_couplers_ARREADY;
  wire [5:5]xbar_to_m05_couplers_ARVALID;
  wire [191:160]xbar_to_m05_couplers_AWADDR;
  wire [17:15]xbar_to_m05_couplers_AWPROT;
  wire xbar_to_m05_couplers_AWREADY;
  wire [5:5]xbar_to_m05_couplers_AWVALID;
  wire [5:5]xbar_to_m05_couplers_BREADY;
  wire [1:0]xbar_to_m05_couplers_BRESP;
  wire xbar_to_m05_couplers_BVALID;
  wire [31:0]xbar_to_m05_couplers_RDATA;
  wire [5:5]xbar_to_m05_couplers_RREADY;
  wire [1:0]xbar_to_m05_couplers_RRESP;
  wire xbar_to_m05_couplers_RVALID;
  wire [191:160]xbar_to_m05_couplers_WDATA;
  wire xbar_to_m05_couplers_WREADY;
  wire [23:20]xbar_to_m05_couplers_WSTRB;
  wire [5:5]xbar_to_m05_couplers_WVALID;
  wire [223:192]xbar_to_m06_couplers_ARADDR;
  wire [20:18]xbar_to_m06_couplers_ARPROT;
  wire xbar_to_m06_couplers_ARREADY;
  wire [6:6]xbar_to_m06_couplers_ARVALID;
  wire [223:192]xbar_to_m06_couplers_AWADDR;
  wire [20:18]xbar_to_m06_couplers_AWPROT;
  wire xbar_to_m06_couplers_AWREADY;
  wire [6:6]xbar_to_m06_couplers_AWVALID;
  wire [6:6]xbar_to_m06_couplers_BREADY;
  wire [1:0]xbar_to_m06_couplers_BRESP;
  wire xbar_to_m06_couplers_BVALID;
  wire [31:0]xbar_to_m06_couplers_RDATA;
  wire [6:6]xbar_to_m06_couplers_RREADY;
  wire [1:0]xbar_to_m06_couplers_RRESP;
  wire xbar_to_m06_couplers_RVALID;
  wire [223:192]xbar_to_m06_couplers_WDATA;
  wire xbar_to_m06_couplers_WREADY;
  wire [27:24]xbar_to_m06_couplers_WSTRB;
  wire [6:6]xbar_to_m06_couplers_WVALID;
  wire [255:224]xbar_to_m07_couplers_ARADDR;
  wire [23:21]xbar_to_m07_couplers_ARPROT;
  wire xbar_to_m07_couplers_ARREADY;
  wire [7:7]xbar_to_m07_couplers_ARVALID;
  wire [255:224]xbar_to_m07_couplers_AWADDR;
  wire [23:21]xbar_to_m07_couplers_AWPROT;
  wire xbar_to_m07_couplers_AWREADY;
  wire [7:7]xbar_to_m07_couplers_AWVALID;
  wire [7:7]xbar_to_m07_couplers_BREADY;
  wire [1:0]xbar_to_m07_couplers_BRESP;
  wire xbar_to_m07_couplers_BVALID;
  wire [31:0]xbar_to_m07_couplers_RDATA;
  wire [7:7]xbar_to_m07_couplers_RREADY;
  wire [1:0]xbar_to_m07_couplers_RRESP;
  wire xbar_to_m07_couplers_RVALID;
  wire [255:224]xbar_to_m07_couplers_WDATA;
  wire xbar_to_m07_couplers_WREADY;
  wire [31:28]xbar_to_m07_couplers_WSTRB;
  wire [7:7]xbar_to_m07_couplers_WVALID;
  wire [287:256]xbar_to_m08_couplers_ARADDR;
  wire [26:24]xbar_to_m08_couplers_ARPROT;
  wire xbar_to_m08_couplers_ARREADY;
  wire [8:8]xbar_to_m08_couplers_ARVALID;
  wire [287:256]xbar_to_m08_couplers_AWADDR;
  wire [26:24]xbar_to_m08_couplers_AWPROT;
  wire xbar_to_m08_couplers_AWREADY;
  wire [8:8]xbar_to_m08_couplers_AWVALID;
  wire [8:8]xbar_to_m08_couplers_BREADY;
  wire [1:0]xbar_to_m08_couplers_BRESP;
  wire xbar_to_m08_couplers_BVALID;
  wire [31:0]xbar_to_m08_couplers_RDATA;
  wire [8:8]xbar_to_m08_couplers_RREADY;
  wire [1:0]xbar_to_m08_couplers_RRESP;
  wire xbar_to_m08_couplers_RVALID;
  wire [287:256]xbar_to_m08_couplers_WDATA;
  wire xbar_to_m08_couplers_WREADY;
  wire [35:32]xbar_to_m08_couplers_WSTRB;
  wire [8:8]xbar_to_m08_couplers_WVALID;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN;
  assign M00_AXI_araddr[11:0] = m00_couplers_to_axi_interconnect_0_ARADDR;
  assign M00_AXI_arprot[2:0] = m00_couplers_to_axi_interconnect_0_ARPROT;
  assign M00_AXI_arvalid = m00_couplers_to_axi_interconnect_0_ARVALID;
  assign M00_AXI_awaddr[11:0] = m00_couplers_to_axi_interconnect_0_AWADDR;
  assign M00_AXI_awprot[2:0] = m00_couplers_to_axi_interconnect_0_AWPROT;
  assign M00_AXI_awvalid = m00_couplers_to_axi_interconnect_0_AWVALID;
  assign M00_AXI_bready = m00_couplers_to_axi_interconnect_0_BREADY;
  assign M00_AXI_rready = m00_couplers_to_axi_interconnect_0_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_axi_interconnect_0_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_axi_interconnect_0_WSTRB;
  assign M00_AXI_wvalid = m00_couplers_to_axi_interconnect_0_WVALID;
  assign M01_ACLK_1 = M01_ACLK;
  assign M01_ARESETN_1 = M01_ARESETN;
  assign M01_AXI_araddr[11:0] = m01_couplers_to_axi_interconnect_0_ARADDR;
  assign M01_AXI_arprot[2:0] = m01_couplers_to_axi_interconnect_0_ARPROT;
  assign M01_AXI_arvalid = m01_couplers_to_axi_interconnect_0_ARVALID;
  assign M01_AXI_awaddr[11:0] = m01_couplers_to_axi_interconnect_0_AWADDR;
  assign M01_AXI_awprot[2:0] = m01_couplers_to_axi_interconnect_0_AWPROT;
  assign M01_AXI_awvalid = m01_couplers_to_axi_interconnect_0_AWVALID;
  assign M01_AXI_bready = m01_couplers_to_axi_interconnect_0_BREADY;
  assign M01_AXI_rready = m01_couplers_to_axi_interconnect_0_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_axi_interconnect_0_WDATA;
  assign M01_AXI_wstrb[3:0] = m01_couplers_to_axi_interconnect_0_WSTRB;
  assign M01_AXI_wvalid = m01_couplers_to_axi_interconnect_0_WVALID;
  assign M02_ACLK_1 = M02_ACLK;
  assign M02_ARESETN_1 = M02_ARESETN;
  assign M02_AXI_araddr[11:0] = m02_couplers_to_axi_interconnect_0_ARADDR;
  assign M02_AXI_arprot[2:0] = m02_couplers_to_axi_interconnect_0_ARPROT;
  assign M02_AXI_arvalid = m02_couplers_to_axi_interconnect_0_ARVALID;
  assign M02_AXI_awaddr[11:0] = m02_couplers_to_axi_interconnect_0_AWADDR;
  assign M02_AXI_awprot[2:0] = m02_couplers_to_axi_interconnect_0_AWPROT;
  assign M02_AXI_awvalid = m02_couplers_to_axi_interconnect_0_AWVALID;
  assign M02_AXI_bready = m02_couplers_to_axi_interconnect_0_BREADY;
  assign M02_AXI_rready = m02_couplers_to_axi_interconnect_0_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_axi_interconnect_0_WDATA;
  assign M02_AXI_wstrb[3:0] = m02_couplers_to_axi_interconnect_0_WSTRB;
  assign M02_AXI_wvalid = m02_couplers_to_axi_interconnect_0_WVALID;
  assign M03_ACLK_1 = M03_ACLK;
  assign M03_ARESETN_1 = M03_ARESETN;
  assign M03_AXI_araddr[11:0] = m03_couplers_to_axi_interconnect_0_ARADDR;
  assign M03_AXI_arprot[2:0] = m03_couplers_to_axi_interconnect_0_ARPROT;
  assign M03_AXI_arvalid = m03_couplers_to_axi_interconnect_0_ARVALID;
  assign M03_AXI_awaddr[11:0] = m03_couplers_to_axi_interconnect_0_AWADDR;
  assign M03_AXI_awprot[2:0] = m03_couplers_to_axi_interconnect_0_AWPROT;
  assign M03_AXI_awvalid = m03_couplers_to_axi_interconnect_0_AWVALID;
  assign M03_AXI_bready = m03_couplers_to_axi_interconnect_0_BREADY;
  assign M03_AXI_rready = m03_couplers_to_axi_interconnect_0_RREADY;
  assign M03_AXI_wdata[31:0] = m03_couplers_to_axi_interconnect_0_WDATA;
  assign M03_AXI_wstrb[3:0] = m03_couplers_to_axi_interconnect_0_WSTRB;
  assign M03_AXI_wvalid = m03_couplers_to_axi_interconnect_0_WVALID;
  assign M04_ACLK_1 = M04_ACLK;
  assign M04_ARESETN_1 = M04_ARESETN;
  assign M04_AXI_araddr[11:0] = m04_couplers_to_axi_interconnect_0_ARADDR;
  assign M04_AXI_arprot[2:0] = m04_couplers_to_axi_interconnect_0_ARPROT;
  assign M04_AXI_arvalid = m04_couplers_to_axi_interconnect_0_ARVALID;
  assign M04_AXI_awaddr[11:0] = m04_couplers_to_axi_interconnect_0_AWADDR;
  assign M04_AXI_awprot[2:0] = m04_couplers_to_axi_interconnect_0_AWPROT;
  assign M04_AXI_awvalid = m04_couplers_to_axi_interconnect_0_AWVALID;
  assign M04_AXI_bready = m04_couplers_to_axi_interconnect_0_BREADY;
  assign M04_AXI_rready = m04_couplers_to_axi_interconnect_0_RREADY;
  assign M04_AXI_wdata[31:0] = m04_couplers_to_axi_interconnect_0_WDATA;
  assign M04_AXI_wstrb[3:0] = m04_couplers_to_axi_interconnect_0_WSTRB;
  assign M04_AXI_wvalid = m04_couplers_to_axi_interconnect_0_WVALID;
  assign M05_ACLK_1 = M05_ACLK;
  assign M05_ARESETN_1 = M05_ARESETN;
  assign M05_AXI_araddr[11:0] = m05_couplers_to_axi_interconnect_0_ARADDR;
  assign M05_AXI_arprot[2:0] = m05_couplers_to_axi_interconnect_0_ARPROT;
  assign M05_AXI_arvalid = m05_couplers_to_axi_interconnect_0_ARVALID;
  assign M05_AXI_awaddr[11:0] = m05_couplers_to_axi_interconnect_0_AWADDR;
  assign M05_AXI_awprot[2:0] = m05_couplers_to_axi_interconnect_0_AWPROT;
  assign M05_AXI_awvalid = m05_couplers_to_axi_interconnect_0_AWVALID;
  assign M05_AXI_bready = m05_couplers_to_axi_interconnect_0_BREADY;
  assign M05_AXI_rready = m05_couplers_to_axi_interconnect_0_RREADY;
  assign M05_AXI_wdata[31:0] = m05_couplers_to_axi_interconnect_0_WDATA;
  assign M05_AXI_wstrb[3:0] = m05_couplers_to_axi_interconnect_0_WSTRB;
  assign M05_AXI_wvalid = m05_couplers_to_axi_interconnect_0_WVALID;
  assign M06_ACLK_1 = M06_ACLK;
  assign M06_ARESETN_1 = M06_ARESETN;
  assign M06_AXI_araddr[11:0] = m06_couplers_to_axi_interconnect_0_ARADDR;
  assign M06_AXI_arprot[2:0] = m06_couplers_to_axi_interconnect_0_ARPROT;
  assign M06_AXI_arvalid = m06_couplers_to_axi_interconnect_0_ARVALID;
  assign M06_AXI_awaddr[11:0] = m06_couplers_to_axi_interconnect_0_AWADDR;
  assign M06_AXI_awprot[2:0] = m06_couplers_to_axi_interconnect_0_AWPROT;
  assign M06_AXI_awvalid = m06_couplers_to_axi_interconnect_0_AWVALID;
  assign M06_AXI_bready = m06_couplers_to_axi_interconnect_0_BREADY;
  assign M06_AXI_rready = m06_couplers_to_axi_interconnect_0_RREADY;
  assign M06_AXI_wdata[31:0] = m06_couplers_to_axi_interconnect_0_WDATA;
  assign M06_AXI_wstrb[3:0] = m06_couplers_to_axi_interconnect_0_WSTRB;
  assign M06_AXI_wvalid = m06_couplers_to_axi_interconnect_0_WVALID;
  assign M07_ACLK_1 = M07_ACLK;
  assign M07_ARESETN_1 = M07_ARESETN;
  assign M07_AXI_araddr[11:0] = m07_couplers_to_axi_interconnect_0_ARADDR;
  assign M07_AXI_arprot[2:0] = m07_couplers_to_axi_interconnect_0_ARPROT;
  assign M07_AXI_arvalid = m07_couplers_to_axi_interconnect_0_ARVALID;
  assign M07_AXI_awaddr[11:0] = m07_couplers_to_axi_interconnect_0_AWADDR;
  assign M07_AXI_awprot[2:0] = m07_couplers_to_axi_interconnect_0_AWPROT;
  assign M07_AXI_awvalid = m07_couplers_to_axi_interconnect_0_AWVALID;
  assign M07_AXI_bready = m07_couplers_to_axi_interconnect_0_BREADY;
  assign M07_AXI_rready = m07_couplers_to_axi_interconnect_0_RREADY;
  assign M07_AXI_wdata[31:0] = m07_couplers_to_axi_interconnect_0_WDATA;
  assign M07_AXI_wstrb[3:0] = m07_couplers_to_axi_interconnect_0_WSTRB;
  assign M07_AXI_wvalid = m07_couplers_to_axi_interconnect_0_WVALID;
  assign M08_ACLK_1 = M08_ACLK;
  assign M08_ARESETN_1 = M08_ARESETN;
  assign M08_AXI_araddr[11:0] = m08_couplers_to_axi_interconnect_0_ARADDR;
  assign M08_AXI_arprot[2:0] = m08_couplers_to_axi_interconnect_0_ARPROT;
  assign M08_AXI_arvalid = m08_couplers_to_axi_interconnect_0_ARVALID;
  assign M08_AXI_awaddr[11:0] = m08_couplers_to_axi_interconnect_0_AWADDR;
  assign M08_AXI_awprot[2:0] = m08_couplers_to_axi_interconnect_0_AWPROT;
  assign M08_AXI_awvalid = m08_couplers_to_axi_interconnect_0_AWVALID;
  assign M08_AXI_bready = m08_couplers_to_axi_interconnect_0_BREADY;
  assign M08_AXI_rready = m08_couplers_to_axi_interconnect_0_RREADY;
  assign M08_AXI_wdata[31:0] = m08_couplers_to_axi_interconnect_0_WDATA;
  assign M08_AXI_wstrb[3:0] = m08_couplers_to_axi_interconnect_0_WSTRB;
  assign M08_AXI_wvalid = m08_couplers_to_axi_interconnect_0_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready = axi_interconnect_0_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = axi_interconnect_0_to_s00_couplers_AWREADY;
  assign S00_AXI_bresp[1:0] = axi_interconnect_0_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = axi_interconnect_0_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = axi_interconnect_0_to_s00_couplers_RDATA;
  assign S00_AXI_rresp[1:0] = axi_interconnect_0_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_interconnect_0_to_s00_couplers_RVALID;
  assign S00_AXI_wready = axi_interconnect_0_to_s00_couplers_WREADY;
  assign axi_interconnect_0_ACLK_net = ACLK;
  assign axi_interconnect_0_ARESETN_net = ARESETN;
  assign axi_interconnect_0_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_interconnect_0_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_interconnect_0_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_interconnect_0_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign axi_interconnect_0_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_interconnect_0_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign axi_interconnect_0_to_s00_couplers_BREADY = S00_AXI_bready;
  assign axi_interconnect_0_to_s00_couplers_RREADY = S00_AXI_rready;
  assign axi_interconnect_0_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign axi_interconnect_0_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign axi_interconnect_0_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign m00_couplers_to_axi_interconnect_0_ARREADY = M00_AXI_arready;
  assign m00_couplers_to_axi_interconnect_0_AWREADY = M00_AXI_awready;
  assign m00_couplers_to_axi_interconnect_0_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_axi_interconnect_0_BVALID = M00_AXI_bvalid;
  assign m00_couplers_to_axi_interconnect_0_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_axi_interconnect_0_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_axi_interconnect_0_RVALID = M00_AXI_rvalid;
  assign m00_couplers_to_axi_interconnect_0_WREADY = M00_AXI_wready;
  assign m01_couplers_to_axi_interconnect_0_ARREADY = M01_AXI_arready;
  assign m01_couplers_to_axi_interconnect_0_AWREADY = M01_AXI_awready;
  assign m01_couplers_to_axi_interconnect_0_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_axi_interconnect_0_BVALID = M01_AXI_bvalid;
  assign m01_couplers_to_axi_interconnect_0_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_axi_interconnect_0_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_axi_interconnect_0_RVALID = M01_AXI_rvalid;
  assign m01_couplers_to_axi_interconnect_0_WREADY = M01_AXI_wready;
  assign m02_couplers_to_axi_interconnect_0_ARREADY = M02_AXI_arready;
  assign m02_couplers_to_axi_interconnect_0_AWREADY = M02_AXI_awready;
  assign m02_couplers_to_axi_interconnect_0_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_axi_interconnect_0_BVALID = M02_AXI_bvalid;
  assign m02_couplers_to_axi_interconnect_0_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_axi_interconnect_0_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_axi_interconnect_0_RVALID = M02_AXI_rvalid;
  assign m02_couplers_to_axi_interconnect_0_WREADY = M02_AXI_wready;
  assign m03_couplers_to_axi_interconnect_0_ARREADY = M03_AXI_arready;
  assign m03_couplers_to_axi_interconnect_0_AWREADY = M03_AXI_awready;
  assign m03_couplers_to_axi_interconnect_0_BRESP = M03_AXI_bresp[1:0];
  assign m03_couplers_to_axi_interconnect_0_BVALID = M03_AXI_bvalid;
  assign m03_couplers_to_axi_interconnect_0_RDATA = M03_AXI_rdata[31:0];
  assign m03_couplers_to_axi_interconnect_0_RRESP = M03_AXI_rresp[1:0];
  assign m03_couplers_to_axi_interconnect_0_RVALID = M03_AXI_rvalid;
  assign m03_couplers_to_axi_interconnect_0_WREADY = M03_AXI_wready;
  assign m04_couplers_to_axi_interconnect_0_ARREADY = M04_AXI_arready;
  assign m04_couplers_to_axi_interconnect_0_AWREADY = M04_AXI_awready;
  assign m04_couplers_to_axi_interconnect_0_BRESP = M04_AXI_bresp[1:0];
  assign m04_couplers_to_axi_interconnect_0_BVALID = M04_AXI_bvalid;
  assign m04_couplers_to_axi_interconnect_0_RDATA = M04_AXI_rdata[31:0];
  assign m04_couplers_to_axi_interconnect_0_RRESP = M04_AXI_rresp[1:0];
  assign m04_couplers_to_axi_interconnect_0_RVALID = M04_AXI_rvalid;
  assign m04_couplers_to_axi_interconnect_0_WREADY = M04_AXI_wready;
  assign m05_couplers_to_axi_interconnect_0_ARREADY = M05_AXI_arready;
  assign m05_couplers_to_axi_interconnect_0_AWREADY = M05_AXI_awready;
  assign m05_couplers_to_axi_interconnect_0_BRESP = M05_AXI_bresp[1:0];
  assign m05_couplers_to_axi_interconnect_0_BVALID = M05_AXI_bvalid;
  assign m05_couplers_to_axi_interconnect_0_RDATA = M05_AXI_rdata[31:0];
  assign m05_couplers_to_axi_interconnect_0_RRESP = M05_AXI_rresp[1:0];
  assign m05_couplers_to_axi_interconnect_0_RVALID = M05_AXI_rvalid;
  assign m05_couplers_to_axi_interconnect_0_WREADY = M05_AXI_wready;
  assign m06_couplers_to_axi_interconnect_0_ARREADY = M06_AXI_arready;
  assign m06_couplers_to_axi_interconnect_0_AWREADY = M06_AXI_awready;
  assign m06_couplers_to_axi_interconnect_0_BRESP = M06_AXI_bresp[1:0];
  assign m06_couplers_to_axi_interconnect_0_BVALID = M06_AXI_bvalid;
  assign m06_couplers_to_axi_interconnect_0_RDATA = M06_AXI_rdata[31:0];
  assign m06_couplers_to_axi_interconnect_0_RRESP = M06_AXI_rresp[1:0];
  assign m06_couplers_to_axi_interconnect_0_RVALID = M06_AXI_rvalid;
  assign m06_couplers_to_axi_interconnect_0_WREADY = M06_AXI_wready;
  assign m07_couplers_to_axi_interconnect_0_ARREADY = M07_AXI_arready;
  assign m07_couplers_to_axi_interconnect_0_AWREADY = M07_AXI_awready;
  assign m07_couplers_to_axi_interconnect_0_BRESP = M07_AXI_bresp[1:0];
  assign m07_couplers_to_axi_interconnect_0_BVALID = M07_AXI_bvalid;
  assign m07_couplers_to_axi_interconnect_0_RDATA = M07_AXI_rdata[31:0];
  assign m07_couplers_to_axi_interconnect_0_RRESP = M07_AXI_rresp[1:0];
  assign m07_couplers_to_axi_interconnect_0_RVALID = M07_AXI_rvalid;
  assign m07_couplers_to_axi_interconnect_0_WREADY = M07_AXI_wready;
  assign m08_couplers_to_axi_interconnect_0_ARREADY = M08_AXI_arready;
  assign m08_couplers_to_axi_interconnect_0_AWREADY = M08_AXI_awready;
  assign m08_couplers_to_axi_interconnect_0_BRESP = M08_AXI_bresp[1:0];
  assign m08_couplers_to_axi_interconnect_0_BVALID = M08_AXI_bvalid;
  assign m08_couplers_to_axi_interconnect_0_RDATA = M08_AXI_rdata[31:0];
  assign m08_couplers_to_axi_interconnect_0_RRESP = M08_AXI_rresp[1:0];
  assign m08_couplers_to_axi_interconnect_0_RVALID = M08_AXI_rvalid;
  assign m08_couplers_to_axi_interconnect_0_WREADY = M08_AXI_wready;
  m00_couplers_imp_1CKXUZB m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arprot(m00_couplers_to_axi_interconnect_0_ARPROT),
        .M_AXI_arready(m00_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awprot(m00_couplers_to_axi_interconnect_0_AWPROT),
        .M_AXI_awready(m00_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m00_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m00_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m00_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m00_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m00_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m00_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m00_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m00_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m00_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m00_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m00_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m00_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_DJHRIH m01_couplers
       (.M_ACLK(M01_ACLK_1),
        .M_ARESETN(M01_ARESETN_1),
        .M_AXI_araddr(m01_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arprot(m01_couplers_to_axi_interconnect_0_ARPROT),
        .M_AXI_arready(m01_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awprot(m01_couplers_to_axi_interconnect_0_AWPROT),
        .M_AXI_awready(m01_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m01_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m01_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m01_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m01_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m01_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m01_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m01_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m01_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m01_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m01_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m01_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m01_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m01_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_L1EJCA m02_couplers
       (.M_ACLK(M02_ACLK_1),
        .M_ARESETN(M02_ARESETN_1),
        .M_AXI_araddr(m02_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arprot(m02_couplers_to_axi_interconnect_0_ARPROT),
        .M_AXI_arready(m02_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awprot(m02_couplers_to_axi_interconnect_0_AWPROT),
        .M_AXI_awready(m02_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m02_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m02_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m02_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m02_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m02_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m02_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m02_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m02_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m02_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m02_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m02_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m02_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m02_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m02_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  m03_couplers_imp_1MTZV90 m03_couplers
       (.M_ACLK(M03_ACLK_1),
        .M_ARESETN(M03_ARESETN_1),
        .M_AXI_araddr(m03_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arprot(m03_couplers_to_axi_interconnect_0_ARPROT),
        .M_AXI_arready(m03_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m03_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m03_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awprot(m03_couplers_to_axi_interconnect_0_AWPROT),
        .M_AXI_awready(m03_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m03_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m03_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m03_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m03_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m03_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m03_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m03_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m03_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m03_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m03_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m03_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m03_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m03_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m03_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m03_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m03_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m03_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m03_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m03_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m03_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m03_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m03_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m03_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m03_couplers_RDATA),
        .S_AXI_rready(xbar_to_m03_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m03_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m03_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m03_couplers_WDATA),
        .S_AXI_wready(xbar_to_m03_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m03_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m03_couplers_WVALID));
  m04_couplers_imp_1GP65RG m04_couplers
       (.M_ACLK(M04_ACLK_1),
        .M_ARESETN(M04_ARESETN_1),
        .M_AXI_araddr(m04_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arprot(m04_couplers_to_axi_interconnect_0_ARPROT),
        .M_AXI_arready(m04_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m04_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m04_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awprot(m04_couplers_to_axi_interconnect_0_AWPROT),
        .M_AXI_awready(m04_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m04_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m04_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m04_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m04_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m04_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m04_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m04_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m04_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m04_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m04_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m04_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m04_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m04_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m04_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m04_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m04_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m04_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m04_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m04_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m04_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m04_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m04_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m04_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m04_couplers_RDATA),
        .S_AXI_rready(xbar_to_m04_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m04_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m04_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m04_couplers_WDATA),
        .S_AXI_wready(xbar_to_m04_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m04_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m04_couplers_WVALID));
  m05_couplers_imp_9HOIEQ m05_couplers
       (.M_ACLK(M05_ACLK_1),
        .M_ARESETN(M05_ARESETN_1),
        .M_AXI_araddr(m05_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arprot(m05_couplers_to_axi_interconnect_0_ARPROT),
        .M_AXI_arready(m05_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m05_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m05_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awprot(m05_couplers_to_axi_interconnect_0_AWPROT),
        .M_AXI_awready(m05_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m05_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m05_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m05_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m05_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m05_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m05_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m05_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m05_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m05_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m05_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m05_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m05_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m05_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m05_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m05_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m05_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m05_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m05_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m05_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m05_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m05_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m05_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m05_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m05_couplers_RDATA),
        .S_AXI_rready(xbar_to_m05_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m05_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m05_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m05_couplers_WDATA),
        .S_AXI_wready(xbar_to_m05_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m05_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m05_couplers_WVALID));
  m06_couplers_imp_OQNG0H m06_couplers
       (.M_ACLK(M06_ACLK_1),
        .M_ARESETN(M06_ARESETN_1),
        .M_AXI_araddr(m06_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arprot(m06_couplers_to_axi_interconnect_0_ARPROT),
        .M_AXI_arready(m06_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m06_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m06_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awprot(m06_couplers_to_axi_interconnect_0_AWPROT),
        .M_AXI_awready(m06_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m06_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m06_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m06_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m06_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m06_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m06_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m06_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m06_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m06_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m06_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m06_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m06_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m06_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m06_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m06_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m06_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m06_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m06_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m06_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m06_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m06_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m06_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m06_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m06_couplers_RDATA),
        .S_AXI_rready(xbar_to_m06_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m06_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m06_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m06_couplers_WDATA),
        .S_AXI_wready(xbar_to_m06_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m06_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m06_couplers_WVALID));
  m07_couplers_imp_1J7605R m07_couplers
       (.M_ACLK(M07_ACLK_1),
        .M_ARESETN(M07_ARESETN_1),
        .M_AXI_araddr(m07_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arprot(m07_couplers_to_axi_interconnect_0_ARPROT),
        .M_AXI_arready(m07_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m07_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m07_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awprot(m07_couplers_to_axi_interconnect_0_AWPROT),
        .M_AXI_awready(m07_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m07_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m07_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m07_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m07_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m07_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m07_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m07_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m07_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m07_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m07_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m07_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m07_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m07_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m07_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m07_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m07_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m07_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m07_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m07_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m07_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m07_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m07_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m07_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m07_couplers_RDATA),
        .S_AXI_rready(xbar_to_m07_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m07_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m07_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m07_couplers_WDATA),
        .S_AXI_wready(xbar_to_m07_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m07_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m07_couplers_WVALID));
  m08_couplers_imp_12JE735 m08_couplers
       (.M_ACLK(M08_ACLK_1),
        .M_ARESETN(M08_ARESETN_1),
        .M_AXI_araddr(m08_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arprot(m08_couplers_to_axi_interconnect_0_ARPROT),
        .M_AXI_arready(m08_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arvalid(m08_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(m08_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awprot(m08_couplers_to_axi_interconnect_0_AWPROT),
        .M_AXI_awready(m08_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awvalid(m08_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bready(m08_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(m08_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(m08_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(m08_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rready(m08_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(m08_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(m08_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(m08_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wready(m08_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(m08_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(m08_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(axi_interconnect_0_ACLK_net),
        .S_ARESETN(axi_interconnect_0_ARESETN_net),
        .S_AXI_araddr(xbar_to_m08_couplers_ARADDR),
        .S_AXI_arprot(xbar_to_m08_couplers_ARPROT),
        .S_AXI_arready(xbar_to_m08_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m08_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m08_couplers_AWADDR),
        .S_AXI_awprot(xbar_to_m08_couplers_AWPROT),
        .S_AXI_awready(xbar_to_m08_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m08_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m08_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m08_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m08_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m08_couplers_RDATA),
        .S_AXI_rready(xbar_to_m08_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m08_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m08_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m08_couplers_WDATA),
        .S_AXI_wready(xbar_to_m08_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m08_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m08_couplers_WVALID));
  s00_couplers_imp_IM4VT3 s00_couplers
       (.M_ACLK(axi_interconnect_0_ACLK_net),
        .M_ARESETN(axi_interconnect_0_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(axi_interconnect_0_to_s00_couplers_ARADDR),
        .S_AXI_arprot(axi_interconnect_0_to_s00_couplers_ARPROT),
        .S_AXI_arready(axi_interconnect_0_to_s00_couplers_ARREADY),
        .S_AXI_arvalid(axi_interconnect_0_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(axi_interconnect_0_to_s00_couplers_AWADDR),
        .S_AXI_awprot(axi_interconnect_0_to_s00_couplers_AWPROT),
        .S_AXI_awready(axi_interconnect_0_to_s00_couplers_AWREADY),
        .S_AXI_awvalid(axi_interconnect_0_to_s00_couplers_AWVALID),
        .S_AXI_bready(axi_interconnect_0_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_interconnect_0_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_interconnect_0_to_s00_couplers_BVALID),
        .S_AXI_rdata(axi_interconnect_0_to_s00_couplers_RDATA),
        .S_AXI_rready(axi_interconnect_0_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_interconnect_0_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_interconnect_0_to_s00_couplers_RVALID),
        .S_AXI_wdata(axi_interconnect_0_to_s00_couplers_WDATA),
        .S_AXI_wready(axi_interconnect_0_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_interconnect_0_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_interconnect_0_to_s00_couplers_WVALID));
  control_sub_xbar_0 xbar
       (.aclk(axi_interconnect_0_ACLK_net),
        .aresetn(axi_interconnect_0_ARESETN_net),
        .m_axi_araddr({xbar_to_m08_couplers_ARADDR,xbar_to_m07_couplers_ARADDR,xbar_to_m06_couplers_ARADDR,xbar_to_m05_couplers_ARADDR,xbar_to_m04_couplers_ARADDR,xbar_to_m03_couplers_ARADDR,xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arprot({xbar_to_m08_couplers_ARPROT,xbar_to_m07_couplers_ARPROT,xbar_to_m06_couplers_ARPROT,xbar_to_m05_couplers_ARPROT,xbar_to_m04_couplers_ARPROT,xbar_to_m03_couplers_ARPROT,xbar_to_m02_couplers_ARPROT,xbar_to_m01_couplers_ARPROT,xbar_to_m00_couplers_ARPROT}),
        .m_axi_arready({xbar_to_m08_couplers_ARREADY,xbar_to_m07_couplers_ARREADY,xbar_to_m06_couplers_ARREADY,xbar_to_m05_couplers_ARREADY,xbar_to_m04_couplers_ARREADY,xbar_to_m03_couplers_ARREADY,xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m08_couplers_ARVALID,xbar_to_m07_couplers_ARVALID,xbar_to_m06_couplers_ARVALID,xbar_to_m05_couplers_ARVALID,xbar_to_m04_couplers_ARVALID,xbar_to_m03_couplers_ARVALID,xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m08_couplers_AWADDR,xbar_to_m07_couplers_AWADDR,xbar_to_m06_couplers_AWADDR,xbar_to_m05_couplers_AWADDR,xbar_to_m04_couplers_AWADDR,xbar_to_m03_couplers_AWADDR,xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awprot({xbar_to_m08_couplers_AWPROT,xbar_to_m07_couplers_AWPROT,xbar_to_m06_couplers_AWPROT,xbar_to_m05_couplers_AWPROT,xbar_to_m04_couplers_AWPROT,xbar_to_m03_couplers_AWPROT,xbar_to_m02_couplers_AWPROT,xbar_to_m01_couplers_AWPROT,xbar_to_m00_couplers_AWPROT}),
        .m_axi_awready({xbar_to_m08_couplers_AWREADY,xbar_to_m07_couplers_AWREADY,xbar_to_m06_couplers_AWREADY,xbar_to_m05_couplers_AWREADY,xbar_to_m04_couplers_AWREADY,xbar_to_m03_couplers_AWREADY,xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m08_couplers_AWVALID,xbar_to_m07_couplers_AWVALID,xbar_to_m06_couplers_AWVALID,xbar_to_m05_couplers_AWVALID,xbar_to_m04_couplers_AWVALID,xbar_to_m03_couplers_AWVALID,xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m08_couplers_BREADY,xbar_to_m07_couplers_BREADY,xbar_to_m06_couplers_BREADY,xbar_to_m05_couplers_BREADY,xbar_to_m04_couplers_BREADY,xbar_to_m03_couplers_BREADY,xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m08_couplers_BRESP,xbar_to_m07_couplers_BRESP,xbar_to_m06_couplers_BRESP,xbar_to_m05_couplers_BRESP,xbar_to_m04_couplers_BRESP,xbar_to_m03_couplers_BRESP,xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m08_couplers_BVALID,xbar_to_m07_couplers_BVALID,xbar_to_m06_couplers_BVALID,xbar_to_m05_couplers_BVALID,xbar_to_m04_couplers_BVALID,xbar_to_m03_couplers_BVALID,xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m08_couplers_RDATA,xbar_to_m07_couplers_RDATA,xbar_to_m06_couplers_RDATA,xbar_to_m05_couplers_RDATA,xbar_to_m04_couplers_RDATA,xbar_to_m03_couplers_RDATA,xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m08_couplers_RREADY,xbar_to_m07_couplers_RREADY,xbar_to_m06_couplers_RREADY,xbar_to_m05_couplers_RREADY,xbar_to_m04_couplers_RREADY,xbar_to_m03_couplers_RREADY,xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m08_couplers_RRESP,xbar_to_m07_couplers_RRESP,xbar_to_m06_couplers_RRESP,xbar_to_m05_couplers_RRESP,xbar_to_m04_couplers_RRESP,xbar_to_m03_couplers_RRESP,xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m08_couplers_RVALID,xbar_to_m07_couplers_RVALID,xbar_to_m06_couplers_RVALID,xbar_to_m05_couplers_RVALID,xbar_to_m04_couplers_RVALID,xbar_to_m03_couplers_RVALID,xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m08_couplers_WDATA,xbar_to_m07_couplers_WDATA,xbar_to_m06_couplers_WDATA,xbar_to_m05_couplers_WDATA,xbar_to_m04_couplers_WDATA,xbar_to_m03_couplers_WDATA,xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m08_couplers_WREADY,xbar_to_m07_couplers_WREADY,xbar_to_m06_couplers_WREADY,xbar_to_m05_couplers_WREADY,xbar_to_m04_couplers_WREADY,xbar_to_m03_couplers_WREADY,xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m08_couplers_WSTRB,xbar_to_m07_couplers_WSTRB,xbar_to_m06_couplers_WSTRB,xbar_to_m05_couplers_WSTRB,xbar_to_m04_couplers_WSTRB,xbar_to_m03_couplers_WSTRB,xbar_to_m02_couplers_WSTRB,xbar_to_m01_couplers_WSTRB,xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m08_couplers_WVALID,xbar_to_m07_couplers_WVALID,xbar_to_m06_couplers_WVALID,xbar_to_m05_couplers_WVALID,xbar_to_m04_couplers_WVALID,xbar_to_m03_couplers_WVALID,xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module control_sub_microblaze_0_axi_periph_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  input [0:0]M00_AXI_arready;
  output [0:0]M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  input [0:0]M00_AXI_awready;
  output [0:0]M00_AXI_awvalid;
  output [0:0]M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input [0:0]M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output [0:0]M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input [0:0]M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input [0:0]M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output [0:0]M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [31:0]M01_AXI_araddr;
  input [0:0]M01_AXI_arready;
  output [0:0]M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  input [0:0]M01_AXI_awready;
  output [0:0]M01_AXI_awvalid;
  output [0:0]M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input [0:0]M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output [0:0]M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input [0:0]M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input [0:0]M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output [0:0]M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [31:0]M02_AXI_araddr;
  input [0:0]M02_AXI_arready;
  output [0:0]M02_AXI_arvalid;
  output [31:0]M02_AXI_awaddr;
  input [0:0]M02_AXI_awready;
  output [0:0]M02_AXI_awvalid;
  output [0:0]M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input [0:0]M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output [0:0]M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input [0:0]M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input [0:0]M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output [0:0]M02_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [2:0]S00_AXI_arprot;
  output [0:0]S00_AXI_arready;
  input [0:0]S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [2:0]S00_AXI_awprot;
  output [0:0]S00_AXI_awready;
  input [0:0]S00_AXI_awvalid;
  input [0:0]S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output [0:0]S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  input [0:0]S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output [0:0]S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  output [0:0]S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input [0:0]S00_AXI_wvalid;

  wire M00_ACLK_1;
  wire M00_ARESETN_1;
  wire M01_ACLK_1;
  wire M01_ARESETN_1;
  wire M02_ACLK_1;
  wire M02_ARESETN_1;
  wire S00_ACLK_1;
  wire S00_ARESETN_1;
  wire [31:0]m00_couplers_to_microblaze_0_axi_periph_ARADDR;
  wire [0:0]m00_couplers_to_microblaze_0_axi_periph_ARREADY;
  wire [0:0]m00_couplers_to_microblaze_0_axi_periph_ARVALID;
  wire [31:0]m00_couplers_to_microblaze_0_axi_periph_AWADDR;
  wire [0:0]m00_couplers_to_microblaze_0_axi_periph_AWREADY;
  wire [0:0]m00_couplers_to_microblaze_0_axi_periph_AWVALID;
  wire [0:0]m00_couplers_to_microblaze_0_axi_periph_BREADY;
  wire [1:0]m00_couplers_to_microblaze_0_axi_periph_BRESP;
  wire [0:0]m00_couplers_to_microblaze_0_axi_periph_BVALID;
  wire [31:0]m00_couplers_to_microblaze_0_axi_periph_RDATA;
  wire [0:0]m00_couplers_to_microblaze_0_axi_periph_RREADY;
  wire [1:0]m00_couplers_to_microblaze_0_axi_periph_RRESP;
  wire [0:0]m00_couplers_to_microblaze_0_axi_periph_RVALID;
  wire [31:0]m00_couplers_to_microblaze_0_axi_periph_WDATA;
  wire [0:0]m00_couplers_to_microblaze_0_axi_periph_WREADY;
  wire [3:0]m00_couplers_to_microblaze_0_axi_periph_WSTRB;
  wire [0:0]m00_couplers_to_microblaze_0_axi_periph_WVALID;
  wire [31:0]m01_couplers_to_microblaze_0_axi_periph_ARADDR;
  wire [0:0]m01_couplers_to_microblaze_0_axi_periph_ARREADY;
  wire [0:0]m01_couplers_to_microblaze_0_axi_periph_ARVALID;
  wire [31:0]m01_couplers_to_microblaze_0_axi_periph_AWADDR;
  wire [0:0]m01_couplers_to_microblaze_0_axi_periph_AWREADY;
  wire [0:0]m01_couplers_to_microblaze_0_axi_periph_AWVALID;
  wire [0:0]m01_couplers_to_microblaze_0_axi_periph_BREADY;
  wire [1:0]m01_couplers_to_microblaze_0_axi_periph_BRESP;
  wire [0:0]m01_couplers_to_microblaze_0_axi_periph_BVALID;
  wire [31:0]m01_couplers_to_microblaze_0_axi_periph_RDATA;
  wire [0:0]m01_couplers_to_microblaze_0_axi_periph_RREADY;
  wire [1:0]m01_couplers_to_microblaze_0_axi_periph_RRESP;
  wire [0:0]m01_couplers_to_microblaze_0_axi_periph_RVALID;
  wire [31:0]m01_couplers_to_microblaze_0_axi_periph_WDATA;
  wire [0:0]m01_couplers_to_microblaze_0_axi_periph_WREADY;
  wire [3:0]m01_couplers_to_microblaze_0_axi_periph_WSTRB;
  wire [0:0]m01_couplers_to_microblaze_0_axi_periph_WVALID;
  wire [31:0]m02_couplers_to_microblaze_0_axi_periph_ARADDR;
  wire [0:0]m02_couplers_to_microblaze_0_axi_periph_ARREADY;
  wire [0:0]m02_couplers_to_microblaze_0_axi_periph_ARVALID;
  wire [31:0]m02_couplers_to_microblaze_0_axi_periph_AWADDR;
  wire [0:0]m02_couplers_to_microblaze_0_axi_periph_AWREADY;
  wire [0:0]m02_couplers_to_microblaze_0_axi_periph_AWVALID;
  wire [0:0]m02_couplers_to_microblaze_0_axi_periph_BREADY;
  wire [1:0]m02_couplers_to_microblaze_0_axi_periph_BRESP;
  wire [0:0]m02_couplers_to_microblaze_0_axi_periph_BVALID;
  wire [31:0]m02_couplers_to_microblaze_0_axi_periph_RDATA;
  wire [0:0]m02_couplers_to_microblaze_0_axi_periph_RREADY;
  wire [1:0]m02_couplers_to_microblaze_0_axi_periph_RRESP;
  wire [0:0]m02_couplers_to_microblaze_0_axi_periph_RVALID;
  wire [31:0]m02_couplers_to_microblaze_0_axi_periph_WDATA;
  wire [0:0]m02_couplers_to_microblaze_0_axi_periph_WREADY;
  wire [3:0]m02_couplers_to_microblaze_0_axi_periph_WSTRB;
  wire [0:0]m02_couplers_to_microblaze_0_axi_periph_WVALID;
  wire microblaze_0_axi_periph_ACLK_net;
  wire microblaze_0_axi_periph_ARESETN_net;
  wire [31:0]microblaze_0_axi_periph_to_s00_couplers_ARADDR;
  wire [2:0]microblaze_0_axi_periph_to_s00_couplers_ARPROT;
  wire [0:0]microblaze_0_axi_periph_to_s00_couplers_ARREADY;
  wire [0:0]microblaze_0_axi_periph_to_s00_couplers_ARVALID;
  wire [31:0]microblaze_0_axi_periph_to_s00_couplers_AWADDR;
  wire [2:0]microblaze_0_axi_periph_to_s00_couplers_AWPROT;
  wire [0:0]microblaze_0_axi_periph_to_s00_couplers_AWREADY;
  wire [0:0]microblaze_0_axi_periph_to_s00_couplers_AWVALID;
  wire [0:0]microblaze_0_axi_periph_to_s00_couplers_BREADY;
  wire [1:0]microblaze_0_axi_periph_to_s00_couplers_BRESP;
  wire [0:0]microblaze_0_axi_periph_to_s00_couplers_BVALID;
  wire [31:0]microblaze_0_axi_periph_to_s00_couplers_RDATA;
  wire [0:0]microblaze_0_axi_periph_to_s00_couplers_RREADY;
  wire [1:0]microblaze_0_axi_periph_to_s00_couplers_RRESP;
  wire [0:0]microblaze_0_axi_periph_to_s00_couplers_RVALID;
  wire [31:0]microblaze_0_axi_periph_to_s00_couplers_WDATA;
  wire [0:0]microblaze_0_axi_periph_to_s00_couplers_WREADY;
  wire [3:0]microblaze_0_axi_periph_to_s00_couplers_WSTRB;
  wire [0:0]microblaze_0_axi_periph_to_s00_couplers_WVALID;
  wire [31:0]s00_couplers_to_xbar_ARADDR;
  wire [2:0]s00_couplers_to_xbar_ARPROT;
  wire [0:0]s00_couplers_to_xbar_ARREADY;
  wire [0:0]s00_couplers_to_xbar_ARVALID;
  wire [31:0]s00_couplers_to_xbar_AWADDR;
  wire [2:0]s00_couplers_to_xbar_AWPROT;
  wire [0:0]s00_couplers_to_xbar_AWREADY;
  wire [0:0]s00_couplers_to_xbar_AWVALID;
  wire [0:0]s00_couplers_to_xbar_BREADY;
  wire [1:0]s00_couplers_to_xbar_BRESP;
  wire [0:0]s00_couplers_to_xbar_BVALID;
  wire [31:0]s00_couplers_to_xbar_RDATA;
  wire [0:0]s00_couplers_to_xbar_RREADY;
  wire [1:0]s00_couplers_to_xbar_RRESP;
  wire [0:0]s00_couplers_to_xbar_RVALID;
  wire [31:0]s00_couplers_to_xbar_WDATA;
  wire [0:0]s00_couplers_to_xbar_WREADY;
  wire [3:0]s00_couplers_to_xbar_WSTRB;
  wire [0:0]s00_couplers_to_xbar_WVALID;
  wire [31:0]xbar_to_m00_couplers_ARADDR;
  wire [0:0]xbar_to_m00_couplers_ARREADY;
  wire [0:0]xbar_to_m00_couplers_ARVALID;
  wire [31:0]xbar_to_m00_couplers_AWADDR;
  wire [0:0]xbar_to_m00_couplers_AWREADY;
  wire [0:0]xbar_to_m00_couplers_AWVALID;
  wire [0:0]xbar_to_m00_couplers_BREADY;
  wire [1:0]xbar_to_m00_couplers_BRESP;
  wire [0:0]xbar_to_m00_couplers_BVALID;
  wire [31:0]xbar_to_m00_couplers_RDATA;
  wire [0:0]xbar_to_m00_couplers_RREADY;
  wire [1:0]xbar_to_m00_couplers_RRESP;
  wire [0:0]xbar_to_m00_couplers_RVALID;
  wire [31:0]xbar_to_m00_couplers_WDATA;
  wire [0:0]xbar_to_m00_couplers_WREADY;
  wire [3:0]xbar_to_m00_couplers_WSTRB;
  wire [0:0]xbar_to_m00_couplers_WVALID;
  wire [63:32]xbar_to_m01_couplers_ARADDR;
  wire [0:0]xbar_to_m01_couplers_ARREADY;
  wire [1:1]xbar_to_m01_couplers_ARVALID;
  wire [63:32]xbar_to_m01_couplers_AWADDR;
  wire [0:0]xbar_to_m01_couplers_AWREADY;
  wire [1:1]xbar_to_m01_couplers_AWVALID;
  wire [1:1]xbar_to_m01_couplers_BREADY;
  wire [1:0]xbar_to_m01_couplers_BRESP;
  wire [0:0]xbar_to_m01_couplers_BVALID;
  wire [31:0]xbar_to_m01_couplers_RDATA;
  wire [1:1]xbar_to_m01_couplers_RREADY;
  wire [1:0]xbar_to_m01_couplers_RRESP;
  wire [0:0]xbar_to_m01_couplers_RVALID;
  wire [63:32]xbar_to_m01_couplers_WDATA;
  wire [0:0]xbar_to_m01_couplers_WREADY;
  wire [7:4]xbar_to_m01_couplers_WSTRB;
  wire [1:1]xbar_to_m01_couplers_WVALID;
  wire [95:64]xbar_to_m02_couplers_ARADDR;
  wire [0:0]xbar_to_m02_couplers_ARREADY;
  wire [2:2]xbar_to_m02_couplers_ARVALID;
  wire [95:64]xbar_to_m02_couplers_AWADDR;
  wire [0:0]xbar_to_m02_couplers_AWREADY;
  wire [2:2]xbar_to_m02_couplers_AWVALID;
  wire [2:2]xbar_to_m02_couplers_BREADY;
  wire [1:0]xbar_to_m02_couplers_BRESP;
  wire [0:0]xbar_to_m02_couplers_BVALID;
  wire [31:0]xbar_to_m02_couplers_RDATA;
  wire [2:2]xbar_to_m02_couplers_RREADY;
  wire [1:0]xbar_to_m02_couplers_RRESP;
  wire [0:0]xbar_to_m02_couplers_RVALID;
  wire [95:64]xbar_to_m02_couplers_WDATA;
  wire [0:0]xbar_to_m02_couplers_WREADY;
  wire [11:8]xbar_to_m02_couplers_WSTRB;
  wire [2:2]xbar_to_m02_couplers_WVALID;

  assign M00_ACLK_1 = M00_ACLK;
  assign M00_ARESETN_1 = M00_ARESETN;
  assign M00_AXI_araddr[31:0] = m00_couplers_to_microblaze_0_axi_periph_ARADDR;
  assign M00_AXI_arvalid[0] = m00_couplers_to_microblaze_0_axi_periph_ARVALID;
  assign M00_AXI_awaddr[31:0] = m00_couplers_to_microblaze_0_axi_periph_AWADDR;
  assign M00_AXI_awvalid[0] = m00_couplers_to_microblaze_0_axi_periph_AWVALID;
  assign M00_AXI_bready[0] = m00_couplers_to_microblaze_0_axi_periph_BREADY;
  assign M00_AXI_rready[0] = m00_couplers_to_microblaze_0_axi_periph_RREADY;
  assign M00_AXI_wdata[31:0] = m00_couplers_to_microblaze_0_axi_periph_WDATA;
  assign M00_AXI_wstrb[3:0] = m00_couplers_to_microblaze_0_axi_periph_WSTRB;
  assign M00_AXI_wvalid[0] = m00_couplers_to_microblaze_0_axi_periph_WVALID;
  assign M01_ACLK_1 = M01_ACLK;
  assign M01_ARESETN_1 = M01_ARESETN;
  assign M01_AXI_araddr[31:0] = m01_couplers_to_microblaze_0_axi_periph_ARADDR;
  assign M01_AXI_arvalid[0] = m01_couplers_to_microblaze_0_axi_periph_ARVALID;
  assign M01_AXI_awaddr[31:0] = m01_couplers_to_microblaze_0_axi_periph_AWADDR;
  assign M01_AXI_awvalid[0] = m01_couplers_to_microblaze_0_axi_periph_AWVALID;
  assign M01_AXI_bready[0] = m01_couplers_to_microblaze_0_axi_periph_BREADY;
  assign M01_AXI_rready[0] = m01_couplers_to_microblaze_0_axi_periph_RREADY;
  assign M01_AXI_wdata[31:0] = m01_couplers_to_microblaze_0_axi_periph_WDATA;
  assign M01_AXI_wstrb[3:0] = m01_couplers_to_microblaze_0_axi_periph_WSTRB;
  assign M01_AXI_wvalid[0] = m01_couplers_to_microblaze_0_axi_periph_WVALID;
  assign M02_ACLK_1 = M02_ACLK;
  assign M02_ARESETN_1 = M02_ARESETN;
  assign M02_AXI_araddr[31:0] = m02_couplers_to_microblaze_0_axi_periph_ARADDR;
  assign M02_AXI_arvalid[0] = m02_couplers_to_microblaze_0_axi_periph_ARVALID;
  assign M02_AXI_awaddr[31:0] = m02_couplers_to_microblaze_0_axi_periph_AWADDR;
  assign M02_AXI_awvalid[0] = m02_couplers_to_microblaze_0_axi_periph_AWVALID;
  assign M02_AXI_bready[0] = m02_couplers_to_microblaze_0_axi_periph_BREADY;
  assign M02_AXI_rready[0] = m02_couplers_to_microblaze_0_axi_periph_RREADY;
  assign M02_AXI_wdata[31:0] = m02_couplers_to_microblaze_0_axi_periph_WDATA;
  assign M02_AXI_wstrb[3:0] = m02_couplers_to_microblaze_0_axi_periph_WSTRB;
  assign M02_AXI_wvalid[0] = m02_couplers_to_microblaze_0_axi_periph_WVALID;
  assign S00_ACLK_1 = S00_ACLK;
  assign S00_ARESETN_1 = S00_ARESETN;
  assign S00_AXI_arready[0] = microblaze_0_axi_periph_to_s00_couplers_ARREADY;
  assign S00_AXI_awready[0] = microblaze_0_axi_periph_to_s00_couplers_AWREADY;
  assign S00_AXI_bresp[1:0] = microblaze_0_axi_periph_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid[0] = microblaze_0_axi_periph_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = microblaze_0_axi_periph_to_s00_couplers_RDATA;
  assign S00_AXI_rresp[1:0] = microblaze_0_axi_periph_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid[0] = microblaze_0_axi_periph_to_s00_couplers_RVALID;
  assign S00_AXI_wready[0] = microblaze_0_axi_periph_to_s00_couplers_WREADY;
  assign m00_couplers_to_microblaze_0_axi_periph_ARREADY = M00_AXI_arready[0];
  assign m00_couplers_to_microblaze_0_axi_periph_AWREADY = M00_AXI_awready[0];
  assign m00_couplers_to_microblaze_0_axi_periph_BRESP = M00_AXI_bresp[1:0];
  assign m00_couplers_to_microblaze_0_axi_periph_BVALID = M00_AXI_bvalid[0];
  assign m00_couplers_to_microblaze_0_axi_periph_RDATA = M00_AXI_rdata[31:0];
  assign m00_couplers_to_microblaze_0_axi_periph_RRESP = M00_AXI_rresp[1:0];
  assign m00_couplers_to_microblaze_0_axi_periph_RVALID = M00_AXI_rvalid[0];
  assign m00_couplers_to_microblaze_0_axi_periph_WREADY = M00_AXI_wready[0];
  assign m01_couplers_to_microblaze_0_axi_periph_ARREADY = M01_AXI_arready[0];
  assign m01_couplers_to_microblaze_0_axi_periph_AWREADY = M01_AXI_awready[0];
  assign m01_couplers_to_microblaze_0_axi_periph_BRESP = M01_AXI_bresp[1:0];
  assign m01_couplers_to_microblaze_0_axi_periph_BVALID = M01_AXI_bvalid[0];
  assign m01_couplers_to_microblaze_0_axi_periph_RDATA = M01_AXI_rdata[31:0];
  assign m01_couplers_to_microblaze_0_axi_periph_RRESP = M01_AXI_rresp[1:0];
  assign m01_couplers_to_microblaze_0_axi_periph_RVALID = M01_AXI_rvalid[0];
  assign m01_couplers_to_microblaze_0_axi_periph_WREADY = M01_AXI_wready[0];
  assign m02_couplers_to_microblaze_0_axi_periph_ARREADY = M02_AXI_arready[0];
  assign m02_couplers_to_microblaze_0_axi_periph_AWREADY = M02_AXI_awready[0];
  assign m02_couplers_to_microblaze_0_axi_periph_BRESP = M02_AXI_bresp[1:0];
  assign m02_couplers_to_microblaze_0_axi_periph_BVALID = M02_AXI_bvalid[0];
  assign m02_couplers_to_microblaze_0_axi_periph_RDATA = M02_AXI_rdata[31:0];
  assign m02_couplers_to_microblaze_0_axi_periph_RRESP = M02_AXI_rresp[1:0];
  assign m02_couplers_to_microblaze_0_axi_periph_RVALID = M02_AXI_rvalid[0];
  assign m02_couplers_to_microblaze_0_axi_periph_WREADY = M02_AXI_wready[0];
  assign microblaze_0_axi_periph_ACLK_net = ACLK;
  assign microblaze_0_axi_periph_ARESETN_net = ARESETN;
  assign microblaze_0_axi_periph_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign microblaze_0_axi_periph_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign microblaze_0_axi_periph_to_s00_couplers_ARVALID = S00_AXI_arvalid[0];
  assign microblaze_0_axi_periph_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign microblaze_0_axi_periph_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign microblaze_0_axi_periph_to_s00_couplers_AWVALID = S00_AXI_awvalid[0];
  assign microblaze_0_axi_periph_to_s00_couplers_BREADY = S00_AXI_bready[0];
  assign microblaze_0_axi_periph_to_s00_couplers_RREADY = S00_AXI_rready[0];
  assign microblaze_0_axi_periph_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign microblaze_0_axi_periph_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign microblaze_0_axi_periph_to_s00_couplers_WVALID = S00_AXI_wvalid[0];
  m00_couplers_imp_M3U6M4 m00_couplers
       (.M_ACLK(M00_ACLK_1),
        .M_ARESETN(M00_ARESETN_1),
        .M_AXI_araddr(m00_couplers_to_microblaze_0_axi_periph_ARADDR),
        .M_AXI_arready(m00_couplers_to_microblaze_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m00_couplers_to_microblaze_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m00_couplers_to_microblaze_0_axi_periph_AWADDR),
        .M_AXI_awready(m00_couplers_to_microblaze_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m00_couplers_to_microblaze_0_axi_periph_AWVALID),
        .M_AXI_bready(m00_couplers_to_microblaze_0_axi_periph_BREADY),
        .M_AXI_bresp(m00_couplers_to_microblaze_0_axi_periph_BRESP),
        .M_AXI_bvalid(m00_couplers_to_microblaze_0_axi_periph_BVALID),
        .M_AXI_rdata(m00_couplers_to_microblaze_0_axi_periph_RDATA),
        .M_AXI_rready(m00_couplers_to_microblaze_0_axi_periph_RREADY),
        .M_AXI_rresp(m00_couplers_to_microblaze_0_axi_periph_RRESP),
        .M_AXI_rvalid(m00_couplers_to_microblaze_0_axi_periph_RVALID),
        .M_AXI_wdata(m00_couplers_to_microblaze_0_axi_periph_WDATA),
        .M_AXI_wready(m00_couplers_to_microblaze_0_axi_periph_WREADY),
        .M_AXI_wstrb(m00_couplers_to_microblaze_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m00_couplers_to_microblaze_0_axi_periph_WVALID),
        .S_ACLK(microblaze_0_axi_periph_ACLK_net),
        .S_ARESETN(microblaze_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m00_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m00_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m00_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m00_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m00_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m00_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m00_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m00_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m00_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m00_couplers_RDATA),
        .S_AXI_rready(xbar_to_m00_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m00_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m00_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m00_couplers_WDATA),
        .S_AXI_wready(xbar_to_m00_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m00_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m00_couplers_WVALID));
  m01_couplers_imp_1LUAMW2 m01_couplers
       (.M_ACLK(M01_ACLK_1),
        .M_ARESETN(M01_ARESETN_1),
        .M_AXI_araddr(m01_couplers_to_microblaze_0_axi_periph_ARADDR),
        .M_AXI_arready(m01_couplers_to_microblaze_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m01_couplers_to_microblaze_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m01_couplers_to_microblaze_0_axi_periph_AWADDR),
        .M_AXI_awready(m01_couplers_to_microblaze_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m01_couplers_to_microblaze_0_axi_periph_AWVALID),
        .M_AXI_bready(m01_couplers_to_microblaze_0_axi_periph_BREADY),
        .M_AXI_bresp(m01_couplers_to_microblaze_0_axi_periph_BRESP),
        .M_AXI_bvalid(m01_couplers_to_microblaze_0_axi_periph_BVALID),
        .M_AXI_rdata(m01_couplers_to_microblaze_0_axi_periph_RDATA),
        .M_AXI_rready(m01_couplers_to_microblaze_0_axi_periph_RREADY),
        .M_AXI_rresp(m01_couplers_to_microblaze_0_axi_periph_RRESP),
        .M_AXI_rvalid(m01_couplers_to_microblaze_0_axi_periph_RVALID),
        .M_AXI_wdata(m01_couplers_to_microblaze_0_axi_periph_WDATA),
        .M_AXI_wready(m01_couplers_to_microblaze_0_axi_periph_WREADY),
        .M_AXI_wstrb(m01_couplers_to_microblaze_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m01_couplers_to_microblaze_0_axi_periph_WVALID),
        .S_ACLK(microblaze_0_axi_periph_ACLK_net),
        .S_ARESETN(microblaze_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m01_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m01_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m01_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m01_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m01_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m01_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m01_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m01_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m01_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m01_couplers_RDATA),
        .S_AXI_rready(xbar_to_m01_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m01_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m01_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m01_couplers_WDATA),
        .S_AXI_wready(xbar_to_m01_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m01_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m01_couplers_WVALID));
  m02_couplers_imp_1BK5AWX m02_couplers
       (.M_ACLK(M02_ACLK_1),
        .M_ARESETN(M02_ARESETN_1),
        .M_AXI_araddr(m02_couplers_to_microblaze_0_axi_periph_ARADDR),
        .M_AXI_arready(m02_couplers_to_microblaze_0_axi_periph_ARREADY),
        .M_AXI_arvalid(m02_couplers_to_microblaze_0_axi_periph_ARVALID),
        .M_AXI_awaddr(m02_couplers_to_microblaze_0_axi_periph_AWADDR),
        .M_AXI_awready(m02_couplers_to_microblaze_0_axi_periph_AWREADY),
        .M_AXI_awvalid(m02_couplers_to_microblaze_0_axi_periph_AWVALID),
        .M_AXI_bready(m02_couplers_to_microblaze_0_axi_periph_BREADY),
        .M_AXI_bresp(m02_couplers_to_microblaze_0_axi_periph_BRESP),
        .M_AXI_bvalid(m02_couplers_to_microblaze_0_axi_periph_BVALID),
        .M_AXI_rdata(m02_couplers_to_microblaze_0_axi_periph_RDATA),
        .M_AXI_rready(m02_couplers_to_microblaze_0_axi_periph_RREADY),
        .M_AXI_rresp(m02_couplers_to_microblaze_0_axi_periph_RRESP),
        .M_AXI_rvalid(m02_couplers_to_microblaze_0_axi_periph_RVALID),
        .M_AXI_wdata(m02_couplers_to_microblaze_0_axi_periph_WDATA),
        .M_AXI_wready(m02_couplers_to_microblaze_0_axi_periph_WREADY),
        .M_AXI_wstrb(m02_couplers_to_microblaze_0_axi_periph_WSTRB),
        .M_AXI_wvalid(m02_couplers_to_microblaze_0_axi_periph_WVALID),
        .S_ACLK(microblaze_0_axi_periph_ACLK_net),
        .S_ARESETN(microblaze_0_axi_periph_ARESETN_net),
        .S_AXI_araddr(xbar_to_m02_couplers_ARADDR),
        .S_AXI_arready(xbar_to_m02_couplers_ARREADY),
        .S_AXI_arvalid(xbar_to_m02_couplers_ARVALID),
        .S_AXI_awaddr(xbar_to_m02_couplers_AWADDR),
        .S_AXI_awready(xbar_to_m02_couplers_AWREADY),
        .S_AXI_awvalid(xbar_to_m02_couplers_AWVALID),
        .S_AXI_bready(xbar_to_m02_couplers_BREADY),
        .S_AXI_bresp(xbar_to_m02_couplers_BRESP),
        .S_AXI_bvalid(xbar_to_m02_couplers_BVALID),
        .S_AXI_rdata(xbar_to_m02_couplers_RDATA),
        .S_AXI_rready(xbar_to_m02_couplers_RREADY),
        .S_AXI_rresp(xbar_to_m02_couplers_RRESP),
        .S_AXI_rvalid(xbar_to_m02_couplers_RVALID),
        .S_AXI_wdata(xbar_to_m02_couplers_WDATA),
        .S_AXI_wready(xbar_to_m02_couplers_WREADY),
        .S_AXI_wstrb(xbar_to_m02_couplers_WSTRB),
        .S_AXI_wvalid(xbar_to_m02_couplers_WVALID));
  s00_couplers_imp_19EXVQK s00_couplers
       (.M_ACLK(microblaze_0_axi_periph_ACLK_net),
        .M_ARESETN(microblaze_0_axi_periph_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_xbar_ARADDR),
        .M_AXI_arprot(s00_couplers_to_xbar_ARPROT),
        .M_AXI_arready(s00_couplers_to_xbar_ARREADY),
        .M_AXI_arvalid(s00_couplers_to_xbar_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_xbar_AWADDR),
        .M_AXI_awprot(s00_couplers_to_xbar_AWPROT),
        .M_AXI_awready(s00_couplers_to_xbar_AWREADY),
        .M_AXI_awvalid(s00_couplers_to_xbar_AWVALID),
        .M_AXI_bready(s00_couplers_to_xbar_BREADY),
        .M_AXI_bresp(s00_couplers_to_xbar_BRESP),
        .M_AXI_bvalid(s00_couplers_to_xbar_BVALID),
        .M_AXI_rdata(s00_couplers_to_xbar_RDATA),
        .M_AXI_rready(s00_couplers_to_xbar_RREADY),
        .M_AXI_rresp(s00_couplers_to_xbar_RRESP),
        .M_AXI_rvalid(s00_couplers_to_xbar_RVALID),
        .M_AXI_wdata(s00_couplers_to_xbar_WDATA),
        .M_AXI_wready(s00_couplers_to_xbar_WREADY),
        .M_AXI_wstrb(s00_couplers_to_xbar_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_xbar_WVALID),
        .S_ACLK(S00_ACLK_1),
        .S_ARESETN(S00_ARESETN_1),
        .S_AXI_araddr(microblaze_0_axi_periph_to_s00_couplers_ARADDR),
        .S_AXI_arprot(microblaze_0_axi_periph_to_s00_couplers_ARPROT),
        .S_AXI_arready(microblaze_0_axi_periph_to_s00_couplers_ARREADY),
        .S_AXI_arvalid(microblaze_0_axi_periph_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(microblaze_0_axi_periph_to_s00_couplers_AWADDR),
        .S_AXI_awprot(microblaze_0_axi_periph_to_s00_couplers_AWPROT),
        .S_AXI_awready(microblaze_0_axi_periph_to_s00_couplers_AWREADY),
        .S_AXI_awvalid(microblaze_0_axi_periph_to_s00_couplers_AWVALID),
        .S_AXI_bready(microblaze_0_axi_periph_to_s00_couplers_BREADY),
        .S_AXI_bresp(microblaze_0_axi_periph_to_s00_couplers_BRESP),
        .S_AXI_bvalid(microblaze_0_axi_periph_to_s00_couplers_BVALID),
        .S_AXI_rdata(microblaze_0_axi_periph_to_s00_couplers_RDATA),
        .S_AXI_rready(microblaze_0_axi_periph_to_s00_couplers_RREADY),
        .S_AXI_rresp(microblaze_0_axi_periph_to_s00_couplers_RRESP),
        .S_AXI_rvalid(microblaze_0_axi_periph_to_s00_couplers_RVALID),
        .S_AXI_wdata(microblaze_0_axi_periph_to_s00_couplers_WDATA),
        .S_AXI_wready(microblaze_0_axi_periph_to_s00_couplers_WREADY),
        .S_AXI_wstrb(microblaze_0_axi_periph_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(microblaze_0_axi_periph_to_s00_couplers_WVALID));
  control_sub_xbar_1 xbar
       (.aclk(microblaze_0_axi_periph_ACLK_net),
        .aresetn(microblaze_0_axi_periph_ARESETN_net),
        .m_axi_araddr({xbar_to_m02_couplers_ARADDR,xbar_to_m01_couplers_ARADDR,xbar_to_m00_couplers_ARADDR}),
        .m_axi_arready({xbar_to_m02_couplers_ARREADY,xbar_to_m01_couplers_ARREADY,xbar_to_m00_couplers_ARREADY}),
        .m_axi_arvalid({xbar_to_m02_couplers_ARVALID,xbar_to_m01_couplers_ARVALID,xbar_to_m00_couplers_ARVALID}),
        .m_axi_awaddr({xbar_to_m02_couplers_AWADDR,xbar_to_m01_couplers_AWADDR,xbar_to_m00_couplers_AWADDR}),
        .m_axi_awready({xbar_to_m02_couplers_AWREADY,xbar_to_m01_couplers_AWREADY,xbar_to_m00_couplers_AWREADY}),
        .m_axi_awvalid({xbar_to_m02_couplers_AWVALID,xbar_to_m01_couplers_AWVALID,xbar_to_m00_couplers_AWVALID}),
        .m_axi_bready({xbar_to_m02_couplers_BREADY,xbar_to_m01_couplers_BREADY,xbar_to_m00_couplers_BREADY}),
        .m_axi_bresp({xbar_to_m02_couplers_BRESP,xbar_to_m01_couplers_BRESP,xbar_to_m00_couplers_BRESP}),
        .m_axi_bvalid({xbar_to_m02_couplers_BVALID,xbar_to_m01_couplers_BVALID,xbar_to_m00_couplers_BVALID}),
        .m_axi_rdata({xbar_to_m02_couplers_RDATA,xbar_to_m01_couplers_RDATA,xbar_to_m00_couplers_RDATA}),
        .m_axi_rready({xbar_to_m02_couplers_RREADY,xbar_to_m01_couplers_RREADY,xbar_to_m00_couplers_RREADY}),
        .m_axi_rresp({xbar_to_m02_couplers_RRESP,xbar_to_m01_couplers_RRESP,xbar_to_m00_couplers_RRESP}),
        .m_axi_rvalid({xbar_to_m02_couplers_RVALID,xbar_to_m01_couplers_RVALID,xbar_to_m00_couplers_RVALID}),
        .m_axi_wdata({xbar_to_m02_couplers_WDATA,xbar_to_m01_couplers_WDATA,xbar_to_m00_couplers_WDATA}),
        .m_axi_wready({xbar_to_m02_couplers_WREADY,xbar_to_m01_couplers_WREADY,xbar_to_m00_couplers_WREADY}),
        .m_axi_wstrb({xbar_to_m02_couplers_WSTRB,xbar_to_m01_couplers_WSTRB,xbar_to_m00_couplers_WSTRB}),
        .m_axi_wvalid({xbar_to_m02_couplers_WVALID,xbar_to_m01_couplers_WVALID,xbar_to_m00_couplers_WVALID}),
        .s_axi_araddr(s00_couplers_to_xbar_ARADDR),
        .s_axi_arprot(s00_couplers_to_xbar_ARPROT),
        .s_axi_arready(s00_couplers_to_xbar_ARREADY),
        .s_axi_arvalid(s00_couplers_to_xbar_ARVALID),
        .s_axi_awaddr(s00_couplers_to_xbar_AWADDR),
        .s_axi_awprot(s00_couplers_to_xbar_AWPROT),
        .s_axi_awready(s00_couplers_to_xbar_AWREADY),
        .s_axi_awvalid(s00_couplers_to_xbar_AWVALID),
        .s_axi_bready(s00_couplers_to_xbar_BREADY),
        .s_axi_bresp(s00_couplers_to_xbar_BRESP),
        .s_axi_bvalid(s00_couplers_to_xbar_BVALID),
        .s_axi_rdata(s00_couplers_to_xbar_RDATA),
        .s_axi_rready(s00_couplers_to_xbar_RREADY),
        .s_axi_rresp(s00_couplers_to_xbar_RRESP),
        .s_axi_rvalid(s00_couplers_to_xbar_RVALID),
        .s_axi_wdata(s00_couplers_to_xbar_WDATA),
        .s_axi_wready(s00_couplers_to_xbar_WREADY),
        .s_axi_wstrb(s00_couplers_to_xbar_WSTRB),
        .s_axi_wvalid(s00_couplers_to_xbar_WVALID));
endmodule

module dma_sub_imp_ETY9Q3
   (M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arprot,
    M00_AXI_arready,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awprot,
    M00_AXI_awready,
    M00_AXI_awvalid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    M01_ACLK,
    M01_ARESETN,
    M01_AXI_araddr,
    M01_AXI_arprot,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awprot,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_ACLK,
    M02_ARESETN,
    M02_AXI_araddr,
    M02_AXI_arprot,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awprot,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    M03_ACLK,
    M03_ARESETN,
    M03_AXI_araddr,
    M03_AXI_arprot,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awprot,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_ACLK,
    M04_ARESETN,
    M04_AXI_araddr,
    M04_AXI_arprot,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awprot,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    M05_ACLK,
    M05_ARESETN,
    M05_AXI_araddr,
    M05_AXI_arprot,
    M05_AXI_arready,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awprot,
    M05_AXI_awready,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wready,
    M05_AXI_wstrb,
    M05_AXI_wvalid,
    M06_ACLK,
    M06_ARESETN,
    M06_AXI_araddr,
    M06_AXI_arprot,
    M06_AXI_arready,
    M06_AXI_arvalid,
    M06_AXI_awaddr,
    M06_AXI_awprot,
    M06_AXI_awready,
    M06_AXI_awvalid,
    M06_AXI_bready,
    M06_AXI_bresp,
    M06_AXI_bvalid,
    M06_AXI_rdata,
    M06_AXI_rready,
    M06_AXI_rresp,
    M06_AXI_rvalid,
    M06_AXI_wdata,
    M06_AXI_wready,
    M06_AXI_wstrb,
    M06_AXI_wvalid,
    M07_ACLK,
    M07_ARESETN,
    M07_AXI_araddr,
    M07_AXI_arprot,
    M07_AXI_arready,
    M07_AXI_arvalid,
    M07_AXI_awaddr,
    M07_AXI_awprot,
    M07_AXI_awready,
    M07_AXI_awvalid,
    M07_AXI_bready,
    M07_AXI_bresp,
    M07_AXI_bvalid,
    M07_AXI_rdata,
    M07_AXI_rready,
    M07_AXI_rresp,
    M07_AXI_rvalid,
    M07_AXI_wdata,
    M07_AXI_wready,
    M07_AXI_wstrb,
    M07_AXI_wvalid,
    axi_lite_aclk,
    axi_lite_aresetn,
    axis_datapath_aclk,
    axis_datapath_aresetn,
    m_axis_dma_tx_tdata,
    m_axis_dma_tx_tkeep,
    m_axis_dma_tx_tlast,
    m_axis_dma_tx_tready,
    m_axis_dma_tx_tuser,
    m_axis_dma_tx_tvalid,
    pcie_7x_mgt_rxn,
    pcie_7x_mgt_rxp,
    pcie_7x_mgt_txn,
    pcie_7x_mgt_txp,
    s_axis_dma_rx_tdata,
    s_axis_dma_rx_tkeep,
    s_axis_dma_rx_tlast,
    s_axis_dma_rx_tready,
    s_axis_dma_rx_tuser,
    s_axis_dma_rx_tvalid,
    sys_clk,
    sys_reset);
  input M00_ACLK;
  input M00_ARESETN;
  output [11:0]M00_AXI_araddr;
  output [2:0]M00_AXI_arprot;
  input M00_AXI_arready;
  output M00_AXI_arvalid;
  output [11:0]M00_AXI_awaddr;
  output [2:0]M00_AXI_awprot;
  input M00_AXI_awready;
  output M00_AXI_awvalid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input M01_ACLK;
  input M01_ARESETN;
  output [11:0]M01_AXI_araddr;
  output [2:0]M01_AXI_arprot;
  input M01_AXI_arready;
  output M01_AXI_arvalid;
  output [11:0]M01_AXI_awaddr;
  output [2:0]M01_AXI_awprot;
  input M01_AXI_awready;
  output M01_AXI_awvalid;
  output M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output M01_AXI_wvalid;
  input M02_ACLK;
  input M02_ARESETN;
  output [11:0]M02_AXI_araddr;
  output [2:0]M02_AXI_arprot;
  input M02_AXI_arready;
  output M02_AXI_arvalid;
  output [11:0]M02_AXI_awaddr;
  output [2:0]M02_AXI_awprot;
  input M02_AXI_awready;
  output M02_AXI_awvalid;
  output M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output M02_AXI_wvalid;
  input M03_ACLK;
  input M03_ARESETN;
  output [11:0]M03_AXI_araddr;
  output [2:0]M03_AXI_arprot;
  input M03_AXI_arready;
  output M03_AXI_arvalid;
  output [11:0]M03_AXI_awaddr;
  output [2:0]M03_AXI_awprot;
  input M03_AXI_awready;
  output M03_AXI_awvalid;
  output M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input M03_AXI_wready;
  output [3:0]M03_AXI_wstrb;
  output M03_AXI_wvalid;
  input M04_ACLK;
  input M04_ARESETN;
  output [11:0]M04_AXI_araddr;
  output [2:0]M04_AXI_arprot;
  input M04_AXI_arready;
  output M04_AXI_arvalid;
  output [11:0]M04_AXI_awaddr;
  output [2:0]M04_AXI_awprot;
  input M04_AXI_awready;
  output M04_AXI_awvalid;
  output M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input M04_AXI_wready;
  output [3:0]M04_AXI_wstrb;
  output M04_AXI_wvalid;
  input M05_ACLK;
  input M05_ARESETN;
  output [11:0]M05_AXI_araddr;
  output [2:0]M05_AXI_arprot;
  input M05_AXI_arready;
  output M05_AXI_arvalid;
  output [11:0]M05_AXI_awaddr;
  output [2:0]M05_AXI_awprot;
  input M05_AXI_awready;
  output M05_AXI_awvalid;
  output M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  output M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  input M05_AXI_wready;
  output [3:0]M05_AXI_wstrb;
  output M05_AXI_wvalid;
  input M06_ACLK;
  input M06_ARESETN;
  output [11:0]M06_AXI_araddr;
  output [2:0]M06_AXI_arprot;
  input M06_AXI_arready;
  output M06_AXI_arvalid;
  output [11:0]M06_AXI_awaddr;
  output [2:0]M06_AXI_awprot;
  input M06_AXI_awready;
  output M06_AXI_awvalid;
  output M06_AXI_bready;
  input [1:0]M06_AXI_bresp;
  input M06_AXI_bvalid;
  input [31:0]M06_AXI_rdata;
  output M06_AXI_rready;
  input [1:0]M06_AXI_rresp;
  input M06_AXI_rvalid;
  output [31:0]M06_AXI_wdata;
  input M06_AXI_wready;
  output [3:0]M06_AXI_wstrb;
  output M06_AXI_wvalid;
  input M07_ACLK;
  input M07_ARESETN;
  output [11:0]M07_AXI_araddr;
  output [2:0]M07_AXI_arprot;
  input M07_AXI_arready;
  output M07_AXI_arvalid;
  output [11:0]M07_AXI_awaddr;
  output [2:0]M07_AXI_awprot;
  input M07_AXI_awready;
  output M07_AXI_awvalid;
  output M07_AXI_bready;
  input [1:0]M07_AXI_bresp;
  input M07_AXI_bvalid;
  input [31:0]M07_AXI_rdata;
  output M07_AXI_rready;
  input [1:0]M07_AXI_rresp;
  input M07_AXI_rvalid;
  output [31:0]M07_AXI_wdata;
  input M07_AXI_wready;
  output [3:0]M07_AXI_wstrb;
  output M07_AXI_wvalid;
  input axi_lite_aclk;
  input axi_lite_aresetn;
  input axis_datapath_aclk;
  input axis_datapath_aresetn;
  output [255:0]m_axis_dma_tx_tdata;
  output [31:0]m_axis_dma_tx_tkeep;
  output m_axis_dma_tx_tlast;
  input m_axis_dma_tx_tready;
  output [255:0]m_axis_dma_tx_tuser;
  output m_axis_dma_tx_tvalid;
  input [7:0]pcie_7x_mgt_rxn;
  input [7:0]pcie_7x_mgt_rxp;
  output [7:0]pcie_7x_mgt_txn;
  output [7:0]pcie_7x_mgt_txp;
  input [255:0]s_axis_dma_rx_tdata;
  input [31:0]s_axis_dma_rx_tkeep;
  input s_axis_dma_rx_tlast;
  output s_axis_dma_rx_tready;
  input [255:0]s_axis_dma_rx_tuser;
  input s_axis_dma_rx_tvalid;
  input sys_clk;
  input sys_reset;

  wire M00_ACLK_i;
  wire M00_ARESETN_i;
  wire M01_ACLK_i;
  wire M01_ARESETN_i;
  wire M02_ACLK_i;
  wire M02_ARESETN_i;
  wire M03_ACLK_i;
  wire M03_ARESETN_i;
  wire M04_ACLK_i;
  wire M04_ARESETN_i;
  wire M05_ACLK_i;
  wire M05_ARESETN_i;
  wire M06_ACLK_i;
  wire M06_ARESETN_i;
  wire M07_ACLK_i;
  wire M07_ARESETN_i;
  wire [11:0]axi_clock_converter_0_M_AXI_ARADDR;
  wire axi_clock_converter_0_M_AXI_ARREADY;
  wire axi_clock_converter_0_M_AXI_ARVALID;
  wire [11:0]axi_clock_converter_0_M_AXI_AWADDR;
  wire axi_clock_converter_0_M_AXI_AWREADY;
  wire axi_clock_converter_0_M_AXI_AWVALID;
  wire axi_clock_converter_0_M_AXI_BREADY;
  wire [1:0]axi_clock_converter_0_M_AXI_BRESP;
  wire axi_clock_converter_0_M_AXI_BVALID;
  wire [31:0]axi_clock_converter_0_M_AXI_RDATA;
  wire axi_clock_converter_0_M_AXI_RREADY;
  wire [1:0]axi_clock_converter_0_M_AXI_RRESP;
  wire axi_clock_converter_0_M_AXI_RVALID;
  wire [31:0]axi_clock_converter_0_M_AXI_WDATA;
  wire axi_clock_converter_0_M_AXI_WREADY;
  wire [3:0]axi_clock_converter_0_M_AXI_WSTRB;
  wire axi_clock_converter_0_M_AXI_WVALID;
  wire [11:0]axi_interconnect_0_M00_AXI_ARADDR;
  wire [2:0]axi_interconnect_0_M00_AXI_ARPROT;
  wire axi_interconnect_0_M00_AXI_ARREADY;
  wire axi_interconnect_0_M00_AXI_ARVALID;
  wire [11:0]axi_interconnect_0_M00_AXI_AWADDR;
  wire [2:0]axi_interconnect_0_M00_AXI_AWPROT;
  wire axi_interconnect_0_M00_AXI_AWREADY;
  wire axi_interconnect_0_M00_AXI_AWVALID;
  wire axi_interconnect_0_M00_AXI_BREADY;
  wire [1:0]axi_interconnect_0_M00_AXI_BRESP;
  wire axi_interconnect_0_M00_AXI_BVALID;
  wire [31:0]axi_interconnect_0_M00_AXI_RDATA;
  wire axi_interconnect_0_M00_AXI_RREADY;
  wire [1:0]axi_interconnect_0_M00_AXI_RRESP;
  wire axi_interconnect_0_M00_AXI_RVALID;
  wire [31:0]axi_interconnect_0_M00_AXI_WDATA;
  wire axi_interconnect_0_M00_AXI_WREADY;
  wire [3:0]axi_interconnect_0_M00_AXI_WSTRB;
  wire axi_interconnect_0_M00_AXI_WVALID;
  wire [11:0]axi_interconnect_0_M01_AXI_ARADDR;
  wire [2:0]axi_interconnect_0_M01_AXI_ARPROT;
  wire axi_interconnect_0_M01_AXI_ARREADY;
  wire axi_interconnect_0_M01_AXI_ARVALID;
  wire [11:0]axi_interconnect_0_M01_AXI_AWADDR;
  wire [2:0]axi_interconnect_0_M01_AXI_AWPROT;
  wire axi_interconnect_0_M01_AXI_AWREADY;
  wire axi_interconnect_0_M01_AXI_AWVALID;
  wire axi_interconnect_0_M01_AXI_BREADY;
  wire [1:0]axi_interconnect_0_M01_AXI_BRESP;
  wire axi_interconnect_0_M01_AXI_BVALID;
  wire [31:0]axi_interconnect_0_M01_AXI_RDATA;
  wire axi_interconnect_0_M01_AXI_RREADY;
  wire [1:0]axi_interconnect_0_M01_AXI_RRESP;
  wire axi_interconnect_0_M01_AXI_RVALID;
  wire [31:0]axi_interconnect_0_M01_AXI_WDATA;
  wire axi_interconnect_0_M01_AXI_WREADY;
  wire [3:0]axi_interconnect_0_M01_AXI_WSTRB;
  wire axi_interconnect_0_M01_AXI_WVALID;
  wire [11:0]axi_interconnect_0_M02_AXI_ARADDR;
  wire [2:0]axi_interconnect_0_M02_AXI_ARPROT;
  wire axi_interconnect_0_M02_AXI_ARREADY;
  wire axi_interconnect_0_M02_AXI_ARVALID;
  wire [11:0]axi_interconnect_0_M02_AXI_AWADDR;
  wire [2:0]axi_interconnect_0_M02_AXI_AWPROT;
  wire axi_interconnect_0_M02_AXI_AWREADY;
  wire axi_interconnect_0_M02_AXI_AWVALID;
  wire axi_interconnect_0_M02_AXI_BREADY;
  wire [1:0]axi_interconnect_0_M02_AXI_BRESP;
  wire axi_interconnect_0_M02_AXI_BVALID;
  wire [31:0]axi_interconnect_0_M02_AXI_RDATA;
  wire axi_interconnect_0_M02_AXI_RREADY;
  wire [1:0]axi_interconnect_0_M02_AXI_RRESP;
  wire axi_interconnect_0_M02_AXI_RVALID;
  wire [31:0]axi_interconnect_0_M02_AXI_WDATA;
  wire axi_interconnect_0_M02_AXI_WREADY;
  wire [3:0]axi_interconnect_0_M02_AXI_WSTRB;
  wire axi_interconnect_0_M02_AXI_WVALID;
  wire [11:0]axi_interconnect_0_M03_AXI_ARADDR;
  wire [2:0]axi_interconnect_0_M03_AXI_ARPROT;
  wire axi_interconnect_0_M03_AXI_ARREADY;
  wire axi_interconnect_0_M03_AXI_ARVALID;
  wire [11:0]axi_interconnect_0_M03_AXI_AWADDR;
  wire [2:0]axi_interconnect_0_M03_AXI_AWPROT;
  wire axi_interconnect_0_M03_AXI_AWREADY;
  wire axi_interconnect_0_M03_AXI_AWVALID;
  wire axi_interconnect_0_M03_AXI_BREADY;
  wire [1:0]axi_interconnect_0_M03_AXI_BRESP;
  wire axi_interconnect_0_M03_AXI_BVALID;
  wire [31:0]axi_interconnect_0_M03_AXI_RDATA;
  wire axi_interconnect_0_M03_AXI_RREADY;
  wire [1:0]axi_interconnect_0_M03_AXI_RRESP;
  wire axi_interconnect_0_M03_AXI_RVALID;
  wire [31:0]axi_interconnect_0_M03_AXI_WDATA;
  wire axi_interconnect_0_M03_AXI_WREADY;
  wire [3:0]axi_interconnect_0_M03_AXI_WSTRB;
  wire axi_interconnect_0_M03_AXI_WVALID;
  wire [11:0]axi_interconnect_0_M04_AXI_ARADDR;
  wire [2:0]axi_interconnect_0_M04_AXI_ARPROT;
  wire axi_interconnect_0_M04_AXI_ARREADY;
  wire axi_interconnect_0_M04_AXI_ARVALID;
  wire [11:0]axi_interconnect_0_M04_AXI_AWADDR;
  wire [2:0]axi_interconnect_0_M04_AXI_AWPROT;
  wire axi_interconnect_0_M04_AXI_AWREADY;
  wire axi_interconnect_0_M04_AXI_AWVALID;
  wire axi_interconnect_0_M04_AXI_BREADY;
  wire [1:0]axi_interconnect_0_M04_AXI_BRESP;
  wire axi_interconnect_0_M04_AXI_BVALID;
  wire [31:0]axi_interconnect_0_M04_AXI_RDATA;
  wire axi_interconnect_0_M04_AXI_RREADY;
  wire [1:0]axi_interconnect_0_M04_AXI_RRESP;
  wire axi_interconnect_0_M04_AXI_RVALID;
  wire [31:0]axi_interconnect_0_M04_AXI_WDATA;
  wire axi_interconnect_0_M04_AXI_WREADY;
  wire [3:0]axi_interconnect_0_M04_AXI_WSTRB;
  wire axi_interconnect_0_M04_AXI_WVALID;
  wire [11:0]axi_interconnect_0_M05_AXI_ARADDR;
  wire [2:0]axi_interconnect_0_M05_AXI_ARPROT;
  wire axi_interconnect_0_M05_AXI_ARREADY;
  wire axi_interconnect_0_M05_AXI_ARVALID;
  wire [11:0]axi_interconnect_0_M05_AXI_AWADDR;
  wire [2:0]axi_interconnect_0_M05_AXI_AWPROT;
  wire axi_interconnect_0_M05_AXI_AWREADY;
  wire axi_interconnect_0_M05_AXI_AWVALID;
  wire axi_interconnect_0_M05_AXI_BREADY;
  wire [1:0]axi_interconnect_0_M05_AXI_BRESP;
  wire axi_interconnect_0_M05_AXI_BVALID;
  wire [31:0]axi_interconnect_0_M05_AXI_RDATA;
  wire axi_interconnect_0_M05_AXI_RREADY;
  wire [1:0]axi_interconnect_0_M05_AXI_RRESP;
  wire axi_interconnect_0_M05_AXI_RVALID;
  wire [31:0]axi_interconnect_0_M05_AXI_WDATA;
  wire axi_interconnect_0_M05_AXI_WREADY;
  wire [3:0]axi_interconnect_0_M05_AXI_WSTRB;
  wire axi_interconnect_0_M05_AXI_WVALID;
  wire [11:0]axi_interconnect_0_M06_AXI_ARADDR;
  wire [2:0]axi_interconnect_0_M06_AXI_ARPROT;
  wire axi_interconnect_0_M06_AXI_ARREADY;
  wire axi_interconnect_0_M06_AXI_ARVALID;
  wire [11:0]axi_interconnect_0_M06_AXI_AWADDR;
  wire [2:0]axi_interconnect_0_M06_AXI_AWPROT;
  wire axi_interconnect_0_M06_AXI_AWREADY;
  wire axi_interconnect_0_M06_AXI_AWVALID;
  wire axi_interconnect_0_M06_AXI_BREADY;
  wire [1:0]axi_interconnect_0_M06_AXI_BRESP;
  wire axi_interconnect_0_M06_AXI_BVALID;
  wire [31:0]axi_interconnect_0_M06_AXI_RDATA;
  wire axi_interconnect_0_M06_AXI_RREADY;
  wire [1:0]axi_interconnect_0_M06_AXI_RRESP;
  wire axi_interconnect_0_M06_AXI_RVALID;
  wire [31:0]axi_interconnect_0_M06_AXI_WDATA;
  wire axi_interconnect_0_M06_AXI_WREADY;
  wire [3:0]axi_interconnect_0_M06_AXI_WSTRB;
  wire axi_interconnect_0_M06_AXI_WVALID;
  wire [11:0]axi_interconnect_0_M07_AXI_ARADDR;
  wire [2:0]axi_interconnect_0_M07_AXI_ARPROT;
  wire axi_interconnect_0_M07_AXI_ARREADY;
  wire axi_interconnect_0_M07_AXI_ARVALID;
  wire [11:0]axi_interconnect_0_M07_AXI_AWADDR;
  wire [2:0]axi_interconnect_0_M07_AXI_AWPROT;
  wire axi_interconnect_0_M07_AXI_AWREADY;
  wire axi_interconnect_0_M07_AXI_AWVALID;
  wire axi_interconnect_0_M07_AXI_BREADY;
  wire [1:0]axi_interconnect_0_M07_AXI_BRESP;
  wire axi_interconnect_0_M07_AXI_BVALID;
  wire [31:0]axi_interconnect_0_M07_AXI_RDATA;
  wire axi_interconnect_0_M07_AXI_RREADY;
  wire [1:0]axi_interconnect_0_M07_AXI_RRESP;
  wire axi_interconnect_0_M07_AXI_RVALID;
  wire [31:0]axi_interconnect_0_M07_AXI_WDATA;
  wire axi_interconnect_0_M07_AXI_WREADY;
  wire [3:0]axi_interconnect_0_M07_AXI_WSTRB;
  wire axi_interconnect_0_M07_AXI_WVALID;
  wire [11:0]axi_interconnect_0_M08_AXI_ARADDR;
  wire [2:0]axi_interconnect_0_M08_AXI_ARPROT;
  wire axi_interconnect_0_M08_AXI_ARREADY;
  wire axi_interconnect_0_M08_AXI_ARVALID;
  wire [11:0]axi_interconnect_0_M08_AXI_AWADDR;
  wire [2:0]axi_interconnect_0_M08_AXI_AWPROT;
  wire axi_interconnect_0_M08_AXI_AWREADY;
  wire axi_interconnect_0_M08_AXI_AWVALID;
  wire axi_interconnect_0_M08_AXI_BREADY;
  wire [1:0]axi_interconnect_0_M08_AXI_BRESP;
  wire axi_interconnect_0_M08_AXI_BVALID;
  wire [31:0]axi_interconnect_0_M08_AXI_RDATA;
  wire axi_interconnect_0_M08_AXI_RREADY;
  wire [1:0]axi_interconnect_0_M08_AXI_RRESP;
  wire axi_interconnect_0_M08_AXI_RVALID;
  wire [31:0]axi_interconnect_0_M08_AXI_WDATA;
  wire axi_interconnect_0_M08_AXI_WREADY;
  wire [3:0]axi_interconnect_0_M08_AXI_WSTRB;
  wire axi_interconnect_0_M08_AXI_WVALID;
  wire axi_lite_clk_1;
  wire axi_lite_rstn_1;
  wire axis_10g_clk_1;
  wire [127:0]axis_fifo_10g_rx_M_AXIS_TDATA;
  wire [15:0]axis_fifo_10g_rx_M_AXIS_TKEEP;
  wire axis_fifo_10g_rx_M_AXIS_TLAST;
  wire axis_fifo_10g_rx_M_AXIS_TREADY;
  wire [127:0]axis_fifo_10g_rx_M_AXIS_TUSER;
  wire axis_fifo_10g_rx_M_AXIS_TVALID;
  wire axis_rx_sys_reset_0_peripheral_aresetn;
  wire [0:0]axis_tx_sys_reset_0_peripheral_aresetn;
  wire [127:0]nf_riffa_dma_1_dwidth_conv_tx_TDATA;
  wire [15:0]nf_riffa_dma_1_dwidth_conv_tx_TKEEP;
  wire nf_riffa_dma_1_dwidth_conv_tx_TLAST;
  wire nf_riffa_dma_1_dwidth_conv_tx_TREADY;
  wire [127:0]nf_riffa_dma_1_dwidth_conv_tx_TUSER;
  wire nf_riffa_dma_1_dwidth_conv_tx_TVALID;
  wire [127:0]nf_riffa_dma_1_fifo_dwidth_rx_TDATA;
  wire [15:0]nf_riffa_dma_1_fifo_dwidth_rx_TKEEP;
  wire nf_riffa_dma_1_fifo_dwidth_rx_TLAST;
  wire nf_riffa_dma_1_fifo_dwidth_rx_TREADY;
  wire [127:0]nf_riffa_dma_1_fifo_dwidth_rx_TUSER;
  wire nf_riffa_dma_1_fifo_dwidth_rx_TVALID;
  wire [127:0]nf_riffa_dma_1_fifo_dwidth_tx_TDATA;
  wire [15:0]nf_riffa_dma_1_fifo_dwidth_tx_TKEEP;
  wire nf_riffa_dma_1_fifo_dwidth_tx_TLAST;
  wire nf_riffa_dma_1_fifo_dwidth_tx_TREADY;
  wire [127:0]nf_riffa_dma_1_fifo_dwidth_tx_TUSER;
  wire nf_riffa_dma_1_fifo_dwidth_tx_TVALID;
  wire [255:0]nf_riffa_dma_1_m_axis_dma_tx_TDATA;
  wire [31:0]nf_riffa_dma_1_m_axis_dma_tx_TKEEP;
  wire nf_riffa_dma_1_m_axis_dma_tx_TLAST;
  wire nf_riffa_dma_1_m_axis_dma_tx_TREADY;
  wire [255:0]nf_riffa_dma_1_m_axis_dma_tx_TUSER;
  wire nf_riffa_dma_1_m_axis_dma_tx_TVALID;
  wire [3:0]nf_riffa_dma_1_pcie3_cfg_interrupt_INTx_VECTOR;
  wire [1:0]nf_riffa_dma_1_pcie3_cfg_interrupt_PENDING;
  wire nf_riffa_dma_1_pcie3_cfg_interrupt_SENT;
  wire [2:0]nf_riffa_dma_1_pcie3_cfg_msi_attr;
  wire [31:0]nf_riffa_dma_1_pcie3_cfg_msi_data;
  wire [1:0]nf_riffa_dma_1_pcie3_cfg_msi_enable;
  wire nf_riffa_dma_1_pcie3_cfg_msi_fail;
  wire [2:0]nf_riffa_dma_1_pcie3_cfg_msi_function_number;
  wire [31:0]nf_riffa_dma_1_pcie3_cfg_msi_int_vector;
  wire nf_riffa_dma_1_pcie3_cfg_msi_mask_update;
  wire [5:0]nf_riffa_dma_1_pcie3_cfg_msi_mmenable;
  wire [63:0]nf_riffa_dma_1_pcie3_cfg_msi_pending_status;
  wire [3:0]nf_riffa_dma_1_pcie3_cfg_msi_select;
  wire nf_riffa_dma_1_pcie3_cfg_msi_sent;
  wire nf_riffa_dma_1_pcie3_cfg_msi_tph_present;
  wire [8:0]nf_riffa_dma_1_pcie3_cfg_msi_tph_st_tag;
  wire [1:0]nf_riffa_dma_1_pcie3_cfg_msi_tph_type;
  wire [5:0]nf_riffa_dma_1_pcie3_cfg_msi_vf_enable;
  wire nf_riffa_dma_1_pcie3_cfg_status_cq_np_req;
  wire [5:0]nf_riffa_dma_1_pcie3_cfg_status_cq_np_req_count;
  wire [2:0]nf_riffa_dma_1_pcie3_cfg_status_current_speed;
  wire [1:0]nf_riffa_dma_1_pcie3_cfg_status_dpa_substate_change;
  wire nf_riffa_dma_1_pcie3_cfg_status_err_cor_out;
  wire nf_riffa_dma_1_pcie3_cfg_status_err_fatal_out;
  wire nf_riffa_dma_1_pcie3_cfg_status_err_nonfatal_out;
  wire [5:0]nf_riffa_dma_1_pcie3_cfg_status_function_power_state;
  wire [7:0]nf_riffa_dma_1_pcie3_cfg_status_function_status;
  wire [1:0]nf_riffa_dma_1_pcie3_cfg_status_link_power_state;
  wire nf_riffa_dma_1_pcie3_cfg_status_ltr_enable;
  wire [5:0]nf_riffa_dma_1_pcie3_cfg_status_ltssm_state;
  wire [2:0]nf_riffa_dma_1_pcie3_cfg_status_max_payload;
  wire [2:0]nf_riffa_dma_1_pcie3_cfg_status_max_read_req;
  wire [3:0]nf_riffa_dma_1_pcie3_cfg_status_negotiated_width;
  wire [1:0]nf_riffa_dma_1_pcie3_cfg_status_obff_enable;
  wire nf_riffa_dma_1_pcie3_cfg_status_phy_link_down;
  wire [1:0]nf_riffa_dma_1_pcie3_cfg_status_phy_link_status;
  wire nf_riffa_dma_1_pcie3_cfg_status_pl_status_change;
  wire [1:0]nf_riffa_dma_1_pcie3_cfg_status_rcb_status;
  wire [3:0]nf_riffa_dma_1_pcie3_cfg_status_rq_seq_num;
  wire nf_riffa_dma_1_pcie3_cfg_status_rq_seq_num_vld;
  wire [5:0]nf_riffa_dma_1_pcie3_cfg_status_rq_tag;
  wire nf_riffa_dma_1_pcie3_cfg_status_rq_tag_vld;
  wire [1:0]nf_riffa_dma_1_pcie3_cfg_status_tph_requester_enable;
  wire [5:0]nf_riffa_dma_1_pcie3_cfg_status_tph_st_mode;
  wire [17:0]nf_riffa_dma_1_pcie3_cfg_status_vf_power_state;
  wire [11:0]nf_riffa_dma_1_pcie3_cfg_status_vf_status;
  wire [5:0]nf_riffa_dma_1_pcie3_cfg_status_vf_tph_requester_enable;
  wire [17:0]nf_riffa_dma_1_pcie3_cfg_status_vf_tph_st_mode;
  wire [11:0]nf_riffa_dma_1_pcie_cfg_fc_CPLD;
  wire [7:0]nf_riffa_dma_1_pcie_cfg_fc_CPLH;
  wire [11:0]nf_riffa_dma_1_pcie_cfg_fc_NPD;
  wire [7:0]nf_riffa_dma_1_pcie_cfg_fc_NPH;
  wire [11:0]nf_riffa_dma_1_pcie_cfg_fc_PD;
  wire [7:0]nf_riffa_dma_1_pcie_cfg_fc_PH;
  wire [2:0]nf_riffa_dma_1_pcie_cfg_fc_SEL;
  wire [127:0]nf_riffa_dma_1_s_axis_cc_TDATA;
  wire [3:0]nf_riffa_dma_1_s_axis_cc_TKEEP;
  wire nf_riffa_dma_1_s_axis_cc_TLAST;
  wire [3:0]nf_riffa_dma_1_s_axis_cc_TREADY;
  wire [32:0]nf_riffa_dma_1_s_axis_cc_TUSER;
  wire nf_riffa_dma_1_s_axis_cc_TVALID;
  wire [255:0]nf_riffa_dma_1_s_axis_dma_rx_TDATA;
  wire [31:0]nf_riffa_dma_1_s_axis_dma_rx_TKEEP;
  wire nf_riffa_dma_1_s_axis_dma_rx_TLAST;
  wire nf_riffa_dma_1_s_axis_dma_rx_TREADY;
  wire [255:0]nf_riffa_dma_1_s_axis_dma_rx_TUSER;
  wire nf_riffa_dma_1_s_axis_dma_rx_TVALID;
  wire [127:0]nf_riffa_dma_1_s_axis_rq_TDATA;
  wire [3:0]nf_riffa_dma_1_s_axis_rq_TKEEP;
  wire nf_riffa_dma_1_s_axis_rq_TLAST;
  wire [3:0]nf_riffa_dma_1_s_axis_rq_TREADY;
  wire [59:0]nf_riffa_dma_1_s_axis_rq_TUSER;
  wire nf_riffa_dma_1_s_axis_rq_TVALID;
  wire [127:0]pcie3_7x_1_m_axis_cq_TDATA;
  wire [3:0]pcie3_7x_1_m_axis_cq_TKEEP;
  wire pcie3_7x_1_m_axis_cq_TLAST;
  wire [21:0]pcie3_7x_1_m_axis_cq_TREADY;
  wire [84:0]pcie3_7x_1_m_axis_cq_TUSER;
  wire pcie3_7x_1_m_axis_cq_TVALID;
  wire [127:0]pcie3_7x_1_m_axis_rc_TDATA;
  wire [3:0]pcie3_7x_1_m_axis_rc_TKEEP;
  wire pcie3_7x_1_m_axis_rc_TLAST;
  wire [21:0]pcie3_7x_1_m_axis_rc_TREADY;
  wire [74:0]pcie3_7x_1_m_axis_rc_TUSER;
  wire pcie3_7x_1_m_axis_rc_TVALID;
  wire [7:0]pcie3_7x_1_pcie_7x_mgt_rxn;
  wire [7:0]pcie3_7x_1_pcie_7x_mgt_rxp;
  wire [7:0]pcie3_7x_1_pcie_7x_mgt_txn;
  wire [7:0]pcie3_7x_1_pcie_7x_mgt_txp;
  wire pcie3_7x_1_user_clk;
  wire pcie3_7x_1_user_lnk_up;
  wire pcie3_7x_1_user_reset;
  wire [31:0]s00_axi_1_ARADDR;
  wire [2:0]s00_axi_1_ARPROT;
  wire s00_axi_1_ARREADY;
  wire s00_axi_1_ARVALID;
  wire [31:0]s00_axi_1_AWADDR;
  wire [2:0]s00_axi_1_AWPROT;
  wire s00_axi_1_AWREADY;
  wire s00_axi_1_AWVALID;
  wire s00_axi_1_BREADY;
  wire [1:0]s00_axi_1_BRESP;
  wire s00_axi_1_BVALID;
  wire [31:0]s00_axi_1_RDATA;
  wire s00_axi_1_RREADY;
  wire [1:0]s00_axi_1_RRESP;
  wire s00_axi_1_RVALID;
  wire [31:0]s00_axi_1_WDATA;
  wire s00_axi_1_WREADY;
  wire [3:0]s00_axi_1_WSTRB;
  wire s00_axi_1_WVALID;
  wire sys_clk_1;
  wire sys_reset_1;

  assign M00_ACLK_i = M00_ACLK;
  assign M00_ARESETN_i = M00_ARESETN;
  assign M00_AXI_araddr[11:0] = axi_interconnect_0_M00_AXI_ARADDR;
  assign M00_AXI_arprot[2:0] = axi_interconnect_0_M00_AXI_ARPROT;
  assign M00_AXI_arvalid = axi_interconnect_0_M00_AXI_ARVALID;
  assign M00_AXI_awaddr[11:0] = axi_interconnect_0_M00_AXI_AWADDR;
  assign M00_AXI_awprot[2:0] = axi_interconnect_0_M00_AXI_AWPROT;
  assign M00_AXI_awvalid = axi_interconnect_0_M00_AXI_AWVALID;
  assign M00_AXI_bready = axi_interconnect_0_M00_AXI_BREADY;
  assign M00_AXI_rready = axi_interconnect_0_M00_AXI_RREADY;
  assign M00_AXI_wdata[31:0] = axi_interconnect_0_M00_AXI_WDATA;
  assign M00_AXI_wstrb[3:0] = axi_interconnect_0_M00_AXI_WSTRB;
  assign M00_AXI_wvalid = axi_interconnect_0_M00_AXI_WVALID;
  assign M01_ACLK_i = M01_ACLK;
  assign M01_ARESETN_i = M01_ARESETN;
  assign M01_AXI_araddr[11:0] = axi_interconnect_0_M01_AXI_ARADDR;
  assign M01_AXI_arprot[2:0] = axi_interconnect_0_M01_AXI_ARPROT;
  assign M01_AXI_arvalid = axi_interconnect_0_M01_AXI_ARVALID;
  assign M01_AXI_awaddr[11:0] = axi_interconnect_0_M01_AXI_AWADDR;
  assign M01_AXI_awprot[2:0] = axi_interconnect_0_M01_AXI_AWPROT;
  assign M01_AXI_awvalid = axi_interconnect_0_M01_AXI_AWVALID;
  assign M01_AXI_bready = axi_interconnect_0_M01_AXI_BREADY;
  assign M01_AXI_rready = axi_interconnect_0_M01_AXI_RREADY;
  assign M01_AXI_wdata[31:0] = axi_interconnect_0_M01_AXI_WDATA;
  assign M01_AXI_wstrb[3:0] = axi_interconnect_0_M01_AXI_WSTRB;
  assign M01_AXI_wvalid = axi_interconnect_0_M01_AXI_WVALID;
  assign M02_ACLK_i = M02_ACLK;
  assign M02_ARESETN_i = M02_ARESETN;
  assign M02_AXI_araddr[11:0] = axi_interconnect_0_M02_AXI_ARADDR;
  assign M02_AXI_arprot[2:0] = axi_interconnect_0_M02_AXI_ARPROT;
  assign M02_AXI_arvalid = axi_interconnect_0_M02_AXI_ARVALID;
  assign M02_AXI_awaddr[11:0] = axi_interconnect_0_M02_AXI_AWADDR;
  assign M02_AXI_awprot[2:0] = axi_interconnect_0_M02_AXI_AWPROT;
  assign M02_AXI_awvalid = axi_interconnect_0_M02_AXI_AWVALID;
  assign M02_AXI_bready = axi_interconnect_0_M02_AXI_BREADY;
  assign M02_AXI_rready = axi_interconnect_0_M02_AXI_RREADY;
  assign M02_AXI_wdata[31:0] = axi_interconnect_0_M02_AXI_WDATA;
  assign M02_AXI_wstrb[3:0] = axi_interconnect_0_M02_AXI_WSTRB;
  assign M02_AXI_wvalid = axi_interconnect_0_M02_AXI_WVALID;
  assign M03_ACLK_i = M03_ACLK;
  assign M03_ARESETN_i = M03_ARESETN;
  assign M03_AXI_araddr[11:0] = axi_interconnect_0_M03_AXI_ARADDR;
  assign M03_AXI_arprot[2:0] = axi_interconnect_0_M03_AXI_ARPROT;
  assign M03_AXI_arvalid = axi_interconnect_0_M03_AXI_ARVALID;
  assign M03_AXI_awaddr[11:0] = axi_interconnect_0_M03_AXI_AWADDR;
  assign M03_AXI_awprot[2:0] = axi_interconnect_0_M03_AXI_AWPROT;
  assign M03_AXI_awvalid = axi_interconnect_0_M03_AXI_AWVALID;
  assign M03_AXI_bready = axi_interconnect_0_M03_AXI_BREADY;
  assign M03_AXI_rready = axi_interconnect_0_M03_AXI_RREADY;
  assign M03_AXI_wdata[31:0] = axi_interconnect_0_M03_AXI_WDATA;
  assign M03_AXI_wstrb[3:0] = axi_interconnect_0_M03_AXI_WSTRB;
  assign M03_AXI_wvalid = axi_interconnect_0_M03_AXI_WVALID;
  assign M04_ACLK_i = M04_ACLK;
  assign M04_ARESETN_i = M04_ARESETN;
  assign M04_AXI_araddr[11:0] = axi_interconnect_0_M04_AXI_ARADDR;
  assign M04_AXI_arprot[2:0] = axi_interconnect_0_M04_AXI_ARPROT;
  assign M04_AXI_arvalid = axi_interconnect_0_M04_AXI_ARVALID;
  assign M04_AXI_awaddr[11:0] = axi_interconnect_0_M04_AXI_AWADDR;
  assign M04_AXI_awprot[2:0] = axi_interconnect_0_M04_AXI_AWPROT;
  assign M04_AXI_awvalid = axi_interconnect_0_M04_AXI_AWVALID;
  assign M04_AXI_bready = axi_interconnect_0_M04_AXI_BREADY;
  assign M04_AXI_rready = axi_interconnect_0_M04_AXI_RREADY;
  assign M04_AXI_wdata[31:0] = axi_interconnect_0_M04_AXI_WDATA;
  assign M04_AXI_wstrb[3:0] = axi_interconnect_0_M04_AXI_WSTRB;
  assign M04_AXI_wvalid = axi_interconnect_0_M04_AXI_WVALID;
  assign M05_ACLK_i = M05_ACLK;
  assign M05_ARESETN_i = M05_ARESETN;
  assign M05_AXI_araddr[11:0] = axi_interconnect_0_M05_AXI_ARADDR;
  assign M05_AXI_arprot[2:0] = axi_interconnect_0_M05_AXI_ARPROT;
  assign M05_AXI_arvalid = axi_interconnect_0_M05_AXI_ARVALID;
  assign M05_AXI_awaddr[11:0] = axi_interconnect_0_M05_AXI_AWADDR;
  assign M05_AXI_awprot[2:0] = axi_interconnect_0_M05_AXI_AWPROT;
  assign M05_AXI_awvalid = axi_interconnect_0_M05_AXI_AWVALID;
  assign M05_AXI_bready = axi_interconnect_0_M05_AXI_BREADY;
  assign M05_AXI_rready = axi_interconnect_0_M05_AXI_RREADY;
  assign M05_AXI_wdata[31:0] = axi_interconnect_0_M05_AXI_WDATA;
  assign M05_AXI_wstrb[3:0] = axi_interconnect_0_M05_AXI_WSTRB;
  assign M05_AXI_wvalid = axi_interconnect_0_M05_AXI_WVALID;
  assign M06_ACLK_i = M06_ACLK;
  assign M06_ARESETN_i = M06_ARESETN;
  assign M06_AXI_araddr[11:0] = axi_interconnect_0_M06_AXI_ARADDR;
  assign M06_AXI_arprot[2:0] = axi_interconnect_0_M06_AXI_ARPROT;
  assign M06_AXI_arvalid = axi_interconnect_0_M06_AXI_ARVALID;
  assign M06_AXI_awaddr[11:0] = axi_interconnect_0_M06_AXI_AWADDR;
  assign M06_AXI_awprot[2:0] = axi_interconnect_0_M06_AXI_AWPROT;
  assign M06_AXI_awvalid = axi_interconnect_0_M06_AXI_AWVALID;
  assign M06_AXI_bready = axi_interconnect_0_M06_AXI_BREADY;
  assign M06_AXI_rready = axi_interconnect_0_M06_AXI_RREADY;
  assign M06_AXI_wdata[31:0] = axi_interconnect_0_M06_AXI_WDATA;
  assign M06_AXI_wstrb[3:0] = axi_interconnect_0_M06_AXI_WSTRB;
  assign M06_AXI_wvalid = axi_interconnect_0_M06_AXI_WVALID;
  assign M07_ACLK_i = M07_ACLK;
  assign M07_ARESETN_i = M07_ARESETN;
  assign M07_AXI_araddr[11:0] = axi_interconnect_0_M07_AXI_ARADDR;
  assign M07_AXI_arprot[2:0] = axi_interconnect_0_M07_AXI_ARPROT;
  assign M07_AXI_arvalid = axi_interconnect_0_M07_AXI_ARVALID;
  assign M07_AXI_awaddr[11:0] = axi_interconnect_0_M07_AXI_AWADDR;
  assign M07_AXI_awprot[2:0] = axi_interconnect_0_M07_AXI_AWPROT;
  assign M07_AXI_awvalid = axi_interconnect_0_M07_AXI_AWVALID;
  assign M07_AXI_bready = axi_interconnect_0_M07_AXI_BREADY;
  assign M07_AXI_rready = axi_interconnect_0_M07_AXI_RREADY;
  assign M07_AXI_wdata[31:0] = axi_interconnect_0_M07_AXI_WDATA;
  assign M07_AXI_wstrb[3:0] = axi_interconnect_0_M07_AXI_WSTRB;
  assign M07_AXI_wvalid = axi_interconnect_0_M07_AXI_WVALID;
  assign axi_interconnect_0_M00_AXI_ARREADY = M00_AXI_arready;
  assign axi_interconnect_0_M00_AXI_AWREADY = M00_AXI_awready;
  assign axi_interconnect_0_M00_AXI_BRESP = M00_AXI_bresp[1:0];
  assign axi_interconnect_0_M00_AXI_BVALID = M00_AXI_bvalid;
  assign axi_interconnect_0_M00_AXI_RDATA = M00_AXI_rdata[31:0];
  assign axi_interconnect_0_M00_AXI_RRESP = M00_AXI_rresp[1:0];
  assign axi_interconnect_0_M00_AXI_RVALID = M00_AXI_rvalid;
  assign axi_interconnect_0_M00_AXI_WREADY = M00_AXI_wready;
  assign axi_interconnect_0_M01_AXI_ARREADY = M01_AXI_arready;
  assign axi_interconnect_0_M01_AXI_AWREADY = M01_AXI_awready;
  assign axi_interconnect_0_M01_AXI_BRESP = M01_AXI_bresp[1:0];
  assign axi_interconnect_0_M01_AXI_BVALID = M01_AXI_bvalid;
  assign axi_interconnect_0_M01_AXI_RDATA = M01_AXI_rdata[31:0];
  assign axi_interconnect_0_M01_AXI_RRESP = M01_AXI_rresp[1:0];
  assign axi_interconnect_0_M01_AXI_RVALID = M01_AXI_rvalid;
  assign axi_interconnect_0_M01_AXI_WREADY = M01_AXI_wready;
  assign axi_interconnect_0_M02_AXI_ARREADY = M02_AXI_arready;
  assign axi_interconnect_0_M02_AXI_AWREADY = M02_AXI_awready;
  assign axi_interconnect_0_M02_AXI_BRESP = M02_AXI_bresp[1:0];
  assign axi_interconnect_0_M02_AXI_BVALID = M02_AXI_bvalid;
  assign axi_interconnect_0_M02_AXI_RDATA = M02_AXI_rdata[31:0];
  assign axi_interconnect_0_M02_AXI_RRESP = M02_AXI_rresp[1:0];
  assign axi_interconnect_0_M02_AXI_RVALID = M02_AXI_rvalid;
  assign axi_interconnect_0_M02_AXI_WREADY = M02_AXI_wready;
  assign axi_interconnect_0_M03_AXI_ARREADY = M03_AXI_arready;
  assign axi_interconnect_0_M03_AXI_AWREADY = M03_AXI_awready;
  assign axi_interconnect_0_M03_AXI_BRESP = M03_AXI_bresp[1:0];
  assign axi_interconnect_0_M03_AXI_BVALID = M03_AXI_bvalid;
  assign axi_interconnect_0_M03_AXI_RDATA = M03_AXI_rdata[31:0];
  assign axi_interconnect_0_M03_AXI_RRESP = M03_AXI_rresp[1:0];
  assign axi_interconnect_0_M03_AXI_RVALID = M03_AXI_rvalid;
  assign axi_interconnect_0_M03_AXI_WREADY = M03_AXI_wready;
  assign axi_interconnect_0_M04_AXI_ARREADY = M04_AXI_arready;
  assign axi_interconnect_0_M04_AXI_AWREADY = M04_AXI_awready;
  assign axi_interconnect_0_M04_AXI_BRESP = M04_AXI_bresp[1:0];
  assign axi_interconnect_0_M04_AXI_BVALID = M04_AXI_bvalid;
  assign axi_interconnect_0_M04_AXI_RDATA = M04_AXI_rdata[31:0];
  assign axi_interconnect_0_M04_AXI_RRESP = M04_AXI_rresp[1:0];
  assign axi_interconnect_0_M04_AXI_RVALID = M04_AXI_rvalid;
  assign axi_interconnect_0_M04_AXI_WREADY = M04_AXI_wready;
  assign axi_interconnect_0_M05_AXI_ARREADY = M05_AXI_arready;
  assign axi_interconnect_0_M05_AXI_AWREADY = M05_AXI_awready;
  assign axi_interconnect_0_M05_AXI_BRESP = M05_AXI_bresp[1:0];
  assign axi_interconnect_0_M05_AXI_BVALID = M05_AXI_bvalid;
  assign axi_interconnect_0_M05_AXI_RDATA = M05_AXI_rdata[31:0];
  assign axi_interconnect_0_M05_AXI_RRESP = M05_AXI_rresp[1:0];
  assign axi_interconnect_0_M05_AXI_RVALID = M05_AXI_rvalid;
  assign axi_interconnect_0_M05_AXI_WREADY = M05_AXI_wready;
  assign axi_interconnect_0_M06_AXI_ARREADY = M06_AXI_arready;
  assign axi_interconnect_0_M06_AXI_AWREADY = M06_AXI_awready;
  assign axi_interconnect_0_M06_AXI_BRESP = M06_AXI_bresp[1:0];
  assign axi_interconnect_0_M06_AXI_BVALID = M06_AXI_bvalid;
  assign axi_interconnect_0_M06_AXI_RDATA = M06_AXI_rdata[31:0];
  assign axi_interconnect_0_M06_AXI_RRESP = M06_AXI_rresp[1:0];
  assign axi_interconnect_0_M06_AXI_RVALID = M06_AXI_rvalid;
  assign axi_interconnect_0_M06_AXI_WREADY = M06_AXI_wready;
  assign axi_interconnect_0_M07_AXI_ARREADY = M07_AXI_arready;
  assign axi_interconnect_0_M07_AXI_AWREADY = M07_AXI_awready;
  assign axi_interconnect_0_M07_AXI_BRESP = M07_AXI_bresp[1:0];
  assign axi_interconnect_0_M07_AXI_BVALID = M07_AXI_bvalid;
  assign axi_interconnect_0_M07_AXI_RDATA = M07_AXI_rdata[31:0];
  assign axi_interconnect_0_M07_AXI_RRESP = M07_AXI_rresp[1:0];
  assign axi_interconnect_0_M07_AXI_RVALID = M07_AXI_rvalid;
  assign axi_interconnect_0_M07_AXI_WREADY = M07_AXI_wready;
  assign axi_lite_clk_1 = axi_lite_aclk;
  assign axi_lite_rstn_1 = axi_lite_aresetn;
  assign axis_10g_clk_1 = axis_datapath_aclk;
  assign axis_rx_sys_reset_0_peripheral_aresetn = axis_datapath_aresetn;
  assign m_axis_dma_tx_tdata[255:0] = nf_riffa_dma_1_m_axis_dma_tx_TDATA;
  assign m_axis_dma_tx_tkeep[31:0] = nf_riffa_dma_1_m_axis_dma_tx_TKEEP;
  assign m_axis_dma_tx_tlast = nf_riffa_dma_1_m_axis_dma_tx_TLAST;
  assign m_axis_dma_tx_tuser[255:0] = nf_riffa_dma_1_m_axis_dma_tx_TUSER;
  assign m_axis_dma_tx_tvalid = nf_riffa_dma_1_m_axis_dma_tx_TVALID;
  assign nf_riffa_dma_1_m_axis_dma_tx_TREADY = m_axis_dma_tx_tready;
  assign nf_riffa_dma_1_s_axis_dma_rx_TDATA = s_axis_dma_rx_tdata[255:0];
  assign nf_riffa_dma_1_s_axis_dma_rx_TKEEP = s_axis_dma_rx_tkeep[31:0];
  assign nf_riffa_dma_1_s_axis_dma_rx_TLAST = s_axis_dma_rx_tlast;
  assign nf_riffa_dma_1_s_axis_dma_rx_TUSER = s_axis_dma_rx_tuser[255:0];
  assign nf_riffa_dma_1_s_axis_dma_rx_TVALID = s_axis_dma_rx_tvalid;
  assign pcie3_7x_1_pcie_7x_mgt_rxn = pcie_7x_mgt_rxn[7:0];
  assign pcie3_7x_1_pcie_7x_mgt_rxp = pcie_7x_mgt_rxp[7:0];
  assign pcie_7x_mgt_txn[7:0] = pcie3_7x_1_pcie_7x_mgt_txn;
  assign pcie_7x_mgt_txp[7:0] = pcie3_7x_1_pcie_7x_mgt_txp;
  assign s_axis_dma_rx_tready = nf_riffa_dma_1_s_axis_dma_rx_TREADY;
  assign sys_clk_1 = sys_clk;
  assign sys_reset_1 = sys_reset;
  control_sub_axi_clock_converter_0_0 axi_clock_converter_0
       (.m_axi_aclk(pcie3_7x_1_user_clk),
        .m_axi_araddr(axi_clock_converter_0_M_AXI_ARADDR),
        .m_axi_aresetn(axis_tx_sys_reset_0_peripheral_aresetn),
        .m_axi_arready(axi_clock_converter_0_M_AXI_ARREADY),
        .m_axi_arvalid(axi_clock_converter_0_M_AXI_ARVALID),
        .m_axi_awaddr(axi_clock_converter_0_M_AXI_AWADDR),
        .m_axi_awready(axi_clock_converter_0_M_AXI_AWREADY),
        .m_axi_awvalid(axi_clock_converter_0_M_AXI_AWVALID),
        .m_axi_bready(axi_clock_converter_0_M_AXI_BREADY),
        .m_axi_bresp(axi_clock_converter_0_M_AXI_BRESP),
        .m_axi_bvalid(axi_clock_converter_0_M_AXI_BVALID),
        .m_axi_rdata(axi_clock_converter_0_M_AXI_RDATA),
        .m_axi_rready(axi_clock_converter_0_M_AXI_RREADY),
        .m_axi_rresp(axi_clock_converter_0_M_AXI_RRESP),
        .m_axi_rvalid(axi_clock_converter_0_M_AXI_RVALID),
        .m_axi_wdata(axi_clock_converter_0_M_AXI_WDATA),
        .m_axi_wready(axi_clock_converter_0_M_AXI_WREADY),
        .m_axi_wstrb(axi_clock_converter_0_M_AXI_WSTRB),
        .m_axi_wvalid(axi_clock_converter_0_M_AXI_WVALID),
        .s_axi_aclk(axis_10g_clk_1),
        .s_axi_araddr(axi_interconnect_0_M08_AXI_ARADDR),
        .s_axi_aresetn(axis_rx_sys_reset_0_peripheral_aresetn),
        .s_axi_arprot(axi_interconnect_0_M08_AXI_ARPROT),
        .s_axi_arready(axi_interconnect_0_M08_AXI_ARREADY),
        .s_axi_arvalid(axi_interconnect_0_M08_AXI_ARVALID),
        .s_axi_awaddr(axi_interconnect_0_M08_AXI_AWADDR),
        .s_axi_awprot(axi_interconnect_0_M08_AXI_AWPROT),
        .s_axi_awready(axi_interconnect_0_M08_AXI_AWREADY),
        .s_axi_awvalid(axi_interconnect_0_M08_AXI_AWVALID),
        .s_axi_bready(axi_interconnect_0_M08_AXI_BREADY),
        .s_axi_bresp(axi_interconnect_0_M08_AXI_BRESP),
        .s_axi_bvalid(axi_interconnect_0_M08_AXI_BVALID),
        .s_axi_rdata(axi_interconnect_0_M08_AXI_RDATA),
        .s_axi_rready(axi_interconnect_0_M08_AXI_RREADY),
        .s_axi_rresp(axi_interconnect_0_M08_AXI_RRESP),
        .s_axi_rvalid(axi_interconnect_0_M08_AXI_RVALID),
        .s_axi_wdata(axi_interconnect_0_M08_AXI_WDATA),
        .s_axi_wready(axi_interconnect_0_M08_AXI_WREADY),
        .s_axi_wstrb(axi_interconnect_0_M08_AXI_WSTRB),
        .s_axi_wvalid(axi_interconnect_0_M08_AXI_WVALID));
  control_sub_axi_interconnect_0_0 axi_interconnect_0
       (.ACLK(axis_10g_clk_1),
        .ARESETN(axis_rx_sys_reset_0_peripheral_aresetn),
        .M00_ACLK(M00_ACLK_i),
        .M00_ARESETN(M00_ARESETN_i),
        .M00_AXI_araddr(axi_interconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arprot(axi_interconnect_0_M00_AXI_ARPROT),
        .M00_AXI_arready(axi_interconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arvalid(axi_interconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_interconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awprot(axi_interconnect_0_M00_AXI_AWPROT),
        .M00_AXI_awready(axi_interconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awvalid(axi_interconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_interconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_interconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_interconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_interconnect_0_M00_AXI_RDATA),
        .M00_AXI_rready(axi_interconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_interconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_interconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_interconnect_0_M00_AXI_WDATA),
        .M00_AXI_wready(axi_interconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_interconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_interconnect_0_M00_AXI_WVALID),
        .M01_ACLK(M01_ACLK_i),
        .M01_ARESETN(M01_ARESETN_i),
        .M01_AXI_araddr(axi_interconnect_0_M01_AXI_ARADDR),
        .M01_AXI_arprot(axi_interconnect_0_M01_AXI_ARPROT),
        .M01_AXI_arready(axi_interconnect_0_M01_AXI_ARREADY),
        .M01_AXI_arvalid(axi_interconnect_0_M01_AXI_ARVALID),
        .M01_AXI_awaddr(axi_interconnect_0_M01_AXI_AWADDR),
        .M01_AXI_awprot(axi_interconnect_0_M01_AXI_AWPROT),
        .M01_AXI_awready(axi_interconnect_0_M01_AXI_AWREADY),
        .M01_AXI_awvalid(axi_interconnect_0_M01_AXI_AWVALID),
        .M01_AXI_bready(axi_interconnect_0_M01_AXI_BREADY),
        .M01_AXI_bresp(axi_interconnect_0_M01_AXI_BRESP),
        .M01_AXI_bvalid(axi_interconnect_0_M01_AXI_BVALID),
        .M01_AXI_rdata(axi_interconnect_0_M01_AXI_RDATA),
        .M01_AXI_rready(axi_interconnect_0_M01_AXI_RREADY),
        .M01_AXI_rresp(axi_interconnect_0_M01_AXI_RRESP),
        .M01_AXI_rvalid(axi_interconnect_0_M01_AXI_RVALID),
        .M01_AXI_wdata(axi_interconnect_0_M01_AXI_WDATA),
        .M01_AXI_wready(axi_interconnect_0_M01_AXI_WREADY),
        .M01_AXI_wstrb(axi_interconnect_0_M01_AXI_WSTRB),
        .M01_AXI_wvalid(axi_interconnect_0_M01_AXI_WVALID),
        .M02_ACLK(M02_ACLK_i),
        .M02_ARESETN(M02_ARESETN_i),
        .M02_AXI_araddr(axi_interconnect_0_M02_AXI_ARADDR),
        .M02_AXI_arprot(axi_interconnect_0_M02_AXI_ARPROT),
        .M02_AXI_arready(axi_interconnect_0_M02_AXI_ARREADY),
        .M02_AXI_arvalid(axi_interconnect_0_M02_AXI_ARVALID),
        .M02_AXI_awaddr(axi_interconnect_0_M02_AXI_AWADDR),
        .M02_AXI_awprot(axi_interconnect_0_M02_AXI_AWPROT),
        .M02_AXI_awready(axi_interconnect_0_M02_AXI_AWREADY),
        .M02_AXI_awvalid(axi_interconnect_0_M02_AXI_AWVALID),
        .M02_AXI_bready(axi_interconnect_0_M02_AXI_BREADY),
        .M02_AXI_bresp(axi_interconnect_0_M02_AXI_BRESP),
        .M02_AXI_bvalid(axi_interconnect_0_M02_AXI_BVALID),
        .M02_AXI_rdata(axi_interconnect_0_M02_AXI_RDATA),
        .M02_AXI_rready(axi_interconnect_0_M02_AXI_RREADY),
        .M02_AXI_rresp(axi_interconnect_0_M02_AXI_RRESP),
        .M02_AXI_rvalid(axi_interconnect_0_M02_AXI_RVALID),
        .M02_AXI_wdata(axi_interconnect_0_M02_AXI_WDATA),
        .M02_AXI_wready(axi_interconnect_0_M02_AXI_WREADY),
        .M02_AXI_wstrb(axi_interconnect_0_M02_AXI_WSTRB),
        .M02_AXI_wvalid(axi_interconnect_0_M02_AXI_WVALID),
        .M03_ACLK(M03_ACLK_i),
        .M03_ARESETN(M03_ARESETN_i),
        .M03_AXI_araddr(axi_interconnect_0_M03_AXI_ARADDR),
        .M03_AXI_arprot(axi_interconnect_0_M03_AXI_ARPROT),
        .M03_AXI_arready(axi_interconnect_0_M03_AXI_ARREADY),
        .M03_AXI_arvalid(axi_interconnect_0_M03_AXI_ARVALID),
        .M03_AXI_awaddr(axi_interconnect_0_M03_AXI_AWADDR),
        .M03_AXI_awprot(axi_interconnect_0_M03_AXI_AWPROT),
        .M03_AXI_awready(axi_interconnect_0_M03_AXI_AWREADY),
        .M03_AXI_awvalid(axi_interconnect_0_M03_AXI_AWVALID),
        .M03_AXI_bready(axi_interconnect_0_M03_AXI_BREADY),
        .M03_AXI_bresp(axi_interconnect_0_M03_AXI_BRESP),
        .M03_AXI_bvalid(axi_interconnect_0_M03_AXI_BVALID),
        .M03_AXI_rdata(axi_interconnect_0_M03_AXI_RDATA),
        .M03_AXI_rready(axi_interconnect_0_M03_AXI_RREADY),
        .M03_AXI_rresp(axi_interconnect_0_M03_AXI_RRESP),
        .M03_AXI_rvalid(axi_interconnect_0_M03_AXI_RVALID),
        .M03_AXI_wdata(axi_interconnect_0_M03_AXI_WDATA),
        .M03_AXI_wready(axi_interconnect_0_M03_AXI_WREADY),
        .M03_AXI_wstrb(axi_interconnect_0_M03_AXI_WSTRB),
        .M03_AXI_wvalid(axi_interconnect_0_M03_AXI_WVALID),
        .M04_ACLK(M04_ACLK_i),
        .M04_ARESETN(M04_ARESETN_i),
        .M04_AXI_araddr(axi_interconnect_0_M04_AXI_ARADDR),
        .M04_AXI_arprot(axi_interconnect_0_M04_AXI_ARPROT),
        .M04_AXI_arready(axi_interconnect_0_M04_AXI_ARREADY),
        .M04_AXI_arvalid(axi_interconnect_0_M04_AXI_ARVALID),
        .M04_AXI_awaddr(axi_interconnect_0_M04_AXI_AWADDR),
        .M04_AXI_awprot(axi_interconnect_0_M04_AXI_AWPROT),
        .M04_AXI_awready(axi_interconnect_0_M04_AXI_AWREADY),
        .M04_AXI_awvalid(axi_interconnect_0_M04_AXI_AWVALID),
        .M04_AXI_bready(axi_interconnect_0_M04_AXI_BREADY),
        .M04_AXI_bresp(axi_interconnect_0_M04_AXI_BRESP),
        .M04_AXI_bvalid(axi_interconnect_0_M04_AXI_BVALID),
        .M04_AXI_rdata(axi_interconnect_0_M04_AXI_RDATA),
        .M04_AXI_rready(axi_interconnect_0_M04_AXI_RREADY),
        .M04_AXI_rresp(axi_interconnect_0_M04_AXI_RRESP),
        .M04_AXI_rvalid(axi_interconnect_0_M04_AXI_RVALID),
        .M04_AXI_wdata(axi_interconnect_0_M04_AXI_WDATA),
        .M04_AXI_wready(axi_interconnect_0_M04_AXI_WREADY),
        .M04_AXI_wstrb(axi_interconnect_0_M04_AXI_WSTRB),
        .M04_AXI_wvalid(axi_interconnect_0_M04_AXI_WVALID),
        .M05_ACLK(M05_ACLK_i),
        .M05_ARESETN(M05_ARESETN_i),
        .M05_AXI_araddr(axi_interconnect_0_M05_AXI_ARADDR),
        .M05_AXI_arprot(axi_interconnect_0_M05_AXI_ARPROT),
        .M05_AXI_arready(axi_interconnect_0_M05_AXI_ARREADY),
        .M05_AXI_arvalid(axi_interconnect_0_M05_AXI_ARVALID),
        .M05_AXI_awaddr(axi_interconnect_0_M05_AXI_AWADDR),
        .M05_AXI_awprot(axi_interconnect_0_M05_AXI_AWPROT),
        .M05_AXI_awready(axi_interconnect_0_M05_AXI_AWREADY),
        .M05_AXI_awvalid(axi_interconnect_0_M05_AXI_AWVALID),
        .M05_AXI_bready(axi_interconnect_0_M05_AXI_BREADY),
        .M05_AXI_bresp(axi_interconnect_0_M05_AXI_BRESP),
        .M05_AXI_bvalid(axi_interconnect_0_M05_AXI_BVALID),
        .M05_AXI_rdata(axi_interconnect_0_M05_AXI_RDATA),
        .M05_AXI_rready(axi_interconnect_0_M05_AXI_RREADY),
        .M05_AXI_rresp(axi_interconnect_0_M05_AXI_RRESP),
        .M05_AXI_rvalid(axi_interconnect_0_M05_AXI_RVALID),
        .M05_AXI_wdata(axi_interconnect_0_M05_AXI_WDATA),
        .M05_AXI_wready(axi_interconnect_0_M05_AXI_WREADY),
        .M05_AXI_wstrb(axi_interconnect_0_M05_AXI_WSTRB),
        .M05_AXI_wvalid(axi_interconnect_0_M05_AXI_WVALID),
        .M06_ACLK(M06_ACLK_i),
        .M06_ARESETN(M06_ARESETN_i),
        .M06_AXI_araddr(axi_interconnect_0_M06_AXI_ARADDR),
        .M06_AXI_arprot(axi_interconnect_0_M06_AXI_ARPROT),
        .M06_AXI_arready(axi_interconnect_0_M06_AXI_ARREADY),
        .M06_AXI_arvalid(axi_interconnect_0_M06_AXI_ARVALID),
        .M06_AXI_awaddr(axi_interconnect_0_M06_AXI_AWADDR),
        .M06_AXI_awprot(axi_interconnect_0_M06_AXI_AWPROT),
        .M06_AXI_awready(axi_interconnect_0_M06_AXI_AWREADY),
        .M06_AXI_awvalid(axi_interconnect_0_M06_AXI_AWVALID),
        .M06_AXI_bready(axi_interconnect_0_M06_AXI_BREADY),
        .M06_AXI_bresp(axi_interconnect_0_M06_AXI_BRESP),
        .M06_AXI_bvalid(axi_interconnect_0_M06_AXI_BVALID),
        .M06_AXI_rdata(axi_interconnect_0_M06_AXI_RDATA),
        .M06_AXI_rready(axi_interconnect_0_M06_AXI_RREADY),
        .M06_AXI_rresp(axi_interconnect_0_M06_AXI_RRESP),
        .M06_AXI_rvalid(axi_interconnect_0_M06_AXI_RVALID),
        .M06_AXI_wdata(axi_interconnect_0_M06_AXI_WDATA),
        .M06_AXI_wready(axi_interconnect_0_M06_AXI_WREADY),
        .M06_AXI_wstrb(axi_interconnect_0_M06_AXI_WSTRB),
        .M06_AXI_wvalid(axi_interconnect_0_M06_AXI_WVALID),
        .M07_ACLK(M07_ACLK_i),
        .M07_ARESETN(M07_ARESETN_i),
        .M07_AXI_araddr(axi_interconnect_0_M07_AXI_ARADDR),
        .M07_AXI_arprot(axi_interconnect_0_M07_AXI_ARPROT),
        .M07_AXI_arready(axi_interconnect_0_M07_AXI_ARREADY),
        .M07_AXI_arvalid(axi_interconnect_0_M07_AXI_ARVALID),
        .M07_AXI_awaddr(axi_interconnect_0_M07_AXI_AWADDR),
        .M07_AXI_awprot(axi_interconnect_0_M07_AXI_AWPROT),
        .M07_AXI_awready(axi_interconnect_0_M07_AXI_AWREADY),
        .M07_AXI_awvalid(axi_interconnect_0_M07_AXI_AWVALID),
        .M07_AXI_bready(axi_interconnect_0_M07_AXI_BREADY),
        .M07_AXI_bresp(axi_interconnect_0_M07_AXI_BRESP),
        .M07_AXI_bvalid(axi_interconnect_0_M07_AXI_BVALID),
        .M07_AXI_rdata(axi_interconnect_0_M07_AXI_RDATA),
        .M07_AXI_rready(axi_interconnect_0_M07_AXI_RREADY),
        .M07_AXI_rresp(axi_interconnect_0_M07_AXI_RRESP),
        .M07_AXI_rvalid(axi_interconnect_0_M07_AXI_RVALID),
        .M07_AXI_wdata(axi_interconnect_0_M07_AXI_WDATA),
        .M07_AXI_wready(axi_interconnect_0_M07_AXI_WREADY),
        .M07_AXI_wstrb(axi_interconnect_0_M07_AXI_WSTRB),
        .M07_AXI_wvalid(axi_interconnect_0_M07_AXI_WVALID),
        .M08_ACLK(axis_10g_clk_1),
        .M08_ARESETN(axis_rx_sys_reset_0_peripheral_aresetn),
        .M08_AXI_araddr(axi_interconnect_0_M08_AXI_ARADDR),
        .M08_AXI_arprot(axi_interconnect_0_M08_AXI_ARPROT),
        .M08_AXI_arready(axi_interconnect_0_M08_AXI_ARREADY),
        .M08_AXI_arvalid(axi_interconnect_0_M08_AXI_ARVALID),
        .M08_AXI_awaddr(axi_interconnect_0_M08_AXI_AWADDR),
        .M08_AXI_awprot(axi_interconnect_0_M08_AXI_AWPROT),
        .M08_AXI_awready(axi_interconnect_0_M08_AXI_AWREADY),
        .M08_AXI_awvalid(axi_interconnect_0_M08_AXI_AWVALID),
        .M08_AXI_bready(axi_interconnect_0_M08_AXI_BREADY),
        .M08_AXI_bresp(axi_interconnect_0_M08_AXI_BRESP),
        .M08_AXI_bvalid(axi_interconnect_0_M08_AXI_BVALID),
        .M08_AXI_rdata(axi_interconnect_0_M08_AXI_RDATA),
        .M08_AXI_rready(axi_interconnect_0_M08_AXI_RREADY),
        .M08_AXI_rresp(axi_interconnect_0_M08_AXI_RRESP),
        .M08_AXI_rvalid(axi_interconnect_0_M08_AXI_RVALID),
        .M08_AXI_wdata(axi_interconnect_0_M08_AXI_WDATA),
        .M08_AXI_wready(axi_interconnect_0_M08_AXI_WREADY),
        .M08_AXI_wstrb(axi_interconnect_0_M08_AXI_WSTRB),
        .M08_AXI_wvalid(axi_interconnect_0_M08_AXI_WVALID),
        .S00_ACLK(axi_lite_clk_1),
        .S00_ARESETN(axi_lite_rstn_1),
        .S00_AXI_araddr(s00_axi_1_ARADDR),
        .S00_AXI_arprot(s00_axi_1_ARPROT),
        .S00_AXI_arready(s00_axi_1_ARREADY),
        .S00_AXI_arvalid(s00_axi_1_ARVALID),
        .S00_AXI_awaddr(s00_axi_1_AWADDR),
        .S00_AXI_awprot(s00_axi_1_AWPROT),
        .S00_AXI_awready(s00_axi_1_AWREADY),
        .S00_AXI_awvalid(s00_axi_1_AWVALID),
        .S00_AXI_bready(s00_axi_1_BREADY),
        .S00_AXI_bresp(s00_axi_1_BRESP),
        .S00_AXI_bvalid(s00_axi_1_BVALID),
        .S00_AXI_rdata(s00_axi_1_RDATA),
        .S00_AXI_rready(s00_axi_1_RREADY),
        .S00_AXI_rresp(s00_axi_1_RRESP),
        .S00_AXI_rvalid(s00_axi_1_RVALID),
        .S00_AXI_wdata(s00_axi_1_WDATA),
        .S00_AXI_wready(s00_axi_1_WREADY),
        .S00_AXI_wstrb(s00_axi_1_WSTRB),
        .S00_AXI_wvalid(s00_axi_1_WVALID));
  control_sub_axis_dwidth_dma_rx_0 axis_dwidth_dma_rx
       (.aclk(axis_10g_clk_1),
        .aresetn(axis_rx_sys_reset_0_peripheral_aresetn),
        .m_axis_tdata(nf_riffa_dma_1_fifo_dwidth_rx_TDATA),
        .m_axis_tkeep(nf_riffa_dma_1_fifo_dwidth_rx_TKEEP),
        .m_axis_tlast(nf_riffa_dma_1_fifo_dwidth_rx_TLAST),
        .m_axis_tready(nf_riffa_dma_1_fifo_dwidth_rx_TREADY),
        .m_axis_tuser(nf_riffa_dma_1_fifo_dwidth_rx_TUSER),
        .m_axis_tvalid(nf_riffa_dma_1_fifo_dwidth_rx_TVALID),
        .s_axis_tdata(nf_riffa_dma_1_s_axis_dma_rx_TDATA),
        .s_axis_tkeep(nf_riffa_dma_1_s_axis_dma_rx_TKEEP),
        .s_axis_tlast(nf_riffa_dma_1_s_axis_dma_rx_TLAST),
        .s_axis_tready(nf_riffa_dma_1_s_axis_dma_rx_TREADY),
        .s_axis_tuser(nf_riffa_dma_1_s_axis_dma_rx_TUSER),
        .s_axis_tvalid(nf_riffa_dma_1_s_axis_dma_rx_TVALID));
  control_sub_axis_dwidth_dma_tx_0 axis_dwidth_dma_tx
       (.aclk(axis_10g_clk_1),
        .aresetn(axis_rx_sys_reset_0_peripheral_aresetn),
        .m_axis_tdata(nf_riffa_dma_1_m_axis_dma_tx_TDATA),
        .m_axis_tkeep(nf_riffa_dma_1_m_axis_dma_tx_TKEEP),
        .m_axis_tlast(nf_riffa_dma_1_m_axis_dma_tx_TLAST),
        .m_axis_tready(nf_riffa_dma_1_m_axis_dma_tx_TREADY),
        .m_axis_tuser(nf_riffa_dma_1_m_axis_dma_tx_TUSER),
        .m_axis_tvalid(nf_riffa_dma_1_m_axis_dma_tx_TVALID),
        .s_axis_tdata(nf_riffa_dma_1_fifo_dwidth_tx_TDATA),
        .s_axis_tkeep(nf_riffa_dma_1_fifo_dwidth_tx_TKEEP),
        .s_axis_tlast(nf_riffa_dma_1_fifo_dwidth_tx_TLAST),
        .s_axis_tready(nf_riffa_dma_1_fifo_dwidth_tx_TREADY),
        .s_axis_tuser(nf_riffa_dma_1_fifo_dwidth_tx_TUSER),
        .s_axis_tvalid(nf_riffa_dma_1_fifo_dwidth_tx_TVALID));
  control_sub_axis_fifo_10g_rx_0 axis_fifo_10g_rx
       (.m_axis_aclk(pcie3_7x_1_user_clk),
        .m_axis_aresetn(axis_tx_sys_reset_0_peripheral_aresetn),
        .m_axis_tdata(axis_fifo_10g_rx_M_AXIS_TDATA),
        .m_axis_tkeep(axis_fifo_10g_rx_M_AXIS_TKEEP),
        .m_axis_tlast(axis_fifo_10g_rx_M_AXIS_TLAST),
        .m_axis_tready(axis_fifo_10g_rx_M_AXIS_TREADY),
        .m_axis_tuser(axis_fifo_10g_rx_M_AXIS_TUSER),
        .m_axis_tvalid(axis_fifo_10g_rx_M_AXIS_TVALID),
        .s_axis_aclk(axis_10g_clk_1),
        .s_axis_aresetn(axis_rx_sys_reset_0_peripheral_aresetn),
        .s_axis_tdata(nf_riffa_dma_1_fifo_dwidth_rx_TDATA),
        .s_axis_tkeep(nf_riffa_dma_1_fifo_dwidth_rx_TKEEP),
        .s_axis_tlast(nf_riffa_dma_1_fifo_dwidth_rx_TLAST),
        .s_axis_tready(nf_riffa_dma_1_fifo_dwidth_rx_TREADY),
        .s_axis_tuser(nf_riffa_dma_1_fifo_dwidth_rx_TUSER),
        .s_axis_tvalid(nf_riffa_dma_1_fifo_dwidth_rx_TVALID));
  control_sub_axis_fifo_10g_tx_0 axis_fifo_10g_tx
       (.m_axis_aclk(axis_10g_clk_1),
        .m_axis_aresetn(axis_rx_sys_reset_0_peripheral_aresetn),
        .m_axis_tdata(nf_riffa_dma_1_fifo_dwidth_tx_TDATA),
        .m_axis_tkeep(nf_riffa_dma_1_fifo_dwidth_tx_TKEEP),
        .m_axis_tlast(nf_riffa_dma_1_fifo_dwidth_tx_TLAST),
        .m_axis_tready(nf_riffa_dma_1_fifo_dwidth_tx_TREADY),
        .m_axis_tuser(nf_riffa_dma_1_fifo_dwidth_tx_TUSER),
        .m_axis_tvalid(nf_riffa_dma_1_fifo_dwidth_tx_TVALID),
        .s_axis_aclk(pcie3_7x_1_user_clk),
        .s_axis_aresetn(axis_tx_sys_reset_0_peripheral_aresetn),
        .s_axis_tdata(nf_riffa_dma_1_dwidth_conv_tx_TDATA),
        .s_axis_tkeep(nf_riffa_dma_1_dwidth_conv_tx_TKEEP),
        .s_axis_tlast(nf_riffa_dma_1_dwidth_conv_tx_TLAST),
        .s_axis_tready(nf_riffa_dma_1_dwidth_conv_tx_TREADY),
        .s_axis_tuser(nf_riffa_dma_1_dwidth_conv_tx_TUSER),
        .s_axis_tvalid(nf_riffa_dma_1_dwidth_conv_tx_TVALID));
  control_sub_nf_riffa_dma_1_0 nf_riffa_dma_1
       (.cfg_current_speed(nf_riffa_dma_1_pcie3_cfg_status_current_speed),
        .cfg_dpa_substate_change(nf_riffa_dma_1_pcie3_cfg_status_dpa_substate_change),
        .cfg_err_cor_out(nf_riffa_dma_1_pcie3_cfg_status_err_cor_out),
        .cfg_err_fatal_out(nf_riffa_dma_1_pcie3_cfg_status_err_fatal_out),
        .cfg_err_nonfatal_out(nf_riffa_dma_1_pcie3_cfg_status_err_nonfatal_out),
        .cfg_fc_cpld(nf_riffa_dma_1_pcie_cfg_fc_CPLD),
        .cfg_fc_cplh(nf_riffa_dma_1_pcie_cfg_fc_CPLH),
        .cfg_fc_npd(nf_riffa_dma_1_pcie_cfg_fc_NPD),
        .cfg_fc_nph(nf_riffa_dma_1_pcie_cfg_fc_NPH),
        .cfg_fc_pd(nf_riffa_dma_1_pcie_cfg_fc_PD),
        .cfg_fc_ph(nf_riffa_dma_1_pcie_cfg_fc_PH),
        .cfg_fc_sel(nf_riffa_dma_1_pcie_cfg_fc_SEL),
        .cfg_function_power_state(nf_riffa_dma_1_pcie3_cfg_status_function_power_state),
        .cfg_function_status(nf_riffa_dma_1_pcie3_cfg_status_function_status),
        .cfg_interrupt_int(nf_riffa_dma_1_pcie3_cfg_interrupt_INTx_VECTOR),
        .cfg_interrupt_msi_attr(nf_riffa_dma_1_pcie3_cfg_msi_attr),
        .cfg_interrupt_msi_data(nf_riffa_dma_1_pcie3_cfg_msi_data),
        .cfg_interrupt_msi_enable(nf_riffa_dma_1_pcie3_cfg_msi_enable),
        .cfg_interrupt_msi_fail(nf_riffa_dma_1_pcie3_cfg_msi_fail),
        .cfg_interrupt_msi_function_number(nf_riffa_dma_1_pcie3_cfg_msi_function_number),
        .cfg_interrupt_msi_int(nf_riffa_dma_1_pcie3_cfg_msi_int_vector),
        .cfg_interrupt_msi_mask_update(nf_riffa_dma_1_pcie3_cfg_msi_mask_update),
        .cfg_interrupt_msi_mmenable(nf_riffa_dma_1_pcie3_cfg_msi_mmenable),
        .cfg_interrupt_msi_pending_status(nf_riffa_dma_1_pcie3_cfg_msi_pending_status),
        .cfg_interrupt_msi_select(nf_riffa_dma_1_pcie3_cfg_msi_select),
        .cfg_interrupt_msi_sent(nf_riffa_dma_1_pcie3_cfg_msi_sent),
        .cfg_interrupt_msi_tph_present(nf_riffa_dma_1_pcie3_cfg_msi_tph_present),
        .cfg_interrupt_msi_tph_st_tag(nf_riffa_dma_1_pcie3_cfg_msi_tph_st_tag),
        .cfg_interrupt_msi_tph_type(nf_riffa_dma_1_pcie3_cfg_msi_tph_type),
        .cfg_interrupt_msi_vf_enable(nf_riffa_dma_1_pcie3_cfg_msi_vf_enable),
        .cfg_interrupt_pending(nf_riffa_dma_1_pcie3_cfg_interrupt_PENDING),
        .cfg_interrupt_sent(nf_riffa_dma_1_pcie3_cfg_interrupt_SENT),
        .cfg_link_power_state(nf_riffa_dma_1_pcie3_cfg_status_link_power_state),
        .cfg_ltr_enable(nf_riffa_dma_1_pcie3_cfg_status_ltr_enable),
        .cfg_ltssm_state(nf_riffa_dma_1_pcie3_cfg_status_ltssm_state),
        .cfg_max_payload(nf_riffa_dma_1_pcie3_cfg_status_max_payload),
        .cfg_max_read_req(nf_riffa_dma_1_pcie3_cfg_status_max_read_req),
        .cfg_negotiated_width(nf_riffa_dma_1_pcie3_cfg_status_negotiated_width),
        .cfg_obff_enable(nf_riffa_dma_1_pcie3_cfg_status_obff_enable),
        .cfg_phy_link_down(nf_riffa_dma_1_pcie3_cfg_status_phy_link_down),
        .cfg_phy_link_status(nf_riffa_dma_1_pcie3_cfg_status_phy_link_status),
        .cfg_pl_status_change(nf_riffa_dma_1_pcie3_cfg_status_pl_status_change),
        .cfg_rcb_status(nf_riffa_dma_1_pcie3_cfg_status_rcb_status),
        .cfg_tph_requester_enable(nf_riffa_dma_1_pcie3_cfg_status_tph_requester_enable),
        .cfg_tph_st_mode(nf_riffa_dma_1_pcie3_cfg_status_tph_st_mode),
        .cfg_vf_power_state(nf_riffa_dma_1_pcie3_cfg_status_vf_power_state),
        .cfg_vf_status(nf_riffa_dma_1_pcie3_cfg_status_vf_status),
        .cfg_vf_tph_requester_enable(nf_riffa_dma_1_pcie3_cfg_status_vf_tph_requester_enable),
        .cfg_vf_tph_st_mode(nf_riffa_dma_1_pcie3_cfg_status_vf_tph_st_mode),
        .m_axi_lite_aclk(axi_lite_clk_1),
        .m_axi_lite_araddr(s00_axi_1_ARADDR),
        .m_axi_lite_aresetn(axi_lite_rstn_1),
        .m_axi_lite_arprot(s00_axi_1_ARPROT),
        .m_axi_lite_arready(s00_axi_1_ARREADY),
        .m_axi_lite_arvalid(s00_axi_1_ARVALID),
        .m_axi_lite_awaddr(s00_axi_1_AWADDR),
        .m_axi_lite_awprot(s00_axi_1_AWPROT),
        .m_axi_lite_awready(s00_axi_1_AWREADY),
        .m_axi_lite_awvalid(s00_axi_1_AWVALID),
        .m_axi_lite_bready(s00_axi_1_BREADY),
        .m_axi_lite_bresp(s00_axi_1_BRESP),
        .m_axi_lite_bvalid(s00_axi_1_BVALID),
        .m_axi_lite_rdata(s00_axi_1_RDATA),
        .m_axi_lite_rready(s00_axi_1_RREADY),
        .m_axi_lite_rresp(s00_axi_1_RRESP),
        .m_axi_lite_rvalid(s00_axi_1_RVALID),
        .m_axi_lite_wdata(s00_axi_1_WDATA),
        .m_axi_lite_wready(s00_axi_1_WREADY),
        .m_axi_lite_wstrb(s00_axi_1_WSTRB),
        .m_axi_lite_wvalid(s00_axi_1_WVALID),
        .m_axis_cq_tdata(pcie3_7x_1_m_axis_cq_TDATA),
        .m_axis_cq_tkeep(pcie3_7x_1_m_axis_cq_TKEEP),
        .m_axis_cq_tlast(pcie3_7x_1_m_axis_cq_TLAST),
        .m_axis_cq_tready(pcie3_7x_1_m_axis_cq_TREADY),
        .m_axis_cq_tuser(pcie3_7x_1_m_axis_cq_TUSER),
        .m_axis_cq_tvalid(pcie3_7x_1_m_axis_cq_TVALID),
        .m_axis_rc_tdata(pcie3_7x_1_m_axis_rc_TDATA),
        .m_axis_rc_tkeep(pcie3_7x_1_m_axis_rc_TKEEP),
        .m_axis_rc_tlast(pcie3_7x_1_m_axis_rc_TLAST),
        .m_axis_rc_tready(pcie3_7x_1_m_axis_rc_TREADY),
        .m_axis_rc_tuser(pcie3_7x_1_m_axis_rc_TUSER),
        .m_axis_rc_tvalid(pcie3_7x_1_m_axis_rc_TVALID),
        .m_axis_xge_tx_tdata(nf_riffa_dma_1_dwidth_conv_tx_TDATA),
        .m_axis_xge_tx_tkeep(nf_riffa_dma_1_dwidth_conv_tx_TKEEP),
        .m_axis_xge_tx_tlast(nf_riffa_dma_1_dwidth_conv_tx_TLAST),
        .m_axis_xge_tx_tready(nf_riffa_dma_1_dwidth_conv_tx_TREADY),
        .m_axis_xge_tx_tuser(nf_riffa_dma_1_dwidth_conv_tx_TUSER),
        .m_axis_xge_tx_tvalid(nf_riffa_dma_1_dwidth_conv_tx_TVALID),
        .pcie_cq_np_req(nf_riffa_dma_1_pcie3_cfg_status_cq_np_req),
        .pcie_cq_np_req_count(nf_riffa_dma_1_pcie3_cfg_status_cq_np_req_count),
        .pcie_rq_seq_num(nf_riffa_dma_1_pcie3_cfg_status_rq_seq_num),
        .pcie_rq_seq_num_vld(nf_riffa_dma_1_pcie3_cfg_status_rq_seq_num_vld),
        .pcie_rq_tag(nf_riffa_dma_1_pcie3_cfg_status_rq_tag),
        .pcie_rq_tag_vld(nf_riffa_dma_1_pcie3_cfg_status_rq_tag_vld),
        .s_axi_lite_araddr(axi_clock_converter_0_M_AXI_ARADDR),
        .s_axi_lite_arready(axi_clock_converter_0_M_AXI_ARREADY),
        .s_axi_lite_arvalid(axi_clock_converter_0_M_AXI_ARVALID),
        .s_axi_lite_awaddr(axi_clock_converter_0_M_AXI_AWADDR),
        .s_axi_lite_awready(axi_clock_converter_0_M_AXI_AWREADY),
        .s_axi_lite_awvalid(axi_clock_converter_0_M_AXI_AWVALID),
        .s_axi_lite_bready(axi_clock_converter_0_M_AXI_BREADY),
        .s_axi_lite_bresp(axi_clock_converter_0_M_AXI_BRESP),
        .s_axi_lite_bvalid(axi_clock_converter_0_M_AXI_BVALID),
        .s_axi_lite_rdata(axi_clock_converter_0_M_AXI_RDATA),
        .s_axi_lite_rready(axi_clock_converter_0_M_AXI_RREADY),
        .s_axi_lite_rresp(axi_clock_converter_0_M_AXI_RRESP),
        .s_axi_lite_rvalid(axi_clock_converter_0_M_AXI_RVALID),
        .s_axi_lite_wdata(axi_clock_converter_0_M_AXI_WDATA),
        .s_axi_lite_wready(axi_clock_converter_0_M_AXI_WREADY),
        .s_axi_lite_wstrb(axi_clock_converter_0_M_AXI_WSTRB),
        .s_axi_lite_wvalid(axi_clock_converter_0_M_AXI_WVALID),
        .s_axis_cc_tdata(nf_riffa_dma_1_s_axis_cc_TDATA),
        .s_axis_cc_tkeep(nf_riffa_dma_1_s_axis_cc_TKEEP),
        .s_axis_cc_tlast(nf_riffa_dma_1_s_axis_cc_TLAST),
        .s_axis_cc_tready(nf_riffa_dma_1_s_axis_cc_TREADY[0]),
        .s_axis_cc_tuser(nf_riffa_dma_1_s_axis_cc_TUSER),
        .s_axis_cc_tvalid(nf_riffa_dma_1_s_axis_cc_TVALID),
        .s_axis_rq_tdata(nf_riffa_dma_1_s_axis_rq_TDATA),
        .s_axis_rq_tkeep(nf_riffa_dma_1_s_axis_rq_TKEEP),
        .s_axis_rq_tlast(nf_riffa_dma_1_s_axis_rq_TLAST),
        .s_axis_rq_tready(nf_riffa_dma_1_s_axis_rq_TREADY[0]),
        .s_axis_rq_tuser(nf_riffa_dma_1_s_axis_rq_TUSER),
        .s_axis_rq_tvalid(nf_riffa_dma_1_s_axis_rq_TVALID),
        .s_axis_xge_rx_tdata(axis_fifo_10g_rx_M_AXIS_TDATA),
        .s_axis_xge_rx_tkeep(axis_fifo_10g_rx_M_AXIS_TKEEP),
        .s_axis_xge_rx_tlast(axis_fifo_10g_rx_M_AXIS_TLAST),
        .s_axis_xge_rx_tready(axis_fifo_10g_rx_M_AXIS_TREADY),
        .s_axis_xge_rx_tuser(axis_fifo_10g_rx_M_AXIS_TUSER),
        .s_axis_xge_rx_tvalid(axis_fifo_10g_rx_M_AXIS_TVALID),
        .user_clk(pcie3_7x_1_user_clk),
        .user_lnk_up(pcie3_7x_1_user_lnk_up),
        .user_reset(pcie3_7x_1_user_reset));
  control_sub_pcie3_7x_1_0 pcie3_7x_1
       (.cfg_current_speed(nf_riffa_dma_1_pcie3_cfg_status_current_speed),
        .cfg_dpa_substate_change(nf_riffa_dma_1_pcie3_cfg_status_dpa_substate_change),
        .cfg_err_cor_out(nf_riffa_dma_1_pcie3_cfg_status_err_cor_out),
        .cfg_err_fatal_out(nf_riffa_dma_1_pcie3_cfg_status_err_fatal_out),
        .cfg_err_nonfatal_out(nf_riffa_dma_1_pcie3_cfg_status_err_nonfatal_out),
        .cfg_fc_cpld(nf_riffa_dma_1_pcie_cfg_fc_CPLD),
        .cfg_fc_cplh(nf_riffa_dma_1_pcie_cfg_fc_CPLH),
        .cfg_fc_npd(nf_riffa_dma_1_pcie_cfg_fc_NPD),
        .cfg_fc_nph(nf_riffa_dma_1_pcie_cfg_fc_NPH),
        .cfg_fc_pd(nf_riffa_dma_1_pcie_cfg_fc_PD),
        .cfg_fc_ph(nf_riffa_dma_1_pcie_cfg_fc_PH),
        .cfg_fc_sel(nf_riffa_dma_1_pcie_cfg_fc_SEL),
        .cfg_function_power_state(nf_riffa_dma_1_pcie3_cfg_status_function_power_state),
        .cfg_function_status(nf_riffa_dma_1_pcie3_cfg_status_function_status),
        .cfg_interrupt_int(nf_riffa_dma_1_pcie3_cfg_interrupt_INTx_VECTOR),
        .cfg_interrupt_msi_attr(nf_riffa_dma_1_pcie3_cfg_msi_attr),
        .cfg_interrupt_msi_data(nf_riffa_dma_1_pcie3_cfg_msi_data),
        .cfg_interrupt_msi_enable(nf_riffa_dma_1_pcie3_cfg_msi_enable),
        .cfg_interrupt_msi_fail(nf_riffa_dma_1_pcie3_cfg_msi_fail),
        .cfg_interrupt_msi_function_number(nf_riffa_dma_1_pcie3_cfg_msi_function_number),
        .cfg_interrupt_msi_int(nf_riffa_dma_1_pcie3_cfg_msi_int_vector),
        .cfg_interrupt_msi_mask_update(nf_riffa_dma_1_pcie3_cfg_msi_mask_update),
        .cfg_interrupt_msi_mmenable(nf_riffa_dma_1_pcie3_cfg_msi_mmenable),
        .cfg_interrupt_msi_pending_status(nf_riffa_dma_1_pcie3_cfg_msi_pending_status),
        .cfg_interrupt_msi_select(nf_riffa_dma_1_pcie3_cfg_msi_select),
        .cfg_interrupt_msi_sent(nf_riffa_dma_1_pcie3_cfg_msi_sent),
        .cfg_interrupt_msi_tph_present(nf_riffa_dma_1_pcie3_cfg_msi_tph_present),
        .cfg_interrupt_msi_tph_st_tag(nf_riffa_dma_1_pcie3_cfg_msi_tph_st_tag),
        .cfg_interrupt_msi_tph_type(nf_riffa_dma_1_pcie3_cfg_msi_tph_type),
        .cfg_interrupt_msi_vf_enable(nf_riffa_dma_1_pcie3_cfg_msi_vf_enable),
        .cfg_interrupt_pending(nf_riffa_dma_1_pcie3_cfg_interrupt_PENDING),
        .cfg_interrupt_sent(nf_riffa_dma_1_pcie3_cfg_interrupt_SENT),
        .cfg_link_power_state(nf_riffa_dma_1_pcie3_cfg_status_link_power_state),
        .cfg_ltr_enable(nf_riffa_dma_1_pcie3_cfg_status_ltr_enable),
        .cfg_ltssm_state(nf_riffa_dma_1_pcie3_cfg_status_ltssm_state),
        .cfg_max_payload(nf_riffa_dma_1_pcie3_cfg_status_max_payload),
        .cfg_max_read_req(nf_riffa_dma_1_pcie3_cfg_status_max_read_req),
        .cfg_negotiated_width(nf_riffa_dma_1_pcie3_cfg_status_negotiated_width),
        .cfg_obff_enable(nf_riffa_dma_1_pcie3_cfg_status_obff_enable),
        .cfg_phy_link_down(nf_riffa_dma_1_pcie3_cfg_status_phy_link_down),
        .cfg_phy_link_status(nf_riffa_dma_1_pcie3_cfg_status_phy_link_status),
        .cfg_pl_status_change(nf_riffa_dma_1_pcie3_cfg_status_pl_status_change),
        .cfg_rcb_status(nf_riffa_dma_1_pcie3_cfg_status_rcb_status),
        .cfg_tph_requester_enable(nf_riffa_dma_1_pcie3_cfg_status_tph_requester_enable),
        .cfg_tph_st_mode(nf_riffa_dma_1_pcie3_cfg_status_tph_st_mode),
        .cfg_vf_power_state(nf_riffa_dma_1_pcie3_cfg_status_vf_power_state),
        .cfg_vf_status(nf_riffa_dma_1_pcie3_cfg_status_vf_status),
        .cfg_vf_tph_requester_enable(nf_riffa_dma_1_pcie3_cfg_status_vf_tph_requester_enable),
        .cfg_vf_tph_st_mode(nf_riffa_dma_1_pcie3_cfg_status_vf_tph_st_mode),
        .m_axis_cq_tdata(pcie3_7x_1_m_axis_cq_TDATA),
        .m_axis_cq_tkeep(pcie3_7x_1_m_axis_cq_TKEEP),
        .m_axis_cq_tlast(pcie3_7x_1_m_axis_cq_TLAST),
        .m_axis_cq_tready(pcie3_7x_1_m_axis_cq_TREADY[0]),
        .m_axis_cq_tuser(pcie3_7x_1_m_axis_cq_TUSER),
        .m_axis_cq_tvalid(pcie3_7x_1_m_axis_cq_TVALID),
        .m_axis_rc_tdata(pcie3_7x_1_m_axis_rc_TDATA),
        .m_axis_rc_tkeep(pcie3_7x_1_m_axis_rc_TKEEP),
        .m_axis_rc_tlast(pcie3_7x_1_m_axis_rc_TLAST),
        .m_axis_rc_tready(pcie3_7x_1_m_axis_rc_TREADY[0]),
        .m_axis_rc_tuser(pcie3_7x_1_m_axis_rc_TUSER),
        .m_axis_rc_tvalid(pcie3_7x_1_m_axis_rc_TVALID),
        .pci_exp_rxn(pcie3_7x_1_pcie_7x_mgt_rxn),
        .pci_exp_rxp(pcie3_7x_1_pcie_7x_mgt_rxp),
        .pci_exp_txn(pcie3_7x_1_pcie_7x_mgt_txn),
        .pci_exp_txp(pcie3_7x_1_pcie_7x_mgt_txp),
        .pcie_cq_np_req(nf_riffa_dma_1_pcie3_cfg_status_cq_np_req),
        .pcie_cq_np_req_count(nf_riffa_dma_1_pcie3_cfg_status_cq_np_req_count),
        .pcie_rq_seq_num(nf_riffa_dma_1_pcie3_cfg_status_rq_seq_num),
        .pcie_rq_seq_num_vld(nf_riffa_dma_1_pcie3_cfg_status_rq_seq_num_vld),
        .pcie_rq_tag(nf_riffa_dma_1_pcie3_cfg_status_rq_tag),
        .pcie_rq_tag_vld(nf_riffa_dma_1_pcie3_cfg_status_rq_tag_vld),
        .s_axis_cc_tdata(nf_riffa_dma_1_s_axis_cc_TDATA),
        .s_axis_cc_tkeep(nf_riffa_dma_1_s_axis_cc_TKEEP),
        .s_axis_cc_tlast(nf_riffa_dma_1_s_axis_cc_TLAST),
        .s_axis_cc_tready(nf_riffa_dma_1_s_axis_cc_TREADY),
        .s_axis_cc_tuser(nf_riffa_dma_1_s_axis_cc_TUSER),
        .s_axis_cc_tvalid(nf_riffa_dma_1_s_axis_cc_TVALID),
        .s_axis_rq_tdata(nf_riffa_dma_1_s_axis_rq_TDATA),
        .s_axis_rq_tkeep(nf_riffa_dma_1_s_axis_rq_TKEEP),
        .s_axis_rq_tlast(nf_riffa_dma_1_s_axis_rq_TLAST),
        .s_axis_rq_tready(nf_riffa_dma_1_s_axis_rq_TREADY),
        .s_axis_rq_tuser(nf_riffa_dma_1_s_axis_rq_TUSER),
        .s_axis_rq_tvalid(nf_riffa_dma_1_s_axis_rq_TVALID),
        .sys_clk(sys_clk_1),
        .sys_reset(sys_reset_1),
        .user_clk(pcie3_7x_1_user_clk),
        .user_lnk_up(pcie3_7x_1_user_lnk_up),
        .user_reset(pcie3_7x_1_user_reset));
  control_sub_pcie_reset_inv_0 pcie_reset_inv
       (.Op1(pcie3_7x_1_user_reset),
        .Res(axis_tx_sys_reset_0_peripheral_aresetn));
endmodule

module m00_couplers_imp_1CKXUZB
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [11:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [11:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]m00_couplers_to_m00_data_fifo_ARADDR;
  wire [2:0]m00_couplers_to_m00_data_fifo_ARPROT;
  wire m00_couplers_to_m00_data_fifo_ARREADY;
  wire m00_couplers_to_m00_data_fifo_ARVALID;
  wire [31:0]m00_couplers_to_m00_data_fifo_AWADDR;
  wire [2:0]m00_couplers_to_m00_data_fifo_AWPROT;
  wire m00_couplers_to_m00_data_fifo_AWREADY;
  wire m00_couplers_to_m00_data_fifo_AWVALID;
  wire m00_couplers_to_m00_data_fifo_BREADY;
  wire [1:0]m00_couplers_to_m00_data_fifo_BRESP;
  wire m00_couplers_to_m00_data_fifo_BVALID;
  wire [31:0]m00_couplers_to_m00_data_fifo_RDATA;
  wire m00_couplers_to_m00_data_fifo_RREADY;
  wire [1:0]m00_couplers_to_m00_data_fifo_RRESP;
  wire m00_couplers_to_m00_data_fifo_RVALID;
  wire [31:0]m00_couplers_to_m00_data_fifo_WDATA;
  wire m00_couplers_to_m00_data_fifo_WREADY;
  wire [3:0]m00_couplers_to_m00_data_fifo_WSTRB;
  wire m00_couplers_to_m00_data_fifo_WVALID;
  wire [11:0]m00_data_fifo_to_m00_couplers_ARADDR;
  wire [2:0]m00_data_fifo_to_m00_couplers_ARPROT;
  wire m00_data_fifo_to_m00_couplers_ARREADY;
  wire m00_data_fifo_to_m00_couplers_ARVALID;
  wire [11:0]m00_data_fifo_to_m00_couplers_AWADDR;
  wire [2:0]m00_data_fifo_to_m00_couplers_AWPROT;
  wire m00_data_fifo_to_m00_couplers_AWREADY;
  wire m00_data_fifo_to_m00_couplers_AWVALID;
  wire m00_data_fifo_to_m00_couplers_BREADY;
  wire [1:0]m00_data_fifo_to_m00_couplers_BRESP;
  wire m00_data_fifo_to_m00_couplers_BVALID;
  wire [31:0]m00_data_fifo_to_m00_couplers_RDATA;
  wire m00_data_fifo_to_m00_couplers_RREADY;
  wire [1:0]m00_data_fifo_to_m00_couplers_RRESP;
  wire m00_data_fifo_to_m00_couplers_RVALID;
  wire [31:0]m00_data_fifo_to_m00_couplers_WDATA;
  wire m00_data_fifo_to_m00_couplers_WREADY;
  wire [3:0]m00_data_fifo_to_m00_couplers_WSTRB;
  wire m00_data_fifo_to_m00_couplers_WVALID;

  assign M_AXI_araddr[11:0] = m00_data_fifo_to_m00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m00_data_fifo_to_m00_couplers_ARPROT;
  assign M_AXI_arvalid = m00_data_fifo_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[11:0] = m00_data_fifo_to_m00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m00_data_fifo_to_m00_couplers_AWPROT;
  assign M_AXI_awvalid = m00_data_fifo_to_m00_couplers_AWVALID;
  assign M_AXI_bready = m00_data_fifo_to_m00_couplers_BREADY;
  assign M_AXI_rready = m00_data_fifo_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_data_fifo_to_m00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m00_data_fifo_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid = m00_data_fifo_to_m00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m00_couplers_to_m00_data_fifo_ARREADY;
  assign S_AXI_awready = m00_couplers_to_m00_data_fifo_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_data_fifo_BRESP;
  assign S_AXI_bvalid = m00_couplers_to_m00_data_fifo_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_data_fifo_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_data_fifo_RRESP;
  assign S_AXI_rvalid = m00_couplers_to_m00_data_fifo_RVALID;
  assign S_AXI_wready = m00_couplers_to_m00_data_fifo_WREADY;
  assign m00_couplers_to_m00_data_fifo_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_m00_data_fifo_ARPROT = S_AXI_arprot[2:0];
  assign m00_couplers_to_m00_data_fifo_ARVALID = S_AXI_arvalid;
  assign m00_couplers_to_m00_data_fifo_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_m00_data_fifo_AWPROT = S_AXI_awprot[2:0];
  assign m00_couplers_to_m00_data_fifo_AWVALID = S_AXI_awvalid;
  assign m00_couplers_to_m00_data_fifo_BREADY = S_AXI_bready;
  assign m00_couplers_to_m00_data_fifo_RREADY = S_AXI_rready;
  assign m00_couplers_to_m00_data_fifo_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_data_fifo_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_m00_data_fifo_WVALID = S_AXI_wvalid;
  assign m00_data_fifo_to_m00_couplers_ARREADY = M_AXI_arready;
  assign m00_data_fifo_to_m00_couplers_AWREADY = M_AXI_awready;
  assign m00_data_fifo_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_data_fifo_to_m00_couplers_BVALID = M_AXI_bvalid;
  assign m00_data_fifo_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_data_fifo_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_data_fifo_to_m00_couplers_RVALID = M_AXI_rvalid;
  assign m00_data_fifo_to_m00_couplers_WREADY = M_AXI_wready;
  control_sub_m00_data_fifo_0 m00_data_fifo
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(m00_data_fifo_to_m00_couplers_ARADDR),
        .m_axi_arprot(m00_data_fifo_to_m00_couplers_ARPROT),
        .m_axi_arready(m00_data_fifo_to_m00_couplers_ARREADY),
        .m_axi_arvalid(m00_data_fifo_to_m00_couplers_ARVALID),
        .m_axi_awaddr(m00_data_fifo_to_m00_couplers_AWADDR),
        .m_axi_awprot(m00_data_fifo_to_m00_couplers_AWPROT),
        .m_axi_awready(m00_data_fifo_to_m00_couplers_AWREADY),
        .m_axi_awvalid(m00_data_fifo_to_m00_couplers_AWVALID),
        .m_axi_bready(m00_data_fifo_to_m00_couplers_BREADY),
        .m_axi_bresp(m00_data_fifo_to_m00_couplers_BRESP),
        .m_axi_bvalid(m00_data_fifo_to_m00_couplers_BVALID),
        .m_axi_rdata(m00_data_fifo_to_m00_couplers_RDATA),
        .m_axi_rready(m00_data_fifo_to_m00_couplers_RREADY),
        .m_axi_rresp(m00_data_fifo_to_m00_couplers_RRESP),
        .m_axi_rvalid(m00_data_fifo_to_m00_couplers_RVALID),
        .m_axi_wdata(m00_data_fifo_to_m00_couplers_WDATA),
        .m_axi_wready(m00_data_fifo_to_m00_couplers_WREADY),
        .m_axi_wstrb(m00_data_fifo_to_m00_couplers_WSTRB),
        .m_axi_wvalid(m00_data_fifo_to_m00_couplers_WVALID),
        .s_axi_araddr(m00_couplers_to_m00_data_fifo_ARADDR[11:0]),
        .s_axi_arprot(m00_couplers_to_m00_data_fifo_ARPROT),
        .s_axi_arready(m00_couplers_to_m00_data_fifo_ARREADY),
        .s_axi_arvalid(m00_couplers_to_m00_data_fifo_ARVALID),
        .s_axi_awaddr(m00_couplers_to_m00_data_fifo_AWADDR[11:0]),
        .s_axi_awprot(m00_couplers_to_m00_data_fifo_AWPROT),
        .s_axi_awready(m00_couplers_to_m00_data_fifo_AWREADY),
        .s_axi_awvalid(m00_couplers_to_m00_data_fifo_AWVALID),
        .s_axi_bready(m00_couplers_to_m00_data_fifo_BREADY),
        .s_axi_bresp(m00_couplers_to_m00_data_fifo_BRESP),
        .s_axi_bvalid(m00_couplers_to_m00_data_fifo_BVALID),
        .s_axi_rdata(m00_couplers_to_m00_data_fifo_RDATA),
        .s_axi_rready(m00_couplers_to_m00_data_fifo_RREADY),
        .s_axi_rresp(m00_couplers_to_m00_data_fifo_RRESP),
        .s_axi_rvalid(m00_couplers_to_m00_data_fifo_RVALID),
        .s_axi_wdata(m00_couplers_to_m00_data_fifo_WDATA),
        .s_axi_wready(m00_couplers_to_m00_data_fifo_WREADY),
        .s_axi_wstrb(m00_couplers_to_m00_data_fifo_WSTRB),
        .s_axi_wvalid(m00_couplers_to_m00_data_fifo_WVALID));
endmodule

module m00_couplers_imp_M3U6M4
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m00_couplers_to_m00_couplers_ARADDR;
  wire [0:0]m00_couplers_to_m00_couplers_ARREADY;
  wire [0:0]m00_couplers_to_m00_couplers_ARVALID;
  wire [31:0]m00_couplers_to_m00_couplers_AWADDR;
  wire [0:0]m00_couplers_to_m00_couplers_AWREADY;
  wire [0:0]m00_couplers_to_m00_couplers_AWVALID;
  wire [0:0]m00_couplers_to_m00_couplers_BREADY;
  wire [1:0]m00_couplers_to_m00_couplers_BRESP;
  wire [0:0]m00_couplers_to_m00_couplers_BVALID;
  wire [31:0]m00_couplers_to_m00_couplers_RDATA;
  wire [0:0]m00_couplers_to_m00_couplers_RREADY;
  wire [1:0]m00_couplers_to_m00_couplers_RRESP;
  wire [0:0]m00_couplers_to_m00_couplers_RVALID;
  wire [31:0]m00_couplers_to_m00_couplers_WDATA;
  wire [0:0]m00_couplers_to_m00_couplers_WREADY;
  wire [3:0]m00_couplers_to_m00_couplers_WSTRB;
  wire [0:0]m00_couplers_to_m00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m00_couplers_to_m00_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m00_couplers_to_m00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m00_couplers_to_m00_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m00_couplers_to_m00_couplers_AWVALID;
  assign M_AXI_bready[0] = m00_couplers_to_m00_couplers_BREADY;
  assign M_AXI_rready[0] = m00_couplers_to_m00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m00_couplers_to_m00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m00_couplers_to_m00_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m00_couplers_to_m00_couplers_WVALID;
  assign S_AXI_arready[0] = m00_couplers_to_m00_couplers_ARREADY;
  assign S_AXI_awready[0] = m00_couplers_to_m00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m00_couplers_to_m00_couplers_BRESP;
  assign S_AXI_bvalid[0] = m00_couplers_to_m00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m00_couplers_to_m00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m00_couplers_to_m00_couplers_RRESP;
  assign S_AXI_rvalid[0] = m00_couplers_to_m00_couplers_RVALID;
  assign S_AXI_wready[0] = m00_couplers_to_m00_couplers_WREADY;
  assign m00_couplers_to_m00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m00_couplers_to_m00_couplers_ARREADY = M_AXI_arready[0];
  assign m00_couplers_to_m00_couplers_ARVALID = S_AXI_arvalid[0];
  assign m00_couplers_to_m00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m00_couplers_to_m00_couplers_AWREADY = M_AXI_awready[0];
  assign m00_couplers_to_m00_couplers_AWVALID = S_AXI_awvalid[0];
  assign m00_couplers_to_m00_couplers_BREADY = S_AXI_bready[0];
  assign m00_couplers_to_m00_couplers_BRESP = M_AXI_bresp[1:0];
  assign m00_couplers_to_m00_couplers_BVALID = M_AXI_bvalid[0];
  assign m00_couplers_to_m00_couplers_RDATA = M_AXI_rdata[31:0];
  assign m00_couplers_to_m00_couplers_RREADY = S_AXI_rready[0];
  assign m00_couplers_to_m00_couplers_RRESP = M_AXI_rresp[1:0];
  assign m00_couplers_to_m00_couplers_RVALID = M_AXI_rvalid[0];
  assign m00_couplers_to_m00_couplers_WDATA = S_AXI_wdata[31:0];
  assign m00_couplers_to_m00_couplers_WREADY = M_AXI_wready[0];
  assign m00_couplers_to_m00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m00_couplers_to_m00_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m01_couplers_imp_1LUAMW2
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m01_couplers_to_m01_couplers_ARADDR;
  wire [0:0]m01_couplers_to_m01_couplers_ARREADY;
  wire [0:0]m01_couplers_to_m01_couplers_ARVALID;
  wire [31:0]m01_couplers_to_m01_couplers_AWADDR;
  wire [0:0]m01_couplers_to_m01_couplers_AWREADY;
  wire [0:0]m01_couplers_to_m01_couplers_AWVALID;
  wire [0:0]m01_couplers_to_m01_couplers_BREADY;
  wire [1:0]m01_couplers_to_m01_couplers_BRESP;
  wire [0:0]m01_couplers_to_m01_couplers_BVALID;
  wire [31:0]m01_couplers_to_m01_couplers_RDATA;
  wire [0:0]m01_couplers_to_m01_couplers_RREADY;
  wire [1:0]m01_couplers_to_m01_couplers_RRESP;
  wire [0:0]m01_couplers_to_m01_couplers_RVALID;
  wire [31:0]m01_couplers_to_m01_couplers_WDATA;
  wire [0:0]m01_couplers_to_m01_couplers_WREADY;
  wire [3:0]m01_couplers_to_m01_couplers_WSTRB;
  wire [0:0]m01_couplers_to_m01_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m01_couplers_to_m01_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m01_couplers_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m01_couplers_to_m01_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m01_couplers_to_m01_couplers_AWVALID;
  assign M_AXI_bready[0] = m01_couplers_to_m01_couplers_BREADY;
  assign M_AXI_rready[0] = m01_couplers_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_couplers_to_m01_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m01_couplers_to_m01_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m01_couplers_to_m01_couplers_WVALID;
  assign S_AXI_arready[0] = m01_couplers_to_m01_couplers_ARREADY;
  assign S_AXI_awready[0] = m01_couplers_to_m01_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_couplers_BRESP;
  assign S_AXI_bvalid[0] = m01_couplers_to_m01_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_couplers_RRESP;
  assign S_AXI_rvalid[0] = m01_couplers_to_m01_couplers_RVALID;
  assign S_AXI_wready[0] = m01_couplers_to_m01_couplers_WREADY;
  assign m01_couplers_to_m01_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m01_couplers_to_m01_couplers_ARREADY = M_AXI_arready[0];
  assign m01_couplers_to_m01_couplers_ARVALID = S_AXI_arvalid[0];
  assign m01_couplers_to_m01_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m01_couplers_to_m01_couplers_AWREADY = M_AXI_awready[0];
  assign m01_couplers_to_m01_couplers_AWVALID = S_AXI_awvalid[0];
  assign m01_couplers_to_m01_couplers_BREADY = S_AXI_bready[0];
  assign m01_couplers_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_couplers_to_m01_couplers_BVALID = M_AXI_bvalid[0];
  assign m01_couplers_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_couplers_to_m01_couplers_RREADY = S_AXI_rready[0];
  assign m01_couplers_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_couplers_to_m01_couplers_RVALID = M_AXI_rvalid[0];
  assign m01_couplers_to_m01_couplers_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_couplers_WREADY = M_AXI_wready[0];
  assign m01_couplers_to_m01_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m01_couplers_to_m01_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m01_couplers_imp_DJHRIH
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [11:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [11:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]m01_couplers_to_m01_data_fifo_ARADDR;
  wire [2:0]m01_couplers_to_m01_data_fifo_ARPROT;
  wire m01_couplers_to_m01_data_fifo_ARREADY;
  wire m01_couplers_to_m01_data_fifo_ARVALID;
  wire [31:0]m01_couplers_to_m01_data_fifo_AWADDR;
  wire [2:0]m01_couplers_to_m01_data_fifo_AWPROT;
  wire m01_couplers_to_m01_data_fifo_AWREADY;
  wire m01_couplers_to_m01_data_fifo_AWVALID;
  wire m01_couplers_to_m01_data_fifo_BREADY;
  wire [1:0]m01_couplers_to_m01_data_fifo_BRESP;
  wire m01_couplers_to_m01_data_fifo_BVALID;
  wire [31:0]m01_couplers_to_m01_data_fifo_RDATA;
  wire m01_couplers_to_m01_data_fifo_RREADY;
  wire [1:0]m01_couplers_to_m01_data_fifo_RRESP;
  wire m01_couplers_to_m01_data_fifo_RVALID;
  wire [31:0]m01_couplers_to_m01_data_fifo_WDATA;
  wire m01_couplers_to_m01_data_fifo_WREADY;
  wire [3:0]m01_couplers_to_m01_data_fifo_WSTRB;
  wire m01_couplers_to_m01_data_fifo_WVALID;
  wire [11:0]m01_data_fifo_to_m01_couplers_ARADDR;
  wire [2:0]m01_data_fifo_to_m01_couplers_ARPROT;
  wire m01_data_fifo_to_m01_couplers_ARREADY;
  wire m01_data_fifo_to_m01_couplers_ARVALID;
  wire [11:0]m01_data_fifo_to_m01_couplers_AWADDR;
  wire [2:0]m01_data_fifo_to_m01_couplers_AWPROT;
  wire m01_data_fifo_to_m01_couplers_AWREADY;
  wire m01_data_fifo_to_m01_couplers_AWVALID;
  wire m01_data_fifo_to_m01_couplers_BREADY;
  wire [1:0]m01_data_fifo_to_m01_couplers_BRESP;
  wire m01_data_fifo_to_m01_couplers_BVALID;
  wire [31:0]m01_data_fifo_to_m01_couplers_RDATA;
  wire m01_data_fifo_to_m01_couplers_RREADY;
  wire [1:0]m01_data_fifo_to_m01_couplers_RRESP;
  wire m01_data_fifo_to_m01_couplers_RVALID;
  wire [31:0]m01_data_fifo_to_m01_couplers_WDATA;
  wire m01_data_fifo_to_m01_couplers_WREADY;
  wire [3:0]m01_data_fifo_to_m01_couplers_WSTRB;
  wire m01_data_fifo_to_m01_couplers_WVALID;

  assign M_AXI_araddr[11:0] = m01_data_fifo_to_m01_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m01_data_fifo_to_m01_couplers_ARPROT;
  assign M_AXI_arvalid = m01_data_fifo_to_m01_couplers_ARVALID;
  assign M_AXI_awaddr[11:0] = m01_data_fifo_to_m01_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m01_data_fifo_to_m01_couplers_AWPROT;
  assign M_AXI_awvalid = m01_data_fifo_to_m01_couplers_AWVALID;
  assign M_AXI_bready = m01_data_fifo_to_m01_couplers_BREADY;
  assign M_AXI_rready = m01_data_fifo_to_m01_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m01_data_fifo_to_m01_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m01_data_fifo_to_m01_couplers_WSTRB;
  assign M_AXI_wvalid = m01_data_fifo_to_m01_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m01_couplers_to_m01_data_fifo_ARREADY;
  assign S_AXI_awready = m01_couplers_to_m01_data_fifo_AWREADY;
  assign S_AXI_bresp[1:0] = m01_couplers_to_m01_data_fifo_BRESP;
  assign S_AXI_bvalid = m01_couplers_to_m01_data_fifo_BVALID;
  assign S_AXI_rdata[31:0] = m01_couplers_to_m01_data_fifo_RDATA;
  assign S_AXI_rresp[1:0] = m01_couplers_to_m01_data_fifo_RRESP;
  assign S_AXI_rvalid = m01_couplers_to_m01_data_fifo_RVALID;
  assign S_AXI_wready = m01_couplers_to_m01_data_fifo_WREADY;
  assign m01_couplers_to_m01_data_fifo_ARADDR = S_AXI_araddr[31:0];
  assign m01_couplers_to_m01_data_fifo_ARPROT = S_AXI_arprot[2:0];
  assign m01_couplers_to_m01_data_fifo_ARVALID = S_AXI_arvalid;
  assign m01_couplers_to_m01_data_fifo_AWADDR = S_AXI_awaddr[31:0];
  assign m01_couplers_to_m01_data_fifo_AWPROT = S_AXI_awprot[2:0];
  assign m01_couplers_to_m01_data_fifo_AWVALID = S_AXI_awvalid;
  assign m01_couplers_to_m01_data_fifo_BREADY = S_AXI_bready;
  assign m01_couplers_to_m01_data_fifo_RREADY = S_AXI_rready;
  assign m01_couplers_to_m01_data_fifo_WDATA = S_AXI_wdata[31:0];
  assign m01_couplers_to_m01_data_fifo_WSTRB = S_AXI_wstrb[3:0];
  assign m01_couplers_to_m01_data_fifo_WVALID = S_AXI_wvalid;
  assign m01_data_fifo_to_m01_couplers_ARREADY = M_AXI_arready;
  assign m01_data_fifo_to_m01_couplers_AWREADY = M_AXI_awready;
  assign m01_data_fifo_to_m01_couplers_BRESP = M_AXI_bresp[1:0];
  assign m01_data_fifo_to_m01_couplers_BVALID = M_AXI_bvalid;
  assign m01_data_fifo_to_m01_couplers_RDATA = M_AXI_rdata[31:0];
  assign m01_data_fifo_to_m01_couplers_RRESP = M_AXI_rresp[1:0];
  assign m01_data_fifo_to_m01_couplers_RVALID = M_AXI_rvalid;
  assign m01_data_fifo_to_m01_couplers_WREADY = M_AXI_wready;
  control_sub_m01_data_fifo_0 m01_data_fifo
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(m01_data_fifo_to_m01_couplers_ARADDR),
        .m_axi_arprot(m01_data_fifo_to_m01_couplers_ARPROT),
        .m_axi_arready(m01_data_fifo_to_m01_couplers_ARREADY),
        .m_axi_arvalid(m01_data_fifo_to_m01_couplers_ARVALID),
        .m_axi_awaddr(m01_data_fifo_to_m01_couplers_AWADDR),
        .m_axi_awprot(m01_data_fifo_to_m01_couplers_AWPROT),
        .m_axi_awready(m01_data_fifo_to_m01_couplers_AWREADY),
        .m_axi_awvalid(m01_data_fifo_to_m01_couplers_AWVALID),
        .m_axi_bready(m01_data_fifo_to_m01_couplers_BREADY),
        .m_axi_bresp(m01_data_fifo_to_m01_couplers_BRESP),
        .m_axi_bvalid(m01_data_fifo_to_m01_couplers_BVALID),
        .m_axi_rdata(m01_data_fifo_to_m01_couplers_RDATA),
        .m_axi_rready(m01_data_fifo_to_m01_couplers_RREADY),
        .m_axi_rresp(m01_data_fifo_to_m01_couplers_RRESP),
        .m_axi_rvalid(m01_data_fifo_to_m01_couplers_RVALID),
        .m_axi_wdata(m01_data_fifo_to_m01_couplers_WDATA),
        .m_axi_wready(m01_data_fifo_to_m01_couplers_WREADY),
        .m_axi_wstrb(m01_data_fifo_to_m01_couplers_WSTRB),
        .m_axi_wvalid(m01_data_fifo_to_m01_couplers_WVALID),
        .s_axi_araddr(m01_couplers_to_m01_data_fifo_ARADDR[11:0]),
        .s_axi_arprot(m01_couplers_to_m01_data_fifo_ARPROT),
        .s_axi_arready(m01_couplers_to_m01_data_fifo_ARREADY),
        .s_axi_arvalid(m01_couplers_to_m01_data_fifo_ARVALID),
        .s_axi_awaddr(m01_couplers_to_m01_data_fifo_AWADDR[11:0]),
        .s_axi_awprot(m01_couplers_to_m01_data_fifo_AWPROT),
        .s_axi_awready(m01_couplers_to_m01_data_fifo_AWREADY),
        .s_axi_awvalid(m01_couplers_to_m01_data_fifo_AWVALID),
        .s_axi_bready(m01_couplers_to_m01_data_fifo_BREADY),
        .s_axi_bresp(m01_couplers_to_m01_data_fifo_BRESP),
        .s_axi_bvalid(m01_couplers_to_m01_data_fifo_BVALID),
        .s_axi_rdata(m01_couplers_to_m01_data_fifo_RDATA),
        .s_axi_rready(m01_couplers_to_m01_data_fifo_RREADY),
        .s_axi_rresp(m01_couplers_to_m01_data_fifo_RRESP),
        .s_axi_rvalid(m01_couplers_to_m01_data_fifo_RVALID),
        .s_axi_wdata(m01_couplers_to_m01_data_fifo_WDATA),
        .s_axi_wready(m01_couplers_to_m01_data_fifo_WREADY),
        .s_axi_wstrb(m01_couplers_to_m01_data_fifo_WSTRB),
        .s_axi_wvalid(m01_couplers_to_m01_data_fifo_WVALID));
endmodule

module m02_couplers_imp_1BK5AWX
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]m02_couplers_to_m02_couplers_ARADDR;
  wire [0:0]m02_couplers_to_m02_couplers_ARREADY;
  wire [0:0]m02_couplers_to_m02_couplers_ARVALID;
  wire [31:0]m02_couplers_to_m02_couplers_AWADDR;
  wire [0:0]m02_couplers_to_m02_couplers_AWREADY;
  wire [0:0]m02_couplers_to_m02_couplers_AWVALID;
  wire [0:0]m02_couplers_to_m02_couplers_BREADY;
  wire [1:0]m02_couplers_to_m02_couplers_BRESP;
  wire [0:0]m02_couplers_to_m02_couplers_BVALID;
  wire [31:0]m02_couplers_to_m02_couplers_RDATA;
  wire [0:0]m02_couplers_to_m02_couplers_RREADY;
  wire [1:0]m02_couplers_to_m02_couplers_RRESP;
  wire [0:0]m02_couplers_to_m02_couplers_RVALID;
  wire [31:0]m02_couplers_to_m02_couplers_WDATA;
  wire [0:0]m02_couplers_to_m02_couplers_WREADY;
  wire [3:0]m02_couplers_to_m02_couplers_WSTRB;
  wire [0:0]m02_couplers_to_m02_couplers_WVALID;

  assign M_AXI_araddr[31:0] = m02_couplers_to_m02_couplers_ARADDR;
  assign M_AXI_arvalid[0] = m02_couplers_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = m02_couplers_to_m02_couplers_AWADDR;
  assign M_AXI_awvalid[0] = m02_couplers_to_m02_couplers_AWVALID;
  assign M_AXI_bready[0] = m02_couplers_to_m02_couplers_BREADY;
  assign M_AXI_rready[0] = m02_couplers_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m02_couplers_to_m02_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m02_couplers_to_m02_couplers_WSTRB;
  assign M_AXI_wvalid[0] = m02_couplers_to_m02_couplers_WVALID;
  assign S_AXI_arready[0] = m02_couplers_to_m02_couplers_ARREADY;
  assign S_AXI_awready[0] = m02_couplers_to_m02_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_m02_couplers_BRESP;
  assign S_AXI_bvalid[0] = m02_couplers_to_m02_couplers_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_m02_couplers_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_m02_couplers_RRESP;
  assign S_AXI_rvalid[0] = m02_couplers_to_m02_couplers_RVALID;
  assign S_AXI_wready[0] = m02_couplers_to_m02_couplers_WREADY;
  assign m02_couplers_to_m02_couplers_ARADDR = S_AXI_araddr[31:0];
  assign m02_couplers_to_m02_couplers_ARREADY = M_AXI_arready[0];
  assign m02_couplers_to_m02_couplers_ARVALID = S_AXI_arvalid[0];
  assign m02_couplers_to_m02_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign m02_couplers_to_m02_couplers_AWREADY = M_AXI_awready[0];
  assign m02_couplers_to_m02_couplers_AWVALID = S_AXI_awvalid[0];
  assign m02_couplers_to_m02_couplers_BREADY = S_AXI_bready[0];
  assign m02_couplers_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign m02_couplers_to_m02_couplers_BVALID = M_AXI_bvalid[0];
  assign m02_couplers_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign m02_couplers_to_m02_couplers_RREADY = S_AXI_rready[0];
  assign m02_couplers_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign m02_couplers_to_m02_couplers_RVALID = M_AXI_rvalid[0];
  assign m02_couplers_to_m02_couplers_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_m02_couplers_WREADY = M_AXI_wready[0];
  assign m02_couplers_to_m02_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign m02_couplers_to_m02_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module m02_couplers_imp_L1EJCA
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [11:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [11:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]m02_couplers_to_m02_data_fifo_ARADDR;
  wire [2:0]m02_couplers_to_m02_data_fifo_ARPROT;
  wire m02_couplers_to_m02_data_fifo_ARREADY;
  wire m02_couplers_to_m02_data_fifo_ARVALID;
  wire [31:0]m02_couplers_to_m02_data_fifo_AWADDR;
  wire [2:0]m02_couplers_to_m02_data_fifo_AWPROT;
  wire m02_couplers_to_m02_data_fifo_AWREADY;
  wire m02_couplers_to_m02_data_fifo_AWVALID;
  wire m02_couplers_to_m02_data_fifo_BREADY;
  wire [1:0]m02_couplers_to_m02_data_fifo_BRESP;
  wire m02_couplers_to_m02_data_fifo_BVALID;
  wire [31:0]m02_couplers_to_m02_data_fifo_RDATA;
  wire m02_couplers_to_m02_data_fifo_RREADY;
  wire [1:0]m02_couplers_to_m02_data_fifo_RRESP;
  wire m02_couplers_to_m02_data_fifo_RVALID;
  wire [31:0]m02_couplers_to_m02_data_fifo_WDATA;
  wire m02_couplers_to_m02_data_fifo_WREADY;
  wire [3:0]m02_couplers_to_m02_data_fifo_WSTRB;
  wire m02_couplers_to_m02_data_fifo_WVALID;
  wire [11:0]m02_data_fifo_to_m02_couplers_ARADDR;
  wire [2:0]m02_data_fifo_to_m02_couplers_ARPROT;
  wire m02_data_fifo_to_m02_couplers_ARREADY;
  wire m02_data_fifo_to_m02_couplers_ARVALID;
  wire [11:0]m02_data_fifo_to_m02_couplers_AWADDR;
  wire [2:0]m02_data_fifo_to_m02_couplers_AWPROT;
  wire m02_data_fifo_to_m02_couplers_AWREADY;
  wire m02_data_fifo_to_m02_couplers_AWVALID;
  wire m02_data_fifo_to_m02_couplers_BREADY;
  wire [1:0]m02_data_fifo_to_m02_couplers_BRESP;
  wire m02_data_fifo_to_m02_couplers_BVALID;
  wire [31:0]m02_data_fifo_to_m02_couplers_RDATA;
  wire m02_data_fifo_to_m02_couplers_RREADY;
  wire [1:0]m02_data_fifo_to_m02_couplers_RRESP;
  wire m02_data_fifo_to_m02_couplers_RVALID;
  wire [31:0]m02_data_fifo_to_m02_couplers_WDATA;
  wire m02_data_fifo_to_m02_couplers_WREADY;
  wire [3:0]m02_data_fifo_to_m02_couplers_WSTRB;
  wire m02_data_fifo_to_m02_couplers_WVALID;

  assign M_AXI_araddr[11:0] = m02_data_fifo_to_m02_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m02_data_fifo_to_m02_couplers_ARPROT;
  assign M_AXI_arvalid = m02_data_fifo_to_m02_couplers_ARVALID;
  assign M_AXI_awaddr[11:0] = m02_data_fifo_to_m02_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m02_data_fifo_to_m02_couplers_AWPROT;
  assign M_AXI_awvalid = m02_data_fifo_to_m02_couplers_AWVALID;
  assign M_AXI_bready = m02_data_fifo_to_m02_couplers_BREADY;
  assign M_AXI_rready = m02_data_fifo_to_m02_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m02_data_fifo_to_m02_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m02_data_fifo_to_m02_couplers_WSTRB;
  assign M_AXI_wvalid = m02_data_fifo_to_m02_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m02_couplers_to_m02_data_fifo_ARREADY;
  assign S_AXI_awready = m02_couplers_to_m02_data_fifo_AWREADY;
  assign S_AXI_bresp[1:0] = m02_couplers_to_m02_data_fifo_BRESP;
  assign S_AXI_bvalid = m02_couplers_to_m02_data_fifo_BVALID;
  assign S_AXI_rdata[31:0] = m02_couplers_to_m02_data_fifo_RDATA;
  assign S_AXI_rresp[1:0] = m02_couplers_to_m02_data_fifo_RRESP;
  assign S_AXI_rvalid = m02_couplers_to_m02_data_fifo_RVALID;
  assign S_AXI_wready = m02_couplers_to_m02_data_fifo_WREADY;
  assign m02_couplers_to_m02_data_fifo_ARADDR = S_AXI_araddr[31:0];
  assign m02_couplers_to_m02_data_fifo_ARPROT = S_AXI_arprot[2:0];
  assign m02_couplers_to_m02_data_fifo_ARVALID = S_AXI_arvalid;
  assign m02_couplers_to_m02_data_fifo_AWADDR = S_AXI_awaddr[31:0];
  assign m02_couplers_to_m02_data_fifo_AWPROT = S_AXI_awprot[2:0];
  assign m02_couplers_to_m02_data_fifo_AWVALID = S_AXI_awvalid;
  assign m02_couplers_to_m02_data_fifo_BREADY = S_AXI_bready;
  assign m02_couplers_to_m02_data_fifo_RREADY = S_AXI_rready;
  assign m02_couplers_to_m02_data_fifo_WDATA = S_AXI_wdata[31:0];
  assign m02_couplers_to_m02_data_fifo_WSTRB = S_AXI_wstrb[3:0];
  assign m02_couplers_to_m02_data_fifo_WVALID = S_AXI_wvalid;
  assign m02_data_fifo_to_m02_couplers_ARREADY = M_AXI_arready;
  assign m02_data_fifo_to_m02_couplers_AWREADY = M_AXI_awready;
  assign m02_data_fifo_to_m02_couplers_BRESP = M_AXI_bresp[1:0];
  assign m02_data_fifo_to_m02_couplers_BVALID = M_AXI_bvalid;
  assign m02_data_fifo_to_m02_couplers_RDATA = M_AXI_rdata[31:0];
  assign m02_data_fifo_to_m02_couplers_RRESP = M_AXI_rresp[1:0];
  assign m02_data_fifo_to_m02_couplers_RVALID = M_AXI_rvalid;
  assign m02_data_fifo_to_m02_couplers_WREADY = M_AXI_wready;
  control_sub_m02_data_fifo_0 m02_data_fifo
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(m02_data_fifo_to_m02_couplers_ARADDR),
        .m_axi_arprot(m02_data_fifo_to_m02_couplers_ARPROT),
        .m_axi_arready(m02_data_fifo_to_m02_couplers_ARREADY),
        .m_axi_arvalid(m02_data_fifo_to_m02_couplers_ARVALID),
        .m_axi_awaddr(m02_data_fifo_to_m02_couplers_AWADDR),
        .m_axi_awprot(m02_data_fifo_to_m02_couplers_AWPROT),
        .m_axi_awready(m02_data_fifo_to_m02_couplers_AWREADY),
        .m_axi_awvalid(m02_data_fifo_to_m02_couplers_AWVALID),
        .m_axi_bready(m02_data_fifo_to_m02_couplers_BREADY),
        .m_axi_bresp(m02_data_fifo_to_m02_couplers_BRESP),
        .m_axi_bvalid(m02_data_fifo_to_m02_couplers_BVALID),
        .m_axi_rdata(m02_data_fifo_to_m02_couplers_RDATA),
        .m_axi_rready(m02_data_fifo_to_m02_couplers_RREADY),
        .m_axi_rresp(m02_data_fifo_to_m02_couplers_RRESP),
        .m_axi_rvalid(m02_data_fifo_to_m02_couplers_RVALID),
        .m_axi_wdata(m02_data_fifo_to_m02_couplers_WDATA),
        .m_axi_wready(m02_data_fifo_to_m02_couplers_WREADY),
        .m_axi_wstrb(m02_data_fifo_to_m02_couplers_WSTRB),
        .m_axi_wvalid(m02_data_fifo_to_m02_couplers_WVALID),
        .s_axi_araddr(m02_couplers_to_m02_data_fifo_ARADDR[11:0]),
        .s_axi_arprot(m02_couplers_to_m02_data_fifo_ARPROT),
        .s_axi_arready(m02_couplers_to_m02_data_fifo_ARREADY),
        .s_axi_arvalid(m02_couplers_to_m02_data_fifo_ARVALID),
        .s_axi_awaddr(m02_couplers_to_m02_data_fifo_AWADDR[11:0]),
        .s_axi_awprot(m02_couplers_to_m02_data_fifo_AWPROT),
        .s_axi_awready(m02_couplers_to_m02_data_fifo_AWREADY),
        .s_axi_awvalid(m02_couplers_to_m02_data_fifo_AWVALID),
        .s_axi_bready(m02_couplers_to_m02_data_fifo_BREADY),
        .s_axi_bresp(m02_couplers_to_m02_data_fifo_BRESP),
        .s_axi_bvalid(m02_couplers_to_m02_data_fifo_BVALID),
        .s_axi_rdata(m02_couplers_to_m02_data_fifo_RDATA),
        .s_axi_rready(m02_couplers_to_m02_data_fifo_RREADY),
        .s_axi_rresp(m02_couplers_to_m02_data_fifo_RRESP),
        .s_axi_rvalid(m02_couplers_to_m02_data_fifo_RVALID),
        .s_axi_wdata(m02_couplers_to_m02_data_fifo_WDATA),
        .s_axi_wready(m02_couplers_to_m02_data_fifo_WREADY),
        .s_axi_wstrb(m02_couplers_to_m02_data_fifo_WSTRB),
        .s_axi_wvalid(m02_couplers_to_m02_data_fifo_WVALID));
endmodule

module m03_couplers_imp_1MTZV90
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [11:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [11:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]m03_couplers_to_m03_data_fifo_ARADDR;
  wire [2:0]m03_couplers_to_m03_data_fifo_ARPROT;
  wire m03_couplers_to_m03_data_fifo_ARREADY;
  wire m03_couplers_to_m03_data_fifo_ARVALID;
  wire [31:0]m03_couplers_to_m03_data_fifo_AWADDR;
  wire [2:0]m03_couplers_to_m03_data_fifo_AWPROT;
  wire m03_couplers_to_m03_data_fifo_AWREADY;
  wire m03_couplers_to_m03_data_fifo_AWVALID;
  wire m03_couplers_to_m03_data_fifo_BREADY;
  wire [1:0]m03_couplers_to_m03_data_fifo_BRESP;
  wire m03_couplers_to_m03_data_fifo_BVALID;
  wire [31:0]m03_couplers_to_m03_data_fifo_RDATA;
  wire m03_couplers_to_m03_data_fifo_RREADY;
  wire [1:0]m03_couplers_to_m03_data_fifo_RRESP;
  wire m03_couplers_to_m03_data_fifo_RVALID;
  wire [31:0]m03_couplers_to_m03_data_fifo_WDATA;
  wire m03_couplers_to_m03_data_fifo_WREADY;
  wire [3:0]m03_couplers_to_m03_data_fifo_WSTRB;
  wire m03_couplers_to_m03_data_fifo_WVALID;
  wire [11:0]m03_data_fifo_to_m03_couplers_ARADDR;
  wire [2:0]m03_data_fifo_to_m03_couplers_ARPROT;
  wire m03_data_fifo_to_m03_couplers_ARREADY;
  wire m03_data_fifo_to_m03_couplers_ARVALID;
  wire [11:0]m03_data_fifo_to_m03_couplers_AWADDR;
  wire [2:0]m03_data_fifo_to_m03_couplers_AWPROT;
  wire m03_data_fifo_to_m03_couplers_AWREADY;
  wire m03_data_fifo_to_m03_couplers_AWVALID;
  wire m03_data_fifo_to_m03_couplers_BREADY;
  wire [1:0]m03_data_fifo_to_m03_couplers_BRESP;
  wire m03_data_fifo_to_m03_couplers_BVALID;
  wire [31:0]m03_data_fifo_to_m03_couplers_RDATA;
  wire m03_data_fifo_to_m03_couplers_RREADY;
  wire [1:0]m03_data_fifo_to_m03_couplers_RRESP;
  wire m03_data_fifo_to_m03_couplers_RVALID;
  wire [31:0]m03_data_fifo_to_m03_couplers_WDATA;
  wire m03_data_fifo_to_m03_couplers_WREADY;
  wire [3:0]m03_data_fifo_to_m03_couplers_WSTRB;
  wire m03_data_fifo_to_m03_couplers_WVALID;

  assign M_AXI_araddr[11:0] = m03_data_fifo_to_m03_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m03_data_fifo_to_m03_couplers_ARPROT;
  assign M_AXI_arvalid = m03_data_fifo_to_m03_couplers_ARVALID;
  assign M_AXI_awaddr[11:0] = m03_data_fifo_to_m03_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m03_data_fifo_to_m03_couplers_AWPROT;
  assign M_AXI_awvalid = m03_data_fifo_to_m03_couplers_AWVALID;
  assign M_AXI_bready = m03_data_fifo_to_m03_couplers_BREADY;
  assign M_AXI_rready = m03_data_fifo_to_m03_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m03_data_fifo_to_m03_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m03_data_fifo_to_m03_couplers_WSTRB;
  assign M_AXI_wvalid = m03_data_fifo_to_m03_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m03_couplers_to_m03_data_fifo_ARREADY;
  assign S_AXI_awready = m03_couplers_to_m03_data_fifo_AWREADY;
  assign S_AXI_bresp[1:0] = m03_couplers_to_m03_data_fifo_BRESP;
  assign S_AXI_bvalid = m03_couplers_to_m03_data_fifo_BVALID;
  assign S_AXI_rdata[31:0] = m03_couplers_to_m03_data_fifo_RDATA;
  assign S_AXI_rresp[1:0] = m03_couplers_to_m03_data_fifo_RRESP;
  assign S_AXI_rvalid = m03_couplers_to_m03_data_fifo_RVALID;
  assign S_AXI_wready = m03_couplers_to_m03_data_fifo_WREADY;
  assign m03_couplers_to_m03_data_fifo_ARADDR = S_AXI_araddr[31:0];
  assign m03_couplers_to_m03_data_fifo_ARPROT = S_AXI_arprot[2:0];
  assign m03_couplers_to_m03_data_fifo_ARVALID = S_AXI_arvalid;
  assign m03_couplers_to_m03_data_fifo_AWADDR = S_AXI_awaddr[31:0];
  assign m03_couplers_to_m03_data_fifo_AWPROT = S_AXI_awprot[2:0];
  assign m03_couplers_to_m03_data_fifo_AWVALID = S_AXI_awvalid;
  assign m03_couplers_to_m03_data_fifo_BREADY = S_AXI_bready;
  assign m03_couplers_to_m03_data_fifo_RREADY = S_AXI_rready;
  assign m03_couplers_to_m03_data_fifo_WDATA = S_AXI_wdata[31:0];
  assign m03_couplers_to_m03_data_fifo_WSTRB = S_AXI_wstrb[3:0];
  assign m03_couplers_to_m03_data_fifo_WVALID = S_AXI_wvalid;
  assign m03_data_fifo_to_m03_couplers_ARREADY = M_AXI_arready;
  assign m03_data_fifo_to_m03_couplers_AWREADY = M_AXI_awready;
  assign m03_data_fifo_to_m03_couplers_BRESP = M_AXI_bresp[1:0];
  assign m03_data_fifo_to_m03_couplers_BVALID = M_AXI_bvalid;
  assign m03_data_fifo_to_m03_couplers_RDATA = M_AXI_rdata[31:0];
  assign m03_data_fifo_to_m03_couplers_RRESP = M_AXI_rresp[1:0];
  assign m03_data_fifo_to_m03_couplers_RVALID = M_AXI_rvalid;
  assign m03_data_fifo_to_m03_couplers_WREADY = M_AXI_wready;
  control_sub_m03_data_fifo_0 m03_data_fifo
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(m03_data_fifo_to_m03_couplers_ARADDR),
        .m_axi_arprot(m03_data_fifo_to_m03_couplers_ARPROT),
        .m_axi_arready(m03_data_fifo_to_m03_couplers_ARREADY),
        .m_axi_arvalid(m03_data_fifo_to_m03_couplers_ARVALID),
        .m_axi_awaddr(m03_data_fifo_to_m03_couplers_AWADDR),
        .m_axi_awprot(m03_data_fifo_to_m03_couplers_AWPROT),
        .m_axi_awready(m03_data_fifo_to_m03_couplers_AWREADY),
        .m_axi_awvalid(m03_data_fifo_to_m03_couplers_AWVALID),
        .m_axi_bready(m03_data_fifo_to_m03_couplers_BREADY),
        .m_axi_bresp(m03_data_fifo_to_m03_couplers_BRESP),
        .m_axi_bvalid(m03_data_fifo_to_m03_couplers_BVALID),
        .m_axi_rdata(m03_data_fifo_to_m03_couplers_RDATA),
        .m_axi_rready(m03_data_fifo_to_m03_couplers_RREADY),
        .m_axi_rresp(m03_data_fifo_to_m03_couplers_RRESP),
        .m_axi_rvalid(m03_data_fifo_to_m03_couplers_RVALID),
        .m_axi_wdata(m03_data_fifo_to_m03_couplers_WDATA),
        .m_axi_wready(m03_data_fifo_to_m03_couplers_WREADY),
        .m_axi_wstrb(m03_data_fifo_to_m03_couplers_WSTRB),
        .m_axi_wvalid(m03_data_fifo_to_m03_couplers_WVALID),
        .s_axi_araddr(m03_couplers_to_m03_data_fifo_ARADDR[11:0]),
        .s_axi_arprot(m03_couplers_to_m03_data_fifo_ARPROT),
        .s_axi_arready(m03_couplers_to_m03_data_fifo_ARREADY),
        .s_axi_arvalid(m03_couplers_to_m03_data_fifo_ARVALID),
        .s_axi_awaddr(m03_couplers_to_m03_data_fifo_AWADDR[11:0]),
        .s_axi_awprot(m03_couplers_to_m03_data_fifo_AWPROT),
        .s_axi_awready(m03_couplers_to_m03_data_fifo_AWREADY),
        .s_axi_awvalid(m03_couplers_to_m03_data_fifo_AWVALID),
        .s_axi_bready(m03_couplers_to_m03_data_fifo_BREADY),
        .s_axi_bresp(m03_couplers_to_m03_data_fifo_BRESP),
        .s_axi_bvalid(m03_couplers_to_m03_data_fifo_BVALID),
        .s_axi_rdata(m03_couplers_to_m03_data_fifo_RDATA),
        .s_axi_rready(m03_couplers_to_m03_data_fifo_RREADY),
        .s_axi_rresp(m03_couplers_to_m03_data_fifo_RRESP),
        .s_axi_rvalid(m03_couplers_to_m03_data_fifo_RVALID),
        .s_axi_wdata(m03_couplers_to_m03_data_fifo_WDATA),
        .s_axi_wready(m03_couplers_to_m03_data_fifo_WREADY),
        .s_axi_wstrb(m03_couplers_to_m03_data_fifo_WSTRB),
        .s_axi_wvalid(m03_couplers_to_m03_data_fifo_WVALID));
endmodule

module m04_couplers_imp_1GP65RG
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [11:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [11:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]m04_couplers_to_m04_data_fifo_ARADDR;
  wire [2:0]m04_couplers_to_m04_data_fifo_ARPROT;
  wire m04_couplers_to_m04_data_fifo_ARREADY;
  wire m04_couplers_to_m04_data_fifo_ARVALID;
  wire [31:0]m04_couplers_to_m04_data_fifo_AWADDR;
  wire [2:0]m04_couplers_to_m04_data_fifo_AWPROT;
  wire m04_couplers_to_m04_data_fifo_AWREADY;
  wire m04_couplers_to_m04_data_fifo_AWVALID;
  wire m04_couplers_to_m04_data_fifo_BREADY;
  wire [1:0]m04_couplers_to_m04_data_fifo_BRESP;
  wire m04_couplers_to_m04_data_fifo_BVALID;
  wire [31:0]m04_couplers_to_m04_data_fifo_RDATA;
  wire m04_couplers_to_m04_data_fifo_RREADY;
  wire [1:0]m04_couplers_to_m04_data_fifo_RRESP;
  wire m04_couplers_to_m04_data_fifo_RVALID;
  wire [31:0]m04_couplers_to_m04_data_fifo_WDATA;
  wire m04_couplers_to_m04_data_fifo_WREADY;
  wire [3:0]m04_couplers_to_m04_data_fifo_WSTRB;
  wire m04_couplers_to_m04_data_fifo_WVALID;
  wire [11:0]m04_data_fifo_to_m04_couplers_ARADDR;
  wire [2:0]m04_data_fifo_to_m04_couplers_ARPROT;
  wire m04_data_fifo_to_m04_couplers_ARREADY;
  wire m04_data_fifo_to_m04_couplers_ARVALID;
  wire [11:0]m04_data_fifo_to_m04_couplers_AWADDR;
  wire [2:0]m04_data_fifo_to_m04_couplers_AWPROT;
  wire m04_data_fifo_to_m04_couplers_AWREADY;
  wire m04_data_fifo_to_m04_couplers_AWVALID;
  wire m04_data_fifo_to_m04_couplers_BREADY;
  wire [1:0]m04_data_fifo_to_m04_couplers_BRESP;
  wire m04_data_fifo_to_m04_couplers_BVALID;
  wire [31:0]m04_data_fifo_to_m04_couplers_RDATA;
  wire m04_data_fifo_to_m04_couplers_RREADY;
  wire [1:0]m04_data_fifo_to_m04_couplers_RRESP;
  wire m04_data_fifo_to_m04_couplers_RVALID;
  wire [31:0]m04_data_fifo_to_m04_couplers_WDATA;
  wire m04_data_fifo_to_m04_couplers_WREADY;
  wire [3:0]m04_data_fifo_to_m04_couplers_WSTRB;
  wire m04_data_fifo_to_m04_couplers_WVALID;

  assign M_AXI_araddr[11:0] = m04_data_fifo_to_m04_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m04_data_fifo_to_m04_couplers_ARPROT;
  assign M_AXI_arvalid = m04_data_fifo_to_m04_couplers_ARVALID;
  assign M_AXI_awaddr[11:0] = m04_data_fifo_to_m04_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m04_data_fifo_to_m04_couplers_AWPROT;
  assign M_AXI_awvalid = m04_data_fifo_to_m04_couplers_AWVALID;
  assign M_AXI_bready = m04_data_fifo_to_m04_couplers_BREADY;
  assign M_AXI_rready = m04_data_fifo_to_m04_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m04_data_fifo_to_m04_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m04_data_fifo_to_m04_couplers_WSTRB;
  assign M_AXI_wvalid = m04_data_fifo_to_m04_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m04_couplers_to_m04_data_fifo_ARREADY;
  assign S_AXI_awready = m04_couplers_to_m04_data_fifo_AWREADY;
  assign S_AXI_bresp[1:0] = m04_couplers_to_m04_data_fifo_BRESP;
  assign S_AXI_bvalid = m04_couplers_to_m04_data_fifo_BVALID;
  assign S_AXI_rdata[31:0] = m04_couplers_to_m04_data_fifo_RDATA;
  assign S_AXI_rresp[1:0] = m04_couplers_to_m04_data_fifo_RRESP;
  assign S_AXI_rvalid = m04_couplers_to_m04_data_fifo_RVALID;
  assign S_AXI_wready = m04_couplers_to_m04_data_fifo_WREADY;
  assign m04_couplers_to_m04_data_fifo_ARADDR = S_AXI_araddr[31:0];
  assign m04_couplers_to_m04_data_fifo_ARPROT = S_AXI_arprot[2:0];
  assign m04_couplers_to_m04_data_fifo_ARVALID = S_AXI_arvalid;
  assign m04_couplers_to_m04_data_fifo_AWADDR = S_AXI_awaddr[31:0];
  assign m04_couplers_to_m04_data_fifo_AWPROT = S_AXI_awprot[2:0];
  assign m04_couplers_to_m04_data_fifo_AWVALID = S_AXI_awvalid;
  assign m04_couplers_to_m04_data_fifo_BREADY = S_AXI_bready;
  assign m04_couplers_to_m04_data_fifo_RREADY = S_AXI_rready;
  assign m04_couplers_to_m04_data_fifo_WDATA = S_AXI_wdata[31:0];
  assign m04_couplers_to_m04_data_fifo_WSTRB = S_AXI_wstrb[3:0];
  assign m04_couplers_to_m04_data_fifo_WVALID = S_AXI_wvalid;
  assign m04_data_fifo_to_m04_couplers_ARREADY = M_AXI_arready;
  assign m04_data_fifo_to_m04_couplers_AWREADY = M_AXI_awready;
  assign m04_data_fifo_to_m04_couplers_BRESP = M_AXI_bresp[1:0];
  assign m04_data_fifo_to_m04_couplers_BVALID = M_AXI_bvalid;
  assign m04_data_fifo_to_m04_couplers_RDATA = M_AXI_rdata[31:0];
  assign m04_data_fifo_to_m04_couplers_RRESP = M_AXI_rresp[1:0];
  assign m04_data_fifo_to_m04_couplers_RVALID = M_AXI_rvalid;
  assign m04_data_fifo_to_m04_couplers_WREADY = M_AXI_wready;
  control_sub_m04_data_fifo_0 m04_data_fifo
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(m04_data_fifo_to_m04_couplers_ARADDR),
        .m_axi_arprot(m04_data_fifo_to_m04_couplers_ARPROT),
        .m_axi_arready(m04_data_fifo_to_m04_couplers_ARREADY),
        .m_axi_arvalid(m04_data_fifo_to_m04_couplers_ARVALID),
        .m_axi_awaddr(m04_data_fifo_to_m04_couplers_AWADDR),
        .m_axi_awprot(m04_data_fifo_to_m04_couplers_AWPROT),
        .m_axi_awready(m04_data_fifo_to_m04_couplers_AWREADY),
        .m_axi_awvalid(m04_data_fifo_to_m04_couplers_AWVALID),
        .m_axi_bready(m04_data_fifo_to_m04_couplers_BREADY),
        .m_axi_bresp(m04_data_fifo_to_m04_couplers_BRESP),
        .m_axi_bvalid(m04_data_fifo_to_m04_couplers_BVALID),
        .m_axi_rdata(m04_data_fifo_to_m04_couplers_RDATA),
        .m_axi_rready(m04_data_fifo_to_m04_couplers_RREADY),
        .m_axi_rresp(m04_data_fifo_to_m04_couplers_RRESP),
        .m_axi_rvalid(m04_data_fifo_to_m04_couplers_RVALID),
        .m_axi_wdata(m04_data_fifo_to_m04_couplers_WDATA),
        .m_axi_wready(m04_data_fifo_to_m04_couplers_WREADY),
        .m_axi_wstrb(m04_data_fifo_to_m04_couplers_WSTRB),
        .m_axi_wvalid(m04_data_fifo_to_m04_couplers_WVALID),
        .s_axi_araddr(m04_couplers_to_m04_data_fifo_ARADDR[11:0]),
        .s_axi_arprot(m04_couplers_to_m04_data_fifo_ARPROT),
        .s_axi_arready(m04_couplers_to_m04_data_fifo_ARREADY),
        .s_axi_arvalid(m04_couplers_to_m04_data_fifo_ARVALID),
        .s_axi_awaddr(m04_couplers_to_m04_data_fifo_AWADDR[11:0]),
        .s_axi_awprot(m04_couplers_to_m04_data_fifo_AWPROT),
        .s_axi_awready(m04_couplers_to_m04_data_fifo_AWREADY),
        .s_axi_awvalid(m04_couplers_to_m04_data_fifo_AWVALID),
        .s_axi_bready(m04_couplers_to_m04_data_fifo_BREADY),
        .s_axi_bresp(m04_couplers_to_m04_data_fifo_BRESP),
        .s_axi_bvalid(m04_couplers_to_m04_data_fifo_BVALID),
        .s_axi_rdata(m04_couplers_to_m04_data_fifo_RDATA),
        .s_axi_rready(m04_couplers_to_m04_data_fifo_RREADY),
        .s_axi_rresp(m04_couplers_to_m04_data_fifo_RRESP),
        .s_axi_rvalid(m04_couplers_to_m04_data_fifo_RVALID),
        .s_axi_wdata(m04_couplers_to_m04_data_fifo_WDATA),
        .s_axi_wready(m04_couplers_to_m04_data_fifo_WREADY),
        .s_axi_wstrb(m04_couplers_to_m04_data_fifo_WSTRB),
        .s_axi_wvalid(m04_couplers_to_m04_data_fifo_WVALID));
endmodule

module m05_couplers_imp_9HOIEQ
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [11:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [11:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]m05_couplers_to_m05_data_fifo_ARADDR;
  wire [2:0]m05_couplers_to_m05_data_fifo_ARPROT;
  wire m05_couplers_to_m05_data_fifo_ARREADY;
  wire m05_couplers_to_m05_data_fifo_ARVALID;
  wire [31:0]m05_couplers_to_m05_data_fifo_AWADDR;
  wire [2:0]m05_couplers_to_m05_data_fifo_AWPROT;
  wire m05_couplers_to_m05_data_fifo_AWREADY;
  wire m05_couplers_to_m05_data_fifo_AWVALID;
  wire m05_couplers_to_m05_data_fifo_BREADY;
  wire [1:0]m05_couplers_to_m05_data_fifo_BRESP;
  wire m05_couplers_to_m05_data_fifo_BVALID;
  wire [31:0]m05_couplers_to_m05_data_fifo_RDATA;
  wire m05_couplers_to_m05_data_fifo_RREADY;
  wire [1:0]m05_couplers_to_m05_data_fifo_RRESP;
  wire m05_couplers_to_m05_data_fifo_RVALID;
  wire [31:0]m05_couplers_to_m05_data_fifo_WDATA;
  wire m05_couplers_to_m05_data_fifo_WREADY;
  wire [3:0]m05_couplers_to_m05_data_fifo_WSTRB;
  wire m05_couplers_to_m05_data_fifo_WVALID;
  wire [11:0]m05_data_fifo_to_m05_couplers_ARADDR;
  wire [2:0]m05_data_fifo_to_m05_couplers_ARPROT;
  wire m05_data_fifo_to_m05_couplers_ARREADY;
  wire m05_data_fifo_to_m05_couplers_ARVALID;
  wire [11:0]m05_data_fifo_to_m05_couplers_AWADDR;
  wire [2:0]m05_data_fifo_to_m05_couplers_AWPROT;
  wire m05_data_fifo_to_m05_couplers_AWREADY;
  wire m05_data_fifo_to_m05_couplers_AWVALID;
  wire m05_data_fifo_to_m05_couplers_BREADY;
  wire [1:0]m05_data_fifo_to_m05_couplers_BRESP;
  wire m05_data_fifo_to_m05_couplers_BVALID;
  wire [31:0]m05_data_fifo_to_m05_couplers_RDATA;
  wire m05_data_fifo_to_m05_couplers_RREADY;
  wire [1:0]m05_data_fifo_to_m05_couplers_RRESP;
  wire m05_data_fifo_to_m05_couplers_RVALID;
  wire [31:0]m05_data_fifo_to_m05_couplers_WDATA;
  wire m05_data_fifo_to_m05_couplers_WREADY;
  wire [3:0]m05_data_fifo_to_m05_couplers_WSTRB;
  wire m05_data_fifo_to_m05_couplers_WVALID;

  assign M_AXI_araddr[11:0] = m05_data_fifo_to_m05_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m05_data_fifo_to_m05_couplers_ARPROT;
  assign M_AXI_arvalid = m05_data_fifo_to_m05_couplers_ARVALID;
  assign M_AXI_awaddr[11:0] = m05_data_fifo_to_m05_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m05_data_fifo_to_m05_couplers_AWPROT;
  assign M_AXI_awvalid = m05_data_fifo_to_m05_couplers_AWVALID;
  assign M_AXI_bready = m05_data_fifo_to_m05_couplers_BREADY;
  assign M_AXI_rready = m05_data_fifo_to_m05_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m05_data_fifo_to_m05_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m05_data_fifo_to_m05_couplers_WSTRB;
  assign M_AXI_wvalid = m05_data_fifo_to_m05_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m05_couplers_to_m05_data_fifo_ARREADY;
  assign S_AXI_awready = m05_couplers_to_m05_data_fifo_AWREADY;
  assign S_AXI_bresp[1:0] = m05_couplers_to_m05_data_fifo_BRESP;
  assign S_AXI_bvalid = m05_couplers_to_m05_data_fifo_BVALID;
  assign S_AXI_rdata[31:0] = m05_couplers_to_m05_data_fifo_RDATA;
  assign S_AXI_rresp[1:0] = m05_couplers_to_m05_data_fifo_RRESP;
  assign S_AXI_rvalid = m05_couplers_to_m05_data_fifo_RVALID;
  assign S_AXI_wready = m05_couplers_to_m05_data_fifo_WREADY;
  assign m05_couplers_to_m05_data_fifo_ARADDR = S_AXI_araddr[31:0];
  assign m05_couplers_to_m05_data_fifo_ARPROT = S_AXI_arprot[2:0];
  assign m05_couplers_to_m05_data_fifo_ARVALID = S_AXI_arvalid;
  assign m05_couplers_to_m05_data_fifo_AWADDR = S_AXI_awaddr[31:0];
  assign m05_couplers_to_m05_data_fifo_AWPROT = S_AXI_awprot[2:0];
  assign m05_couplers_to_m05_data_fifo_AWVALID = S_AXI_awvalid;
  assign m05_couplers_to_m05_data_fifo_BREADY = S_AXI_bready;
  assign m05_couplers_to_m05_data_fifo_RREADY = S_AXI_rready;
  assign m05_couplers_to_m05_data_fifo_WDATA = S_AXI_wdata[31:0];
  assign m05_couplers_to_m05_data_fifo_WSTRB = S_AXI_wstrb[3:0];
  assign m05_couplers_to_m05_data_fifo_WVALID = S_AXI_wvalid;
  assign m05_data_fifo_to_m05_couplers_ARREADY = M_AXI_arready;
  assign m05_data_fifo_to_m05_couplers_AWREADY = M_AXI_awready;
  assign m05_data_fifo_to_m05_couplers_BRESP = M_AXI_bresp[1:0];
  assign m05_data_fifo_to_m05_couplers_BVALID = M_AXI_bvalid;
  assign m05_data_fifo_to_m05_couplers_RDATA = M_AXI_rdata[31:0];
  assign m05_data_fifo_to_m05_couplers_RRESP = M_AXI_rresp[1:0];
  assign m05_data_fifo_to_m05_couplers_RVALID = M_AXI_rvalid;
  assign m05_data_fifo_to_m05_couplers_WREADY = M_AXI_wready;
  control_sub_m05_data_fifo_0 m05_data_fifo
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(m05_data_fifo_to_m05_couplers_ARADDR),
        .m_axi_arprot(m05_data_fifo_to_m05_couplers_ARPROT),
        .m_axi_arready(m05_data_fifo_to_m05_couplers_ARREADY),
        .m_axi_arvalid(m05_data_fifo_to_m05_couplers_ARVALID),
        .m_axi_awaddr(m05_data_fifo_to_m05_couplers_AWADDR),
        .m_axi_awprot(m05_data_fifo_to_m05_couplers_AWPROT),
        .m_axi_awready(m05_data_fifo_to_m05_couplers_AWREADY),
        .m_axi_awvalid(m05_data_fifo_to_m05_couplers_AWVALID),
        .m_axi_bready(m05_data_fifo_to_m05_couplers_BREADY),
        .m_axi_bresp(m05_data_fifo_to_m05_couplers_BRESP),
        .m_axi_bvalid(m05_data_fifo_to_m05_couplers_BVALID),
        .m_axi_rdata(m05_data_fifo_to_m05_couplers_RDATA),
        .m_axi_rready(m05_data_fifo_to_m05_couplers_RREADY),
        .m_axi_rresp(m05_data_fifo_to_m05_couplers_RRESP),
        .m_axi_rvalid(m05_data_fifo_to_m05_couplers_RVALID),
        .m_axi_wdata(m05_data_fifo_to_m05_couplers_WDATA),
        .m_axi_wready(m05_data_fifo_to_m05_couplers_WREADY),
        .m_axi_wstrb(m05_data_fifo_to_m05_couplers_WSTRB),
        .m_axi_wvalid(m05_data_fifo_to_m05_couplers_WVALID),
        .s_axi_araddr(m05_couplers_to_m05_data_fifo_ARADDR[11:0]),
        .s_axi_arprot(m05_couplers_to_m05_data_fifo_ARPROT),
        .s_axi_arready(m05_couplers_to_m05_data_fifo_ARREADY),
        .s_axi_arvalid(m05_couplers_to_m05_data_fifo_ARVALID),
        .s_axi_awaddr(m05_couplers_to_m05_data_fifo_AWADDR[11:0]),
        .s_axi_awprot(m05_couplers_to_m05_data_fifo_AWPROT),
        .s_axi_awready(m05_couplers_to_m05_data_fifo_AWREADY),
        .s_axi_awvalid(m05_couplers_to_m05_data_fifo_AWVALID),
        .s_axi_bready(m05_couplers_to_m05_data_fifo_BREADY),
        .s_axi_bresp(m05_couplers_to_m05_data_fifo_BRESP),
        .s_axi_bvalid(m05_couplers_to_m05_data_fifo_BVALID),
        .s_axi_rdata(m05_couplers_to_m05_data_fifo_RDATA),
        .s_axi_rready(m05_couplers_to_m05_data_fifo_RREADY),
        .s_axi_rresp(m05_couplers_to_m05_data_fifo_RRESP),
        .s_axi_rvalid(m05_couplers_to_m05_data_fifo_RVALID),
        .s_axi_wdata(m05_couplers_to_m05_data_fifo_WDATA),
        .s_axi_wready(m05_couplers_to_m05_data_fifo_WREADY),
        .s_axi_wstrb(m05_couplers_to_m05_data_fifo_WSTRB),
        .s_axi_wvalid(m05_couplers_to_m05_data_fifo_WVALID));
endmodule

module m06_couplers_imp_OQNG0H
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [11:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [11:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]m06_couplers_to_m06_data_fifo_ARADDR;
  wire [2:0]m06_couplers_to_m06_data_fifo_ARPROT;
  wire m06_couplers_to_m06_data_fifo_ARREADY;
  wire m06_couplers_to_m06_data_fifo_ARVALID;
  wire [31:0]m06_couplers_to_m06_data_fifo_AWADDR;
  wire [2:0]m06_couplers_to_m06_data_fifo_AWPROT;
  wire m06_couplers_to_m06_data_fifo_AWREADY;
  wire m06_couplers_to_m06_data_fifo_AWVALID;
  wire m06_couplers_to_m06_data_fifo_BREADY;
  wire [1:0]m06_couplers_to_m06_data_fifo_BRESP;
  wire m06_couplers_to_m06_data_fifo_BVALID;
  wire [31:0]m06_couplers_to_m06_data_fifo_RDATA;
  wire m06_couplers_to_m06_data_fifo_RREADY;
  wire [1:0]m06_couplers_to_m06_data_fifo_RRESP;
  wire m06_couplers_to_m06_data_fifo_RVALID;
  wire [31:0]m06_couplers_to_m06_data_fifo_WDATA;
  wire m06_couplers_to_m06_data_fifo_WREADY;
  wire [3:0]m06_couplers_to_m06_data_fifo_WSTRB;
  wire m06_couplers_to_m06_data_fifo_WVALID;
  wire [11:0]m06_data_fifo_to_m06_couplers_ARADDR;
  wire [2:0]m06_data_fifo_to_m06_couplers_ARPROT;
  wire m06_data_fifo_to_m06_couplers_ARREADY;
  wire m06_data_fifo_to_m06_couplers_ARVALID;
  wire [11:0]m06_data_fifo_to_m06_couplers_AWADDR;
  wire [2:0]m06_data_fifo_to_m06_couplers_AWPROT;
  wire m06_data_fifo_to_m06_couplers_AWREADY;
  wire m06_data_fifo_to_m06_couplers_AWVALID;
  wire m06_data_fifo_to_m06_couplers_BREADY;
  wire [1:0]m06_data_fifo_to_m06_couplers_BRESP;
  wire m06_data_fifo_to_m06_couplers_BVALID;
  wire [31:0]m06_data_fifo_to_m06_couplers_RDATA;
  wire m06_data_fifo_to_m06_couplers_RREADY;
  wire [1:0]m06_data_fifo_to_m06_couplers_RRESP;
  wire m06_data_fifo_to_m06_couplers_RVALID;
  wire [31:0]m06_data_fifo_to_m06_couplers_WDATA;
  wire m06_data_fifo_to_m06_couplers_WREADY;
  wire [3:0]m06_data_fifo_to_m06_couplers_WSTRB;
  wire m06_data_fifo_to_m06_couplers_WVALID;

  assign M_AXI_araddr[11:0] = m06_data_fifo_to_m06_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m06_data_fifo_to_m06_couplers_ARPROT;
  assign M_AXI_arvalid = m06_data_fifo_to_m06_couplers_ARVALID;
  assign M_AXI_awaddr[11:0] = m06_data_fifo_to_m06_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m06_data_fifo_to_m06_couplers_AWPROT;
  assign M_AXI_awvalid = m06_data_fifo_to_m06_couplers_AWVALID;
  assign M_AXI_bready = m06_data_fifo_to_m06_couplers_BREADY;
  assign M_AXI_rready = m06_data_fifo_to_m06_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m06_data_fifo_to_m06_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m06_data_fifo_to_m06_couplers_WSTRB;
  assign M_AXI_wvalid = m06_data_fifo_to_m06_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m06_couplers_to_m06_data_fifo_ARREADY;
  assign S_AXI_awready = m06_couplers_to_m06_data_fifo_AWREADY;
  assign S_AXI_bresp[1:0] = m06_couplers_to_m06_data_fifo_BRESP;
  assign S_AXI_bvalid = m06_couplers_to_m06_data_fifo_BVALID;
  assign S_AXI_rdata[31:0] = m06_couplers_to_m06_data_fifo_RDATA;
  assign S_AXI_rresp[1:0] = m06_couplers_to_m06_data_fifo_RRESP;
  assign S_AXI_rvalid = m06_couplers_to_m06_data_fifo_RVALID;
  assign S_AXI_wready = m06_couplers_to_m06_data_fifo_WREADY;
  assign m06_couplers_to_m06_data_fifo_ARADDR = S_AXI_araddr[31:0];
  assign m06_couplers_to_m06_data_fifo_ARPROT = S_AXI_arprot[2:0];
  assign m06_couplers_to_m06_data_fifo_ARVALID = S_AXI_arvalid;
  assign m06_couplers_to_m06_data_fifo_AWADDR = S_AXI_awaddr[31:0];
  assign m06_couplers_to_m06_data_fifo_AWPROT = S_AXI_awprot[2:0];
  assign m06_couplers_to_m06_data_fifo_AWVALID = S_AXI_awvalid;
  assign m06_couplers_to_m06_data_fifo_BREADY = S_AXI_bready;
  assign m06_couplers_to_m06_data_fifo_RREADY = S_AXI_rready;
  assign m06_couplers_to_m06_data_fifo_WDATA = S_AXI_wdata[31:0];
  assign m06_couplers_to_m06_data_fifo_WSTRB = S_AXI_wstrb[3:0];
  assign m06_couplers_to_m06_data_fifo_WVALID = S_AXI_wvalid;
  assign m06_data_fifo_to_m06_couplers_ARREADY = M_AXI_arready;
  assign m06_data_fifo_to_m06_couplers_AWREADY = M_AXI_awready;
  assign m06_data_fifo_to_m06_couplers_BRESP = M_AXI_bresp[1:0];
  assign m06_data_fifo_to_m06_couplers_BVALID = M_AXI_bvalid;
  assign m06_data_fifo_to_m06_couplers_RDATA = M_AXI_rdata[31:0];
  assign m06_data_fifo_to_m06_couplers_RRESP = M_AXI_rresp[1:0];
  assign m06_data_fifo_to_m06_couplers_RVALID = M_AXI_rvalid;
  assign m06_data_fifo_to_m06_couplers_WREADY = M_AXI_wready;
  control_sub_m06_data_fifo_0 m06_data_fifo
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(m06_data_fifo_to_m06_couplers_ARADDR),
        .m_axi_arprot(m06_data_fifo_to_m06_couplers_ARPROT),
        .m_axi_arready(m06_data_fifo_to_m06_couplers_ARREADY),
        .m_axi_arvalid(m06_data_fifo_to_m06_couplers_ARVALID),
        .m_axi_awaddr(m06_data_fifo_to_m06_couplers_AWADDR),
        .m_axi_awprot(m06_data_fifo_to_m06_couplers_AWPROT),
        .m_axi_awready(m06_data_fifo_to_m06_couplers_AWREADY),
        .m_axi_awvalid(m06_data_fifo_to_m06_couplers_AWVALID),
        .m_axi_bready(m06_data_fifo_to_m06_couplers_BREADY),
        .m_axi_bresp(m06_data_fifo_to_m06_couplers_BRESP),
        .m_axi_bvalid(m06_data_fifo_to_m06_couplers_BVALID),
        .m_axi_rdata(m06_data_fifo_to_m06_couplers_RDATA),
        .m_axi_rready(m06_data_fifo_to_m06_couplers_RREADY),
        .m_axi_rresp(m06_data_fifo_to_m06_couplers_RRESP),
        .m_axi_rvalid(m06_data_fifo_to_m06_couplers_RVALID),
        .m_axi_wdata(m06_data_fifo_to_m06_couplers_WDATA),
        .m_axi_wready(m06_data_fifo_to_m06_couplers_WREADY),
        .m_axi_wstrb(m06_data_fifo_to_m06_couplers_WSTRB),
        .m_axi_wvalid(m06_data_fifo_to_m06_couplers_WVALID),
        .s_axi_araddr(m06_couplers_to_m06_data_fifo_ARADDR[11:0]),
        .s_axi_arprot(m06_couplers_to_m06_data_fifo_ARPROT),
        .s_axi_arready(m06_couplers_to_m06_data_fifo_ARREADY),
        .s_axi_arvalid(m06_couplers_to_m06_data_fifo_ARVALID),
        .s_axi_awaddr(m06_couplers_to_m06_data_fifo_AWADDR[11:0]),
        .s_axi_awprot(m06_couplers_to_m06_data_fifo_AWPROT),
        .s_axi_awready(m06_couplers_to_m06_data_fifo_AWREADY),
        .s_axi_awvalid(m06_couplers_to_m06_data_fifo_AWVALID),
        .s_axi_bready(m06_couplers_to_m06_data_fifo_BREADY),
        .s_axi_bresp(m06_couplers_to_m06_data_fifo_BRESP),
        .s_axi_bvalid(m06_couplers_to_m06_data_fifo_BVALID),
        .s_axi_rdata(m06_couplers_to_m06_data_fifo_RDATA),
        .s_axi_rready(m06_couplers_to_m06_data_fifo_RREADY),
        .s_axi_rresp(m06_couplers_to_m06_data_fifo_RRESP),
        .s_axi_rvalid(m06_couplers_to_m06_data_fifo_RVALID),
        .s_axi_wdata(m06_couplers_to_m06_data_fifo_WDATA),
        .s_axi_wready(m06_couplers_to_m06_data_fifo_WREADY),
        .s_axi_wstrb(m06_couplers_to_m06_data_fifo_WSTRB),
        .s_axi_wvalid(m06_couplers_to_m06_data_fifo_WVALID));
endmodule

module m07_couplers_imp_1J7605R
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [11:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [11:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]m07_couplers_to_m07_data_fifo_ARADDR;
  wire [2:0]m07_couplers_to_m07_data_fifo_ARPROT;
  wire m07_couplers_to_m07_data_fifo_ARREADY;
  wire m07_couplers_to_m07_data_fifo_ARVALID;
  wire [31:0]m07_couplers_to_m07_data_fifo_AWADDR;
  wire [2:0]m07_couplers_to_m07_data_fifo_AWPROT;
  wire m07_couplers_to_m07_data_fifo_AWREADY;
  wire m07_couplers_to_m07_data_fifo_AWVALID;
  wire m07_couplers_to_m07_data_fifo_BREADY;
  wire [1:0]m07_couplers_to_m07_data_fifo_BRESP;
  wire m07_couplers_to_m07_data_fifo_BVALID;
  wire [31:0]m07_couplers_to_m07_data_fifo_RDATA;
  wire m07_couplers_to_m07_data_fifo_RREADY;
  wire [1:0]m07_couplers_to_m07_data_fifo_RRESP;
  wire m07_couplers_to_m07_data_fifo_RVALID;
  wire [31:0]m07_couplers_to_m07_data_fifo_WDATA;
  wire m07_couplers_to_m07_data_fifo_WREADY;
  wire [3:0]m07_couplers_to_m07_data_fifo_WSTRB;
  wire m07_couplers_to_m07_data_fifo_WVALID;
  wire [11:0]m07_data_fifo_to_m07_couplers_ARADDR;
  wire [2:0]m07_data_fifo_to_m07_couplers_ARPROT;
  wire m07_data_fifo_to_m07_couplers_ARREADY;
  wire m07_data_fifo_to_m07_couplers_ARVALID;
  wire [11:0]m07_data_fifo_to_m07_couplers_AWADDR;
  wire [2:0]m07_data_fifo_to_m07_couplers_AWPROT;
  wire m07_data_fifo_to_m07_couplers_AWREADY;
  wire m07_data_fifo_to_m07_couplers_AWVALID;
  wire m07_data_fifo_to_m07_couplers_BREADY;
  wire [1:0]m07_data_fifo_to_m07_couplers_BRESP;
  wire m07_data_fifo_to_m07_couplers_BVALID;
  wire [31:0]m07_data_fifo_to_m07_couplers_RDATA;
  wire m07_data_fifo_to_m07_couplers_RREADY;
  wire [1:0]m07_data_fifo_to_m07_couplers_RRESP;
  wire m07_data_fifo_to_m07_couplers_RVALID;
  wire [31:0]m07_data_fifo_to_m07_couplers_WDATA;
  wire m07_data_fifo_to_m07_couplers_WREADY;
  wire [3:0]m07_data_fifo_to_m07_couplers_WSTRB;
  wire m07_data_fifo_to_m07_couplers_WVALID;

  assign M_AXI_araddr[11:0] = m07_data_fifo_to_m07_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m07_data_fifo_to_m07_couplers_ARPROT;
  assign M_AXI_arvalid = m07_data_fifo_to_m07_couplers_ARVALID;
  assign M_AXI_awaddr[11:0] = m07_data_fifo_to_m07_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m07_data_fifo_to_m07_couplers_AWPROT;
  assign M_AXI_awvalid = m07_data_fifo_to_m07_couplers_AWVALID;
  assign M_AXI_bready = m07_data_fifo_to_m07_couplers_BREADY;
  assign M_AXI_rready = m07_data_fifo_to_m07_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m07_data_fifo_to_m07_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m07_data_fifo_to_m07_couplers_WSTRB;
  assign M_AXI_wvalid = m07_data_fifo_to_m07_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m07_couplers_to_m07_data_fifo_ARREADY;
  assign S_AXI_awready = m07_couplers_to_m07_data_fifo_AWREADY;
  assign S_AXI_bresp[1:0] = m07_couplers_to_m07_data_fifo_BRESP;
  assign S_AXI_bvalid = m07_couplers_to_m07_data_fifo_BVALID;
  assign S_AXI_rdata[31:0] = m07_couplers_to_m07_data_fifo_RDATA;
  assign S_AXI_rresp[1:0] = m07_couplers_to_m07_data_fifo_RRESP;
  assign S_AXI_rvalid = m07_couplers_to_m07_data_fifo_RVALID;
  assign S_AXI_wready = m07_couplers_to_m07_data_fifo_WREADY;
  assign m07_couplers_to_m07_data_fifo_ARADDR = S_AXI_araddr[31:0];
  assign m07_couplers_to_m07_data_fifo_ARPROT = S_AXI_arprot[2:0];
  assign m07_couplers_to_m07_data_fifo_ARVALID = S_AXI_arvalid;
  assign m07_couplers_to_m07_data_fifo_AWADDR = S_AXI_awaddr[31:0];
  assign m07_couplers_to_m07_data_fifo_AWPROT = S_AXI_awprot[2:0];
  assign m07_couplers_to_m07_data_fifo_AWVALID = S_AXI_awvalid;
  assign m07_couplers_to_m07_data_fifo_BREADY = S_AXI_bready;
  assign m07_couplers_to_m07_data_fifo_RREADY = S_AXI_rready;
  assign m07_couplers_to_m07_data_fifo_WDATA = S_AXI_wdata[31:0];
  assign m07_couplers_to_m07_data_fifo_WSTRB = S_AXI_wstrb[3:0];
  assign m07_couplers_to_m07_data_fifo_WVALID = S_AXI_wvalid;
  assign m07_data_fifo_to_m07_couplers_ARREADY = M_AXI_arready;
  assign m07_data_fifo_to_m07_couplers_AWREADY = M_AXI_awready;
  assign m07_data_fifo_to_m07_couplers_BRESP = M_AXI_bresp[1:0];
  assign m07_data_fifo_to_m07_couplers_BVALID = M_AXI_bvalid;
  assign m07_data_fifo_to_m07_couplers_RDATA = M_AXI_rdata[31:0];
  assign m07_data_fifo_to_m07_couplers_RRESP = M_AXI_rresp[1:0];
  assign m07_data_fifo_to_m07_couplers_RVALID = M_AXI_rvalid;
  assign m07_data_fifo_to_m07_couplers_WREADY = M_AXI_wready;
  control_sub_m07_data_fifo_0 m07_data_fifo
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(m07_data_fifo_to_m07_couplers_ARADDR),
        .m_axi_arprot(m07_data_fifo_to_m07_couplers_ARPROT),
        .m_axi_arready(m07_data_fifo_to_m07_couplers_ARREADY),
        .m_axi_arvalid(m07_data_fifo_to_m07_couplers_ARVALID),
        .m_axi_awaddr(m07_data_fifo_to_m07_couplers_AWADDR),
        .m_axi_awprot(m07_data_fifo_to_m07_couplers_AWPROT),
        .m_axi_awready(m07_data_fifo_to_m07_couplers_AWREADY),
        .m_axi_awvalid(m07_data_fifo_to_m07_couplers_AWVALID),
        .m_axi_bready(m07_data_fifo_to_m07_couplers_BREADY),
        .m_axi_bresp(m07_data_fifo_to_m07_couplers_BRESP),
        .m_axi_bvalid(m07_data_fifo_to_m07_couplers_BVALID),
        .m_axi_rdata(m07_data_fifo_to_m07_couplers_RDATA),
        .m_axi_rready(m07_data_fifo_to_m07_couplers_RREADY),
        .m_axi_rresp(m07_data_fifo_to_m07_couplers_RRESP),
        .m_axi_rvalid(m07_data_fifo_to_m07_couplers_RVALID),
        .m_axi_wdata(m07_data_fifo_to_m07_couplers_WDATA),
        .m_axi_wready(m07_data_fifo_to_m07_couplers_WREADY),
        .m_axi_wstrb(m07_data_fifo_to_m07_couplers_WSTRB),
        .m_axi_wvalid(m07_data_fifo_to_m07_couplers_WVALID),
        .s_axi_araddr(m07_couplers_to_m07_data_fifo_ARADDR[11:0]),
        .s_axi_arprot(m07_couplers_to_m07_data_fifo_ARPROT),
        .s_axi_arready(m07_couplers_to_m07_data_fifo_ARREADY),
        .s_axi_arvalid(m07_couplers_to_m07_data_fifo_ARVALID),
        .s_axi_awaddr(m07_couplers_to_m07_data_fifo_AWADDR[11:0]),
        .s_axi_awprot(m07_couplers_to_m07_data_fifo_AWPROT),
        .s_axi_awready(m07_couplers_to_m07_data_fifo_AWREADY),
        .s_axi_awvalid(m07_couplers_to_m07_data_fifo_AWVALID),
        .s_axi_bready(m07_couplers_to_m07_data_fifo_BREADY),
        .s_axi_bresp(m07_couplers_to_m07_data_fifo_BRESP),
        .s_axi_bvalid(m07_couplers_to_m07_data_fifo_BVALID),
        .s_axi_rdata(m07_couplers_to_m07_data_fifo_RDATA),
        .s_axi_rready(m07_couplers_to_m07_data_fifo_RREADY),
        .s_axi_rresp(m07_couplers_to_m07_data_fifo_RRESP),
        .s_axi_rvalid(m07_couplers_to_m07_data_fifo_RVALID),
        .s_axi_wdata(m07_couplers_to_m07_data_fifo_WDATA),
        .s_axi_wready(m07_couplers_to_m07_data_fifo_WREADY),
        .s_axi_wstrb(m07_couplers_to_m07_data_fifo_WSTRB),
        .s_axi_wvalid(m07_couplers_to_m07_data_fifo_WVALID));
endmodule

module m08_couplers_imp_12JE735
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [11:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [11:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]m08_couplers_to_m08_data_fifo_ARADDR;
  wire [2:0]m08_couplers_to_m08_data_fifo_ARPROT;
  wire m08_couplers_to_m08_data_fifo_ARREADY;
  wire m08_couplers_to_m08_data_fifo_ARVALID;
  wire [31:0]m08_couplers_to_m08_data_fifo_AWADDR;
  wire [2:0]m08_couplers_to_m08_data_fifo_AWPROT;
  wire m08_couplers_to_m08_data_fifo_AWREADY;
  wire m08_couplers_to_m08_data_fifo_AWVALID;
  wire m08_couplers_to_m08_data_fifo_BREADY;
  wire [1:0]m08_couplers_to_m08_data_fifo_BRESP;
  wire m08_couplers_to_m08_data_fifo_BVALID;
  wire [31:0]m08_couplers_to_m08_data_fifo_RDATA;
  wire m08_couplers_to_m08_data_fifo_RREADY;
  wire [1:0]m08_couplers_to_m08_data_fifo_RRESP;
  wire m08_couplers_to_m08_data_fifo_RVALID;
  wire [31:0]m08_couplers_to_m08_data_fifo_WDATA;
  wire m08_couplers_to_m08_data_fifo_WREADY;
  wire [3:0]m08_couplers_to_m08_data_fifo_WSTRB;
  wire m08_couplers_to_m08_data_fifo_WVALID;
  wire [11:0]m08_data_fifo_to_m08_couplers_ARADDR;
  wire [2:0]m08_data_fifo_to_m08_couplers_ARPROT;
  wire m08_data_fifo_to_m08_couplers_ARREADY;
  wire m08_data_fifo_to_m08_couplers_ARVALID;
  wire [11:0]m08_data_fifo_to_m08_couplers_AWADDR;
  wire [2:0]m08_data_fifo_to_m08_couplers_AWPROT;
  wire m08_data_fifo_to_m08_couplers_AWREADY;
  wire m08_data_fifo_to_m08_couplers_AWVALID;
  wire m08_data_fifo_to_m08_couplers_BREADY;
  wire [1:0]m08_data_fifo_to_m08_couplers_BRESP;
  wire m08_data_fifo_to_m08_couplers_BVALID;
  wire [31:0]m08_data_fifo_to_m08_couplers_RDATA;
  wire m08_data_fifo_to_m08_couplers_RREADY;
  wire [1:0]m08_data_fifo_to_m08_couplers_RRESP;
  wire m08_data_fifo_to_m08_couplers_RVALID;
  wire [31:0]m08_data_fifo_to_m08_couplers_WDATA;
  wire m08_data_fifo_to_m08_couplers_WREADY;
  wire [3:0]m08_data_fifo_to_m08_couplers_WSTRB;
  wire m08_data_fifo_to_m08_couplers_WVALID;

  assign M_AXI_araddr[11:0] = m08_data_fifo_to_m08_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = m08_data_fifo_to_m08_couplers_ARPROT;
  assign M_AXI_arvalid = m08_data_fifo_to_m08_couplers_ARVALID;
  assign M_AXI_awaddr[11:0] = m08_data_fifo_to_m08_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = m08_data_fifo_to_m08_couplers_AWPROT;
  assign M_AXI_awvalid = m08_data_fifo_to_m08_couplers_AWVALID;
  assign M_AXI_bready = m08_data_fifo_to_m08_couplers_BREADY;
  assign M_AXI_rready = m08_data_fifo_to_m08_couplers_RREADY;
  assign M_AXI_wdata[31:0] = m08_data_fifo_to_m08_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = m08_data_fifo_to_m08_couplers_WSTRB;
  assign M_AXI_wvalid = m08_data_fifo_to_m08_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = m08_couplers_to_m08_data_fifo_ARREADY;
  assign S_AXI_awready = m08_couplers_to_m08_data_fifo_AWREADY;
  assign S_AXI_bresp[1:0] = m08_couplers_to_m08_data_fifo_BRESP;
  assign S_AXI_bvalid = m08_couplers_to_m08_data_fifo_BVALID;
  assign S_AXI_rdata[31:0] = m08_couplers_to_m08_data_fifo_RDATA;
  assign S_AXI_rresp[1:0] = m08_couplers_to_m08_data_fifo_RRESP;
  assign S_AXI_rvalid = m08_couplers_to_m08_data_fifo_RVALID;
  assign S_AXI_wready = m08_couplers_to_m08_data_fifo_WREADY;
  assign m08_couplers_to_m08_data_fifo_ARADDR = S_AXI_araddr[31:0];
  assign m08_couplers_to_m08_data_fifo_ARPROT = S_AXI_arprot[2:0];
  assign m08_couplers_to_m08_data_fifo_ARVALID = S_AXI_arvalid;
  assign m08_couplers_to_m08_data_fifo_AWADDR = S_AXI_awaddr[31:0];
  assign m08_couplers_to_m08_data_fifo_AWPROT = S_AXI_awprot[2:0];
  assign m08_couplers_to_m08_data_fifo_AWVALID = S_AXI_awvalid;
  assign m08_couplers_to_m08_data_fifo_BREADY = S_AXI_bready;
  assign m08_couplers_to_m08_data_fifo_RREADY = S_AXI_rready;
  assign m08_couplers_to_m08_data_fifo_WDATA = S_AXI_wdata[31:0];
  assign m08_couplers_to_m08_data_fifo_WSTRB = S_AXI_wstrb[3:0];
  assign m08_couplers_to_m08_data_fifo_WVALID = S_AXI_wvalid;
  assign m08_data_fifo_to_m08_couplers_ARREADY = M_AXI_arready;
  assign m08_data_fifo_to_m08_couplers_AWREADY = M_AXI_awready;
  assign m08_data_fifo_to_m08_couplers_BRESP = M_AXI_bresp[1:0];
  assign m08_data_fifo_to_m08_couplers_BVALID = M_AXI_bvalid;
  assign m08_data_fifo_to_m08_couplers_RDATA = M_AXI_rdata[31:0];
  assign m08_data_fifo_to_m08_couplers_RRESP = M_AXI_rresp[1:0];
  assign m08_data_fifo_to_m08_couplers_RVALID = M_AXI_rvalid;
  assign m08_data_fifo_to_m08_couplers_WREADY = M_AXI_wready;
  control_sub_m08_data_fifo_0 m08_data_fifo
       (.aclk(S_ACLK_1),
        .aresetn(S_ARESETN_1),
        .m_axi_araddr(m08_data_fifo_to_m08_couplers_ARADDR),
        .m_axi_arprot(m08_data_fifo_to_m08_couplers_ARPROT),
        .m_axi_arready(m08_data_fifo_to_m08_couplers_ARREADY),
        .m_axi_arvalid(m08_data_fifo_to_m08_couplers_ARVALID),
        .m_axi_awaddr(m08_data_fifo_to_m08_couplers_AWADDR),
        .m_axi_awprot(m08_data_fifo_to_m08_couplers_AWPROT),
        .m_axi_awready(m08_data_fifo_to_m08_couplers_AWREADY),
        .m_axi_awvalid(m08_data_fifo_to_m08_couplers_AWVALID),
        .m_axi_bready(m08_data_fifo_to_m08_couplers_BREADY),
        .m_axi_bresp(m08_data_fifo_to_m08_couplers_BRESP),
        .m_axi_bvalid(m08_data_fifo_to_m08_couplers_BVALID),
        .m_axi_rdata(m08_data_fifo_to_m08_couplers_RDATA),
        .m_axi_rready(m08_data_fifo_to_m08_couplers_RREADY),
        .m_axi_rresp(m08_data_fifo_to_m08_couplers_RRESP),
        .m_axi_rvalid(m08_data_fifo_to_m08_couplers_RVALID),
        .m_axi_wdata(m08_data_fifo_to_m08_couplers_WDATA),
        .m_axi_wready(m08_data_fifo_to_m08_couplers_WREADY),
        .m_axi_wstrb(m08_data_fifo_to_m08_couplers_WSTRB),
        .m_axi_wvalid(m08_data_fifo_to_m08_couplers_WVALID),
        .s_axi_araddr(m08_couplers_to_m08_data_fifo_ARADDR[11:0]),
        .s_axi_arprot(m08_couplers_to_m08_data_fifo_ARPROT),
        .s_axi_arready(m08_couplers_to_m08_data_fifo_ARREADY),
        .s_axi_arvalid(m08_couplers_to_m08_data_fifo_ARVALID),
        .s_axi_awaddr(m08_couplers_to_m08_data_fifo_AWADDR[11:0]),
        .s_axi_awprot(m08_couplers_to_m08_data_fifo_AWPROT),
        .s_axi_awready(m08_couplers_to_m08_data_fifo_AWREADY),
        .s_axi_awvalid(m08_couplers_to_m08_data_fifo_AWVALID),
        .s_axi_bready(m08_couplers_to_m08_data_fifo_BREADY),
        .s_axi_bresp(m08_couplers_to_m08_data_fifo_BRESP),
        .s_axi_bvalid(m08_couplers_to_m08_data_fifo_BVALID),
        .s_axi_rdata(m08_couplers_to_m08_data_fifo_RDATA),
        .s_axi_rready(m08_couplers_to_m08_data_fifo_RREADY),
        .s_axi_rresp(m08_couplers_to_m08_data_fifo_RRESP),
        .s_axi_rvalid(m08_couplers_to_m08_data_fifo_RVALID),
        .s_axi_wdata(m08_couplers_to_m08_data_fifo_WDATA),
        .s_axi_wready(m08_couplers_to_m08_data_fifo_WREADY),
        .s_axi_wstrb(m08_couplers_to_m08_data_fifo_WSTRB),
        .s_axi_wvalid(m08_couplers_to_m08_data_fifo_WVALID));
endmodule

module mbsys_imp_PO32LV
   (Clk,
    In0,
    In1,
    M01_AXI_araddr,
    M01_AXI_arready,
    M01_AXI_arvalid,
    M01_AXI_awaddr,
    M01_AXI_awready,
    M01_AXI_awvalid,
    M01_AXI_bready,
    M01_AXI_bresp,
    M01_AXI_bvalid,
    M01_AXI_rdata,
    M01_AXI_rready,
    M01_AXI_rresp,
    M01_AXI_rvalid,
    M01_AXI_wdata,
    M01_AXI_wready,
    M01_AXI_wstrb,
    M01_AXI_wvalid,
    M02_AXI_araddr,
    M02_AXI_arready,
    M02_AXI_arvalid,
    M02_AXI_awaddr,
    M02_AXI_awready,
    M02_AXI_awvalid,
    M02_AXI_bready,
    M02_AXI_bresp,
    M02_AXI_bvalid,
    M02_AXI_rdata,
    M02_AXI_rready,
    M02_AXI_rresp,
    M02_AXI_rvalid,
    M02_AXI_wdata,
    M02_AXI_wready,
    M02_AXI_wstrb,
    M02_AXI_wvalid,
    dcm_locked,
    ext_reset_in,
    peripheral_aresetn);
  input Clk;
  input [0:0]In0;
  input [0:0]In1;
  output [31:0]M01_AXI_araddr;
  input [0:0]M01_AXI_arready;
  output [0:0]M01_AXI_arvalid;
  output [31:0]M01_AXI_awaddr;
  input [0:0]M01_AXI_awready;
  output [0:0]M01_AXI_awvalid;
  output [0:0]M01_AXI_bready;
  input [1:0]M01_AXI_bresp;
  input [0:0]M01_AXI_bvalid;
  input [31:0]M01_AXI_rdata;
  output [0:0]M01_AXI_rready;
  input [1:0]M01_AXI_rresp;
  input [0:0]M01_AXI_rvalid;
  output [31:0]M01_AXI_wdata;
  input [0:0]M01_AXI_wready;
  output [3:0]M01_AXI_wstrb;
  output [0:0]M01_AXI_wvalid;
  output [31:0]M02_AXI_araddr;
  input [0:0]M02_AXI_arready;
  output [0:0]M02_AXI_arvalid;
  output [31:0]M02_AXI_awaddr;
  input [0:0]M02_AXI_awready;
  output [0:0]M02_AXI_awvalid;
  output [0:0]M02_AXI_bready;
  input [1:0]M02_AXI_bresp;
  input [0:0]M02_AXI_bvalid;
  input [31:0]M02_AXI_rdata;
  output [0:0]M02_AXI_rready;
  input [1:0]M02_AXI_rresp;
  input [0:0]M02_AXI_rvalid;
  output [31:0]M02_AXI_wdata;
  input [0:0]M02_AXI_wready;
  output [3:0]M02_AXI_wstrb;
  output [0:0]M02_AXI_wvalid;
  input dcm_locked;
  input ext_reset_in;
  output [0:0]peripheral_aresetn;

  wire [31:0]Conn1_ARADDR;
  wire [0:0]Conn1_ARREADY;
  wire [0:0]Conn1_ARVALID;
  wire [31:0]Conn1_AWADDR;
  wire [0:0]Conn1_AWREADY;
  wire [0:0]Conn1_AWVALID;
  wire [0:0]Conn1_BREADY;
  wire [1:0]Conn1_BRESP;
  wire [0:0]Conn1_BVALID;
  wire [31:0]Conn1_RDATA;
  wire [0:0]Conn1_RREADY;
  wire [1:0]Conn1_RRESP;
  wire [0:0]Conn1_RVALID;
  wire [31:0]Conn1_WDATA;
  wire [0:0]Conn1_WREADY;
  wire [3:0]Conn1_WSTRB;
  wire [0:0]Conn1_WVALID;
  wire [31:0]Conn2_ARADDR;
  wire [0:0]Conn2_ARREADY;
  wire [0:0]Conn2_ARVALID;
  wire [31:0]Conn2_AWADDR;
  wire [0:0]Conn2_AWREADY;
  wire [0:0]Conn2_AWVALID;
  wire [0:0]Conn2_BREADY;
  wire [1:0]Conn2_BRESP;
  wire [0:0]Conn2_BVALID;
  wire [31:0]Conn2_RDATA;
  wire [0:0]Conn2_RREADY;
  wire [1:0]Conn2_RRESP;
  wire [0:0]Conn2_RVALID;
  wire [31:0]Conn2_WDATA;
  wire [0:0]Conn2_WREADY;
  wire [3:0]Conn2_WSTRB;
  wire [0:0]Conn2_WVALID;
  wire [0:0]In0_1;
  wire [0:0]In1_1;
  wire clk_wiz_1_locked;
  wire mdm_1_debug_sys_rst;
  wire microblaze_0_Clk;
  wire [31:0]microblaze_0_axi_dp_ARADDR;
  wire [2:0]microblaze_0_axi_dp_ARPROT;
  wire [0:0]microblaze_0_axi_dp_ARREADY;
  wire microblaze_0_axi_dp_ARVALID;
  wire [31:0]microblaze_0_axi_dp_AWADDR;
  wire [2:0]microblaze_0_axi_dp_AWPROT;
  wire [0:0]microblaze_0_axi_dp_AWREADY;
  wire microblaze_0_axi_dp_AWVALID;
  wire microblaze_0_axi_dp_BREADY;
  wire [1:0]microblaze_0_axi_dp_BRESP;
  wire [0:0]microblaze_0_axi_dp_BVALID;
  wire [31:0]microblaze_0_axi_dp_RDATA;
  wire microblaze_0_axi_dp_RREADY;
  wire [1:0]microblaze_0_axi_dp_RRESP;
  wire [0:0]microblaze_0_axi_dp_RVALID;
  wire [31:0]microblaze_0_axi_dp_WDATA;
  wire [0:0]microblaze_0_axi_dp_WREADY;
  wire [3:0]microblaze_0_axi_dp_WSTRB;
  wire microblaze_0_axi_dp_WVALID;
  wire microblaze_0_debug_CAPTURE;
  wire microblaze_0_debug_CLK;
  wire microblaze_0_debug_DISABLE;
  wire [0:7]microblaze_0_debug_REG_EN;
  wire microblaze_0_debug_RST;
  wire microblaze_0_debug_SHIFT;
  wire microblaze_0_debug_TDI;
  wire microblaze_0_debug_TDO;
  wire microblaze_0_debug_UPDATE;
  wire [0:31]microblaze_0_dlmb_1_ABUS;
  wire microblaze_0_dlmb_1_ADDRSTROBE;
  wire [0:3]microblaze_0_dlmb_1_BE;
  wire microblaze_0_dlmb_1_CE;
  wire [0:31]microblaze_0_dlmb_1_READDBUS;
  wire microblaze_0_dlmb_1_READSTROBE;
  wire microblaze_0_dlmb_1_READY;
  wire microblaze_0_dlmb_1_UE;
  wire microblaze_0_dlmb_1_WAIT;
  wire [0:31]microblaze_0_dlmb_1_WRITEDBUS;
  wire microblaze_0_dlmb_1_WRITESTROBE;
  wire [0:31]microblaze_0_ilmb_1_ABUS;
  wire microblaze_0_ilmb_1_ADDRSTROBE;
  wire microblaze_0_ilmb_1_CE;
  wire [0:31]microblaze_0_ilmb_1_READDBUS;
  wire microblaze_0_ilmb_1_READSTROBE;
  wire microblaze_0_ilmb_1_READY;
  wire microblaze_0_ilmb_1_UE;
  wire microblaze_0_ilmb_1_WAIT;
  wire [31:0]microblaze_0_intc_axi_ARADDR;
  wire microblaze_0_intc_axi_ARREADY;
  wire [0:0]microblaze_0_intc_axi_ARVALID;
  wire [31:0]microblaze_0_intc_axi_AWADDR;
  wire microblaze_0_intc_axi_AWREADY;
  wire [0:0]microblaze_0_intc_axi_AWVALID;
  wire [0:0]microblaze_0_intc_axi_BREADY;
  wire [1:0]microblaze_0_intc_axi_BRESP;
  wire microblaze_0_intc_axi_BVALID;
  wire [31:0]microblaze_0_intc_axi_RDATA;
  wire [0:0]microblaze_0_intc_axi_RREADY;
  wire [1:0]microblaze_0_intc_axi_RRESP;
  wire microblaze_0_intc_axi_RVALID;
  wire [31:0]microblaze_0_intc_axi_WDATA;
  wire microblaze_0_intc_axi_WREADY;
  wire [3:0]microblaze_0_intc_axi_WSTRB;
  wire [0:0]microblaze_0_intc_axi_WVALID;
  wire [0:1]microblaze_0_interrupt_ACK;
  wire [31:0]microblaze_0_interrupt_ADDRESS;
  wire microblaze_0_interrupt_INTERRUPT;
  wire [1:0]microblaze_0_intr;
  wire reset_1;
  wire [0:0]rst_clk_wiz_1_100M_bus_struct_reset;
  wire [0:0]rst_clk_wiz_1_100M_interconnect_aresetn;
  wire rst_clk_wiz_1_100M_mb_reset;
  wire [0:0]rst_clk_wiz_1_100M_peripheral_aresetn;

  assign Conn1_ARREADY = M01_AXI_arready[0];
  assign Conn1_AWREADY = M01_AXI_awready[0];
  assign Conn1_BRESP = M01_AXI_bresp[1:0];
  assign Conn1_BVALID = M01_AXI_bvalid[0];
  assign Conn1_RDATA = M01_AXI_rdata[31:0];
  assign Conn1_RRESP = M01_AXI_rresp[1:0];
  assign Conn1_RVALID = M01_AXI_rvalid[0];
  assign Conn1_WREADY = M01_AXI_wready[0];
  assign Conn2_ARREADY = M02_AXI_arready[0];
  assign Conn2_AWREADY = M02_AXI_awready[0];
  assign Conn2_BRESP = M02_AXI_bresp[1:0];
  assign Conn2_BVALID = M02_AXI_bvalid[0];
  assign Conn2_RDATA = M02_AXI_rdata[31:0];
  assign Conn2_RRESP = M02_AXI_rresp[1:0];
  assign Conn2_RVALID = M02_AXI_rvalid[0];
  assign Conn2_WREADY = M02_AXI_wready[0];
  assign In0_1 = In0[0];
  assign In1_1 = In1[0];
  assign M01_AXI_araddr[31:0] = Conn1_ARADDR;
  assign M01_AXI_arvalid[0] = Conn1_ARVALID;
  assign M01_AXI_awaddr[31:0] = Conn1_AWADDR;
  assign M01_AXI_awvalid[0] = Conn1_AWVALID;
  assign M01_AXI_bready[0] = Conn1_BREADY;
  assign M01_AXI_rready[0] = Conn1_RREADY;
  assign M01_AXI_wdata[31:0] = Conn1_WDATA;
  assign M01_AXI_wstrb[3:0] = Conn1_WSTRB;
  assign M01_AXI_wvalid[0] = Conn1_WVALID;
  assign M02_AXI_araddr[31:0] = Conn2_ARADDR;
  assign M02_AXI_arvalid[0] = Conn2_ARVALID;
  assign M02_AXI_awaddr[31:0] = Conn2_AWADDR;
  assign M02_AXI_awvalid[0] = Conn2_AWVALID;
  assign M02_AXI_bready[0] = Conn2_BREADY;
  assign M02_AXI_rready[0] = Conn2_RREADY;
  assign M02_AXI_wdata[31:0] = Conn2_WDATA;
  assign M02_AXI_wstrb[3:0] = Conn2_WSTRB;
  assign M02_AXI_wvalid[0] = Conn2_WVALID;
  assign clk_wiz_1_locked = dcm_locked;
  assign microblaze_0_Clk = Clk;
  assign peripheral_aresetn[0] = rst_clk_wiz_1_100M_peripheral_aresetn;
  assign reset_1 = ext_reset_in;
  control_sub_mdm_1_0 mdm_1
       (.Dbg_Capture_0(microblaze_0_debug_CAPTURE),
        .Dbg_Clk_0(microblaze_0_debug_CLK),
        .Dbg_Disable_0(microblaze_0_debug_DISABLE),
        .Dbg_Reg_En_0(microblaze_0_debug_REG_EN),
        .Dbg_Rst_0(microblaze_0_debug_RST),
        .Dbg_Shift_0(microblaze_0_debug_SHIFT),
        .Dbg_TDI_0(microblaze_0_debug_TDI),
        .Dbg_TDO_0(microblaze_0_debug_TDO),
        .Dbg_Update_0(microblaze_0_debug_UPDATE),
        .Debug_SYS_Rst(mdm_1_debug_sys_rst));
  (* BMM_INFO_PROCESSOR = "microblaze-le > control_sub nf_mbsys/mbsys/microblaze_0_local_memory/dlmb_bram_if_cntlr" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  control_sub_microblaze_0_0 microblaze_0
       (.Byte_Enable(microblaze_0_dlmb_1_BE),
        .Clk(microblaze_0_Clk),
        .DCE(microblaze_0_dlmb_1_CE),
        .DReady(microblaze_0_dlmb_1_READY),
        .DUE(microblaze_0_dlmb_1_UE),
        .DWait(microblaze_0_dlmb_1_WAIT),
        .D_AS(microblaze_0_dlmb_1_ADDRSTROBE),
        .Data_Addr(microblaze_0_dlmb_1_ABUS),
        .Data_Read(microblaze_0_dlmb_1_READDBUS),
        .Data_Write(microblaze_0_dlmb_1_WRITEDBUS),
        .Dbg_Capture(microblaze_0_debug_CAPTURE),
        .Dbg_Clk(microblaze_0_debug_CLK),
        .Dbg_Disable(microblaze_0_debug_DISABLE),
        .Dbg_Reg_En(microblaze_0_debug_REG_EN),
        .Dbg_Shift(microblaze_0_debug_SHIFT),
        .Dbg_TDI(microblaze_0_debug_TDI),
        .Dbg_TDO(microblaze_0_debug_TDO),
        .Dbg_Update(microblaze_0_debug_UPDATE),
        .Debug_Rst(microblaze_0_debug_RST),
        .ICE(microblaze_0_ilmb_1_CE),
        .IFetch(microblaze_0_ilmb_1_READSTROBE),
        .IReady(microblaze_0_ilmb_1_READY),
        .IUE(microblaze_0_ilmb_1_UE),
        .IWAIT(microblaze_0_ilmb_1_WAIT),
        .I_AS(microblaze_0_ilmb_1_ADDRSTROBE),
        .Instr(microblaze_0_ilmb_1_READDBUS),
        .Instr_Addr(microblaze_0_ilmb_1_ABUS),
        .Interrupt(microblaze_0_interrupt_INTERRUPT),
        .Interrupt_Ack(microblaze_0_interrupt_ACK),
        .Interrupt_Address({microblaze_0_interrupt_ADDRESS[31],microblaze_0_interrupt_ADDRESS[30],microblaze_0_interrupt_ADDRESS[29],microblaze_0_interrupt_ADDRESS[28],microblaze_0_interrupt_ADDRESS[27],microblaze_0_interrupt_ADDRESS[26],microblaze_0_interrupt_ADDRESS[25],microblaze_0_interrupt_ADDRESS[24],microblaze_0_interrupt_ADDRESS[23],microblaze_0_interrupt_ADDRESS[22],microblaze_0_interrupt_ADDRESS[21],microblaze_0_interrupt_ADDRESS[20],microblaze_0_interrupt_ADDRESS[19],microblaze_0_interrupt_ADDRESS[18],microblaze_0_interrupt_ADDRESS[17],microblaze_0_interrupt_ADDRESS[16],microblaze_0_interrupt_ADDRESS[15],microblaze_0_interrupt_ADDRESS[14],microblaze_0_interrupt_ADDRESS[13],microblaze_0_interrupt_ADDRESS[12],microblaze_0_interrupt_ADDRESS[11],microblaze_0_interrupt_ADDRESS[10],microblaze_0_interrupt_ADDRESS[9],microblaze_0_interrupt_ADDRESS[8],microblaze_0_interrupt_ADDRESS[7],microblaze_0_interrupt_ADDRESS[6],microblaze_0_interrupt_ADDRESS[5],microblaze_0_interrupt_ADDRESS[4],microblaze_0_interrupt_ADDRESS[3],microblaze_0_interrupt_ADDRESS[2],microblaze_0_interrupt_ADDRESS[1],microblaze_0_interrupt_ADDRESS[0]}),
        .M_AXI_DP_ARADDR(microblaze_0_axi_dp_ARADDR),
        .M_AXI_DP_ARPROT(microblaze_0_axi_dp_ARPROT),
        .M_AXI_DP_ARREADY(microblaze_0_axi_dp_ARREADY),
        .M_AXI_DP_ARVALID(microblaze_0_axi_dp_ARVALID),
        .M_AXI_DP_AWADDR(microblaze_0_axi_dp_AWADDR),
        .M_AXI_DP_AWPROT(microblaze_0_axi_dp_AWPROT),
        .M_AXI_DP_AWREADY(microblaze_0_axi_dp_AWREADY),
        .M_AXI_DP_AWVALID(microblaze_0_axi_dp_AWVALID),
        .M_AXI_DP_BREADY(microblaze_0_axi_dp_BREADY),
        .M_AXI_DP_BRESP(microblaze_0_axi_dp_BRESP),
        .M_AXI_DP_BVALID(microblaze_0_axi_dp_BVALID),
        .M_AXI_DP_RDATA(microblaze_0_axi_dp_RDATA),
        .M_AXI_DP_RREADY(microblaze_0_axi_dp_RREADY),
        .M_AXI_DP_RRESP(microblaze_0_axi_dp_RRESP),
        .M_AXI_DP_RVALID(microblaze_0_axi_dp_RVALID),
        .M_AXI_DP_WDATA(microblaze_0_axi_dp_WDATA),
        .M_AXI_DP_WREADY(microblaze_0_axi_dp_WREADY),
        .M_AXI_DP_WSTRB(microblaze_0_axi_dp_WSTRB),
        .M_AXI_DP_WVALID(microblaze_0_axi_dp_WVALID),
        .Read_Strobe(microblaze_0_dlmb_1_READSTROBE),
        .Reset(rst_clk_wiz_1_100M_mb_reset),
        .Write_Strobe(microblaze_0_dlmb_1_WRITESTROBE));
  control_sub_microblaze_0_axi_intc_0 microblaze_0_axi_intc
       (.interrupt_address(microblaze_0_interrupt_ADDRESS),
        .intr(microblaze_0_intr),
        .irq(microblaze_0_interrupt_INTERRUPT),
        .processor_ack({microblaze_0_interrupt_ACK[0],microblaze_0_interrupt_ACK[1]}),
        .processor_clk(microblaze_0_Clk),
        .processor_rst(rst_clk_wiz_1_100M_mb_reset),
        .s_axi_aclk(microblaze_0_Clk),
        .s_axi_araddr(microblaze_0_intc_axi_ARADDR[8:0]),
        .s_axi_aresetn(rst_clk_wiz_1_100M_peripheral_aresetn),
        .s_axi_arready(microblaze_0_intc_axi_ARREADY),
        .s_axi_arvalid(microblaze_0_intc_axi_ARVALID),
        .s_axi_awaddr(microblaze_0_intc_axi_AWADDR[8:0]),
        .s_axi_awready(microblaze_0_intc_axi_AWREADY),
        .s_axi_awvalid(microblaze_0_intc_axi_AWVALID),
        .s_axi_bready(microblaze_0_intc_axi_BREADY),
        .s_axi_bresp(microblaze_0_intc_axi_BRESP),
        .s_axi_bvalid(microblaze_0_intc_axi_BVALID),
        .s_axi_rdata(microblaze_0_intc_axi_RDATA),
        .s_axi_rready(microblaze_0_intc_axi_RREADY),
        .s_axi_rresp(microblaze_0_intc_axi_RRESP),
        .s_axi_rvalid(microblaze_0_intc_axi_RVALID),
        .s_axi_wdata(microblaze_0_intc_axi_WDATA),
        .s_axi_wready(microblaze_0_intc_axi_WREADY),
        .s_axi_wstrb(microblaze_0_intc_axi_WSTRB),
        .s_axi_wvalid(microblaze_0_intc_axi_WVALID));
  control_sub_microblaze_0_axi_periph_0 microblaze_0_axi_periph
       (.ACLK(microblaze_0_Clk),
        .ARESETN(rst_clk_wiz_1_100M_interconnect_aresetn),
        .M00_ACLK(microblaze_0_Clk),
        .M00_ARESETN(rst_clk_wiz_1_100M_peripheral_aresetn),
        .M00_AXI_araddr(microblaze_0_intc_axi_ARADDR),
        .M00_AXI_arready(microblaze_0_intc_axi_ARREADY),
        .M00_AXI_arvalid(microblaze_0_intc_axi_ARVALID),
        .M00_AXI_awaddr(microblaze_0_intc_axi_AWADDR),
        .M00_AXI_awready(microblaze_0_intc_axi_AWREADY),
        .M00_AXI_awvalid(microblaze_0_intc_axi_AWVALID),
        .M00_AXI_bready(microblaze_0_intc_axi_BREADY),
        .M00_AXI_bresp(microblaze_0_intc_axi_BRESP),
        .M00_AXI_bvalid(microblaze_0_intc_axi_BVALID),
        .M00_AXI_rdata(microblaze_0_intc_axi_RDATA),
        .M00_AXI_rready(microblaze_0_intc_axi_RREADY),
        .M00_AXI_rresp(microblaze_0_intc_axi_RRESP),
        .M00_AXI_rvalid(microblaze_0_intc_axi_RVALID),
        .M00_AXI_wdata(microblaze_0_intc_axi_WDATA),
        .M00_AXI_wready(microblaze_0_intc_axi_WREADY),
        .M00_AXI_wstrb(microblaze_0_intc_axi_WSTRB),
        .M00_AXI_wvalid(microblaze_0_intc_axi_WVALID),
        .M01_ACLK(microblaze_0_Clk),
        .M01_ARESETN(rst_clk_wiz_1_100M_peripheral_aresetn),
        .M01_AXI_araddr(Conn1_ARADDR),
        .M01_AXI_arready(Conn1_ARREADY),
        .M01_AXI_arvalid(Conn1_ARVALID),
        .M01_AXI_awaddr(Conn1_AWADDR),
        .M01_AXI_awready(Conn1_AWREADY),
        .M01_AXI_awvalid(Conn1_AWVALID),
        .M01_AXI_bready(Conn1_BREADY),
        .M01_AXI_bresp(Conn1_BRESP),
        .M01_AXI_bvalid(Conn1_BVALID),
        .M01_AXI_rdata(Conn1_RDATA),
        .M01_AXI_rready(Conn1_RREADY),
        .M01_AXI_rresp(Conn1_RRESP),
        .M01_AXI_rvalid(Conn1_RVALID),
        .M01_AXI_wdata(Conn1_WDATA),
        .M01_AXI_wready(Conn1_WREADY),
        .M01_AXI_wstrb(Conn1_WSTRB),
        .M01_AXI_wvalid(Conn1_WVALID),
        .M02_ACLK(microblaze_0_Clk),
        .M02_ARESETN(rst_clk_wiz_1_100M_peripheral_aresetn),
        .M02_AXI_araddr(Conn2_ARADDR),
        .M02_AXI_arready(Conn2_ARREADY),
        .M02_AXI_arvalid(Conn2_ARVALID),
        .M02_AXI_awaddr(Conn2_AWADDR),
        .M02_AXI_awready(Conn2_AWREADY),
        .M02_AXI_awvalid(Conn2_AWVALID),
        .M02_AXI_bready(Conn2_BREADY),
        .M02_AXI_bresp(Conn2_BRESP),
        .M02_AXI_bvalid(Conn2_BVALID),
        .M02_AXI_rdata(Conn2_RDATA),
        .M02_AXI_rready(Conn2_RREADY),
        .M02_AXI_rresp(Conn2_RRESP),
        .M02_AXI_rvalid(Conn2_RVALID),
        .M02_AXI_wdata(Conn2_WDATA),
        .M02_AXI_wready(Conn2_WREADY),
        .M02_AXI_wstrb(Conn2_WSTRB),
        .M02_AXI_wvalid(Conn2_WVALID),
        .S00_ACLK(microblaze_0_Clk),
        .S00_ARESETN(rst_clk_wiz_1_100M_peripheral_aresetn),
        .S00_AXI_araddr(microblaze_0_axi_dp_ARADDR),
        .S00_AXI_arprot(microblaze_0_axi_dp_ARPROT),
        .S00_AXI_arready(microblaze_0_axi_dp_ARREADY),
        .S00_AXI_arvalid(microblaze_0_axi_dp_ARVALID),
        .S00_AXI_awaddr(microblaze_0_axi_dp_AWADDR),
        .S00_AXI_awprot(microblaze_0_axi_dp_AWPROT),
        .S00_AXI_awready(microblaze_0_axi_dp_AWREADY),
        .S00_AXI_awvalid(microblaze_0_axi_dp_AWVALID),
        .S00_AXI_bready(microblaze_0_axi_dp_BREADY),
        .S00_AXI_bresp(microblaze_0_axi_dp_BRESP),
        .S00_AXI_bvalid(microblaze_0_axi_dp_BVALID),
        .S00_AXI_rdata(microblaze_0_axi_dp_RDATA),
        .S00_AXI_rready(microblaze_0_axi_dp_RREADY),
        .S00_AXI_rresp(microblaze_0_axi_dp_RRESP),
        .S00_AXI_rvalid(microblaze_0_axi_dp_RVALID),
        .S00_AXI_wdata(microblaze_0_axi_dp_WDATA),
        .S00_AXI_wready(microblaze_0_axi_dp_WREADY),
        .S00_AXI_wstrb(microblaze_0_axi_dp_WSTRB),
        .S00_AXI_wvalid(microblaze_0_axi_dp_WVALID));
  microblaze_0_local_memory_imp_106435D microblaze_0_local_memory
       (.DLMB_abus(microblaze_0_dlmb_1_ABUS),
        .DLMB_addrstrobe(microblaze_0_dlmb_1_ADDRSTROBE),
        .DLMB_be(microblaze_0_dlmb_1_BE),
        .DLMB_ce(microblaze_0_dlmb_1_CE),
        .DLMB_readdbus(microblaze_0_dlmb_1_READDBUS),
        .DLMB_readstrobe(microblaze_0_dlmb_1_READSTROBE),
        .DLMB_ready(microblaze_0_dlmb_1_READY),
        .DLMB_ue(microblaze_0_dlmb_1_UE),
        .DLMB_wait(microblaze_0_dlmb_1_WAIT),
        .DLMB_writedbus(microblaze_0_dlmb_1_WRITEDBUS),
        .DLMB_writestrobe(microblaze_0_dlmb_1_WRITESTROBE),
        .ILMB_abus(microblaze_0_ilmb_1_ABUS),
        .ILMB_addrstrobe(microblaze_0_ilmb_1_ADDRSTROBE),
        .ILMB_ce(microblaze_0_ilmb_1_CE),
        .ILMB_readdbus(microblaze_0_ilmb_1_READDBUS),
        .ILMB_readstrobe(microblaze_0_ilmb_1_READSTROBE),
        .ILMB_ready(microblaze_0_ilmb_1_READY),
        .ILMB_ue(microblaze_0_ilmb_1_UE),
        .ILMB_wait(microblaze_0_ilmb_1_WAIT),
        .LMB_Clk(microblaze_0_Clk),
        .LMB_Rst(rst_clk_wiz_1_100M_bus_struct_reset));
  control_sub_microblaze_0_xlconcat_0 microblaze_0_xlconcat
       (.In0(In0_1),
        .In1(In1_1),
        .dout(microblaze_0_intr));
  control_sub_rst_clk_wiz_1_100M_0 rst_clk_wiz_1_100M
       (.aux_reset_in(1'b1),
        .bus_struct_reset(rst_clk_wiz_1_100M_bus_struct_reset),
        .dcm_locked(clk_wiz_1_locked),
        .ext_reset_in(reset_1),
        .interconnect_aresetn(rst_clk_wiz_1_100M_interconnect_aresetn),
        .mb_debug_sys_rst(mdm_1_debug_sys_rst),
        .mb_reset(rst_clk_wiz_1_100M_mb_reset),
        .peripheral_aresetn(rst_clk_wiz_1_100M_peripheral_aresetn),
        .slowest_sync_clk(microblaze_0_Clk));
endmodule

module microblaze_0_local_memory_imp_106435D
   (DLMB_abus,
    DLMB_addrstrobe,
    DLMB_be,
    DLMB_ce,
    DLMB_readdbus,
    DLMB_readstrobe,
    DLMB_ready,
    DLMB_ue,
    DLMB_wait,
    DLMB_writedbus,
    DLMB_writestrobe,
    ILMB_abus,
    ILMB_addrstrobe,
    ILMB_ce,
    ILMB_readdbus,
    ILMB_readstrobe,
    ILMB_ready,
    ILMB_ue,
    ILMB_wait,
    LMB_Clk,
    LMB_Rst);
  input [0:31]DLMB_abus;
  input DLMB_addrstrobe;
  input [0:3]DLMB_be;
  output DLMB_ce;
  output [0:31]DLMB_readdbus;
  input DLMB_readstrobe;
  output DLMB_ready;
  output DLMB_ue;
  output DLMB_wait;
  input [0:31]DLMB_writedbus;
  input DLMB_writestrobe;
  input [0:31]ILMB_abus;
  input ILMB_addrstrobe;
  output ILMB_ce;
  output [0:31]ILMB_readdbus;
  input ILMB_readstrobe;
  output ILMB_ready;
  output ILMB_ue;
  output ILMB_wait;
  input LMB_Clk;
  input [0:0]LMB_Rst;

  wire microblaze_0_Clk;
  wire [0:0]microblaze_0_LMB_Rst;
  wire [0:31]microblaze_0_dlmb_ABUS;
  wire microblaze_0_dlmb_ADDRSTROBE;
  wire [0:3]microblaze_0_dlmb_BE;
  wire microblaze_0_dlmb_CE;
  wire [0:31]microblaze_0_dlmb_READDBUS;
  wire microblaze_0_dlmb_READSTROBE;
  wire microblaze_0_dlmb_READY;
  wire microblaze_0_dlmb_UE;
  wire microblaze_0_dlmb_WAIT;
  wire [0:31]microblaze_0_dlmb_WRITEDBUS;
  wire microblaze_0_dlmb_WRITESTROBE;
  wire [0:31]microblaze_0_dlmb_bus_ABUS;
  wire microblaze_0_dlmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_0_dlmb_bus_BE;
  wire microblaze_0_dlmb_bus_CE;
  wire [0:31]microblaze_0_dlmb_bus_READDBUS;
  wire microblaze_0_dlmb_bus_READSTROBE;
  wire microblaze_0_dlmb_bus_READY;
  wire microblaze_0_dlmb_bus_UE;
  wire microblaze_0_dlmb_bus_WAIT;
  wire [0:31]microblaze_0_dlmb_bus_WRITEDBUS;
  wire microblaze_0_dlmb_bus_WRITESTROBE;
  wire [0:31]microblaze_0_dlmb_cntlr_ADDR;
  wire microblaze_0_dlmb_cntlr_CLK;
  wire [0:31]microblaze_0_dlmb_cntlr_DIN;
  wire [31:0]microblaze_0_dlmb_cntlr_DOUT;
  wire microblaze_0_dlmb_cntlr_EN;
  wire microblaze_0_dlmb_cntlr_RST;
  wire [0:3]microblaze_0_dlmb_cntlr_WE;
  wire [0:31]microblaze_0_ilmb_ABUS;
  wire microblaze_0_ilmb_ADDRSTROBE;
  wire microblaze_0_ilmb_CE;
  wire [0:31]microblaze_0_ilmb_READDBUS;
  wire microblaze_0_ilmb_READSTROBE;
  wire microblaze_0_ilmb_READY;
  wire microblaze_0_ilmb_UE;
  wire microblaze_0_ilmb_WAIT;
  wire [0:31]microblaze_0_ilmb_bus_ABUS;
  wire microblaze_0_ilmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_0_ilmb_bus_BE;
  wire microblaze_0_ilmb_bus_CE;
  wire [0:31]microblaze_0_ilmb_bus_READDBUS;
  wire microblaze_0_ilmb_bus_READSTROBE;
  wire microblaze_0_ilmb_bus_READY;
  wire microblaze_0_ilmb_bus_UE;
  wire microblaze_0_ilmb_bus_WAIT;
  wire [0:31]microblaze_0_ilmb_bus_WRITEDBUS;
  wire microblaze_0_ilmb_bus_WRITESTROBE;
  wire [0:31]microblaze_0_ilmb_cntlr_ADDR;
  wire microblaze_0_ilmb_cntlr_CLK;
  wire [0:31]microblaze_0_ilmb_cntlr_DIN;
  wire [31:0]microblaze_0_ilmb_cntlr_DOUT;
  wire microblaze_0_ilmb_cntlr_EN;
  wire microblaze_0_ilmb_cntlr_RST;
  wire [0:3]microblaze_0_ilmb_cntlr_WE;

  assign DLMB_ce = microblaze_0_dlmb_CE;
  assign DLMB_readdbus[0:31] = microblaze_0_dlmb_READDBUS;
  assign DLMB_ready = microblaze_0_dlmb_READY;
  assign DLMB_ue = microblaze_0_dlmb_UE;
  assign DLMB_wait = microblaze_0_dlmb_WAIT;
  assign ILMB_ce = microblaze_0_ilmb_CE;
  assign ILMB_readdbus[0:31] = microblaze_0_ilmb_READDBUS;
  assign ILMB_ready = microblaze_0_ilmb_READY;
  assign ILMB_ue = microblaze_0_ilmb_UE;
  assign ILMB_wait = microblaze_0_ilmb_WAIT;
  assign microblaze_0_Clk = LMB_Clk;
  assign microblaze_0_LMB_Rst = LMB_Rst[0];
  assign microblaze_0_dlmb_ABUS = DLMB_abus[0:31];
  assign microblaze_0_dlmb_ADDRSTROBE = DLMB_addrstrobe;
  assign microblaze_0_dlmb_BE = DLMB_be[0:3];
  assign microblaze_0_dlmb_READSTROBE = DLMB_readstrobe;
  assign microblaze_0_dlmb_WRITEDBUS = DLMB_writedbus[0:31];
  assign microblaze_0_dlmb_WRITESTROBE = DLMB_writestrobe;
  assign microblaze_0_ilmb_ABUS = ILMB_abus[0:31];
  assign microblaze_0_ilmb_ADDRSTROBE = ILMB_addrstrobe;
  assign microblaze_0_ilmb_READSTROBE = ILMB_readstrobe;
  (* BMM_INFO_ADDRESS_SPACE = "byte  0x00000000 32 > control_sub nf_mbsys/mbsys/microblaze_0_local_memory/lmb_bram" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  control_sub_dlmb_bram_if_cntlr_0 dlmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_0_dlmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_0_dlmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_0_dlmb_cntlr_DOUT[31],microblaze_0_dlmb_cntlr_DOUT[30],microblaze_0_dlmb_cntlr_DOUT[29],microblaze_0_dlmb_cntlr_DOUT[28],microblaze_0_dlmb_cntlr_DOUT[27],microblaze_0_dlmb_cntlr_DOUT[26],microblaze_0_dlmb_cntlr_DOUT[25],microblaze_0_dlmb_cntlr_DOUT[24],microblaze_0_dlmb_cntlr_DOUT[23],microblaze_0_dlmb_cntlr_DOUT[22],microblaze_0_dlmb_cntlr_DOUT[21],microblaze_0_dlmb_cntlr_DOUT[20],microblaze_0_dlmb_cntlr_DOUT[19],microblaze_0_dlmb_cntlr_DOUT[18],microblaze_0_dlmb_cntlr_DOUT[17],microblaze_0_dlmb_cntlr_DOUT[16],microblaze_0_dlmb_cntlr_DOUT[15],microblaze_0_dlmb_cntlr_DOUT[14],microblaze_0_dlmb_cntlr_DOUT[13],microblaze_0_dlmb_cntlr_DOUT[12],microblaze_0_dlmb_cntlr_DOUT[11],microblaze_0_dlmb_cntlr_DOUT[10],microblaze_0_dlmb_cntlr_DOUT[9],microblaze_0_dlmb_cntlr_DOUT[8],microblaze_0_dlmb_cntlr_DOUT[7],microblaze_0_dlmb_cntlr_DOUT[6],microblaze_0_dlmb_cntlr_DOUT[5],microblaze_0_dlmb_cntlr_DOUT[4],microblaze_0_dlmb_cntlr_DOUT[3],microblaze_0_dlmb_cntlr_DOUT[2],microblaze_0_dlmb_cntlr_DOUT[1],microblaze_0_dlmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_0_dlmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_0_dlmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_0_dlmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_0_dlmb_cntlr_WE),
        .LMB_ABus(microblaze_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_dlmb_bus_BE),
        .LMB_Clk(microblaze_0_Clk),
        .LMB_ReadStrobe(microblaze_0_dlmb_bus_READSTROBE),
        .LMB_Rst(microblaze_0_LMB_Rst),
        .LMB_WriteDBus(microblaze_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_dlmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_dlmb_bus_READY),
        .Sl_UE(microblaze_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_0_dlmb_bus_WAIT));
  control_sub_dlmb_v10_0 dlmb_v10
       (.LMB_ABus(microblaze_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_dlmb_bus_BE),
        .LMB_CE(microblaze_0_dlmb_CE),
        .LMB_Clk(microblaze_0_Clk),
        .LMB_ReadDBus(microblaze_0_dlmb_READDBUS),
        .LMB_ReadStrobe(microblaze_0_dlmb_bus_READSTROBE),
        .LMB_Ready(microblaze_0_dlmb_READY),
        .LMB_UE(microblaze_0_dlmb_UE),
        .LMB_Wait(microblaze_0_dlmb_WAIT),
        .LMB_WriteDBus(microblaze_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_dlmb_bus_WRITESTROBE),
        .M_ABus(microblaze_0_dlmb_ABUS),
        .M_AddrStrobe(microblaze_0_dlmb_ADDRSTROBE),
        .M_BE(microblaze_0_dlmb_BE),
        .M_DBus(microblaze_0_dlmb_WRITEDBUS),
        .M_ReadStrobe(microblaze_0_dlmb_READSTROBE),
        .M_WriteStrobe(microblaze_0_dlmb_WRITESTROBE),
        .SYS_Rst(microblaze_0_LMB_Rst),
        .Sl_CE(microblaze_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_dlmb_bus_READY),
        .Sl_UE(microblaze_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_0_dlmb_bus_WAIT));
  control_sub_ilmb_bram_if_cntlr_0 ilmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_0_ilmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_0_ilmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_0_ilmb_cntlr_DOUT[31],microblaze_0_ilmb_cntlr_DOUT[30],microblaze_0_ilmb_cntlr_DOUT[29],microblaze_0_ilmb_cntlr_DOUT[28],microblaze_0_ilmb_cntlr_DOUT[27],microblaze_0_ilmb_cntlr_DOUT[26],microblaze_0_ilmb_cntlr_DOUT[25],microblaze_0_ilmb_cntlr_DOUT[24],microblaze_0_ilmb_cntlr_DOUT[23],microblaze_0_ilmb_cntlr_DOUT[22],microblaze_0_ilmb_cntlr_DOUT[21],microblaze_0_ilmb_cntlr_DOUT[20],microblaze_0_ilmb_cntlr_DOUT[19],microblaze_0_ilmb_cntlr_DOUT[18],microblaze_0_ilmb_cntlr_DOUT[17],microblaze_0_ilmb_cntlr_DOUT[16],microblaze_0_ilmb_cntlr_DOUT[15],microblaze_0_ilmb_cntlr_DOUT[14],microblaze_0_ilmb_cntlr_DOUT[13],microblaze_0_ilmb_cntlr_DOUT[12],microblaze_0_ilmb_cntlr_DOUT[11],microblaze_0_ilmb_cntlr_DOUT[10],microblaze_0_ilmb_cntlr_DOUT[9],microblaze_0_ilmb_cntlr_DOUT[8],microblaze_0_ilmb_cntlr_DOUT[7],microblaze_0_ilmb_cntlr_DOUT[6],microblaze_0_ilmb_cntlr_DOUT[5],microblaze_0_ilmb_cntlr_DOUT[4],microblaze_0_ilmb_cntlr_DOUT[3],microblaze_0_ilmb_cntlr_DOUT[2],microblaze_0_ilmb_cntlr_DOUT[1],microblaze_0_ilmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_0_ilmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_0_ilmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_0_ilmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_0_ilmb_cntlr_WE),
        .LMB_ABus(microblaze_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_ilmb_bus_BE),
        .LMB_Clk(microblaze_0_Clk),
        .LMB_ReadStrobe(microblaze_0_ilmb_bus_READSTROBE),
        .LMB_Rst(microblaze_0_LMB_Rst),
        .LMB_WriteDBus(microblaze_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_ilmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_ilmb_bus_READY),
        .Sl_UE(microblaze_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_0_ilmb_bus_WAIT));
  control_sub_ilmb_v10_0 ilmb_v10
       (.LMB_ABus(microblaze_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_ilmb_bus_BE),
        .LMB_CE(microblaze_0_ilmb_CE),
        .LMB_Clk(microblaze_0_Clk),
        .LMB_ReadDBus(microblaze_0_ilmb_READDBUS),
        .LMB_ReadStrobe(microblaze_0_ilmb_bus_READSTROBE),
        .LMB_Ready(microblaze_0_ilmb_READY),
        .LMB_UE(microblaze_0_ilmb_UE),
        .LMB_Wait(microblaze_0_ilmb_WAIT),
        .LMB_WriteDBus(microblaze_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_ilmb_bus_WRITESTROBE),
        .M_ABus(microblaze_0_ilmb_ABUS),
        .M_AddrStrobe(microblaze_0_ilmb_ADDRSTROBE),
        .M_BE({1'b0,1'b0,1'b0,1'b0}),
        .M_DBus({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_ReadStrobe(microblaze_0_ilmb_READSTROBE),
        .M_WriteStrobe(1'b0),
        .SYS_Rst(microblaze_0_LMB_Rst),
        .Sl_CE(microblaze_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_ilmb_bus_READY),
        .Sl_UE(microblaze_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_0_ilmb_bus_WAIT));
  control_sub_lmb_bram_0 lmb_bram
       (.addra({microblaze_0_dlmb_cntlr_ADDR[0],microblaze_0_dlmb_cntlr_ADDR[1],microblaze_0_dlmb_cntlr_ADDR[2],microblaze_0_dlmb_cntlr_ADDR[3],microblaze_0_dlmb_cntlr_ADDR[4],microblaze_0_dlmb_cntlr_ADDR[5],microblaze_0_dlmb_cntlr_ADDR[6],microblaze_0_dlmb_cntlr_ADDR[7],microblaze_0_dlmb_cntlr_ADDR[8],microblaze_0_dlmb_cntlr_ADDR[9],microblaze_0_dlmb_cntlr_ADDR[10],microblaze_0_dlmb_cntlr_ADDR[11],microblaze_0_dlmb_cntlr_ADDR[12],microblaze_0_dlmb_cntlr_ADDR[13],microblaze_0_dlmb_cntlr_ADDR[14],microblaze_0_dlmb_cntlr_ADDR[15],microblaze_0_dlmb_cntlr_ADDR[16],microblaze_0_dlmb_cntlr_ADDR[17],microblaze_0_dlmb_cntlr_ADDR[18],microblaze_0_dlmb_cntlr_ADDR[19],microblaze_0_dlmb_cntlr_ADDR[20],microblaze_0_dlmb_cntlr_ADDR[21],microblaze_0_dlmb_cntlr_ADDR[22],microblaze_0_dlmb_cntlr_ADDR[23],microblaze_0_dlmb_cntlr_ADDR[24],microblaze_0_dlmb_cntlr_ADDR[25],microblaze_0_dlmb_cntlr_ADDR[26],microblaze_0_dlmb_cntlr_ADDR[27],microblaze_0_dlmb_cntlr_ADDR[28],microblaze_0_dlmb_cntlr_ADDR[29],microblaze_0_dlmb_cntlr_ADDR[30],microblaze_0_dlmb_cntlr_ADDR[31]}),
        .addrb({microblaze_0_ilmb_cntlr_ADDR[0],microblaze_0_ilmb_cntlr_ADDR[1],microblaze_0_ilmb_cntlr_ADDR[2],microblaze_0_ilmb_cntlr_ADDR[3],microblaze_0_ilmb_cntlr_ADDR[4],microblaze_0_ilmb_cntlr_ADDR[5],microblaze_0_ilmb_cntlr_ADDR[6],microblaze_0_ilmb_cntlr_ADDR[7],microblaze_0_ilmb_cntlr_ADDR[8],microblaze_0_ilmb_cntlr_ADDR[9],microblaze_0_ilmb_cntlr_ADDR[10],microblaze_0_ilmb_cntlr_ADDR[11],microblaze_0_ilmb_cntlr_ADDR[12],microblaze_0_ilmb_cntlr_ADDR[13],microblaze_0_ilmb_cntlr_ADDR[14],microblaze_0_ilmb_cntlr_ADDR[15],microblaze_0_ilmb_cntlr_ADDR[16],microblaze_0_ilmb_cntlr_ADDR[17],microblaze_0_ilmb_cntlr_ADDR[18],microblaze_0_ilmb_cntlr_ADDR[19],microblaze_0_ilmb_cntlr_ADDR[20],microblaze_0_ilmb_cntlr_ADDR[21],microblaze_0_ilmb_cntlr_ADDR[22],microblaze_0_ilmb_cntlr_ADDR[23],microblaze_0_ilmb_cntlr_ADDR[24],microblaze_0_ilmb_cntlr_ADDR[25],microblaze_0_ilmb_cntlr_ADDR[26],microblaze_0_ilmb_cntlr_ADDR[27],microblaze_0_ilmb_cntlr_ADDR[28],microblaze_0_ilmb_cntlr_ADDR[29],microblaze_0_ilmb_cntlr_ADDR[30],microblaze_0_ilmb_cntlr_ADDR[31]}),
        .clka(microblaze_0_dlmb_cntlr_CLK),
        .clkb(microblaze_0_ilmb_cntlr_CLK),
        .dina({microblaze_0_dlmb_cntlr_DIN[0],microblaze_0_dlmb_cntlr_DIN[1],microblaze_0_dlmb_cntlr_DIN[2],microblaze_0_dlmb_cntlr_DIN[3],microblaze_0_dlmb_cntlr_DIN[4],microblaze_0_dlmb_cntlr_DIN[5],microblaze_0_dlmb_cntlr_DIN[6],microblaze_0_dlmb_cntlr_DIN[7],microblaze_0_dlmb_cntlr_DIN[8],microblaze_0_dlmb_cntlr_DIN[9],microblaze_0_dlmb_cntlr_DIN[10],microblaze_0_dlmb_cntlr_DIN[11],microblaze_0_dlmb_cntlr_DIN[12],microblaze_0_dlmb_cntlr_DIN[13],microblaze_0_dlmb_cntlr_DIN[14],microblaze_0_dlmb_cntlr_DIN[15],microblaze_0_dlmb_cntlr_DIN[16],microblaze_0_dlmb_cntlr_DIN[17],microblaze_0_dlmb_cntlr_DIN[18],microblaze_0_dlmb_cntlr_DIN[19],microblaze_0_dlmb_cntlr_DIN[20],microblaze_0_dlmb_cntlr_DIN[21],microblaze_0_dlmb_cntlr_DIN[22],microblaze_0_dlmb_cntlr_DIN[23],microblaze_0_dlmb_cntlr_DIN[24],microblaze_0_dlmb_cntlr_DIN[25],microblaze_0_dlmb_cntlr_DIN[26],microblaze_0_dlmb_cntlr_DIN[27],microblaze_0_dlmb_cntlr_DIN[28],microblaze_0_dlmb_cntlr_DIN[29],microblaze_0_dlmb_cntlr_DIN[30],microblaze_0_dlmb_cntlr_DIN[31]}),
        .dinb({microblaze_0_ilmb_cntlr_DIN[0],microblaze_0_ilmb_cntlr_DIN[1],microblaze_0_ilmb_cntlr_DIN[2],microblaze_0_ilmb_cntlr_DIN[3],microblaze_0_ilmb_cntlr_DIN[4],microblaze_0_ilmb_cntlr_DIN[5],microblaze_0_ilmb_cntlr_DIN[6],microblaze_0_ilmb_cntlr_DIN[7],microblaze_0_ilmb_cntlr_DIN[8],microblaze_0_ilmb_cntlr_DIN[9],microblaze_0_ilmb_cntlr_DIN[10],microblaze_0_ilmb_cntlr_DIN[11],microblaze_0_ilmb_cntlr_DIN[12],microblaze_0_ilmb_cntlr_DIN[13],microblaze_0_ilmb_cntlr_DIN[14],microblaze_0_ilmb_cntlr_DIN[15],microblaze_0_ilmb_cntlr_DIN[16],microblaze_0_ilmb_cntlr_DIN[17],microblaze_0_ilmb_cntlr_DIN[18],microblaze_0_ilmb_cntlr_DIN[19],microblaze_0_ilmb_cntlr_DIN[20],microblaze_0_ilmb_cntlr_DIN[21],microblaze_0_ilmb_cntlr_DIN[22],microblaze_0_ilmb_cntlr_DIN[23],microblaze_0_ilmb_cntlr_DIN[24],microblaze_0_ilmb_cntlr_DIN[25],microblaze_0_ilmb_cntlr_DIN[26],microblaze_0_ilmb_cntlr_DIN[27],microblaze_0_ilmb_cntlr_DIN[28],microblaze_0_ilmb_cntlr_DIN[29],microblaze_0_ilmb_cntlr_DIN[30],microblaze_0_ilmb_cntlr_DIN[31]}),
        .douta(microblaze_0_dlmb_cntlr_DOUT),
        .doutb(microblaze_0_ilmb_cntlr_DOUT),
        .ena(microblaze_0_dlmb_cntlr_EN),
        .enb(microblaze_0_ilmb_cntlr_EN),
        .rsta(microblaze_0_dlmb_cntlr_RST),
        .rstb(microblaze_0_ilmb_cntlr_RST),
        .wea({microblaze_0_dlmb_cntlr_WE[0],microblaze_0_dlmb_cntlr_WE[1],microblaze_0_dlmb_cntlr_WE[2],microblaze_0_dlmb_cntlr_WE[3]}),
        .web({microblaze_0_ilmb_cntlr_WE[0],microblaze_0_ilmb_cntlr_WE[1],microblaze_0_ilmb_cntlr_WE[2],microblaze_0_ilmb_cntlr_WE[3]}));
endmodule

module nf_mbsys_imp_UPW3WD
   (iic_fpga_scl_i,
    iic_fpga_scl_o,
    iic_fpga_scl_t,
    iic_fpga_sda_i,
    iic_fpga_sda_o,
    iic_fpga_sda_t,
    iic_reset,
    reset,
    sysclk,
    uart_rxd,
    uart_txd);
  input iic_fpga_scl_i;
  output iic_fpga_scl_o;
  output iic_fpga_scl_t;
  input iic_fpga_sda_i;
  output iic_fpga_sda_o;
  output iic_fpga_sda_t;
  output [1:0]iic_reset;
  input reset;
  input sysclk;
  input uart_rxd;
  output uart_txd;

  wire axi_iic_0_IIC_SCL_I;
  wire axi_iic_0_IIC_SCL_O;
  wire axi_iic_0_IIC_SCL_T;
  wire axi_iic_0_IIC_SDA_I;
  wire axi_iic_0_IIC_SDA_O;
  wire axi_iic_0_IIC_SDA_T;
  wire [1:0]axi_iic_0_gpo;
  wire axi_iic_0_iic2intc_irpt;
  wire axi_uartlite_0_UART_RxD;
  wire axi_uartlite_0_UART_TxD;
  wire axi_uartlite_0_interrupt;
  wire clk_wiz_1_locked;
  wire [31:0]mbsys_M01_AXI_ARADDR;
  wire mbsys_M01_AXI_ARREADY;
  wire [0:0]mbsys_M01_AXI_ARVALID;
  wire [31:0]mbsys_M01_AXI_AWADDR;
  wire mbsys_M01_AXI_AWREADY;
  wire [0:0]mbsys_M01_AXI_AWVALID;
  wire [0:0]mbsys_M01_AXI_BREADY;
  wire [1:0]mbsys_M01_AXI_BRESP;
  wire mbsys_M01_AXI_BVALID;
  wire [31:0]mbsys_M01_AXI_RDATA;
  wire [0:0]mbsys_M01_AXI_RREADY;
  wire [1:0]mbsys_M01_AXI_RRESP;
  wire mbsys_M01_AXI_RVALID;
  wire [31:0]mbsys_M01_AXI_WDATA;
  wire mbsys_M01_AXI_WREADY;
  wire [3:0]mbsys_M01_AXI_WSTRB;
  wire [0:0]mbsys_M01_AXI_WVALID;
  wire [31:0]mbsys_M02_AXI_ARADDR;
  wire mbsys_M02_AXI_ARREADY;
  wire [0:0]mbsys_M02_AXI_ARVALID;
  wire [31:0]mbsys_M02_AXI_AWADDR;
  wire mbsys_M02_AXI_AWREADY;
  wire [0:0]mbsys_M02_AXI_AWVALID;
  wire [0:0]mbsys_M02_AXI_BREADY;
  wire [1:0]mbsys_M02_AXI_BRESP;
  wire mbsys_M02_AXI_BVALID;
  wire [31:0]mbsys_M02_AXI_RDATA;
  wire [0:0]mbsys_M02_AXI_RREADY;
  wire [1:0]mbsys_M02_AXI_RRESP;
  wire mbsys_M02_AXI_RVALID;
  wire [31:0]mbsys_M02_AXI_WDATA;
  wire mbsys_M02_AXI_WREADY;
  wire [3:0]mbsys_M02_AXI_WSTRB;
  wire [0:0]mbsys_M02_AXI_WVALID;
  wire [0:0]mbsys_peripheral_aresetn;
  wire microblaze_0_Clk;
  wire reset_1;
  wire sysclk_1;

  assign axi_iic_0_IIC_SCL_I = iic_fpga_scl_i;
  assign axi_iic_0_IIC_SDA_I = iic_fpga_sda_i;
  assign axi_uartlite_0_UART_RxD = uart_rxd;
  assign iic_fpga_scl_o = axi_iic_0_IIC_SCL_O;
  assign iic_fpga_scl_t = axi_iic_0_IIC_SCL_T;
  assign iic_fpga_sda_o = axi_iic_0_IIC_SDA_O;
  assign iic_fpga_sda_t = axi_iic_0_IIC_SDA_T;
  assign iic_reset[1:0] = axi_iic_0_gpo;
  assign reset_1 = reset;
  assign sysclk_1 = sysclk;
  assign uart_txd = axi_uartlite_0_UART_TxD;
  control_sub_axi_iic_0_0 axi_iic_0
       (.gpo(axi_iic_0_gpo),
        .iic2intc_irpt(axi_iic_0_iic2intc_irpt),
        .s_axi_aclk(microblaze_0_Clk),
        .s_axi_araddr(mbsys_M01_AXI_ARADDR[8:0]),
        .s_axi_aresetn(mbsys_peripheral_aresetn),
        .s_axi_arready(mbsys_M01_AXI_ARREADY),
        .s_axi_arvalid(mbsys_M01_AXI_ARVALID),
        .s_axi_awaddr(mbsys_M01_AXI_AWADDR[8:0]),
        .s_axi_awready(mbsys_M01_AXI_AWREADY),
        .s_axi_awvalid(mbsys_M01_AXI_AWVALID),
        .s_axi_bready(mbsys_M01_AXI_BREADY),
        .s_axi_bresp(mbsys_M01_AXI_BRESP),
        .s_axi_bvalid(mbsys_M01_AXI_BVALID),
        .s_axi_rdata(mbsys_M01_AXI_RDATA),
        .s_axi_rready(mbsys_M01_AXI_RREADY),
        .s_axi_rresp(mbsys_M01_AXI_RRESP),
        .s_axi_rvalid(mbsys_M01_AXI_RVALID),
        .s_axi_wdata(mbsys_M01_AXI_WDATA),
        .s_axi_wready(mbsys_M01_AXI_WREADY),
        .s_axi_wstrb(mbsys_M01_AXI_WSTRB),
        .s_axi_wvalid(mbsys_M01_AXI_WVALID),
        .scl_i(axi_iic_0_IIC_SCL_I),
        .scl_o(axi_iic_0_IIC_SCL_O),
        .scl_t(axi_iic_0_IIC_SCL_T),
        .sda_i(axi_iic_0_IIC_SDA_I),
        .sda_o(axi_iic_0_IIC_SDA_O),
        .sda_t(axi_iic_0_IIC_SDA_T));
  control_sub_axi_uartlite_0_0 axi_uartlite_0
       (.interrupt(axi_uartlite_0_interrupt),
        .rx(axi_uartlite_0_UART_RxD),
        .s_axi_aclk(microblaze_0_Clk),
        .s_axi_araddr(mbsys_M02_AXI_ARADDR[3:0]),
        .s_axi_aresetn(mbsys_peripheral_aresetn),
        .s_axi_arready(mbsys_M02_AXI_ARREADY),
        .s_axi_arvalid(mbsys_M02_AXI_ARVALID),
        .s_axi_awaddr(mbsys_M02_AXI_AWADDR[3:0]),
        .s_axi_awready(mbsys_M02_AXI_AWREADY),
        .s_axi_awvalid(mbsys_M02_AXI_AWVALID),
        .s_axi_bready(mbsys_M02_AXI_BREADY),
        .s_axi_bresp(mbsys_M02_AXI_BRESP),
        .s_axi_bvalid(mbsys_M02_AXI_BVALID),
        .s_axi_rdata(mbsys_M02_AXI_RDATA),
        .s_axi_rready(mbsys_M02_AXI_RREADY),
        .s_axi_rresp(mbsys_M02_AXI_RRESP),
        .s_axi_rvalid(mbsys_M02_AXI_RVALID),
        .s_axi_wdata(mbsys_M02_AXI_WDATA),
        .s_axi_wready(mbsys_M02_AXI_WREADY),
        .s_axi_wstrb(mbsys_M02_AXI_WSTRB),
        .s_axi_wvalid(mbsys_M02_AXI_WVALID),
        .tx(axi_uartlite_0_UART_TxD));
  control_sub_clk_wiz_1_0 clk_wiz_1
       (.clk_in1(sysclk_1),
        .clk_out1(microblaze_0_Clk),
        .locked(clk_wiz_1_locked),
        .reset(reset_1));
  mbsys_imp_PO32LV mbsys
       (.Clk(microblaze_0_Clk),
        .In0(axi_iic_0_iic2intc_irpt),
        .In1(axi_uartlite_0_interrupt),
        .M01_AXI_araddr(mbsys_M01_AXI_ARADDR),
        .M01_AXI_arready(mbsys_M01_AXI_ARREADY),
        .M01_AXI_arvalid(mbsys_M01_AXI_ARVALID),
        .M01_AXI_awaddr(mbsys_M01_AXI_AWADDR),
        .M01_AXI_awready(mbsys_M01_AXI_AWREADY),
        .M01_AXI_awvalid(mbsys_M01_AXI_AWVALID),
        .M01_AXI_bready(mbsys_M01_AXI_BREADY),
        .M01_AXI_bresp(mbsys_M01_AXI_BRESP),
        .M01_AXI_bvalid(mbsys_M01_AXI_BVALID),
        .M01_AXI_rdata(mbsys_M01_AXI_RDATA),
        .M01_AXI_rready(mbsys_M01_AXI_RREADY),
        .M01_AXI_rresp(mbsys_M01_AXI_RRESP),
        .M01_AXI_rvalid(mbsys_M01_AXI_RVALID),
        .M01_AXI_wdata(mbsys_M01_AXI_WDATA),
        .M01_AXI_wready(mbsys_M01_AXI_WREADY),
        .M01_AXI_wstrb(mbsys_M01_AXI_WSTRB),
        .M01_AXI_wvalid(mbsys_M01_AXI_WVALID),
        .M02_AXI_araddr(mbsys_M02_AXI_ARADDR),
        .M02_AXI_arready(mbsys_M02_AXI_ARREADY),
        .M02_AXI_arvalid(mbsys_M02_AXI_ARVALID),
        .M02_AXI_awaddr(mbsys_M02_AXI_AWADDR),
        .M02_AXI_awready(mbsys_M02_AXI_AWREADY),
        .M02_AXI_awvalid(mbsys_M02_AXI_AWVALID),
        .M02_AXI_bready(mbsys_M02_AXI_BREADY),
        .M02_AXI_bresp(mbsys_M02_AXI_BRESP),
        .M02_AXI_bvalid(mbsys_M02_AXI_BVALID),
        .M02_AXI_rdata(mbsys_M02_AXI_RDATA),
        .M02_AXI_rready(mbsys_M02_AXI_RREADY),
        .M02_AXI_rresp(mbsys_M02_AXI_RRESP),
        .M02_AXI_rvalid(mbsys_M02_AXI_RVALID),
        .M02_AXI_wdata(mbsys_M02_AXI_WDATA),
        .M02_AXI_wready(mbsys_M02_AXI_WREADY),
        .M02_AXI_wstrb(mbsys_M02_AXI_WSTRB),
        .M02_AXI_wvalid(mbsys_M02_AXI_WVALID),
        .dcm_locked(clk_wiz_1_locked),
        .ext_reset_in(reset_1),
        .peripheral_aresetn(mbsys_peripheral_aresetn));
endmodule

module s00_couplers_imp_19EXVQK
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input [0:0]M_AXI_arready;
  output [0:0]M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input [0:0]M_AXI_awready;
  output [0:0]M_AXI_awvalid;
  output [0:0]M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input [0:0]M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output [0:0]M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input [0:0]M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input [0:0]M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output [0:0]M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output [0:0]S_AXI_arready;
  input [0:0]S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output [0:0]S_AXI_awready;
  input [0:0]S_AXI_awvalid;
  input [0:0]S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output [0:0]S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input [0:0]S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output [0:0]S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output [0:0]S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input [0:0]S_AXI_wvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire [0:0]s00_couplers_to_s00_couplers_ARREADY;
  wire [0:0]s00_couplers_to_s00_couplers_ARVALID;
  wire [31:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [2:0]s00_couplers_to_s00_couplers_AWPROT;
  wire [0:0]s00_couplers_to_s00_couplers_AWREADY;
  wire [0:0]s00_couplers_to_s00_couplers_AWVALID;
  wire [0:0]s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire [0:0]s00_couplers_to_s00_couplers_BVALID;
  wire [31:0]s00_couplers_to_s00_couplers_RDATA;
  wire [0:0]s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire [0:0]s00_couplers_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_s00_couplers_WDATA;
  wire [0:0]s00_couplers_to_s00_couplers_WREADY;
  wire [3:0]s00_couplers_to_s00_couplers_WSTRB;
  wire [0:0]s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid[0] = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = s00_couplers_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid[0] = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready[0] = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_rready[0] = s00_couplers_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid[0] = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_arready[0] = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_awready[0] = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_bvalid[0] = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid[0] = s00_couplers_to_s00_couplers_RVALID;
  assign S_AXI_wready[0] = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready[0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid[0];
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_s00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready[0];
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid[0];
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready[0];
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid[0];
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready[0];
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid[0];
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready[0];
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid[0];
endmodule

module s00_couplers_imp_IM4VT3
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arprot,
    M_AXI_arready,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awprot,
    M_AXI_awready,
    M_AXI_awvalid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arprot,
    S_AXI_arready,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awprot,
    S_AXI_awready,
    S_AXI_awvalid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [2:0]M_AXI_arprot;
  input M_AXI_arready;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [2:0]M_AXI_awprot;
  input M_AXI_awready;
  output M_AXI_awvalid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [2:0]S_AXI_arprot;
  output S_AXI_arready;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [2:0]S_AXI_awprot;
  output S_AXI_awready;
  input S_AXI_awvalid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire M_ACLK_1;
  wire M_ARESETN_1;
  wire S_ACLK_1;
  wire S_ARESETN_1;
  wire [31:0]auto_cc_to_s00_data_fifo_ARADDR;
  wire [2:0]auto_cc_to_s00_data_fifo_ARPROT;
  wire auto_cc_to_s00_data_fifo_ARREADY;
  wire auto_cc_to_s00_data_fifo_ARVALID;
  wire [31:0]auto_cc_to_s00_data_fifo_AWADDR;
  wire [2:0]auto_cc_to_s00_data_fifo_AWPROT;
  wire auto_cc_to_s00_data_fifo_AWREADY;
  wire auto_cc_to_s00_data_fifo_AWVALID;
  wire auto_cc_to_s00_data_fifo_BREADY;
  wire [1:0]auto_cc_to_s00_data_fifo_BRESP;
  wire auto_cc_to_s00_data_fifo_BVALID;
  wire [31:0]auto_cc_to_s00_data_fifo_RDATA;
  wire auto_cc_to_s00_data_fifo_RREADY;
  wire [1:0]auto_cc_to_s00_data_fifo_RRESP;
  wire auto_cc_to_s00_data_fifo_RVALID;
  wire [31:0]auto_cc_to_s00_data_fifo_WDATA;
  wire auto_cc_to_s00_data_fifo_WREADY;
  wire [3:0]auto_cc_to_s00_data_fifo_WSTRB;
  wire auto_cc_to_s00_data_fifo_WVALID;
  wire [31:0]s00_couplers_to_auto_cc_ARADDR;
  wire [2:0]s00_couplers_to_auto_cc_ARPROT;
  wire s00_couplers_to_auto_cc_ARREADY;
  wire s00_couplers_to_auto_cc_ARVALID;
  wire [31:0]s00_couplers_to_auto_cc_AWADDR;
  wire [2:0]s00_couplers_to_auto_cc_AWPROT;
  wire s00_couplers_to_auto_cc_AWREADY;
  wire s00_couplers_to_auto_cc_AWVALID;
  wire s00_couplers_to_auto_cc_BREADY;
  wire [1:0]s00_couplers_to_auto_cc_BRESP;
  wire s00_couplers_to_auto_cc_BVALID;
  wire [31:0]s00_couplers_to_auto_cc_RDATA;
  wire s00_couplers_to_auto_cc_RREADY;
  wire [1:0]s00_couplers_to_auto_cc_RRESP;
  wire s00_couplers_to_auto_cc_RVALID;
  wire [31:0]s00_couplers_to_auto_cc_WDATA;
  wire s00_couplers_to_auto_cc_WREADY;
  wire [3:0]s00_couplers_to_auto_cc_WSTRB;
  wire s00_couplers_to_auto_cc_WVALID;
  wire [31:0]s00_data_fifo_to_s00_couplers_ARADDR;
  wire [2:0]s00_data_fifo_to_s00_couplers_ARPROT;
  wire s00_data_fifo_to_s00_couplers_ARREADY;
  wire s00_data_fifo_to_s00_couplers_ARVALID;
  wire [31:0]s00_data_fifo_to_s00_couplers_AWADDR;
  wire [2:0]s00_data_fifo_to_s00_couplers_AWPROT;
  wire s00_data_fifo_to_s00_couplers_AWREADY;
  wire s00_data_fifo_to_s00_couplers_AWVALID;
  wire s00_data_fifo_to_s00_couplers_BREADY;
  wire [1:0]s00_data_fifo_to_s00_couplers_BRESP;
  wire s00_data_fifo_to_s00_couplers_BVALID;
  wire [31:0]s00_data_fifo_to_s00_couplers_RDATA;
  wire s00_data_fifo_to_s00_couplers_RREADY;
  wire [1:0]s00_data_fifo_to_s00_couplers_RRESP;
  wire s00_data_fifo_to_s00_couplers_RVALID;
  wire [31:0]s00_data_fifo_to_s00_couplers_WDATA;
  wire s00_data_fifo_to_s00_couplers_WREADY;
  wire [3:0]s00_data_fifo_to_s00_couplers_WSTRB;
  wire s00_data_fifo_to_s00_couplers_WVALID;

  assign M_ACLK_1 = M_ACLK;
  assign M_ARESETN_1 = M_ARESETN;
  assign M_AXI_araddr[31:0] = s00_data_fifo_to_s00_couplers_ARADDR;
  assign M_AXI_arprot[2:0] = s00_data_fifo_to_s00_couplers_ARPROT;
  assign M_AXI_arvalid = s00_data_fifo_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_data_fifo_to_s00_couplers_AWADDR;
  assign M_AXI_awprot[2:0] = s00_data_fifo_to_s00_couplers_AWPROT;
  assign M_AXI_awvalid = s00_data_fifo_to_s00_couplers_AWVALID;
  assign M_AXI_bready = s00_data_fifo_to_s00_couplers_BREADY;
  assign M_AXI_rready = s00_data_fifo_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s00_data_fifo_to_s00_couplers_WDATA;
  assign M_AXI_wstrb[3:0] = s00_data_fifo_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = s00_data_fifo_to_s00_couplers_WVALID;
  assign S_ACLK_1 = S_ACLK;
  assign S_ARESETN_1 = S_ARESETN;
  assign S_AXI_arready = s00_couplers_to_auto_cc_ARREADY;
  assign S_AXI_awready = s00_couplers_to_auto_cc_AWREADY;
  assign S_AXI_bresp[1:0] = s00_couplers_to_auto_cc_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_auto_cc_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_auto_cc_RDATA;
  assign S_AXI_rresp[1:0] = s00_couplers_to_auto_cc_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_auto_cc_RVALID;
  assign S_AXI_wready = s00_couplers_to_auto_cc_WREADY;
  assign s00_couplers_to_auto_cc_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_auto_cc_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_auto_cc_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_auto_cc_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_auto_cc_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_auto_cc_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_auto_cc_BREADY = S_AXI_bready;
  assign s00_couplers_to_auto_cc_RREADY = S_AXI_rready;
  assign s00_couplers_to_auto_cc_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_auto_cc_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_auto_cc_WVALID = S_AXI_wvalid;
  assign s00_data_fifo_to_s00_couplers_ARREADY = M_AXI_arready;
  assign s00_data_fifo_to_s00_couplers_AWREADY = M_AXI_awready;
  assign s00_data_fifo_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_data_fifo_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign s00_data_fifo_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_data_fifo_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_data_fifo_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_data_fifo_to_s00_couplers_WREADY = M_AXI_wready;
  control_sub_auto_cc_0 auto_cc
       (.m_axi_aclk(M_ACLK_1),
        .m_axi_araddr(auto_cc_to_s00_data_fifo_ARADDR),
        .m_axi_aresetn(M_ARESETN_1),
        .m_axi_arprot(auto_cc_to_s00_data_fifo_ARPROT),
        .m_axi_arready(auto_cc_to_s00_data_fifo_ARREADY),
        .m_axi_arvalid(auto_cc_to_s00_data_fifo_ARVALID),
        .m_axi_awaddr(auto_cc_to_s00_data_fifo_AWADDR),
        .m_axi_awprot(auto_cc_to_s00_data_fifo_AWPROT),
        .m_axi_awready(auto_cc_to_s00_data_fifo_AWREADY),
        .m_axi_awvalid(auto_cc_to_s00_data_fifo_AWVALID),
        .m_axi_bready(auto_cc_to_s00_data_fifo_BREADY),
        .m_axi_bresp(auto_cc_to_s00_data_fifo_BRESP),
        .m_axi_bvalid(auto_cc_to_s00_data_fifo_BVALID),
        .m_axi_rdata(auto_cc_to_s00_data_fifo_RDATA),
        .m_axi_rready(auto_cc_to_s00_data_fifo_RREADY),
        .m_axi_rresp(auto_cc_to_s00_data_fifo_RRESP),
        .m_axi_rvalid(auto_cc_to_s00_data_fifo_RVALID),
        .m_axi_wdata(auto_cc_to_s00_data_fifo_WDATA),
        .m_axi_wready(auto_cc_to_s00_data_fifo_WREADY),
        .m_axi_wstrb(auto_cc_to_s00_data_fifo_WSTRB),
        .m_axi_wvalid(auto_cc_to_s00_data_fifo_WVALID),
        .s_axi_aclk(S_ACLK_1),
        .s_axi_araddr(s00_couplers_to_auto_cc_ARADDR),
        .s_axi_aresetn(S_ARESETN_1),
        .s_axi_arprot(s00_couplers_to_auto_cc_ARPROT),
        .s_axi_arready(s00_couplers_to_auto_cc_ARREADY),
        .s_axi_arvalid(s00_couplers_to_auto_cc_ARVALID),
        .s_axi_awaddr(s00_couplers_to_auto_cc_AWADDR),
        .s_axi_awprot(s00_couplers_to_auto_cc_AWPROT),
        .s_axi_awready(s00_couplers_to_auto_cc_AWREADY),
        .s_axi_awvalid(s00_couplers_to_auto_cc_AWVALID),
        .s_axi_bready(s00_couplers_to_auto_cc_BREADY),
        .s_axi_bresp(s00_couplers_to_auto_cc_BRESP),
        .s_axi_bvalid(s00_couplers_to_auto_cc_BVALID),
        .s_axi_rdata(s00_couplers_to_auto_cc_RDATA),
        .s_axi_rready(s00_couplers_to_auto_cc_RREADY),
        .s_axi_rresp(s00_couplers_to_auto_cc_RRESP),
        .s_axi_rvalid(s00_couplers_to_auto_cc_RVALID),
        .s_axi_wdata(s00_couplers_to_auto_cc_WDATA),
        .s_axi_wready(s00_couplers_to_auto_cc_WREADY),
        .s_axi_wstrb(s00_couplers_to_auto_cc_WSTRB),
        .s_axi_wvalid(s00_couplers_to_auto_cc_WVALID));
  control_sub_s00_data_fifo_0 s00_data_fifo
       (.aclk(M_ACLK_1),
        .aresetn(M_ARESETN_1),
        .m_axi_araddr(s00_data_fifo_to_s00_couplers_ARADDR),
        .m_axi_arprot(s00_data_fifo_to_s00_couplers_ARPROT),
        .m_axi_arready(s00_data_fifo_to_s00_couplers_ARREADY),
        .m_axi_arvalid(s00_data_fifo_to_s00_couplers_ARVALID),
        .m_axi_awaddr(s00_data_fifo_to_s00_couplers_AWADDR),
        .m_axi_awprot(s00_data_fifo_to_s00_couplers_AWPROT),
        .m_axi_awready(s00_data_fifo_to_s00_couplers_AWREADY),
        .m_axi_awvalid(s00_data_fifo_to_s00_couplers_AWVALID),
        .m_axi_bready(s00_data_fifo_to_s00_couplers_BREADY),
        .m_axi_bresp(s00_data_fifo_to_s00_couplers_BRESP),
        .m_axi_bvalid(s00_data_fifo_to_s00_couplers_BVALID),
        .m_axi_rdata(s00_data_fifo_to_s00_couplers_RDATA),
        .m_axi_rready(s00_data_fifo_to_s00_couplers_RREADY),
        .m_axi_rresp(s00_data_fifo_to_s00_couplers_RRESP),
        .m_axi_rvalid(s00_data_fifo_to_s00_couplers_RVALID),
        .m_axi_wdata(s00_data_fifo_to_s00_couplers_WDATA),
        .m_axi_wready(s00_data_fifo_to_s00_couplers_WREADY),
        .m_axi_wstrb(s00_data_fifo_to_s00_couplers_WSTRB),
        .m_axi_wvalid(s00_data_fifo_to_s00_couplers_WVALID),
        .s_axi_araddr(auto_cc_to_s00_data_fifo_ARADDR),
        .s_axi_arprot(auto_cc_to_s00_data_fifo_ARPROT),
        .s_axi_arready(auto_cc_to_s00_data_fifo_ARREADY),
        .s_axi_arvalid(auto_cc_to_s00_data_fifo_ARVALID),
        .s_axi_awaddr(auto_cc_to_s00_data_fifo_AWADDR),
        .s_axi_awprot(auto_cc_to_s00_data_fifo_AWPROT),
        .s_axi_awready(auto_cc_to_s00_data_fifo_AWREADY),
        .s_axi_awvalid(auto_cc_to_s00_data_fifo_AWVALID),
        .s_axi_bready(auto_cc_to_s00_data_fifo_BREADY),
        .s_axi_bresp(auto_cc_to_s00_data_fifo_BRESP),
        .s_axi_bvalid(auto_cc_to_s00_data_fifo_BVALID),
        .s_axi_rdata(auto_cc_to_s00_data_fifo_RDATA),
        .s_axi_rready(auto_cc_to_s00_data_fifo_RREADY),
        .s_axi_rresp(auto_cc_to_s00_data_fifo_RRESP),
        .s_axi_rvalid(auto_cc_to_s00_data_fifo_RVALID),
        .s_axi_wdata(auto_cc_to_s00_data_fifo_WDATA),
        .s_axi_wready(auto_cc_to_s00_data_fifo_WREADY),
        .s_axi_wstrb(auto_cc_to_s00_data_fifo_WSTRB),
        .s_axi_wvalid(auto_cc_to_s00_data_fifo_WVALID));
endmodule
