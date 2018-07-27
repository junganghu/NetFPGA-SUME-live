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
#include <net/if.h>

#include "nf_sume_blueswitch_cfg_vlog.h"
#include "nf_sume_blueswitch_register_vlog.h"
#include "nf_sume.h"

void do_check_status(bs_info_t *bsi, tcam_cfg_t *cfg, int argc, const char **argv);
void do_read_stats(bs_info_t *bsi, tcam_cfg_t *cfg, int argc, const char **argv);
void do_load_table(bs_info_t *bsi, tcam_cfg_t *cfg, int argc, const char **argv);
void do_act_entry(bs_info_t *bsi, tcam_cfg_t *cfg, int argc, const char **argv);

//static int do_log = 0;

int open_device() {
  //int dev = open(DEVICE_FILE, O_RDWR);
   int dev = socket(AF_INET6, SOCK_DGRAM, 0);
	if (dev == -1) {
		dev = socket(AF_INET, SOCK_DGRAM, 0);
		if (dev == -1)
			printf("socket failed for AF_INET6 and AF_INET");
	}
  if (dev < 0) {
    fprintf(stdout, "Error opening %s: %s\n",
            DEVICE_FILE, strerror(errno));
    exit(1);
  }
  return dev;
}

//static void log_read(uint32_t addr, uint32_t val) {
//  if (do_log)
//    fprintf(stdout, "rd: [0x%x] -> 0x%x\n", addr, val);
//}

//static void log_write(uint32_t addr, uint32_t val) {
//  if (do_log)
//    fprintf(stdout, "wr: [0x%x] <- 0x%x\n", addr, val);
//}

bs_info_t bsi_1table = {
  .dev                  = -1,
  .device_base_addr     = DEVICE_BASE_ADDR,
  .path0_base_addr      = DEVICE_BASE_ADDR + OFFSET_PATH_0,
  .path1_base_addr      = DEVICE_BASE_ADDR + OFFSET_PATH_1,
  .path2_base_addr      = DEVICE_BASE_ADDR + OFFSET_PATH_2,
  .path3_base_addr      = DEVICE_BASE_ADDR + OFFSET_PATH_3,
  .dma_base_addr        = DEVICE_BASE_ADDR + OFFSET_DMA,
  .match_base_addr      = DEVICE_BASE_ADDR + OFFSET_MATCH,
};

tcam_cfg_t cfg = {
  .dev          = -1,
  .base_addr    = NULL,
};

static void init_cfg(bs_info_t *bsi, tcam_cfg_t *cfg) {
  bsi->dev = cfg->dev = open_device();
  cfg->base_addr = (uint32_t *)(uintptr_t) bsi->device_base_addr;
}

void do_read_register(bs_info_t *bsi, tcam_cfg_t *cfg, int argc, const char **argv) {

   uint32_t rd_addr;
   uint32_t rd_val;

   if (argc < 3) {
      printf("\nCheck input arguments...\n");
      printf("===> ./nf10_cfg_vlog_bs -rdreg <address 32bits hex>\n");
      exit(0);
   }

   sscanf(argv[2], "%x", &rd_addr);

   rd_val = read_register(bsi->dev, rd_addr);
   printf("=> Read register from 0x%x : 0x%x\n", rd_addr, rd_val);
   exit(0);
}

void do_write_register(bs_info_t *bsi, tcam_cfg_t *cfg, int argc, const char **argv) {

   uint32_t wr_addr;
   uint32_t wr_val;

   if (argc < 4) {
      printf("\nCheck input arguments...\n");
      printf("===> ./nf10_cfg_vlog_bs -wrreg <address 32bits hex>  <data 32bits hex>\n");
      exit(0);
   }

   sscanf(argv[2], "%x", &wr_addr);
   sscanf(argv[3], "%x", &wr_val);

   write_register(bsi->dev, wr_addr, wr_val);
   printf("=> Write register to 0x%x : 0x%x\n", wr_addr, wr_val);
   exit(0);
}

void do_act_entry(bs_info_t *bsi, tcam_cfg_t *cfg, int argc, const char **argv) {

   printf("\n=>Loaded Table is activated...\n");

   write_register(bsi->dev, bsi->match_base_addr + FLOW_TBL_TRIG, 0xff);
   printf("\n");

   exit(0);
}

