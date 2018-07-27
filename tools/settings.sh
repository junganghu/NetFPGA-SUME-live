################################################################################
#
# Copyright (c) 2015 University of Cambridge
# All rights reserved.
#
# This software was developed by Stanford University and the University of Cambridge Computer Laboratory
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

export SUME_FOLDER=~/NetFPGA-SUME-live-master 
#export XILINX_PATH=/opt/Xilinx/Vivado/2016.4
export XILINX_PATH=/opt/Xilinx/Vivado/2015.2
export NF_PROJECT_NAME=reference_switch
export PROJECTS=${SUME_FOLDER}/projects
export CONTRIB_PROJECTS=${SUME_FOLDER}/contrib-projects
export IP_FOLDER=${SUME_FOLDER}/lib/hw/std/cores
export CONSTRAINTS=${SUME_FOLDER}/lib/hw/std/constraints
export XILINX_IP_FOLDER=${SUME_FOLDER}/lib/hw/xilinx/cores
export NF_DESIGN_DIR=${SUME_FOLDER}/projects/${NF_PROJECT_NAME}
export NF_WORK_DIR=/tmp/${USER}
export PYTHONPATH=.:${SUME_FOLDER}/tools/scripts/:${NF_DESIGN_DIR}/lib/Python:${SUME_FOLDER}/tools/scripts/NFTest
export DRIVER_NAME=sume_riffa_v1_0_0
export DRIVER_FOLDER=${SUME_FOLDER}/lib/sw/std/driver/${DRIVER_NAME}
export APPS_FOLDER=${SUME_FOLDER}/lib/sw/std/apps/${DRIVER_NAME}

export vivado=/opt/Xilinx/Vivado/2015.2/bin/vivado
export xsdk=/opt/Xilinx/SDK/2015.2/bin/xsdk
export xvhdl=/opt/Xilinx/Vivado/2015.2/bin/xvhdl
export xelab=/opt/Xilinx/Vivado/2015.2/bin/xelab
export xsim=/opt/Xilinx/Vivado/2015.2/bin/xsim
export xvlog=/opt/Xilinx/Vivado/2015.2/bin/xvlog
