proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set ACTIVE_STEP init_design
set rc [catch {
  create_msg_db init_design.pb
  set_property design_mode GateLvl [current_fileset]
  set_param project.singleFileAddWarning.threshold 0
  set_property webtalk.parent_dir /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.cache/wt [current_project]
  set_property parent.project_path /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.xpr [current_project]
  set_property ip_repo_paths /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/ip_repo [current_project]
  set_property ip_output_repo /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.cache/ip [current_project]
  set_property ip_cache_permissions {read write} [current_project]
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.runs/synth_1/top.dcp
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_xbar_0/control_sub_xbar_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_xbar_0/control_sub_xbar_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_pcie_reset_inv_0/control_sub_pcie_reset_inv_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_pcie_reset_inv_0/control_sub_pcie_reset_inv_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_dwidth_dma_tx_0/control_sub_axis_dwidth_dma_tx_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_dwidth_dma_tx_0/control_sub_axis_dwidth_dma_tx_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_dwidth_dma_rx_0/control_sub_axis_dwidth_dma_rx_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_dwidth_dma_rx_0/control_sub_axis_dwidth_dma_rx_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_fifo_10g_rx_0/control_sub_axis_fifo_10g_rx_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_fifo_10g_rx_0/control_sub_axis_fifo_10g_rx_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_fifo_10g_tx_0/control_sub_axis_fifo_10g_tx_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_fifo_10g_tx_0/control_sub_axis_fifo_10g_tx_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_nf_riffa_dma_1_0/control_sub_nf_riffa_dma_1_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_nf_riffa_dma_1_0/control_sub_nf_riffa_dma_1_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axi_clock_converter_0_0/control_sub_axi_clock_converter_0_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axi_clock_converter_0_0/control_sub_axi_clock_converter_0_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_pcie3_7x_1_0/control_sub_pcie3_7x_1_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_pcie3_7x_1_0/control_sub_pcie3_7x_1_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axi_iic_0_0/control_sub_axi_iic_0_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axi_iic_0_0/control_sub_axi_iic_0_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axi_uartlite_0_0/control_sub_axi_uartlite_0_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axi_uartlite_0_0/control_sub_axi_uartlite_0_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_clk_wiz_1_0/control_sub_clk_wiz_1_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_clk_wiz_1_0/control_sub_clk_wiz_1_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_mdm_1_0/control_sub_mdm_1_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_mdm_1_0/control_sub_mdm_1_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_microblaze_0_0/control_sub_microblaze_0_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_microblaze_0_0/control_sub_microblaze_0_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_microblaze_0_axi_intc_0/control_sub_microblaze_0_axi_intc_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_microblaze_0_axi_intc_0/control_sub_microblaze_0_axi_intc_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_xbar_1/control_sub_xbar_1.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_xbar_1/control_sub_xbar_1.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_dlmb_bram_if_cntlr_0/control_sub_dlmb_bram_if_cntlr_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_dlmb_bram_if_cntlr_0/control_sub_dlmb_bram_if_cntlr_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_dlmb_v10_0/control_sub_dlmb_v10_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_dlmb_v10_0/control_sub_dlmb_v10_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_ilmb_bram_if_cntlr_0/control_sub_ilmb_bram_if_cntlr_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_ilmb_bram_if_cntlr_0/control_sub_ilmb_bram_if_cntlr_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_ilmb_v10_0/control_sub_ilmb_v10_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_ilmb_v10_0/control_sub_ilmb_v10_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_lmb_bram_0/control_sub_lmb_bram_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_lmb_bram_0/control_sub_lmb_bram_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_microblaze_0_xlconcat_0/control_sub_microblaze_0_xlconcat_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_microblaze_0_xlconcat_0/control_sub_microblaze_0_xlconcat_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_rst_clk_wiz_1_100M_0/control_sub_rst_clk_wiz_1_100M_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_rst_clk_wiz_1_100M_0/control_sub_rst_clk_wiz_1_100M_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_s00_data_fifo_0/control_sub_s00_data_fifo_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_s00_data_fifo_0/control_sub_s00_data_fifo_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m00_data_fifo_0/control_sub_m00_data_fifo_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m00_data_fifo_0/control_sub_m00_data_fifo_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m01_data_fifo_0/control_sub_m01_data_fifo_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m01_data_fifo_0/control_sub_m01_data_fifo_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m02_data_fifo_0/control_sub_m02_data_fifo_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m02_data_fifo_0/control_sub_m02_data_fifo_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m03_data_fifo_0/control_sub_m03_data_fifo_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m03_data_fifo_0/control_sub_m03_data_fifo_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m04_data_fifo_0/control_sub_m04_data_fifo_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m04_data_fifo_0/control_sub_m04_data_fifo_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m05_data_fifo_0/control_sub_m05_data_fifo_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m05_data_fifo_0/control_sub_m05_data_fifo_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m06_data_fifo_0/control_sub_m06_data_fifo_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m06_data_fifo_0/control_sub_m06_data_fifo_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m07_data_fifo_0/control_sub_m07_data_fifo_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m07_data_fifo_0/control_sub_m07_data_fifo_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m08_data_fifo_0/control_sub_m08_data_fifo_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_m08_data_fifo_0/control_sub_m08_data_fifo_0.dcp]
  add_files -quiet /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_auto_cc_0/control_sub_auto_cc_0.dcp
  set_property netlist_only true [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_auto_cc_0/control_sub_auto_cc_0.dcp]
  add_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/control_sub.bmm
  set_property SCOPED_TO_REF control_sub [get_files -all /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/control_sub.bmm]
  add_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_microblaze_0_0/data/mb_bootloop_le.elf
  set_property SCOPED_TO_REF control_sub [get_files -all /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_microblaze_0_0/data/mb_bootloop_le.elf]
  set_property SCOPED_TO_CELLS nf_mbsys/mbsys/microblaze_0 [get_files -all /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_microblaze_0_0/data/mb_bootloop_le.elf]
  read_xdc -ref control_sub_axis_fifo_10g_rx_0 -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_fifo_10g_rx_0/control_sub_axis_fifo_10g_rx_0/control_sub_axis_fifo_10g_rx_0.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_fifo_10g_rx_0/control_sub_axis_fifo_10g_rx_0/control_sub_axis_fifo_10g_rx_0.xdc]
  read_xdc -ref control_sub_axis_fifo_10g_tx_0 -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_fifo_10g_tx_0/control_sub_axis_fifo_10g_tx_0/control_sub_axis_fifo_10g_tx_0.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_fifo_10g_tx_0/control_sub_axis_fifo_10g_tx_0/control_sub_axis_fifo_10g_tx_0.xdc]
  read_xdc -ref axis_fifo_2clk_32d_4u -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_nf_riffa_dma_1_0/ip_proj/nf_riffa_dma.srcs/sources_1/ip/axis_fifo_2clk_32d_4u/axis_fifo_2clk_32d_4u/axis_fifo_2clk_32d_4u.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_nf_riffa_dma_1_0/ip_proj/nf_riffa_dma.srcs/sources_1/ip/axis_fifo_2clk_32d_4u/axis_fifo_2clk_32d_4u/axis_fifo_2clk_32d_4u.xdc]
  read_xdc -ref control_sub_pcie3_7x_1_0 -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_pcie3_7x_1_0/source/control_sub_pcie3_7x_1_0-PCIE_X0Y1.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_pcie3_7x_1_0/source/control_sub_pcie3_7x_1_0-PCIE_X0Y1.xdc]
  read_xdc -prop_thru_buffers -ref control_sub_axi_iic_0_0 -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axi_iic_0_0/control_sub_axi_iic_0_0_board.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axi_iic_0_0/control_sub_axi_iic_0_0_board.xdc]
  read_xdc -prop_thru_buffers -ref control_sub_axi_uartlite_0_0 -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axi_uartlite_0_0/control_sub_axi_uartlite_0_0_board.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axi_uartlite_0_0/control_sub_axi_uartlite_0_0_board.xdc]
  read_xdc -ref control_sub_axi_uartlite_0_0 -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axi_uartlite_0_0/control_sub_axi_uartlite_0_0.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axi_uartlite_0_0/control_sub_axi_uartlite_0_0.xdc]
  read_xdc -prop_thru_buffers -ref control_sub_clk_wiz_1_0 -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_clk_wiz_1_0/control_sub_clk_wiz_1_0_board.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_clk_wiz_1_0/control_sub_clk_wiz_1_0_board.xdc]
  read_xdc -ref control_sub_clk_wiz_1_0 -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_clk_wiz_1_0/control_sub_clk_wiz_1_0.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_clk_wiz_1_0/control_sub_clk_wiz_1_0.xdc]
  read_xdc -ref control_sub_mdm_1_0 -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_mdm_1_0/control_sub_mdm_1_0.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_mdm_1_0/control_sub_mdm_1_0.xdc]
  read_xdc -ref control_sub_microblaze_0_0 -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_microblaze_0_0/control_sub_microblaze_0_0.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_microblaze_0_0/control_sub_microblaze_0_0.xdc]
  read_xdc -ref control_sub_microblaze_0_axi_intc_0 -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_microblaze_0_axi_intc_0/control_sub_microblaze_0_axi_intc_0.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_microblaze_0_axi_intc_0/control_sub_microblaze_0_axi_intc_0.xdc]
  read_xdc -ref control_sub_dlmb_v10_0 -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_dlmb_v10_0/control_sub_dlmb_v10_0.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_dlmb_v10_0/control_sub_dlmb_v10_0.xdc]
  read_xdc -ref control_sub_ilmb_v10_0 -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_ilmb_v10_0/control_sub_ilmb_v10_0.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_ilmb_v10_0/control_sub_ilmb_v10_0.xdc]
  read_xdc -prop_thru_buffers -ref control_sub_rst_clk_wiz_1_100M_0 -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_rst_clk_wiz_1_100M_0/control_sub_rst_clk_wiz_1_100M_0_board.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_rst_clk_wiz_1_100M_0/control_sub_rst_clk_wiz_1_100M_0_board.xdc]
  read_xdc -ref control_sub_rst_clk_wiz_1_100M_0 -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_rst_clk_wiz_1_100M_0/control_sub_rst_clk_wiz_1_100M_0.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_rst_clk_wiz_1_100M_0/control_sub_rst_clk_wiz_1_100M_0.xdc]
  read_xdc -ref bd_7ad4_xmac_0 -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/axi_10g_ethernet_nonshared/bd_0/ip/ip_0/synth/bd_7ad4_xmac_0.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/axi_10g_ethernet_nonshared/bd_0/ip/ip_0/synth/bd_7ad4_xmac_0.xdc]
  read_xdc -ref bd_7ad4_xpcs_0 -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/axi_10g_ethernet_nonshared/bd_0/ip/ip_1/synth/bd_7ad4_xpcs_0.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/axi_10g_ethernet_nonshared/bd_0/ip/ip_1/synth/bd_7ad4_xpcs_0.xdc]
  read_xdc -ref fifo_generator_status -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/fifo_generator_status/fifo_generator_status/fifo_generator_status.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/fifo_generator_status/fifo_generator_status/fifo_generator_status.xdc]
  read_xdc -ref fifo_generator_1_9 -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/fifo_generator_1_9/fifo_generator_1_9/fifo_generator_1_9.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/fifo_generator_1_9/fifo_generator_1_9/fifo_generator_1_9.xdc]
  read_xdc -ref bd_a1aa_xmac_0 -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/axi_10g_ethernet_shared/bd_0/ip/ip_0/synth/bd_a1aa_xmac_0.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/axi_10g_ethernet_shared/bd_0/ip/ip_0/synth/bd_a1aa_xmac_0.xdc]
  read_xdc -ref bd_a1aa_xpcs_0 -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/axi_10g_ethernet_shared/bd_0/ip/ip_1/synth/bd_a1aa_xpcs_0.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/axi_10g_ethernet_shared/bd_0/ip/ip_1/synth/bd_a1aa_xpcs_0.xdc]
  read_xdc -prop_thru_buffers -ref clk_wiz_ip -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/clk_wiz_ip/clk_wiz_ip_board.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/clk_wiz_ip/clk_wiz_ip_board.xdc]
  read_xdc -ref clk_wiz_ip -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/clk_wiz_ip/clk_wiz_ip.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/clk_wiz_ip/clk_wiz_ip.xdc]
  read_xdc -prop_thru_buffers -ref proc_sys_reset_ip -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/proc_sys_reset_ip/proc_sys_reset_ip_board.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/proc_sys_reset_ip/proc_sys_reset_ip_board.xdc]
  read_xdc -ref proc_sys_reset_ip -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/proc_sys_reset_ip/proc_sys_reset_ip.xdc
  set_property processing_order EARLY [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/proc_sys_reset_ip/proc_sys_reset_ip.xdc]
  read_xdc /home/zhs/NetFPGA-SUME-live-master/lib/hw/std/constraints/generic_bit.xdc
  read_xdc /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/constraints/nf_sume_general.xdc
  read_xdc /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/constraints/nf_sume_10g.xdc
  read_xdc -ref control_sub_axis_fifo_10g_rx_0 -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_fifo_10g_rx_0/control_sub_axis_fifo_10g_rx_0/control_sub_axis_fifo_10g_rx_0_clocks.xdc
  set_property processing_order LATE [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_fifo_10g_rx_0/control_sub_axis_fifo_10g_rx_0/control_sub_axis_fifo_10g_rx_0_clocks.xdc]
  read_xdc -ref control_sub_axis_fifo_10g_tx_0 -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_fifo_10g_tx_0/control_sub_axis_fifo_10g_tx_0/control_sub_axis_fifo_10g_tx_0_clocks.xdc
  set_property processing_order LATE [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axis_fifo_10g_tx_0/control_sub_axis_fifo_10g_tx_0/control_sub_axis_fifo_10g_tx_0_clocks.xdc]
  read_xdc -ref axis_fifo_2clk_32d_4u -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_nf_riffa_dma_1_0/ip_proj/nf_riffa_dma.srcs/sources_1/ip/axis_fifo_2clk_32d_4u/axis_fifo_2clk_32d_4u/axis_fifo_2clk_32d_4u_clocks.xdc
  set_property processing_order LATE [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_nf_riffa_dma_1_0/ip_proj/nf_riffa_dma.srcs/sources_1/ip/axis_fifo_2clk_32d_4u/axis_fifo_2clk_32d_4u/axis_fifo_2clk_32d_4u_clocks.xdc]
  read_xdc -ref control_sub_axi_clock_converter_0_0 -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axi_clock_converter_0_0/control_sub_axi_clock_converter_0_0_clocks.xdc
  set_property processing_order LATE [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_axi_clock_converter_0_0/control_sub_axi_clock_converter_0_0_clocks.xdc]
  read_xdc -ref control_sub_clk_wiz_1_0 -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_clk_wiz_1_0/control_sub_clk_wiz_1_0_late.xdc
  set_property processing_order LATE [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_clk_wiz_1_0/control_sub_clk_wiz_1_0_late.xdc]
  read_xdc -ref control_sub_microblaze_0_axi_intc_0 -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_microblaze_0_axi_intc_0/control_sub_microblaze_0_axi_intc_0_clocks.xdc
  set_property processing_order LATE [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_microblaze_0_axi_intc_0/control_sub_microblaze_0_axi_intc_0_clocks.xdc]
  read_xdc -ref control_sub_auto_cc_0 -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_auto_cc_0/control_sub_auto_cc_0_clocks.xdc
  set_property processing_order LATE [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/bd/control_sub/ip/control_sub_auto_cc_0/control_sub_auto_cc_0_clocks.xdc]
  read_xdc -ref bd_7ad4_xpcs_0 -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/axi_10g_ethernet_nonshared/bd_0/ip/ip_1/synth/bd_7ad4_xpcs_0_clocks.xdc
  set_property processing_order LATE [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/axi_10g_ethernet_nonshared/bd_0/ip/ip_1/synth/bd_7ad4_xpcs_0_clocks.xdc]
  read_xdc -ref fifo_generator_status -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/fifo_generator_status/fifo_generator_status/fifo_generator_status_clocks.xdc
  set_property processing_order LATE [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/fifo_generator_status/fifo_generator_status/fifo_generator_status_clocks.xdc]
  read_xdc -ref fifo_generator_1_9 -cells U0 /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/fifo_generator_1_9/fifo_generator_1_9/fifo_generator_1_9_clocks.xdc
  set_property processing_order LATE [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/fifo_generator_1_9/fifo_generator_1_9/fifo_generator_1_9_clocks.xdc]
  read_xdc -ref bd_a1aa_xpcs_0 -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/axi_10g_ethernet_shared/bd_0/ip/ip_1/synth/bd_a1aa_xpcs_0_clocks.xdc
  set_property processing_order LATE [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/axi_10g_ethernet_shared/bd_0/ip/ip_1/synth/bd_a1aa_xpcs_0_clocks.xdc]
  read_xdc -ref clk_wiz_ip -cells inst /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/clk_wiz_ip/clk_wiz_ip_late.xdc
  set_property processing_order LATE [get_files /home/zhs/NetFPGA-SUME-live-master/projects/reference_switch/hw/project/reference_switch.srcs/sources_1/ip/clk_wiz_ip/clk_wiz_ip_late.xdc]
  link_design -top top -part xc7vx690tffg1761-3
  write_hwdef -file top.hwdef
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
  unset ACTIVE_STEP 
}

