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
# Licensed to NetFPGA C.I.C. (NetFPGA) under one or more
# contributor license agreements.  See the NOTICE file distributed with this
# work for additional information regarding copyright ownership.  NetFPGA
# licenses this file to you under the NetFPGA Hardware-Software License,
# Version 1.0 (the "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at:
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

# External ports connection

connect_bd_net [get_bd_ports pcie_7x_mgt_rxn] [get_bd_pins nf_sume_dma/pcie_7x_mgt_rxn]	
connect_bd_net [get_bd_ports pcie_7x_mgt_rxp] [get_bd_pins nf_sume_dma/pcie_7x_mgt_rxp]
connect_bd_net [get_bd_ports pcie_7x_mgt_txn] [get_bd_pins nf_sume_dma/pcie_7x_mgt_txn]
connect_bd_net [get_bd_ports pcie_7x_mgt_txp] [get_bd_pins nf_sume_dma/pcie_7x_mgt_txp]

connect_bd_net [get_bd_ports sys_clkp] [get_bd_pins nf_sume_dma/pcie_sys_clkp]
connect_bd_net [get_bd_ports sys_clkn] [get_bd_pins nf_sume_dma/pcie_sys_clkn]
connect_bd_net [get_bd_ports pcie_sys_resetn] [get_bd_pins nf_sume_dma/pcie_sys_reset]

connect_bd_net [get_bd_ports reset] [get_bd_pins sys_clock_0/reset]
connect_bd_net [get_bd_ports reset] [get_bd_pins proc_sys_reset_0/ext_reset_in]
connect_bd_net [get_bd_ports reset] [get_bd_pins nf_10g_interface_0/rst]

connect_bd_net [get_bd_ports fpga_sysclk_n] [get_bd_pins sysclk_buf/IBUF_DS_N]
connect_bd_net [get_bd_ports fpga_sysclk_p] [get_bd_pins sysclk_buf/IBUF_DS_P]

connect_bd_net [get_bd_ports sfp_refclk_n] [get_bd_pins nf_10g_interface_0/refclk_n]
connect_bd_net [get_bd_ports sfp_refclk_p] [get_bd_pins nf_10g_interface_0/refclk_p]

connect_bd_net [get_bd_pins sys_clock_0/clk_in1] [get_bd_pins sysclk_buf/IBUF_OUT]
connect_bd_net [get_bd_pins sys_clock_0/locked] [get_bd_pins proc_sys_reset_0/dcm_locked]

connect_bd_net [get_bd_ports eth0_tx_disable] [get_bd_pins nf_10g_interface_0/tx_disable]
connect_bd_net [get_bd_ports eth0_rx_led] [get_bd_pins nf_10g_interface_0/resetdone]
connect_bd_net [get_bd_ports eth0_tx_led] [get_bd_pins nf_10g_interface_0/resetdone]
connect_bd_net [get_bd_ports eth0_rxp] [get_bd_pins nf_10g_interface_0/rxp]
connect_bd_net [get_bd_ports eth0_rxn] [get_bd_pins nf_10g_interface_0/rxn]
connect_bd_net [get_bd_ports eth0_txp] [get_bd_pins nf_10g_interface_0/txp]
connect_bd_net [get_bd_ports eth0_txn] [get_bd_pins nf_10g_interface_0/txn]
connect_bd_net [get_bd_ports eth0_abs] [get_bd_pins nf_10g_interface_0/tx_abs]
connect_bd_net [get_bd_ports eth0_tx_fault] [get_bd_pins nf_10g_interface_0/tx_fault]

connect_bd_net [get_bd_ports eth1_tx_disable] [get_bd_pins nf_10g_interface_1/tx_disable]
connect_bd_net [get_bd_ports eth1_rx_led] [get_bd_pins nf_10g_interface_1/rx_resetdone]
connect_bd_net [get_bd_ports eth1_tx_led] [get_bd_pins nf_10g_interface_1/tx_resetdone]
connect_bd_net [get_bd_ports eth1_rxp] [get_bd_pins nf_10g_interface_1/rxp]
connect_bd_net [get_bd_ports eth1_rxn] [get_bd_pins nf_10g_interface_1/rxn]
connect_bd_net [get_bd_ports eth1_txp] [get_bd_pins nf_10g_interface_1/txp]
connect_bd_net [get_bd_ports eth1_txn] [get_bd_pins nf_10g_interface_1/txn]
connect_bd_net [get_bd_ports eth1_abs] [get_bd_pins nf_10g_interface_1/tx_abs]
connect_bd_net [get_bd_ports eth1_tx_fault] [get_bd_pins nf_10g_interface_1/tx_fault]

