/*
 * Copyright (c) 2015 Digilent Inc.
 * Copyright (c) 2015 Tinghui Wang (Steve)
 * All rights reserved.
 *
 * File:
 *     sw/embedded/src/nf_sume_gpio/clk_test.c
 *
 * Project:
 *     acceptance_test
 *
 * Author:
 *     Tinghui Wang (Steve)
 *
 * Description:
 *     Read Test Results for Clock pins on FMC interface
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
#include "xil_io.h"
#include "xparameters.h"
#include <stdio.h>

#define D_CLKFREQ_DETECTOR_CTRL_REG_OFFSET 0
#define D_CLKFREQ_DETECTOR_FREQ_REG_OFFSET 4
#define D_CLKFREQ_DETECTOR_S_AXI_SLV_REG2_OFFSET 8
#define D_CLKFREQ_DETECTOR_S_AXI_SLV_REG3_OFFSET 12

u32 d_clkfreq_GetClkFreq(u32 BaseAddress) {
	return Xil_In32(BaseAddress + D_CLKFREQ_DETECTOR_FREQ_REG_OFFSET);
}

void d_clkfreq_Enable(u32 BaseAddress) {
	Xil_Out32(BaseAddress + D_CLKFREQ_DETECTOR_CTRL_REG_OFFSET, 0);
}

void d_clkfreq_Disable(u32 BaseAddress) {
	Xil_Out32(BaseAddress + D_CLKFREQ_DETECTOR_CTRL_REG_OFFSET, 1);
}

struct clk_info {
	char* clkName;
	u32 baseAddress;
	u32 frequency;
};

struct clk_info fmc_clks[4] = {
	{
		.clkName = "fmc_clk0",
		.baseAddress = XPAR_FMC_CLK0_FREQDETECT_BASEADDR,
		.frequency = 0
	},{
		.clkName = "fmc_clk1",
		.baseAddress = XPAR_FMC_CLK1_FREQDETECT_BASEADDR,
		.frequency = 0
	},{
		.clkName = "fmc_gbtclk0",
		.baseAddress = XPAR_FMC_GBTCLK0_FREQDETECT_BASEADDR,
		.frequency = 0
	},{
		.clkName = "fmc_gbtclk1",
		.baseAddress = XPAR_FMC_GBTCLK1_FREQDETECT_BASEADDR,
		.frequency = 0
	}
};

void clk_enabled(void) {
	u32 i;

	for(i = 0; i < 4; i++) {
		d_clkfreq_Enable(fmc_clks[i].baseAddress);
	}
}

void fmc_clk_read(void) {
	u32 i;

	for(i = 0; i < 4; i++) {
		fmc_clks[i].frequency = 0;
	}
	
	for(i = 0; i < 4; i++) {
		fmc_clks[i].frequency = d_clkfreq_GetClkFreq(fmc_clks[i].baseAddress);
	}
}

XStatus fmc_clk_auto_test(void) {
	XStatus status = XST_SUCCESS;
	int i;
	int freq_mhz;

	fmc_clk_read();
	
	for(i = 0; i < 4; i++) {
		freq_mhz = fmc_clks[i].frequency / 1000000;
		if (freq_mhz < 155 || freq_mhz > 156) {
			status = XST_FAILURE;
		}
	}
	
	return status;
}

XStatus fmc_clk_info(void) {
	int i;

	fmc_clk_read();
	
	for(i = 0; i < 4; i++) {
		xil_printf("%s: %9d Hz\r\n", fmc_clks[i].clkName, fmc_clks[i].frequency);
	}
	
	return XST_SUCCESS;
}

