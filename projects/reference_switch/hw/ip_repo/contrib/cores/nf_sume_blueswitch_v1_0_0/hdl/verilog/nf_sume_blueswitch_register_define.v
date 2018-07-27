//
// Copyright (c) 2015-2016 Jong Hun Han
// Copyright (c) 2015 SRI International
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

//Axi-lite bus memory mapped register address offset lists.

//Common registers for data paths.
//
//Clear counter.
`define  CLR_COUNT                  16'h0010
//Time stamp {MSB(16), LSB(16)}, MSB=Tx(m_axis), LSB=Rx(s_axis).
`define  TS_POSITION                16'h0014
//Physical port register forcing to forward to the set register.
`define  MISS_FWD                   16'h0018
//Byte and packet number counts at rx(s_axis) and tx(m_axis) interfaces of the
//switch.
`define  RX_BYTE_COUNT              16'h0020
`define  RX_PKT_COUNT               16'h0024
`define  TX_BYTE_COUNT              16'h0028
`define  TX_PKT_COUNT               16'h002c
//The switch rx data path fifo buffer depth monitor.
`define  RX_FIFO_DEPTH              16'h0060
`define  RX_FIFO_DEPTH_MAX          16'h0064

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
`define  SW_TAG_VAL                 16'h0080
`define  SW_TAG                     16'h0084


//The switch flow table processor control register offset lists.
//
//Trigger to switch entry and act tables.
//Each field need to define to indicate entry and act tables to be switched.
`define  TCAM_ACT_TBL_CONF          16'h1000
//TCAM and ACT table double buffer triggers.
`define  FLOW_TBL_TRIG              16'h1004
`define  INIT_STATS_MEM             16'h1008
`define  FLOW_TBL_SEL               16'h100c

//READ general entry and act stats.
`define  CLR_TCAM_ACT_COUNT         16'h1010

//Flow table configuration
`define  FLOW_TBL_CONF              16'h1014
//TCAM and action double buffer status.
`define  FLOW_TBL_STATUS            16'h1018

//TCAM and Act table write and read data and stats.
`define  MAC_TCAM_ADDR              16'h1100
`define  MAC_TCAM_WR_DATA           16'h1104
//{MSB(16), LSB(16)} in data, MSB=mask, LSB=mac addr, 
`define  MAC_TCAM_WR_DA_SK          16'h1108
`define  MAC_TCAM_WR_MASK           16'h110c
`define  MAC_TCAM_WR_EN             16'h1110
//To read TCAM stats, first write the address, TCAM Addr, then read STATS.
`define  MAC_TCAM_STATS_RD_DATA     16'h1114

//ACT and Act table write and read data and stats.
`define  MAC_ACT_ADDR               16'h1120
`define  MAC_ACT_WR_DATA            16'h1124
`define  MAC_ACT_WR_EN              16'h1130
//To read ACT stats, first write the address, ACT Addr, then read STATS.
`define  MAC_ACT_STATS_RD_DATA      16'h1134



//TCAM and Act table write and read data and stats.
`define  IP_TCAM_ADDR               16'h1140
`define  IP_TCAM_WR_DATA            16'h1144
`define  IP_TCAM_WR_MASK            16'h1148
`define  IP_TCAM_WR_EN              16'h1150
//To read TCAM stats, first write the address, TCAM Addr, then read STATS.
`define  IP_TCAM_STATS_RD_DATA      16'h1154

//ACT and Act table write and read data and stats.
`define  IP_ACT_ADDR                16'h1160
`define  IP_ACT_WR_DATA             16'h1164
`define  IP_ACT_WR_EN               16'h1170
//To read ACT stats, first write the address, ACT Addr, then read STATS.
`define  IP_ACT_STATS_RD_DATA       16'h1174


//TCAM and Act table write and read data and stats.
`define  PORT_NO_TCAM_ADDR          16'h1180
`define  PORT_NO_TCAM_WR_DATA       16'h1184
`define  PORT_NO_TCAM_WR_MASK       16'h1188
`define  PORT_NO_TCAM_WR_EN         16'h1190
//To read TCAM stats, first write the address, TCAM Addr, then read STATS.
`define  PORT_NO_TCAM_STATS_RD_DATA 16'h1194

//ACT and Act table write and read data and stats.
`define  PORT_NO_ACT_ADDR           16'h11a0
`define  PORT_NO_ACT_WR_DATA        16'h11a4
`define  PORT_NO_ACT_WR_EN          16'h11b0
//To read ACT stats, first write the address, ACT Addr, then read STATS.
`define  PORT_NO_ACT_STATS_RD_DATA  16'h11b4

//Match table stats
`define  MAC_HIT_COUNT              16'h1504
`define  MAC_MISS_COUNT             16'h1508
`define  MAC_TCAM_TOT_COUNT         16'h150c

`define  IP_HIT_COUNT               16'h1514
`define  IP_MISS_COUNT              16'h1518
`define  IP_TCAM_TOT_COUNT          16'h151c

`define  PORT_NO_HIT_COUNT          16'h1524
`define  PORT_NO_MISS_COUNT         16'h1528
`define  PORT_NO_TCAM_TOT_COUNT     16'h152c

`define  TS_TAP_LSB_0               16'h1600
`define  TS_TAP_MSB_0               16'h1604
`define  TS_TAP_LSB_1               16'h1608
`define  TS_TAP_MSB_1               16'h160c

`define  TS_MAC_WREN_LSB_0          16'h1610
`define  TS_MAC_WREN_MSB_0          16'h1614
`define  TS_MAC_WREN_LSB_1          16'h1618
`define  TS_MAC_WREN_MSB_1          16'h161c

`define  TS_IP_WREN_LSB_0           16'h1620
`define  TS_IP_WREN_MSB_0           16'h1624
`define  TS_IP_WREN_LSB_1           16'h1628
`define  TS_IP_WREN_MSB_1           16'h162c

`define  TS_PORT_NO_WREN_LSB_0      16'h1630
`define  TS_PORT_NO_WREN_MSB_0      16'h1634
`define  TS_PORT_NO_WREN_LSB_1      16'h1638
`define  TS_PORT_NO_WREN_MSB_1      16'h163c

`define  TS_TRIG_LSB_0              16'h1640
`define  TS_TRIG_MSB_0              16'h1644

`define  TS_ST_START_LSB            16'h1650
`define  TS_ST_START_MSB            16'h1654
`define  TS_ST_END_LSB              16'h1658
`define  TS_ST_END_MSB              16'h165c

`define  TS_ST_CNT_CLR              16'h1660