connect_bd_net [get_bd_ports eth2_tx_disable] [get_bd_pins nf_10g_interface_2/tx_disable]
connect_bd_net [get_bd_ports eth2_rx_led] [get_bd_pins nf_10g_interface_2/rx_resetdone]
connect_bd_net [get_bd_ports eth2_tx_led] [get_bd_pins nf_10g_interface_2/tx_resetdone]
connect_bd_net [get_bd_ports eth2_rxp] [get_bd_pins nf_10g_interface_2/rxp]
connect_bd_net [get_bd_ports eth2_rxn] [get_bd_pins nf_10g_interface_2/rxn]
connect_bd_net [get_bd_ports eth2_txp] [get_bd_pins nf_10g_interface_2/txp]
connect_bd_net [get_bd_ports eth2_txn] [get_bd_pins nf_10g_interface_2/txn]
connect_bd_net [get_bd_ports eth2_abs] [get_bd_pins nf_10g_interface_2/tx_abs]
connect_bd_net [get_bd_ports eth2_tx_fault] [get_bd_pins nf_10g_interface_2/tx_fault]

connect_bd_net [get_bd_ports eth3_tx_disable] [get_bd_pins nf_10g_interface_3/tx_disable]
connect_bd_net [get_bd_ports eth3_rx_led] [get_bd_pins nf_10g_interface_3/rx_resetdone]
connect_bd_net [get_bd_ports eth3_tx_led] [get_bd_pins nf_10g_interface_3/tx_resetdone]
connect_bd_net [get_bd_ports eth3_rxp] [get_bd_pins nf_10g_interface_3/rxp]
connect_bd_net [get_bd_ports eth3_rxn] [get_bd_pins nf_10g_interface_3/rxn]
connect_bd_net [get_bd_ports eth3_txp] [get_bd_pins nf_10g_interface_3/txp]
connect_bd_net [get_bd_ports eth3_txn] [get_bd_pins nf_10g_interface_3/txn]
connect_bd_net [get_bd_ports eth3_abs] [get_bd_pins nf_10g_interface_3/tx_abs]
connect_bd_net [get_bd_ports eth3_tx_fault] [get_bd_pins nf_10g_interface_3/tx_fault]

connect_bd_net [get_bd_ports iic_reset] [get_bd_pins axi_iic_0/gpo]

connect_bd_intf_net [get_bd_intf_ports uart] [get_bd_intf_pins axi_uartlite_0/UART]
connect_bd_intf_net [get_bd_intf_ports iic_fpga] [get_bd_intf_pins axi_iic_0/IIC]

# 100MHz clock scheme - address mapped registers
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins mbsys/Clk]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_uartlite_0/s_axi_aclk] 
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_iic_0/s_axi_aclk] 
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins nf_sume_dma/m_axi_aclk] 
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/S00_ACLK] 
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/S01_ACLK] 
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/M00_ACLK] 
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/M01_ACLK] 
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/M02_ACLK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/M03_ACLK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/M04_ACLK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/M05_ACLK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/M06_ACLK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/M07_ACLK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/M08_ACLK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/M09_ACLK]
connect_bd_net [get_bd_pins nf_sume_dma/pcie_user_clk] [get_bd_pins axi_interconnect_0/M10_ACLK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/M11_ACLK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/AClk]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins input_arbiter_0/S_AXI_AClK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins nic_output_port_lookup_0/S_AXI_AClK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins output_queues_0/S_AXI_AClK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins nf_10g_interface_0/S_AXI_AClK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins nf_10g_interface_1/S_AXI_AClK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins nf_10g_interface_2/S_AXI_AClK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins nf_10g_interface_3/S_AXI_AClK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins nf_identifier_0/S_AXI_AClK]

