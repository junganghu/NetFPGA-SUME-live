/*
 * Copyright (c) 2015 Digilent Inc.
 * Copyright (c) 2015 Tinghui Wang (Steve)
 * All rights reserved.
 *
 * File:
 *     sw/embedded/src/nf_sume_gpio/sdcard_test.c
 *
 * Project:
 *     acceptance_test
 *
 * Author:
 *     Tinghui Wang (Steve)
 *
 * Description:
 *     Functions for SD Card Testing
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
#include "xil_io.h"
#include "xparameters.h"
#include <stdio.h>
#include <string.h>

#define SDCARD_BASEADDR XPAR_D_SDCTRL_BASEADDR

#define SCK_EN_MASK			0xfffffffe
#define SCK_DIV_MASK		0xfffffff1
#define RESP_TYPE_MASK		0xffffffcf
#define DATA_TRANSFER_MASK	0xffffff7f
#define CMD_INDEX_MASK		0xffff00ff

typedef struct regs {
	u32 command_reg;
	u32 argument_reg;
	u32 status_reg;
	u32 response_reg0;
	u32 response_reg1;
	u32 response_reg2;
	u32 response_reg3;
	u32 dbg_reg0;
	u32 dbg_reg1;
	u32 dbg_reg2;
	u32 dbg_reg3;
} sd_regs;

sd_regs reg = {
		SDCARD_BASEADDR,
		SDCARD_BASEADDR+0x04,
		SDCARD_BASEADDR+0x08,
		SDCARD_BASEADDR+0x0c,
		SDCARD_BASEADDR+0x10,
		SDCARD_BASEADDR+0x14,
		SDCARD_BASEADDR+0x18,
		SDCARD_BASEADDR+0x1c,
		SDCARD_BASEADDR+0x20,
		SDCARD_BASEADDR+0x24,
		SDCARD_BASEADDR+0x28
};

enum command_reg {
	sck_en 			= 0,
	sck_div 		= 1,
	resp_type		= 4,
	data_transfer 	= 7,
	cmd_index 		= 8,
};

enum div_rate {
	div_2		= 0, // 000 --> 50 MHz
	div_4		= 1, // 001 --> 25 MHz
	div_10		= 2, // 010 --> 10 MHz
	div_20		= 3, // 011 -->  5 MHz
	div_50		= 4, // 100 -->  2 MHz
	div_100		= 5, // 101 -->  1 MHz
	div_125		= 6, // 110 --> 800 kHz
	div_250		= 7  // 111 --> 200 kHz
};

enum status_reg {
	cmd_done 		= 0,
	resp_done 		= 4,
	resp_timeout	= 6,
	data_done		= 8,
	zero_data0		= 10,
	zero_data1		= 11,
	zero_data2		= 12,
	zero_data3		= 13,
	error_data0		= 14,
	error_data1		= 15,
	error_data2		= 16,
	error_data3		= 17
};

enum commands {
	CMD0	= 0x40,
	CMD2	= 0x42,
	CMD3	= 0x43,
	CMD7	= 0x47,
	CMD8	= 0x48,
	CMD9	= 0x49,
	CMD16	= 0x50,
	CMD19	= 0x53,
	CMD55	= 0x77,
	CMD58	= 0x7A,
	ACMD6	= 0x46,
	ACMD13	= 0x4D,
	ACMD41	= 0x69
};

unsigned char verbose = 0;

u8 sd_send_cmd(u8 Cmd, u32 Arg, u8 RespType, u8 RecvData);
u16 sd_init();

void usleep(u32 ms_count) {
	u32 count;
	for(count=0; count<((ms_count*10000)+1); count++) {
		asm("nop");
	}
}

XStatus sdcard_auto_test(void) {
	XStatus status = XST_SUCCESS;
	u16 u16Ret, u16Rca;
	u8 u8ErrorData[4], u8ZeroData[4];

	if (verbose) {
		xil_printf("\r\nInsert card...");
		xil_printf(" OK.");
	}

	usleep(10);

	if (verbose) {
		xil_printf("\r\n\r\nStarted initialization...");
	}

	u16Ret = sd_init();

	if(u16Ret == 0xffff) {
		xil_printf("\r\nError initializing.\r\n");
		status = XST_FAILURE;
	}
	else {
		// storing RCA
		u16Rca = u16Ret;
		if(verbose) {
			xil_printf("\r\nDone initializing.\r\n");

			xil_printf("\r\nReading SD Status on 4 bits...");
		}

		// card initialized and in state = 'stby'
		// to put it into 'tran' state we shall issue CMD7
		sd_send_cmd(CMD7, ((u16Rca << 16) & 0xffff0000), 2, 0);
		if(verbose) {
			xil_printf("\r\nCard is locked = %s", (((Xil_In32(reg.response_reg0) >> 25) & 0x00000001)==1)?"card locked":"card unlocked");
			xil_printf("\r\nCurrent state (CMD7) = %d", ((Xil_In32(reg.response_reg0) >> 9) & 0x0000000f));
		}

		// sending ACMD6 to switch to 4-bit mode
		sd_send_cmd(CMD55, ((u16Rca << 16) & 0xffff0000), 2, 0);
		if(verbose) {
			xil_printf("\r\nCurrent state (CMD55) = %d", ((Xil_In32(reg.response_reg0) >> 9) & 0x0000000f));
		}
		sd_send_cmd(ACMD6, 0x00000002, 2, 0);
		if(verbose) {
			xil_printf("\r\nCurrent state (ACMD6) = %d", ((Xil_In32(reg.response_reg0) >> 9) & 0x0000000f));
		}

		//sending ACMD13 to read SD Status
		sd_send_cmd(CMD55, ((u16Rca << 16) & 0xffff0000), 2, 0);
		if(verbose) {
			xil_printf("\r\nCurrent state (CMD55) = %d", ((Xil_In32(reg.response_reg0) >> 9) & 0x0000000f));
		}
		sd_send_cmd(ACMD13, 0x00000000, 2, 1);
		if(verbose) {
			xil_printf("\r\nCurrent state (ACMD13) = %d", ((Xil_In32(reg.response_reg0) >> 9) & 0x0000000f));
		}

		u8ZeroData[0] = (Xil_In32(reg.status_reg) >> zero_data0) & 0x00000001;
		u8ZeroData[1] = (Xil_In32(reg.status_reg) >> zero_data1) & 0x00000001;
		u8ZeroData[2] = (Xil_In32(reg.status_reg) >> zero_data2) & 0x00000001;
		u8ZeroData[3] = (Xil_In32(reg.status_reg) >> zero_data3) & 0x00000001;
		u8ErrorData[0] = (Xil_In32(reg.status_reg) >> error_data0) & 0x00000001;
		u8ErrorData[1] = (Xil_In32(reg.status_reg) >> error_data0) & 0x00000001;
		u8ErrorData[2] = (Xil_In32(reg.status_reg) >> error_data0) & 0x00000001;
		u8ErrorData[3] = (Xil_In32(reg.status_reg) >> error_data0) & 0x00000001;

		if(u8ErrorData[0]==1 || u8ErrorData[1]==1 || u8ErrorData[2]==1 || u8ErrorData[3]==1) {
			status = XST_FAILURE;
		}
		if(verbose) {
			xil_printf("\r\nCRC result:");
			xil_printf("\r\nDAT0: %s", (u8ErrorData[0]==1)?"error":(u8ZeroData[0]==1)?"all 0's":"OK");
			xil_printf("\r\nDAT1: %s", (u8ErrorData[1]==1)?"error":(u8ZeroData[1]==1)?"all 0's":"OK");
			xil_printf("\r\nDAT2: %s", (u8ErrorData[2]==1)?"error":(u8ZeroData[2]==1)?"all 0's":"OK");
			xil_printf("\r\nDAT3: %s", (u8ErrorData[3]==1)?"error":(u8ZeroData[3]==1)?"all 0's":"OK");
			xil_printf("\r\nDAT0: actual = 0x%04x > decoded = 0x%04x", (Xil_In32(reg.dbg_reg0) >> 16) & 0x0000ffff, Xil_In32(reg.dbg_reg0) & 0x0000ffff);
			xil_printf("\r\nDAT1: actual = 0x%04x > decoded = 0x%04x", (Xil_In32(reg.dbg_reg1) >> 16) & 0x0000ffff, Xil_In32(reg.dbg_reg1) & 0x0000ffff);
			xil_printf("\r\nDAT2: actual = 0x%04x > decoded = 0x%04x", (Xil_In32(reg.dbg_reg2) >> 16) & 0x0000ffff, Xil_In32(reg.dbg_reg2) & 0x0000ffff);
			xil_printf("\r\nDAT3: actual = 0x%04x > decoded = 0x%04x", (Xil_In32(reg.dbg_reg3) >> 16) & 0x0000ffff, Xil_In32(reg.dbg_reg3) & 0x0000ffff);
			xil_printf("\r\nDone reading Status.");
		}
		// sending CMD7 again to put card into 'stby' state
		//sd_send_cmd(CMD7, ((u16Rca << 16) & 0xffff0000), 2, 0);
		//xil_printf("\r\nCurrent state (CMD7) = %d", ((Xil_In32(reg.response_reg0) >> 9) & 0x0000000f));
	}
	return status;
}

void sdcard_manual_test() {
	verbose = 1;
	sdcard_auto_test();
	verbose = 0;
}

u16 sd_init() {

	u32 u32Ret, u32Resp[4];
	u16 u16Rca, u16RetErr = 0;
	u8 chMonth[12];

	// setting divide rate for sck
	Xil_Out32(reg.command_reg, (div_4/*div_250*/ << sck_div) | (Xil_In32(reg.command_reg) & SCK_DIV_MASK));
	// enabling sck
	Xil_Out32(reg.command_reg, (1 << sck_en) | (Xil_In32(reg.command_reg) & SCK_EN_MASK));
	// wait for 80 * 5us = 400us
	usleep(400);

	// sending CMD0
	sd_send_cmd(CMD0, 0x00000000, 0, 0);

	// sending CMD8
	u32Ret = sd_send_cmd(CMD8, 0x000001AA, 2, 0);

	if(u32Ret) {
		xil_printf("\r\nError: no response for CMD8 (R7).");
		u16RetErr = 0xffff;
	}
	else { // Ver2.00 or later SD Memory Card

		if(Xil_In32(reg.response_reg0) != 0x000001AA) {
			xil_printf("\r\nError: bad response for CMD8 (R7).");
			u16RetErr = 0xffff;
		}
		else { // Card with compatible voltage range

			// sending ACMD41
			do {
				// enable ACMD by sending CMD55 with R1 in response
				u32Ret = sd_send_cmd(CMD55, 0x00000000, 2, 0);
				if(u32Ret) {
					xil_printf("\r\nError: no response for CMD55 (R1).");
					u16RetErr = 0xffff;
				}
				u32Ret = sd_send_cmd(ACMD41, 0x40300000, 2, 0);
				if(u32Ret) {
					xil_printf("\r\nError: no response for ACMD41 (R3).");
					u16RetErr = 0xffff;
				}
				u32Resp[0] = Xil_In32(reg.response_reg0);
			} // wait for the busy bit in R3 to clear
			while(!((u32Resp[0] >> 31) & 0x01));

			if(verbose) {
				// checking CCS bit
				if((u32Resp[0] >> 30) & 0x01) { // CCS = 1
					xil_printf("\r\nVer2.00 or later SDHC/SDXC Card.");
				}
				else { // CCS = 0
					xil_printf("\r\nVer2.00 or later SDSC.");
				}
			}

			// sending CMD2
			u32Ret = sd_send_cmd(CMD2, 0x00000000, 1, 0);
			if(u32Ret) {
				xil_printf("\r\nError: no response for CMD2 (R2).");
				u16RetErr = 0xffff;
			}

			// display CID contents
			if(verbose) {
				xil_printf("\r\n\r\nCID:");
				u32Resp[0] = Xil_In32(reg.response_reg0);
				u32Resp[1] = Xil_In32(reg.response_reg1);
				u32Resp[2] = Xil_In32(reg.response_reg2);
				u32Resp[3] = Xil_In32(reg.response_reg3);

				switch(u32Resp[0] & 0x0000000f) {
					case 1: strcpy((char *)chMonth, "January"); break;
					case 2: strcpy((char *)chMonth, "February"); break;
					case 3: strcpy((char *)chMonth, "March"); break;
					case 4: strcpy((char *)chMonth, "April"); break;
					case 5: strcpy((char *)chMonth, "May"); break;
					case 6: strcpy((char *)chMonth, "June"); break;
					case 7: strcpy((char *)chMonth, "July"); break;
					case 8: strcpy((char *)chMonth, "August"); break;
					case 9: strcpy((char *)chMonth, "September"); break;
					case 10: strcpy((char *)chMonth, "October"); break;
					case 11: strcpy((char *)chMonth, "November"); break;
					default: strcpy((char *)chMonth, "December"); break;
				}

				xil_printf("\r\nManufacturer ID             : 0x%x", (u32Resp[3] >> 16) & 0x000000ff);
				xil_printf("\r\nOEM/Application ID          : %c%c", (u32Resp[3] >> 8) & 0x000000ff, u32Resp[3] & 0x000000ff);
				xil_printf("\r\nProduct name                : %c%c%c%c%c", (u32Resp[2] >> 24) & 0x000000ff,
																	(u32Resp[2] >> 16) & 0x000000ff,
																	(u32Resp[2] >> 8) & 0x000000ff,
																	u32Resp[2] & 0x000000ff,
																	(u32Resp[1] >> 24) & 0x000000ff);
				xil_printf("\r\nProduct revision            : %d.%d", (u32Resp[1] >> 20) & 0x0000000f, (u32Resp[1] >> 16) & 0x0000000f);
				xil_printf("\r\nProduct serial number       : 0x%x", ((u32Resp[1] << 15) & 0xffff0000) | ((u32Resp[0] >> 16) & 0x0000ffff));
				xil_printf("\r\nManufacturing date          : %s %d", chMonth, 0x7d0 + ((u32Resp[0] >> 4) & 0x0000000f));
			}

			// sending CMD3
			do {
				u32Ret = sd_send_cmd(CMD3, 0x00000000, 2, 0);
				if(u32Ret) {
					xil_printf("\r\nError: no response for CMD3 (R6).");
					u16RetErr = 0xffff;
				}

				u32Resp[0] = Xil_In32(reg.response_reg0);
				u16Rca = (u32Resp[0] >> 16) & 0x0000ffff;

				if(verbose) {
					xil_printf("\r\nRelative Card Address       : 0x%x", u16Rca);
				}
			}
			while(u16Rca == 0x0000);

			// display CSD contents
			if(verbose) {
				sd_send_cmd(CMD9, ((u16Rca << 16) & 0xffff0000), 1, 0);
				if(u32Ret) {
					xil_printf("\r\nError: no response for CMD2 (R2).");
					u16RetErr = 0xffff;
				}

				u8 read_bl_len, c_size_mult, file_format_grp, file_format, csd_ver;
				u32 c_size;

				u32Resp[0] = Xil_In32(reg.response_reg0);
				u32Resp[1] = Xil_In32(reg.response_reg1);
				u32Resp[2] = Xil_In32(reg.response_reg2);
				u32Resp[3] = Xil_In32(reg.response_reg3);

				csd_ver = ((u32Resp[3] >> 22) & 0x00000003);
				xil_printf("\r\n\r\nCSD (ver. %d.0):", 1 + csd_ver);
				xil_printf("\r\nMax. data transfer rate     : %s", (((u32Resp[2] >> 24) & 0x000000ff)==0x32)?"25 MHz":
																		(((u32Resp[2] >> 24) & 0x000000ff)==0x5a)?"50 MHz":
																		(((u32Resp[2] >> 24) & 0x000000ff)==0x0b)?"100 MHz":"200 MHz");
				xil_printf("\r\nCard command classes        : 0x%x", (u32Resp[2] >> 12) & 0x00000fff);
				xil_printf("\r\nDSR implemented             : %s", (((u32Resp[2] >> 4) & 0x00000001)==1)?"yes":"no");
				read_bl_len = (u32Resp[1] >> 8) & 0x0000000f;
				xil_printf("\r\nMax. read data block length : %d", read_bl_len);
				c_size_mult = (u32Resp[2] >> 7) & 0x00000007;
				xil_printf("\r\nDevice size multiplier      : %d", c_size_mult);
				c_size = (csd_ver == 0)?(((u32Resp[2] << 10) & 0x00000c00)|((u32Resp[1] >> 22) & 0x000003ff)):((u32Resp[1] >> 8) & 0x007fffff);
				xil_printf("\r\nDevice size                 : %d", c_size);
				file_format_grp = (u32Resp[0] >> 7) & 0x00000001;
				file_format = (u32Resp[0] >> 2) & 0x00000003;
				xil_printf("\r\nFile Format                 : %s", ((file_format_grp == 0) && (file_format == 0))?"Hard disk-like file system with partition table":
																	((file_format_grp == 0) && (file_format == 1))?"DOS FAT with boot sector only (no partition table)":
																	((file_format_grp == 0) && (file_format == 2))?"Universal file format":
																	((file_format_grp == 0) && (file_format == 3))?"Others/Unknown":"Reserved");
			}
		}
	}

	if(u16RetErr == 0xffff) {
		return 0xffff;
	}
	else {
		return u16Rca;
	}
}

