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

// Verilog output file generated at 29/09/2016 16:28:53
// Kiwi Scientific Acceleration (KiwiC .net/CIL/C# to Verilog/SystemC compiler): Version alpha 0.2.16f : 22nd-September-2016 Unix 3.19.0.64
//  /root/kiwi/kiwipro/kiwic/distro/lib/kiwic.exe emu_memcached_binary.dll -bevelab-default-pause-mode=hard -vnl-resets=synchronous -vnl-roundtrip=disable -res2-loadstore-port-count=0 -restructure2=disable -conerefine=enable -vnl emu_memcached_binary.v
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
function  rtl_unsigned_bitextract5;
   input [31:0] arg;
   rtl_unsigned_bitextract5 = $unsigned(arg[0:0]);
   endfunction

function [7:0] rtl_unsigned_bitextract3;
   input [31:0] arg;
   rtl_unsigned_bitextract3 = $unsigned(arg[7:0]);
   endfunction

function [7:0] rtl_unsigned_bitextract2;
   input [63:0] arg;
   rtl_unsigned_bitextract2 = $unsigned(arg[7:0]);
   endfunction

function  rtl_unsigned_bitextract0;
   input [31:0] arg;
   rtl_unsigned_bitextract0 = $unsigned(arg[0:0]);
   endfunction

function signed [31:0] rtl_sign_extend1;
   input argbit;
   rtl_sign_extend1 = { {32{argbit}} };
   endfunction

