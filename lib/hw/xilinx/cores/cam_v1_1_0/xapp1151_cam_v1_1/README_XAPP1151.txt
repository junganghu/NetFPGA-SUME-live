*******************************************************************************
** © Copyright 2011 Xilinx, Inc. All rights reserved.
** This file contains confidential and proprietary information of Xilinx, Inc. and 
** is protected under U.S. and international copyright and other intellectual property laws.
*******************************************************************************
**   ____  ____ 
**  /   /\/   / 
** /___/  \  /   Vendor: Xilinx 
** \   \   \/    
**  \   \        readme_xapp1151.txt Version: 1.1  
**  /   /        Date Last Modified: 01 March 2011 
** /___/   /\    Date Created: 01 March 2011
** \   \  /  \   Associated Filename: xapp1151_cam_v1_1.zip
**  \___\/\___\ 
** 
**  Device: Spartan-3, Spartan-3E, Spartan-3 Automotive, 
**          Spartan-3E Automotive, Spartan-3A, Spartan-3A DSP, 
**          Spartan-6, Virtex-4, Virtex-5, Virtex-6/6L
**
**  Purpose:  CAM Reference Design
**
**  Reference: XAPP1151 - Xilinx Content Addressable Memory (xapp1151.pdf)
**
**  Revision History:
**
**  03/01/2011  Xilinx, Inc.  1.1          Initial release based on CAM v6.1 
**                                         LogiCORE IP core
**
*******************************************************************************
**
**  Disclaimer: 
**
**  This disclaimer is not a license and does not grant any rights to the materials 
**  distributed herewith. Except as otherwise provided in a valid license issued to you 
**  by Xilinx, and to the maximum extent permitted by applicable law: 
**  (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, 
**  AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, 
**  INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-INFRINGEMENT, OR 
**  FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether in contract 
**  or tort, including negligence, or under any other theory of liability) for any loss or damage 
**  of any kind or nature related to, arising under or in connection with these materials, 
**  including for any direct, or any indirect, special, incidental, or consequential loss 
**  or damage (including loss of data, profits, goodwill, or any type of loss or damage suffered 
**  as a result of any action brought by a third party) even if such damage or loss was 
**  reasonably foreseeable or Xilinx had been advised of the possibility of the same.
**
**
**  Critical Applications:
**
**  Xilinx products are not designed or intended to be fail-safe, or for use in any application 
**  requiring fail-safe performance, such as life-support or safety devices or systems, 
**  Class III medical devices, nuclear facilities, applications related to the deployment of airbags,
**  or any other applications that could lead to death, personal injury, or severe property or 
**  environmental damage (individually and collectively, "Critical Applications"). Customer assumes 
**  the sole risk and liability of any use of Xilinx products in Critical Applications, subject only 
**  to applicable laws and regulations governing limitations on product liability.
**
**  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.
**
*******************************************************************************

This document contains the following sections: 

1. Introduction
2. New Features
3. Instructions
 3.1. Summary of Tool Support
  3.1.1. Installation of the Design and Tools
 3.2. File List and Hierarchy
  3.2.1. File Information
 3.3. Parameterizing the RTL 
  3.3.1. Automatic Configuration
  3.3.2. Manual Configuration
 3.4. Netlist Generation
  3.4.1. XST Script
 3.5. Implementation Script
 3.6. Creating a MIF File
 3.7. Importing Design Files into ISE
4. Resolved Issues (originally in the CAM LogiCORE IP core)
5. Known Issues 
6. Technical Support
 
================================================================================

1. INTRODUCTION

This package contains the source code for the CAM Reference Design.
The Application Note that accompanies this design is XAPP1151.  This 
application note describes the implementation of a Content Addressable Memory, 
which matches the content of the memory to a data input and provides the matching 
address for that data as the output.  The Reference Design is based on the ISE 
Core Generator CAM v6.1  LogiCORE IP netlist core.  Supported device families for 
this reference design are: Spartan-3, Spartan-3E, Spartan-3 Automotive, 
Spartan-3E Automotive, Spartan-3A, Spartan-3A DSP, Spartan-6, Virtex-4, Virtex-5, 
and Virtex-6/6L. Support for later architectures may require modification to the
source code, as indicated in Section 3.2 below and in the HDL files themselves.

