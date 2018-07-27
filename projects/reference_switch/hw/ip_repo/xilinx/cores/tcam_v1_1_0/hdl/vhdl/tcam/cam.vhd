--  Module      : cam.vhd
--  
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : Top-level CAM core file
--
--  Company     : Xilinx, Inc.
--
--  (c) Copyright 2001-2011 Xilinx, Inc. All rights reserved.
--
--  This file contains confidential and proprietary information
--  of Xilinx, Inc. and is protected under U.S. and
--  international copyright and other intellectual property
--  laws.
--
--  DISCLAIMER
--  This disclaimer is not a license and does not grant any
--  rights to the materials distributed herewith. Except as
--  otherwise provided in a valid license issued to you by
--  Xilinx, and to the maximum extent permitted by applicable
--  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
--  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
--  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
--  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
--  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
--  (2) Xilinx shall not be liable (whether in contract or tort,
--  including negligence, or under any other theory of
--  liability) for any loss or damage of any kind or nature
--  related to, arising under or in connection with these
--  materials, including for any direct, or any indirect,
--  special, incidental, or consequential loss or damage
--  (including loss of data, profits, goodwill, or any type of
--  loss or damage suffered as a result of any action brought
--  by a third party) even if such damage or loss was
--  reasonably foreseeable or Xilinx had been advised of the
--  possibility of the same.
--
--  CRITICAL APPLICATIONS
--  Xilinx products are not designed or intended to be fail-
--  safe, or for use in any application requiring fail-safe
--  performance, such as life-support or safety devices or
--  systems, Class III medical devices, nuclear facilities,
--  applications related to the deployment of airbags, or any
--  other applications that could lead to death, personal
--  injury, or severe property or environmental damage
--  (individually and collectively, "Critical
--  Applications"). Customer assumes the sole risk and
--  liability of any use of Xilinx products in Critical
--  Applications, subject only to applicable laws and
--  regulations governing limitations on product liability.
--
--  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
--  PART OF THIS FILE AT ALL TIMES. 
--
-------------------------------------------------------------------------------
-- Structure: 
--
--  >> cam.vhd <<
--      |
--      +- cam_rtl.vhd //Top-level synthesizable core file
--
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Library Declarations
-------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;


LIBRARY xil_defaultlib;
USE xil_defaultlib.cam_pkg.ALL;

ENTITY cam IS
  GENERIC (
    
    c_addr_type                :  INTEGER        := 0;
    c_depth                    :  INTEGER        := 0;
    c_family                   :  STRING         := "";
    c_has_cmp_din              :  INTEGER        := 0;
    c_has_en                   :  INTEGER        := 0;
    c_has_multiple_match       :  INTEGER        := 0;
    c_has_read_warning         :  INTEGER        := 0;
    c_has_single_match         :  INTEGER        := 0;
    c_has_we                   :  INTEGER        := 0;
    c_match_resolution_type    :  INTEGER        := 0;
    c_mem_init                 :  INTEGER        := 0;
    c_mem_type                 :  INTEGER        := 0;
    c_reg_outputs              :  INTEGER        := 0;
    c_ternary_mode             :  INTEGER        := 0;
    c_width                    :  INTEGER        := 0

 
    );
  
  PORT (
    CLK             : IN  STD_LOGIC := '0';
    CMP_DATA_MASK   : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0)
                          := (OTHERS => '0');
    CMP_DIN         : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0)
                          := (OTHERS => '0');
    DATA_MASK       : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0)
                          := (OTHERS => '0');
    DIN             : IN  STD_LOGIC_VECTOR(c_width-1 DOWNTO 0)
                          := (OTHERS => '0');
    EN              : IN  STD_LOGIC := '0';
    WE              : IN  STD_LOGIC := '0';
    WR_ADDR         : IN  STD_LOGIC_VECTOR( addr_width_for_depth(c_depth)-1 DOWNTO 0)
                          := (OTHERS => '0');
    BUSY            : OUT STD_LOGIC := '0';
    MATCH           : OUT STD_LOGIC := '0';
    MATCH_ADDR      : OUT STD_LOGIC_VECTOR( calc_match_addr_width_rev(c_depth,c_addr_type)-1 DOWNTO 0)
                          := (OTHERS => '0');
    MULTIPLE_MATCH  : OUT STD_LOGIC := '0';
    READ_WARNING    : OUT STD_LOGIC := '0';
    SINGLE_MATCH    : OUT STD_LOGIC := '0'
    );


END cam;

