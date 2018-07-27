#
# Copyright (c) 2015 University of Cambridge
# All rights reserved.
#
# This software was developed by Stanford University and the University of Cambridge Computer Laboratory 
# under National Science Foundation under Grant No. CNS-0855268,
# the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
# by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
# as part of the DARPA MRC research programme.
#
# @NETFPGA_LICENSE_HEADER_START@
#
# Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
# license agreements.  See the NOTICE file distributed with this work for
# additional information regarding copyright ownership.  NetFPGA licenses this
# file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
# "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at:
#
#   http://www.netfpga-cic.org
#
# Unless required by applicable law or agreed to in writing, Work distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations under the License.
#
# @NETFPGA_LICENSE_HEADER_END@
#

# Hierachical cell : SUME 10g interface block design
proc create_hier_cell_nf_sume_dma_engine { parentCell coreName tdataWidth } {

   # Check argument
   if { $parentCell eq "" || $coreName eq "" } {
      puts "ERROR: Empty argument(s)!"
      return
   }

   if { $tdataWidth eq "" } {
      puts "Default: Default setting data width to 128bits!"
      return
   }

   if { $tdataWidth < "128" } {
      puts "ERROR: Data width should be larger than 128bits!"
   }

   # Get object for parentCell
   set parentObj [get_bd_cells $parentCell]
   if { $parentCell == "" } {
      puts "ERROR: Unable to find parent cell <$parentCell>!"
      return
   }

   # parentObj should be hier block
   set parentType [get_property TYPE $parentObj]
   if { $parentType ne "hier"} {
      puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>."
   }

   # Save current instance; Restore later
   set oldCurInst [current_bd_instance .]

   # Set parent object as current
   current_bd_instance $parentObj

   # Create cell and set as current instance
   set hier_obj [create_bd_cell -type hier $coreName]
   current_bd_instance $hier_obj

   # Create bd external ports
   create_bd_pin -dir I -type clk pcie_sys_clkp
   create_bd_pin -dir I -type clk pcie_sys_clkn

   create_bd_pin -dir I pcie_sys_reset

   create_bd_pin -dir I -from 0 -to 7 pcie_7x_mgt_rxn
   create_bd_pin -dir I -from 0 -to 7 pcie_7x_mgt_rxp
   create_bd_pin -dir O -from 0 -to 7 pcie_7x_mgt_txn
   create_bd_pin -dir O -from 0 -to 7 pcie_7x_mgt_txp

   create_bd_pin -dir I -type clk axis_aclk
   create_bd_pin -dir I axis_aresetn

   create_bd_pin -dir I -type clk m_axi_aclk
   create_bd_pin -dir I m_axi_aresetn

   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 m_axi_lite
   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_lite
   create_bd_pin -dir O -type clk pcie_user_clk 

   create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis
   create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis

   # pcie endpoint input clock buffer.
   create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.0 util_ds_buf_0
   set_property -dict [list CONFIG.C_BUF_TYPE {IBUFDSGTE}] [get_bd_cells util_ds_buf_0]

   # Main pcie reset is active low, but pcie endpoint needs active high reset.
   create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 pcie_inverter_0
   set_property -dict [list CONFIG.C_SIZE {1}] [get_bd_cells pcie_inverter_0]
   set_property -dict [list CONFIG.C_OPERATION {not}] [get_bd_cells pcie_inverter_0]
   
   # pcie user clock reset inverter.
   create_bd_cell -type ip -vlnv xilinx.com:ip:util_vector_logic:2.0 user_pcie_inverter_0
   set_property -dict [list CONFIG.C_SIZE {1}] [get_bd_cells user_pcie_inverter_0]
   set_property -dict [list CONFIG.C_OPERATION {not}] [get_bd_cells user_pcie_inverter_0]

   # load pcie endpoint.
   create_bd_cell -type ip -vlnv xilinx.com:ip:pcie3_7x:3.0 pcie3_7x_1
   set_property -dict [list CONFIG.xlnx_ref_board {None}] [get_bd_cells pcie3_7x_1]
   set_property -dict [list CONFIG.pcie_blk_locn {X0Y1} CONFIG.PL_LINK_CAP_MAX_LINK_WIDTH {X8}] [get_bd_cells pcie3_7x_1]
   set_property -dict [list CONFIG.PL_LINK_CAP_MAX_LINK_SPEED {5.0_GT/s} CONFIG.axisten_if_width {128_bit}] [get_bd_cells pcie3_7x_1]
   set_property -dict [list CONFIG.axisten_if_enable_client_tag {false} CONFIG.pf0_dev_cap_max_payload {128_bytes}] [get_bd_cells pcie3_7x_1]
   set_property -dict [list CONFIG.extended_tag_field {true} CONFIG.pf0_bar0_size {1}] [get_bd_cells pcie3_7x_1]
   set_property -dict [list CONFIG.PF0_INTERRUPT_PIN {NONE} CONFIG.mode_selection {Advanced}] [get_bd_cells pcie3_7x_1]
   set_property -dict [list CONFIG.en_ext_clk {false} CONFIG.cfg_ext_if {false}] [get_bd_cells pcie3_7x_1]
   set_property -dict [list CONFIG.per_func_status_if {false} CONFIG.cfg_mgmt_if {false}] [get_bd_cells pcie3_7x_1]
   set_property -dict [list CONFIG.rcv_msg_if {false} CONFIG.cfg_tx_msg_if {false}] [get_bd_cells pcie3_7x_1]
   set_property -dict [list CONFIG.cfg_ctl_if {false} CONFIG.tx_fc_if {false}] [get_bd_cells pcie3_7x_1]
   set_property -dict [list CONFIG.gen_x0y0 {false} CONFIG.gen_x0y1 {true}] [get_bd_cells pcie3_7x_1]
   set_property -dict [list CONFIG.AXISTEN_IF_RC_STRADDLE {false} CONFIG.PF0_DEVICE_ID {7028}] [get_bd_cells pcie3_7x_1]
   set_property -dict [list CONFIG.PF1_DEVICE_ID {7011} CONFIG.axisten_freq {250}] [get_bd_cells pcie3_7x_1]

   # load dma.
   #create_bd_cell -type ip -vlnv NetFPGA-SUME:NetFPGA-SUME:nf_riffa_dma:1.00 nf_riffa_dma_0
   create_bd_cell -type ip -vlnv NetFPGA:NetFPGA:nf_riffa_dma:1.0 nf_riffa_dma_0

   # This async fifo is connected to dma tx and rx.
   create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_0
   set_property -dict [list CONFIG.TDATA_NUM_BYTES {16}] [get_bd_cells axis_data_fifo_0]
   set_property -dict [list CONFIG.TUSER_WIDTH {128}] [get_bd_cells axis_data_fifo_0]
   set_property -dict [list CONFIG.IS_ACLK_ASYNC {1}] [get_bd_cells axis_data_fifo_0]
   set_property -dict [list CONFIG.FIFO_DEPTH {32}] [get_bd_cells axis_data_fifo_0]
   
   create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:1.1 axis_data_fifo_1
   set_property -dict [list CONFIG.TDATA_NUM_BYTES {16}] [get_bd_cells axis_data_fifo_1]
   set_property -dict [list CONFIG.TUSER_WIDTH {128}] [get_bd_cells axis_data_fifo_1]
   set_property -dict [list CONFIG.IS_ACLK_ASYNC {1}] [get_bd_cells axis_data_fifo_1]
   set_property -dict [list CONFIG.FIFO_DEPTH {32}] [get_bd_cells axis_data_fifo_1]

   # Axis data width converter.
   if { $tdataWidth ne "128" } {

      set convWidth [expr $tdataWidth/8]

      create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_0
      set_property -dict [list CONFIG.HAS_TKEEP.VALUE_SRC USER CONFIG.HAS_TLAST.VALUE_SRC USER \
         CONFIG.HAS_TSTRB.VALUE_SRC USER CONFIG.S_TDATA_NUM_BYTES.VALUE_SRC USER \
         CONFIG.TUSER_BITS_PER_BYTE.VALUE_SRC USER] [get_bd_cells axis_dwidth_converter_0]
      set_property -dict [list CONFIG.S_TDATA_NUM_BYTES {16} CONFIG.M_TDATA_NUM_BYTES $convWidth \
         CONFIG.TUSER_BITS_PER_BYTE {8} \
         CONFIG.HAS_TLAST {1} CONFIG.HAS_TSTRB {0} \
         CONFIG.HAS_TKEEP {1} CONFIG.HAS_MI_TKEEP {1}] [get_bd_cells axis_dwidth_converter_0]
      
      create_bd_cell -type ip -vlnv xilinx.com:ip:axis_dwidth_converter:1.1 axis_dwidth_converter_1
      set_property -dict [list CONFIG.HAS_TKEEP.VALUE_SRC USER CONFIG.HAS_TLAST.VALUE_SRC USER \
         CONFIG.HAS_TSTRB.VALUE_SRC USER CONFIG.S_TDATA_NUM_BYTES.VALUE_SRC USER \
         CONFIG.TUSER_BITS_PER_BYTE.VALUE_SRC USER] [get_bd_cells axis_dwidth_converter_1]
      set_property -dict [list CONFIG.S_TDATA_NUM_BYTES $convWidth CONFIG.M_TDATA_NUM_BYTES {16} \
         CONFIG.TUSER_BITS_PER_BYTE {8} \
         CONFIG.HAS_TLAST {1} CONFIG.HAS_TSTRB {0} \
         CONFIG.HAS_TKEEP {1} CONFIG.HAS_MI_TKEEP {1}] [get_bd_cells axis_dwidth_converter_1]
   }

   # External port connections
   connect_bd_net [get_bd_pins pcie_sys_clkp] [get_bd_pins util_ds_buf_0/IBUF_DS_P]
   connect_bd_net [get_bd_pins pcie_sys_clkn] [get_bd_pins util_ds_buf_0/IBUF_DS_N]
   
   connect_bd_net [get_bd_pins pcie_sys_reset] [get_bd_pins pcie_inverter_0/Op1]
   
   connect_bd_net [get_bd_pins pcie_7x_mgt_rxn] [get_bd_pins pcie3_7x_1/pci_exp_rxn]	
   connect_bd_net [get_bd_pins pcie_7x_mgt_rxp] [get_bd_pins pcie3_7x_1/pci_exp_rxp]
   connect_bd_net [get_bd_pins pcie_7x_mgt_txn] [get_bd_pins pcie3_7x_1/pci_exp_txn]
   connect_bd_net [get_bd_pins pcie_7x_mgt_txp] [get_bd_pins pcie3_7x_1/pci_exp_txp]
   
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins axis_data_fifo_0/m_axis_aclk]
   connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins axis_data_fifo_1/s_axis_aclk]
   
   connect_bd_net [get_bd_pins axis_aresetn] [get_bd_pins axis_data_fifo_0/m_axis_aresetn]
   connect_bd_net [get_bd_pins axis_aresetn] [get_bd_pins axis_data_fifo_1/s_axis_aresetn]
   
   if { $tdataWidth ne "128" } {
      connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins axis_dwidth_converter_0/aclk]
      connect_bd_net [get_bd_pins axis_aclk] [get_bd_pins axis_dwidth_converter_1/aclk]
   
      connect_bd_net [get_bd_pins axis_aresetn] [get_bd_pins axis_dwidth_converter_0/aresetn]
      connect_bd_net [get_bd_pins axis_aresetn] [get_bd_pins axis_dwidth_converter_1/aresetn]
   }

   connect_bd_net [get_bd_pins m_axi_aresetn] [get_bd_pins nf_riffa_dma_0/m_axi_lite_aresetn]
   connect_bd_net [get_bd_pins m_axi_aclk] [get_bd_pins nf_riffa_dma_0/m_axi_lite_aclk] 
      
   # Internal connection
   connect_bd_net [get_bd_pins util_ds_buf_0/IBUF_OUT] [get_bd_pins pcie3_7x_1/sys_clk]
   connect_bd_net [get_bd_pins pcie_inverter_0/Res] [get_bd_pins pcie3_7x_1/sys_reset]
   
   connect_bd_net [get_bd_pins pcie3_7x_1/user_clk] [get_bd_pins nf_riffa_dma_0/user_clk]
   connect_bd_net [get_bd_pins pcie3_7x_1/user_reset] [get_bd_pins nf_riffa_dma_0/user_reset]
   connect_bd_net [get_bd_pins pcie3_7x_1/user_reset] [get_bd_pins user_pcie_inverter_0/Op1]
   connect_bd_net [get_bd_pins pcie3_7x_1/user_lnk_up] [get_bd_pins nf_riffa_dma_0/user_lnk_up]
   
   connect_bd_intf_net [get_bd_intf_pins pcie3_7x_1/m_axis_cq] [get_bd_intf_pins nf_riffa_dma_0/m_axis_cq]
   connect_bd_intf_net [get_bd_intf_pins pcie3_7x_1/m_axis_rc] [get_bd_intf_pins nf_riffa_dma_0/m_axis_rc]
   connect_bd_intf_net [get_bd_intf_pins pcie3_7x_1/s_axis_rq] [get_bd_intf_pins nf_riffa_dma_0/s_axis_rq]
   connect_bd_intf_net [get_bd_intf_pins pcie3_7x_1/s_axis_cc] [get_bd_intf_pins nf_riffa_dma_0/s_axis_cc]
   
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_msi_attr] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_msi_attr]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_msi_data] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_msi_data]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_msi_enable] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_msi_enable]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_msi_fail] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_msi_fail]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_msi_function_number] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_msi_function_number]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_msi_int] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_msi_int]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_msi_mask_update] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_msi_mask_update]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_msi_mmenable] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_msi_mmenable]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_msi_pending_status] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_msi_pending_status]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_msi_select] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_msi_select]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_msi_sent] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_msi_sent]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_msi_tph_present] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_msi_tph_present]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_msi_tph_st_tag] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_msi_tph_st_tag]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_msi_tph_type] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_msi_tph_type]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_msi_vf_enable] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_msi_vf_enable]
   
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_int] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_int]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_pending] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_pending]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_interrupt_sent] [get_bd_pins nf_riffa_dma_0/cfg_interrupt_sent]
   
   connect_bd_net [get_bd_pins pcie3_7x_1/pcie_cq_np_req] [get_bd_pins nf_riffa_dma_0/pcie_cq_np_req]
   connect_bd_net [get_bd_pins pcie3_7x_1/pcie_cq_np_req_count] [get_bd_pins nf_riffa_dma_0/pcie_cq_np_req_count]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_current_speed] [get_bd_pins nf_riffa_dma_0/cfg_current_speed]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_dpa_substate_change] [get_bd_pins nf_riffa_dma_0/cfg_dpa_substate_change]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_err_cor_out] [get_bd_pins nf_riffa_dma_0/cfg_err_cor_out]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_err_fatal_out] [get_bd_pins nf_riffa_dma_0/cfg_err_fatal_out]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_err_nonfatal_out] [get_bd_pins nf_riffa_dma_0/cfg_err_nonfatal_out]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_function_power_state] [get_bd_pins nf_riffa_dma_0/cfg_function_power_state]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_function_status] [get_bd_pins nf_riffa_dma_0/cfg_function_status]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_link_power_state] [get_bd_pins nf_riffa_dma_0/cfg_link_power_state]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_ltr_enable] [get_bd_pins nf_riffa_dma_0/cfg_ltr_enable]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_ltssm_state] [get_bd_pins nf_riffa_dma_0/cfg_ltssm_state]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_max_payload] [get_bd_pins nf_riffa_dma_0/cfg_max_payload]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_max_read_req] [get_bd_pins nf_riffa_dma_0/cfg_max_read_req]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_negotiated_width] [get_bd_pins nf_riffa_dma_0/cfg_negotiated_width]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_obff_enable] [get_bd_pins nf_riffa_dma_0/cfg_obff_enable]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_phy_link_down] [get_bd_pins nf_riffa_dma_0/cfg_phy_link_down]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_phy_link_status] [get_bd_pins nf_riffa_dma_0/cfg_phy_link_status]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_pl_status_change] [get_bd_pins nf_riffa_dma_0/cfg_pl_status_change]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_rcb_status] [get_bd_pins nf_riffa_dma_0/cfg_rcb_status]
   
   connect_bd_net [get_bd_pins pcie3_7x_1/pcie_rq_seq_num] [get_bd_pins nf_riffa_dma_0/pcie_rq_seq_num]
   connect_bd_net [get_bd_pins pcie3_7x_1/pcie_rq_seq_num_vld] [get_bd_pins nf_riffa_dma_0/pcie_rq_seq_num_vld]
   connect_bd_net [get_bd_pins pcie3_7x_1/pcie_rq_tag] [get_bd_pins nf_riffa_dma_0/pcie_rq_tag]
   connect_bd_net [get_bd_pins pcie3_7x_1/pcie_rq_tag_vld] [get_bd_pins nf_riffa_dma_0/pcie_rq_tag_vld]
   
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_tph_requester_enable] [get_bd_pins nf_riffa_dma_0/cfg_tph_requester_enable]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_tph_st_mode] [get_bd_pins nf_riffa_dma_0/cfg_tph_st_mode]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_vf_power_state] [get_bd_pins nf_riffa_dma_0/cfg_vf_power_state]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_vf_status] [get_bd_pins nf_riffa_dma_0/cfg_vf_status]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_vf_tph_requester_enable] [get_bd_pins nf_riffa_dma_0/cfg_vf_tph_requester_enable]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_vf_tph_st_mode] [get_bd_pins nf_riffa_dma_0/cfg_vf_tph_st_mode]
   
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_fc_cpld] [get_bd_pins nf_riffa_dma_0/cfg_fc_cpld]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_fc_cplh] [get_bd_pins nf_riffa_dma_0/cfg_fc_cplh]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_fc_npd] [get_bd_pins nf_riffa_dma_0/cfg_fc_npd]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_fc_nph] [get_bd_pins nf_riffa_dma_0/cfg_fc_nph]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_fc_pd] [get_bd_pins nf_riffa_dma_0/cfg_fc_pd]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_fc_ph] [get_bd_pins nf_riffa_dma_0/cfg_fc_ph]
   connect_bd_net [get_bd_pins pcie3_7x_1/cfg_fc_sel] [get_bd_pins nf_riffa_dma_0/cfg_fc_sel]

   connect_bd_intf_net [get_bd_intf_pins nf_riffa_dma_0/m_axis_xge_tx] [get_bd_intf_pins axis_data_fifo_0/S_AXIS]
   connect_bd_intf_net [get_bd_intf_pins axis_data_fifo_1/M_AXIS] [get_bd_intf_pins nf_riffa_dma_0/s_axis_xge_rx]
   
   connect_bd_net [get_bd_pins pcie3_7x_1/user_clk] [get_bd_pins axis_data_fifo_0/s_axis_aclk]
   connect_bd_net [get_bd_pins pcie3_7x_1/user_clk] [get_bd_pins axis_data_fifo_1/m_axis_aclk]
   
   connect_bd_net [get_bd_pins user_pcie_inverter_0/Res] [get_bd_pins axis_data_fifo_0/s_axis_aresetn]
   connect_bd_net [get_bd_pins user_pcie_inverter_0/Res] [get_bd_pins axis_data_fifo_1/m_axis_aresetn]
   
   if { $tdataWidth ne "128" } {
      connect_bd_intf_net [get_bd_intf_pins axis_data_fifo_0/M_AXIS] [get_bd_intf_pins axis_dwidth_converter_0/S_AXIS]
      connect_bd_intf_net [get_bd_intf_pins axis_dwidth_converter_0/M_AXIS] [get_bd_intf_pin m_axis]
   
      connect_bd_intf_net [get_bd_intf_pins axis_dwidth_converter_1/M_AXIS] [get_bd_intf_pins axis_data_fifo_1/S_AXIS]
      connect_bd_intf_net [get_bd_intf_pins axis_dwidth_converter_1/S_AXIS] [get_bd_intf_pin s_axis]
   } else {
      connect_bd_intf_net [get_bd_intf_pins axis_data_fifo_0/M_AXIS] [get_bd_intf_pin m_axis]
      connect_bd_intf_net [get_bd_intf_pins axis_data_fifo_1/S_AXIS] [get_bd_intf_pin s_axis]
   }

   connect_bd_intf_net [get_bd_intf_pins m_axi_lite] [get_bd_intf_pins nf_riffa_dma_0/m_axi_lite] 
   connect_bd_intf_net [get_bd_intf_pins s_axi_lite] [get_bd_intf_pins nf_riffa_dma_0/s_axi_lite]
   connect_bd_net [get_bd_pins pcie_user_clk] [get_bd_pins pcie3_7x_1/user_clk]
   
   
   # Restore current instance
   current_bd_instance $oldCurInst
}