For further information please refer to XAPP1151 at 
http://www.xilinx.com/support/documentation/application_notes/xapp1151.pdf

This README describes the necessary steps for configuring the design parameters,
and running XST, Ngdbuild, Map, and PAR on the CAM Reference Design. 

2. NEW FEATURES  
 
   - Virtex-6 support
   - Spartan-6 support

3. INSTRUCTIONS


3.1. SUMMARY OF TOOL SUPPORT

   - Xilinx ISE 13.1 (including XST 13.1 and xilperl)
   - Mentor Graphics ModelSim 6.6d


3.1.1. INSTALLATION OF THE DESIGN AND TOOLS

   - Install Xilinx ISE 13.1
     - The provided Reference Design Perl scripts must be invoked using a Perl 
       program such as xilperl, which is distributed with Xilinx ISE software. 
       In the Windows environment, the scripts are intended to be executed 
       within a Windows command window (DOS shell).

   - Extract zip file (xapp1151_cam_v1_1.zip) into a directory 


3.2. FILE LIST AND HIERARCHY

Note: Only VHDL source is available in this release.

/xapp1151_cam_v1_1
    |
    +--> README_XAPP1151.txt (this file)
    +--> /src
    |      |
    |      +--> init.mif
    |      +--> /vhdl 
    |            |
    |            | (in compilation order)
    |            +--> cam_pkg.vhd
    |            +--> cam_input_ternary_ternenc.vhd
    |            +--> cam_input_ternary.vhd 
    |            +--> cam_input.vhd
    |            +--> cam_control.vhd
    |            +--> cam_decoder.vhd
    |            +--> cam_match_enc.vhd
    |            +--> cam_init_file_pack_xst.vhd
    |            +--> cam_regouts.vhd
    |            +--> cam_mem_srl16_ternwrcomp.vhd
    |            +--> cam_mem_srl16_wrcomp.vhd
    |            +--> cam_mem_srl16_block_word.vhd
    |            +--> cam_mem_srl16_block.vhd
    |            +--> cam_mem_srl16.vhd
    |            +--> cam_mem_blk_extdepth_prim.vhd
    |            +--> cam_mem_blk_extdepth.vhd
    |            +--> dmem.vhd
    |            +--> cam_mem_blk.vhd
    |            +--> cam_mem.vhd
    |            +--> cam_rtl.vhd
    |            +--> cam_top.vhd
    |
    +--> /implement
           |
           +--> CustomizeWrapper.pl
           +--> cam_wrapper.vhd
           +--> /wrapper_bak
           |     |
           |     +--> WrapperTemplate.txt
           |     
           +--> RunXST.pl
           +--> vhdl_xst.scr
           +--> vhdl_xst.prj
           +--> Implement.pl
           +--> /results