function [31:0] rtl_unsigned_extend4;
   input [7:0] arg;
   rtl_unsigned_extend4 = { 24'b0, arg[7:0] };
   endfunction

  reg Emu_IPv4;
  reg Emu_proto_UDP;
  reg Emu_proto_ICMP;
  reg [63:0] Emu_chksum_UDP;
  reg [63:0] Emu_chksumIP;
  reg [31:0] Emu_mem_controller_cnt;
  reg [31:0] TEme1_1_V_2;
  reg [7:0] TEme1_1_V_3;
  reg [7:0] TEme1_1_V_4;
  reg [31:0] TEme1_1_V_5;
  reg TEme1_1_V_6;
  reg TEme1_1_V_7;
  reg TEme1_1_V_8;
  reg [31:0] TEme1_1_V_9;
  reg TEme1_1_V_11;
  reg [31:0] TERe1_1_V_0;
  reg [31:0] TERe1_1_V_1;
  reg TERe1_1_V_2;
  reg [63:0] TERe1_1_V_3;
  reg [7:0] TERe1_1_V_4;
  reg [7:0] Emu_magic_num;
  reg [7:0] Emu_opcode;
  reg [63:0] TEca6_0_V_1;
  reg [63:0] TEca6_0_V_6;
  reg [63:0] TEca6_0_V_7;
  reg [63:0] TEca6_0_V_9;
  reg [7:0] TEca6_0_V_0;
  reg [31:0] TEca8_1_V_0;
  reg [63:0] Emu_key;
  reg [63:0] Emu_key_value;
  reg [63:0] Emu_flag;
  reg [63:0] Emu_extras;
  reg TEsw14_14_V_1;
  reg TEsw14_14_V_2;
  reg [63:0] Emu_dst_mac;
  reg [63:0] Emu_src_mac;
  reg [63:0] TEsw14_14_V_0;
  reg [63:0] Emu_dst_ip;
  reg [63:0] Emu_src_ip;
  reg [63:0] Emu_app_src_port;
  reg [63:0] Emu_app_dst_port;
  reg [63:0] TEMe20_2_V_0;
  reg [63:0] TEMe20_2_V_1;
  reg [63:0] Emu_IP_total_length;
  reg [63:0] Emu_UDP_total_length;
  reg [63:0] Emu_src_port;
  reg [63:0] TEMe19_2_V_0;
  reg [63:0] TEMe19_2_V_1;
  reg [63:0] TEMe18_1_V_0;
  reg [63:0] TEMe18_1_V_1;
  reg [63:0] Emu_tmp;
  reg [63:0] TEca21_7_V_1;
  reg [63:0] TEca21_7_V_6;
  reg [63:0] TEca21_7_V_7;
  reg [63:0] TEca21_7_V_9;
  reg [7:0] TEca21_7_V_0;
  reg [63:0] Emu_tmp3;
  reg [63:0] Emu_tmp2;
  reg [63:0] TEca27_17_V_4;
  reg [63:0] TEca27_17_V_5;
  reg [63:0] TEca27_17_V_7;
  reg [63:0] TEca27_20_V_4;
  reg [63:0] TEca27_20_V_5;
  reg [63:0] TEca27_20_V_7;
  reg [63:0] TEca25_5_V_4;
  reg [63:0] TEca25_5_V_5;
  reg [63:0] TEca25_5_V_7;
  reg [31:0] TESe28_3_V_0;
  reg [63:0] TEme1_1_V_0;
  reg [63:0] TEme1_1_V_1;
  reg [7:0] A_8_US_CC_SCALbx20_ARA0[255:0];
  reg [63:0] A_64_US_CC_SCALbx18_ARE0[255:0];
  reg [63:0] A_64_US_CC_SCALbx16_ARD0[255:0];
  reg [63:0] A_64_US_CC_SCALbx14_ARC0[255:0];
  reg [63:0] A_64_US_CC_SCALbx12_ARB0[255:0];
  reg [63:0] A_64_US_CC_SCALbx10_ARA0[255:0];
  reg [6:0] xpc10;
  wire [63:0] hprpin137510;
  wire [63:0] hprpin137910;
  wire [63:0] hprpin138810;
  wire [63:0] hprpin148810;
  wire [63:0] hprpin149210;
  wire [63:0] hprpin150110;
  wire [63:0] hprpin153610;
  wire [63:0] hprpin154010;
  wire [63:0] hprpin155210;
  wire [63:0] hprpin155610;
  wire [63:0] hprpin158610;
 always   @(posedge clk )  begin 
      //Start structure HPR anontop
      if (reset)  begin 
               debug_reg <= 32'd0;
               TERe1_1_V_4 <= 32'd0;
               TERe1_1_V_3 <= 64'd0;
               TERe1_1_V_2 <= 32'd0;
               TERe1_1_V_1 <= 32'd0;
               TERe1_1_V_0 <= 32'd0;
               Emu_extras <= 64'd0;
               Emu_key <= 64'd0;
               Emu_opcode <= 32'd0;
               Emu_magic_num <= 32'd0;
               Emu_UDP_total_length <= 64'd0;
               Emu_app_dst_port <= 64'd0;
               Emu_app_src_port <= 64'd0;
               Emu_dst_ip <= 64'd0;
               Emu_src_ip <= 64'd0;
               Emu_IP_total_length <= 64'd0;
               TEme1_1_V_1 <= 64'd0;
               TEme1_1_V_0 <= 64'd0;
               Emu_src_port <= 64'd0;
               Emu_src_mac <= 64'd0;
               Emu_dst_mac <= 64'd0;
               TEme1_1_V_4 <= 32'd0;
               TEme1_1_V_3 <= 32'd0;
               TEme1_1_V_8 <= 32'd0;
               TEme1_1_V_7 <= 32'd0;
               TEme1_1_V_6 <= 32'd0;
               TEca6_0_V_7 <= 64'd0;
               TEca6_0_V_6 <= 64'd0;
               TEca6_0_V_1 <= 64'd0;
               TEca6_0_V_0 <= 32'd0;
               TEca6_0_V_9 <= 64'd0;
               Emu_flag <= 64'd0;
               Emu_key_value <= 64'd0;
               TEme1_1_V_11 <= 32'd0;
               TEsw14_14_V_2 <= 32'd0;
               TEsw14_14_V_1 <= 32'd0;
               TEsw14_14_V_0 <= 64'd0;
               TEca21_7_V_7 <= 64'd0;
               TEca21_7_V_6 <= 64'd0;
               Emu_chksumIP <= 64'd0;
               TEca21_7_V_1 <= 64'd0;
               TEca21_7_V_0 <= 32'd0;
               TEca21_7_V_9 <= 64'd0;
               Emu_tmp <= 64'd0;
               TEca27_17_V_5 <= 64'd0;
               TEca27_17_V_4 <= 64'd0;
               TEca27_17_V_7 <= 64'd0;
               TEca27_20_V_5 <= 64'd0;
               TEca27_20_V_4 <= 64'd0;
               TEca27_20_V_7 <= 64'd0;
               s_axis_tready <= 32'd0;
               Emu_proto_ICMP <= 32'd0;
               Emu_proto_UDP <= 32'd0;
               Emu_IPv4 <= 32'd0;
               m_axis_tvalid <= 32'd0;
               TESe28_3_V_0 <= 32'd0;
               m_axis_tuser_low <= 64'd0;
               m_axis_tuser_hi <= 64'd0;
               m_axis_tlast <= 32'd0;
               m_axis_tkeep <= 32'd0;
               m_axis_tdata <= 64'd0;
               TEca25_5_V_5 <= 64'd0;
               TEca25_5_V_4 <= 64'd0;
               TEca25_5_V_7 <= 64'd0;
               Emu_tmp3 <= 64'd0;
               Emu_tmp2 <= 64'd0;
               TEme1_1_V_2 <= 32'd0;
               Emu_chksum_UDP <= 64'd0;
               TEMe20_2_V_1 <= 64'd0;
               TEMe20_2_V_0 <= 64'd0;
               TEMe19_2_V_1 <= 64'd0;
               TEMe19_2_V_0 <= 64'd0;
               TEMe18_1_V_1 <= 64'd0;
               TEMe18_1_V_0 <= 64'd0;
               TEme1_1_V_5 <= 32'd0;
               cam_wr_addr <= 32'd0;
               cam_din <= 64'd0;
               cam_we <= 32'd0;
               TEca8_1_V_0 <= 32'd0;
               TEme1_1_V_9 <= 32'd0;
               Emu_mem_controller_cnt <= 32'd0;
               xpc10 <= 32'd0;
               cam_cmp_din <= 64'd0;
               end 
               else  begin 
              
              case (xpc10)
                  7'sd5/*5:xpc10*/:  begin 
                      if ((32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd4/*4:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_UDP_total_length <= 64'sh_ffff&(TEme1_1_V_0>>32'sd48);
                               Emu_app_dst_port <= 64'sh_ffff&(TEme1_1_V_0>>32'sd32);
                               Emu_app_src_port <= 64'sh_ffff&(TEme1_1_V_0>>32'sd16);
                               Emu_dst_ip <= Emu_dst_ip|((64'sh_ffff&TEme1_1_V_0)<<32'sd16);
                               end 
                              if ((TEme1_1_V_2==32'sd0/*0:USA18*/) && (32'sd11>=$unsigned(32'd1+TEme1_1_V_2)))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_src_port <= 64'shff&(TEme1_1_V_1>>32'sd16);
                               Emu_src_mac <= 64'sh_ffff&(TEme1_1_V_0>>32'sd48);
                               Emu_dst_mac <= 64'sh_ffff_ffff_ffff&TEme1_1_V_0;
                               end 
                              if ((32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd2/*2:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_IP_total_length <= 64'sh_ffff&TEme1_1_V_0;
                               Emu_proto_UDP <= (32'sd17/*17:USA24*/==(64'shff&(TEme1_1_V_0>>32'sd56)));
                               Emu_proto_ICMP <= (32'sd1/*1:USA24*/==(64'shff&(TEme1_1_V_0>>32'sd56)));
                               end 
                              if ((32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd4/*4:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_UDP_total_length <= 64'sh_ffff&(TEme1_1_V_0>>32'sd48);
                               Emu_app_dst_port <= 64'sh_ffff&(TEme1_1_V_0>>32'sd32);
                               Emu_app_src_port <= 64'sh_ffff&(TEme1_1_V_0>>32'sd16);
                               Emu_dst_ip <= Emu_dst_ip|((64'sh_ffff&TEme1_1_V_0)<<32'sd16);
                               end 
                              if ((TEme1_1_V_2==32'sd0/*0:USA18*/) && (32'sd11<$unsigned(32'd1+TEme1_1_V_2)))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_src_port <= 64'shff&(TEme1_1_V_1>>32'sd16);
                               Emu_src_mac <= 64'sh_ffff&(TEme1_1_V_0>>32'sd48);
                               Emu_dst_mac <= 64'sh_ffff_ffff_ffff&TEme1_1_V_0;
                               end 
                              if ((32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd1/*1:USA18*/) && (32'sd8/*8:USA20*/!=
                      (64'sh_ffff&(TEme1_1_V_0>>32'sd32))))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_IPv4 <= 1'h0;
                               Emu_src_mac <= Emu_src_mac|((64'h_ffff_ffff&TEme1_1_V_0)<<32'sd16);
                               end 
                              if ((32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd1/*1:USA18*/) && (32'sd8/*8:USA20*/==
                      (64'sh_ffff&(TEme1_1_V_0>>32'sd32))))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_IPv4 <= rtl_unsigned_bitextract0(rtl_sign_extend1((32'sd4/*4:USA22*/==(64'shf&(TEme1_1_V_0>>32'sd52
                              )))));

                               Emu_src_mac <= Emu_src_mac|((64'h_ffff_ffff&TEme1_1_V_0)<<32'sd16);
                               end 
                              if ((32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd2/*2:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_IP_total_length <= 64'sh_ffff&TEme1_1_V_0;
                               Emu_proto_UDP <= (32'sd17/*17:USA24*/==(64'shff&(TEme1_1_V_0>>32'sd56)));
                               Emu_proto_ICMP <= (32'sd1/*1:USA24*/==(64'shff&(TEme1_1_V_0>>32'sd56)));
                               end 
                              if ((32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd3/*3:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_dst_ip <= 64'sh_ffff&(TEme1_1_V_0>>32'sd48);
                               Emu_src_ip <= 64'h_ffff_ffff&(TEme1_1_V_0>>32'sd16);
                               end 
                              if ((32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd6/*6:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_opcode <= rtl_unsigned_bitextract2(64'shff&(TEme1_1_V_0>>32'sd24));
                               Emu_magic_num <= rtl_unsigned_bitextract2(64'shff&(TEme1_1_V_0>>32'sd16));
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode==32'sd1/*1:Emu_opcode*/) && !Emu_opcode
                       && (32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd9/*9:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_extras <= (TEme1_1_V_0<<32'sd16);
                               Emu_key <= -64'sh1_0000&TEme1_1_V_0;
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode==32'sd1/*1:Emu_opcode*/) && (32'sd11>=
                      $unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd10/*10:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_extras <= Emu_extras|64'sh_ffff&TEme1_1_V_0;
                               Emu_key <= -64'sh1_0000&TEme1_1_V_0;
                               end 
                              if ((32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd1/*1:USA18*/) && (32'sd8/*8:USA20*/!=(64'sh_ffff
                      &(TEme1_1_V_0>>32'sd32))))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_IPv4 <= 1'h0;
                               Emu_src_mac <= Emu_src_mac|((64'h_ffff_ffff&TEme1_1_V_0)<<32'sd16);
                               end 
                              if ((32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd1/*1:USA18*/) && (32'sd8/*8:USA20*/==(64'sh_ffff
                      &(TEme1_1_V_0>>32'sd32))))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_IPv4 <= rtl_unsigned_bitextract0(rtl_sign_extend1((32'sd4/*4:USA22*/==(64'shf&(TEme1_1_V_0>>32'sd52
                              )))));

                               Emu_src_mac <= Emu_src_mac|((64'h_ffff_ffff&TEme1_1_V_0)<<32'sd16);
                               end 
                              if ((32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd3/*3:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_dst_ip <= 64'sh_ffff&(TEme1_1_V_0>>32'sd48);
                               Emu_src_ip <= 64'h_ffff_ffff&(TEme1_1_V_0>>32'sd16);
                               end 
                              if ((32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd6/*6:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_opcode <= rtl_unsigned_bitextract2(64'shff&(TEme1_1_V_0>>32'sd24));
                               Emu_magic_num <= rtl_unsigned_bitextract2(64'shff&(TEme1_1_V_0>>32'sd16));
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode!=32'sd1/*1:Emu_opcode*/) && !Emu_opcode
                       && (32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd9/*9:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_key <= -64'sh1_0000&TEme1_1_V_0;
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode==32'sd1/*1:Emu_opcode*/) && !Emu_opcode
                       && (32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd9/*9:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_extras <= (TEme1_1_V_0<<32'sd16);
                               Emu_key <= -64'sh1_0000&TEme1_1_V_0;
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode==32'sd1/*1:Emu_opcode*/) && !(!Emu_opcode
                      ) && (32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd9/*9:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_extras <= (TEme1_1_V_0<<32'sd16);
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && !(!Emu_opcode) && (Emu_opcode==32'sd4/*4:Emu_opcode*/) && 
                      (32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd9/*9:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_key <= -64'sh1_0000&TEme1_1_V_0;
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode==32'sd1/*1:Emu_opcode*/) && (32'sd11<
                      $unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd10/*10:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_extras <= Emu_extras|64'sh_ffff&TEme1_1_V_0;
                               Emu_key <= -64'sh1_0000&TEme1_1_V_0;
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode==32'sd1/*1:Emu_opcode*/) && (32'sd11>=
                      $unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd11/*11:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_key_value <= TEme1_1_V_0;
                               end 
                              if ((32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd5/*5:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd7/*7:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd8/*8:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((Emu_magic_num!=32'sd128/*128:Emu_magic_num*/) && (32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2
                      ==32'sd9/*9:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode!=32'sd1/*1:Emu_opcode*/) && !Emu_opcode
                       && (32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd9/*9:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_key <= -64'sh1_0000&TEme1_1_V_0;
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode!=32'sd1/*1:Emu_opcode*/) && !(!Emu_opcode
                      ) && (Emu_opcode!=32'sd4/*4:Emu_opcode*/) && (32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd9/*9:USA18*/)) 
                       begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode==32'sd1/*1:Emu_opcode*/) && !(!Emu_opcode
                      ) && (32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd9/*9:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_extras <= (TEme1_1_V_0<<32'sd16);
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && !(!Emu_opcode) && (Emu_opcode==32'sd4/*4:Emu_opcode*/) && 
                      (32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd9/*9:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_key <= -64'sh1_0000&TEme1_1_V_0;
                               end 
                              if ((Emu_magic_num!=32'sd128/*128:Emu_magic_num*/) && (32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2
                      ==32'sd10/*10:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode!=32'sd1/*1:Emu_opcode*/) && (32'sd11>=
                      $unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd10/*10:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((Emu_magic_num!=32'sd128/*128:Emu_magic_num*/) && (32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2
                      ==32'sd11/*11:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode!=32'sd1/*1:Emu_opcode*/) && (32'sd11>=
                      $unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd11/*11:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode==32'sd1/*1:Emu_opcode*/) && (32'sd11<
                      $unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd11/*11:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_key_value <= TEme1_1_V_0;
                               end 
                              if ((TEme1_1_V_2!=32'sd0/*0:USA18*/) && (32'sd11>=$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2!=32'sd1
                      /*1:USA18*/) && (TEme1_1_V_2!=32'sd2/*2:USA18*/) && (TEme1_1_V_2!=32'sd3/*3:USA18*/) && (TEme1_1_V_2!=32'sd4/*4:USA18*/) && 
                      (TEme1_1_V_2!=32'sd5/*5:USA18*/) && (TEme1_1_V_2!=32'sd6/*6:USA18*/) && (TEme1_1_V_2!=32'sd7/*7:USA18*/) && (TEme1_1_V_2
                      !=32'sd8/*8:USA18*/) && (TEme1_1_V_2!=32'sd9/*9:USA18*/) && (TEme1_1_V_2!=32'sd10/*10:USA18*/) && (TEme1_1_V_2!=
                      32'sd11/*11:USA18*/))  begin 
                               TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd5/*5:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd7/*7:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd8/*8:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((Emu_magic_num!=32'sd128/*128:Emu_magic_num*/) && (32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2
                      ==32'sd9/*9:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode!=32'sd1/*1:Emu_opcode*/) && !(!Emu_opcode
                      ) && (Emu_opcode!=32'sd4/*4:Emu_opcode*/) && (32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd9/*9:USA18*/)) 
                       begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((Emu_magic_num!=32'sd128/*128:Emu_magic_num*/) && (32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2
                      ==32'sd10/*10:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode!=32'sd1/*1:Emu_opcode*/) && (32'sd11<
                      $unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd10/*10:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((Emu_magic_num!=32'sd128/*128:Emu_magic_num*/) && (32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2
                      ==32'sd11/*11:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((Emu_magic_num==32'sd128/*128:Emu_magic_num*/) && (Emu_opcode!=32'sd1/*1:Emu_opcode*/) && (32'sd11<
                      $unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2==32'sd11/*11:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                              if ((TEme1_1_V_2!=32'sd0/*0:USA18*/) && (32'sd11<$unsigned(32'd1+TEme1_1_V_2)) && (TEme1_1_V_2!=32'sd1/*1:USA18*/) && 
                      (TEme1_1_V_2!=32'sd2/*2:USA18*/) && (TEme1_1_V_2!=32'sd3/*3:USA18*/) && (TEme1_1_V_2!=32'sd4/*4:USA18*/) && (TEme1_1_V_2
                      !=32'sd5/*5:USA18*/) && (TEme1_1_V_2!=32'sd6/*6:USA18*/) && (TEme1_1_V_2!=32'sd7/*7:USA18*/) && (TEme1_1_V_2!=32'sd8
                      /*8:USA18*/) && (TEme1_1_V_2!=32'sd9/*9:USA18*/) && (TEme1_1_V_2!=32'sd10/*10:USA18*/) && (TEme1_1_V_2!=32'sd11
                      /*11:USA18*/))  begin 
                               xpc10 <= 7'sd6/*6:xpc10*/;
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               end 
                               end 
                      
                  7'sd9/*9:xpc10*/:  begin 
                      if ((TEme1_1_V_3==32'sd128/*128:TEme1.1_V_3*/) && !cam_busy && (TEme1_1_V_4==32'sd2/*2:TEme1.1_V_4*/) && (Emu_mem_controller_cnt
                      !=32'sd255/*255:Emu_mem_controller_cnt*/) && (32'sd4<$signed(rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0))) && (32'sd0
                      /*0:USA28*/==$unsigned(64'sh_ffff&-64'sh1^(64'sh_ffff&TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6
                      +TEca6_0_V_7>>32'sd16))+(TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16)>>32'sd16
                      ))))  begin 
                               xpc10 <= 7'sd10/*10:xpc10*/;
                               TEme1_1_V_9 <= 32'h0;
                               Emu_mem_controller_cnt <= $unsigned(32'd1+Emu_mem_controller_cnt);
                               TEca8_1_V_0 <= 32'h0;
                               Emu_chksumIP <= $unsigned(64'sh_ffff&-64'sh1^hprpin138810);
                               TEca6_0_V_9 <= 64'sh_ffff&-64'sh1^hprpin138810;
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               end 
                              if ((TEme1_1_V_3==32'sd128/*128:TEme1.1_V_3*/) && !cam_busy && (TEme1_1_V_4==32'sd2/*2:TEme1.1_V_4*/) && 
                      (Emu_mem_controller_cnt==32'sd255/*255:Emu_mem_controller_cnt*/) && (32'sd4<$signed(rtl_unsigned_bitextract3(8'd1
                      +TEca6_0_V_0))) && (32'sd0/*0:USA28*/==$unsigned(64'sh_ffff&-64'sh1^(64'sh_ffff&TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6
                      +TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16))+(TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6
                      +TEca6_0_V_7>>32'sd16)>>32'sd16))))  begin 
                               xpc10 <= 7'sd10/*10:xpc10*/;
                               TEme1_1_V_9 <= 32'h0;
                               Emu_mem_controller_cnt <= 32'h0;
                               TEca8_1_V_0 <= 32'h0;
                               Emu_chksumIP <= $unsigned(64'sh_ffff&-64'sh1^hprpin138810);
                               TEca6_0_V_9 <= 64'sh_ffff&-64'sh1^hprpin138810;
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               end 
                              if ((TEme1_1_V_3==32'sd128/*128:TEme1.1_V_3*/) && !cam_busy && (TEme1_1_V_4==32'sd3/*3:TEme1.1_V_4*/) && 
                      (Emu_mem_controller_cnt!=32'sd255/*255:Emu_mem_controller_cnt*/) && (32'sd4<$signed(rtl_unsigned_bitextract3(8'd1
                      +TEca6_0_V_0))) && (32'sd0/*0:USA28*/==$unsigned(64'sh_ffff&-64'sh1^(64'sh_ffff&TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6
                      +TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16))+(TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6
                      +TEca6_0_V_7>>32'sd16)>>32'sd16))))  begin 
                               xpc10 <= 7'sd10/*10:xpc10*/;
                               TEme1_1_V_9 <= 32'h0;
                               Emu_mem_controller_cnt <= $unsigned(32'd1+Emu_mem_controller_cnt);
                               TEca8_1_V_0 <= 32'h0;
                               Emu_chksumIP <= $unsigned(64'sh_ffff&-64'sh1^hprpin138810);
                               TEca6_0_V_9 <= 64'sh_ffff&-64'sh1^hprpin138810;
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               end 
                              if ((TEme1_1_V_3==32'sd128/*128:TEme1.1_V_3*/) && !cam_busy && (TEme1_1_V_4==32'sd3/*3:TEme1.1_V_4*/) && 
                      (Emu_mem_controller_cnt==32'sd255/*255:Emu_mem_controller_cnt*/) && (32'sd4<$signed(rtl_unsigned_bitextract3(8'd1
                      +TEca6_0_V_0))) && (32'sd0/*0:USA28*/==$unsigned(64'sh_ffff&-64'sh1^(64'sh_ffff&TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6
                      +TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16))+(TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6
                      +TEca6_0_V_7>>32'sd16)>>32'sd16))))  begin 
                               xpc10 <= 7'sd10/*10:xpc10*/;
                               TEme1_1_V_9 <= 32'h0;
                               Emu_mem_controller_cnt <= 32'h0;
                               TEca8_1_V_0 <= 32'h0;
                               Emu_chksumIP <= $unsigned(64'sh_ffff&-64'sh1^hprpin138810);
                               TEca6_0_V_9 <= 64'sh_ffff&-64'sh1^hprpin138810;
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               end 
                              if ((TEme1_1_V_3==32'sd128/*128:TEme1.1_V_3*/) && !cam_busy && (TEme1_1_V_4!=32'sd0/*0:TEme1.1_V_4*/) && 
                      (TEme1_1_V_4!=32'sd1/*1:TEme1.1_V_4*/) && (TEme1_1_V_4!=32'sd2/*2:TEme1.1_V_4*/) && (TEme1_1_V_4!=32'sd3/*3:TEme1.1_V_4*/) && 
                      (TEme1_1_V_4!=32'sd4/*4:TEme1.1_V_4*/) && (Emu_mem_controller_cnt!=32'sd255/*255:Emu_mem_controller_cnt*/) && (32'sd4
                      <$signed(rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0))) && (32'sd0/*0:USA28*/==$unsigned(64'sh_ffff&-64'sh1^(64'sh_ffff
                      &TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16))+(TEca6_0_V_9+(64'sh_ffff&
                      TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16)>>32'sd16))))  begin 
                               xpc10 <= 7'sd10/*10:xpc10*/;
                               TEme1_1_V_9 <= 32'h0;
                               Emu_mem_controller_cnt <= $unsigned(32'd1+Emu_mem_controller_cnt);
                               TEca8_1_V_0 <= 32'h0;
                               Emu_chksumIP <= $unsigned(64'sh_ffff&-64'sh1^hprpin138810);
                               TEca6_0_V_9 <= 64'sh_ffff&-64'sh1^hprpin138810;
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               end 
                              if ((TEme1_1_V_3==32'sd128/*128:TEme1.1_V_3*/) && !cam_busy && (TEme1_1_V_4!=32'sd0/*0:TEme1.1_V_4*/) && 
                      (TEme1_1_V_4!=32'sd1/*1:TEme1.1_V_4*/) && (TEme1_1_V_4!=32'sd2/*2:TEme1.1_V_4*/) && (TEme1_1_V_4!=32'sd3/*3:TEme1.1_V_4*/) && 
                      (TEme1_1_V_4!=32'sd4/*4:TEme1.1_V_4*/) && (Emu_mem_controller_cnt==32'sd255/*255:Emu_mem_controller_cnt*/) && (32'sd4
                      <$signed(rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0))) && (32'sd0/*0:USA28*/==$unsigned(64'sh_ffff&-64'sh1^(64'sh_ffff
                      &TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16))+(TEca6_0_V_9+(64'sh_ffff&
                      TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16)>>32'sd16))))  begin 
                               xpc10 <= 7'sd10/*10:xpc10*/;
                               TEme1_1_V_9 <= 32'h0;
                               Emu_mem_controller_cnt <= 32'h0;
                               TEca8_1_V_0 <= 32'h0;
                               Emu_chksumIP <= $unsigned(64'sh_ffff&-64'sh1^hprpin138810);
                               TEca6_0_V_9 <= 64'sh_ffff&-64'sh1^hprpin138810;
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               end 
                              if ((TEme1_1_V_3==32'sd128/*128:TEme1.1_V_3*/) && !cam_busy && (TEme1_1_V_4==32'sd0/*0:TEme1.1_V_4*/) && 
                      (32'sd4<$signed(rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0))) && (32'sd0/*0:USA28*/==$unsigned(64'sh_ffff&-64'sh1
                      ^(64'sh_ffff&TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16))+(TEca6_0_V_9+
                      (64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16)>>32'sd16))))  begin 
                               xpc10 <= 7'sd94/*94:xpc10*/;
                               cam_cmp_din <= Emu_key;
                               TEca8_1_V_0 <= 32'h0;
                               Emu_chksumIP <= $unsigned(64'sh_ffff&-64'sh1^hprpin138810);
                               TEca6_0_V_9 <= 64'sh_ffff&-64'sh1^hprpin138810;
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               end 
                              if ((TEme1_1_V_3==32'sd128/*128:TEme1.1_V_3*/) && !cam_busy && (TEme1_1_V_4==32'sd1/*1:TEme1.1_V_4*/) && 
                      (32'sd4<$signed(rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0))) && (32'sd0/*0:USA28*/==$unsigned(64'sh_ffff&-64'sh1
                      ^(64'sh_ffff&TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16))+(TEca6_0_V_9+
                      (64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16)>>32'sd16))))  begin 
                               xpc10 <= 7'sd89/*89:xpc10*/;
                               cam_cmp_din <= Emu_key;
                               TEca8_1_V_0 <= 32'h0;
                               Emu_chksumIP <= $unsigned(64'sh_ffff&-64'sh1^hprpin138810);
                               TEca6_0_V_9 <= 64'sh_ffff&-64'sh1^hprpin138810;
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               end 
                              if ((TEme1_1_V_3==32'sd128/*128:TEme1.1_V_3*/) && !cam_busy && (TEme1_1_V_4==32'sd4/*4:TEme1.1_V_4*/) && 
                      (32'sd4<$signed(rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0))) && (32'sd0/*0:USA28*/==$unsigned(64'sh_ffff&-64'sh1
                      ^(64'sh_ffff&TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16))+(TEca6_0_V_9+
                      (64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16)>>32'sd16))))  begin 
                               xpc10 <= 7'sd82/*82:xpc10*/;
                               cam_cmp_din <= Emu_key;
                               TEca8_1_V_0 <= 32'h0;
                               Emu_chksumIP <= $unsigned(64'sh_ffff&-64'sh1^hprpin138810);
                               TEca6_0_V_9 <= 64'sh_ffff&-64'sh1^hprpin138810;
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               end 
                              if ((TEme1_1_V_3==32'sd128/*128:TEme1.1_V_3*/) && cam_busy && (32'sd4<$signed(rtl_unsigned_bitextract3(8'd1
                      +TEca6_0_V_0))) && (32'sd0/*0:USA28*/==$unsigned(64'sh_ffff&-64'sh1^(64'sh_ffff&TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6
                      +TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16))+(TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6
                      +TEca6_0_V_7>>32'sd16)>>32'sd16))))  begin 
                               xpc10 <= 7'sd96/*96:xpc10*/;
                               TEca8_1_V_0 <= 32'h0;
                               Emu_chksumIP <= $unsigned(64'sh_ffff&-64'sh1^hprpin138810);
                               TEca6_0_V_9 <= 64'sh_ffff&-64'sh1^hprpin138810;
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               end 
                              if ((32'sd2/*2:USA26*/==rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0)))  begin 
                               xpc10 <= 7'sd8/*8:xpc10*/;
                               TEca6_0_V_1 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0)]);
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               TEca6_0_V_9 <= hprpin138810;
                               end 
                              if ((32'sd4>=$signed(rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0))) && (32'sd1/*1:USA26*/!=rtl_unsigned_bitextract3(8'd1
                      +TEca6_0_V_0)) && (32'sd2/*2:USA26*/!=rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0)) && (32'sd3/*3:USA26*/!=rtl_unsigned_bitextract3(8'd1
                      +TEca6_0_V_0)))  begin 
                               xpc10 <= 7'sd8/*8:xpc10*/;
                               TEca6_0_V_1 <= 64'h0;
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               TEca6_0_V_9 <= hprpin138810;
                               end 
                              if ((32'sd3/*3:USA26*/==rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0)))  begin 
                               xpc10 <= 7'sd8/*8:xpc10*/;
                               TEca6_0_V_1 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0)]);
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               TEca6_0_V_9 <= hprpin138810;
                               end 
                              if ((32'sd4>=$signed(rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0))) && (32'sd4/*4:USA26*/==rtl_unsigned_bitextract3(8'd1
                      +TEca6_0_V_0)))  begin 
                               xpc10 <= 7'sd8/*8:xpc10*/;
                               TEca6_0_V_1 <= $unsigned((A_64_US_CC_SCALbx14_ARC0[64'd4]<<32'sd48));
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               TEca6_0_V_9 <= hprpin138810;
                               end 
                              if ((32'sd1/*1:USA26*/==rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0)))  begin 
                               xpc10 <= 7'sd8/*8:xpc10*/;
                               TEca6_0_V_1 <= $unsigned((A_64_US_CC_SCALbx14_ARC0[64'd1]>>32'sd48));
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               TEca6_0_V_9 <= hprpin138810;
                               end 
                              if ((TEme1_1_V_3!=32'sd128/*128:TEme1.1_V_3*/) && (32'sd4<$signed(rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0
                      ))))  begin 
                               xpc10 <= 7'sd33/*33:xpc10*/;
                               Emu_chksumIP <= $unsigned(64'sh_ffff&-64'sh1^hprpin138810);
                               TEca6_0_V_9 <= 64'sh_ffff&-64'sh1^hprpin138810;
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               end 
                              if ((TEme1_1_V_3==32'sd128/*128:TEme1.1_V_3*/) && (32'sd4<$signed(rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0
                      ))) && (32'sd0/*0:USA28*/!=$unsigned(64'sh_ffff&-64'sh1^(64'sh_ffff&TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7
                      )+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16))+(TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7
                      >>32'sd16)>>32'sd16))))  begin 
                               xpc10 <= 7'sd33/*33:xpc10*/;
                               Emu_chksumIP <= $unsigned(64'sh_ffff&-64'sh1^hprpin138810);
                               TEca6_0_V_9 <= 64'sh_ffff&-64'sh1^hprpin138810;
                               TEca6_0_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca6_0_V_0);
                               end 
                               end 
                      endcase
              if (TEme1_1_V_11) 
                  case (xpc10)
                      7'sd40/*40:xpc10*/:  begin 
                           xpc10 <= 7'sd41/*41:xpc10*/;
                           TEMe20_2_V_1 <= 64'sh_ffff_ffff_ffff&A_64_US_CC_SCALbx14_ARC0[64'd4];
                           TEMe20_2_V_0 <= 64'sh2+(64'sh_ff00&(Emu_UDP_total_length<<32'sd8)|(Emu_UDP_total_length>>32'sd8));
                           A_64_US_CC_SCALbx14_ARC0[64'd3] <= TEMe20_2_V_0;
                           end 
                          
                      7'sd45/*45:xpc10*/:  begin 
                           xpc10 <= 7'sd46/*46:xpc10*/;
                           A_64_US_CC_SCALbx14_ARC0[64'd6] <= 64'sh81_0000|TEMe20_2_V_0;
                           end 
                          
                      7'sd46/*46:xpc10*/:  begin 
                           xpc10 <= 7'sd47/*47:xpc10*/;
                           TEMe20_2_V_0 <= 64'sh800_0000_0100|-64'sh1_0000_0000_0000&A_64_US_CC_SCALbx14_ARC0[64'd7];
                           end 
                          
                      7'sd48/*48:xpc10*/:  begin 
                           xpc10 <= 7'sd49/*49:xpc10*/;
                           TEMe20_2_V_0 <= 64'sh_ffff&A_64_US_CC_SCALbx14_ARC0[64'd8];
                           end 
                          
                      7'sd55/*55:xpc10*/:  begin 
                           xpc10 <= 7'sd56/*56:xpc10*/;
                           TEMe19_2_V_1 <= 64'sh_ffff_ffff_ffff&A_64_US_CC_SCALbx14_ARC0[64'd4];
                           TEMe19_2_V_0 <= 64'sh2+(64'sh_ff00&(Emu_UDP_total_length<<32'sd8)|(Emu_UDP_total_length>>32'sd8));
                           A_64_US_CC_SCALbx14_ARC0[64'd3] <= TEMe19_2_V_0;
                           end 
                          
                      7'sd61/*61:xpc10*/:  begin 
                           xpc10 <= 7'sd62/*62:xpc10*/;
                           TEMe19_2_V_0 <= 64'sh800_0000_0100|-64'sh1_0000_0000_0000&A_64_US_CC_SCALbx14_ARC0[64'd7];
                           end 
                          
                      7'sd63/*63:xpc10*/:  begin 
                           xpc10 <= 7'sd66/*66:xpc10*/;
                           TEMe19_2_V_0 <= 64'sh_ffff&A_64_US_CC_SCALbx14_ARC0[64'd8];
                           end 
                          endcase
                   else 
                  case (xpc10)
                      7'sd40/*40:xpc10*/:  begin 
                           xpc10 <= 7'sd41/*41:xpc10*/;
                           TEMe20_2_V_1 <= 64'sh_ffff_ffff_ffff&A_64_US_CC_SCALbx14_ARC0[64'd4];
                           TEMe20_2_V_0 <= 64'sh6+(64'sh_ff00&(Emu_UDP_total_length<<32'sd8)|(Emu_UDP_total_length>>32'sd8));
                           A_64_US_CC_SCALbx14_ARC0[64'd3] <= TEMe20_2_V_0;
                           end 
                          
                      7'sd45/*45:xpc10*/:  begin 
                           xpc10 <= 7'sd46/*46:xpc10*/;
                           A_64_US_CC_SCALbx14_ARC0[64'd6] <= 64'sh4_0000_0081_0000|TEMe20_2_V_0;
                           end 
                          
                      7'sd46/*46:xpc10*/:  begin 
                           xpc10 <= 7'sd47/*47:xpc10*/;
                           TEMe20_2_V_0 <= 64'shc00_0000_0000|-64'sh1_0000_0000_0000&A_64_US_CC_SCALbx14_ARC0[64'd7];
                           end 
                          
                      7'sd48/*48:xpc10*/:  begin 
                           xpc10 <= 7'sd52/*52:xpc10*/;
                           A_64_US_CC_SCALbx14_ARC0[64'd9] <= 64'sh_ffff_ffff_0000&(Emu_flag>>32'sd16)|(Emu_key_value<<32'sd48);
                           end 
                          
                      7'sd55/*55:xpc10*/:  begin 
                           xpc10 <= 7'sd56/*56:xpc10*/;
                           TEMe19_2_V_1 <= 64'sh_ffff_ffff_ffff&A_64_US_CC_SCALbx14_ARC0[64'd4];
                           TEMe19_2_V_0 <= -64'd6+(64'sh_ff00&(Emu_UDP_total_length<<32'sd8)|(Emu_UDP_total_length>>32'sd8));
                           A_64_US_CC_SCALbx14_ARC0[64'd3] <= TEMe19_2_V_0;
                           end 
                          
                      7'sd61/*61:xpc10*/:  begin 
                           xpc10 <= 7'sd62/*62:xpc10*/;
                           TEMe19_2_V_0 <= -64'sh1_0000_0000_0000&A_64_US_CC_SCALbx14_ARC0[64'd7];
                           end 
                          
                      7'sd63/*63:xpc10*/:  begin 
                           xpc10 <= 7'sd64/*64:xpc10*/;
                           TEMe19_2_V_0 <= 64'sh_ffff&A_64_US_CC_SCALbx14_ARC0[64'd8];
                           end 
                          endcase

              case (xpc10)
                  7'sd0/*0:xpc10*/:  begin 
                       xpc10 <= 7'sd1/*1:xpc10*/;
                       s_axis_tready <= 1'h1;
                       m_axis_tuser_low <= 64'h0;
                       m_axis_tuser_hi <= 64'h0;
                       m_axis_tvalid <= 1'h0;
                       m_axis_tlast <= 1'h0;
                       m_axis_tkeep <= 8'h0;
                       m_axis_tdata <= 64'h0;
                       TEme1_1_V_11 <= 1'h0;
                       TEme1_1_V_9 <= 32'h0;
                       TEme1_1_V_8 <= 1'h0;
                       TEme1_1_V_7 <= 1'h0;
                       TEme1_1_V_6 <= 1'h0;
                       TEme1_1_V_5 <= 32'h0;
                       TEme1_1_V_4 <= 8'h0;
                       TEme1_1_V_3 <= 8'h0;
                       TEme1_1_V_2 <= 32'h0;
                       Emu_mem_controller_cnt <= 32'h0;
                       Emu_chksumIP <= 64'h0;
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
                      
                  7'sd1/*1:xpc10*/:  begin 
                      if (s_axis_tvalid && s_axis_tlast)  begin 
                               xpc10 <= 7'sd2/*2:xpc10*/;
                               s_axis_tready <= 1'h0;
                               TERe1_1_V_2 <= 1'h0;
                               TERe1_1_V_1 <= 32'h0;
                               TERe1_1_V_0 <= 32'h1;
                               TERe1_1_V_4 <= 8'h0;
                               TERe1_1_V_3 <= 64'h0;
                               A_64_US_CC_SCALbx10_ARA0[32'h0] <= s_axis_tuser_low;
                               A_64_US_CC_SCALbx12_ARB0[32'h0] <= s_axis_tuser_hi;
                               A_8_US_CC_SCALbx20_ARA0[32'h0] <= rtl_unsigned_bitextract3(s_axis_tkeep);
                               A_64_US_CC_SCALbx14_ARC0[32'h0] <= s_axis_tdata;
                               end 
                              if (s_axis_tvalid && !s_axis_tlast)  begin 
                               xpc10 <= 7'sd2/*2:xpc10*/;
                               s_axis_tready <= 1'h1;
                               TERe1_1_V_2 <= rtl_unsigned_bitextract0(s_axis_tvalid);
                               TERe1_1_V_1 <= 32'h0;
                               TERe1_1_V_0 <= 32'h1;
                               TERe1_1_V_4 <= 8'h0;
                               TERe1_1_V_3 <= 64'h0;
                               A_64_US_CC_SCALbx10_ARA0[32'h0] <= s_axis_tuser_low;
                               A_64_US_CC_SCALbx12_ARB0[32'h0] <= s_axis_tuser_hi;
                               A_8_US_CC_SCALbx20_ARA0[32'h0] <= rtl_unsigned_bitextract3(s_axis_tkeep);
                               A_64_US_CC_SCALbx14_ARC0[32'h0] <= s_axis_tdata;
                               end 
                              if (!s_axis_tvalid)  begin 
                               xpc10 <= 7'sd2/*2:xpc10*/;
                               TERe1_1_V_2 <= 1'h1;
                               TERe1_1_V_0 <= 32'h0;
                               TERe1_1_V_4 <= 8'h0;
                               TERe1_1_V_3 <= 64'h0;
                               TERe1_1_V_1 <= 32'h0;
                               end 
                               end 
                      
                  7'sd2/*2:xpc10*/:  begin 
                      if (s_axis_tvalid && s_axis_tlast && TERe1_1_V_2)  begin 
                               s_axis_tready <= 1'h0;
                               TERe1_1_V_2 <= 1'h0;
                               TERe1_1_V_1 <= TERe1_1_V_0;
                               TERe1_1_V_0 <= $unsigned(32'd1+TERe1_1_V_0);
                               A_64_US_CC_SCALbx10_ARA0[TERe1_1_V_0] <= s_axis_tuser_low;
                               A_64_US_CC_SCALbx12_ARB0[TERe1_1_V_0] <= s_axis_tuser_hi;
                               A_8_US_CC_SCALbx20_ARA0[TERe1_1_V_0] <= rtl_unsigned_bitextract3(s_axis_tkeep);
                               A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_0] <= s_axis_tdata;
                               end 
                              if (s_axis_tvalid && !s_axis_tlast && TERe1_1_V_2)  begin 
                               s_axis_tready <= 1'h1;
                               TERe1_1_V_2 <= rtl_unsigned_bitextract0(s_axis_tvalid);
                               TERe1_1_V_1 <= TERe1_1_V_0;
                               TERe1_1_V_0 <= $unsigned(32'd1+TERe1_1_V_0);
                               A_64_US_CC_SCALbx10_ARA0[TERe1_1_V_0] <= s_axis_tuser_low;
                               A_64_US_CC_SCALbx12_ARB0[TERe1_1_V_0] <= s_axis_tuser_hi;
                               A_8_US_CC_SCALbx20_ARA0[TERe1_1_V_0] <= rtl_unsigned_bitextract3(s_axis_tkeep);
                               A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_0] <= s_axis_tdata;
                               end 
                              if (!TERe1_1_V_2)  begin 
                               xpc10 <= 7'sd3/*3:xpc10*/;
                               TERe1_1_V_4 <= rtl_unsigned_bitextract3(A_8_US_CC_SCALbx20_ARA0[TERe1_1_V_1]);
                               TERe1_1_V_3 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_1]);
                               end 
                               end 
                      
                  7'sd3/*3:xpc10*/:  begin 
                      
                      case (TERe1_1_V_4)
                          32'sd3/*3:TERe1.1_V_4*/:  begin 
                               xpc10 <= 7'sd4/*4:xpc10*/;
                               A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_1] <= 64'sh_ffff&TERe1_1_V_3;
                               end 
                              
                          32'sd7/*7:TERe1.1_V_4*/:  begin 
                               xpc10 <= 7'sd4/*4:xpc10*/;
                               A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_1] <= 64'shff_ffff&TERe1_1_V_3;
                               end 
                              
                          32'sd15/*15:TERe1.1_V_4*/:  begin 
                               xpc10 <= 7'sd4/*4:xpc10*/;
                               A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_1] <= 64'h_ffff_ffff&TERe1_1_V_3;
                               end 
                              
                          32'sd31/*31:TERe1.1_V_4*/:  begin 
                               xpc10 <= 7'sd4/*4:xpc10*/;
                               A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_1] <= 64'shff_ffff_ffff&TERe1_1_V_3;
                               end 
                              
                          32'sd63/*63:TERe1.1_V_4*/:  begin 
                               xpc10 <= 7'sd4/*4:xpc10*/;
                               A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_1] <= 64'sh_ffff_ffff_ffff&TERe1_1_V_3;
                               end 
                              endcase
                      if (((TERe1_1_V_4==32'sd127/*127:TERe1.1_V_4*/)? 1'd1: (TERe1_1_V_4!=32'sd7/*7:TERe1.1_V_4*/) && (TERe1_1_V_4!=
                      32'sd15/*15:TERe1.1_V_4*/) && (TERe1_1_V_4!=32'sd31/*31:TERe1.1_V_4*/) && (TERe1_1_V_4!=32'sd63/*63:TERe1.1_V_4*/) && 
                      (TERe1_1_V_4!=32'sd1/*1:TERe1.1_V_4*/) && (TERe1_1_V_4!=32'sd2/*2:TERe1.1_V_4*/) && (TERe1_1_V_4!=32'sd3/*3:TERe1.1_V_4*/))) 
                       xpc10 <= 7'sd4/*4:xpc10*/;
                          if ((TERe1_1_V_4==32'sd127/*127:TERe1.1_V_4*/))  A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_1] <= 64'shff_ffff_ffff_ffff
                          &TERe1_1_V_3;

                          if ((TERe1_1_V_4==32'sd1/*1:TERe1.1_V_4*/) || (TERe1_1_V_4==32'sd2/*2:TERe1.1_V_4*/))  xpc10 <= 7'sd4/*4:xpc10*/;
                          if ((TERe1_1_V_4==32'sd1/*1:TERe1.1_V_4*/))  A_64_US_CC_SCALbx14_ARC0[TERe1_1_V_1] <= 64'shff&TERe1_1_V_3;
                           end 
                      
                  7'sd19/*19:xpc10*/:  begin 
                      if ((TEme1_1_V_4==32'sd1/*1:TEme1.1_V_4*/))  begin 
                               xpc10 <= 7'sd69/*69:xpc10*/;
                               TEMe18_1_V_1 <= -64'sh1_0000&A_64_US_CC_SCALbx14_ARC0[64'd2];
                               TEMe18_1_V_0 <= 64'sh_ffff&-64'd22+(64'sh_ff00&(Emu_IP_total_length<<32'sd8)|(Emu_IP_total_length>>32'sd8
                              ));

                               end 
                              if ((TEme1_1_V_4==32'sd4/*4:TEme1.1_V_4*/) && TEme1_1_V_11)  begin 
                               xpc10 <= 7'sd53/*53:xpc10*/;
                               TEMe19_2_V_1 <= -64'sh1_0000&A_64_US_CC_SCALbx14_ARC0[64'd2];
                               TEMe19_2_V_0 <= 64'sh_ffff&64'sh2+(64'sh_ff00&(Emu_IP_total_length<<32'sd8)|(Emu_IP_total_length>>32'sd8
                              ));

                               end 
                              if ((TEme1_1_V_4==32'sd4/*4:TEme1.1_V_4*/) && !TEme1_1_V_11)  begin 
                               xpc10 <= 7'sd53/*53:xpc10*/;
                               TEMe19_2_V_1 <= -64'sh1_0000&A_64_US_CC_SCALbx14_ARC0[64'd2];
                               TEMe19_2_V_0 <= 64'sh_ffff&-64'd6+(64'sh_ff00&(Emu_IP_total_length<<32'sd8)|(Emu_IP_total_length>>32'sd8
                              ));

                               end 
                              if ((TEme1_1_V_4!=32'sd1/*1:TEme1.1_V_4*/) && (TEme1_1_V_4!=32'sd4/*4:TEme1.1_V_4*/) && !TEme1_1_V_4 && 
                      TEme1_1_V_11)  begin 
                               xpc10 <= 7'sd38/*38:xpc10*/;
                               TEMe20_2_V_1 <= -64'sh1_0000&A_64_US_CC_SCALbx14_ARC0[64'd2];
                               TEMe20_2_V_0 <= 64'sh_ffff&64'sh2+(64'sh_ff00&(Emu_IP_total_length<<32'sd8)|(Emu_IP_total_length>>32'sd8
                              ));

                               end 
                              if ((TEme1_1_V_4!=32'sd1/*1:TEme1.1_V_4*/) && (TEme1_1_V_4!=32'sd4/*4:TEme1.1_V_4*/) && !TEme1_1_V_4 && 
                      !TEme1_1_V_11)  begin 
                               xpc10 <= 7'sd38/*38:xpc10*/;
                               TEMe20_2_V_1 <= -64'sh1_0000&A_64_US_CC_SCALbx14_ARC0[64'd2];
                               TEMe20_2_V_0 <= 64'sh_ffff&64'sh6+(64'sh_ff00&(Emu_IP_total_length<<32'sd8)|(Emu_IP_total_length>>32'sd8
                              ));

                               end 
                              if ((TEme1_1_V_4!=32'sd1/*1:TEme1.1_V_4*/) && (TEme1_1_V_4!=32'sd4/*4:TEme1.1_V_4*/) && !(!TEme1_1_V_4)
                      )  xpc10 <= 7'sd20/*20:xpc10*/;
                           end 
                      
                  7'sd23/*23:xpc10*/:  begin 
                      if ((32'sd2/*2:USA30*/==rtl_unsigned_bitextract3(8'd1+TEca21_7_V_0)))  begin 
                               xpc10 <= 7'sd22/*22:xpc10*/;
                               TEca21_7_V_1 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[rtl_unsigned_bitextract3(8'd1+TEca21_7_V_0)]);
                               TEca21_7_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca21_7_V_0);
                               TEca21_7_V_9 <= hprpin150110;
                               end 
                              if ((32'sd4>=$signed(rtl_unsigned_bitextract3(8'd1+TEca21_7_V_0))) && (32'sd1/*1:USA30*/!=rtl_unsigned_bitextract3(8'd1
                      +TEca21_7_V_0)) && (32'sd2/*2:USA30*/!=rtl_unsigned_bitextract3(8'd1+TEca21_7_V_0)) && (32'sd3/*3:USA30*/!=rtl_unsigned_bitextract3(8'd1
                      +TEca21_7_V_0)))  begin 
                               xpc10 <= 7'sd22/*22:xpc10*/;
                               TEca21_7_V_1 <= 64'h0;
                               TEca21_7_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca21_7_V_0);
                               TEca21_7_V_9 <= hprpin150110;
                               end 
                              if ((32'sd3/*3:USA30*/==rtl_unsigned_bitextract3(8'd1+TEca21_7_V_0)))  begin 
                               xpc10 <= 7'sd22/*22:xpc10*/;
                               TEca21_7_V_1 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[rtl_unsigned_bitextract3(8'd1+TEca21_7_V_0)]);
                               TEca21_7_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca21_7_V_0);
                               TEca21_7_V_9 <= hprpin150110;
                               end 
                              if ((32'sd4>=$signed(rtl_unsigned_bitextract3(8'd1+TEca21_7_V_0))) && (32'sd4/*4:USA30*/==rtl_unsigned_bitextract3(8'd1
                      +TEca21_7_V_0)))  begin 
                               xpc10 <= 7'sd22/*22:xpc10*/;
                               TEca21_7_V_1 <= $unsigned((A_64_US_CC_SCALbx14_ARC0[64'd4]<<32'sd48));
                               TEca21_7_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca21_7_V_0);
                               TEca21_7_V_9 <= hprpin150110;
                               end 
                              if ((32'sd1/*1:USA30*/==rtl_unsigned_bitextract3(8'd1+TEca21_7_V_0)))  begin 
                               xpc10 <= 7'sd22/*22:xpc10*/;
                               TEca21_7_V_1 <= $unsigned((A_64_US_CC_SCALbx14_ARC0[64'd1]>>32'sd48));
                               TEca21_7_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca21_7_V_0);
                               TEca21_7_V_9 <= hprpin150110;
                               end 
                              if ((32'sd4<$signed(rtl_unsigned_bitextract3(8'd1+TEca21_7_V_0))))  begin 
                               xpc10 <= 7'sd24/*24:xpc10*/;
                               Emu_chksumIP <= $unsigned(64'sh_ffff&-64'sh1^hprpin150110);
                               TEca21_7_V_9 <= 64'sh_ffff&-64'sh1^hprpin150110;
                               TEca21_7_V_0 <= rtl_unsigned_bitextract3(8'd1+TEca21_7_V_0);
                               end 
                               end 
                      
                  7'sd33/*33:xpc10*/:  begin 
                      if ((TEme1_1_V_5>=32'h0) && !m_axis_tready)  begin 
                               xpc10 <= 7'sd35/*35:xpc10*/;
                               TESe28_3_V_0 <= 32'h0;
                               m_axis_tuser_low <= 64'h0;
                               m_axis_tuser_hi <= 64'h0;
                               m_axis_tkeep <= 8'h0;
                               m_axis_tdata <= 64'h0;
                               m_axis_tlast <= 1'h0;
                               m_axis_tvalid <= 1'h1;
                               end 
                              if ((TEme1_1_V_5>=32'h0) && m_axis_tready)  begin 
                               xpc10 <= 7'sd35/*35:xpc10*/;
                               TESe28_3_V_0 <= 32'h1;
                               m_axis_tuser_low <= $unsigned(A_64_US_CC_SCALbx10_ARA0[32'h0]);
                               m_axis_tuser_hi <= $unsigned(A_64_US_CC_SCALbx12_ARB0[32'h0]);
                               m_axis_tlast <= (TEme1_1_V_5==32'sd0/*0:TEme1.1_V_5*/);
                               m_axis_tkeep <= rtl_unsigned_bitextract3(A_8_US_CC_SCALbx20_ARA0[32'h0]);
                               m_axis_tdata <= $unsigned(A_64_US_CC_SCALbx14_ARC0[32'h0]);
                               m_axis_tvalid <= 1'h1;
                               end 
                              if ((TEme1_1_V_5<32'h0))  begin 
                               xpc10 <= 7'sd34/*34:xpc10*/;
                               m_axis_tuser_low <= 64'h0;
                               m_axis_tuser_hi <= 64'h0;
                               m_axis_tkeep <= 8'h0;
                               m_axis_tdata <= 64'h0;
                               m_axis_tlast <= 1'h0;
                               m_axis_tvalid <= 1'h0;
                               TESe28_3_V_0 <= 32'h0;
                               end 
                               end 
                      
                  7'sd95/*95:xpc10*/:  begin 
                      if (!cam_match && (Emu_mem_controller_cnt!=32'sd255/*255:Emu_mem_controller_cnt*/))  begin 
                               xpc10 <= 7'sd10/*10:xpc10*/;
                               TEme1_1_V_9 <= 32'h100;
                               Emu_mem_controller_cnt <= $unsigned(32'd1+Emu_mem_controller_cnt);
                               TEca8_1_V_0 <= 32'h100;
                               end 
                              if (!cam_match && (Emu_mem_controller_cnt==32'sd255/*255:Emu_mem_controller_cnt*/))  begin 
                               xpc10 <= 7'sd10/*10:xpc10*/;
                               TEme1_1_V_9 <= 32'h100;
                               Emu_mem_controller_cnt <= 32'h0;
                               TEca8_1_V_0 <= 32'h100;
                               end 
                              if (cam_match && (Emu_mem_controller_cnt!=32'sd255/*255:Emu_mem_controller_cnt*/))  begin 
                               xpc10 <= 7'sd10/*10:xpc10*/;
                               TEme1_1_V_9 <= $signed(cam_match_addr);
                               Emu_mem_controller_cnt <= $unsigned(32'd1+Emu_mem_controller_cnt);
                               TEca8_1_V_0 <= $signed(cam_match_addr);
                               end 
                              if (cam_match && (Emu_mem_controller_cnt==32'sd255/*255:Emu_mem_controller_cnt*/))  begin 
                               xpc10 <= 7'sd10/*10:xpc10*/;
                               TEme1_1_V_9 <= $signed(cam_match_addr);
                               Emu_mem_controller_cnt <= 32'h0;
                               TEca8_1_V_0 <= $signed(cam_match_addr);
                               end 
                               end 
                      
                  7'sd96/*96:xpc10*/:  begin 
                      if (!cam_busy && (TEme1_1_V_4==32'sd2/*2:TEme1.1_V_4*/) && (Emu_mem_controller_cnt!=32'sd255/*255:Emu_mem_controller_cnt*/)) 
                       begin 
                               xpc10 <= 7'sd10/*10:xpc10*/;
                               TEme1_1_V_9 <= TEca8_1_V_0;
                               Emu_mem_controller_cnt <= $unsigned(32'd1+Emu_mem_controller_cnt);
                               end 
                              if (!cam_busy && (TEme1_1_V_4==32'sd2/*2:TEme1.1_V_4*/) && (Emu_mem_controller_cnt==32'sd255/*255:Emu_mem_controller_cnt*/)) 
                       begin 
                               xpc10 <= 7'sd10/*10:xpc10*/;
                               TEme1_1_V_9 <= TEca8_1_V_0;
                               Emu_mem_controller_cnt <= 32'h0;
                               end 
                              if (!cam_busy && (TEme1_1_V_4==32'sd3/*3:TEme1.1_V_4*/) && (Emu_mem_controller_cnt!=32'sd255/*255:Emu_mem_controller_cnt*/)) 
                       begin 
                               xpc10 <= 7'sd10/*10:xpc10*/;
                               TEme1_1_V_9 <= TEca8_1_V_0;
                               Emu_mem_controller_cnt <= $unsigned(32'd1+Emu_mem_controller_cnt);
                               end 
                              if (!cam_busy && (TEme1_1_V_4==32'sd3/*3:TEme1.1_V_4*/) && (Emu_mem_controller_cnt==32'sd255/*255:Emu_mem_controller_cnt*/)) 
                       begin 
                               xpc10 <= 7'sd10/*10:xpc10*/;
                               TEme1_1_V_9 <= TEca8_1_V_0;
                               Emu_mem_controller_cnt <= 32'h0;
                               end 
                              if (!cam_busy && (TEme1_1_V_4!=32'sd0/*0:TEme1.1_V_4*/) && (TEme1_1_V_4!=32'sd1/*1:TEme1.1_V_4*/) && (TEme1_1_V_4
                      !=32'sd2/*2:TEme1.1_V_4*/) && (TEme1_1_V_4!=32'sd3/*3:TEme1.1_V_4*/) && (TEme1_1_V_4!=32'sd4/*4:TEme1.1_V_4*/) && 
                      (Emu_mem_controller_cnt!=32'sd255/*255:Emu_mem_controller_cnt*/))  begin 
                               xpc10 <= 7'sd10/*10:xpc10*/;
                               TEme1_1_V_9 <= TEca8_1_V_0;
                               Emu_mem_controller_cnt <= $unsigned(32'd1+Emu_mem_controller_cnt);
                               end 
                              if (!cam_busy && (TEme1_1_V_4!=32'sd0/*0:TEme1.1_V_4*/) && (TEme1_1_V_4!=32'sd1/*1:TEme1.1_V_4*/) && (TEme1_1_V_4
                      !=32'sd2/*2:TEme1.1_V_4*/) && (TEme1_1_V_4!=32'sd3/*3:TEme1.1_V_4*/) && (TEme1_1_V_4!=32'sd4/*4:TEme1.1_V_4*/) && 
                      (Emu_mem_controller_cnt==32'sd255/*255:Emu_mem_controller_cnt*/))  begin 
                               xpc10 <= 7'sd10/*10:xpc10*/;
                               TEme1_1_V_9 <= TEca8_1_V_0;
                               Emu_mem_controller_cnt <= 32'h0;
                               end 
                              if (!cam_busy && (TEme1_1_V_4==32'sd0/*0:TEme1.1_V_4*/))  begin 
                               xpc10 <= 7'sd94/*94:xpc10*/;
                               cam_cmp_din <= Emu_key;
                               end 
                              if (!cam_busy && (TEme1_1_V_4==32'sd1/*1:TEme1.1_V_4*/))  begin 
                               xpc10 <= 7'sd89/*89:xpc10*/;
                               cam_cmp_din <= Emu_key;
                               end 
                              if (!cam_busy && (TEme1_1_V_4==32'sd4/*4:TEme1.1_V_4*/))  begin 
                               xpc10 <= 7'sd82/*82:xpc10*/;
                               cam_cmp_din <= Emu_key;
                               end 
                               end 
                      endcase
              if (cam_match) 
                  case (xpc10)
                      7'sd83/*83:xpc10*/:  begin 
                           xpc10 <= 7'sd84/*84:xpc10*/;
                           TEca8_1_V_0 <= cam_match_addr;
                           end 
                          
                      7'sd84/*84:xpc10*/:  xpc10 <= 7'sd85/*85:xpc10*/;

                      7'sd90/*90:xpc10*/:  begin 
                           xpc10 <= 7'sd91/*91:xpc10*/;
                           TEca8_1_V_0 <= rtl_unsigned_extend4(rtl_unsigned_bitextract3(cam_match_addr));
                           cam_wr_addr <= rtl_unsigned_bitextract3(cam_match_addr);
                           cam_din <= Emu_key;
                           end 
                          endcase
                   else 
                  case (xpc10)
                      7'sd83/*83:xpc10*/:  begin 
                           xpc10 <= 7'sd84/*84:xpc10*/;
                           TEca8_1_V_0 <= 32'h100;
                           end 
                          
                      7'sd90/*90:xpc10*/:  begin 
                           xpc10 <= 7'sd91/*91:xpc10*/;
                           TEca8_1_V_0 <= rtl_unsigned_extend4(rtl_unsigned_bitextract3(Emu_mem_controller_cnt));
                           cam_wr_addr <= rtl_unsigned_bitextract3(Emu_mem_controller_cnt);
                           cam_din <= Emu_key;
                           end 
                          endcase

              case (xpc10)
                  7'sd34/*34:xpc10*/:  begin 
                       xpc10 <= 7'sd1/*1:xpc10*/;
                       s_axis_tready <= 1'h1;
                       m_axis_tuser_low <= 64'h0;
                       m_axis_tuser_hi <= 64'h0;
                       m_axis_tvalid <= 1'h0;
                       m_axis_tlast <= 1'h0;
                       m_axis_tkeep <= 8'h0;
                       m_axis_tdata <= 64'h0;
                       TEme1_1_V_5 <= 32'h0;
                       Emu_chksum_UDP <= 64'h0;
                       Emu_proto_ICMP <= 1'h0;
                       Emu_proto_UDP <= 1'h0;
                       Emu_IPv4 <= 1'h0;
                       end 
                      
                  7'sd35/*35:xpc10*/:  begin 
                      if ((TEme1_1_V_5<TESe28_3_V_0))  begin 
                               xpc10 <= 7'sd34/*34:xpc10*/;
                               m_axis_tuser_low <= 64'h0;
                               m_axis_tuser_hi <= 64'h0;
                               m_axis_tkeep <= 8'h0;
                               m_axis_tdata <= 64'h0;
                               m_axis_tlast <= 1'h0;
                               m_axis_tvalid <= 1'h0;
                               end 
                              if (m_axis_tready && (TEme1_1_V_5>=TESe28_3_V_0))  begin 
                               TESe28_3_V_0 <= $unsigned(32'd1+TESe28_3_V_0);
                               m_axis_tuser_low <= $unsigned(A_64_US_CC_SCALbx10_ARA0[TESe28_3_V_0]);
                               m_axis_tuser_hi <= $unsigned(A_64_US_CC_SCALbx12_ARB0[TESe28_3_V_0]);
                               m_axis_tlast <= (TEme1_1_V_5==TESe28_3_V_0);
                               m_axis_tkeep <= rtl_unsigned_bitextract3(A_8_US_CC_SCALbx20_ARA0[TESe28_3_V_0]);
                               m_axis_tdata <= $unsigned(A_64_US_CC_SCALbx14_ARC0[TESe28_3_V_0]);
                               end 
                               end 
                      
                  7'sd37/*37:xpc10*/:  begin 
                      if ((TEme1_1_V_5<$unsigned(32'd1+TEme1_1_V_2)))  begin 
                               xpc10 <= 7'sd27/*27:xpc10*/;
                               Emu_tmp2 <= Emu_dst_ip|(Emu_src_ip<<32'sd32);
                               Emu_tmp3 <= 64'sh_1100|-64'sh1_0000_0000_0000&A_64_US_CC_SCALbx14_ARC0[64'd4];
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_chksum_UDP <= hprpin158610;
                               end 
                              if ((TEme1_1_V_5>=$unsigned(32'd1+TEme1_1_V_2)) && (32'sd4/*4:USA32*/==$unsigned(32'd1+TEme1_1_V_2)))  begin 
                               xpc10 <= 7'sd36/*36:xpc10*/;
                               Emu_tmp2 <= $unsigned((A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]>>32'sd16));
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_chksum_UDP <= hprpin158610;
                               end 
                              if ((TEme1_1_V_5>=$unsigned(32'd1+TEme1_1_V_2)) && (32'sd4/*4:USA32*/!=$unsigned(32'd1+TEme1_1_V_2)))  begin 
                               xpc10 <= 7'sd36/*36:xpc10*/;
                               Emu_tmp2 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[$unsigned(32'd1+TEme1_1_V_2)]);
                               TEme1_1_V_2 <= $unsigned(32'd1+TEme1_1_V_2);
                               Emu_chksum_UDP <= hprpin158610;
                               end 
                               end 
                      endcase
              if ((Emu_mem_controller_cnt==32'sd255/*255:Emu_mem_controller_cnt*/)) 
                  case (xpc10)
                      7'sd88/*88:xpc10*/:  begin 
                           xpc10 <= 7'sd10/*10:xpc10*/;
                           TEme1_1_V_9 <= TEca8_1_V_0;
                           Emu_mem_controller_cnt <= 32'h0;
                           end 
                          
                      7'sd93/*93:xpc10*/:  begin 
                           xpc10 <= 7'sd10/*10:xpc10*/;
                           TEme1_1_V_9 <= TEca8_1_V_0;
                           Emu_mem_controller_cnt <= 32'h0;
                           end 
                          endcase
                   else 
                  case (xpc10)
                      7'sd88/*88:xpc10*/:  begin 
                           xpc10 <= 7'sd10/*10:xpc10*/;
                           TEme1_1_V_9 <= TEca8_1_V_0;
                           Emu_mem_controller_cnt <= $unsigned(32'd1+Emu_mem_controller_cnt);
                           end 
                          
                      7'sd93/*93:xpc10*/:  begin 
                           xpc10 <= 7'sd10/*10:xpc10*/;
                           TEme1_1_V_9 <= TEca8_1_V_0;
                           Emu_mem_controller_cnt <= $unsigned(32'd1+Emu_mem_controller_cnt);
                           end 
                          endcase
              if ((xpc10==7'sd10/*10:xpc10*/))  begin 
                      if ((TEme1_1_V_4==32'sd1/*1:TEme1.1_V_4*/))  begin 
                               xpc10 <= 7'sd11/*11:xpc10*/;
                               TEme1_1_V_11 <= (TEme1_1_V_9==32'sd256/*256:TEme1.1_V_9*/);
                               A_64_US_CC_SCALbx16_ARD0[TEme1_1_V_9] <= Emu_extras;
                               A_64_US_CC_SCALbx18_ARE0[TEme1_1_V_9] <= Emu_key_value;
                               end 
                              if ((TEme1_1_V_4!=32'sd1/*1:TEme1.1_V_4*/) && !TEme1_1_V_4)  begin 
                               xpc10 <= 7'sd11/*11:xpc10*/;
                               TEme1_1_V_11 <= (TEme1_1_V_9==32'sd256/*256:TEme1.1_V_9*/);
                               Emu_flag <= $unsigned(A_64_US_CC_SCALbx16_ARD0[TEme1_1_V_9]);
                               Emu_key_value <= $unsigned(A_64_US_CC_SCALbx18_ARE0[TEme1_1_V_9]);
                               end 
                              if ((TEme1_1_V_4!=32'sd1/*1:TEme1.1_V_4*/) && !(!TEme1_1_V_4))  begin 
                               xpc10 <= 7'sd11/*11:xpc10*/;
                               TEme1_1_V_11 <= (TEme1_1_V_9==32'sd256/*256:TEme1.1_V_9*/);
                               end 
                               end 
                      if (!cam_match && (Emu_mem_controller_cnt!=32'sd255/*255:Emu_mem_controller_cnt*/) && (xpc10==7'sd84/*84:xpc10*/)) 
               begin 
                       xpc10 <= 7'sd10/*10:xpc10*/;
                       TEme1_1_V_9 <= TEca8_1_V_0;
                       Emu_mem_controller_cnt <= $unsigned(32'd1+Emu_mem_controller_cnt);
                       end 
                      if (!cam_match && (Emu_mem_controller_cnt==32'sd255/*255:Emu_mem_controller_cnt*/) && (xpc10==7'sd84/*84:xpc10*/)) 
               begin 
                       xpc10 <= 7'sd10/*10:xpc10*/;
                       TEme1_1_V_9 <= TEca8_1_V_0;
                       Emu_mem_controller_cnt <= 32'h0;
                       end 
                      
              case (xpc10)
                  7'sd4/*4:xpc10*/:  begin 
                       xpc10 <= 7'sd5/*5:xpc10*/;
                       TEme1_1_V_1 <= $unsigned(A_64_US_CC_SCALbx10_ARA0[32'h0]);
                       TEme1_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[32'h0]);
                       TEme1_1_V_2 <= 32'h0;
                       TEme1_1_V_5 <= TERe1_1_V_1;
                       TERe1_1_V_0 <= 32'h0;
                       s_axis_tready <= 1'h0;
                       end 
                      
                  7'sd6/*6:xpc10*/:  begin 
                       xpc10 <= 7'sd7/*7:xpc10*/;
                       TEme1_1_V_4 <= rtl_unsigned_bitextract3(Emu_opcode);
                       TEme1_1_V_3 <= rtl_unsigned_bitextract3(Emu_magic_num);
                       TEme1_1_V_8 <= rtl_unsigned_bitextract5(Emu_proto_ICMP);
                       TEme1_1_V_7 <= rtl_unsigned_bitextract5(Emu_proto_UDP);
                       TEme1_1_V_6 <= rtl_unsigned_bitextract5(Emu_IPv4);
                       end 
                      
                  7'sd7/*7:xpc10*/:  begin 
                      if (TEme1_1_V_6 && TEme1_1_V_7)  begin 
                               xpc10 <= 7'sd8/*8:xpc10*/;
                               TEca6_0_V_1 <= $unsigned((A_64_US_CC_SCALbx14_ARC0[64'd1]>>32'sd48));
                               TEca6_0_V_0 <= 8'h1;
                               TEca6_0_V_9 <= 64'h0;
                               TEca6_0_V_7 <= 64'h0;
                               TEca6_0_V_6 <= 64'h0;
                               end 
                              if ((TEme1_1_V_6? !TEme1_1_V_7: 1'd1))  xpc10 <= 7'sd33/*33:xpc10*/;
                           end 
                      
                  7'sd8/*8:xpc10*/:  begin 
                       xpc10 <= 7'sd9/*9:xpc10*/;
                       TEca6_0_V_7 <= (64'sh_ffff&hprpin137910)+(hprpin137910>>32'sd16);
                       TEca6_0_V_6 <= (64'sh_ffff&hprpin137510)+(hprpin137510>>32'sd16);
                       end 
                      
                  7'sd11/*11:xpc10*/:  begin 
                       xpc10 <= 7'sd12/*12:xpc10*/;
                       TEsw14_14_V_2 <= rtl_unsigned_bitextract5(TEme1_1_V_8);
                       TEsw14_14_V_1 <= rtl_unsigned_bitextract5(TEme1_1_V_7);
                       Emu_chksumIP <= 64'h0;
                       Emu_chksum_UDP <= 64'h0;
                       A_64_US_CC_SCALbx14_ARC0[64'd0] <= Emu_src_mac|(Emu_dst_mac<<32'sd48);
                       end 
                      
                  7'sd12/*12:xpc10*/:  begin 
                       xpc10 <= 7'sd13/*13:xpc10*/;
                       TEsw14_14_V_0 <= -64'sh1_0000_0000&A_64_US_CC_SCALbx14_ARC0[64'd1]|(Emu_dst_mac>>32'sd16);
                       end 
                      
                  7'sd13/*13:xpc10*/:  begin 
                       xpc10 <= 7'sd14/*14:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd1] <= TEsw14_14_V_0;
                       end 
                      
                  7'sd14/*14:xpc10*/:  begin 
                       xpc10 <= 7'sd15/*15:xpc10*/;
                       TEsw14_14_V_0 <= 64'sh_ffff&A_64_US_CC_SCALbx14_ARC0[64'd3]|(Emu_dst_ip<<32'sd16)|(Emu_src_ip<<32'sd48);
                       end 
                      
                  7'sd15/*15:xpc10*/:  begin 
                       xpc10 <= 7'sd16/*16:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd3] <= TEsw14_14_V_0;
                       end 
                      
                  7'sd16/*16:xpc10*/:  begin 
                      if (!TEsw14_14_V_1 && TEsw14_14_V_2)  begin 
                               xpc10 <= 7'sd17/*17:xpc10*/;
                               TEsw14_14_V_0 <= -64'sh1_0000_0000_0000&A_64_US_CC_SCALbx14_ARC0[64'd4]|(Emu_src_ip>>32'sd16);
                               end 
                              if (TEsw14_14_V_1 && !TEsw14_14_V_2)  begin 
                               xpc10 <= 7'sd17/*17:xpc10*/;
                               TEsw14_14_V_0 <= -64'sh1_0000_0000_0000&A_64_US_CC_SCALbx14_ARC0[64'd4]|(Emu_src_ip>>32'sd16)|(Emu_app_src_port
                              <<32'sd32)|(Emu_app_dst_port<<32'sd16);

                               end 
                              if (TEsw14_14_V_1 && TEsw14_14_V_2)  begin 
                               xpc10 <= 7'sd17/*17:xpc10*/;
                               TEsw14_14_V_0 <= -64'sh1_0000_0000_0000&A_64_US_CC_SCALbx14_ARC0[64'd4]|(Emu_src_ip>>32'sd16);
                               end 
                              if (!TEsw14_14_V_1 && !TEsw14_14_V_2)  xpc10 <= 7'sd17/*17:xpc10*/;
                           end 
                      
                  7'sd17/*17:xpc10*/:  begin 
                       xpc10 <= 7'sd18/*18:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd4] <= TEsw14_14_V_0;
                       end 
                      
                  7'sd20/*20:xpc10*/:  begin 
                       xpc10 <= 7'sd21/*21:xpc10*/;
                       Emu_tmp <= $unsigned(A_64_US_CC_SCALbx14_ARC0[64'd3]);
                       end 
                      
                  7'sd21/*21:xpc10*/:  begin 
                       xpc10 <= 7'sd22/*22:xpc10*/;
                       TEca21_7_V_1 <= $unsigned((A_64_US_CC_SCALbx14_ARC0[64'd1]>>32'sd48));
                       TEca21_7_V_0 <= 8'h1;
                       TEca21_7_V_9 <= 64'h0;
                       TEca21_7_V_7 <= 64'h0;
                       TEca21_7_V_6 <= 64'h0;
                       end 
                      
                  7'sd22/*22:xpc10*/:  begin 
                       xpc10 <= 7'sd23/*23:xpc10*/;
                       TEca21_7_V_7 <= (64'sh_ffff&hprpin149210)+(hprpin149210>>32'sd16);
                       TEca21_7_V_6 <= (64'sh_ffff&hprpin148810)+(hprpin148810>>32'sd16);
                       end 
                      
                  7'sd24/*24:xpc10*/:  begin 
                       xpc10 <= 7'sd25/*25:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd3] <= Emu_tmp|(Emu_chksumIP>>32'sd8)|((64'shff&Emu_chksumIP)<<32'sd8);
                       end 
                      
                  7'sd25/*25:xpc10*/:  begin 
                       xpc10 <= 7'sd26/*26:xpc10*/;
                       Emu_tmp <= $unsigned(A_64_US_CC_SCALbx14_ARC0[64'd5]);
                       end 
                      
                  7'sd26/*26:xpc10*/: if ((TEme1_1_V_5<32'h4))  begin 
                           xpc10 <= 7'sd27/*27:xpc10*/;
                           Emu_tmp2 <= Emu_dst_ip|(Emu_src_ip<<32'sd32);
                           Emu_tmp3 <= 64'sh_1100|-64'sh1_0000_0000_0000&A_64_US_CC_SCALbx14_ARC0[64'd4];
                           TEme1_1_V_2 <= 32'h4;
                           end 
                           else  begin 
                           xpc10 <= 7'sd36/*36:xpc10*/;
                           Emu_tmp2 <= $unsigned((A_64_US_CC_SCALbx14_ARC0[32'h4]>>32'sd16));
                           TEme1_1_V_2 <= 32'h4;
                           end 
                          
                  7'sd27/*27:xpc10*/:  begin 
                       xpc10 <= 7'sd28/*28:xpc10*/;
                       TEca27_17_V_5 <= (64'sh_ffff&hprpin154010)+(hprpin154010>>32'sd16);
                       TEca27_17_V_4 <= (64'sh_ffff&hprpin153610)+(hprpin153610>>32'sd16);
                       TEca27_17_V_7 <= Emu_chksum_UDP;
                       end 
                      
                  7'sd28/*28:xpc10*/:  begin 
                       xpc10 <= 7'sd29/*29:xpc10*/;
                       Emu_chksum_UDP <= (64'sh_ffff&TEca27_17_V_7+(64'sh_ffff&TEca27_17_V_4+TEca27_17_V_5)+(TEca27_17_V_4+TEca27_17_V_5
                      >>32'sd16))+(TEca27_17_V_7+(64'sh_ffff&TEca27_17_V_4+TEca27_17_V_5)+(TEca27_17_V_4+TEca27_17_V_5>>32'sd16)>>32'sd16
                      );

                       end 
                      
                  7'sd29/*29:xpc10*/:  begin 
                       xpc10 <= 7'sd30/*30:xpc10*/;
                       TEca27_20_V_5 <= (64'sh_ffff&hprpin155610)+(hprpin155610>>32'sd16);
                       TEca27_20_V_4 <= (64'sh_ffff&hprpin155210)+(hprpin155210>>32'sd16);
                       TEca27_20_V_7 <= Emu_chksum_UDP;
                       end 
                      
                  7'sd30/*30:xpc10*/:  begin 
                       xpc10 <= 7'sd31/*31:xpc10*/;
                       Emu_chksum_UDP <= (64'sh_ffff&TEca27_20_V_7+(64'sh_ffff&TEca27_20_V_4+TEca27_20_V_5)+(TEca27_20_V_4+TEca27_20_V_5
                      >>32'sd16))+(TEca27_20_V_7+(64'sh_ffff&TEca27_20_V_4+TEca27_20_V_5)+(TEca27_20_V_4+TEca27_20_V_5>>32'sd16)>>32'sd16
                      );

                       end 
                      
                  7'sd31/*31:xpc10*/:  begin 
                       xpc10 <= 7'sd32/*32:xpc10*/;
                       Emu_tmp2 <= 64'sh_ffff&-64'sh1^Emu_chksum_UDP;
                       end 
                      
                  7'sd32/*32:xpc10*/:  begin 
                       xpc10 <= 7'sd33/*33:xpc10*/;
                       Emu_tmp3 <= ((64'shff&Emu_tmp2)<<32'sd8)|(Emu_tmp2>>32'sd8);
                       A_64_US_CC_SCALbx14_ARC0[64'd5] <= Emu_tmp|((64'shff&Emu_tmp2)<<32'sd8)|(Emu_tmp2>>32'sd8);
                       end 
                      
                  7'sd36/*36:xpc10*/:  begin 
                       xpc10 <= 7'sd37/*37:xpc10*/;
                       TEca25_5_V_5 <= (64'sh_ffff&hprpin155610)+(hprpin155610>>32'sd16);
                       TEca25_5_V_4 <= (64'sh_ffff&hprpin155210)+(hprpin155210>>32'sd16);
                       TEca25_5_V_7 <= Emu_chksum_UDP;
                       end 
                      
                  7'sd38/*38:xpc10*/:  begin 
                       xpc10 <= 7'sd39/*39:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd2] <= TEMe20_2_V_1|64'sh_ff00&(TEMe20_2_V_0<<32'sd8)|(TEMe20_2_V_0>>32'sd8);
                       end 
                      
                  7'sd39/*39:xpc10*/:  begin 
                       xpc10 <= 7'sd40/*40:xpc10*/;
                       TEMe20_2_V_0 <= -64'sh1_0000&A_64_US_CC_SCALbx14_ARC0[64'd3];
                       end 
                      
                  7'sd41/*41:xpc10*/:  begin 
                       xpc10 <= 7'sd42/*42:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd4] <= TEMe20_2_V_1|((64'sh_ff00&TEMe20_2_V_0)<<32'sd40)|(TEMe20_2_V_0<<32'sd56);
                       end 
                      
                  7'sd42/*42:xpc10*/:  begin 
                       xpc10 <= 7'sd43/*43:xpc10*/;
                       TEMe20_2_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[64'd5]);
                       end 
                      
                  7'sd43/*43:xpc10*/:  begin 
                       xpc10 <= 7'sd44/*44:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd5] <= -64'sh1_0000&TEMe20_2_V_0;
                       end 
                      
                  7'sd44/*44:xpc10*/:  begin 
                       xpc10 <= 7'sd45/*45:xpc10*/;
                       TEMe20_2_V_0 <= 64'sh_ffff&A_64_US_CC_SCALbx14_ARC0[64'd6];
                       end 
                      
                  7'sd47/*47:xpc10*/:  begin 
                       xpc10 <= 7'sd48/*48:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd7] <= TEMe20_2_V_0;
                       end 
                      
                  7'sd49/*49:xpc10*/:  begin 
                       xpc10 <= 7'sd50/*50:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd8] <= TEMe20_2_V_0;
                       end 
                      
                  7'sd50/*50:xpc10*/:  begin 
                       xpc10 <= 7'sd51/*51:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd9] <= 64'h_2052_4f52_5245_0000;
                       end 
                      
                  7'sd51/*51:xpc10*/:  begin 
                       xpc10 <= 7'sd20/*20:xpc10*/;
                       TEme1_1_V_5 <= 32'ha;
                       A_8_US_CC_SCALbx20_ARA0[64'sha] <= 8'h3;
                       A_64_US_CC_SCALbx10_ARA0[64'd0] <= 64'sh52|(Emu_src_port<<32'sd24)|(Emu_src_port<<32'sd16);
                       A_64_US_CC_SCALbx14_ARC0[64'd10] <= 64'h_3130;
                       end 
                      
                  7'sd52/*52:xpc10*/:  begin 
                       xpc10 <= 7'sd20/*20:xpc10*/;
                       TEme1_1_V_5 <= 32'ha;
                       A_8_US_CC_SCALbx20_ARA0[64'sha] <= 8'h3f;
                       A_64_US_CC_SCALbx10_ARA0[64'd0] <= 64'sh56|(Emu_src_port<<32'sd24)|(Emu_src_port<<32'sd16);
                       A_64_US_CC_SCALbx14_ARC0[64'd10] <= (Emu_key_value>>32'sd16);
                       end 
                      
                  7'sd53/*53:xpc10*/:  begin 
                       xpc10 <= 7'sd54/*54:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd2] <= TEMe19_2_V_1|64'sh_ff00&(TEMe19_2_V_0<<32'sd8)|(TEMe19_2_V_0>>32'sd8);
                       end 
                      
                  7'sd54/*54:xpc10*/:  begin 
                       xpc10 <= 7'sd55/*55:xpc10*/;
                       TEMe19_2_V_0 <= -64'sh1_0000&A_64_US_CC_SCALbx14_ARC0[64'd3];
                       end 
                      
                  7'sd56/*56:xpc10*/:  begin 
                       xpc10 <= 7'sd57/*57:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd4] <= TEMe19_2_V_1|((64'sh_ff00&TEMe19_2_V_0)<<32'sd40)|(TEMe19_2_V_0<<32'sd56);
                       end 
                      
                  7'sd57/*57:xpc10*/:  begin 
                       xpc10 <= 7'sd58/*58:xpc10*/;
                       TEMe19_2_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[64'd5]);
                       end 
                      
                  7'sd58/*58:xpc10*/:  begin 
                       xpc10 <= 7'sd59/*59:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd5] <= -64'sh1_0000&TEMe19_2_V_0;
                       end 
                      
                  7'sd59/*59:xpc10*/:  begin 
                       xpc10 <= 7'sd60/*60:xpc10*/;
                       TEMe19_2_V_0 <= 64'sh_ffff&A_64_US_CC_SCALbx14_ARC0[64'd6];
                       end 
                      
                  7'sd60/*60:xpc10*/:  begin 
                       xpc10 <= 7'sd61/*61:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd6] <= 64'sh481_0000|TEMe19_2_V_0;
                       end 
                      
                  7'sd62/*62:xpc10*/:  begin 
                       xpc10 <= 7'sd63/*63:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd7] <= TEMe19_2_V_0;
                       end 
                      
                  7'sd64/*64:xpc10*/:  begin 
                       xpc10 <= 7'sd65/*65:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd8] <= TEMe19_2_V_0;
                       end 
                      
                  7'sd65/*65:xpc10*/:  begin 
                       xpc10 <= 7'sd20/*20:xpc10*/;
                       TEme1_1_V_5 <= 32'h9;
                       A_8_US_CC_SCALbx20_ARA0[64'sh9] <= 8'h3;
                       A_64_US_CC_SCALbx10_ARA0[64'd0] <= 64'sh4a|(Emu_src_port<<32'sd24)|(Emu_src_port<<32'sd16);
                       A_64_US_CC_SCALbx14_ARC0[64'd9] <= 64'h0;
                       end 
                      
                  7'sd66/*66:xpc10*/:  begin 
                       xpc10 <= 7'sd67/*67:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd8] <= TEMe19_2_V_0;
                       end 
                      
                  7'sd67/*67:xpc10*/:  begin 
                       xpc10 <= 7'sd68/*68:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd9] <= 64'h_2052_4f52_5245_0000;
                       end 
                      
                  7'sd68/*68:xpc10*/:  begin 
                       xpc10 <= 7'sd20/*20:xpc10*/;
                       TEme1_1_V_5 <= 32'ha;
                       A_8_US_CC_SCALbx20_ARA0[64'sha] <= 8'h3;
                       A_64_US_CC_SCALbx10_ARA0[64'd0] <= 64'sh52|(Emu_src_port<<32'sd24)|(Emu_src_port<<32'sd16);
                       A_64_US_CC_SCALbx14_ARC0[64'd10] <= 64'h_3130;
                       end 
                      
                  7'sd69/*69:xpc10*/:  begin 
                       xpc10 <= 7'sd70/*70:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd2] <= TEMe18_1_V_1|64'sh_ff00&(TEMe18_1_V_0<<32'sd8)|(TEMe18_1_V_0>>32'sd8);
                       end 
                      
                  7'sd70/*70:xpc10*/:  begin 
                       xpc10 <= 7'sd71/*71:xpc10*/;
                       TEMe18_1_V_0 <= -64'sh1_0000&A_64_US_CC_SCALbx14_ARC0[64'd3];
                       end 
                      
                  7'sd71/*71:xpc10*/:  begin 
                       xpc10 <= 7'sd72/*72:xpc10*/;
                       TEMe18_1_V_1 <= 64'sh_ffff_ffff_ffff&A_64_US_CC_SCALbx14_ARC0[64'd4];
                       TEMe18_1_V_0 <= -64'd22+(64'sh_ff00&(Emu_UDP_total_length<<32'sd8)|(Emu_UDP_total_length>>32'sd8));
                       A_64_US_CC_SCALbx14_ARC0[64'd3] <= TEMe18_1_V_0;
                       end 
                      
                  7'sd72/*72:xpc10*/:  begin 
                       xpc10 <= 7'sd73/*73:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd4] <= TEMe18_1_V_1|((64'sh_ff00&TEMe18_1_V_0)<<32'sd40)|(TEMe18_1_V_0<<32'sd56);
                       end 
                      
                  7'sd73/*73:xpc10*/:  begin 
                       xpc10 <= 7'sd74/*74:xpc10*/;
                       TEMe18_1_V_0 <= $unsigned(A_64_US_CC_SCALbx14_ARC0[64'd5]);
                       end 
                      
                  7'sd74/*74:xpc10*/:  begin 
                       xpc10 <= 7'sd75/*75:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd5] <= -64'sh1_0000&TEMe18_1_V_0;
                       end 
                      
                  7'sd75/*75:xpc10*/:  begin 
                       xpc10 <= 7'sd76/*76:xpc10*/;
                       TEMe18_1_V_0 <= 64'sh_ffff&A_64_US_CC_SCALbx14_ARC0[64'd6];
                       end 
                      
                  7'sd76/*76:xpc10*/:  begin 
                       xpc10 <= 7'sd77/*77:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd6] <= 64'sh181_0000|TEMe18_1_V_0;
                       end 
                      
                  7'sd77/*77:xpc10*/:  begin 
                       xpc10 <= 7'sd78/*78:xpc10*/;
                       TEMe18_1_V_0 <= -64'sh1_0000_0000_0000&A_64_US_CC_SCALbx14_ARC0[64'd7];
                       end 
                      
                  7'sd78/*78:xpc10*/:  begin 
                       xpc10 <= 7'sd79/*79:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd7] <= TEMe18_1_V_0;
                       end 
                      
                  7'sd79/*79:xpc10*/:  begin 
                       xpc10 <= 7'sd80/*80:xpc10*/;
                       TEMe18_1_V_0 <= 64'sh_ffff&A_64_US_CC_SCALbx14_ARC0[64'd8];
                       end 
                      
                  7'sd80/*80:xpc10*/:  begin 
                       xpc10 <= 7'sd81/*81:xpc10*/;
                       A_64_US_CC_SCALbx14_ARC0[64'd8] <= TEMe18_1_V_0;
                       end 
                      
                  7'sd81/*81:xpc10*/:  begin 
                       xpc10 <= 7'sd20/*20:xpc10*/;
                       TEme1_1_V_5 <= 32'h9;
                       A_8_US_CC_SCALbx20_ARA0[64'sh9] <= 8'h3;
                       A_64_US_CC_SCALbx10_ARA0[64'd0] <= 64'sh4a|(Emu_src_port<<32'sd24)|(Emu_src_port<<32'sd16);
                       A_64_US_CC_SCALbx14_ARC0[64'd9] <= 64'h0;
                       end 
                      
                  7'sd82/*82:xpc10*/:  begin 
                       xpc10 <= 7'sd83/*83:xpc10*/;
                       cam_cmp_din <= Emu_key;
                       end 
                      
                  7'sd85/*85:xpc10*/:  begin 
                       xpc10 <= 7'sd86/*86:xpc10*/;
                       cam_wr_addr <= rtl_unsigned_bitextract3(TEca8_1_V_0);
                       cam_din <= 64'h0;
                       end 
                      
                  7'sd86/*86:xpc10*/:  begin 
                       xpc10 <= 7'sd87/*87:xpc10*/;
                       cam_we <= 1'h1;
                       end 
                      
                  7'sd87/*87:xpc10*/:  begin 
                       xpc10 <= 7'sd88/*88:xpc10*/;
                       cam_we <= 1'h0;
                       end 
                      
                  7'sd89/*89:xpc10*/:  begin 
                       xpc10 <= 7'sd90/*90:xpc10*/;
                       cam_cmp_din <= Emu_key;
                       end 
                      
                  7'sd91/*91:xpc10*/:  begin 
                       xpc10 <= 7'sd92/*92:xpc10*/;
                       cam_we <= 1'h1;
                       end 
                      
                  7'sd92/*92:xpc10*/:  begin 
                       xpc10 <= 7'sd93/*93:xpc10*/;
                       cam_we <= 1'h0;
                       end 
                      
                  7'sd94/*94:xpc10*/:  begin 
                       xpc10 <= 7'sd95/*95:xpc10*/;
                       cam_cmp_din <= Emu_key;
                       end 
                      endcase
              if ((xpc10==7'sd18/*18:xpc10*/))  xpc10 <= 7'sd19/*19:xpc10*/;
                   end 
              //End structure HPR anontop


       end 
      

assign hprpin137510 = (((64'shff&TEca6_0_V_1)<<32'sd8)|((64'sh_ff00&TEca6_0_V_1)>>32'sd8))+(((64'shff&(TEca6_0_V_1>>32'sd16))<<32'sd8)|((64'sh_ff00&(TEca6_0_V_1
>>32'sd16))>>32'sd8));

assign hprpin137910 = (((64'shff&(TEca6_0_V_1>>32'sd32))<<32'sd8)|((64'sh_ff00&(TEca6_0_V_1>>32'sd32))>>32'sd8))+(((64'shff&(TEca6_0_V_1>>32'sd48))<<32'sd8
)|((64'sh_ff00&(TEca6_0_V_1>>32'sd48))>>32'sd8));

assign hprpin138810 = (64'sh_ffff&TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6+TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16))+(TEca6_0_V_9+(64'sh_ffff&TEca6_0_V_6
+TEca6_0_V_7)+(TEca6_0_V_6+TEca6_0_V_7>>32'sd16)>>32'sd16);

assign hprpin148810 = (((64'shff&TEca21_7_V_1)<<32'sd8)|((64'sh_ff00&TEca21_7_V_1)>>32'sd8))+(((64'shff&(TEca21_7_V_1>>32'sd16))<<32'sd8)|((64'sh_ff00&(TEca21_7_V_1
>>32'sd16))>>32'sd8));

assign hprpin149210 = (((64'shff&(TEca21_7_V_1>>32'sd32))<<32'sd8)|((64'sh_ff00&(TEca21_7_V_1>>32'sd32))>>32'sd8))+(((64'shff&(TEca21_7_V_1>>32'sd48))<<32'sd8
)|((64'sh_ff00&(TEca21_7_V_1>>32'sd48))>>32'sd8));

assign hprpin150110 = (64'sh_ffff&TEca21_7_V_9+(64'sh_ffff&TEca21_7_V_6+TEca21_7_V_7)+(TEca21_7_V_6+TEca21_7_V_7>>32'sd16))+(TEca21_7_V_9+(64'sh_ffff&TEca21_7_V_6
+TEca21_7_V_7)+(TEca21_7_V_6+TEca21_7_V_7>>32'sd16)>>32'sd16);

assign hprpin153610 = (((64'shff&Emu_tmp3)<<32'sd8)|((64'sh_ff00&Emu_tmp3)>>32'sd8))+(((64'shff&(Emu_tmp3>>32'sd16))<<32'sd8)|((64'sh_ff00&(Emu_tmp3>>32'sd16
))>>32'sd8));

assign hprpin154010 = (((64'shff&(Emu_tmp3>>32'sd32))<<32'sd8)|((64'sh_ff00&(Emu_tmp3>>32'sd32))>>32'sd8))+(((64'shff&(Emu_tmp3>>32'sd48))<<32'sd8)|((64'sh_ff00
&(Emu_tmp3>>32'sd48))>>32'sd8));

assign hprpin155210 = (((64'shff&Emu_tmp2)<<32'sd8)|((64'sh_ff00&Emu_tmp2)>>32'sd8))+(((64'shff&(Emu_tmp2>>32'sd16))<<32'sd8)|((64'sh_ff00&(Emu_tmp2>>32'sd16
))>>32'sd8));

assign hprpin155610 = (((64'shff&(Emu_tmp2>>32'sd32))<<32'sd8)|((64'sh_ff00&(Emu_tmp2>>32'sd32))>>32'sd8))+(((64'shff&(Emu_tmp2>>32'sd48))<<32'sd8)|((64'sh_ff00
&(Emu_tmp2>>32'sd48))>>32'sd8));

assign hprpin158610 = (64'sh_ffff&TEca25_5_V_7+(64'sh_ffff&TEca25_5_V_4+TEca25_5_V_5)+(TEca25_5_V_4+TEca25_5_V_5>>32'sd16))+(TEca25_5_V_7+(64'sh_ffff&TEca25_5_V_4
+TEca25_5_V_5)+(TEca25_5_V_4+TEca25_5_V_5>>32'sd16)>>32'sd16);

// 1 vectors of width 7
// 45 vectors of width 64
// 8 vectors of width 32
// 7 vectors of width 8
// 10 vectors of width 1
// 1280 array locations of width 64
// 256 array locations of width 8
// Total state bits in module = 87177 bits.
// 704 continuously assigned (wire/non-state) bits 
// Total number of leaf cells = 0
endmodule

//  
// LCP delay estimations included: turn off with -vnl-lcp-delay-estimate=disable
//HPR L/S (orangepath) auxiliary reports.
//KiwiC compilation report
//Kiwi Scientific Acceleration (KiwiC .net/CIL/C# to Verilog/SystemC compiler): Version alpha 0.2.16f : 22nd-September-2016
//29/09/2016 16:28:17
//Cmd line args:  /root/kiwi/kiwipro/kiwic/distro/lib/kiwic.exe emu_memcached_binary.dll -bevelab-default-pause-mode=hard -vnl-resets=synchronous -vnl-roundtrip=disable -res2-loadstore-port-count=0 -restructure2=disable -conerefine=enable -vnl emu_memcached_binary.v


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
//Setting up abbreviation TEm1._SPILL for prefix T403/Emu/memcached_logic/1.1/_SPILL

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEme1.1 for prefix T403/Emu/memcached_logic/1.1

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
//Setting up abbreviation TEc8._SPILL for prefix T403/Emu/cam_controller/8.1/_SPILL

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEca8.1 for prefix T403/Emu/cam_controller/8.1

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEsw14.14 for prefix T403/Emu/swap_multiple_fields/14.14

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEMe18.1 for prefix T403/Emu/Memcached_SET/18.1

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEM19_SPILL for prefix T403/Emu/Memcached_DELETE/19.2/_SPILL

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEMe19.2 for prefix T403/Emu/Memcached_DELETE/19.2

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEMe20.2 for prefix T403/Emu/Memcached_GET/20.2

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEc21_SPILL for prefix T403/Emu/calc_IP_checksum/21.7/_SPILL

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEca21.7 for prefix T403/Emu/calc_IP_checksum/21.7

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEca25.5 for prefix T403/Emu/calc_UDP_checksum/25.5

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEca27.17 for prefix T403/Emu/calc_UDP_checksum/27.17

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TEca27.20 for prefix T403/Emu/calc_UDP_checksum/27.20

//----------------------------------------------------------

//Report from Abbreviation:::
//Setting up abbreviation TESe28.3 for prefix T403/Emu/SendFrame/28.3

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
//   srcfile=emu_memcached_binary.dll
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
//1 vectors of width 7
//
//45 vectors of width 64
//
//8 vectors of width 32
//
//7 vectors of width 8
//
//10 vectors of width 1
//
//1280 array locations of width 64
//
//256 array locations of width 8
//
//Total state bits in module = 87177 bits.
//
//704 continuously assigned (wire/non-state) bits 
//
//Total number of leaf cells = 0
//

//Major Statistics Report:
//Thread .cctor uid=cctor10 has 3 CIL instructions in 1 basic blocks
//Thread .cctor uid=cctor12 has 2 CIL instructions in 1 basic blocks
//Thread .cctor uid=cctor14 has 28 CIL instructions in 1 basic blocks
//Thread EntryPoint uid=EntryPoint10 has 813 CIL instructions in 184 basic blocks
//Thread mpc10 has 97 bevelab control states (pauses)
// eof (HPR L/S Verilog)