-------------------------------------------------------------------------------
-- Generic Definitions:
-------------------------------------------------------------------------------
  -- C_FAMILY                : Architecture
  -- C_ADDR_TYPE             : Determines if the MATCH_ADDR port is encoded 
  --                           or decoded. 
  --                           0 = Binary Encoded
  --                           1 = Single Match Unencoded (one-hot)
  --                           2 = Multi-match unencoded (shows all matches)
  -- C_CMP_DATA_MASK_WIDTH   : Width of the CMP_DATA_MASK port
  --                           (same as c_width)
  -- C_CMP_DIN_WIDTH         : Width of the CMP_DIN port
  --                           (same as c_width)
  -- C_DATA_MASK_WIDTH       : Width of the DATA_MASK port
  --                           (same as c_width)
  -- C_DEPTH                 : Depth of the CAM (Must be > 2)
  -- C_DIN_WIDTH             : Width of the DIN port
  --                           (same as c_width)
  -- C_HAS_CMP_DATA_MASK     : 1 if CMP_DATA_MASk input port present
  -- C_HAS_CMP_DIN           : 1 if CMP_DIN input port present
  --                           (for simultaneous read/write in 1 clk cycle)
  -- C_HAS_DATA_MASK         : 1 if DATA_MASK input port present 
  --                           (for ternary mode)
  -- C_HAS_EN                : 1 if EN input port present
  -- C_HAS_MULTIPLE_MATCH    : 1 if MULTIPLE_MATCH output port present
  -- C_HAS_READ_WARNING      : 1 if READ_WARNING output port present
  -- C_HAS_SINGLE_MATCH      : 1 if SINGLE_MATCH output port present
  -- C_HAS_WE                : 1 if WE input port present
  -- C_HAS_WR_ADDR           : 1 if wr_addr input port present
  -- C_MATCH_ADDR_WIDTH      : Determines the width of the MATCH_ADDR port
  --                           log2roundup(C_DEPTH) if C_ADDR_TYPE = 0
  --                           C_DEPTH              if C_ADDR_TYPE = 1 or 2
  -- C_MATCH_RESOLUTION_TYPE : When C_ADDR_TYPE = 0 or 1, only one match can
  --                           be output.
  --                           0 = Output lowest matching address
  --                           1 = Output highest matching address
  -- C_MEM_INIT              : Determines if the CAM needs to be initialized 
  --                           from a file
  --                           0 = Do not initialize CAM
  --                           1 = Initialize CAM
  -- C_MEM_INIT_FILE         : Filename of the .mif file for initializing CAM
  -- C_ELABORATION_DIR       : Directory location of the mif file  
  -- C_MEM_TYPE              : Determines the type of memory that the CAM is 
  --                           built using
  --                           0 = SRL16E implementation
  --                           1 = Block Memory implementation
  -- C_READ_CYCLES           : Read Latency of the CAM (always fixed as 1)
  -- C_REG_OUTPUTS           : For use with Block Memory ONLY.
  --                           0 = Do not add extra output registers.
  --                           1 = Add output registers
  -- C_TERNARY_MODE          : Determines whether the CAM is in ternary mode.
  --                           0 = Non-ternary (Binary) CAM
  --                           1 = Ternary CAM (can store X's)
  --                           2 = Enhanced Ternary (can store X's and U's)
  -- C_WIDTH                 : Determines the width of the CAM.
  -- C_WR_ADDR_WIDTH         : Width of WR_ADDR port = log2roundup(C_DEPTH)
    
-------------------------------------------------------------------------------
-- Port Definitions:
-------------------------------------------------------------------------------
  -- Mandatory Input Pins
  -- --------------------
  -- CLK       : Clock
  -- DIN [n:0] : Data to be written to CAM during write operation. Also, the  
  --             data to look-up from the CAM during read opeation when 
  --             simulataneous read/write feature is not selected.
  --
  -- Optional Input Pins
  -- --------------------
  -- EN                  : Control signal to enable write and read operations
  -- WE                  : Control signal to enable transfer of data from DIN
  --                       bus to the CAM 
  -- WR_ADDR [a:0]       : Write Address of the CAM
  -- CMP_DIN [n:0]       : Data to look up from the CAM when simultaneous 
  --                       read/write feature is selected.
  -- DATA_MASK [n:0]     : Interacts with DIN bus to create new bit values 
  --                       in ternary mode
  -- CMP_DATA_MASK [n:0] : Interacts with CMP_DIN bus to create new bit values 
  --                       in ternary mode if simulataneous read/write feature
  --                       is selected
  -----------------------------------------------------------------------------
  -- Mandatory Output Pins
  -- ---------------------
  -- BUSY             : Busy pin-indicates that write operation is currently 
  --                    executed
  -- MATCH            : Match pin-indicates atleast one location in the CAM 
  --                    contains the same data as DIN (or CMP_DIN if 
  --                    simulataneous read/write feature is selected)
  -- MATCH_ADDR [m:0] : CAM address where matching data resides
  --
  -- Optional Output Pins
  -- --------------------
  -- SINGLE_MATCH        : Indicates the existence of matching data in only one
  --                       location of the CAM
  -- MULTIPLE_MATCH      : Indicates the existence of matching data in more 
  --                       than one location of the CAM
  -- READ_WARNING        : Warning flag that indicates that the data applied to
  --                       the CAM for a read operation is same as the data 
  --                       currently being written to the CAM during an 
  --                       unfinished write operation
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- Architecture Heading
-------------------------------------------------------------------------------
ARCHITECTURE xilinx OF cam IS

COMPONENT cam_rtl
  GENERIC (
    c_addr_type             :     integer := 0;
    c_cmp_data_mask_width   :     integer := 18;
    c_cmp_din_width         :     integer := 18;
    c_data_mask_width       :     integer := 18;
    c_depth                 :     integer := 384;
    c_din_width             :     integer := 18;
    c_family                :     string  := "";
    c_has_cmp_data_mask     :     integer := 0;
    c_has_cmp_din           :     integer := 1;
    c_has_data_mask         :     integer := 0;
    c_has_en                :     integer := 0;
    c_has_multiple_match    :     integer := 1;
    c_has_read_warning      :     integer := 1;
    c_has_single_match      :     integer := 1;
    c_has_we                :     integer := 1;
    c_has_wr_addr           :     integer := 1;
    c_match_addr_width      :     integer := 9;
    c_match_resolution_type :     integer := 0;
    c_mem_init              :     integer := 0;
    c_mem_init_file         :     string  := "";
    c_elaboration_dir       :     STRING  := "./";
    c_mem_type              :     integer := 0;
    c_read_cycles           :     integer := 1;
    c_reg_outputs           :     integer := 0;
    c_ternary_mode          :     integer := 0;
    c_width                 :     integer := 18;
    c_wr_addr_width         :     integer := 9
    );
  PORT (
    CLK                     : IN  std_logic;
    CMP_DATA_MASK           : IN  std_logic_vector(c_width-1 DOWNTO 0);  
    CMP_DIN                 : IN  std_logic_vector(c_width-1 DOWNTO 0);  
    DATA_MASK               : IN  std_logic_vector(c_width-1 DOWNTO 0);
    DIN                     : IN  std_logic_vector(c_width-1 DOWNTO 0);
    EN                      : IN  std_logic;
    WE                      : IN  std_logic;
    WR_ADDR                 : IN  std_logic_vector(addr_width_for_depth(c_depth)-1 DOWNTO 0);
    BUSY                    : OUT std_logic;
    MATCH                   : OUT std_logic;
    MATCH_ADDR              : OUT std_logic_vector(calc_match_addr_width_rev(c_depth,c_addr_type)-1 DOWNTO 0);
    MULTIPLE_MATCH          : OUT std_logic;
    READ_WARNING            : OUT std_logic;
    SINGLE_MATCH            : OUT std_logic
 
    );

  END COMPONENT;
  
  
CONSTANT s_has_cmp_data_mask    : INTEGER   := calc_cmp_data_mask_rev(c_has_cmp_din, c_ternary_mode);
CONSTANT s_has_data_mask        : INTEGER   := calc_data_mask(c_ternary_mode);

BEGIN

 rtl_cam :  cam_rtl
  GENERIC MAP (
    c_addr_type             => c_addr_type,
    c_cmp_data_mask_width   => c_width,
    c_cmp_din_width         => c_width,
    c_data_mask_width       => c_width,
    c_depth                 => c_depth,
    c_din_width             => c_width,
    c_family                => c_family,
    c_has_cmp_data_mask     => s_has_cmp_data_mask,
    c_has_cmp_din           => c_has_cmp_din,
    c_has_data_mask         => s_has_data_mask,
    c_has_en                => c_has_en,
    c_has_multiple_match    => c_has_multiple_match, 
    c_has_read_warning      => c_has_read_warning,
    c_has_single_match      => c_has_single_match,
    c_has_we                => c_has_we,
    c_has_wr_addr           => c_has_we,
    c_match_addr_width      => calc_match_addr_width_rev(c_depth,c_addr_type),
    c_match_resolution_type => c_match_resolution_type,
    c_mem_init              => c_mem_init,
    c_mem_init_file         => "./init.mif",
    c_mem_type              => c_mem_type,
    c_elaboration_dir       => "./../../src/",
    c_read_cycles           => 1,
    c_reg_outputs           => c_reg_outputs,
    c_ternary_mode          => c_ternary_mode,
    c_width                 => c_width,
    c_wr_addr_width         => addr_width_for_depth(c_depth)
    )
  PORT MAP (
    CLK                     => CLK,
    CMP_DATA_MASK           => CMP_DATA_MASK,
    CMP_DIN                 => CMP_DIN,
    DATA_MASK               => DATA_MASK,
    DIN                     => DIN,
    EN                      => EN,
    WE                      => WE,
    WR_ADDR                 => WR_ADDR,
    BUSY                    => BUSY,
    MATCH                   => MATCH,
    MATCH_ADDR              => MATCH_ADDR,
    MULTIPLE_MATCH          => MULTIPLE_MATCH,
    READ_WARNING            => READ_WARNING,
    SINGLE_MATCH            => SINGLE_MATCH
    );


END xilinx;
