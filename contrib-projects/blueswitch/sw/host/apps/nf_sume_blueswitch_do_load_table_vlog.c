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


void do_load_table(bs_info_t *bsi, tcam_cfg_t *cfg, int argc, const char **argv) {

   FILE *fp;
   uint32_t idx_no, key_value_hex, rule_value_hex, mac_value_hex32, port_value;
   uint64_t mac_value_hex64;
   char field[100], idx[100], value[100], key_value[100], rule[100];

   if (argc < 4) {
      printf("\nCheck input arguments...\n");
      printf("==> ./nf10_cfg_vlog_bs -lt <ip | mac | port> <flow table file name> \n\n");
      exit(EXIT_FAILURE);
   }

   if (!(strcmp(argv[2],"ip") || strcmp(argv[2], "mac") || strcmp(argv[2], "port"))) {
      printf("\nCheck input arguments...\n");
      printf("Invalid arguments...");
      printf("==> ./nf10_cfg_vlog_bs -lt <ip | mac | port> <flow table file name> \n\n");
      exit(EXIT_FAILURE);
   }

   fp = fopen(argv[3], "r");

   if (fp == NULL) {
      printf("\n Check flow table file...\n\n");
      exit(EXIT_FAILURE);
   }

   printf("\n");

   if (!strcmp(argv[2], "ip")) {
      while (fscanf(fp, "%s %s %"SCNu32" %s %s %s %x", field, idx, &idx_no, value, key_value, rule, &rule_value_hex) != -1) {
         printf("Read flow table info -> %s %s %d %s %s %s 0x%x\n", field, idx, idx_no, value, key_value, rule, rule_value_hex);
         if (!strcmp(field, "ip")) {
            key_value_hex=inet_addr(key_value);//Converted into reverse byte alignment.
            //IP tcam index.
            write_register(bsi->dev, bsi->match_base_addr + IP_TCAM_ADDR, idx_no);
            //IP tcam data.
            write_register(bsi->dev, bsi->match_base_addr + IP_TCAM_WR_DATA, key_value_hex);
            //IP tcam write.
            write_register(bsi->dev, bsi->match_base_addr + IP_TCAM_WR_EN, 0x1);

            //IP act index.
            write_register(bsi->dev, bsi->match_base_addr + IP_ACT_ADDR, idx_no);
            //IP act data.
            write_register(bsi->dev, bsi->match_base_addr + IP_ACT_WR_DATA, rule_value_hex);
            //IP table write.
            write_register(bsi->dev, bsi->match_base_addr + IP_ACT_WR_EN, 0x1);
            //printf("IP table setting.\n");
            //key_value_hex=inet_addr(key_value);//Converted into reverse byte alignment.
            //printf("IP hex %x\n", key_value_hex);
         }
         else {
            printf("\nFix the table format. It does not match...\n");
            exit(EXIT_FAILURE);
         }
      }
   }
   else if (!strcmp(argv[2], "mac")) {
      while (fscanf(fp, "%s %s %"SCNu32" %s %lx %s %x", field, idx, &idx_no, value, &mac_value_hex64, rule, &rule_value_hex) != -1) {
         printf("Read flow table info -> %s %s %d %s 0x%lx %s 0x%x\n", field, idx, idx_no, value, mac_value_hex64, rule, rule_value_hex);
         if (!strcmp(field, "mac")) {
            //MAC tcam index.
            write_register(bsi->dev, bsi->match_base_addr + MAC_TCAM_ADDR, idx_no);
            //MAC tcam data.
            mac_value_hex32 = 0xffffffff & mac_value_hex64;
            write_register(bsi->dev, bsi->match_base_addr + MAC_TCAM_WR_DATA, mac_value_hex32);
            mac_value_hex32 = 0xffff & (mac_value_hex64 >> 32);
            write_register(bsi->dev, bsi->match_base_addr + MAC_TCAM_WR_DA_SK, mac_value_hex32);
            //MAC tcam write.
            write_register(bsi->dev, bsi->match_base_addr + MAC_TCAM_WR_EN, 0x1);

            //MAC act index.
            write_register(bsi->dev, bsi->match_base_addr + MAC_ACT_ADDR, idx_no);
            //MAC act data.
            write_register(bsi->dev, bsi->match_base_addr + MAC_ACT_WR_DATA, rule_value_hex);
            //MAC table write.
            write_register(bsi->dev, bsi->match_base_addr + MAC_ACT_WR_EN, 0x1);
            //printf("IP table setting.\n");
            //key_value_hex=inet_addr(key_value);//Converted into reverse byte alignment.
            //printf("IP hex %x\n", key_value_hex);
         }
         else {
            printf("\nFix the table format. It does not match...\n");
            exit(EXIT_FAILURE);
         }
      }
   }
   else if (!strcmp(argv[2], "port")) {
      while (fscanf(fp, "%s %s %"SCNu32" %s %x %s %x", field, idx, &idx_no, value, &port_value, rule, &rule_value_hex) != -1) {
         printf("Read flow table info -> %s %s %d %s %x %s 0x%x\n", field, idx, idx_no, value, port_value, rule, rule_value_hex);
         if (!strcmp(field, "port")) {
            //PORT_NO tcam index.
            write_register(bsi->dev, bsi->match_base_addr + PORT_NO_TCAM_ADDR, idx_no);
            //PORT_NO tcam data.
            write_register(bsi->dev, bsi->match_base_addr + PORT_NO_TCAM_WR_DATA, port_value);
            //PORT_NO tcam write.
            write_register(bsi->dev, bsi->match_base_addr + PORT_NO_TCAM_WR_EN, 0x1);

            //PORT_NO act index.
            write_register(bsi->dev, bsi->match_base_addr + PORT_NO_ACT_ADDR, idx_no);
            //PORT_NO act data.
            write_register(bsi->dev, bsi->match_base_addr + PORT_NO_ACT_WR_DATA, rule_value_hex);
            //PORT_NO table write.
            write_register(bsi->dev, bsi->match_base_addr + PORT_NO_ACT_WR_EN, 0x1);
            //printf("PORT_NO table setting.\n");
            //key_value_hex=inet_addr(key_value);//Converted into reverse byte alignment.
            //printf("PORT_NO hex %x\n", key_value_hex);
         }
         else {
            printf("\nFix the table format. It does not match...\n");
            exit(EXIT_FAILURE);
         }
      }
   }


   printf("\n");

   fclose(fp);
   exit(0);
}

