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
connect_bd_net [get_bd_ports reset] [get_bd_pins sys_clock_0/reset]
connect_bd_net [get_bd_ports reset] [get_bd_pins proc_sys_reset_0/ext_reset_in]

connect_bd_net [get_bd_ports fpga_sysclk_n] [get_bd_pins sysclk_buf/IBUF_DS_N]
connect_bd_net [get_bd_ports fpga_sysclk_p] [get_bd_pins sysclk_buf/IBUF_DS_P]

connect_bd_net [get_bd_pins sys_clock_0/clk_in1] [get_bd_pins sysclk_buf/IBUF_OUT]
connect_bd_net [get_bd_pins sys_clock_0/locked] [get_bd_pins proc_sys_reset_0/dcm_locked]

# 100MHz clock scheme - address mapped registers
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins nf_sim_dma/m_axi_aclk] 
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/S00_ACLK] 
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/M00_ACLK] 
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/M01_ACLK] 
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/M02_ACLK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/M03_ACLK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/M04_ACLK]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins axi_interconnect_0/AClk]
connect_bd_net [get_bd_pins sys_clock_0/clk_out1] [get_bd_pins nf_sim_datapath/s_axi_aclk]

# 160Mhz clock scheme - data stream
connect_bd_net [get_bd_pins sys_clock_0/clk_out2] [get_bd_pins nf_sim_dma/axis_aclk]
connect_bd_net [get_bd_pins sys_clock_0/clk_out2] [get_bd_pins nf_sim_interface_0/axis_aclk]
connect_bd_net [get_bd_pins sys_clock_0/clk_out2] [get_bd_pins nf_sim_interface_1/axis_aclk]
connect_bd_net [get_bd_pins sys_clock_0/clk_out2] [get_bd_pins nf_sim_interface_2/axis_aclk]
connect_bd_net [get_bd_pins sys_clock_0/clk_out2] [get_bd_pins nf_sim_interface_3/axis_aclk]

connect_bd_net [get_bd_pins sys_clock_0/clk_out2] [get_bd_pins nf_sim_datapath/axis_aclk]

connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_sim_dma/m_axi_aresetn]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_sim_dma/axis_aresetn]

connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/S00_ARESETN] 
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M00_ARESETN] 
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M01_ARESETN] 
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M02_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M03_ARESETN]
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins axi_interconnect_0/M04_ARESETN]

connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_sim_interface_0/axis_aresetn] 
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_sim_interface_1/axis_aresetn] 
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_sim_interface_2/axis_aresetn] 
connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_sim_interface_3/axis_aresetn] 

connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_sim_datapath/axis_resetn]

connect_bd_net [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins nf_sim_datapath/s_axi_aresetn]

#Reset module connection
connect_bd_net [get_bd_pins proc_sys_reset_0/interconnect_aresetn] [get_bd_pins axi_interconnect_0/ARESETN]

#Axi-Lite bus interface connection
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins nf_sim_dma/m_axi_lite] 
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins nf_sim_datapath/s_axi_lite_0]  
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M01_AXI] [get_bd_intf_pins nf_sim_datapath/s_axi_lite_1]  
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M02_AXI] [get_bd_intf_pins nf_sim_datapath/s_axi_lite_2]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M03_AXI] [get_bd_intf_pins nf_sim_datapath/s_axi_lite_3]
connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M04_AXI] [get_bd_intf_pins nf_sim_datapath/s_axi_lite_4]
 
#connect_bd_intf_net -boundary_type upper [get_bd_intf_pins axi_interconnect_0/M03_AXI] [get_bd_intf_pins identifier_ip/S_AXI] 

#Axi-stream data interface connection
connect_bd_intf_net [get_bd_intf_pins nf_sim_interface_0/m_axis] [get_bd_intf_pins nf_sim_datapath/s_axis_0]
connect_bd_intf_net [get_bd_intf_pins nf_sim_interface_1/m_axis] [get_bd_intf_pins nf_sim_datapath/s_axis_1]
connect_bd_intf_net [get_bd_intf_pins nf_sim_interface_2/m_axis] [get_bd_intf_pins nf_sim_datapath/s_axis_2]
connect_bd_intf_net [get_bd_intf_pins nf_sim_interface_3/m_axis] [get_bd_intf_pins nf_sim_datapath/s_axis_3]
connect_bd_intf_net [get_bd_intf_pins nf_sim_dma/m_axis] [get_bd_intf_pins nf_sim_datapath/s_axis_4]

