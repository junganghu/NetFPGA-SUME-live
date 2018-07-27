#-
# Copyright (c) 2015 Bjoern A. Zeeb
# All rights reserved.
#
# This software was developed by SRI International and the University of
# Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249
# ("MRC2"), as part of the DARPA MRC research programme.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
# OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
# SUCH DAMAGE.
#
# $Id: Makefile,v 1.4 2015/06/24 22:34:42 root Exp root $
#
# This work was licensed to NetFPGA C.I.C. (NetFPGA) under
# one or more contributor license agreements (CLA).  Changes to this work
# can only be accepted from contributors with a valid CLA in place.
# See http://www.netfpga-cic.org for more information.

#
# Makefile for the NetFPGA SUME driver.
#

#obj-$(CONFIG_NETFPGA_SUME) += sume_riffa.o
### OUTSIDE THE KERNEL TREE ...

MODULE_NAME:=	sume_riffa

KERNEL_VER ?=	$(shell uname -r)
KERNEL_DIR ?=	/lib/modules/$(KERNEL_VER)/build
INSTALL_DIR ?=	/lib/modules/$(KERNEL_VER)/extra/sume_riffa/

obj-m += $(MODULE_NAME).o

ifeq ($(CONFIG_NR_PORTS),)
CONFIG_NR_PORTS := 4
endif
ccflags-y += -DCONFIG_NR_PORTS=$(CONFIG_NR_PORTS)
ifneq ($(CONFIG_16BOFF),)
ccflags-y += -DSUME_16B_OFFSET=1
endif
ifeq ($(DEBUG),y)
ccflags-y += -g -DDEBUG
endif

all: modules

.PHONY: modules
modules:
	make -C $(KERNEL_DIR) M=$(PWD) modules

.PHONY: modules_install
modules_install: modules
	install -o root -g root -m 0755 -d $(INSTALL_DIR)
	install -o root -g root -m 0755 $(MODULE_NAME).ko $(INSTALL_DIR)
	depmod -a $(KERNEL_VER)

.PHONY: install
install: modules_install

.PHONY: clean
clean:
	make -C $(KERNEL_DIR) M=$(PWD) clean

# end