3.2.1. FILE INFORMATION

  - README_XAPP1151.txt              : Describes the Reference Design files and script 
    (this file)                        files, and includes instructions to execute the
                                       provided scripts

  - /src directory                   : Contains the CAM source files, 
                                       including the VHDL RTL and init.mif file 

  - init.mif                         : Text file containing a CAM-width x CAM-depth table 
                                       for initializing the CAM, if applicable

  - /vhdl directory                  : Contains the CAM RTL files

  - cam_pkg.vhd                      : VHDL RTL - Package file containing commonly used
                                       constants and functions  **

  - cam_input_ternary_ternenc.vhd    : VHDL RTL - Encodes DIN and DATA_MASK input buses
                                       as ternary encoded outputs for storage in memory

  - cam_input_ternary.vhd            : VHDL RTL - Pads the DIN and DATA_MASK inputs and
                                       instantiates the ternary encoder

  - cam_input.vhd                    : VHDL RTL - Registers data input buses and 
                                       instantiates ternary encoders for both read and
                                       write ports as necessary

  - cam_control.vhd                  : VHDL RTL - Generates control signals for the CAM,
                                       including internal write enable and write counter,
                                       and user BUSY and READ_WARNING signals **

  - cam_decoder.vhd                  : VHDL RTL - For SRL16 CAM, selects which 256-word
                                       block to write to

  - cam_match_enc.vhd                : VHDL RTL - Address match logic

  - cam_init_file_pack_xst.vhd       : VHDL RTL - Procedures for  Memory Initialization
                                       File reading and writing

  - cam_regouts.vhd                  : VHDL RTL - Registers CAM outputs

  - cam_mem_srl16_ternwrcomp.vhd     : VHDL RTL - For SRL16 CAM, Write comparator for 
                                       Ternary Mode

  - cam_mem_srl16_wrcomp.vhd         : VHDL RTL - For SRL16 CAM, Write comparator for 
                                       Standard (non-ternary) Mode

  - cam_mem_srl16_block_word.vhd     : VHDL RTL - For SRL16 CAM, instantiates and
                                       cascades SRL16E primitives for c_width x 1 word 
                                       of the CAM **

  - cam_mem_srl16_block.vhd          : VHDL RTL - For SRL16 CAM, cascades multiple
                                       c_width x 1 word deep blocks into blocks of up to 
                                       256 words deep

  - cam_mem_srl16.vhd                : VHDL RTL - For SRL16 CAM, cascades c_width x 256-word 
                                       deep blocks up to the final depth of the CAM, plus
                                       comparators and block decoder


  - cam_mem_blk_extdepth_prim.vhd    : VHDL RTL - For BRAM CAM, instantiates individual
                                       BlockRAM primitives depending on FPGA architecture **

  - cam_mem_blk_extdepth.vhd         : VHDL RTL - For BRAM CAM, cascades multiple BlockRAMs
                                       into columns for final CAM depth

  - cam_mem_blk.vhd                  : VHDL RTL - For BRAM CAM, cascades multiple BlockRAM
                                       columns into rows for final CAM width  **

  - cam_mem.vhd                      : VHDL RTL - Instantiates either BRAM or SRL16 memory
                                       based on code customization

  - dmem.vhd                         : VHDL RTL - For BRAM CAM, infers Distributed
                                       Memory for the Erase RAM

  - cam_rtl.vhd                      : VHDL RTL - Top level synthesizable core file, 
                                       instantiates all other sub-modules and uses expanded
                                       set of generics

  - cam_top.vhd                      : VHDL RTL - Core wrapper file. Translates the 15
                                       simplified generics in the top-level wrapper file
                                       (cam_wrapper.vhd) to the full set of 27 generics
                                       in the top-level core file (cam_rtl.vhd)

  - /implement directory             : contains the CAM top-level core wrapper file, 
                                       scripts, and supplemental files/directories for 
                                       implementing the CAM

  - CustomizeWrapper.pl              : interactive Perl script used to customize the
                                       top-level core wrapper file, cam_wrapper.vhd

  - cam_wrapper.vhd                  : customizable VHDL top-level core wrapper file 
                                       with a simplified set of 15 generics

  - /wrapper_bak directory           : contains a back-up copy of the last generated 
                                       top-level core wrapper file, cam_wrapper_bak.vhd

  - WrapperTemplate.txt              : template for customizable VHDL top-level core  
                                       wrapper file, cam_wrapper.vhd, used by script

  - RunXST.pl                        : Perl script that synthesizes the wrapper and
                                       source files using XST
  
  - vhdl_xst.scr                     : XST script file.  Contains the XST options
                                       for synthesis, including the target part.

  - vhdl_xst.prj                     : XST project file.  Contains the relative paths
                                       to the wrappers and source files to be 
                                       synthesized.

  - Implement.pl                     : Perl script that runs NGDbuild, Map, and PAR
                                       on the synthesized netlist

  - /results directory               : contains all output products of XST, Ngdbuild,
                                       Map, and PAR


  ** HDL source file contains architecture-specific component instantiations and/or
     coding and may require modification to support later (newer) architectures.


