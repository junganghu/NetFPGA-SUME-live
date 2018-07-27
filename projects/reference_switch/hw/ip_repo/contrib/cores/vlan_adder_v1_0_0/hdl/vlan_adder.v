// Copyright (c) 2017 Neelakandan Manihatty Bojan 
// All rights reserved.
//
// This software was developed by
// Stanford University and the University of Cambridge Computer Laboratory
// under National Science Foundation under Grant No. CNS-0855268,
// the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
// by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
// as part of the DARPA MRC research programme.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
// license agreements.  See the NOTICE file distributed with this work for
// additional information regarding copyright ownership.  NetFPGA licenses this
// file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
// "License"); you may not use this file except in compliance with the
// License.  You may obtain a copy of the License at:
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

`include "vlan_adder_cpu_regs_defines.v"

module vlan_adder
#(
    parameter C_M_AXIS_DATA_WIDTH=256,
    parameter C_S_AXIS_DATA_WIDTH=256,
    parameter C_M_AXIS_TUSER_WIDTH=128,
    parameter C_S_AXIS_TUSER_WIDTH=128,
    parameter SRC_PORT_POS=16,
    parameter DST_PORT_POS=24,
 // AXI Registers Data Width
    parameter C_S_AXI_DATA_WIDTH    = 32,
    parameter C_S_AXI_ADDR_WIDTH    = 12,
    parameter C_BASEADDR            = 32'h00000000

)
(

    // Global Ports
    input axis_aclk,
    input axis_resetn,

    // Master Stream Ports (interface to data path)
    output reg  [C_M_AXIS_DATA_WIDTH - 1:0] m_axis_tdata,
    output reg [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_tkeep,
    output reg [C_M_AXIS_TUSER_WIDTH-1:0] m_axis_tuser,
    output reg m_axis_tvalid,
    input  m_axis_tready,
    output reg m_axis_tlast,

    // Slave Stream Ports (interface to RX queues)
    input [C_S_AXIS_DATA_WIDTH - 1:0] s_axis_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0] s_axis_tkeep,
    input [C_S_AXIS_TUSER_WIDTH-1:0] s_axis_tuser,
    input  s_axis_tvalid,
    output s_axis_tready,
    input  s_axis_tlast,

   input                                     S_AXI_ACLK,
   input                                     S_AXI_ARESETN,
   input       [C_S_AXI_ADDR_WIDTH-1 : 0]    S_AXI_AWADDR,
   input                                     S_AXI_AWVALID,
   input       [C_S_AXI_DATA_WIDTH-1 : 0]    S_AXI_WDATA,
   input       [C_S_AXI_DATA_WIDTH/8-1 : 0]  S_AXI_WSTRB,
   input                                     S_AXI_WVALID,
   input                                     S_AXI_BREADY,
   input       [C_S_AXI_ADDR_WIDTH-1 : 0]    S_AXI_ARADDR,
   input                                     S_AXI_ARVALID,
   input                                     S_AXI_RREADY,
   output                                    S_AXI_ARREADY,
   output      [C_S_AXI_DATA_WIDTH-1 : 0]    S_AXI_RDATA,
   output      [1 : 0]                       S_AXI_RRESP,
   output                                    S_AXI_RVALID,
   output                                    S_AXI_WREADY,
   output      [1 :0]                        S_AXI_BRESP,
   output                                    S_AXI_BVALID,
   output                                    S_AXI_AWREADY
);

   reg      [`REG_ID_BITS]    id_reg;
   reg      [`REG_VERSION_BITS]    version_reg;
   wire     [`REG_RESET_BITS]    reset_reg;
   reg      [`REG_FLIP_BITS]    ip2cpu_flip_reg;
   wire     [`REG_FLIP_BITS]    cpu2ip_flip_reg;
   reg      [`REG_PKTIN_BITS]    pktin_reg;
   wire                             pktin_reg_clear;
   reg      [`REG_PKTOUT_BITS]    pktout_reg;
   wire                             pktout_reg_clear;
   reg      [`REG_DEBUG_BITS]    ip2cpu_debug_reg;
   wire     [`REG_DEBUG_BITS]    cpu2ip_debug_reg;
   reg      [`REG_SMIN_BITS]    ip2cpu_smin_reg;
   wire     [`REG_SMIN_BITS]    cpu2ip_smin_reg;
   reg      [`REG_SMAX_BITS]    ip2cpu_smax_reg;
   wire     [`REG_SMAX_BITS]    cpu2ip_smax_reg;



   wire clear_counters;
   wire reset_registers;

 reg [3:0] ps,ns;

 wire [C_M_AXIS_DATA_WIDTH - 1:0] fifo_axis_tdata; 
 wire [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] fifo_axis_tkeep;
 wire [C_M_AXIS_TUSER_WIDTH-1:0] fifo_axis_tuser;
 wire fifo_axis_tvalid;
 wire fifo_axis_tlast;

