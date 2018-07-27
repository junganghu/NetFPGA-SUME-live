#!/bin/sh

#
# Copyright (c) 2015 University of Cambridge
# All rights reserved.
#
# This software was developed by
# Stanford University and the University of Cambridge Computer Laboratory
# under National Science Foundation under Grant No. CNS-0855268,
# the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
# by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
# as part of the DARPA MRC research programme.
#
# @NETFPGA_LICENSE_HEADER_START@
#
# Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
# license agreements.  See the NOTICE file distributed with this work for
# additional information regarding copyright ownership.  NetFPGA licenses this
# file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
# "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at:
#
#   http://www.netfpga-cic.org
#
# Unless required by applicable law or agreed to in writing, Work distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations under the License.
#
# @NETFPGA_LICENSE_HEADER_END@
#


awk '
BEGIN {
	ba=0x00000000;
	printf "#!/bin/sh\n\n";
}
{

	if (/BASEADDR/) {
		printf "\necho \"===> %s (%s)\"\n", $2, $3;
		ba=$3;
	}
	if (/_OFFSET/) {
		printf "echo -n \"%s: \"\n", $2;
		printf "./rwaxi -a 0x%08x\n", ba + $3;
	}

}' < ${NF_DESIGN_DIR}/sw/embedded/src/sume_register_defines.h > ${NF_DESIGN_DIR}/sw/host/apps/register_read.sh
cd ${NF_DESIGN_DIR}/sw/host/apps/
cp ${APPS_FOLDER}/rwaxi .
make

echo "Please run \`sh register_read.sh\` in ${NF_DESIGN_DIR}/sw/host/apps/"

# end