u8 sd_send_cmd(u8 Cmd, u32 Arg, u8 RespType, u8 RecvData) {

	u32 rd_data;

	// setting CMD index
	Xil_Out32(reg.command_reg, (Cmd << cmd_index)|(Xil_In32(reg.command_reg) & CMD_INDEX_MASK));
	// setting response type
	Xil_Out32(reg.command_reg, (RespType << resp_type)|(Xil_In32(reg.command_reg) & RESP_TYPE_MASK));
	// setting data transfer
	Xil_Out32(reg.command_reg, (RecvData << data_transfer)|(Xil_In32(reg.command_reg) & DATA_TRANSFER_MASK));
	// setting argument
	Xil_Out32(reg.argument_reg, Arg);
	Xil_Out32(reg.dbg_reg3 + 4, Arg);
	// waiting for the command send to end
	do {
		rd_data = Xil_In32(reg.status_reg);
	}
	while(!((rd_data >> cmd_done) & 0x01));

	// waiting for the response to be received
	if(RespType) {
		do {
			rd_data = Xil_In32(reg.status_reg);
			if((rd_data >> resp_timeout) & 0x01) {
				xil_printf("\r\nResponse timeout.");
				return 1;
			}
		}
		while(!((rd_data >> resp_done) & 0x01));
	}

	// waiting for the data to be received
	if(RecvData) {
		do {
			rd_data = Xil_In32(reg.status_reg);
		}
		while(!((rd_data >> data_done) & 0x01));
	}

	return 0;
}

