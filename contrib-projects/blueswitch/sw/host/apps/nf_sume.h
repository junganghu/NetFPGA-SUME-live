/*
 * Copyright (c) 2015 University of Cambridge
 * Copyright (c) 2015 Bjoern A. Zeeb
 * All rights reserved.
 *
 *  File:
 *        nf_sume.h
 *
 * $Id: nf_sume.h,v 1.1 2015/06/24 22:36:12 root Exp root $
 *
 * Author:
 *        Bjoern A. Zeeb
 *
 * This software was developed by the University of Cambridge Computer Laboratory 
 * under EPSRC INTERNET Project EP/H040536/1, National Science Foundation under Grant No. CNS-0855268,
 * and Defense Advanced Research Projects Agency (DARPA) and Air Force Research Laboratory (AFRL), 
 *  under contract FA8750-11-C-0249.
 *
 * @NETFPGA_LICENSE_HEADER_START@
 *
 * Licensed to NetFPGA Open Systems C.I.C. (NetFPGA) under one or more contributor
 * license agreements.  See the NOTICE file distributed with this work for
 * additional information regarding copyright ownership.  NetFPGA licenses this
 * file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
 * "License"); you may not use this file except in compliance with the
 * License.  You may obtain a copy of the License at:
 *
 *   http://www.netfpga-cic.org
 *
 * Unless required by applicable law or agreed to in writing, Work distributed
 * under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
 * CONDITIONS OF ANY KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations under the License.
 *
 * @NETFPGA_LICENSE_HEADER_END@
 *
*/

#ifndef _NF_SUME_H
#define _NF_SUME_H

/*
 * SUME default interface name (first interface) for ifreq ioctl;
 * see netdevice(7).
 */
#define SUME_IFNAM_DEFAULT              "nf0"

/*
 * We are trying to use the same (private, deprecated) IOCTLs NF10 is
 * using.  Unfortunately the old user space tools (rdax/wraxi) operated
 * on a dedicated device node, rather using netdevice(7).
 */
#if defined(__linux__)
#define SUME_IOCTL_CMD_WRITE_REG        (SIOCDEVPRIVATE+1)
#define SUME_IOCTL_CMD_READ_REG         (SIOCDEVPRIVATE+2)
#elif defined(__FreeBSD__)
#define SUME_IOCTL_CMD_WRITE_REG        (SIOCGPRIVATE_0)
#define SUME_IOCTL_CMD_READ_REG         (SIOCGPRIVATE_1)
#else
#error NetFPGA SUME ioctls not supported on this OS
#endif

struct sume_ifreq {
        uint32_t        addr;
        uint32_t        val;
};

#endif /* _NF_SUME_H */

/* end */
