/*
 * Copyright (c) 2015 Digilent Inc.
 * Copyright (c) 2015 Tinghui Wang (Steve)
 * All rights reserved.
 *
 * File:
 *     sw/embedded/src/nf_sume_10g_loopback_sim/helloworld.c
 *
 * Project:
 *     acceptance_test
 *
 * Author:
 *     Tinghui Wang (Steve)
 *
 * Description:
 *     Ethernet MAC Configuration for 10G Loopback project simulation  
 * 
 * @NETFPGA_LICENSE_HEADER_START@
 * 
 * Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
 * license agreements. See the NOTICE file distributed with this work for
 * additional information regarding copyright ownership. NetFPGA licenses this
 * file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
 * "License"); you may not use this file except in compliance with the
 * License. You may obtain a copy of the License at:
 * 
 * http://www.netfpga-cic.org
 * 
 * Unless required by applicable law or agreed to in writing, Work distributed
 * under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
 * CONDITIONS OF ANY KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations under the License.
 * 
 * @NETFPGA_LICENSE_HEADER_END@
 *
 */

#include "xparameters.h"
#include "xil_types.h"
#include "xil_io.h"
#include "xstatus.h"

#define ETH0_BASEADDR XPAR_NF_SUME_10G_SUBSYS_XGE_ETH0_BASEADDR 
#define ETH1_BASEADDR XPAR_NF_SUME_10G_SUBSYS_XGE_ETH1_BASEADDR 
#define ETH2_BASEADDR XPAR_NF_SUME_10G_SUBSYS_XGE_ETH2_BASEADDR 
#define ETH3_BASEADDR XPAR_NF_SUME_10G_SUBSYS_XGE_ETH3_BASEADDR 

#define NF_AXIS_GEN_CHK_0_BASEADDR XPAR_NF_SUME_10G_SUBSYS_NF_AXIS_GEN_CHK_0_BASEADDR
#define NF_AXIS_GEN_CHK_1_BASEADDR XPAR_NF_SUME_10G_SUBSYS_NF_AXIS_GEN_CHK_1_BASEADDR

#define OFFSET_10G_COUNTER_RESET		0x00
#define OFFSET_10G_BAD_FRAMES			0x04
#define OFFSET_10G_GOOD_FRAMES			0x08
#define OFFSET_10G_BYTES_MAC			0x0C
#define OFFSET_10G_RX_ENQUEUED_PKTS		0x10
#define OFFSET_10G_RX_ENQUEUED_BYTES	0x14
#define OFFSET_10G_RX_DEQUEUED_PKTS		0x18
#define OFFSET_10G_RX_DEQUEUED_BYTES	0x1C
#define OFFSET_10G_TX_ENQUEUED_PKTS		0x20
#define OFFSET_10G_TX_ENQUEUED_BYTES	0x24
#define OFFSET_10G_TX_DEQUEUED_PKTS		0x28
#define OFFSET_10G_TX_DEQUEUED_BYTES	0x2C
#define OFFSET_10G_RX_PKTS_IN_QUEUE		0x30
#define OFFSET_10G_RX_BYTES_IN_QUEUE	0x34
#define OFFSET_10G_TX_PKTS_IN_QUEUE		0x38
#define OFFSET_10G_TX_BYTES_IN_QUEUE	0x3C
#define OFFSET_10G_RX_PKTS_DROPPED		0x40
#define OFFSET_10G_RX_BYTES_DROPPED		0x44
#define OFFSET_10G_VERSION				0x48
#define OFFSET_10G_STATUS				0x4C
#define OFFSET_10G_MAC_RX_31_0			0x50
#define OFFSET_10G_MAC_RX_63_32			0x54
#define OFFSET_10G_MAC_RX_79_64			0x58
#define OFFSET_10G_MAC_TX_31_0			0x5C
#define OFFSET_10G_MAC_TX_63_32			0x60
#define OFFSET_10G_MAC_TX_79_64			0x64

#define OFFSET_NF_AXIS_GEN_CHK_TX_COUNT		0x0
#define OFFSET_NF_AXIS_GEN_CHK_RX_COUNT		0x4
#define OFFSET_NF_AXIS_GEN_CHK_ERR_COUNT	0x8
#define OFFSET_NF_AXIS_GEN_CHK_CTRL_REG		0xC

extern void sfpReadInfo(u8 i);

void Nf_GenChk_Enable(u32 BaseAddress) {
	Xil_Out32((BaseAddress + OFFSET_NF_AXIS_GEN_CHK_CTRL_REG), 0x0000000000);
}

void Nf_GenChk_Disable(u32 BaseAddress) {
	Xil_Out32((BaseAddress + OFFSET_NF_AXIS_GEN_CHK_CTRL_REG), 0xFFFFFFFFFF);
}

void Nf_10G_Mac_Enable(u32 BaseAddress) {
	Xil_Out32((BaseAddress + OFFSET_10G_MAC_RX_31_0), 0x16);
	Xil_Out32((BaseAddress + OFFSET_10G_MAC_TX_31_0), 0x16);
}

void Nf_10G_Mac_Disable(u32 BaseAddress) {
	Xil_Out32((BaseAddress + OFFSET_10G_MAC_RX_31_0), 0x00);
	Xil_Out32((BaseAddress + OFFSET_10G_MAC_TX_31_0), 0x00);
}

void xge_test_enable(void) {
	Nf_10G_Mac_Enable(ETH0_BASEADDR);
	Nf_10G_Mac_Enable(ETH1_BASEADDR);
	Nf_10G_Mac_Enable(ETH2_BASEADDR);
	Nf_10G_Mac_Enable(ETH3_BASEADDR);
	Nf_GenChk_Enable(NF_AXIS_GEN_CHK_0_BASEADDR);
	Nf_GenChk_Enable(NF_AXIS_GEN_CHK_1_BASEADDR);
}

void xge_test_disable(void) {
	Nf_GenChk_Disable(NF_AXIS_GEN_CHK_0_BASEADDR);
	Nf_GenChk_Disable(NF_AXIS_GEN_CHK_1_BASEADDR);
	Nf_10G_Mac_Disable(ETH0_BASEADDR);
	Nf_10G_Mac_Disable(ETH1_BASEADDR);
	Nf_10G_Mac_Disable(ETH2_BASEADDR);
	Nf_10G_Mac_Disable(ETH3_BASEADDR);
}

int main()
{
	xge_test_enable();
    return 0;
}