3.3. PARAMETERIZING THE RTL 

Before generating a netlist, the user should set the desired parameters in
the top-level core wrapper file: cam_wrapper.vhd.  These generics may be set 
automatically using the provided Perl script or manually by editing the source 
files directly.  

3.3.1. AUTOMATIC CONFIGURATION

To simplify the process of assigning the generics, a Perl script has been 
provided for the user's convenience.  This Perl script will guide the user 
through a sequence of questions regarding the desired CAM configuration. 
This configuration will be applied to the wrapper template file 
to generate the top-level core wrapper file. Any unused optional ports will be
selectively removed or tied off.  The previous top-level core wrapper file 
will be backed up to the /implement/wrapper_bak directory for later retrieval, 
if desired, as cam_wrapper_bak.vhd.

From within the /implement directory, execute the Perl script 
CustomizeWrapper.pl at the Windows command prompt or Linux command line:

  > xilperl CustomizeWrapper.pl

The output top-level core wrapper file will replace the existing wrapper
within the /implement directory.

Refer to XAPP1151 for detailed descriptions of the available generics.  


3.3.2. MANUAL CONFIGURATION

All optional ports are present in the default top-level core wrapper file.  The 
generics in this file may be modified manually to suit the desired configuration.  

Additionally, the user may manually customize a top-level core wrapper file 
that has been generated by the CustomizeWrapper.pl script.  However, be aware 
that if any optional ports were disabled in this wrapper file, the ports will 
have been stripped from the port list by the script.  

The provided wrapper files and customization script operate on a reduced
set of 15 generics. A user may access the full set of 27 generics
and manually configure the CAM  by editing the top-level core file, 
cam_rtl.vhd, and removing the two wrapper files (cam_wrapper.vhd and cam_top.vhd) 
from the list of source files to be implemented.  

Note that any conflicting or invalid generic configurations will be flagged 
as Errors in XST during the "HDL Elaboration" stage and may cause the 
resulting design to not function correctly.


3.4. NETLIST GENERATION

The CAM may be synthesized with the Xilinx Synthesis Tool (XST) 
through ISE or the provided command-line script and project files.

The Synthesis script, RunXST.pl, contains specific options for use with the CAM 
source. If these options are not compatible with unrelated source files in the
rest of the design, the CAM must be synthesized separately and brought into the
larger design as a netlist (e.g. NGC file).

If generating a separate netlist for CAM in this manner, users should disable I/O
buffer insertion and BUFG insertion options in XST.

3.4.1. XST SCRIPT 

To generate a netlist via XST synthesis, from within the /implement directory,
execute the RunXST.pl script at the Windows command prompt or Linux command line.

  > xilperl RunXST.pl

The output files are generated in the /implement/results directory.
The output netlist is cam.ngc
The XST log file is cam.srp

The script is set up by default to target a Virtex-6 device (XC6VLX240T-FF1156-1).
To target a different device, the "-p" command-line option in the vhdl_xst.scr file 
must be modified to reflect the desired part.

Note:  Some of the XST Synthesis options found in vhdl_xst.scr are REQUIRED
for proper core operation.  Other options may be changed but any changes should
be verified by the user.  The required options are:

-bus_delimiter ()
-loop_iteration_limit 5000
-user_new_parser yes


3.5. IMPLEMENTATION SCRIPT 

The CAM may be implemented in ISE or by the provided command-line 
script. To run Ngdbuild, Map, and PAR on the synthesized netlist, from within 
the /implement directory, execute the Implement.pl script at the Windows command 
prompt or Linux command line.

  > xilperl Implement.pl

The output files are generated in the /implement/results directory.

The script is set up by default to target a Virtex-6 device (XC6VLX240T-FF1156-1).
To change the target part, modify the ngdbuild "-p" command-line option in this file.

3.6. CREATING A MIF FILE

The CAM reference design provides the option of initializing the memory
contents during synthesis of the core in XST. For a Read-only CAM, a MIF
file is required during synthesis of the core.

