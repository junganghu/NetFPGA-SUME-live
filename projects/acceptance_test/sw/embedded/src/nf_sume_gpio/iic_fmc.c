/*
 * Copyright (c) 2015 Digilent Inc.
 * Copyright (c) 2015 Tinghui Wang (Steve)
 * All rights reserved.
 *
 * File:
 *     sw/embedded/src/nf_sume_gpio/iic_fmc.c
 *
 * Project:
 *     acceptance_test
 *
 * Author:
 *     Tinghui Wang (Steve)
 *
 * Description:
 *     IIC configuration to generate 156.25MHz clocks from CDCM6208
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

#define FMC_CPLD_SYNCN_MASK 0x40
#define FMC_CPLD_RESET_MASK 0x80

/*
 * Enable CDCM6208 through CPLD IIC interface
 */
int enable_cdcm6208() {
	int Status;
	u8 WriteBuffer[10];
	u8 GPIO_Number;

	/*
	 * Write to the IIC Switch.
	 */
	WriteBuffer[0] = IIC_BUS_FMC;
	Status = IicWriteData(IIC_SWITCH_ADDRESS, WriteBuffer, 1);
	if (Status != XST_SUCCESS) {
		xil_printf("PCA9548 FAILED to select FMC IIC Bus\r\n");
		return XST_FAILURE;
	}

	/*
	 * Read GPIO Data
	 */
	Status = IicReadData2(IIC_FMC_CPLD, 0x00, &GPIO_Number, 1);
	if (Status != XST_SUCCESS) {
		xil_printf("FMC_CPLD Read Failed. Please make sure FMC-Loopback Board is plugged in.\r\n");
		return XST_FAILURE;
	}

#ifdef FMC_DEBUG
	xil_printf("CPLD GPIO: 0x%X \r\n", GPIO_Number);
#endif

	GPIO_Number |= FMC_CPLD_SYNCN_MASK;
	GPIO_Number |= FMC_CPLD_RESET_MASK;

	/*
	 * Enable CDCM6208 Clock Output
	 */
	WriteBuffer[0] = 0x00;
	WriteBuffer[1] = GPIO_Number;
	Status = IicWriteData(IIC_FMC_CPLD, WriteBuffer, 2);
	if (Status != XST_SUCCESS) {
		xil_printf("FMC_CPLD Write Failed. Please make sure FMC-Loopback Board is plugged in.\r\n");
		return XST_FAILURE;
	}

	int i = 0;

	for (i = 0; i < 100000; i++) {
		asm("nop");
	}

	return XST_SUCCESS;
}

#define FMC_CPLD_PG_C2M_MASK 0x10

/*
 * Power Cycle CDCM6208 through CPLD on FMC Loopback Board
 */
int fmccpld_cdcm6208_powercycle(void) {
	int Status;
	u8 WriteBuffer[2];
	u8 GPIO_Number;
	int i;

	/*
	 * Write to the IIC Switch.
	 */
	WriteBuffer[0] = IIC_BUS_FMC; //Select Bus7 - Si5326
	Status = IicWriteData(IIC_SWITCH_ADDRESS, WriteBuffer, 1);
	if (Status != XST_SUCCESS) {
		xil_printf("PCA9548 FAILED to select FMC IIC Bus\r\n");
		return XST_FAILURE;
	}

	/*
	 * Read GPIO Data
	 */
	Status = IicReadData2(IIC_FMC_CPLD, 0x00, &GPIO_Number, 1);
	if (Status != XST_SUCCESS) {
		xil_printf("FMC_CPLD Read Failed. Please make sure FMC-Loopback Board is plugged in.\r\n");
		return XST_FAILURE;
	}

#ifdef FMC_DEBUG
	xil_printf("Current CPLD GPIO: 0x%X \r\n", GPIO_Number);
	xil_printf("Toogle Power Down Signal for CDCM6208\r\n");
#endif

	GPIO_Number &= ~FMC_CPLD_PG_C2M_MASK;
	GPIO_Number &= ~FMC_CPLD_RESET_MASK;
	WriteBuffer[0] = 0x00;
	WriteBuffer[1] = GPIO_Number;
	Status = IicWriteData(IIC_FMC_CPLD, WriteBuffer, 2);
	if (Status != XST_SUCCESS) {
		xil_printf("FMC_CPLD Write Failed. Please make sure FMC-Loopback Board is plugged in.\r\n");
		return XST_FAILURE;
	}

	/*
	 * Read GPIO Data
	 */
	Status = IicReadData2(IIC_FMC_CPLD, 0x00, &GPIO_Number, 1);
	if (Status != XST_SUCCESS) {
		xil_printf("FMC_CPLD Read Failed. Please make sure FMC-Loopback Board is plugged in.\r\n");
		return XST_FAILURE;
	}
#ifdef FMC_DEBUG
	xil_printf("Current CPLD GPIO: 0x%X \r\n", GPIO_Number);
#endif

	for (i = 0; i < 100000; i++) {
		asm("nop");
	}

	GPIO_Number |= FMC_CPLD_PG_C2M_MASK;
	GPIO_Number |= FMC_CPLD_RESET_MASK;
	WriteBuffer[0] = 0x00;
	WriteBuffer[1] = GPIO_Number;
	Status = IicWriteData(IIC_FMC_CPLD, WriteBuffer, 2);
	if (Status != XST_SUCCESS) {
		xil_printf("FMC_CPLD Write Failed. Please make sure FMC-Loopback Board is plugged in.\r\n");
		return XST_FAILURE;
	}

	Status = IicReadData2(IIC_FMC_CPLD, 0x00, &GPIO_Number, 1);
	if (Status != XST_SUCCESS) {
		xil_printf("FMC_CPLD Read Failed. Please make sure FMC-Loopback Board is plugged in.\r\n");
		return XST_FAILURE;
	}

#ifdef FMC_DEBUG
	xil_printf("Current CPLD GPIO: 0x%X \r\n", GPIO_Number);
	xil_printf("Finish CDCM Power-on Cycle\r\n");
#endif

	for (i = 0; i < 4000000; i++) {
		asm("nop");
	}

	return XST_SUCCESS;
}

