//
// Copyright (c) 2015-2016 Jong Hun Han
// All rights reserved
//
// This software was developed by Stanford University and the University of
// Cambridge Computer Laboratory under National Science Foundation under Grant
// No. CNS-0855268, the University of Cambridge Computer Laboratory under EPSRC
// INTERNET Project EP/H040536/1 and by the University of Cambridge Computer
// Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), as part of
// the DARPA MRC research programme.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor license
// agreements.  See the NOTICE file distributed with this work for additional
// information regarding copyright ownership.  NetFPGA licenses this file to you
// under the NetFPGA Hardware-Software License, Version 1.0 (the "License"); you
// may not use this file except in compliance with the License.  You may obtain
// a copy of the License at:
//
//   http://www.netfpga-cic.org
//
// Unless required by applicable law or agreed to in writing, Work distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@

`timescale 1ns/1ps

`include "../../../../../../../lib/hw/contrib/cores/nf_sume_blueswitch_v1_0_0/hdl/verilog/nf_sume_blueswitch_register_define.v"
`include "../../../../../../../lib/hw/contrib/cores/nf_sume_blueswitch_v1_0_0/hdl/verilog/nf_sume_blueswitch_parameter_define.v"

module system_wrapper_tb();

reg axis_aclk;
reg axis_rstn;

integer i;

initial begin
   axis_aclk   = 1'b0;
   $display("[%t] : System Reset Asserted...", $realtime);
   axis_rstn = 1'b0;
   for (i = 0; i < 50; i = i + 1) begin
      @(posedge axis_aclk);
   end
   $display("[%t] : System Reset De-asserted...", $realtime);
   axis_rstn = 1'b1;
end

always #3 axis_aclk = ~axis_aclk;//156.25MHz

system system_i
       (.axi_aclk(axis_aclk),
        .axi_rstn(axis_rstn),
        .axis_aclk(axis_aclk),
        .axis_rstn(axis_rstn));

wire CLK = axis_aclk;
wire RESETn = axis_rstn;

//simulation reference counter 
reg	[31:0]	enable_count;
always @(posedge CLK)
	if (~RESETn) begin
		enable_count	<= 0;
	end
	else if (enable_count < 100000) begin
		enable_count	<= enable_count + 1;
	end


endmodule
