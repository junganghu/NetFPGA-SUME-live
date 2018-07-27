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

// IP VLNV: xilinx.com:ip:axi_10g_ethernet:3.1
// IP Revision: 3

// The following must be inserted into your Verilog file for this
// core to be instantiated. Change the instance name and port connections
// (in parentheses) to your own signal names.

//----------- Begin Cut here for INSTANTIATION Template ---// INST_TAG
axi_10g_ethernet_shared your_instance_name (
  .tx_axis_aresetn(tx_axis_aresetn),                            // input wire tx_axis_aresetn
  .rx_axis_aresetn(rx_axis_aresetn),                            // input wire rx_axis_aresetn
  .tx_ifg_delay(tx_ifg_delay),                                  // input wire [7 : 0] tx_ifg_delay
  .dclk(dclk),                                                  // input wire dclk
  .txp(txp),                                                    // output wire txp
  .txn(txn),                                                    // output wire txn
  .rxp(rxp),                                                    // input wire rxp
  .rxn(rxn),                                                    // input wire rxn
  .signal_detect(signal_detect),                                // input wire signal_detect
  .tx_fault(tx_fault),                                          // input wire tx_fault
  .tx_disable(tx_disable),                                      // output wire tx_disable
  .pcspma_status(pcspma_status),                                // output wire [7 : 0] pcspma_status
  .sim_speedup_control(sim_speedup_control),                    // input wire sim_speedup_control
  .rxrecclk_out(rxrecclk_out),                                  // output wire rxrecclk_out
  .mac_tx_configuration_vector(mac_tx_configuration_vector),    // input wire [79 : 0] mac_tx_configuration_vector
  .mac_rx_configuration_vector(mac_rx_configuration_vector),    // input wire [79 : 0] mac_rx_configuration_vector
  .mac_status_vector(mac_status_vector),                        // output wire [2 : 0] mac_status_vector
  .pcs_pma_configuration_vector(pcs_pma_configuration_vector),  // input wire [535 : 0] pcs_pma_configuration_vector
  .pcs_pma_status_vector(pcs_pma_status_vector),                // output wire [447 : 0] pcs_pma_status_vector
  .areset_datapathclk_out(areset_datapathclk_out),              // output wire areset_datapathclk_out
  .txusrclk_out(txusrclk_out),                                  // output wire txusrclk_out
  .txusrclk2_out(txusrclk2_out),                                // output wire txusrclk2_out
  .gttxreset_out(gttxreset_out),                                // output wire gttxreset_out
  .gtrxreset_out(gtrxreset_out),                                // output wire gtrxreset_out
  .txuserrdy_out(txuserrdy_out),                                // output wire txuserrdy_out
  .coreclk_out(coreclk_out),                                    // output wire coreclk_out
  .resetdone_out(resetdone_out),                                // output wire resetdone_out
  .reset_counter_done_out(reset_counter_done_out),              // output wire reset_counter_done_out
  .qplllock_out(qplllock_out),                                  // output wire qplllock_out
  .qplloutclk_out(qplloutclk_out),                              // output wire qplloutclk_out
  .qplloutrefclk_out(qplloutrefclk_out),                        // output wire qplloutrefclk_out
  .refclk_p(refclk_p),                                          // input wire refclk_p
  .refclk_n(refclk_n),                                          // input wire refclk_n
  .reset(reset),                                                // input wire reset
  .s_axis_tx_tdata(s_axis_tx_tdata),                            // input wire [63 : 0] s_axis_tx_tdata
  .s_axis_tx_tkeep(s_axis_tx_tkeep),                            // input wire [7 : 0] s_axis_tx_tkeep
  .s_axis_tx_tlast(s_axis_tx_tlast),                            // input wire s_axis_tx_tlast
  .s_axis_tx_tready(s_axis_tx_tready),                          // output wire s_axis_tx_tready
  .s_axis_tx_tuser(s_axis_tx_tuser),                            // input wire [0 : 0] s_axis_tx_tuser
  .s_axis_tx_tvalid(s_axis_tx_tvalid),                          // input wire s_axis_tx_tvalid
  .s_axis_pause_tdata(s_axis_pause_tdata),                      // input wire [15 : 0] s_axis_pause_tdata
  .s_axis_pause_tvalid(s_axis_pause_tvalid),                    // input wire s_axis_pause_tvalid
  .m_axis_rx_tdata(m_axis_rx_tdata),                            // output wire [63 : 0] m_axis_rx_tdata
  .m_axis_rx_tkeep(m_axis_rx_tkeep),                            // output wire [7 : 0] m_axis_rx_tkeep
  .m_axis_rx_tlast(m_axis_rx_tlast),                            // output wire m_axis_rx_tlast
  .m_axis_rx_tuser(m_axis_rx_tuser),                            // output wire m_axis_rx_tuser
  .m_axis_rx_tvalid(m_axis_rx_tvalid),                          // output wire m_axis_rx_tvalid
  .tx_statistics_valid(tx_statistics_valid),                    // output wire tx_statistics_valid
  .tx_statistics_vector(tx_statistics_vector),                  // output wire [25 : 0] tx_statistics_vector
  .rx_statistics_valid(rx_statistics_valid),                    // output wire rx_statistics_valid
  .rx_statistics_vector(rx_statistics_vector)                  // output wire [29 : 0] rx_statistics_vector
);
// INST_TAG_END ------ End INSTANTIATION Template ---------

// You must compile the wrapper file axi_10g_ethernet_shared.v when simulating
// the core, axi_10g_ethernet_shared. When compiling the wrapper file, be sure to
// reference the Verilog simulation library.

