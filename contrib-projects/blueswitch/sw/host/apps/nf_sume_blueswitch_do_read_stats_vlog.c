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

#include <stdint.h>
#include <stdio.h>
#include <fcntl.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/ioctl.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <inttypes.h>

#include "nf_sume_blueswitch_cfg_vlog.h"
#include "nf_sume_blueswitch_register_vlog.h"

void do_read_stats(bs_info_t *bsi, tcam_cfg_t *cfg, int argc, const char **argv) {

   uint32_t mac_hit, mac_miss, mac_total;
   uint32_t ip_hit, ip_miss, ip_total;
   uint32_t port_no_hit, port_no_miss, port_no_total;
   uint32_t rx_byte_0, rx_pkt_0, tx_byte_0, tx_pkt_0;
   uint32_t rx_byte_1, rx_pkt_1, tx_byte_1, tx_pkt_1;
   uint32_t rx_byte_2, rx_pkt_2, tx_byte_2, tx_pkt_2;
   uint32_t rx_byte_3, rx_pkt_3, tx_byte_3, tx_pkt_3;
   uint32_t rx_byte_4, rx_pkt_4, tx_byte_4, tx_pkt_4;

   printf("\n=== Hit, Miss, and Total stats. ===\n");
   mac_hit = read_register(bsi->dev, bsi->match_base_addr + MAC_HIT_COUNT);
   mac_miss = read_register(bsi->dev, bsi->match_base_addr + MAC_MISS_COUNT);
   mac_total = read_register(bsi->dev, bsi->match_base_addr + MAC_TCAM_TOT_COUNT);
   printf("MAC Table hit = %d, miss = %d, total = %d\n", mac_hit, mac_miss, mac_total);
   ip_hit = read_register(bsi->dev, bsi->match_base_addr + IP_HIT_COUNT);
   ip_miss = read_register(bsi->dev, bsi->match_base_addr + IP_MISS_COUNT);
   ip_total = read_register(bsi->dev, bsi->match_base_addr + IP_TCAM_TOT_COUNT);
   printf("IP Table hit = %d, miss = %d, total = %d\n", ip_hit, ip_miss, ip_total);
   port_no_hit = read_register(bsi->dev, bsi->match_base_addr + PORT_NO_HIT_COUNT);
   port_no_miss = read_register(bsi->dev, bsi->match_base_addr + PORT_NO_MISS_COUNT);
   port_no_total = read_register(bsi->dev, bsi->match_base_addr + PORT_NO_TCAM_TOT_COUNT);
   printf("PORT NO Table hit = %d, miss = %d, total = %d\n", port_no_hit, port_no_miss, port_no_total);

   printf("\n=== Packets and Bytes stats ===\n");
   rx_byte_0 = read_register(bsi->dev, bsi->path0_base_addr + RX_BYTE_COUNT);
   rx_pkt_0 = read_register(bsi->dev, bsi->path0_base_addr + RX_PKT_COUNT);
   tx_byte_0 = read_register(bsi->dev, bsi->path0_base_addr + TX_BYTE_COUNT);
   tx_pkt_0 = read_register(bsi->dev, bsi->path0_base_addr + TX_PKT_COUNT);
   printf("DATA PATH 0 rx byte no = %d, rx packet no = %d, tx byte no = %d tx packet no = %d\n", 
      rx_byte_0, rx_pkt_0, tx_byte_0, tx_pkt_0);
   rx_byte_1 = read_register(bsi->dev, bsi->path1_base_addr + RX_BYTE_COUNT);
   rx_pkt_1 = read_register(bsi->dev, bsi->path1_base_addr + RX_PKT_COUNT);
   tx_byte_1 = read_register(bsi->dev, bsi->path1_base_addr + TX_BYTE_COUNT);
   tx_pkt_1 = read_register(bsi->dev, bsi->path1_base_addr + TX_PKT_COUNT);
   printf("DATA PATH 1 rx byte no = %d, rx packet no = %d, tx byte no = %d tx packet no = %d\n", 
      rx_byte_1, rx_pkt_1, tx_byte_1, tx_pkt_1);
   rx_byte_2 = read_register(bsi->dev, bsi->path2_base_addr + RX_BYTE_COUNT);
   rx_pkt_2 = read_register(bsi->dev, bsi->path2_base_addr + RX_PKT_COUNT);
   tx_byte_2 = read_register(bsi->dev, bsi->path2_base_addr + TX_BYTE_COUNT);
   tx_pkt_2 = read_register(bsi->dev, bsi->path2_base_addr + TX_PKT_COUNT);
   printf("DATA PATH 2 rx byte no = %d, rx packet no = %d, tx byte no = %d tx packet no = %d\n", 
      rx_byte_2, rx_pkt_2, tx_byte_2, tx_pkt_2);
   rx_byte_3 = read_register(bsi->dev, bsi->path3_base_addr + RX_BYTE_COUNT);
   rx_pkt_3 = read_register(bsi->dev, bsi->path3_base_addr + RX_PKT_COUNT);
   tx_byte_3 = read_register(bsi->dev, bsi->path3_base_addr + TX_BYTE_COUNT);
   tx_pkt_3 = read_register(bsi->dev, bsi->path3_base_addr + TX_PKT_COUNT);
   printf("DATA PATH 3 rx byte no = %d, rx packet no = %d, tx byte no = %d tx packet no = %d\n", 
      rx_byte_3, rx_pkt_3, tx_byte_3, tx_pkt_3);
   rx_byte_4 = read_register(bsi->dev, bsi->dma_base_addr + RX_BYTE_COUNT);
   rx_pkt_4 = read_register(bsi->dev, bsi->dma_base_addr + RX_PKT_COUNT);
   tx_byte_4 = read_register(bsi->dev, bsi->dma_base_addr + TX_BYTE_COUNT);
   tx_pkt_4 = read_register(bsi->dev, bsi->dma_base_addr + TX_PKT_COUNT);
   printf("DATA PATH DMA rx byte no = %d, rx packet no = %d, tx byte no = %d tx packet no = %d\n", 
      rx_byte_4, rx_pkt_4, tx_byte_4, tx_pkt_4);

   printf("\n");
   exit(0);

}