void do_insert_tag(bs_info_t *bsi, tcam_cfg_t *cfg, int argc, const char **argv) {

   printf("\n=>Insert tag for trigger...\n");

   if (!strcmp(argv[2], "all")) {
      write_register(bsi->dev, bsi->path0_base_addr + SW_TAG_VAL, 0x2);
      write_register(bsi->dev, bsi->path1_base_addr + SW_TAG_VAL, 0x2);
      write_register(bsi->dev, bsi->path2_base_addr + SW_TAG_VAL, 0x2);
      write_register(bsi->dev, bsi->path3_base_addr + SW_TAG_VAL, 0x2);
      write_register(bsi->dev, bsi->dma_base_addr + SW_TAG_VAL, 0x2);
   }
   if (!strcmp(argv[2], "dp0")) {
      write_register(bsi->dev, bsi->path0_base_addr + SW_TAG_VAL, 0x2);
   }
   if (!strcmp(argv[2], "dp1")) {
      write_register(bsi->dev, bsi->path1_base_addr + SW_TAG_VAL, 0x2);
   }
   if (!strcmp(argv[2], "dp2")) {
      write_register(bsi->dev, bsi->path2_base_addr + SW_TAG_VAL, 0x2);
   }
   if (!strcmp(argv[2], "dp3")) {
      write_register(bsi->dev, bsi->path3_base_addr + SW_TAG_VAL, 0x2);
   }
   if (!strcmp(argv[2], "dma")) {
      write_register(bsi->dev, bsi->dma_base_addr + SW_TAG_VAL, 0x2);
   }

   printf("\n");

   exit(0);
}

void do_config(bs_info_t *bsi, tcam_cfg_t *cfg, int argc, const char **argv) {

   if (argc < 3) {
      printf("\nCheck input arguments...\n");
      printf("===> ./nf10_cfg_vlog_bs -cfg <double | sel0 | sel1>\n");
      printf(" double : double-table buffer\n");
      printf(" sel0 : Select and use table0\n");
      printf(" sel1 : Select and use table1\n");
      exit(0);
   }

   if (!strcmp(argv[2], "double")) {
      printf("=> Configure in double table mode...\n");
      write_register(bsi->dev, bsi->match_base_addr + FLOW_TBL_SEL, 0x0);
      exit(0);
   }
   if (!strcmp(argv[2], "sel0")) {
      printf("=> Configure in table-0 use only mode...\n");
      write_register(bsi->dev, bsi->match_base_addr + FLOW_TBL_SEL, (0x10 + 0x4 + 0x01));
      exit(0);
   }
   if (!strcmp(argv[2], "sel1")) {
      printf("=> Configure in table-1 use only mode...\n");
      write_register(bsi->dev, bsi->match_base_addr + FLOW_TBL_SEL, (0x20 + 0x8 + 0x02));
      exit(0);
   }

   exit(0);
}

void do_multi_config(bs_info_t *bsi, tcam_cfg_t *cfg, int argc, const char **argv) {
   
   uint32_t flow_sel;

   if (argc < 3) {
      printf("\nCheck input arguments...\n");
      printf("===> ./nf10_cfg_vlog_bs -mtcfg <ip | mac | port>\n");
      printf(" Select one or more tables to be activate.\n");
      printf(" Default : ip table only active.\n");
      exit(0);
   }

   flow_sel = 0x3f;

   if (argc == 3) {
      if (!strcmp(argv[2], "ip")) {
         flow_sel = flow_sel & 0x3c;
         printf("=> Active ip table ...%x\n", flow_sel);
      }
      if (!strcmp(argv[2], "mac")) {
         flow_sel = flow_sel & 0x33;
          printf("=> Configure mac table ...%x\n", flow_sel);
      }
      if (!strcmp(argv[2], "port")) {
         flow_sel = flow_sel & 0x0f;
         printf("=> Configure port tabl ...%x\n", flow_sel);
      }
   }
   else if (argc == 4) {
      if (!strcmp(argv[2], "ip") || !strcmp(argv[3], "ip")) {
         flow_sel = flow_sel & 0x3c;
         printf("=> Active ip table ...%x\n", flow_sel);
      }
      if (!strcmp(argv[2], "mac") || !strcmp(argv[3], "mac")) {
         flow_sel = flow_sel & 0x33;
          printf("=> Configure mac table ...%x\n", flow_sel);
      }
      if (!strcmp(argv[2], "port") || !strcmp(argv[3], "port")) {
         flow_sel = flow_sel & 0x0f;
         printf("=> Configure port tabl ...%x\n", flow_sel);
      }
   }
   else if (argc == 5) {
      if (!strcmp(argv[2], "ip") || !strcmp(argv[3], "ip") || !strcmp(argv[4], "ip")) {
         flow_sel = flow_sel & 0x3c;
         printf("=> Active ip table ...%x\n", flow_sel);
      }
      if (!strcmp(argv[2], "mac") || !strcmp(argv[3], "mac") || !strcmp(argv[4], "mac")) {
         flow_sel = flow_sel & 0x33;
          printf("=> Configure mac table ...%x\n", flow_sel);
      }
      if (!strcmp(argv[2], "port") || !strcmp(argv[3], "port") || !strcmp(argv[4], "port")) {
         flow_sel = flow_sel & 0x0f;
         printf("=> Configure port tabl ...%x\n", flow_sel);
      }
   }
   else {
         printf("=> Check the arguments.");
         exit(0);
   }

   printf("=> Configured tables = %x\n", flow_sel);
   write_register(bsi->dev, bsi->match_base_addr + FLOW_TBL_CONF, flow_sel);

   exit(0);
}

