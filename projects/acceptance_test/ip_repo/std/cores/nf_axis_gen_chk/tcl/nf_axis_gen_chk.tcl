################################################################################
#
# Copyright (c) 2015 Digilent Inc.
# Copyright (c) 2015 Tinghui Wang (Steve)
# All rights reserved.
#
# File:
# nf_axis_gen_chk.tcl
#
# Library:
# hw/std/nf_axis_gen_chk
#
# Author:
# Tinghui Wang (Steve)
#
# Description:
# This tcl script is used to generate IP definition files for NetFPGA AXIS Packet Generator/Checker IP Core.
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
set ip_name				{nf_axis_gen_chk}
set lib_name 			{digilent}
set vendor_name 		{digilent}
set ip_display_name 	{NetFPGA AXIS Packet Generator/Checker}
set ip_description	 	{NetFPGA AXIS Packet Generator/Checker}
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
}

### Source Files List
# Here for all directory
set source_dir { \
	source\
}
# Top Module Name
set top_module_name {nf_axis_gen_chk}
set top_module_file source/$top_module_name.v

# Inferred Bus Interface
set bus_interfaces {\
	xilinx.com:interface:aximm_rtl:1.0\
	xilinx.com:interface:axis_rtl:1.0\
}

# Define IP Parameters
# page: The name of page to show the parameters
# name: parameter name in HDL
# display_name: String to display in configuration GUI
# value_validation_type: accept only 'list', 'range_long', 'pair', 'none'
# value_validation_list: List of acceptable values (valid if type is 'list')
# value_validation_range_minimum: the lower bound (valid if type is 'range_long')
# value_validation_range_maximum: the upper bound (valid if type is 'range_long')
# widget: default, comboBox
array set visible_parameter_list {
	C_CHK_PKT_SIZE { \
		page {Page 0}
		name {C_CHK_PKT_SIZE}\
		display_name {Master AXI-Stream Data Width}\
		value_validation_type range_long\
		value_validation_range_minimum 0\
		value_validation_range_maximum 32\
		widget {default}\
	}
	C_GEN_PKT_SIZE { \
		page {Page 0}
		name {C_GEN_PKT_SIZE}\
		display_name {Generate Packet Size}\
		value_validation_type range_long\
		value_validation_range_minimum 0\
		value_validation_range_maximum 32\
		widget {default}\
	}
	C_IFG_SIZE { \
		page {Page 0}
		name {C_IFG_SIZE}\
		display_name {Inter-Frame Size}\
		value_validation_type range_long\
		value_validation_range_minimum 0\
		value_validation_range_maximum 32\
		widget {default}\
	}
	C_M_AXIS_TDATA_WIDTH { \
		page {Page 0}
		name {C_M_AXIS_TDATA_WIDTH}\
		display_name {Master AXI-Stream Data Width}\
		value_validation_type list\
		value_validation_list {32 64 128 256}\
		widget {comboBox}\
	}
	C_S_AXIS_TDATA_WIDTH { \
		page {Page 0}
		name {C_S_AXIS_TDATA_WIDTH}\
		display_name {Slave AXI-Stream Data Width}\
		value_validation_type list\
		value_validation_list {32 64 128 256}\
		widget {comboBox}\
	}
}

set hidden_parameter_list {\
	C_S_AXI_DATA_WIDTH\
	C_S_AXI_ADDR_WIDTH\
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

# Add Custom Bus Interface

# Write IP Core xml to File system
write_peripheral $current_core

# Generate GUI Configuration Files
ipx::create_xgui_files [ipx::current_core]


# Hide parameters in GUI
foreach param ${hidden_parameter_list} {
	ipx::remove_user_parameter ${param} [ipx::current_core]
}

# Insert parameters with proper configurations
foreach param_name [array names visible_parameter_list] {
	set param $visible_parameter_list($param_name)
	foreach item [dict keys $param] {
		if {$item != "name" && $item != "widget" && $item != "page"} {
			puts "set_property $item [dict get $param $item]\
				 [ipx::get_user_parameters [dict get $param name] -of_objects [ipx::current_core]]"
			set_property $item [dict get $param $item]\
				 [ipx::get_user_parameters [dict get $param name] -of_objects [ipx::current_core]]
		}
	}
	ipgui::add_param -name [dict get $param name] -component [ipx::current_core]\
		-parent [ipgui::get_pagespec -name [dict get $param page] -component [ipx::current_core]]\
		-display_name [dict get $param display_name]\
		-widget [dict get $param widget]
}

# Write Changes to IP Files
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]

exit