# 160Mhz clock scheme - data stream
connect_bd_net [get_bd_pins sys_clock_0/clk_out2] [get_bd_pins nf_sume_dma/axis_aclk]
connect_bd_net [get_bd_pins sys_clock_0/clk_out2] [get_bd_pins nf_10g_interface_0/core_clk]
connect_bd_net [get_bd_pins sys_clock_0/clk_out2] [get_bd_pins nf_10g_interface_1/core_clk]
connect_bd_net [get_bd_pins sys_clock_0/clk_out2] [get_bd_pins nf_10g_interface_2/core_clk]
connect_bd_net [get_bd_pins sys_clock_0/clk_out2] [get_bd_pins nf_10g_interface_3/core_clk]

connect_bd_net [get_bd_pins sys_clock_0/clk_out2] [get_bd_pins input_arbiter_0/axis_aclk]
connect_bd_net [get_bd_pins sys_clock_0/clk_out2] [get_bd_pins nic_output_port_lookup_0/axis_aclk]
connect_bd_net [get_bd_pins sys_clock_0/clk_out2] [get_bd_pins output_queues_0/axis_aclk]

connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_uartlite_0/s_axi_aresetn] 
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_iic_0/s_axi_aresetn] 
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins mbsys/s_axi_aresetn] 
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_sume_dma/m_axi_aresetn]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_sume_dma/axis_aresetn]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_identifier_0/S_AXI_ARESETN]

connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/S00_ARESETN] 
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/S01_ARESETN] 
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M00_ARESETN] 
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M01_ARESETN] 
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M02_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M03_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M04_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M05_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M06_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M07_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M08_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M09_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M10_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M11_ARESETN]

connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_10g_interface_0/core_resetn] 
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_10g_interface_1/core_resetn] 
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_10g_interface_2/core_resetn] 
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_10g_interface_3/core_resetn] 

connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins input_arbiter_0/axis_resetn]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nic_output_port_lookup_0/axis_resetn]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins output_queues_0/axis_resetn]

connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins input_arbiter_0/S_AXI_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nic_output_port_lookup_0/S_AXI_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins output_queues_0/S_AXI_ARESETN]

connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_10g_interface_0/S_AXI_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_10g_interface_1/S_AXI_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_10g_interface_2/S_AXI_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_10g_interface_3/S_AXI_ARESETN]

#Reset module connection
connect_bd_net [get_bd_pins proc_sys_reset_0/mb_debug_sys_rst] [get_bd_pins mbsys/Debug_SYS_Rst]
connect_bd_net [get_bd_pins proc_sys_reset_0/mb_reset] [get_bd_pins mbsys/Reset]
connect_bd_net [get_bd_pins proc_sys_reset_0/bus_struct_reset] [get_bd_pins mbsys/LMB_Rst]
connect_bd_net [get_bd_pins proc_sys_reset_0/interconnect_aresetn] [get_bd_pins axi_interconnect_0/ARESETN]

#Axi-Lite bus interface connection
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins mbsys/M_AXI] 
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/S01_AXI] [get_bd_intf_pins nf_sume_dma/m_axi_lite] 
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins mbsys/S_AXI] 
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M01_AXI] [get_bd_intf_pins axi_uartlite_0/S_AXI] 
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M02_AXI] [get_bd_intf_pins axi_iic_0/S_AXI] 
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M03_AXI] [get_bd_intf_pins nf_10g_interface_0/S_AXI] 
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M04_AXI] [get_bd_intf_pins nf_10g_interface_1/S_AXI] 
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M05_AXI] [get_bd_intf_pins nf_10g_interface_2/S_AXI] 
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M06_AXI] [get_bd_intf_pins nf_10g_interface_3/S_AXI] 
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M07_AXI] [get_bd_intf_pins input_arbiter_0/S_AXI] 
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M08_AXI] [get_bd_intf_pins nic_output_port_lookup_0/S_AXI] 
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M09_AXI] [get_bd_intf_pins output_queues_0/S_AXI] 
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M10_AXI] [get_bd_intf_pins nf_sume_dma/s_axi_lite] 
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M11_AXI] [get_bd_intf_pins nf_identifier_0/S_AXI] 

