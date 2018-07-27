/*
 * Copyright (c) 2015 Digilent Inc.
 * Copyright (c) 2015 Tinghui Wang (Steve)
 * All rights reserved.
 *
 * File:
 *     sw/embedded/src/nf_sume_gpio/gpio_test.c
 *
 * Project:
 *     acceptance_test
 *
 * Author:
 *     Tinghui Wang (Steve)
 *
 * Description:
 *     Test Functions for GPIO pins on FMC connector and Pmod connector
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

#include "xstatus.h"
#include "xil_types.h"
#include "xparameters.h"
#include "xuartlite_l.h"
#include <stdio.h>
#include <stdlib.h>

#define GPIO_BASEADDR XPAR_NF_SUME_GPIO_TEST_BASEADDR

#define WRITE_OFF_FMC_L 4
#define WRITE_OFF_FMC_H 8
#define READ_OFF_FMC_L 16
#define READ_OFF_FMC_H 20

#define WRITE_OFF_PMOD 8
#define READ_OFF_PMOD 20

#define FMC_H_DATA_MASK 0x03

#define PMOD_DATA_MASK 0x3C
#define PMOD_DATA_SHIFT 2

void GPIO_WritePmod(u32 x) {
	u32 oldData = *((u32 *) (GPIO_BASEADDR + WRITE_OFF_PMOD));
	oldData = oldData & 0xFFFFFFC3;
	*((u32 *) (GPIO_BASEADDR + WRITE_OFF_PMOD)) = oldData | ((x << PMOD_DATA_SHIFT) & PMOD_DATA_MASK);
}

void GPIO_WriteFMC(u32 x_l, u32 x_h) {
	*((u32 *) (GPIO_BASEADDR + WRITE_OFF_FMC_L)) = x_l;
	u32 oldData = *((u32 *) (GPIO_BASEADDR + WRITE_OFF_FMC_H));
	oldData = oldData & 0xFFFFFFFC;
	*((u32 *) (GPIO_BASEADDR + WRITE_OFF_FMC_H)) = oldData | (x_h & FMC_H_DATA_MASK);
}

void GPIO_ReadFMC(u32* x_l, u32* x_h) {
	*x_l = *((u32 *) (GPIO_BASEADDR + READ_OFF_FMC_L));
	u32 oldData = *((u32 *) (GPIO_BASEADDR + READ_OFF_FMC_H));
	oldData = oldData & FMC_H_DATA_MASK;
	*x_h = oldData;
}

void GPIO_ReadPmod(u32* x) {
	u32 data = *((u32 *) (GPIO_BASEADDR + READ_OFF_PMOD));
	data = (data & PMOD_DATA_MASK) >> PMOD_DATA_SHIFT;
	*x = data;
}

void GPIO_FlipDirection(void) {
	u32 data = *((u32 *) GPIO_BASEADDR);
	data = data ^ 0x01;
	*((u32 *) GPIO_BASEADDR) = data;
}

void getHex(u32* h, u32* l) {
	char hexArray[20];
	char cmd = ' ';
	int  hexLength = 0;
	while(cmd != '\n' && cmd != '\r' && hexLength < 12) {
		cmd = XUartLite_RecvByte(XPAR_AXI_UARTLITE_0_BASEADDR);
		if(cmd == 0x08 && hexLength > 0) {
			xil_printf("%c", cmd);
			xil_printf(" ");
			xil_printf("%c", cmd);
			hexLength --;
		} else {
			hexArray[hexLength] = cmd;
			hexLength ++;
			xil_printf("%c", cmd);
		}
	}
	xil_printf("\r\n");

	// Remove the added '\n' char
	hexLength --;
	hexArray[hexLength] = '\0';
	xil_printf("%s\r\n", hexArray);

	// Decide Whether input is hex or not
	if (hexArray[0] == 'x' || hexArray[0] == 'X') { // Parse Number as Hex
		if (hexLength > 9) { // H & L
			//xil_printf("%s\r\n", &hexArray[hexLength - 8]);
			*l = strtoul(&hexArray[hexLength - 8], NULL, 16);
			hexArray[hexLength - 8] = '\0';
			//xil_printf("%s\r\n", &hexArray[1]);
			*h = strtoul(&hexArray[1], NULL, 16);
		} else {
			*h = 0;
			*l = strtoul(&hexArray[1], NULL, 16);
		}
	}
}

void gpio_manual_test(void) {
	u32 fmc_gpio_l, fmc_gpio_h;
	u32 pmod_gpio;
	xil_printf("\r\n");
	while(1) {
		xil_printf("=== NetFPGA-SUME GPIO Manual Test Menu ===\r\n");
		xil_printf("f: Write HEX number to FMC Port (34-bit)\r\n");
		xil_printf("m: Write HEX number to PMOD Port (4-bit)\r\n");
		xil_printf("r: Read HEX number from FMC port (34-bit)\r\n");
		xil_printf("d: Read HEX number from PMOD Port (4-bit)\r\n");
		xil_printf("p: Flip PMOD Input/Output Row\r\n");
		xil_printf("b: Back to Manual Test Menu\r\n");
		xil_printf("Select: ");
		char cmd = XUartLite_RecvByte(XPAR_AXI_UARTLITE_0_BASEADDR);
		xil_printf("%c\r\n", cmd);
		switch (cmd) {
			case 'f':
				xil_printf("Enter Hex Number for FMC Ports (start with x, e.g. x12345678):\r\n");
				getHex(&fmc_gpio_h, &fmc_gpio_l);
				xil_printf("Writing: 0x%02x%08x to FMC IOs\r\n", fmc_gpio_h, fmc_gpio_l);
				GPIO_WriteFMC(fmc_gpio_l, fmc_gpio_h);
				break;
			case 'm':
				xil_printf("Enter Hex Number for PMOD Ports (start with x, e.g. x7):\r\n");
				getHex(NULL, &pmod_gpio);
				xil_printf("Writing: 0x%02x to PMOD IOs\r\n", pmod_gpio);
				GPIO_WritePmod(pmod_gpio);
				break;
			case 'p':
				GPIO_FlipDirection();
				break;
			case 'r':
				fmc_gpio_l = 0;
				fmc_gpio_h = 0;
				GPIO_ReadFMC(&fmc_gpio_l, &fmc_gpio_h);
				xil_printf("FMC GPIO Read: 0x%02X%08X\r\n", fmc_gpio_h, fmc_gpio_l);
				break;
			case 'd':
				pmod_gpio = 0;
				GPIO_ReadPmod(&pmod_gpio);
				xil_printf("FMC GPIO Read: 0x%02X\r\n", pmod_gpio);
				break;
			case 'b':
				return;
			default:
				break;
		}
		xil_printf("\r\n");
	}
}

#define GPIO_ITERATION 1
#define WAIT_TIME 5000
void GPIO_Wait() {
	u32 i = 0;
	for(i = 0; i < WAIT_TIME; i++) {
		asm("nop");
	}
}

XStatus gpio_auto_test(void) {
	XStatus status = XST_SUCCESS;
	int i, j;
	u32 genData;
	u32 fmc_l, fmc_h, pmod;

	for(i = 0; i < GPIO_ITERATION; i++) {
		// Walking 1 on FMC_L
		genData = 1;
		for(j = 0; j < 32; j++) {
			GPIO_WriteFMC(genData, 0);
			GPIO_Wait();
			GPIO_ReadFMC(&fmc_l, &fmc_h);
			if(fmc_l != genData) {
				xil_printf("GPIO FMC_L Walking 1 Error: Write 0x%08x, Read 0x%08x\r\n", genData, fmc_l);
				status = XST_FAILURE;
			}
			genData = genData << 1;
		}
		// Walking 1 on FMC_H
		genData = 1;
		for(j = 0; j < 1; j++) {
			GPIO_WriteFMC(0, genData);
			GPIO_Wait();
			GPIO_ReadFMC(&fmc_l, &fmc_h);
			if(fmc_h != genData) {
				xil_printf("GPIO FMC_H Walking 1 Error: Write 0x%08x, Read 0x%08x\r\n", genData, fmc_h);
				status = XST_FAILURE;
			}
			genData = genData << 1;
		}
		// Walking 0 on FMC_L
		genData = 0xFFFFFFFE;
		for(j = 0; j < 32; j++) {
			GPIO_WriteFMC(genData, 0);
			GPIO_Wait();
			GPIO_ReadFMC(&fmc_l, &fmc_h);
			if(fmc_l != genData) {
				xil_printf("GPIO FMC_L Walking 0 Error: Write 0x%08x, Read 0x%08x\r\n", genData, fmc_l);
				status = XST_FAILURE;
			}
			genData = (genData << 1) | 1;
		}
		// Walking 0 on FMC_H
		genData = 0xFFFFFFFE;
		for(j = 0; j < 1; j++) {
			GPIO_WriteFMC(0, genData & FMC_H_DATA_MASK);
			GPIO_Wait();
			GPIO_ReadFMC(&fmc_l, &fmc_h);
			if(fmc_h != (genData & FMC_H_DATA_MASK)) {
				xil_printf("GPIO FMC_H Walking 0 Error: Write 0x%08x, Read 0x%08x\r\n", (genData & FMC_H_DATA_MASK), fmc_h);
				status = XST_FAILURE;
			}
			genData = (genData << 1) | 1;
		}
		// Walking 1 on FMC_L
		genData = 1;
		for(j = 0; j < 4; j++) {
			GPIO_WritePmod(genData);
			GPIO_Wait();
			GPIO_ReadPmod(&pmod);
			if(pmod != (genData & 0x0F)) {
				xil_printf("GPIO PMOD Walking 1 Error: Write 0x%08x, Read 0x%08x\r\n", genData, pmod);
				status = XST_FAILURE;
			}
			genData = genData << 1;
		}
		// Walking 0 on FMC_H
		genData = 0xFFFFFFFE;
		for(j = 0; j < 4; j++) {
			GPIO_WritePmod(genData);
			GPIO_Wait();
			GPIO_ReadPmod(&pmod);
			if(pmod != (genData & 0x0F)) {
				xil_printf("GPIO PMOD Walking 0 Error: Write 0x%08x, Read 0x%08x\r\n", genData, pmod);
				status = XST_FAILURE;
			}
			genData = (genData << 1) | 1;
		}
	}
	return status;
}

