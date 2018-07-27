/*
 * Copyright (c) 2015 Digilent Inc.
 * Copyright (c) 2015 Tinghui Wang (Steve)
 * All rights reserved.
 *
 * File:
 *     sw/embedded/src/nf_sume_ddr3B/ddr3_test.c
 *
 * Project:
 *     acceptance_test
 *
 * Author:
 *     Tinghui Wang (Steve)
 *
 * Description:
 *     Read DDR3 Test Status
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

XGpio gpioInstance;

/*
 * Initialize GPIO instance for ddr3 Testing
 */
int ddr3Test_Init() {
	XGpio_Config* gpioConfigPtr;
	int Status;

	gpioConfigPtr = XGpio_LookupConfig(XPAR_AXI_GPIO_RO_0_DEVICE_ID);
	if (gpioConfigPtr == NULL) {
		return XST_FAILURE;
	}

	Status = XGpio_CfgInitialize(&gpioInstance, gpioConfigPtr, gpioConfigPtr->BaseAddress);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	return XST_SUCCESS;
}

/*
 * Read GPIO Status
 */
int ddr3RwStat() {
	u32 ddr3Status;

	ddr3Status = XGpio_DiscreteRead(&gpioInstance, 1);
	if(ddr3Status != 0x01) {
		if((ddr3Status & 0x01) == 0) {
			xil_printf("ddr3: Calibration Failed\r\n");
		}
		if(ddr3Status & 0x02) {
			xil_printf("ddr3: Error detected in R/W \r\n");
		}
		return XST_FAILURE;
	}
	xil_printf("ddr3: Calibration Done, No Error Detected.\r\n");
	return XST_SUCCESS;
}

/*
 * Read GPIO Status
 */
int ddr3RwTest() {
	u32 ddr3Status;

	ddr3Status = XGpio_DiscreteRead(&gpioInstance, 1);
	if(ddr3Status != 0x01) {
		u32 delay = 0;
		for (delay = 0; delay < 40000000; delay++) {
			asm("nop");
		}
		ddr3Status = XGpio_DiscreteRead(&gpioInstance, 1);
	}
	if(ddr3Status != 0x01) {
		return XST_FAILURE;
	}
	return XST_SUCCESS;
}
