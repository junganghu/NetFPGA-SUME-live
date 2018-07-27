/*
 * Copyright (c) 2015 Digilent Inc.
 * Copyright (c) 2015 Tinghui Wang (Steve)
 * Copyright (c) 2015 Neelakandan Manihatty Bojan
 * All rights reserved.
 *
 * File:
 *     sw/embedded/src/nf_sume_10g_loopback/xge_test.c
 *
 * Project:
 *     acceptance_test
 *
 * Author:
 *     Tinghui Wang (Steve)
 *
 * Modified by:
 *	Neelakandan Manihatty Bojan
 *        -- Fixed the tests to check the PHY status before running the tests
 *        -- Fixed typo to get correct Status2 signal
 *   
 * Description:
 *     Functions for 10Gb Ethernet Loopback Test
 *
 * This software was developed by
 * Stanford University and the University of Cambridge Computer Laboratory under National Science Foundation under Grant No. CNS-0855268,
 * the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
 * by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
 * as part of the DARPA MRC research programme.
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

#include "stdlib.h"
#include "xil_types.h"
#include "xuartlite_l.h"
#include "xil_io.h"
#include "xstatus.h"
#include "xparameters.h"

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
	int i;
	Xil_Out32((BaseAddress + OFFSET_10G_MAC_RX_31_0), 0x16);
	Xil_Out32((BaseAddress + OFFSET_10G_MAC_TX_31_0), 0x16);
	for (i = 0; i < 0x60; i += 1) {
		xil_printf("[%02x] %x\r\n", i, Xil_In8((BaseAddress + i)));
	}
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

int Nf_GenChk_InterfacePresent(){
        u32 phy0_status;
        u32 phy1_status;
        u32 phy2_status;
        u32 phy3_status;
	u32 all_phy_present;

        phy0_status= (0xf & Xil_In32((ETH0_BASEADDR + 0x4c)));
        phy1_status= (0xf & Xil_In32((ETH1_BASEADDR + 0x4c)));
        phy2_status= (0xf & Xil_In32((ETH2_BASEADDR + 0x4c)));
        phy3_status= (0xf & Xil_In32((ETH3_BASEADDR + 0x4c)));

        xil_printf("\n*********** Interface Status ************\n\r");
        xil_printf("phy3 phy2 phy1 phy0 \n\r");
        xil_printf("%x %x %x %x \n\r", Xil_In32((ETH0_BASEADDR + 0x4c)), Xil_In32((ETH1_BASEADDR + 0x4c)), Xil_In32((ETH2_BASEADDR + 0x4c)), Xil_In32((ETH3_BASEADDR + 0x4c)));
	xil_printf("phy status : %x \n\r", all_phy_present);
       	if(phy0_status == 0 && phy1_status == 0 && phy2_status == 0 && phy3_status == 0){
		xil_printf("Cables and Phy are rightly configured \n\r");
		all_phy_present=0;	
		}
	else{	
		xil_printf("Check the cables and transceivers are connected correctly \n\r");
		all_phy_present=1;
		}
	return all_phy_present;
}

void Nf_GenChk_PrintStatus(u32 BaseAddress) {
	u32 tx_count;
	u32 rx_count;
	u32 err_count;

	tx_count = Xil_In32((BaseAddress + OFFSET_NF_AXIS_GEN_CHK_TX_COUNT));
	rx_count = Xil_In32((BaseAddress + OFFSET_NF_AXIS_GEN_CHK_RX_COUNT));
	err_count = Xil_In32((BaseAddress + OFFSET_NF_AXIS_GEN_CHK_ERR_COUNT));

	xil_printf("TX\t0x%08x\tRX\t0x%08x\tERR\t0x%08x\n\r", tx_count, rx_count, err_count);
}

XStatus Nf_GenChk_CheckStatus(u32 BaseAddress) {
	u32 tx_count;
	u32 rx_count;
	u32 err_count;

	tx_count = Xil_In32((BaseAddress + OFFSET_NF_AXIS_GEN_CHK_TX_COUNT));
	rx_count = Xil_In32((BaseAddress + OFFSET_NF_AXIS_GEN_CHK_RX_COUNT));
	err_count = Xil_In32((BaseAddress + OFFSET_NF_AXIS_GEN_CHK_ERR_COUNT));

	if(tx_count > 0 && rx_count > 0 && err_count <= 1) {
		return XST_SUCCESS;
	} else {
		xil_printf("nf10_sume_gen_chk@0x%08x: Error: ", BaseAddress);
		xil_printf("TX\t0x%08x\tRX\t0x%08x\tERR\t0x%08x\n\r", tx_count, rx_count, err_count);
		return XST_FAILURE;
	}
}

void xge_manual_test(void) {
	xge_test_enable();
	while(1) {
		xil_printf("---- NetFPGA-SUME 10G Ethernet Loopback Test ----\n\r");
		xil_printf("i: PHY Info\n\r");
		xil_printf("s: Dump status\n\r");
		xil_printf("t: Run AXI4-Stream Packet Generator/Checker\n\r");
		xil_printf("r: Stop AXI4-Stream Packet Generator/Checker\n\r");
		xil_printf("p: Print the interface status\n\r");
		xil_printf("b: Back to previous menu\n\r");
		xil_printf("Select: ");
		char cmd = XUartLite_RecvByte(XPAR_AXI_UARTLITE_0_BASEADDR);
		xil_printf("%c\r\n", cmd);
		switch (cmd) {
			case 'i':
				sfpReadInfo(1);
				sfpReadInfo(2);
				sfpReadInfo(3);
				sfpReadInfo(4);
				break;
			case 's':
				xil_printf("AXI4-Stream Packet Generator/Checker 0\n\r");
				Nf_GenChk_PrintStatus(NF_AXIS_GEN_CHK_0_BASEADDR);
				xil_printf("AXI4-Stream Packet Generator/Checker 1\n\r");
				Nf_GenChk_PrintStatus(NF_AXIS_GEN_CHK_1_BASEADDR);
				xil_printf("\n\r");
				break;
			case 't':
				Nf_GenChk_Enable(NF_AXIS_GEN_CHK_0_BASEADDR);
				Nf_GenChk_Enable(NF_AXIS_GEN_CHK_1_BASEADDR);
				break;
			case 'r':
				Nf_GenChk_Disable(NF_AXIS_GEN_CHK_0_BASEADDR);
				Nf_GenChk_Disable(NF_AXIS_GEN_CHK_1_BASEADDR);
				break;
			case 'b':
				xge_test_disable();
				return;
			case 'p':
				Nf_GenChk_InterfacePresent();
				break;
			default:
				break;
		}
		xil_printf("\r\n");
	}
}

XStatus xge_auto_test(void) {
	XStatus status1, status2;
	u32 i;
	u32 phy_status;

	phy_status=Nf_GenChk_InterfacePresent();
	xge_test_enable();

	for(i = 0; i < 10000000; i++) {
		asm("nop");
	}

	status1 = Nf_GenChk_CheckStatus(NF_AXIS_GEN_CHK_0_BASEADDR);
	status2 = Nf_GenChk_CheckStatus(NF_AXIS_GEN_CHK_1_BASEADDR);
	xge_test_disable();
	if(status1 == XST_SUCCESS && status2 == XST_SUCCESS && phy_status == 0) {
		return XST_SUCCESS;
	} else {
		return XST_FAILURE;
	}
}
