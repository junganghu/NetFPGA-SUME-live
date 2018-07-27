/*
 * Copyright (c) 2015 Digilent Inc.
 * Copyright (c) 2015 Tinghui Wang (Steve)
 * All rights reserved.
 *
 * File:
 *     sw/embedded/src/nf_sume_sata/sata_test.c
 *
 * Project:
 *     acceptance_test
 *
 * Author:
 *     Tinghui Wang (Steve)
 *
 * Description:
 *     Functions for SATA test
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
#include "xgpio.h"
#include "xparameters.h"
#include <stdio.h>

XGpio gpioRW0_ctrl;
XGpio gpioRO0_status;
XGpio gpioRO1_errCount;
XGpio gpioRO2_errCount;

/*
 * Initialize GPIO instance for qdrA Testing
 */
int sataTest_Init() {
	XGpio_Config* gpioConfigPtr;
	int i;
	int Status;

	gpioConfigPtr = XGpio_LookupConfig(XPAR_AXI_GPIO_RW_0_DEVICE_ID);
	if (gpioConfigPtr == NULL) {
		return XST_FAILURE;
	}

	Status = XGpio_CfgInitialize(&gpioRW0_ctrl, gpioConfigPtr, gpioConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	gpioConfigPtr = XGpio_LookupConfig(XPAR_AXI_GPIO_RO_0_DEVICE_ID);
	if (gpioConfigPtr == NULL) {
		return XST_FAILURE;
	}

	Status = XGpio_CfgInitialize(&gpioRO0_status, gpioConfigPtr, gpioConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	gpioConfigPtr = XGpio_LookupConfig(XPAR_AXI_GPIO_RO_1_DEVICE_ID);
	if (gpioConfigPtr == NULL) {
		return XST_FAILURE;
	}

	Status = XGpio_CfgInitialize(&gpioRO1_errCount, gpioConfigPtr, gpioConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	gpioConfigPtr = XGpio_LookupConfig(XPAR_AXI_GPIO_RO_2_DEVICE_ID);
	if (gpioConfigPtr == NULL) {
		return XST_FAILURE;
	}

	Status = XGpio_CfgInitialize(&gpioRO2_errCount, gpioConfigPtr, gpioConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XGpio_DiscreteWrite(&gpioRW0_ctrl, 1, 0x01);

	for(i = 0; i < 100; i++) {
		asm("nop");
	}

	XGpio_DiscreteWrite(&gpioRW0_ctrl, 1, 0x00);

	return XST_SUCCESS;
}

/*
 * Read GPIO Status
 */
int sataRwStat() {
	u32 sataStatus;

	sataStatus = XGpio_DiscreteRead(&gpioRO0_status, 1);
	if(sataStatus != 0x01) {
		xil_printf("sata: Transceiver Initialization Failed\r\n");
		return XST_FAILURE;
	}

	sataStatus = XGpio_DiscreteRead(&gpioRO1_errCount, 1);
	if(sataStatus != 0x00) {
		xil_printf("sata-Channel0: Error Count %4d (0x%02x)\r\n", sataStatus, sataStatus);
		return XST_FAILURE;
	}

	sataStatus = XGpio_DiscreteRead(&gpioRO2_errCount, 1);
	if(sataStatus != 0x00) {
		xil_printf("sata-Channel1: Error Count %4d (0x%02x)\r\n", sataStatus, sataStatus);
		return XST_FAILURE;
	}

	xil_printf("sata: Test Passed with no Errors\r\n");
	return XST_SUCCESS;
}

/*
 * Read GPIO Status
 */
int sataRwTest() {
	u32 sataStatus;

	sataStatus = XGpio_DiscreteRead(&gpioRO0_status, 1);
	if(sataStatus != 0x01) {
		return XST_FAILURE;
	}

	sataStatus = XGpio_DiscreteRead(&gpioRO1_errCount, 1);
	if(sataStatus != 0x00) {
		return XST_FAILURE;
	}

	sataStatus = XGpio_DiscreteRead(&gpioRO2_errCount, 1);
	if(sataStatus != 0x00) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}