void do_timestamp(bs_info_t *bsi, tcam_cfg_t *cfg, int argc, const char **argv) {

   uint32_t reg_timestamp;

   if (argc < 3) {
      printf("\nCheck input arguments...\n");
      printf("===> ./nf10_cfg_vlog_bs -tstmp 0x00000000\n");
      exit(0);
   }

   if (!strcmp(argv[2], "clr")) {
      printf("=> Clear timestamp...\n");
      write_register(bsi->dev, bsi->path0_base_addr + TS_VALID, 0x0);
      write_register(bsi->dev, bsi->path0_base_addr + TS_POSITION, 0x0);
      exit(0);
   }
   else {
      sscanf(argv[2], "%x", &reg_timestamp);

      printf("=> Configure timestamp position...%x\n", reg_timestamp);
      write_register(bsi->dev, bsi->path0_base_addr + TS_VALID, 0x1);
      write_register(bsi->dev, bsi->path0_base_addr + TS_POSITION, reg_timestamp);
      exit(0);
   }
}


static void clear_message() {

      printf("\nCheck input arguments...\n");
      printf("===> ./nf10_cfg_vlog_bs -clr <all | stats | dp-all | dp0 | dp1 | dp2 | dp3 | dp4>\n");
      printf(" all : Clear stats and data path byte and packet counters\n");
      printf(" stats : Clear stats only\n");
      printf(" dp-all : Clear all data-path counters\n");
      printf(" dp0-3 : Clear data-path 0-3 counters\n");
      printf(" dp4 : Clear dma-data-pat counters\n");
}

void do_clear_stats(bs_info_t *bsi, tcam_cfg_t *cfg, int argc, const char **argv) {

   if (argc < 3) {
      clear_message();
      exit(0);
   }
   //else if (argc > 3) {
   //   clear_message();
   //   exit(0);
   //}
  
   if (!strcmp(argv[2], "all")) {
      printf("=> Clear stats and all data-path counters...\n");
      write_register(bsi->dev, bsi->match_base_addr + CLR_TCAM_ACT_COUNT, 0xff);
      write_register(bsi->dev, bsi->path0_base_addr + CLR_COUNT, 0xff);
      write_register(bsi->dev, bsi->path1_base_addr + CLR_COUNT, 0xff);
      write_register(bsi->dev, bsi->path2_base_addr + CLR_COUNT, 0xff);
      write_register(bsi->dev, bsi->path3_base_addr + CLR_COUNT, 0xff);
      write_register(bsi->dev, bsi->dma_base_addr + CLR_COUNT, 0xff);
      exit(0);
   }

   if (!strcmp(argv[2], "stats")) {
      printf("=> Clear stats counters...\n");
      write_register(bsi->dev, bsi->match_base_addr + CLR_TCAM_ACT_COUNT, 0xff);
      exit(0);
   }

   if (!strcmp(argv[2], "dp-all")) {
      printf("=> Clear all data path counters...\n");
      write_register(bsi->dev, bsi->path0_base_addr + CLR_COUNT, 0xff);
      write_register(bsi->dev, bsi->path1_base_addr + CLR_COUNT, 0xff);
      write_register(bsi->dev, bsi->path2_base_addr + CLR_COUNT, 0xff);
      write_register(bsi->dev, bsi->path3_base_addr + CLR_COUNT, 0xff);
      write_register(bsi->dev, bsi->dma_base_addr + CLR_COUNT, 0xff);
      exit(0);
   }

   if (!strcmp(argv[2], "dp0")) {
      printf("=> Clear data-path-0 counters...\n");
      write_register(bsi->dev, bsi->path0_base_addr + CLR_COUNT, 0xff);
      exit(0);
   }

   if (!strcmp(argv[2], "dp1")) {
      printf("=> Clear data-path-1 counters...\n");
      write_register(bsi->dev, bsi->path1_base_addr + CLR_COUNT, 0xff);
      exit(0);
   }
   if (!strcmp(argv[2], "dp2")) {
      printf("=> Clear data-path-2 counters...\n");
      write_register(bsi->dev, bsi->path2_base_addr + CLR_COUNT, 0xff);
      exit(0);
   }

   if (!strcmp(argv[2], "dp3")) {
      printf("=> Clear data-path-3 counters...\n");
      write_register(bsi->dev, bsi->path3_base_addr + CLR_COUNT, 0xff);
      exit(0);
   }

   if (!strcmp(argv[2], "dp4")) {
      printf("=> Clear dma-data-path  counters...\n");
      write_register(bsi->dev, bsi->dma_base_addr + CLR_COUNT, 0xff);
      exit(0);
   }

   clear_message();
   exit(0);
}