/*
 * Read CDCM6209 Registers
 */
int read_cdcm6208(void) {
	int i;
	int Status;
	u8 ReadBuffer[2];

	for(i = 0; i < 21; i++) {
		Status = IicReadData3(IIC_FMC_CDCM, i, ReadBuffer, 2);
		if (Status != XST_SUCCESS) {
			xil_printf("FMC CDCM Read Failed. Please make sure FMC-Loopback Board is plugged in.\r\n");
			return XST_FAILURE;
		}
		xil_printf("CDCM6208 Reg%d: 0x%x 0x%x\r\n", i, ReadBuffer[0], ReadBuffer[1]);
	}
	return XST_SUCCESS;
}

/*
 * Print information regarding CDCM6209
 */
int fmccpld_cdcm6208_info() {
	int Status;
	u8 WriteBuffer[2];
	u8 ReadBuffer[2];

	/*
	 * Write to the IIC Switch.
	 */
	WriteBuffer[0] = IIC_BUS_FMC; //Select Bus7 - Si5326
	Status = IicWriteData(IIC_SWITCH_ADDRESS, WriteBuffer, 1);
	if (Status != XST_SUCCESS) {
		xil_printf("PCA9548 FAILED to select FMC IIC Bus\r\n");
		return XST_FAILURE;
	}

	Status = IicReadData3(IIC_FMC_CDCM, 0x40, ReadBuffer, 2);
	if (Status != XST_SUCCESS) {
		xil_printf("FMC CDCM Read Failed. Please make sure FMC-Loopback Board is plugged in.\r\n");
		return XST_FAILURE;
	}
	xil_printf("CDCM6208 Info: 0x%x 0x%x\r\n", ReadBuffer[0], ReadBuffer[1]);

	return XST_SUCCESS;
}

/*
 * Config CDCM6208 for outputing 156.25MHz on all clock outputs
 */
int config_cdcm6208(void) {
	u8 WriteBuffer[4];

	fmccpld_cdcm6208_powercycle();

#ifdef FMC_DEBUG
	fmccpld_cdcm6208_info();
#endif

	/* CDCM6208 V2 Configuration
	 * Calculated using CDCM6208 EVM Software V3.24
	 *
	 * Using Primary 156.25MHz Clock (LVDS)
	 * R = 5
	 * Smart Mux: Manual, PRI
	 * M = 1
	 * N = 25
	 * C3 = 242.5pF
	 * R3 = 100 Ohm
	 * CP = 2.5mA
	 * F_pfd = 31.25MHz
	 * F_vco = 3.125GHz
	 * PS_A = PS_B = 4
	 * DIV_Y0/Y1/Y2/Y3 = 5
	 * F_Y0/1/2/3 = 156.25MHz
	 */

	WriteBuffer[0] = 0x00;

	WriteBuffer[1] = 0x00;
	WriteBuffer[2] = 0x01;
	WriteBuffer[3] = 0xB9;
	IicWriteData(IIC_FMC_CDCM, WriteBuffer, 4);

	WriteBuffer[1] = 0x01;
	WriteBuffer[2] = 0x00;
	WriteBuffer[3] = 0x00;
	IicWriteData(IIC_FMC_CDCM, WriteBuffer, 4);

	WriteBuffer[1] = 0x02;
	WriteBuffer[2] = 0x00;
	WriteBuffer[3] = 0x18;
	IicWriteData(IIC_FMC_CDCM, WriteBuffer, 4);

	WriteBuffer[1] = 0x03;
	WriteBuffer[2] = 0x00;
	WriteBuffer[3] = 0xF0;
	IicWriteData(IIC_FMC_CDCM, WriteBuffer, 4);

	WriteBuffer[1] = 0x04;
	WriteBuffer[2] = 0x24;
	WriteBuffer[3] = 0xAC;
	IicWriteData(IIC_FMC_CDCM, WriteBuffer, 4);

	WriteBuffer[1] = 0x05;
	WriteBuffer[2] = 0x00;
	WriteBuffer[3] = 0x22;
	IicWriteData(IIC_FMC_CDCM, WriteBuffer, 4);

	WriteBuffer[1] = 0x06;
	WriteBuffer[2] = 0x00;
	WriteBuffer[3] = 0x04;
	IicWriteData(IIC_FMC_CDCM, WriteBuffer, 4);

	WriteBuffer[1] = 0x07;
	WriteBuffer[2] = 0x00;
	WriteBuffer[3] = 0x22;
	IicWriteData(IIC_FMC_CDCM, WriteBuffer, 4);

	WriteBuffer[1] = 0x08;
	WriteBuffer[2] = 0x00;
	WriteBuffer[3] = 0x04;
	IicWriteData(IIC_FMC_CDCM, WriteBuffer, 4);

	fmccpld_cdcm6208_powercycle();
	enable_cdcm6208();

	int i = 0;

	for (i = 0; i < 400000; i++) {
		asm("nop");
	}

	return XST_SUCCESS;
}

