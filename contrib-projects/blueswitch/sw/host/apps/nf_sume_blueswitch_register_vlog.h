//
// Copyright (c) 2015-2016 Jong Hun Han
// Copyright (c) 2015 SRI International
// 
// All rights reserved.
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

//Lists of data path registers 
#define  CLR_COUNT               0x0010
//Time stamp {MSB(16), LSB(16)}, MSB=Tx(m_axis), LSB=Rx(s_axis).
#define  TS_POSITION             0x0014
//Physical port register forcing to forward to the set register.
#define  MISS_FWD                0x0018
//Byte and packet number counts at rx(s_axis) and tx(m_axis) interfaces of the
//switch.
#define  RX_BYTE_COUNT           0x0020
#define  RX_PKT_COUNT            0x0024
#define  TX_BYTE_COUNT           0x0028
#define  TX_PKT_COUNT            0x002c
#define  TS_VALID                0x0030

// Insert a TAG of 32bits wide between source mac address and ethernet type.
// This TAG should be inserted in the packet marshaller module before leaving
// the switch. Then, it is used in the next hop switches to trigger the new
// rules installed.
// TAG id = 32'hfaceface, should be checksume of destination and source mac
// addresses
// Field definistion, 0: N/A, 1: only update rule, 2: only add out_sw_tag
// to a packet for triggering next switches, 3: update rule and add
// out_sw_tag to a packet forwarding to next switches.
// If out_sw_tag_val is 1, the flow table processor only swaps the match table
// for applying new rules updated in advance.
// If out_sw_tag_val is 2, the flow table processor only adds out_sw_tag
// for triggering match tables in next switches.
// If out_sw_tag_val is 3, the flow table processor swaps and adds in 2 and
// 3.
#define  SW_TAG_VAL              0x0080

//Lists of flow table control registers.
//Flow table hit, miss counts.
#define  TCAM_ACT_TBL_CONF       0x1000
#define  FLOW_TBL_TRIG           0x1004
#define  INIT_STATS_MEM          0x1008
#define  FLOW_TBL_SEL            0x100c
//READ general entry and act stats.
#define  CLR_TCAM_ACT_COUNT      0x1010
//Flow table configuration
#define  FLOW_TBL_CONF           0x1014
//TCAM and action double buffer status.
#define  FLOW_TBL_STATUS         0x1018

//TCAM and Act table write and read data and stats.
#define  IP_TCAM_ADDR            0x1140
#define  IP_TCAM_WR_DATA         0x1144
#define  IP_TCAM_WR_MASK         0x1148
#define  IP_TCAM_WR_EN           0x1150
//To read TCAM stats, first write the address, TCAM Addr, then read STATS.
#define  IP_TCAM_STATS_RD_DATA   0x1154
//ACT and Act table write and read data and stats.
#define  IP_ACT_ADDR             0x1160
#define  IP_ACT_WR_DATA          0x1164
#define  IP_ACT_WR_EN            0x1170
//To read ACT stats, first write the address, ACT Addr, then read STATS.
#define  IP_ACT_STATS_RD_DATA    0x1174

//TCAM and Act table write and read data and stats.
#define  MAC_TCAM_ADDR           0x1100
#define  MAC_TCAM_WR_DATA        0x1104
//{MSB(16), LSB(16)} in data, MSB=mask, LSB=mac addr, 
#define  MAC_TCAM_WR_DA_SK       0x1108
#define  MAC_TCAM_WR_MASK        0x110c
#define  MAC_TCAM_WR_EN          0x1110
//To read TCAM stats, first write the address, TCAM Addr, then read STATS.
#define  MAC_TCAM_STATS_RD_DATA  0x1114

//ACT and Act table write and read data and stats.
#define  MAC_ACT_ADDR            0x1120
#define  MAC_ACT_WR_DATA         0x1124
#define  MAC_ACT_WR_EN           0x1130
//To read ACT stats, first write the address, ACT Addr, then read STATS.
#define  MAC_ACT_STATS_RD_DATA   0x1134


//TCAM and Act table write and read data and stats.
#define  PORT_NO_TCAM_ADDR       0x1180
#define  PORT_NO_TCAM_WR_DATA    0x1184
#define  PORT_NO_TCAM_WR_MASK    0x1188
#define  PORT_NO_TCAM_WR_EN      0x1190
//To read TCAM stats, first write the address, TCAM Addr, then read STATS.
#define  PORT_NO_TCAM_STATS_RD_DATA 0x1194

//ACT and Act table write and read data and stats.
#define  PORT_NO_ACT_ADDR           0x11a0
#define  PORT_NO_ACT_WR_DATA        0x11a4
#define  PORT_NO_ACT_WR_EN          0x11b0
//To read ACT stats, first write the address, ACT Addr, then read STATS.
#define  PORT_NO_ACT_STATS_RD_DATA  0x11b4


#define  MAC_HIT_COUNT           0x1504
#define  MAC_MISS_COUNT          0x1508
#define  MAC_TCAM_TOT_COUNT      0x150c

#define  IP_HIT_COUNT            0x1514
#define  IP_MISS_COUNT           0x1518
#define  IP_TCAM_TOT_COUNT       0x151c

#define  PORT_NO_HIT_COUNT       0x1524
#define  PORT_NO_MISS_COUNT      0x1528
#define  PORT_NO_TCAM_TOT_COUNT  0x152c


