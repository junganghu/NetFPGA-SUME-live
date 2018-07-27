--
-- Copyright (c) 2013, Digilent RO. 
-- All rights reserved.
--
-- File:
-- crc16.vhd
--
-- MODULE NAME : 16-bit CRC Generator
--
-- Author:
-- Mihaita Nagy (mihaita.nagy@digilent.ro)
--
-- Description:
-- Generates parallel 7-bit Cyclic Redundancy Check code for 
-- 129-bit of input data with the following generator poly: 
-- G(x) = x^16 + x^12 + x^5 + 1.
--
-- REVISION HISTORY
--  VERSION  DATE         AUTHOR         DESCRIPTION
--  1.0 	   2013-02-06   Mihaita Nagy   Created
--
-- @NETFPGA_LICENSE_HEADER_START@
--
-- Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
-- license agreements. See the NOTICE file distributed with this work for
-- additional information regarding copyright ownership. NetFPGA licenses this
-- file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
-- "License"); you may not use this file except in compliance with the
-- License. You may obtain a copy of the License at:
--
-- http://www.netfpga-cic.org
--
-- Unless required by applicable law or agreed to in writing, Work distributed
-- under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
-- CONDITIONS OF ANY KIND, either express or implied. See the License for the
-- specific language governing permissions and limitations under the License.
--
-- @NETFPGA_LICENSE_HEADER_END@
--

library ieee;
use ieee.std_logic_1164.all;

entity crc16 is 
   port(
      clk_i    : in  std_logic;
      crc_en_i : in  std_logic;
      data_i   : in  std_logic_vector(128 downto 0);
      crc_o    : out std_logic_vector(15 downto 0)
   );
end crc16;

architecture Behavioral of crc16 is	

signal lfsr_q: std_logic_vector(15 downto 0);
signal lfsr_c: std_logic_vector(15 downto 0);
signal crc_en_rise, crc_en_fall, crc_en_tmp : std_logic;