start_step opt_design
set ACTIVE_STEP opt_design
set rc [catch {
  create_msg_db opt_design.pb
  opt_design -directive Explore
  write_checkpoint -force top_opt.dcp
  catch { report_drc -file top_drc_opted.rpt }
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
  unset ACTIVE_STEP 
}

start_step place_design
set ACTIVE_STEP place_design
set rc [catch {
  create_msg_db place_design.pb
  implement_debug_core 
  place_design -directive Explore
  write_checkpoint -force top_placed.dcp
  catch { report_io -file top_io_placed.rpt }
  catch { report_utilization -file top_utilization_placed.rpt -pb top_utilization_placed.pb }
  catch { report_control_sets -verbose -file top_control_sets_placed.rpt }
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
  unset ACTIVE_STEP 
}

start_step phys_opt_design
set ACTIVE_STEP phys_opt_design
set rc [catch {
  create_msg_db phys_opt_design.pb
  phys_opt_design -directive ExploreWithHoldFix
  write_checkpoint -force top_physopt.dcp
  close_msg_db -file phys_opt_design.pb
} RESULT]
if {$rc} {
  step_failed phys_opt_design
  return -code error $RESULT
} else {
  end_step phys_opt_design
  unset ACTIVE_STEP 
}

  set_msg_config -source 4 -id {Route 35-39} -severity "critical warning" -new_severity warning
start_step route_design
set ACTIVE_STEP route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design -directive Explore
  write_checkpoint -force top_routed.dcp
  catch { report_drc -file top_drc_routed.rpt -pb top_drc_routed.pb -rpx top_drc_routed.rpx }
  catch { report_methodology -file top_methodology_drc_routed.rpt -rpx top_methodology_drc_routed.rpx }
  catch { report_timing_summary -max_paths 10 -file top_timing_summary_routed.rpt -rpx top_timing_summary_routed.rpx }
  catch { report_power -file top_power_routed.rpt -pb top_power_summary_routed.pb -rpx top_power_routed.rpx }
  catch { report_route_status -file top_route_status.rpt -pb top_route_status.pb }
  catch { report_clock_utilization -file top_clock_utilization_routed.rpt }
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  write_checkpoint -force top_routed_error.dcp
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
  unset ACTIVE_STEP 
}

start_step post_route_phys_opt_design
set ACTIVE_STEP post_route_phys_opt_design
set rc [catch {
  create_msg_db post_route_phys_opt_design.pb
  phys_opt_design -directive AggressiveExplore
  write_checkpoint -force top_postroute_physopt.dcp
  catch { report_timing_summary -warn_on_violation -max_paths 10 -file top_timing_summary_postroute_physopted.rpt -rpx top_timing_summary_postroute_physopted.rpx }
  close_msg_db -file post_route_phys_opt_design.pb
} RESULT]
if {$rc} {
  step_failed post_route_phys_opt_design
  return -code error $RESULT
} else {
  end_step post_route_phys_opt_design
  unset ACTIVE_STEP 
}

start_step write_bitstream
set ACTIVE_STEP write_bitstream
set rc [catch {
  create_msg_db write_bitstream.pb
  set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
  catch { write_mem_info -force top.mmi }
  catch { write_bmm -force top_bd.bmm }
  write_bitstream -force -no_partial_bitfile top.bit 
  catch { write_sysdef -hwdef top.hwdef -bitfile top.bit -meminfo top.mmi -file top.sysdef }
  catch {write_debug_probes -quiet -force debug_nets}
  close_msg_db -file write_bitstream.pb
} RESULT]
if {$rc} {
  step_failed write_bitstream
  return -code error $RESULT
} else {
  end_step write_bitstream
  unset ACTIVE_STEP 
}