connect_bd_net [get_bd_pins mbsys/In0] [get_bd_pins axi_iic_0/iic2intc_irpt]
connect_bd_net [get_bd_pins mbsys/In1] [get_bd_pins axi_uartlite_0/interrupt]

#Axi-stream data interface connection
connect_bd_intf_net [get_bd_intf_pins nf_10g_interface_0/m_axis] [get_bd_intf_pins input_arbiter_0/s_axis_0]
connect_bd_intf_net [get_bd_intf_pins nf_10g_interface_1/m_axis] [get_bd_intf_pins input_arbiter_0/s_axis_1]
connect_bd_intf_net [get_bd_intf_pins nf_10g_interface_2/m_axis] [get_bd_intf_pins input_arbiter_0/s_axis_2]
connect_bd_intf_net [get_bd_intf_pins nf_10g_interface_3/m_axis] [get_bd_intf_pins input_arbiter_0/s_axis_3]
connect_bd_intf_net [get_bd_intf_pins nf_sume_dma/m_axis] [get_bd_intf_pins input_arbiter_0/s_axis_4]

connect_bd_intf_net [get_bd_intf_pins input_arbiter_0/m_axis] [get_bd_intf_pins nic_output_port_lookup_0/s_axis]
connect_bd_intf_net [get_bd_intf_pins nic_output_port_lookup_0/m_axis] [get_bd_intf_pins output_queues_0/s_axis]

connect_bd_intf_net [get_bd_intf_pins output_queues_0/m_axis_0] [get_bd_intf_pins nf_10g_interface_0/s_axis]
connect_bd_intf_net [get_bd_intf_pins output_queues_0/m_axis_1] [get_bd_intf_pins nf_10g_interface_1/s_axis]
connect_bd_intf_net [get_bd_intf_pins output_queues_0/m_axis_2] [get_bd_intf_pins nf_10g_interface_2/s_axis]
connect_bd_intf_net [get_bd_intf_pins output_queues_0/m_axis_3] [get_bd_intf_pins nf_10g_interface_3/s_axis]
connect_bd_intf_net [get_bd_intf_pins output_queues_0/m_axis_4] [get_bd_intf_pins nf_sume_dma/s_axis]


#10G interface module connection
connect_bd_net [get_bd_pins nf_10g_interface_0/clk156_out] [get_bd_pins nf_10g_interface_1/clk156]
connect_bd_net [get_bd_pins nf_10g_interface_0/areset_clk156_out] [get_bd_pins nf_10g_interface_1/areset_clk156]
connect_bd_net [get_bd_pins nf_10g_interface_0/txusrclk_out] [get_bd_pins nf_10g_interface_1/txusrclk]
connect_bd_net [get_bd_pins nf_10g_interface_0/txusrclk2_out] [get_bd_pins nf_10g_interface_1/txusrclk2]
connect_bd_net [get_bd_pins nf_10g_interface_0/txuserrdy_out] [get_bd_pins nf_10g_interface_1/txuserrdy]
connect_bd_net [get_bd_pins nf_10g_interface_0/gttxreset_out] [get_bd_pins nf_10g_interface_1/gttxreset]
connect_bd_net [get_bd_pins nf_10g_interface_0/gtrxreset_out] [get_bd_pins nf_10g_interface_1/gtrxreset]
connect_bd_net [get_bd_pins nf_10g_interface_0/reset_counter_done_out] [get_bd_pins nf_10g_interface_1/reset_counter_done]
connect_bd_net [get_bd_pins nf_10g_interface_0/qplllock_out] [get_bd_pins nf_10g_interface_1/qplllock]
connect_bd_net [get_bd_pins nf_10g_interface_0/qplloutclk_out] [get_bd_pins nf_10g_interface_1/qplloutclk]
connect_bd_net [get_bd_pins nf_10g_interface_0/qplloutrefclk_out] [get_bd_pins nf_10g_interface_1/qplloutrefclk]