connect_bd_intf_net [get_bd_intf_pins nf_sim_datapath/m_axis_0] [get_bd_intf_pins nf_sim_interface_0/s_axis]
connect_bd_intf_net [get_bd_intf_pins nf_sim_datapath/m_axis_1] [get_bd_intf_pins nf_sim_interface_1/s_axis]
connect_bd_intf_net [get_bd_intf_pins nf_sim_datapath/m_axis_2] [get_bd_intf_pins nf_sim_interface_2/s_axis]
connect_bd_intf_net [get_bd_intf_pins nf_sim_datapath/m_axis_3] [get_bd_intf_pins nf_sim_interface_3/s_axis]
connect_bd_intf_net [get_bd_intf_pins nf_sim_datapath/m_axis_4] [get_bd_intf_pins nf_sim_dma/s_axis]

# non-standard connections
# activity_stim
connect_bd_net [get_bd_pins nf_sim_dma/stim_activity_stim] [get_bd_pins activity_stim_glogic/in_pin4]
connect_bd_net [get_bd_pins nf_sim_interface_3/stim_activity_stim] [get_bd_pins activity_stim_glogic/in_pin3]
connect_bd_net [get_bd_pins nf_sim_interface_2/stim_activity_stim] [get_bd_pins activity_stim_glogic/in_pin2]
connect_bd_net [get_bd_pins nf_sim_interface_1/stim_activity_stim] [get_bd_pins activity_stim_glogic/in_pin1]
connect_bd_net [get_bd_pins nf_sim_interface_0/stim_activity_stim] [get_bd_pins activity_stim_glogic/in_pin0]
connect_bd_net [get_bd_pins activity_stim_glogic/out_bus] [get_bd_pins barrier_ip/activity_stim]

# activity_rec
connect_bd_net [get_bd_pins nf_sim_dma/rec_activity_rec] [get_bd_pins activity_rec_glogic/in_pin4]
connect_bd_net [get_bd_pins nf_sim_interface_3/rec_activity_rec] [get_bd_pins activity_rec_glogic/in_pin3]
connect_bd_net [get_bd_pins nf_sim_interface_2/rec_activity_rec] [get_bd_pins activity_rec_glogic/in_pin2]
connect_bd_net [get_bd_pins nf_sim_interface_1/rec_activity_rec] [get_bd_pins activity_rec_glogic/in_pin1]
connect_bd_net [get_bd_pins nf_sim_interface_0/rec_activity_rec] [get_bd_pins activity_rec_glogic/in_pin0]
connect_bd_net [get_bd_pins activity_rec_glogic/out_bus] [get_bd_pins barrier_ip/activity_rec]

# barrier_req
connect_bd_net [get_bd_pins nf_sim_dma/stim_barrier_req] [get_bd_pins barrier_rec_glogic/in_pin4]
connect_bd_net [get_bd_pins nf_sim_interface_3/stim_barrier_req] [get_bd_pins barrier_rec_glogic/in_pin3]
connect_bd_net [get_bd_pins nf_sim_interface_2/stim_barrier_req] [get_bd_pins barrier_rec_glogic/in_pin2]
connect_bd_net [get_bd_pins nf_sim_interface_1/stim_barrier_req] [get_bd_pins barrier_rec_glogic/in_pin1]
connect_bd_net [get_bd_pins nf_sim_interface_0/stim_barrier_req] [get_bd_pins barrier_rec_glogic/in_pin0]
connect_bd_net [get_bd_pins barrier_rec_glogic/out_bus] [get_bd_pins barrier_ip/barrier_req]

# barrier_req_trans
connect_bd_net [get_bd_pins nf_sim_dma/barrier_req_trans] [get_bd_pins barrier_ip/barrier_req_trans]

# activity_trans_sim
connect_bd_net [get_bd_pins barrier_ip/activity_trans_sim] [get_bd_pins nf_sim_dma/activity_trans_sim]

# activity_trans_log
connect_bd_net [get_bd_pins barrier_ip/activity_trans_log] [get_bd_pins nf_sim_dma/activity_trans_log]

# barrier_proceed
connect_bd_net [get_bd_pins nf_sim_dma/barrier_proceed] [get_bd_pins barrier_ip/barrier_proceed]
connect_bd_net [get_bd_pins nf_sim_dma/stim_barrier_proceed] [get_bd_pins barrier_ip/barrier_proceed]
connect_bd_net [get_bd_pins nf_sim_interface_3/stim_barrier_proceed] [get_bd_pins barrier_ip/barrier_proceed]
connect_bd_net [get_bd_pins nf_sim_interface_2/stim_barrier_proceed] [get_bd_pins barrier_ip/barrier_proceed]
connect_bd_net [get_bd_pins nf_sim_interface_1/stim_barrier_proceed] [get_bd_pins barrier_ip/barrier_proceed]
connect_bd_net [get_bd_pins nf_sim_interface_0/stim_barrier_proceed] [get_bd_pins barrier_ip/barrier_proceed]



