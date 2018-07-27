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
//

// CBG Orangepath HPR L/S System

// Verilog output file generated at 29/09/2016 19:08:56
// Kiwi Scientific Acceleration (KiwiC .net/CIL/C# to Verilog/SystemC compiler): Version alpha 0.2.16f : 22nd-September-2016 Unix 3.19.0.64
//  /root/kiwi/kiwipro/kiwic/distro/lib/kiwic.exe emu_ICMP_echo.dll -bevelab-default-pause-mode=hard -vnl-resets=synchronous -vnl-roundtrip=disable -res2-loadstore-port-count=0 -restructure2=disable -conerefine=enable -vnl emu_ICMP_echo.v
`timescale 1ns/1ns


module Emu(    input [63:0] s_axis_tdata,
    input [7:0] s_axis_tkeep,
    input s_axis_tlast,
    input s_axis_tvalid,
    output reg s_axis_tready,
    input [63:0] s_axis_tuser_hi,
    input [63:0] s_axis_tuser_low,
    output reg [63:0] m_axis_tdata,
    output reg [7:0] m_axis_tkeep,
    output reg m_axis_tlast,
    output reg m_axis_tvalid,
    input m_axis_tready,
    output reg [63:0] m_axis_tuser_hi,
    output reg [63:0] m_axis_tuser_low,
    input cam_busy,
    input cam_match,
    input [7:0] cam_match_addr,
    output reg [63:0] cam_cmp_din,
    output reg [63:0] cam_din,
    output reg cam_we,
    output reg [7:0] cam_wr_addr,
    output reg [31:0] debug_reg,
    input clk,
    input reset);
function  rtl_unsigned_bitextract4;
   input [31:0] arg;
   rtl_unsigned_bitextract4 = $unsigned(arg[0:0]);
   endfunction

function [7:0] rtl_unsigned_bitextract3;
   input [63:0] arg;
   rtl_unsigned_bitextract3 = $unsigned(arg[7:0]);
   endfunction

function  rtl_unsigned_bitextract1;
   input [31:0] arg;
   rtl_unsigned_bitextract1 = $unsigned(arg[0:0]);
   endfunction

function [7:0] rtl_unsigned_bitextract0;
   input [31:0] arg;
   rtl_unsigned_bitextract0 = $unsigned(arg[7:0]);
   endfunction

function signed [31:0] rtl_sign_extend2;
   input argbit;
   rtl_sign_extend2 = { {32{argbit}} };
   endfunction

  reg Emu_IPv4;
  reg Emu_proto_UDP;
  reg Emu_proto_ICMP;
  reg [63:0] Emu_chksum_UDP;
  reg [31:0] TEIC1_1_V_4;
  reg [31:0] TEIC1_1_V_10;
  reg TEIC1_1_V_12;
  reg TEIC1_1_V_13;
  reg TEIC1_1_V_14;
  reg TEIC1_1_V_18;
  reg [31:0] TERe1_1_V_0;
  reg [31:0] TERe1_1_V_1;
  reg TERe1_1_V_2;
  reg [63:0] TERe1_1_V_3;
  reg [7:0] TERe1_1_V_4;
  reg [7:0] Emu_magic_num;
  reg [7:0] Emu_opcode;
  reg [63:0] Emu_ICMP_code_type;
  reg [63:0] TEIC1_1_V_0;
  reg [63:0] TEca6_0_V_1;
  reg [63:0] TEca6_0_V_6;
  reg [63:0] TEca6_0_V_7;
  reg [63:0] TEca6_0_V_9;
  reg [7:0] TEca6_0_V_0;
  reg TEsw8_2_V_1;
  reg TEsw8_2_V_2;
  reg [63:0] Emu_dst_mac;
  reg [63:0] Emu_src_mac;
  reg [63:0] TEsw8_2_V_0;
  reg [63:0] Emu_dst_ip;
  reg [63:0] Emu_src_ip;
  reg [63:0] Emu_app_src_port;
  reg [63:0] Emu_app_dst_port;
  reg [63:0] Emu_tmp;
  reg [63:0] Emu_tmp1;
  reg [63:0] Emu_tmp2;
  reg [63:0] Emu_tmp3;
  reg [63:0] Emu_src_port;
  reg [63:0] TEca12_5_V_4;
  reg [63:0] TEca12_5_V_5;
  reg [63:0] TEca12_5_V_7;
  reg [31:0] TESe15_3_V_0;
  reg [63:0] TEIC1_1_V_2;
  reg [63:0] TEIC1_1_V_3;
  reg [7:0] A_8_US_CC_SCALbx16_ARA0[255:0];
  reg [63:0] A_64_US_CC_SCALbx14_ARC0[255:0];
  reg [63:0] A_64_US_CC_SCALbx12_ARB0[255:0];
  reg [63:0] A_64_US_CC_SCALbx10_ARA0[255:0];
  reg [24:0] xpc10;
  wire [63:0] hprpin95010;
  wire [63:0] hprpin95410;
  wire [63:0] hprpin96310;
  wire [63:0] hprpin103610;
  wire [63:0] hprpin104010;
  wire [63:0] hprpin104910;
 always   @(posedge clk )  begin 
      //Start structure HPR anontop
      if (reset)  begin 
               debug_reg <= 32'd0;
               cam_wr_addr <= 32'd0;
               cam_we <= 32'd0;
               cam_din <= 64'd0;
               cam_cmp_din <= 64'd0;
               TERe1_1_V_4 <= 32'd0;
               TERe1_1_V_3 <= 64'd0;
               TERe1_1_V_2 <= 32'd0;
               TERe1_1_V_1 <= 32'd0;
               TERe1_1_V_0 <= 32'd0;
               Emu_opcode <= 32'd0;
               Emu_magic_num <= 32'd0;
               Emu_ICMP_code_type <= 64'd0;
               Emu_app_dst_port <= 64'd0;
               Emu_app_src_port <= 64'd0;
               Emu_dst_ip <= 64'd0;
               Emu_src_ip <= 64'd0;
               TEIC1_1_V_3 <= 64'd0;
               TEIC1_1_V_2 <= 64'd0;
               Emu_src_port <= 64'd0;
               Emu_src_mac <= 64'd0;
               Emu_dst_mac <= 64'd0;
               TEIC1_1_V_0 <= 64'd0;
               TEIC1_1_V_14 <= 32'd0;
               TEIC1_1_V_13 <= 32'd0;
               TEIC1_1_V_12 <= 32'd0;
               TEca6_0_V_7 <= 64'd0;
               TEca6_0_V_6 <= 64'd0;
               TEIC1_1_V_18 <= 32'd0;
               TEca6_0_V_1 <= 64'd0;
               TEca6_0_V_0 <= 32'd0;
               TEca6_0_V_9 <= 64'd0;
               TEsw8_2_V_2 <= 32'd0;
               TEsw8_2_V_1 <= 32'd0;
               TEsw8_2_V_0 <= 64'd0;
               Emu_tmp <= 64'd0;
               Emu_tmp3 <= 64'd0;
               s_axis_tready <= 32'd0;
               TEIC1_1_V_10 <= 32'd0;
               Emu_proto_ICMP <= 32'd0;
               Emu_proto_UDP <= 32'd0;
               Emu_IPv4 <= 32'd0;
               m_axis_tvalid <= 32'd0;
               TESe15_3_V_0 <= 32'd0;
               m_axis_tuser_low <= 64'd0;
               m_axis_tuser_hi <= 64'd0;
               m_axis_tlast <= 32'd0;
               m_axis_tkeep <= 32'd0;
               m_axis_tdata <= 64'd0;
               TEca12_5_V_5 <= 64'd0;
               TEca12_5_V_4 <= 64'd0;
               TEca12_5_V_7 <= 64'd0;
               Emu_tmp1 <= 64'd0;
               xpc10 <= 32'd0;
               Emu_tmp2 <= 64'd0;
               TEIC1_1_V_4 <= 32'd0;
               Emu_chksum_UDP <= 64'd0;
               end 
               else 
          case (xpc10)
              25'sd0/*0:xpc10*/:  begin 
                   xpc10 <= 25'sd1/*1:xpc10*/;
                   s_axis_tready <= 1'h1;
                   m_axis_tuser_low <= 64'h0;
                   m_axis_tuser_hi <= 64'h0;
                   m_axis_tvalid <= 1'h0;
                   m_axis_tlast <= 1'h0;
                   m_axis_tkeep <= 8'h0;
                   m_axis_tdata <= 64'h0;
                   TEIC1_1_V_18 <= 1'h0;
                   TEIC1_1_V_14 <= 1'h0;
                   TEIC1_1_V_13 <= 1'h0;
                   TEIC1_1_V_12 <= 1'h0;
                   TEIC1_1_V_10 <= 32'h0;
                   TEIC1_1_V_4 <= 32'h0;
                   Emu_chksum_UDP <= 64'h0;
                   Emu_proto_ICMP <= 1'h0;
                   Emu_proto_UDP <= 1'h0;
                   Emu_IPv4 <= 1'h0;
                   debug_reg <= 32'h0;
                   cam_wr_addr <= 8'h0;
                   cam_we <= 1'h0;
                   cam_din <= 64'h0;
                   cam_cmp_din <= 64'h_ffff_ffff_ffff_ffff;
                   end 
                  
              25'sd1/*1:xpc10*/:  begin 
                  if (s_axis_tvalid && s_axis_tlast)  begin 
                           xpc10 <= 25'sd2/*2:xpc10*/;
                           s_axis_tready <= 1'h0;
                           TERe1_1_V_2 <= 1'h0;
                           TERe1_1_V_1 <= 32'h0;
                           TERe1_1_V_0 <= 32'h1;
                           TERe1_1_V_4 <= 8'h0;
                           TERe1_1_V_3 <= 64'h0;
                           A_64_US_CC_SCALbx10_ARA0[32'h0] <= s_axis_tuser_low;
                           A_64_US_CC_SCALbx12_ARB0[32'h0] <= s_axis_tuser_hi;
                           A_8_US_CC_SCALbx16_ARA0[32'h0] <= rtl_unsigned_bitextract0(s_axis_tkeep);
                           A_64_US_CC_SCALbx14_ARC0[32'h0] <= s_axis_tdata;
                           end 
                          if (s_axis_tvalid && !s_axis_tlast)  begin 
                           xpc10 <= 25'sd2/*2:xpc10*/;
                           s_axis_tready <= 1'h1;
                           TERe1_1_V_2 <= rtl_unsigned_bitextract1(s_axis_tvalid);
                           TERe1_1_V_1 <= 32'h0;
                           TERe1_1_V_0 <= 32'h1;
                           TERe1_1_V_4 <= 8'h0;
                           TERe1_1_V_3 <= 64'h0;
                           A_64_US_CC_SCALbx10_ARA0[32'h0] <= s_axis_tuser_low;
                           A_64_US_CC_SCALbx12_ARB0[32'h0] <= s_axis_tuser_hi;
                           A_8_US_CC_SCALbx16_ARA0[32'h0] <= rtl_unsigned_bitextract0(s_axis_tkeep);
                           A_64_US_CC_SCALbx14_ARC0[32'h0] <= s_axis_tdata;
                           end 
                          if (!s_axis_tvalid)  begin 
                           xpc10 <= 25'sd2/*2:xpc10*/;
                           TERe1_1_V_2 <= 1'h1;
                           TERe1_1_V_0 <= 32'h0;
                           TERe1_1_V_4 <= 8'h0;
                           TERe1_1_V_3 <= 64'h0;
                           TERe1_1_V_1 <= 32'h0;
                           end 
                           end 
                  
              25'sd2/*2:xpc10*/:  begin 
                  if (s_axis_tvalid && s_axis_tlast && TERe1_1_V_2)  begin 
                           s_axis_tready <= 1'h0;
                           TERe1_1_V_2 <= 1'h0;
                           TERe1_1_V_1 <= TERe1_1_V_0;
                           TERe1_1_V_0 <= $unsigned(32'd1+TERe1_1_V_0);
                           A_64_US_CC_SCALbx10_ARA0[TERe1_1_V_0] <= s_axis_tuser_low;
                           A_64_US_CC_SCALbx12_ARB0[TERe1_1_V_0] <= s_axis_tuser_hi;
                           A_8_US_CC_SCALbx16_ARA0[TERe1_1_V_0] <= rtl_unsigned_bitextract0(s_axis_tkeep);
                           A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_0] <= s_axis_tdata;
                           end 
                          if (s_axis_tvalid && !s_axis_tlast && TERe1_1_V_2)  begin 
                           s_axis_tready <= 1'h1;
                           TERe1_1_V_2 <= rtl_unsigned_bitextract1(s_axis_tvalid);
                           TERe1_1_V_1 <= TERe1_1_V_0;
                           TERe1_1_V_0 <= $unsigned(32'd1+TERe1_1_V_0);
                           A_64_US_CC_SCALbx10_ARA0[TERe1_1_V_0] <= s_axis_tuser_low;
                           A_64_US_CC_SCALbx12_ARB0[TERe1_1_V_0] <= s_axis_tuser_hi;
                           A_8_US_CC_SCALbx16_ARA0[TERe1_1_V_0] <= rtl_unsigned_bitextract0(s_axis_tkeep);
                           A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_0] <= s_axis_tdata;
                           end 
                          if (!TERe1_1_V_2)  begin 
                           xpc10 <= 25'sd4/*4:xpc10*/;
                           TERe1_1_V_4 <= rtl_unsigned_bitextract0(A_8_US_CC_SCALbx16_ARA0[TERe1_1_V_1]);
                           TERe1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_1]);
                           end 
                           end 
                  
              25'sd4/*4:xpc10*/:  begin 
                  
                  case (TERe1_1_V_4)
                      32'sd3/*3:TERe1.1_V_4*/:  begin 
                           xpc10 <= 25'sd8/*8:xpc10*/;
                           A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_1] <= 64'sh_ffff&TERe1_1_V_3;
                           end 
                          
                      32'sd7/*7:TERe1.1_V_4*/:  begin 
                           xpc10 <= 25'sd8/*8:xpc10*/;
                           A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_1] <= 64'shff_ffff&TERe1_1_V_3;
                           end 
                          
                      32'sd15/*15:TERe1.1_V_4*/:  begin 
                           xpc10 <= 25'sd8/*8:xpc10*/;
                           A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_1] <= 64'h_ffff_ffff&TERe1_1_V_3;
                           end 
                          
                      32'sd31/*31:TERe1.1_V_4*/:  begin 
                           xpc10 <= 25'sd8/*8:xpc10*/;
                           A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_1] <= 64'shff_ffff_ffff&TERe1_1_V_3;
                           end 
                          
                      32'sd63/*63:TERe1.1_V_4*/:  begin 
                           xpc10 <= 25'sd8/*8:xpc10*/;
                           A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_1] <= 64'sh_ffff_ffff_ffff&TERe1_1_V_3;
                           end 
                          endcase
                  if (((TERe1_1_V_4==32'sd127/*127:TERe1.1_V_4*/)? 1'd1: (TERe1_1_V_4!=32'sd7/*7:TERe1.1_V_4*/) && (TERe1_1_V_4!=32'sd15
                  /*15:TERe1.1_V_4*/) && (TERe1_1_V_4!=32'sd31/*31:TERe1.1_V_4*/) && (TERe1_1_V_4!=32'sd63/*63:TERe1.1_V_4*/) && (TERe1_1_V_4
                  !=32'sd1/*1:TERe1.1_V_4*/) && (TERe1_1_V_4!=32'sd2/*2:TERe1.1_V_4*/) && (TERe1_1_V_4!=32'sd3/*3:TERe1.1_V_4*/)))  xpc10
                       <= 25'sd8/*8:xpc10*/;

                      if ((TERe1_1_V_4==32'sd127/*127:TERe1.1_V_4*/))  A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_1] <= 64'shff_ffff_ffff_ffff
                      &TERe1_1_V_3;

                      if ((TERe1_1_V_4==32'sd1/*1:TERe1.1_V_4*/) || (TERe1_1_V_4==32'sd2/*2:TERe1.1_V_4*/))  xpc10 <= 25'sd8/*8:xpc10*/;
                      if ((TERe1_1_V_4==32'sd1/*1:TERe1.1_V_4*/))  A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_1] <= 64'shff&TERe1_1_V_3;
                       end 
                  
              25'sd8/*8:xpc10*/:  begin 
                   xpc10 <= 25'sd16/*16:xpc10*/;
                   TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[32'h0]);
                   TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[32'h0]);
                   TEIC1_1_V_4 <= 32'h0;
                   TEIC1_1_V_10 <= TERe1_1_V_1;
                   TERe1_1_V_0 <= 32'h0;
                   s_axis_tready <= 1'h0;
                   end 
                  
              25'sd16/*16:xpc10*/:  begin 
                  if ((32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd4/*4:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_ICMP_code_type <= 64'sh_ffff&(TEIC1_1_V_2>>32'sd16);
                           Emu_app_dst_port <= 64'sh_ffff&(TEIC1_1_V_2>>32'sd32);
                           Emu_app_src_port <= 64'sh_ffff&(TEIC1_1_V_2>>32'sd16);
                           Emu_dst_ip <= Emu_dst_ip|((64'sh_ffff&TEIC1_1_V_2)<<32'sd16);
                           end 
                          if ((TEIC1_1_V_4==32'sd0/*0:USA18*/) && (32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_src_port <= 64'shff&(TEIC1_1_V_3>>32'sd16);
                           Emu_src_mac <= 64'sh_ffff&(TEIC1_1_V_2>>32'sd48);
                           Emu_dst_mac <= 64'sh_ffff_ffff_ffff&TEIC1_1_V_2;
                           end 
                          if ((32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd4/*4:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_ICMP_code_type <= 64'sh_ffff&(TEIC1_1_V_2>>32'sd16);
                           Emu_app_dst_port <= 64'sh_ffff&(TEIC1_1_V_2>>32'sd32);
                           Emu_app_src_port <= 64'sh_ffff&(TEIC1_1_V_2>>32'sd16);
                           Emu_dst_ip <= Emu_dst_ip|((64'sh_ffff&TEIC1_1_V_2)<<32'sd16);
                           end 
                          if ((TEIC1_1_V_4==32'sd0/*0:USA18*/) && (32'sd11<$unsigned(32'd1+TEIC1_1_V_4)))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_src_port <= 64'shff&(TEIC1_1_V_3>>32'sd16);
                           Emu_src_mac <= 64'sh_ffff&(TEIC1_1_V_2>>32'sd48);
                           Emu_dst_mac <= 64'sh_ffff_ffff_ffff&TEIC1_1_V_2;
                           end 
                          if ((32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd1/*1:USA18*/) && (32'sd8/*8:USA20*/!=(64'sh_ffff
                  &(TEIC1_1_V_2>>32'sd32))))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_IPv4 <= 1'h0;
                           Emu_src_mac <= Emu_src_mac|((64'h_ffff_ffff&TEIC1_1_V_2)<<32'sd16);
                           end 
                          if ((32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd1/*1:USA18*/) && (32'sd8/*8:USA20*/==(64'sh_ffff
                  &(TEIC1_1_V_2>>32'sd32))))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_IPv4 <= rtl_unsigned_bitextract1(rtl_sign_extend2((32'sd4/*4:USA22*/==(64'shf&(TEIC1_1_V_2>>32'sd52)))));
                           Emu_src_mac <= Emu_src_mac|((64'h_ffff_ffff&TEIC1_1_V_2)<<32'sd16);
                           end 
                          if ((32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd2/*2:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_proto_UDP <= (32'sd17/*17:USA24*/==(64'shff&(TEIC1_1_V_2>>32'sd56)));
                           Emu_proto_ICMP <= (32'sd1/*1:USA24*/==(64'shff&(TEIC1_1_V_2>>32'sd56)));
                           end 
                          if ((32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd3/*3:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_dst_ip <= 64'sh_ffff&(TEIC1_1_V_2>>32'sd48);
                           Emu_src_ip <= 64'h_ffff_ffff&(TEIC1_1_V_2>>32'sd16);
                           end 
                          if ((32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd6/*6:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_opcode <= rtl_unsigned_bitextract3(64'shff&(TEIC1_1_V_2>>32'sd24));
                           Emu_magic_num <= rtl_unsigned_bitextract3(64'shff&(TEIC1_1_V_2>>32'sd16));
                           end 
                          if ((32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd1/*1:USA18*/) && (32'sd8/*8:USA20*/!=(64'sh_ffff
                  &(TEIC1_1_V_2>>32'sd32))))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_IPv4 <= 1'h0;
                           Emu_src_mac <= Emu_src_mac|((64'h_ffff_ffff&TEIC1_1_V_2)<<32'sd16);
                           end 
                          if ((32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd1/*1:USA18*/) && (32'sd8/*8:USA20*/==(64'sh_ffff
                  &(TEIC1_1_V_2>>32'sd32))))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_IPv4 <= rtl_unsigned_bitextract1(rtl_sign_extend2((32'sd4/*4:USA22*/==(64'shf&(TEIC1_1_V_2>>32'sd52)))));
                           Emu_src_mac <= Emu_src_mac|((64'h_ffff_ffff&TEIC1_1_V_2)<<32'sd16);
                           end 
                          if ((32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd2/*2:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_proto_UDP <= (32'sd17/*17:USA24*/==(64'shff&(TEIC1_1_V_2>>32'sd56)));
                           Emu_proto_ICMP <= (32'sd1/*1:USA24*/==(64'shff&(TEIC1_1_V_2>>32'sd56)));
                           end 
                          if ((32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd3/*3:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_dst_ip <= 64'sh_ffff&(TEIC1_1_V_2>>32'sd48);
                           Emu_src_ip <= 64'h_ffff_ffff&(TEIC1_1_V_2>>32'sd16);
                           end 
                          if ((32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd6/*6:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_opcode <= rtl_unsigned_bitextract3(64'shff&(TEIC1_1_V_2>>32'sd24));
                           Emu_magic_num <= rtl_unsigned_bitextract3(64'shff&(TEIC1_1_V_2>>32'sd16));
                           end 
                          if ((32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd5/*5:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd7/*7:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd8/*8:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num!=32'sd128/*128:Emu_magic_num*/) && (32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4
                  ==32'sd9/*9:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode!=32'sd1/*1:Emu_opcode*/) && !Emu_opcode && 
                  (32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd9/*9:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode==32'sd1/*1:Emu_opcode*/) && !Emu_opcode && 
                  (32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd9/*9:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode!=32'sd1/*1:Emu_opcode*/) && !(!Emu_opcode
                  ) && (Emu_opcode!=32'sd4/*4:Emu_opcode*/) && (32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd9/*9:USA18*/)) 
                   begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode==32'sd1/*1:Emu_opcode*/) && !(!Emu_opcode
                  ) && (32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd9/*9:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && !(!Emu_opcode) && (Emu_opcode==32'sd4/*4:Emu_opcode*/) && 
                  (32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd9/*9:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num!=32'sd128/*128:Emu_magic_num*/) && (32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4
                  ==32'sd10/*10:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode!=32'sd1/*1:Emu_opcode*/) && (32'sd11>=$unsigned(32'd1
                  +TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd10/*10:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode==32'sd1/*1:Emu_opcode*/) && (32'sd11>=$unsigned(32'd1
                  +TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd10/*10:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num!=32'sd128/*128:Emu_magic_num*/) && (32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4
                  ==32'sd11/*11:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode!=32'sd1/*1:Emu_opcode*/) && (32'sd11>=$unsigned(32'd1
                  +TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd11/*11:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode==32'sd1/*1:Emu_opcode*/) && (32'sd11>=$unsigned(32'd1
                  +TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd11/*11:USA18*/))  begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((TEIC1_1_V_4!=32'sd0/*0:USA18*/) && (32'sd11>=$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4!=32'sd1/*1:USA18*/) && 
                  (TEIC1_1_V_4!=32'sd2/*2:USA18*/) && (TEIC1_1_V_4!=32'sd3/*3:USA18*/) && (TEIC1_1_V_4!=32'sd4/*4:USA18*/) && (TEIC1_1_V_4
                  !=32'sd5/*5:USA18*/) && (TEIC1_1_V_4!=32'sd6/*6:USA18*/) && (TEIC1_1_V_4!=32'sd7/*7:USA18*/) && (TEIC1_1_V_4!=32'sd8
                  /*8:USA18*/) && (TEIC1_1_V_4!=32'sd9/*9:USA18*/) && (TEIC1_1_V_4!=32'sd10/*10:USA18*/) && (TEIC1_1_V_4!=32'sd11/*11:USA18*/)) 
                   begin 
                           TEIC1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd5/*5:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd7/*7:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd8/*8:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num!=32'sd128/*128:Emu_magic_num*/) && (32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4
                  ==32'sd9/*9:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode!=32'sd1/*1:Emu_opcode*/) && !Emu_opcode && 
                  (32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd9/*9:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode==32'sd1/*1:Emu_opcode*/) && !Emu_opcode && 
                  (32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd9/*9:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode!=32'sd1/*1:Emu_opcode*/) && !(!Emu_opcode
                  ) && (Emu_opcode!=32'sd4/*4:Emu_opcode*/) && (32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd9/*9:USA18*/)) 
                   begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode==32'sd1/*1:Emu_opcode*/) && !(!Emu_opcode
                  ) && (32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd9/*9:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && !(!Emu_opcode) && (Emu_opcode==32'sd4/*4:Emu_opcode*/) && 
                  (32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd9/*9:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num!=32'sd128/*128:Emu_magic_num*/) && (32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4
                  ==32'sd10/*10:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode!=32'sd1/*1:Emu_opcode*/) && (32'sd11<$unsigned(32'd1
                  +TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd10/*10:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode==32'sd1/*1:Emu_opcode*/) && (32'sd11<$unsigned(32'd1
                  +TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd10/*10:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num!=32'sd128/*128:Emu_magic_num*/) && (32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4
                  ==32'sd11/*11:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode!=32'sd1/*1:Emu_opcode*/) && (32'sd11<$unsigned(32'd1
                  +TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd11/*11:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode==32'sd1/*1:Emu_opcode*/) && (32'sd11<$unsigned(32'd1
                  +TEIC1_1_V_4)) && (TEIC1_1_V_4==32'sd11/*11:USA18*/))  begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                          if ((TEIC1_1_V_4!=32'sd0/*0:USA18*/) && (32'sd11<$unsigned(32'd1+TEIC1_1_V_4)) && (TEIC1_1_V_4!=32'sd1/*1:USA18*/) && 
                  (TEIC1_1_V_4!=32'sd2/*2:USA18*/) && (TEIC1_1_V_4!=32'sd3/*3:USA18*/) && (TEIC1_1_V_4!=32'sd4/*4:USA18*/) && (TEIC1_1_V_4
                  !=32'sd5/*5:USA18*/) && (TEIC1_1_V_4!=32'sd6/*6:USA18*/) && (TEIC1_1_V_4!=32'sd7/*7:USA18*/) && (TEIC1_1_V_4!=32'sd8
                  /*8:USA18*/) && (TEIC1_1_V_4!=32'sd9/*9:USA18*/) && (TEIC1_1_V_4!=32'sd10/*10:USA18*/) && (TEIC1_1_V_4!=32'sd11/*11:USA18*/)) 
                   begin 
                           xpc10 <= 25'sd32/*32:xpc10*/;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           end 
                           end 
                  
              25'sd32/*32:xpc10*/:  begin 
                   xpc10 <= 25'sd64/*64:xpc10*/;
                   TEIC1_1_V_0 <= Emu_ICMP_code_type;
                   TEIC1_1_V_14 <= rtl_unsigned_bitextract4(Emu_proto_ICMP);
                   TEIC1_1_V_13 <= rtl_unsigned_bitextract4(Emu_proto_UDP);
                   TEIC1_1_V_12 <= rtl_unsigned_bitextract4(Emu_IPv4);
                   end 
                  
              25'sd64/*64:xpc10*/:  begin 
                  if (TEIC1_1_V_12 && TEIC1_1_V_14)  begin 
                           xpc10 <= 25'sd128/*128:xpc10*/;
                           TEca6_0_V_1 <= $unsigned((A_64_US_CC_SCALbx14_ARC0[64'd1]>>32'sd48));
                           TEca6_0_V_0 <= 8'h1;
                           TEca6_0_V_9 <= 64'h0;
                           TEca6_0_V_7 <= 64'h0;
                           TEca6_0_V_6 <= 64'h0;
                           end 
                          if ((TEIC1_1_V_12? !TEIC1_1_V_14: 1'd1))  xpc10 <= 25'sd1048576/*1048576:xpc10*/;
                       end 
                  
              25'sd128/*128:xpc10*/:  begin 
                   xpc10 <= 25'sd256/*256:xpc10*/;
                   TEca6_0_V_7 <= (64'sh_ffff&hprpin95410)+(hprpin95410>>32'sd16);
                   TEca6_0_V_6 <= (64'sh_ffff&hprpin95010)+(hprpin95010>>32'sd16);
                   end 
                  
              25'sd256/*256:xpc10*/:  begin 
                  if ((32'sd2/*2:USA26*/==rtl_unsigned_bitextract0(8'd1+TEca6_0_V_0)))  begin 
                           xpc10 <= 25'sd128/*128:xpc10*/;
                           TEca6_0_V_1 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[rtl_unsigned_bitextract0(8'd1+TEca6_0_V_0)]);
                           TEca6_0_V_0 <= rtl_unsigned_bitextract0(8'd1+TEca6_0_V_0);
                           TEca6_0_V_9 <= hprpin96310;
                           end 
                          if ((32'sd4>=$signed(rtl_unsigned_bitextract0(8'd1+TEca6_0_V_0))) && (32'sd1/*1:USA26*/!=rtl_unsigned_bitextract0(8'd1
                  +TEca6_0_V_0)) && (32'sd2/*2:USA26*/!=rtl_unsigned_bitextract0(8'd1+TEca6_0_V_0)) && (32'sd3/*3:USA26*/!=rtl_unsigned_bitextract0(8'd1
                  +TEca6_0_V_0)))  begin 
                           xpc10 <= 25'sd128/*128:xpc10*/;
                           TEca6_0_V_1 <= 64'h0;
                           TEca6_0_V_0 <= rtl_unsigned_bitextract0(8'd1+TEca6_0_V_0);
                           TEca6_0_V_9 <= hprpin96310;
                           end 
                          if ((32'sd3/*3:USA26*/==rtl_unsigned_bitextract0(8'd1+TEca6_0_V_0)))  begin 
                           xpc10 <= 25'sd128/*128:xpc10*/;
                           TEca6_0_V_1 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[rtl_unsigned_bitextract0(8'd1+TEca6_0_V_0)]);
                           TEca6_0_V_0 <= rtl_unsigned_bitextract0(8'd1+TEca6_0_V_0);
                           TEca6_0_V_9 <= hprpin96310;
                           end 
                          if ((32'sd4>=$signed(rtl_unsigned_bitextract0(8'd1+TEca6_0_V_0))) && (32'sd4/*4:USA26*/==rtl_unsigned_bitextract0(8'd1
                  +TEca6_0_V_0)))  begin 
                           xpc10 <= 25'sd128/*128:xpc10*/;
                           TEca6_0_V_1 <= $unsigned((A_64_US_CC_SCALbx14_ARC0[64'd4]<<32'sd48));
                           TEca6_0_V_0 <= rtl_unsigned_bitextract0(8'd1+TEca6_0_V_0);
                           TEca6_0_V_9 <= hprpin96310;
                           end 
                          if ((32'sd1/*1:USA26*/==rtl_unsigned_bitextract0(8'd1+TEca6_0_V_0)))  begin 
                           xpc10 <= 25'sd128/*128:xpc10*/;
                           TEca6_0_V_1 <= $unsigned((A_64_US_CC_SCALbx14_ARC0[64'd1]>>32'sd48));
                           TEca6_0_V_0 <= rtl_unsigned_bitextract0(8'd1+TEca6_0_V_0);
                           TEca6_0_V_9 <= hprpin96310;
                           end 
                          if ((32'sd4<$signed(rtl_unsigned_bitextract0(8'd1+TEca6_0_V_0))))  begin 
                           xpc10 <= 25'sd512/*512:xpc10*/;
                           TEIC1_1_V_18 <= (32'sd0/*0:USA32*/==(64'sh_ffff&-64'sh1^hprpin96310));
                           TEca6_0_V_9 <= 64'sh_ffff&-64'sh1^hprpin96310;
                           TEca6_0_V_0 <= rtl_unsigned_bitextract0(8'd1+TEca6_0_V_0);
                           end 
                           end 
                  
              25'sd512/*512:xpc10*/:  begin 
                  if ((TEIC1_1_V_0==32'sd8/*8:TEIC1.1_V_0*/) && TEIC1_1_V_18)  begin 
                           xpc10 <= 25'sd1024/*1024:xpc10*/;
                           TEsw8_2_V_2 <= rtl_unsigned_bitextract4(TEIC1_1_V_14);
                           TEsw8_2_V_1 <= rtl_unsigned_bitextract4(TEIC1_1_V_13);
                           A_64_US_CC_SCALbx14_ARC0[64'd0] <= Emu_src_mac|(Emu_dst_mac<<32'sd48);
                           end 
                          if (((TEIC1_1_V_0==32'sd8/*8:TEIC1.1_V_0*/)? !TEIC1_1_V_18: 1'd1))  xpc10 <= 25'sd1048576/*1048576:xpc10*/;
                       end 
                  
              25'sd1024/*1024:xpc10*/:  begin 
                   xpc10 <= 25'sd2048/*2048:xpc10*/;
                   TEsw8_2_V_0 <= -64'sh1_0000_0000&A_64_US_CC_SCALbx14_ARC0[64'd1]|(Emu_dst_mac>>32'sd16);
                   end 
                  
              25'sd2048/*2048:xpc10*/:  begin 
                   xpc10 <= 25'sd4096/*4096:xpc10*/;
                   A_64_US_CC_SCALbx14_ARC0[64'd1] <= TEsw8_2_V_0;
                   end 
                  
              25'sd4096/*4096:xpc10*/:  begin 
                   xpc10 <= 25'sd8192/*8192:xpc10*/;
                   TEsw8_2_V_0 <= 64'sh_ffff&A_64_US_CC_SCALbx14_ARC0[64'd3]|(Emu_dst_ip<<32'sd16)|(Emu_src_ip<<32'sd48);
                   end 
                  
              25'sd8192/*8192:xpc10*/:  begin 
                   xpc10 <= 25'sd16384/*16384:xpc10*/;
                   A_64_US_CC_SCALbx14_ARC0[64'd3] <= TEsw8_2_V_0;
                   end 
                  
              25'sd16384/*16384:xpc10*/:  begin 
                  if (!TEsw8_2_V_1 && TEsw8_2_V_2)  begin 
                           xpc10 <= 25'sd32768/*32768:xpc10*/;
                           TEsw8_2_V_0 <= -64'sh1_0000_0000_0000&A_64_US_CC_SCALbx14_ARC0[64'd4]|(Emu_src_ip>>32'sd16);
                           end 
                          if (TEsw8_2_V_1 && !TEsw8_2_V_2)  begin 
                           xpc10 <= 25'sd32768/*32768:xpc10*/;
                           TEsw8_2_V_0 <= -64'sh1_0000_0000_0000&A_64_US_CC_SCALbx14_ARC0[64'd4]|(Emu_src_ip>>32'sd16)|(Emu_app_src_port
                          <<32'sd32)|(Emu_app_dst_port<<32'sd16);

                           end 
                          if (TEsw8_2_V_1 && TEsw8_2_V_2)  begin 
                           xpc10 <= 25'sd32768/*32768:xpc10*/;
                           TEsw8_2_V_0 <= -64'sh1_0000_0000_0000&A_64_US_CC_SCALbx14_ARC0[64'd4]|(Emu_src_ip>>32'sd16);
                           end 
                          if (!TEsw8_2_V_1 && !TEsw8_2_V_2)  xpc10 <= 25'sd32768/*32768:xpc10*/;
                       end 
                  
              25'sd32768/*32768:xpc10*/:  begin 
                   xpc10 <= 25'sd65536/*65536:xpc10*/;
                   A_64_US_CC_SCALbx14_ARC0[64'd4] <= TEsw8_2_V_0;
                   end 
                  
              25'sd65536/*65536:xpc10*/:  begin 
                   xpc10 <= 25'sd131072/*131072:xpc10*/;
                   Emu_tmp <= -64'sh_ffff_ffff_0001&A_64_US_CC_SCALbx14_ARC0[64'd4];
                   Emu_chksum_UDP <= 64'h0;
                   end 
                  
              25'sd131072/*131072:xpc10*/: if ((TEIC1_1_V_10<32'h4))  begin 
                       xpc10 <= 25'sd262144/*262144:xpc10*/;
                       Emu_tmp1 <= 64'sh_ffff&-64'sh1^Emu_chksum_UDP;
                       TEIC1_1_V_4 <= 32'h4;
                       end 
                       else  begin 
                       xpc10 <= 25'sd8388608/*8388608:xpc10*/;
                       Emu_tmp2 <= $unsigned((A_64_US_CC_SCALbx14_ARC0[32'h4]>>32'sd16));
                       TEIC1_1_V_4 <= 32'h4;
                       end 
                      
              25'sd262144/*262144:xpc10*/:  begin 
                   xpc10 <= 25'sd524288/*524288:xpc10*/;
                   Emu_tmp3 <= 64'sh_ffff&A_64_US_CC_SCALbx10_ARA0[64'd0];
                   Emu_tmp2 <= (Emu_tmp1>>32'sd8)|((64'shff&Emu_tmp1)<<32'sd8);
                   A_64_US_CC_SCALbx14_ARC0[64'd4] <= Emu_tmp|(((Emu_tmp1>>32'sd8)|((64'shff&Emu_tmp1)<<32'sd8))<<32'sd32);
                   end 
                  
              25'sd524288/*524288:xpc10*/:  begin 
                   xpc10 <= 25'sd1048576/*1048576:xpc10*/;
                   A_64_US_CC_SCALbx10_ARA0[64'd0] <= Emu_tmp3|(Emu_src_port<<32'sd24)|(Emu_src_port<<32'sd16);
                   end 
                  
              25'sd1048576/*1048576:xpc10*/:  begin 
                  if (!m_axis_tready && (TEIC1_1_V_10>=32'h0))  begin 
                           xpc10 <= 25'sd4194304/*4194304:xpc10*/;
                           TESe15_3_V_0 <= 32'h0;
                           m_axis_tuser_low <= 64'h0;
                           m_axis_tuser_hi <= 64'h0;
                           m_axis_tkeep <= 8'h0;
                           m_axis_tdata <= 64'h0;
                           m_axis_tlast <= 1'h0;
                           m_axis_tvalid <= 1'h1;
                           end 
                          if (m_axis_tready && (TEIC1_1_V_10>=32'h0))  begin 
                           xpc10 <= 25'sd4194304/*4194304:xpc10*/;
                           TESe15_3_V_0 <= 32'h1;
                           m_axis_tuser_low <= $unsigned(A_64_US_CC_SCALbx10_ARA0[32'h0]);
                           m_axis_tuser_hi <= $unsigned(A_64_US_CC_SCALbx12_ARB0[32'h0]);
                           m_axis_tlast <= (TEIC1_1_V_10==32'sd0/*0:TEIC1.1_V_10*/);
                           m_axis_tkeep <= rtl_unsigned_bitextract0(A_8_US_CC_SCALbx16_ARA0[32'h0]);
                           m_axis_tdata <= $unsigned(A_64_US_CC_SCALbx14_ARC0[32'h0]);
                           m_axis_tvalid <= 1'h1;
                           end 
                          if ((TEIC1_1_V_10<32'h0))  begin 
                           xpc10 <= 25'sd2097152/*2097152:xpc10*/;
                           m_axis_tuser_low <= 64'h0;
                           m_axis_tuser_hi <= 64'h0;
                           m_axis_tkeep <= 8'h0;
                           m_axis_tdata <= 64'h0;
                           m_axis_tlast <= 1'h0;
                           m_axis_tvalid <= 1'h0;
                           TESe15_3_V_0 <= 32'h0;
                           end 
                           end 
                  
              25'sd2097152/*2097152:xpc10*/:  begin 
                   xpc10 <= 25'sd1/*1:xpc10*/;
                   s_axis_tready <= 1'h1;
                   m_axis_tuser_low <= 64'h0;
                   m_axis_tuser_hi <= 64'h0;
                   m_axis_tvalid <= 1'h0;
                   m_axis_tlast <= 1'h0;
                   m_axis_tkeep <= 8'h0;
                   m_axis_tdata <= 64'h0;
                   TEIC1_1_V_10 <= 32'h0;
                   Emu_chksum_UDP <= 64'h0;
                   Emu_proto_ICMP <= 1'h0;
                   Emu_proto_UDP <= 1'h0;
                   Emu_IPv4 <= 1'h0;
                   end 
                  
              25'sd4194304/*4194304:xpc10*/:  begin 
                  if ((TEIC1_1_V_10<TESe15_3_V_0))  begin 
                           xpc10 <= 25'sd2097152/*2097152:xpc10*/;
                           m_axis_tuser_low <= 64'h0;
                           m_axis_tuser_hi <= 64'h0;
                           m_axis_tkeep <= 8'h0;
                           m_axis_tdata <= 64'h0;
                           m_axis_tlast <= 1'h0;
                           m_axis_tvalid <= 1'h0;
                           end 
                          if (m_axis_tready && (TEIC1_1_V_10>=TESe15_3_V_0))  begin 
                           TESe15_3_V_0 <= $unsigned(32'd1+TESe15_3_V_0);
                           m_axis_tuser_low <= $unsigned(A_64_US_CC_SCALbx10_ARA0[TESe15_3_V_0]);
                           m_axis_tuser_hi <= $unsigned(A_64_US_CC_SCALbx12_ARB0[TESe15_3_V_0]);
                           m_axis_tlast <= (TEIC1_1_V_10==TESe15_3_V_0);
                           m_axis_tkeep <= rtl_unsigned_bitextract0(A_8_US_CC_SCALbx16_ARA0[TESe15_3_V_0]);
                           m_axis_tdata <= $unsigned(A_64_US_CC_SCALbx14_ARC0[TESe15_3_V_0]);
                           end 
                           end 
                  
              25'sd8388608/*8388608:xpc10*/:  begin 
                   xpc10 <= 25'sd16777216/*16777216:xpc10*/;
                   TEca12_5_V_5 <= (64'sh_ffff&hprpin104010)+(hprpin104010>>32'sd16);
                   TEca12_5_V_4 <= (64'sh_ffff&hprpin103610)+(hprpin103610>>32'sd16);
                   TEca12_5_V_7 <= Emu_chksum_UDP;
                   end 
                  
              25'sd16777216/*16777216:xpc10*/:  begin 
                  if ((TEIC1_1_V_10>=$unsigned(32'd1+TEIC1_1_V_4)) && (32'sd4/*4:USA30*/==$unsigned(32'd1+TEIC1_1_V_4)))  begin 
                           xpc10 <= 25'sd8388608/*8388608:xpc10*/;
                           Emu_tmp2 <= $unsigned((A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]>>32'sd16));
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_chksum_UDP <= hprpin104910;
                           end 
                          if ((TEIC1_1_V_10>=$unsigned(32'd1+TEIC1_1_V_4)) && (32'sd4/*4:USA30*/!=$unsigned(32'd1+TEIC1_1_V_4)))  begin 
                           xpc10 <= 25'sd8388608/*8388608:xpc10*/;
                           Emu_tmp2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEIC1_1_V_4)]);
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_chksum_UDP <= hprpin104910;
                           end 
                          if ((TEIC1_1_V_10<$unsigned(32'd1+TEIC1_1_V_4)))  begin 
                           xpc10 <= 25'sd262144/*262144:xpc10*/;
                           Emu_tmp1 <= 64'sh_ffff&-64'sh1^hprpin104910;
                           TEIC1_1_V_4 <= $unsigned(32'd1+TEIC1_1_V_4);
                           Emu_chksum_UDP <= hprpin104910;
                           end 
                           end 
                  endcase
      //End structure HPR anontop


       end 
      

assign hprpin95010 = (((64'shff&TEca6_0_V_1)<<32'sd8)|((64'sh_ff00&TEca6_0_V_1)>>32'sd8))+(((64'shff&(TEca6_0_V_1>>32'sd16))<<32'sd8)|((64'sh_ff00&(TEca6_0_V_1
>>32'sd16))>>32'sd8));

assign hprpin95410 = (((64'shff&(TEca6_0_V_1>>32'sd32))<<32'sd8)|((64'sh_ff00&(TEca6_0_V_1>>32'sd32))>>32'sd8))+(((64'shff&(TEca6_0_V_1>>32'sd48))<<32'sd8
)|((64'sh_ff00&(TEca6_0_V_1>>32'sd48))>>32'sd8));

assign hprpin96310 = (64'sh_ffff&TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16))+(TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6
+TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16)>>32'sd16);

assign hprpin103610 = (((64'shff&Emu_tmp2)<<32'sd8)|((64'sh_ff00&Emu_tmp2)>>32'sd8))+(((64'shff&(Emu_tmp2>>32'sd16))<<32'sd8)|((64'sh_ff00&(Emu_tmp2>>32'sd16
))>>32'sd8));

assign hprpin104010 = (((64'shff&(Emu_tmp2>>32'sd32))<<32'sd8)|((64'sh_ff00&(Emu_tmp2>>32'sd32))>>32'sd8))+(((64'shff&(Emu_tmp2>>32'sd48))<<32'sd8)|((64'sh_ff00
&(Emu_tmp2>>32'sd48))>>32'sd8));

assign hprpin104910 = (64'sh_ffff&TEca12_5_V_7+(64'sh_ffff&TEca12_5_V_4+TEca12_5_V_5)+(TEca12_5_V_4+TEca12_5_V_5>>32'sd16))+(TEca12_5_V_7+(64'sh_ffff&TEca12_5_V_4
+TEca12_5_V_5)+(TEca12_5_V_4+TEca12_5_V_5>>32'sd16)>>32'sd16);

// 1 vectors of width 25
// 25 vectors of width 64
// 5 vectors of width 32
// 10 vectors of width 1
// 4 vectors of width 8
// 768 array locations of width 64
// 256 array locations of width 8
// Total state bits in module = 53027 bits.
// 384 continuously assigned (wire/non-state) bits 
// Total number of leaf cells = 0
endmodule

//  
// LCP delay estimations included: turn off with -vnl-lcp-delay-estimate=disable
//HPR L/S (orangepath) auxiliary reports.
//KiwiC compilation report
//Kiwi Scientific Acceleration (KiwiC .net/CIL/C# to Verilog/SystemC compiler): Version alpha 0.2.16f : 22nd-September-2016
//29/09/2016 19:08:34
//Cmd line args:  /root/kiwi/kiwipro/kiwic/distro/lib/kiwic.exe emu_ICMP_echo.dll -bevelab-default-pause-mode=hard -vnl-resets=synchronous -vnl-roundtrip=disable -res2-loadstore-port-count=0 -restructure2=disable -conerefine=enable -vnl emu_ICMP_echo.v


//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation KiKiwi for prefix KiwiSystem/Kiwi

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation SyBitConverter for prefix System/BitConverter

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation CS0.15 for prefix CS/0.15

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation CS0.19 for prefix CS/0.19

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation CS0.34 for prefix CS/0.34

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation CS0.38 for prefix CS/0.38

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation CS0.42 for prefix CS/0.42

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation CS0.46 for prefix CS/0.46

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation CS0.50 for prefix CS/0.50

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation @64 for prefix @/64

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation @8 for prefix @/8

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEI1._SPILL for prefix T403/Emu/ICMP_echo_logic/1.1/_SPILL

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEIC1.1 for prefix T403/Emu/ICMP_echo_logic/1.1

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TER1._SPILL for prefix T403/Emu/ReceiveFrame/1.1/_SPILL

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TERe1.1 for prefix T403/Emu/ReceiveFrame/1.1

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEE2._SPILL for prefix T403/Emu/Extract_headers/2.15/_SPILL

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEEx2.15 for prefix T403/Emu/Extract_headers/2.15

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEc6._SPILL for prefix T403/Emu/calc_IP_checksum/6.0/_SPILL

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEca6.0 for prefix T403/Emu/calc_IP_checksum/6.0

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEsw8.2 for prefix T403/Emu/swap_multiple_fields/8.2

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEca12.5 for prefix T403/Emu/calc_UDP_checksum/12.5

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TESe15.3 for prefix T403/Emu/SendFrame/15.3

//----------------------------------------------------------

//Report from KiwiC-fe.rpt:::
//KiwiC: front end input processing of class or method called KiwiSystem/Kiwi
//
//root_walk start thread at a static method (used as an entry point). Method name=.cctor uid=cctor10
//
//KiwiC start_thread (or entry point) id=cctor10
//
//Root method elaborated: specificf=S_kickoff_collate leftover=1+0
//
//KiwiC: front end input processing of class or method called System/BitConverter
//
//root_walk start thread at a static method (used as an entry point). Method name=.cctor uid=cctor12
//
//KiwiC start_thread (or entry point) id=cctor12
//
//Root method elaborated: specificf=S_kickoff_collate leftover=1+1
//
//KiwiC: front end input processing of class or method called Emu
//
//root_walk start thread at a static method (used as an entry point). Method name=.cctor uid=cctor14
//
//KiwiC start_thread (or entry point) id=cctor14
//
//Root method elaborated: specificf=S_kickoff_collate leftover=1+2
//
//KiwiC: front end input processing of class or method called Emu
//
//root_compiler: start elaborating class 'Emu'
//
//elaborating class 'Emu'
//
//compiling static method as entry point: style=Root idl=Emu/EntryPoint
//
//Performing root elaboration of method EntryPoint
//
//KiwiC start_thread (or entry point) id=EntryPoint10
//
//root_compiler class done: Emu
//
//Report of all settings used from the recipe or command line:
//
//   cil-uwind-budget=10000
//
//   kiwic-finish=enable
//
//   kiwic-cil-dump=disable
//
//   kiwic-kcode-dump=disable
//
//   kiwic-register-colours=disable
//
//   array-4d-name=KIWIARRAY4D
//
//   array-3d-name=KIWIARRAY3D
//
//   array-2d-name=KIWIARRAY2D
//
//   kiwi-dll=Kiwi.dll
//
//   kiwic-dll=Kiwic.dll
//
//   kiwic-zerolength-arrays=disable
//
//   kiwic-fpgaconsole-default=enable
//
//   postgen-optimise=enable
//
//   gtrace-loglevel=20
//
//   firstpass-loglevel=20
//
//   root=$attributeroot
//
//   srcfile=emu_ICMP_echo.dll
//
//END OF KIWIC REPORT FILE
//

//----------------------------------------------------------

//Report from enumbers:::
//Concise expression alias report.
//
//  -- No expression aliases to report
//

//----------------------------------------------------------

//Report from verilog_render:::
//1 vectors of width 25
//
//25 vectors of width 64
//
//5 vectors of width 32
//
//10 vectors of width 1
//
//4 vectors of width 8
//
//768 array locations of width 64
//
//256 array locations of width 8
//
//Total state bits in module = 53027 bits.
//
//384 continuously assigned (wire/non-state) bits 
//
//Total number of leaf cells = 0
//

//Major Statistics Report:
//Thread .cctor uid=cctor10 has 3 CIL instructions in 1 basic blocks
//Thread .cctor uid=cctor12 has 2 CIL instructions in 1 basic blocks
//Thread .cctor uid=cctor14 has 28 CIL instructions in 1 basic blocks
//Thread EntryPoint uid=EntryPoint10 has 384 CIL instructions in 103 basic blocks
//Thread mpc10 has 26 bevelab control states (pauses)
// eof (HPR L/S Verilog)