/*
 reg [767:0] ns_tdata;
 reg [95:0]  ns_tkeep;
 reg [383:0] ns_tuser;
 reg ns_packet_ended;

 reg [767:0] tdata;
 reg [95:0] tkeep;
 reg [383:0] tuser;
 reg packet_ended;*/

 reg [543:0] ns_tdata;
 reg [67:0]  ns_tkeep;
 reg [255:0] ns_tuser;
 reg ns_packet_ended;
 reg ns_lteq64;

 reg [543:0] tdata;
 reg [67:0] tkeep;
 reg [255:0] tuser;
 reg packet_ended;
 reg lteq64;

 localparam IDLE	     = 0; // Waiting of packet
 localparam MODULE_HEADER    = 1; // Wait a cycle
 localparam IN_PACKET_START  = 2; // Adding VLAN
 localparam IN_PACKET_MIDDLE = 3; // Realigning packets
 localparam IN_PACKET_END    = 4; // If VLAN addition doesn't affect packet  (tkeep/tdata can accomodate)
 localparam NORMAL_PACKET    = 5; // If VLAN addition affects packet (need to add extra tdata/tkeep)
 localparam EXTRA_SLOT       = 6;
 localparam DROP_PACKET      = 7;
 reg in_fifo_rd_en;

   fallthrough_small_fifo
        #( .WIDTH(C_M_AXIS_DATA_WIDTH+C_M_AXIS_TUSER_WIDTH+C_M_AXIS_DATA_WIDTH/8+1),
           .MAX_DEPTH_BITS(2))
      input_fifo
        (// Outputs
         .dout                           ({fifo_axis_tlast, fifo_axis_tuser, fifo_axis_tkeep, fifo_axis_tdata}),
         .full                           (),
         .nearly_full                    (in_fifo_nearly_full),
         .prog_full                      (),
         .empty                          (in_fifo_empty),
         // Inputs
         .din                            ({s_axis_tlast, s_axis_tuser, s_axis_tkeep, s_axis_tdata}),
         .wr_en                          (s_axis_tvalid & ~in_fifo_nearly_full),
         .rd_en                          (in_fifo_rd_en),
         .reset                          (~axis_resetn),
	 .clk (axis_aclk));


 assign s_axis_tready = !in_fifo_nearly_full;

 //assign in_fifo_rd_en = m_axis_tready && !in_fifo_empty;
 //assign m_axis_tvalid = !in_fifo_empty;

 //assign addr_rd = fifo_axis_tdata[127:112];
 

   always @(*) begin
      ns = ps;
      ns_tdata  =  tdata;
      ns_tuser  =  tuser;
      ns_tkeep  =  tkeep;
      in_fifo_rd_en = 'b0; 
      m_axis_tdata  = 'd0;
      m_axis_tkeep  = 'd0;
      m_axis_tvalid = 'd0;
      m_axis_tuser  = 'd0;
      m_axis_tlast  = 'd0;

      ns_packet_ended = packet_ended;
      ns_lteq64 = lteq64;
      in_fifo_rd_en = 'd0;

  
      case(ps)

		
	 MODULE_HEADER: begin//{

		if(~in_fifo_empty && ((fifo_axis_tuser[23:16]==8'h10) || (fifo_axis_tuser[23:16]==8'h40))) begin//{
               			in_fifo_rd_en = 'b1 ; 
	                	//ns_tdata = {256'd0,fifo_axis_tdata[255:96],8'b0,4'b0110,4'b0,16'h0081,fifo_axis_tdata[95:0]};
	                	ns_tdata = {256'd0,fifo_axis_tdata[255:96],ip2cpu_smin_reg[15:0],16'h0081,fifo_axis_tdata[95:0]};
		        	ns_tkeep = {32'd0,fifo_axis_tkeep[31:12],4'b1111,fifo_axis_tkeep[11:0]}; // should be in the middle
            	        	
				//ns_tuser = {128'd0,fifo_axis_tuser[127:16],fifo_axis_tuser[15:0]+'d4};
            	        	ns_tuser = {128'd0,fifo_axis_tuser[127:16],fifo_axis_tuser[15:0]+16'd4};
	
	      	        	//ns_packet_ended= 'b0;
				ns = IN_PACKET_START;

				end//}
		else if(~in_fifo_empty && ((fifo_axis_tuser[23:16]==8'h01) || (fifo_axis_tuser[23:16]==8'h04))) begin//{
				ns = NORMAL_PACKET;	
				end//}	
			end//}


         IN_PACKET_START: begin//{
		    if(~in_fifo_empty) begin//{

	               in_fifo_rd_en = 'b1 ; 
	               ns_tdata =  {fifo_axis_tdata,tdata[287:0]}; // 544-(256+(32+256)) = 0 bits (Remaining)
		       ns_tkeep =  {fifo_axis_tkeep,tkeep[35:0]};   //  64-(32+(4+32)) = 0 bits (Remaining)
            	       ns_tuser =  {fifo_axis_tuser,tuser[128:0]};        
		       ns = IN_PACKET_MIDDLE; 
		       if(fifo_axis_tlast) begin//{
	               		ns_packet_ended = 'b1;
	            		end//}
			end//}
		end//}

         IN_PACKET_MIDDLE: begin//{

		m_axis_tvalid = (packet_ended)?'b1:!in_fifo_empty;
		if (m_axis_tvalid && m_axis_tready) begin//{
			in_fifo_rd_en = (packet_ended)?'b0: 'b1;
			m_axis_tdata = tdata [255:0]; 
			m_axis_tkeep = tkeep [31:0];
			m_axis_tuser = tuser [127:0];


			ns_tdata = (packet_ended)? {256'd0,tdata[543:256]}:{fifo_axis_tdata,tdata[543:256]};  // Already removed 256 bits (above)
		        ns_tkeep = (packet_ended)? {32'd0,tkeep[67:32]}:{fifo_axis_tkeep,tkeep[67:32]};
            	        ns_tuser = (packet_ended)? {128'd0,tuser[255:129]}:{fifo_axis_tuser,tuser[255:129]};

			if (packet_ended) begin//{
					ns=IN_PACKET_END;
					ns_packet_ended = 'b0; // lifetime finished.
					ns_lteq64='b1; // less than or equal to 64 bytes packet
				end//}
			else if (fifo_axis_tlast) begin//{
					ns=IN_PACKET_END;
				end//}
	
			end//}

		end//}


	  IN_PACKET_END: begin//{
		m_axis_tvalid = 'b1;

		if (m_axis_tready) begin//{
		
			m_axis_tdata = tdata [255:0]; 
			m_axis_tkeep = tkeep [31:0];
			m_axis_tuser = tuser [127:0];

			ns_tdata = (tkeep[67:32]!='b0) ? {256'd0,tdata[543:256]}:'b0;   
	        	ns_tkeep = (tkeep[67:32]!='b0) ? {32'd0,tkeep[67:32]}:'b0; 
                	ns_tuser = (tkeep[67:32]!='b0) ? {128'd0,tuser[255:128]}:'b0;
			m_axis_tlast = (tkeep[67:32] !='b0) ? 'b0 : 'b1;
			ns = (tkeep[67:32] !='b0)? IN_PACKET_END : MODULE_HEADER;	
			end//}	
		end//}

	   EXTRA_SLOT: begin//{

		m_axis_tvalid = 'b1;
		if (m_axis_tready) begin//{
			m_axis_tdata = tdata [255:0]; 
			m_axis_tkeep = tkeep [31:0]; 
			m_axis_tuser = tuser [127:0];
			m_axis_tlast = 'b1;
			ns = MODULE_HEADER;	
			end//}	
		end//}

           NORMAL_PACKET: begin
              m_axis_tvalid = !in_fifo_empty;
              m_axis_tdata = fifo_axis_tdata;
              m_axis_tuser = fifo_axis_tuser;
              m_axis_tkeep = fifo_axis_tkeep;
              m_axis_tlast = fifo_axis_tlast;
              in_fifo_rd_en = m_axis_tvalid && m_axis_tready;
              if(m_axis_tvalid && m_axis_tlast && m_axis_tready) begin
                 ns = MODULE_HEADER;
              end
           end



		
      endcase
   end

   always @(posedge axis_aclk) begin
      if(~axis_resetn) begin

         tdata    <=   'b0 ;
         tuser    <=   'b0 ;
         tkeep    <=   'b0 ;
	 packet_ended <= 'b0;
	 lteq64 <= 'b0;
	 ps <= MODULE_HEADER;	
        end
      else begin

	 tdata   	      <=   ns_tdata   ;
	 tuser   	      <=   ns_tuser   ;
	 tkeep   	      <=   ns_tkeep   ;
	 packet_ended 	      <= ns_packet_ended ;
	 lteq64 <= ns_lteq64;
	 ps <= ns;
      end
   end


//Registers section
 vlan_adder_cpu_regs
 #(
   .C_BASE_ADDRESS        (C_BASEADDR),
   .C_S_AXI_DATA_WIDTH (C_S_AXI_DATA_WIDTH),
   .C_S_AXI_ADDR_WIDTH (C_S_AXI_ADDR_WIDTH)
 ) va_cpu_regs_inst
 (
   // General ports
    .clk                    (axis_aclk),
    .resetn                 (axis_resetn),
   // AXI Lite ports
    .S_AXI_ACLK             (S_AXI_ACLK),
    .S_AXI_ARESETN          (S_AXI_ARESETN),
    .S_AXI_AWADDR           (S_AXI_AWADDR),
    .S_AXI_AWVALID          (S_AXI_AWVALID),
    .S_AXI_WDATA            (S_AXI_WDATA),
    .S_AXI_WSTRB            (S_AXI_WSTRB),
    .S_AXI_WVALID           (S_AXI_WVALID),
    .S_AXI_BREADY           (S_AXI_BREADY),
    .S_AXI_ARADDR           (S_AXI_ARADDR),
    .S_AXI_ARVALID          (S_AXI_ARVALID),
    .S_AXI_RREADY           (S_AXI_RREADY),
    .S_AXI_ARREADY          (S_AXI_ARREADY),
    .S_AXI_RDATA            (S_AXI_RDATA),
    .S_AXI_RRESP            (S_AXI_RRESP),
    .S_AXI_RVALID           (S_AXI_RVALID),
    .S_AXI_WREADY           (S_AXI_WREADY),
    .S_AXI_BRESP            (S_AXI_BRESP),
    .S_AXI_BVALID           (S_AXI_BVALID),
    .S_AXI_AWREADY          (S_AXI_AWREADY),


   // Register ports
   .id_reg          (id_reg),
   .version_reg          (version_reg),
   .reset_reg          (reset_reg),
   .ip2cpu_flip_reg          (ip2cpu_flip_reg),
   .cpu2ip_flip_reg          (cpu2ip_flip_reg),
   .pktin_reg          (pktin_reg),
   .pktin_reg_clear    (pktin_reg_clear),
   .pktout_reg          (pktout_reg),
   .pktout_reg_clear    (pktout_reg_clear),
   .ip2cpu_debug_reg          (ip2cpu_debug_reg),
   .cpu2ip_debug_reg          (cpu2ip_debug_reg),
   .ip2cpu_smin_reg          (ip2cpu_smin_reg),
   .cpu2ip_smin_reg          (cpu2ip_smin_reg),
   .ip2cpu_smax_reg          (ip2cpu_smax_reg),
   .cpu2ip_smax_reg          (cpu2ip_smax_reg),
 

   // Global Registers - user can select if to use
   .cpu_resetn_soft(),//software reset, after cpu module
   .resetn_soft    (),//software reset to cpu module (from central reset management)
   .resetn_sync    (resetn_sync)//synchronized reset, use for better timing
);

   assign clear_counters = reset_reg[0];
   assign reset_registers = reset_reg[4];

////registers logic, current logic is just a placeholder for initial compil, required to be changed by the user
always @(posedge axis_aclk)
        if (~resetn_sync | reset_registers) begin
                id_reg <= #1    `REG_ID_DEFAULT;
                version_reg <= #1    `REG_VERSION_DEFAULT;
                ip2cpu_flip_reg <= #1    `REG_FLIP_DEFAULT;
                pktin_reg <= #1    `REG_PKTIN_DEFAULT;
                pktout_reg <= #1    `REG_PKTOUT_DEFAULT;
                ip2cpu_debug_reg <= #1    `REG_DEBUG_DEFAULT;
                ip2cpu_smin_reg <= #1    `REG_SMIN_DEFAULT;
                ip2cpu_smax_reg <= #1    `REG_SMAX_DEFAULT;
        end
        else begin
                id_reg <= #1    `REG_ID_DEFAULT;
                version_reg <= #1    `REG_VERSION_DEFAULT;
                ip2cpu_flip_reg <= #1    ~cpu2ip_flip_reg;
                pktin_reg[`REG_PKTIN_WIDTH -2: 0] <= #1  clear_counters | pktin_reg_clear ? 'h0  : pktin_reg[`REG_PKTIN_WIDTH-2:0] + (s_axis_tlast && s_axis_tvalid && s_axis_tready) ;
                pktin_reg[`REG_PKTIN_WIDTH-1] <= #1 clear_counters | pktin_reg_clear ? 1'h0 : pktin_reg_clear ? 'h0  : pktin_reg[`REG_PKTIN_WIDTH-2:0] + (s_axis_tlast && s_axis_tvalid && s_axis_tready)
                                                     > {(`REG_PKTIN_WIDTH-1){1'b1}} ? 1'b1 : pktin_reg[`REG_PKTIN_WIDTH-1];

                pktout_reg [`REG_PKTOUT_WIDTH-2:0]<= #1  clear_counters | pktout_reg_clear ? 'h0  : pktout_reg [`REG_PKTOUT_WIDTH-2:0] + (m_axis_tlast && m_axis_tvalid && m_axis_tready) ;
                pktout_reg [`REG_PKTOUT_WIDTH-1]<= #1  clear_counters | pktout_reg_clear ? 'h0  : pktout_reg [`REG_PKTOUT_WIDTH-2:0] + (m_axis_tlast && m_axis_tvalid && m_axis_tready)  > {(`REG_PKTOUT_WIDTH-1){1'b1}} ?
                                                                1'b1 : pktout_reg [`REG_PKTOUT_WIDTH-1];
                ip2cpu_debug_reg <= #1    `REG_DEBUG_DEFAULT+cpu2ip_debug_reg;
                ip2cpu_smin_reg <= #1    cpu2ip_smin_reg;
                ip2cpu_smax_reg <= #1    cpu2ip_smax_reg;
        end




endmodule
