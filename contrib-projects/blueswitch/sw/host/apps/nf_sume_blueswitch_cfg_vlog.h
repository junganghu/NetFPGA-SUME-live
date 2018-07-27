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

/** Device interface **/

#define  DEVICE_FILE          "/dev/nf10"
#define  IOCTL_WRITE_REG      (SIOCDEVPRIVATE+1)
#define  IOCTL_READ_REG       (SIOCDEVPRIVATE+2)

#define  DEVICE_BASE_ADDR     0x7fa00000
#define  SW0_BASE_ADDR        0x7fa00000
#define  SW1_BASE_ADDR        0x7fb00000
#define  SW2_BASE_ADDR        0x7fc00000
#define  SW3_BASE_ADDR        0x7fd00000
#define  SW4_BASE_ADDR        0x7fe00000

#define  OFFSET_PATH_0        0x0000 //Offset address data path 0 register
#define  OFFSET_PATH_1        0x2000 //Offset address data path 1 register
#define  OFFSET_PATH_2        0x4000 //Offset address data path 2 register
#define  OFFSET_PATH_3        0x6000 //Offset address data path 3 register
#define  OFFSET_DMA           0x8000 //Offset address dma path register
#define  OFFSET_MATCH         0xa000 //Offset address match processor

int open_device();
uint32_t read_register(int dev, uint32_t addr);
void write_register(int dev, uint32_t addr, uint32_t val);

typedef struct bs_info {
  int      dev;
  uint32_t device_base_addr;
  uint32_t path0_base_addr;
  uint32_t path1_base_addr;
  uint32_t path2_base_addr;
  uint32_t path3_base_addr;
  uint32_t dma_base_addr;
  uint32_t match_base_addr;
  uint32_t num_ports;
  uint16_t tcam_num_entries;
} bs_info_t;

typedef struct tcam_cfg {
  int       dev;
  uint32_t *base_addr;

  /* all offsets and sizes measured in 32-bit words */
  uint32_t  status_ofs;
  uint32_t  set_ofs;
  uint32_t  get_ofs;
  uint32_t  trig_ofs;

  /* used for sanity checks */
  uint32_t  key_size;   /* in 32-bit words */
  uint32_t  val_size;   /* in 32-bit words */
} tcam_cfg_t;