begin
   
   crc_o <= lfsr_q;

   lfsr_c(0) <= lfsr_q(0) xor lfsr_q(2) xor lfsr_q(5) xor lfsr_q(8) xor lfsr_q(10) xor lfsr_q(14) xor data_i(0) xor data_i(4) xor data_i(8) xor data_i(11) xor data_i(12) xor data_i(19) xor data_i(20) xor data_i(22) xor data_i(26) xor data_i(27) xor data_i(28) xor data_i(32) xor data_i(33) xor data_i(35) xor data_i(42) xor data_i(48) xor data_i(49) xor data_i(51) xor data_i(52) xor data_i(55) xor data_i(56) xor data_i(58) xor data_i(63) xor data_i(64) xor data_i(65) xor data_i(66) xor data_i(67) xor data_i(70) xor data_i(72) xor data_i(74) xor data_i(75) xor data_i(77) xor data_i(80) xor data_i(81) xor data_i(82) xor data_i(84) xor data_i(86) xor data_i(88) xor data_i(95) xor data_i(96) xor data_i(98) xor data_i(104) xor data_i(106) xor data_i(107) xor data_i(108) xor data_i(109) xor data_i(110) xor data_i(113) xor data_i(115) xor data_i(118) xor data_i(121) xor data_i(123) xor data_i(127);
   lfsr_c(1) <= lfsr_q(1) xor lfsr_q(3) xor lfsr_q(6) xor lfsr_q(9) xor lfsr_q(11) xor lfsr_q(15) xor data_i(1) xor data_i(5) xor data_i(9) xor data_i(12) xor data_i(13) xor data_i(20) xor data_i(21) xor data_i(23) xor data_i(27) xor data_i(28) xor data_i(29) xor data_i(33) xor data_i(34) xor data_i(36) xor data_i(43) xor data_i(49) xor data_i(50) xor data_i(52) xor data_i(53) xor data_i(56) xor data_i(57) xor data_i(59) xor data_i(64) xor data_i(65) xor data_i(66) xor data_i(67) xor data_i(68) xor data_i(71) xor data_i(73) xor data_i(75) xor data_i(76) xor data_i(78) xor data_i(81) xor data_i(82) xor data_i(83) xor data_i(85) xor data_i(87) xor data_i(89) xor data_i(96) xor data_i(97) xor data_i(99) xor data_i(105) xor data_i(107) xor data_i(108) xor data_i(109) xor data_i(110) xor data_i(111) xor data_i(114) xor data_i(116) xor data_i(119) xor data_i(122) xor data_i(124) xor data_i(128);
   lfsr_c(2) <= lfsr_q(2) xor lfsr_q(4) xor lfsr_q(7) xor lfsr_q(10) xor lfsr_q(12) xor data_i(2) xor data_i(6) xor data_i(10) xor data_i(13) xor data_i(14) xor data_i(21) xor data_i(22) xor data_i(24) xor data_i(28) xor data_i(29) xor data_i(30) xor data_i(34) xor data_i(35) xor data_i(37) xor data_i(44) xor data_i(50) xor data_i(51) xor data_i(53) xor data_i(54) xor data_i(57) xor data_i(58) xor data_i(60) xor data_i(65) xor data_i(66) xor data_i(67) xor data_i(68) xor data_i(69) xor data_i(72) xor data_i(74) xor data_i(76) xor data_i(77) xor data_i(79) xor data_i(82) xor data_i(83) xor data_i(84) xor data_i(86) xor data_i(88) xor data_i(90) xor data_i(97) xor data_i(98) xor data_i(100) xor data_i(106) xor data_i(108) xor data_i(109) xor data_i(110) xor data_i(111) xor data_i(112) xor data_i(115) xor data_i(117) xor data_i(120) xor data_i(123) xor data_i(125);
   lfsr_c(3) <= lfsr_q(0) xor lfsr_q(3) xor lfsr_q(5) xor lfsr_q(8) xor lfsr_q(11) xor lfsr_q(13) xor data_i(3) xor data_i(7) xor data_i(11) xor data_i(14) xor data_i(15) xor data_i(22) xor data_i(23) xor data_i(25) xor data_i(29) xor data_i(30) xor data_i(31) xor data_i(35) xor data_i(36) xor data_i(38) xor data_i(45) xor data_i(51) xor data_i(52) xor data_i(54) xor data_i(55) xor data_i(58) xor data_i(59) xor data_i(61) xor data_i(66) xor data_i(67) xor data_i(68) xor data_i(69) xor data_i(70) xor data_i(73) xor data_i(75) xor data_i(77) xor data_i(78) xor data_i(80) xor data_i(83) xor data_i(84) xor data_i(85) xor data_i(87) xor data_i(89) xor data_i(91) xor data_i(98) xor data_i(99) xor data_i(101) xor data_i(107) xor data_i(109) xor data_i(110) xor data_i(111) xor data_i(112) xor data_i(113) xor data_i(116) xor data_i(118) xor data_i(121) xor data_i(124) xor data_i(126);
   lfsr_c(4) <= lfsr_q(0) xor lfsr_q(1) xor lfsr_q(4) xor lfsr_q(6) xor lfsr_q(9) xor lfsr_q(12) xor lfsr_q(14) xor data_i(4) xor data_i(8) xor data_i(12) xor data_i(15) xor data_i(16) xor data_i(23) xor data_i(24) xor data_i(26) xor data_i(30) xor data_i(31) xor data_i(32) xor data_i(36) xor data_i(37) xor data_i(39) xor data_i(46) xor data_i(52) xor data_i(53) xor data_i(55) xor data_i(56) xor data_i(59) xor data_i(60) xor data_i(62) xor data_i(67) xor data_i(68) xor data_i(69) xor data_i(70) xor data_i(71) xor data_i(74) xor data_i(76) xor data_i(78) xor data_i(79) xor data_i(81) xor data_i(84) xor data_i(85) xor data_i(86) xor data_i(88) xor data_i(90) xor data_i(92) xor data_i(99) xor data_i(100) xor data_i(102) xor data_i(108) xor data_i(110) xor data_i(111) xor data_i(112) xor data_i(113) xor data_i(114) xor data_i(117) xor data_i(119) xor data_i(122) xor data_i(125) xor data_i(127);
   lfsr_c(5) <= lfsr_q(1) xor lfsr_q(7) xor lfsr_q(8) xor lfsr_q(13) xor lfsr_q(14) xor lfsr_q(15) xor data_i(0) xor data_i(4) xor data_i(5) xor data_i(8) xor data_i(9) xor data_i(11) xor data_i(12) xor data_i(13) xor data_i(16) xor data_i(17) xor data_i(19) xor data_i(20) xor data_i(22) xor data_i(24) xor data_i(25) xor data_i(26) xor data_i(28) xor data_i(31) xor data_i(35) xor data_i(37) xor data_i(38) xor data_i(40) xor data_i(42) xor data_i(47) xor data_i(48) xor data_i(49) xor data_i(51) xor data_i(52) xor data_i(53) xor data_i(54) xor data_i(55) xor data_i(57) xor data_i(58) xor data_i(60) xor data_i(61) xor data_i(64) xor data_i(65) xor data_i(66) xor data_i(67) xor data_i(68) xor data_i(69) xor data_i(71) xor data_i(74) xor data_i(79) xor data_i(81) xor data_i(84) xor data_i(85) xor data_i(87) xor data_i(88) xor data_i(89) xor data_i(91) xor data_i(93) xor data_i(95) xor data_i(96) xor data_i(98) xor data_i(100) xor data_i(101) xor data_i(103) xor data_i(104) xor data_i(106) xor data_i(107) xor data_i(108) xor data_i(110) xor data_i(111) xor data_i(112) xor data_i(114) xor data_i(120) xor data_i(121) xor data_i(126) xor data_i(127) xor data_i(128);
   lfsr_c(6) <= lfsr_q(0) xor lfsr_q(2) xor lfsr_q(8) xor lfsr_q(9) xor lfsr_q(14) xor lfsr_q(15) xor data_i(1) xor data_i(5) xor data_i(6) xor data_i(9) xor data_i(10) xor data_i(12) xor data_i(13) xor data_i(14) xor data_i(17) xor data_i(18) xor data_i(20) xor data_i(21) xor data_i(23) xor data_i(25) xor data_i(26) xor data_i(27) xor data_i(29) xor data_i(32) xor data_i(36) xor data_i(38) xor data_i(39) xor data_i(41) xor data_i(43) xor data_i(48) xor data_i(49) xor data_i(50) xor data_i(52) xor data_i(53) xor data_i(54) xor data_i(55) xor data_i(56) xor data_i(58) xor data_i(59) xor data_i(61) xor data_i(62) xor data_i(65) xor data_i(66) xor data_i(67) xor data_i(68) xor data_i(69) xor data_i(70) xor data_i(72) xor data_i(75) xor data_i(80) xor data_i(82) xor data_i(85) xor data_i(86) xor data_i(88) xor data_i(89) xor data_i(90) xor data_i(92) xor data_i(94) xor data_i(96) xor data_i(97) xor data_i(99) xor data_i(101) xor data_i(102) xor data_i(104) xor data_i(105) xor data_i(107) xor data_i(108) xor data_i(109) xor data_i(111) xor data_i(112) xor data_i(113) xor data_i(115) xor data_i(121) xor data_i(122) xor data_i(127) xor data_i(128);
   lfsr_c(7) <= lfsr_q(0) xor lfsr_q(1) xor lfsr_q(3) xor lfsr_q(9) xor lfsr_q(10) xor lfsr_q(15) xor data_i(2) xor data_i(6) xor data_i(7) xor data_i(10) xor data_i(11) xor data_i(13) xor data_i(14) xor data_i(15) xor data_i(18) xor data_i(19) xor data_i(21) xor data_i(22) xor data_i(24) xor data_i(26) xor data_i(27) xor data_i(28) xor data_i(30) xor data_i(33) xor data_i(37) xor data_i(39) xor data_i(40) xor data_i(42) xor data_i(44) xor data_i(49) xor data_i(50) xor data_i(51) xor data_i(53) xor data_i(54) xor data_i(55) xor data_i(56) xor data_i(57) xor data_i(59) xor data_i(60) xor data_i(62) xor data_i(63) xor data_i(66) xor data_i(67) xor data_i(68) xor data_i(69) xor data_i(70) xor data_i(71) xor data_i(73) xor data_i(76) xor data_i(81) xor data_i(83) xor data_i(86) xor data_i(87) xor data_i(89) xor data_i(90) xor data_i(91) xor data_i(93) xor data_i(95) xor data_i(97) xor data_i(98) xor data_i(100) xor data_i(102) xor data_i(103) xor data_i(105) xor data_i(106) xor data_i(108) xor data_i(109) xor data_i(110) xor data_i(112) xor data_i(113) xor data_i(114) xor data_i(116) xor data_i(122) xor data_i(123) xor data_i(128);
   lfsr_c(8) <= lfsr_q(0) xor lfsr_q(1) xor lfsr_q(2) xor lfsr_q(4) xor lfsr_q(10) xor lfsr_q(11) xor data_i(3) xor data_i(7) xor data_i(8) xor data_i(11) xor data_i(12) xor data_i(14) xor data_i(15) xor data_i(16) xor data_i(19) xor data_i(20) xor data_i(22) xor data_i(23) xor data_i(25) xor data_i(27) xor data_i(28) xor data_i(29) xor data_i(31) xor data_i(34) xor data_i(38) xor data_i(40) xor data_i(41) xor data_i(43) xor data_i(45) xor data_i(50) xor data_i(51) xor data_i(52) xor data_i(54) xor data_i(55) xor data_i(56) xor data_i(57) xor data_i(58) xor data_i(60) xor data_i(61) xor data_i(63) xor data_i(64) xor data_i(67) xor data_i(68) xor data_i(69) xor data_i(70) xor data_i(71) xor data_i(72) xor data_i(74) xor data_i(77) xor data_i(82) xor data_i(84) xor data_i(87) xor data_i(88) xor data_i(90) xor data_i(91) xor data_i(92) xor data_i(94) xor data_i(96) xor data_i(98) xor data_i(99) xor data_i(101) xor data_i(103) xor data_i(104) xor data_i(106) xor data_i(107) xor data_i(109) xor data_i(110) xor data_i(111) xor data_i(113) xor data_i(114) xor data_i(115) xor data_i(117) xor data_i(123) xor data_i(124);
   lfsr_c(9) <= lfsr_q(1) xor lfsr_q(2) xor lfsr_q(3) xor lfsr_q(5) xor lfsr_q(11) xor lfsr_q(12) xor data_i(4) xor data_i(8) xor data_i(9) xor data_i(12) xor data_i(13) xor data_i(15) xor data_i(16) xor data_i(17) xor data_i(20) xor data_i(21) xor data_i(23) xor data_i(24) xor data_i(26) xor data_i(28) xor data_i(29) xor data_i(30) xor data_i(32) xor data_i(35) xor data_i(39) xor data_i(41) xor data_i(42) xor data_i(44) xor data_i(46) xor data_i(51) xor data_i(52) xor data_i(53) xor data_i(55) xor data_i(56) xor data_i(57) xor data_i(58) xor data_i(59) xor data_i(61) xor data_i(62) xor data_i(64) xor data_i(65) xor data_i(68) xor data_i(69) xor data_i(70) xor data_i(71) xor data_i(72) xor data_i(73) xor data_i(75) xor data_i(78) xor data_i(83) xor data_i(85) xor data_i(88) xor data_i(89) xor data_i(91) xor data_i(92) xor data_i(93) xor data_i(95) xor data_i(97) xor data_i(99) xor data_i(100) xor data_i(102) xor data_i(104) xor data_i(105) xor data_i(107) xor data_i(108) xor data_i(110) xor data_i(111) xor data_i(112) xor data_i(114) xor data_i(115) xor data_i(116) xor data_i(118) xor data_i(124) xor data_i(125);
   lfsr_c(10) <= lfsr_q(0) xor lfsr_q(2) xor lfsr_q(3) xor lfsr_q(4) xor lfsr_q(6) xor lfsr_q(12) xor lfsr_q(13) xor data_i(5) xor data_i(9) xor data_i(10) xor data_i(13) xor data_i(14) xor data_i(16) xor data_i(17) xor data_i(18) xor data_i(21) xor data_i(22) xor data_i(24) xor data_i(25) xor data_i(27) xor data_i(29) xor data_i(30) xor data_i(31) xor data_i(33) xor data_i(36) xor data_i(40) xor data_i(42) xor data_i(43) xor data_i(45) xor data_i(47) xor data_i(52) xor data_i(53) xor data_i(54) xor data_i(56) xor data_i(57) xor data_i(58) xor data_i(59) xor data_i(60) xor data_i(62) xor data_i(63) xor data_i(65) xor data_i(66) xor data_i(69) xor data_i(70) xor data_i(71) xor data_i(72) xor data_i(73) xor data_i(74) xor data_i(76) xor data_i(79) xor data_i(84) xor data_i(86) xor data_i(89) xor data_i(90) xor data_i(92) xor data_i(93) xor data_i(94) xor data_i(96) xor data_i(98) xor data_i(100) xor data_i(101) xor data_i(103) xor data_i(105) xor data_i(106) xor data_i(108) xor data_i(109) xor data_i(111) xor data_i(112) xor data_i(113) xor data_i(115) xor data_i(116) xor data_i(117) xor data_i(119) xor data_i(125) xor data_i(126);
   lfsr_c(11) <= lfsr_q(0) xor lfsr_q(1) xor lfsr_q(3) xor lfsr_q(4) xor lfsr_q(5) xor lfsr_q(7) xor lfsr_q(13) xor lfsr_q(14) xor data_i(6) xor data_i(10) xor data_i(11) xor data_i(14) xor data_i(15) xor data_i(17) xor data_i(18) xor data_i(19) xor data_i(22) xor data_i(23) xor data_i(25) xor data_i(26) xor data_i(28) xor data_i(30) xor data_i(31) xor data_i(32) xor data_i(34) xor data_i(37) xor data_i(41) xor data_i(43) xor data_i(44) xor data_i(46) xor data_i(48) xor data_i(53) xor data_i(54) xor data_i(55) xor data_i(57) xor data_i(58) xor data_i(59) xor data_i(60) xor data_i(61) xor data_i(63) xor data_i(64) xor data_i(66) xor data_i(67) xor data_i(70) xor data_i(71) xor data_i(72) xor data_i(73) xor data_i(74) xor data_i(75) xor data_i(77) xor data_i(80) xor data_i(85) xor data_i(87) xor data_i(90) xor data_i(91) xor data_i(93) xor data_i(94) xor data_i(95) xor data_i(97) xor data_i(99) xor data_i(101) xor data_i(102) xor data_i(104) xor data_i(106) xor data_i(107) xor data_i(109) xor data_i(110) xor data_i(112) xor data_i(113) xor data_i(114) xor data_i(116) xor data_i(117) xor data_i(118) xor data_i(120) xor data_i(126) xor data_i(127);
   lfsr_c(12) <= lfsr_q(1) xor lfsr_q(4) xor lfsr_q(6) xor lfsr_q(10) xor lfsr_q(15) xor data_i(0) xor data_i(4) xor data_i(7) xor data_i(8) xor data_i(15) xor data_i(16) xor data_i(18) xor data_i(22) xor data_i(23) xor data_i(24) xor data_i(28) xor data_i(29) xor data_i(31) xor data_i(38) xor data_i(44) xor data_i(45) xor data_i(47) xor data_i(48) xor data_i(51) xor data_i(52) xor data_i(54) xor data_i(59) xor data_i(60) xor data_i(61) xor data_i(62) xor data_i(63) xor data_i(66) xor data_i(68) xor data_i(70) xor data_i(71) xor data_i(73) xor data_i(76) xor data_i(77) xor data_i(78) xor data_i(80) xor data_i(82) xor data_i(84) xor data_i(91) xor data_i(92) xor data_i(94) xor data_i(100) xor data_i(102) xor data_i(103) xor data_i(104) xor data_i(105) xor data_i(106) xor data_i(109) xor data_i(111) xor data_i(114) xor data_i(117) xor data_i(119) xor data_i(123) xor data_i(128);
   lfsr_c(13) <= lfsr_q(2) xor lfsr_q(5) xor lfsr_q(7) xor lfsr_q(11) xor data_i(1) xor data_i(5) xor data_i(8) xor data_i(9) xor data_i(16) xor data_i(17) xor data_i(19) xor data_i(23) xor data_i(24) xor data_i(25) xor data_i(29) xor data_i(30) xor data_i(32) xor data_i(39) xor data_i(45) xor data_i(46) xor data_i(48) xor data_i(49) xor data_i(52) xor data_i(53) xor data_i(55) xor data_i(60) xor data_i(61) xor data_i(62) xor data_i(63) xor data_i(64) xor data_i(67) xor data_i(69) xor data_i(71) xor data_i(72) xor data_i(74) xor data_i(77) xor data_i(78) xor data_i(79) xor data_i(81) xor data_i(83) xor data_i(85) xor data_i(92) xor data_i(93) xor data_i(95) xor data_i(101) xor data_i(103) xor data_i(104) xor data_i(105) xor data_i(106) xor data_i(107) xor data_i(110) xor data_i(112) xor data_i(115) xor data_i(118) xor data_i(120) xor data_i(124);
   lfsr_c(14) <= lfsr_q(0) xor lfsr_q(3) xor lfsr_q(6) xor lfsr_q(8) xor lfsr_q(12) xor data_i(2) xor data_i(6) xor data_i(9) xor data_i(10) xor data_i(17) xor data_i(18) xor data_i(20) xor data_i(24) xor data_i(25) xor data_i(26) xor data_i(30) xor data_i(31) xor data_i(33) xor data_i(40) xor data_i(46) xor data_i(47) xor data_i(49) xor data_i(50) xor data_i(53) xor data_i(54) xor data_i(56) xor data_i(61) xor data_i(62) xor data_i(63) xor data_i(64) xor data_i(65) xor data_i(68) xor data_i(70) xor data_i(72) xor data_i(73) xor data_i(75) xor data_i(78) xor data_i(79) xor data_i(80) xor data_i(82) xor data_i(84) xor data_i(86) xor data_i(93) xor data_i(94) xor data_i(96) xor data_i(102) xor data_i(104) xor data_i(105) xor data_i(106) xor data_i(107) xor data_i(108) xor data_i(111) xor data_i(113) xor data_i(116) xor data_i(119) xor data_i(121) xor data_i(125);
   lfsr_c(15) <= lfsr_q(1) xor lfsr_q(4) xor lfsr_q(7) xor lfsr_q(9) xor lfsr_q(13) xor data_i(3) xor data_i(7) xor data_i(10) xor data_i(11) xor data_i(18) xor data_i(19) xor data_i(21) xor data_i(25) xor data_i(26) xor data_i(27) xor data_i(31) xor data_i(32) xor data_i(34) xor data_i(41) xor data_i(47) xor data_i(48) xor data_i(50) xor data_i(51) xor data_i(54) xor data_i(55) xor data_i(57) xor data_i(62) xor data_i(63) xor data_i(64) xor data_i(65) xor data_i(66) xor data_i(69) xor data_i(71) xor data_i(73) xor data_i(74) xor data_i(76) xor data_i(79) xor data_i(80) xor data_i(81) xor data_i(83) xor data_i(85) xor data_i(87) xor data_i(94) xor data_i(95) xor data_i(97) xor data_i(103) xor data_i(105) xor data_i(106) xor data_i(107) xor data_i(108) xor data_i(109) xor data_i(112) xor data_i(114) xor data_i(117) xor data_i(120) xor data_i(122) xor data_i(126);
    
   process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         crc_en_tmp <= crc_en_i;
      end if;
   end process;
   
   crc_en_rise <= '1' when crc_en_tmp = '0' and crc_en_i = '1' else '0';
   crc_en_fall <= '1' when crc_en_tmp = '1' and crc_en_i = '0' else '0';
   
   process(clk_i) begin
      if clk_i'event and clk_i = '1' then
         if crc_en_rise = '1' then 
            lfsr_q <= (others => '0');
         else
            if crc_en_fall = '1' then
               lfsr_q <= lfsr_c;
            end if;
         end if;
      end if;
   end process;
    
end Behavioral; 