static const struct cli_opts {
   const char *opt;
   const char *lopt;
   const char *cflag;
   void       (*func)(bs_info_t *bsi, tcam_cfg_t *cfg, int argc, const char **argv);
   int        set;
} opts[] = {
   {.opt  = "-clr",
    .lopt = "--clear",
    .cflag = "<-clr | --clear> <all | stats | dp-all | dp0 | dp1 | dp2 | dp3>",
    .func = do_clear_stats},
   {.opt  = "-cs",
    .lopt = "--check-status",
    .cflag = "<-cs | --check-status>",
    .func = do_check_status},
   {.opt  = "-cfg",
    .lopt = "--config",
    .cflag = "<-cfg | --config> <double | sel0 | sel1>",
    .func = do_config},
   {.opt  = "-mtcfg",
    .lopt = "--multi-table-config",
    .cflag = "<-mtcfg | --multi-table-config> <ip | mac | port>",
    .func = do_multi_config},
   {.opt  = "-tstamp",
    .lopt = "--timestamp",
    .cflag = "<-tstamp | --timestamp> <hex-32>",
    .func = do_timestamp},
   {.opt  = "-st",
    .lopt = "--read-stats",
    .cflag = "<-st | --read-stats>",
    .func = do_read_stats},
   {.opt  = "-ts",
    .lopt = "--test-set-entry",
    .cflag = "<-ts | --test-set-entry>"},
   {.opt  = "-lt",
    .lopt = "--load-table",
    .cflag = "<-lt | --load-table> <ip | mac | port> <file name>",
    .func = do_load_table},
   {.opt  = "-act",
    .lopt = "--activate-new-flows",
    .cflag = "<-act | --activate-new-flows>",
    .func = do_act_entry},
   {.opt  = "-itag",
    .lopt = "--insert_tag",
    .cflag = "<-itag | --insert_tag> <all | dp0 | dp1 | dp2 | dp3 | dma>",
    .func = do_insert_tag},
   {.opt  = "-rdreg",
    .lopt = "--read-reg",
    .cflag = "<-rdreg | --read-reg> <hex-32>",
    .func = do_read_register},
   {.opt  = "-wrreg",
    .lopt = "--write-reg",
    .cflag = "<-wrreg | --write-reg> <hex-32> <hex-32>",
    .func = do_write_register},
};

static const int nopts = sizeof(opts)/sizeof(opts[0]);

void print_help(int argc, const char *argv[]) {
   int i;
   printf("\nUsage: %s [opts]\n", argv[0]);
   for (i=0; i < nopts; i++) {
      printf(" %s \n", opts[i].cflag);
   }
   exit(0);
}

int main(int argc, const char *argv[]) {
   int i, o;

   init_cfg(&bsi_1table, &cfg);

   if (argc <= 1) print_help(argc, argv);

   for (i=1; i<argc; i++) {
      for (o=0; o<nopts; o++) {
         if (!strcmp(argv[i], opts[o].opt) || !strcmp(argv[i], opts[o].lopt)) {
            opts[o].func(&bsi_1table, &cfg, argc, argv);
            break;
         }
      }
   }

   exit(0);
}