connect_bd_net [get_bd_pins nf_10g_interface_0/clk156_out] [get_bd_pins nf_10g_interface_2/clk156]
connect_bd_net [get_bd_pins nf_10g_interface_0/areset_clk156_out] [get_bd_pins nf_10g_interface_2/areset_clk156]
connect_bd_net [get_bd_pins nf_10g_interface_0/txusrclk_out] [get_bd_pins nf_10g_interface_2/txusrclk]
connect_bd_net [get_bd_pins nf_10g_interface_0/txusrclk2_out] [get_bd_pins nf_10g_interface_2/txusrclk2]
connect_bd_net [get_bd_pins nf_10g_interface_0/txuserrdy_out] [get_bd_pins nf_10g_interface_2/txuserrdy]
connect_bd_net [get_bd_pins nf_10g_interface_0/gttxreset_out] [get_bd_pins nf_10g_interface_2/gttxreset]
connect_bd_net [get_bd_pins nf_10g_interface_0/gtrxreset_out] [get_bd_pins nf_10g_interface_2/gtrxreset]
connect_bd_net [get_bd_pins nf_10g_interface_0/reset_counter_done_out] [get_bd_pins nf_10g_interface_2/reset_counter_done]
connect_bd_net [get_bd_pins nf_10g_interface_0/qplllock_out] [get_bd_pins nf_10g_interface_2/qplllock]
connect_bd_net [get_bd_pins nf_10g_interface_0/qplloutclk_out] [get_bd_pins nf_10g_interface_2/qplloutclk]
connect_bd_net [get_bd_pins nf_10g_interface_0/qplloutrefclk_out] [get_bd_pins nf_10g_interface_2/qplloutrefclk]

connect_bd_net [get_bd_pins nf_10g_interface_0/clk156_out] [get_bd_pins nf_10g_interface_3/clk156]
connect_bd_net [get_bd_pins nf_10g_interface_0/areset_clk156_out] [get_bd_pins nf_10g_interface_3/areset_clk156]
connect_bd_net [get_bd_pins nf_10g_interface_0/txusrclk_out] [get_bd_pins nf_10g_interface_3/txusrclk]
connect_bd_net [get_bd_pins nf_10g_interface_0/txusrclk2_out] [get_bd_pins nf_10g_interface_3/txusrclk2]
connect_bd_net [get_bd_pins nf_10g_interface_0/txuserrdy_out] [get_bd_pins nf_10g_interface_3/txuserrdy]
connect_bd_net [get_bd_pins nf_10g_interface_0/gttxreset_out] [get_bd_pins nf_10g_interface_3/gttxreset]
connect_bd_net [get_bd_pins nf_10g_interface_0/gtrxreset_out] [get_bd_pins nf_10g_interface_3/gtrxreset]
connect_bd_net [get_bd_pins nf_10g_interface_0/reset_counter_done_out] [get_bd_pins nf_10g_interface_3/reset_counter_done]
connect_bd_net [get_bd_pins nf_10g_interface_0/qplllock_out] [get_bd_pins nf_10g_interface_3/qplllock]
connect_bd_net [get_bd_pins nf_10g_interface_0/qplloutclk_out] [get_bd_pins nf_10g_interface_3/qplloutclk]
connect_bd_net [get_bd_pins nf_10g_interface_0/qplloutrefclk_out] [get_bd_pins nf_10g_interface_3/qplloutrefclk]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0
set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {1}] [get_bd_cells xlconstant_0]
connect_bd_net [get_bd_pins xlconstant_0/dout] [get_bd_pins nf_10g_interface_0/interface_number]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_1
set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {4}] [get_bd_cells xlconstant_1]
connect_bd_net [get_bd_pins xlconstant_1/dout] [get_bd_pins nf_10g_interface_1/interface_number]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_2
set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {16}] [get_bd_cells xlconstant_2]
connect_bd_net [get_bd_pins xlconstant_2/dout] [get_bd_pins nf_10g_interface_2/interface_number]

create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_3
set_property -dict [list CONFIG.CONST_WIDTH {8} CONFIG.CONST_VAL {64}] [get_bd_cells xlconstant_3]
connect_bd_net [get_bd_pins xlconstant_3/dout] [get_bd_pins nf_10g_interface_3/interface_number]

