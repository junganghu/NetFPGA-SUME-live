/*******************************************************************************
*
* Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
*                          Junior University
* Copyright (C) David Erickson, Filip Paun
* All rights reserved.
*
* This software was developed by
* Stanford University and the University of Cambridge Computer Laboratory
* under National Science Foundation under Grant No. CNS-0855268,
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
*
******************************************************************************/


#ifndef OR_CLI_H_
#define OR_CLI_H_

#include "or_data_types.h"

int cli_main(void* subsystem);

cli_command_handler cli_command_lpm(router_state* rs, char* command);
void process_client_request_np(void* arg);
void* process_client_request(void *arg);

void lock_cli_commands_rd(void* subsys);
void unlock_cli_commands(void* subsys);

void cli_help(router_state *rs, cli_request *req);
void cli_show_help(router_state *rs, cli_request *req);
void cli_hw_help(router_state *rs, cli_request *req);

void cli_nat_test(router_state *rs, cli_request *req);

#endif /* OR_CLI_H_ */

