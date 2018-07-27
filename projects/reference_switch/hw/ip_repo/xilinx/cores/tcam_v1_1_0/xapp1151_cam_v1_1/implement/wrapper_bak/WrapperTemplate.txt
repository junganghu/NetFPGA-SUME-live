-------------------------------------------------------------------------------
--  Module      : cam_wrapper.vhd
--  Version     : 1.1
--  Last Update : 01 March 2011
--  Project     : CAM
--
--  Description : CAM top-level wrapper file
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


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

LIBRARY cam;

ENTITY cam_wrapper IS
  PORT (
    
    CLK             : IN  STD_LOGIC := '0';
    DIN             : IN  STD_LOGIC_VECTOR(7 DOWNTO 0)  := (OTHERS => '0');

    BUSY            : OUT STD_LOGIC := '0';
    MATCH           : OUT STD_LOGIC := '0';
    MATCH_ADDR      : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)  := (OTHERS => '0')

    DATA_MASK       : IN  STD_LOGIC_VECTOR(7 DOWNTO 0)  := (OTHERS => '0')
    WE              : IN  STD_LOGIC := '0'
    WR_ADDR         : IN  STD_LOGIC_VECTOR(3 DOWNTO 0)  := (OTHERS => '0')
    CMP_DIN         : IN  STD_LOGIC_VECTOR(7 DOWNTO 0)  := (OTHERS => '0')
    CMP_DATA_MASK   : IN  STD_LOGIC_VECTOR(7 DOWNTO 0)  := (OTHERS => '0')
    EN              : IN  STD_LOGIC := '0'

    MULTIPLE_MATCH  : OUT STD_LOGIC := '0'
    SINGLE_MATCH    : OUT STD_LOGIC := '0'
    READ_WARNING    : OUT STD_LOGIC := '0'
    
    );

-------------------------------------------------------------------------------
-- Port Definitions:
-------------------------------------------------------------------------------
  -- Mandatory Input Pins
  -- --------------------
  -- CLK       : Clock
  -- DIN [n:0] : Data to be written to CAM during write operation. Also, the  
  --             data to look-up from the CAM during read operation when 
  --             simultaneous read/write feature is not selected.
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
  --                       in ternary mode if simultaneous read/write feature
  --                       is selected
  -----------------------------------------------------------------------------
  -- Mandatory Output Pins
  -- ---------------------
  -- BUSY             : Busy pin-indicates that write operation is currently 
  --                    executed
  -- MATCH            : Match pin-indicates at least one location in the CAM 
  --                    contains the same data as DIN (or CMP_DIN if 
  --                    simultaneous read/write feature is selected)
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

END cam_wrapper;


ARCHITECTURE xilinx OF cam_wrapper IS

  CONSTANT LOW    : STD_LOGIC := '0';
  CONSTANT HIGH   : STD_LOGIC := '1';

BEGIN

 top_cam :  ENTITY  cam.cam_top
   
  GENERIC MAP (
    
    C_ADDR_TYPE             => 0,
    C_DEPTH                 => 16,
    C_FAMILY                => "virtex6",
    C_HAS_CMP_DIN           => 1,
    C_HAS_EN                => 1,
    C_HAS_MULTIPLE_MATCH    => 1, 
    C_HAS_READ_WARNING      => 1,
    C_HAS_SINGLE_MATCH      => 1,
    C_HAS_WE                => 1,
    C_MATCH_RESOLUTION_TYPE => 0,
    C_MEM_INIT              => 1,
    C_MEM_TYPE              => 0,
    C_REG_OUTPUTS           => 0,
    C_TERNARY_MODE          => 1,
    C_WIDTH                 => 8

    )

-------------------------------------------------------------------------------
-- Generic Definitions:
-------------------------------------------------------------------------------
  -- C_FAMILY                : Architecture
  -- C_ADDR_TYPE             : Determines if the MATCH_ADDR port is encoded 
  --                           or decoded. 
  --                           0 = Binary Encoded
  --                           1 = Single Match Unencoded (one-hot)
  --                           2 = Multi-match Unencoded (shows all matches)
  -- C_DEPTH                 : Depth of the CAM (Must be > 15)
  -- C_HAS_CMP_DIN           : 1 if CMP_DIN input port present
  --                           (for simultaneous read/write in 1 clk cycle)
  -- C_HAS_EN                : 1 if EN input port present
  -- C_HAS_MULTIPLE_MATCH    : 1 if MULTIPLE_MATCH output port present
  -- C_HAS_READ_WARNING      : 1 if READ_WARNING output port present
  -- C_HAS_SINGLE_MATCH      : 1 if SINGLE_MATCH output port present
  -- C_HAS_WE                : 1 if WE input port present
  -- C_MATCH_RESOLUTION_TYPE : When C_ADDR_TYPE = 0 or 1, only one match can
  --                           be output.
  --                           0 = Output lowest matching address
  --                           1 = Output highest matching address
  -- C_MEM_INIT              : Determines if the CAM needs to be initialized 
  --                           from a file
  --                           0 = Do not initialize CAM
  --                           1 = Initialize CAM 
  -- C_MEM_TYPE              : Determines the type of memory that the CAM is 
  --                           built using
  --                           0 = SRL16E implementation
  --                           1 = Block Memory implementation
  -- C_REG_OUTPUTS           : For use with Block Memory ONLY.
  --                           0 = Do not add extra output registers.
  --                           1 = Add output registers
  -- C_TERNARY_MODE          : Determines whether the CAM is in ternary mode.
  --                           0 = Non-ternary (Binary) CAM
  --                           1 = Ternary CAM (can store X's)
  --                           2 = Enhanced Ternary CAM (can store X's and U's)
  -- C_WIDTH                 : Determines the width of the CAM.
-------------------------------------------------------------------------------    

  PORT MAP (

    CLK                     => CLK,
    DIN                     => DIN,

    BUSY                    => BUSY,
    MATCH                   => MATCH,
    MATCH_ADDR              => MATCH_ADDR,

    DATA_MASK               => DATA_MASK,
    WE                      => WE,
    WR_ADDR                 => WR_ADDR,
    CMP_DIN                 => CMP_DIN,
    CMP_DATA_MASK           => CMP_DATA_MASK,   
    EN                      => EN,

    MULTIPLE_MATCH          => MULTIPLE_MATCH,
    SINGLE_MATCH            => SINGLE_MATCH,
    READ_WARNING            => READ_WARNING

    );


END xilinx;


