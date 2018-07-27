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

void do_check_status(bs_info_t *bsi, tcam_cfg_t *cfg, int argc, const char **argv) {

   uint32_t flow_table_config, flow_table_status, flow_table_sel;

   printf("\n=== Flow Table Status ===\n");

   flow_table_config = read_register(bsi->dev, bsi->match_base_addr + FLOW_TBL_CONF);
   printf("Multi-table config status = %x\n\n", flow_table_config);

   flow_table_sel = read_register(bsi->dev, bsi->match_base_addr + FLOW_TBL_SEL);
   printf("Table config status = %x\n\n", flow_table_sel);

   if (flow_table_sel == 0) {
      flow_table_status = read_register(bsi->dev, bsi->match_base_addr + FLOW_TBL_STATUS);
      printf("Double-buffer active mode = %x\n", flow_table_status);
      if (flow_table_status == 0) {
         printf(" => Flow-table-0 in use = %x\n", flow_table_status);
      }
      else if (flow_table_status == 3) {
         printf(" => Flow-table-1 in use = %x\n", flow_table_status);
      }
   }
   else if (flow_table_sel == 1) {
      printf("Single-buffer active mode = %x\n", flow_table_sel);
      printf(" => Flow-table-0 in use.\n");
   }
   else if (flow_table_sel == 2) {
      printf("Single-buffer active mode = %x\n", flow_table_sel);
      printf(" => Flow-table-1 in use.\n");
   }

   printf("\n");
   exit(0);
}