The MIF file is a plain-text ASCII file written in binary with each line corresponding
to an address in the CAM.  Because of this, the MIF file must have a number of lines 
equal to the depth of the CAM being used, and each line must have a number of binary 
digits equal to the data width (DIN) of the CAM.  The "init.mif" file provided with 
the CAM reference design shows an initialization file for a 8 wide x 16 deep CAM. 

Each line of the MIF file specifies the match data for that address.  For example, 
if line 3 (where the file starts at line 0) contained the value "00010100" the CAM
will signal a MATCH with MATCH_ADDR = 3 when the DIN port has the value "00010100".

Additionally, for standard ternary CAMs, the MIF file can also specify "don't care" bit
entries as "X"s.  For example, if line 0 of the MIF file contains the value 
"000X0100" the CAM will signal a MATCH with MATCH_ADDR = 0 when the DIN port has 
either the value "00010100" or "00000100".


3.7. IMPORTING DESIGN FILES INTO ISE

   - Start up the Xilinx ISE 13.1 Project Navigator application.

   - From the "File" menu, create a new project ("New Project") or browse to an 
     existing project ("Open Project").  You will be importing the CAM design files
     into this project.

   - If creating a new project, the New Project Wizard will guide you through
     the process of creating a project.   

     - In the Create New Project pop-up window, specify the Project Name and
       Project Location.  The top-level source type is HDL.  Click "Next".
     - Select the Device Properties.  Click "Next".
     - In the Create New Source window, click "Next".
     - In the Add Existing Sources window, 
       - Click "Add Source".  
       - Browse to the implement directory within the extracted 
         xapp1151_cam_v1_1 folder (/xapp1151_cam_v1_1/implement/). 
       - Select the configured top-level core wrapper file, 
         cam_wrapper.vhd.  This will be the top-level design file.
       - Click "Open".
       - Click "Add Source".  
       - Browse to the HDL source directory within the extracted 
         xapp1151_cam_v1_1 folder (/xapp1151_cam_v1_1/src/vhdl/). 
       - Select all of the VHDL design files.
       - Click "Open".  
       - Click "Next".  
       - Click "Finish".  
     These steps will import the selected CAM files into your project.

   - If using a MIF file to initialize the CAM contents, the file should be
     named "init.mif" and must be located in the same directory as the ".ise"
     project file resides.

   For more information on running ISE 13.1, please refer to the online
   documentation at http://www.xilinx.com/support/documentation/index.htm and
   browse for the documentation applicable to your version of ISE,
   or to the local documentation included with your Xilinx ISE 13.1 software
   installation:
 
   Windows PC:
   Start Menu -> Programs -> Xilinx ISE Design Suite 13.1 -> ISE -> Documentation

4. RESOLVED ISSUES (ORIGINALLY IN THE CAM LOGICORE IP CORE) 

   - XST runs out of memory when a large CAM is generated in Coregen.
     When a large CAM of width more than around 250 and depth more than around
     3000, XST runs for a long time, runs out of memory, and finally hangs with 
     the following error message: "Xilinx Application ran out of memory"

      - This issue is fixed in the reference design via the "use_new_parser" 
        switch found in vhdl_xst.scr.  For architectures before Virtex-6 and
        Spartan-6, this option may not be compatible with other parts of the 
        design.  If so, the CAM must be synthesized separately and brought into 
        the larger design as a netlist (e.g. NGC file).

      - CR 471627
      - AR 31388

   - XST takes a long time to synthesize depths greater than 500 words.

     - CR 544306, 303519

5. KNOWN ISSUES 
   
    - None

   The most recent information, including known issues, workarounds, and 
   resolutions for this version is provided in the Answer Record (AR 37298)
   located at:

   http://www.xilinx.com/support/answers/37298.htm


6. TECHNICAL SUPPORT 

   To obtain technical support, create a WebCase at www.xilinx.com/support.
   Questions are routed to a team with expertise using this product.  
     
   Xilinx provides technical support for use of this product when used
   according to the guidelines described in the core documentation, and
   cannot guarantee timing, functionality, or support of this product for
   designs that do not follow specified guidelines.

