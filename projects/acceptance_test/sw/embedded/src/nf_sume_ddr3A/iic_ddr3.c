/*
 * Copyright (c) 2015 Digilent Inc.
 * Copyright (c) 2015 Tinghui Wang (Steve)
 * All rights reserved.
 *
 * File:
 *     sw/embedded/src/nf_sume_ddr3A/iic_ddr3.c
 *
 * Project:
 *     acceptance_test
 *
 * Author:
 *     Tinghui Wang (Steve)
 *
 * Description:
 *     Read DDR3 SODIMM information via Iic Bus
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

#include "iic_config.h"
#include "xstatus.h"
#include <stdio.h>

int pow2(int x, int y) {
	int z = x;
	if (y < 0) {
		return 0;
	}
	if (y == 0) {
		return 1;
	}
	y--;
	while (y != 0) {
		z = z * x;
		y--;
	}
	return z;
}

/*
 * This function reads the information of DDR3 SODIMM.
 *
 * @param	ModuleID is the index of DDR3 SODIMM
 *
 * @return	XST_SUCCESS if successful else XST_FAILURE.
 *
 */

#define DDR3_SPD 0x50
#define DDR3_TEMP 0x18

int ddr3ReadInfo(char ModuleID) {
	int Status;
	u8 WriteBuffer[10];
	u8 reg_addr;
	u8 ReadBuffer[30];
	u8 iicAddress;

	switch(ModuleID) {
	case 'A':
		iicAddress = IIC_DDR3A_ADDRESS;
		break;
	case 'B':
		iicAddress = IIC_DDR3B_ADDRESS;
		break;
	default:
		iicAddress = IIC_DDR3A_ADDRESS;
		break;
	}

	/*
	 * Write to the IIC Switch.
	 */
	WriteBuffer[0] = IIC_BUS_DDR3; //Select Bus7 - DDR3
	Status = IicWriteData(IIC_SWITCH_ADDRESS, WriteBuffer, 1);
	if (Status != XST_SUCCESS) {
		xil_printf("PCA9548 FAILED to select DDR3 IIC Bus\r\n");
		return XST_FAILURE;
	}

	/*
	 * Read Module Part Number
	 */
	reg_addr = 128; //Vendor Name ASCII String
	Status = IicReadData2((iicAddress | DDR3_SPD), reg_addr, ReadBuffer, 18);
	if (Status != XST_SUCCESS) {
		xil_printf("DDR3%c IIC Read FAILED. Please check if DDR3%x is plugged in.\r\n", ModuleID, ModuleID);
		return XST_FAILURE;
	}
	ReadBuffer[18] = '\0';
	xil_printf("DDR3%c: Part Number - %s\r\n", ModuleID, ReadBuffer);

	/*
	 * Read Size of DDR3 SODIMM
	 */
	reg_addr = 4; //Vendor Name ASCII String
	Status = IicReadData2((iicAddress | DDR3_SPD), reg_addr, ReadBuffer, 1);
	if (Status != XST_SUCCESS) {
		xil_printf("DDR3%c IIC Read FAILED. Please check if DDR3%x is plugged in.\r\n", ModuleID, ModuleID);
		return XST_FAILURE;
	}
	xil_printf("DDR3%c: Size - %dMBytes\r\n", ModuleID, pow2(2, (ReadBuffer[0] & 0x0F)) * 32 * pow2(2, ((ReadBuffer[0] & 0xF0)>>4)+3));

	return XST_SUCCESS;
}

/*
 * DDR3 IIC Auto Test
 */
int ddr3IicTest(char ModuleID) {
	int Status;
	u8 WriteBuffer[10];
	u8 reg_addr;
	u8 ReadBuffer[30];
	u8 iicAddress;

	switch(ModuleID) {
	case 'A':
		iicAddress = IIC_DDR3A_ADDRESS;
		break;
	case 'B':
		iicAddress = IIC_DDR3B_ADDRESS;
		break;
	default:
		iicAddress = IIC_DDR3A_ADDRESS;
		break;
	}

	/*
	 * Write to the IIC Switch.
	 */
	WriteBuffer[0] = IIC_BUS_DDR3; //Select Bus7 - DDR3
	Status = IicWriteData(IIC_SWITCH_ADDRESS, WriteBuffer, 1);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Read Module Part Number
	 */
	reg_addr = 128; //Vendor Name ASCII String
	Status = IicReadData2((iicAddress | DDR3_SPD), reg_addr, ReadBuffer, 18);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	/*
	 * Read Size of DDR3 SODIMM
	 */
	reg_addr = 4; //Vendor Name ASCII String
	Status = IicReadData2((iicAddress | DDR3_SPD), reg_addr, ReadBuffer, 1);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}
