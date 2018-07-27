#  
# Copyright (c) 2015 Digilent Inc.
# All rights reserved.
#
# File:
# nf_sume_10g_interface.tcl
#  
# Library:
# hw/std/cores/nf_sume_10g_interface_shared_logic
#
# @NETFPGA_LICENSE_HEADER_START@
#
# Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
# license agreements. See the NOTICE file distributed with this work for
# additional information regarding copyright ownership. NetFPGA licenses this
# file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
# "License"); you may not use this file except in compliance with the
# License. You may obtain a copy of the License at:
#
# http://www.netfpga-cic.org
#
# Unless required by applicable law or agreed to in writing, Work distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied. See the License for the
# specific language governing permissions and limitations under the License.
#
# @NETFPGA_LICENSE_HEADER_END@
# 

### Change Design Settings Here ###
set device 				{xc7vx690tffg1761-3}
set ip_name				{nf_sume_10g_interface_tcl}
set lib_name 			{digilent}
set vendor_name 		{digilent}
set ip_display_name 	{NetFPGA-SUME 10G Ethernet Interface}
set ip_description	 	{NetFPGA-SUME 10G Ethernet Interface}
set vendor_display_name {Digilent, Inc.}
set vendor_company_url	{http://www.digilentinc.com} 
set ip_version {1.0}

set filegroup_synthesis {verilogsynthesis}
set filegroup_simulation {verilogsimulation}
set filegroup_names [list \
	${filegroup_synthesis}\
	${filegroup_simulation}\
]

### SubCore Reference
set subcore_names {\
	ten_gig_eth_mac\
	ten_gig_eth_pcs_pma\
}

### Source Files List
# Here for all directory
set source_dir { \
	source\
	generated_source/nf_sume_10g_interface_mac/synth\
	generated_source/nf_sume_10g_interface_pcs_pma/synth\
}
# Top Module Name
set top_module_name {nf_sume_10g_interface}
set top_module_file source/$top_module_name.v

# Inferred Bus Interface
set bus_interfaces {\
	xilinx.com:interface:aximm_rtl:1.0\
	xilinx.com:interface:axis_rtl:1.0\
}

# Create Project in Memory
create_project -in_memory -part $device

# Create IP Information
set current_core [create_peripheral ${vendor_name} ${lib_name} ${ip_name} ${ip_version} -dir .]
set_property -dict [list \
	display_name		${ip_display_name}\
	description			${ip_description}\
	vendor_display_name	${vendor_display_name}\
	company_url			${vendor_company_url}\
] $current_core
ipx::open_core

# Add Filegroup
ipx::add_file_group -type verilog:synthesis ${filegroup_synthesis} [ipx::current_core] 
ipx::add_file_group -type verilog:simulation ${filegroup_simulation} [ipx::current_core]
foreach filegroup ${filegroup_names} {
	set_property model_name $top_module_name [ipx::get_file_groups ${filegroup}]
}

# Add SubCore Reference
foreach subcore ${subcore_names} {
	set subcore_regex NAME==${subcore}
	set subcore_ipdef [get_ipdefs -filter ${subcore_regex}]
	foreach filegroup ${filegroup_names} {
		ipx::add_subcore ${subcore_ipdef} [ipx::get_file_groups ${filegroup}]
	}
}

# Add Source Files
foreach src_dir ${source_dir} {
	# Construct sub-dir list
	set dirs [list $src_dir]
	set sub_src_dirs [list ]
	while {[llength $dirs]} {
		set dirs [lassign $dirs name]
		set dirs [list {*}[glob -nocomplain -directory $name -type d *] {*}$dirs]
		set sub_src_dirs [list {*}$sub_src_dirs $name]
	}
	
	# Construct Verilog Files List
	set verilog_files [list ]
	foreach dir $sub_src_dirs {
		set verilog_files [list {*}$verilog_files {*}[glob -nocomplain -directory $dir *.v]]
	}

	# Add Verilog Files to The IP Core
	foreach verilog_file $verilog_files {
		foreach filegroup ${filegroup_names} {
			ipx::add_file ${verilog_file} [ipx::get_file_groups ${filegroup}]
			set_property type verilogSource [ipx::get_files ${verilog_file} -of_objects [ipx::get_file_groups ${filegroup}]]
		}
	}
}

# Auto Generate Parameters
ipx::remove_all_hdl_parameter [ipx::current_core]
ipx::add_model_parameters_from_hdl [ipx::current_core] -top_level_hdl_file $top_module_file -top_module_name $top_module_name
ipx::infer_user_parameters [ipx::current_core]

# Add Ports
ipx::remove_all_port [ipx::current_core]
ipx::add_ports_from_hdl [ipx::current_core] -top_level_hdl_file $top_module_file -top_module_name $top_module_name

# Auto Infer Bus Interfaces
foreach bus_standard ${bus_interfaces} {
	ipx::infer_bus_interfaces ${bus_standard} [ipx::current_core]
}

write_peripheral $current_core

close_project

exit
