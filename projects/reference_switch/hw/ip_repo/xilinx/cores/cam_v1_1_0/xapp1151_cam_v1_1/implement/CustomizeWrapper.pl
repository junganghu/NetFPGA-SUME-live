#!xilperl

##-----------------------------------------------------------------------------
##
##  File Name   : CustomizeWrapper.pl
##
##  Version     : 1.1
##
##  Last Update : 01 March 2011
##
##  Project     : CAM Reference Design
##
##  Description : Perl script to configure the CAM parameters
##
##  Company     : Xilinx, Inc.
##
##   (c) Copyright 2001-2011 Xilinx, Inc. All rights reserved.
## 
##   This file contains confidential and proprietary information
##   of Xilinx, Inc. and is protected under U.S. and
##   international copyright and other intellectual property
##   laws.
## 
##   DISCLAIMER
##   This disclaimer is not a license and does not grant any
##   rights to the materials distributed herewith. Except as
##   otherwise provided in a valid license issued to you by
##   Xilinx, and to the maximum extent permitted by applicable
##   law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
##   WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
##   AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
##   BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
##   INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
##   (2) Xilinx shall not be liable (whether in contract or tort,
##   including negligence, or under any other theory of
##   liability) for any loss or damage of any kind or nature
##   related to, arising under or in connection with these
##   materials, including for any direct, or any indirect,
##   special, incidental, or consequential loss or damage
##   (including loss of data, profits, goodwill, or any type of
##   loss or damage suffered as a result of any action brought
##   by a third party) even if such damage or loss was
##   reasonably foreseeable or Xilinx had been advised of the
##   possibility of the same.
## 
##   CRITICAL APPLICATIONS
##   Xilinx products are not designed or intended to be fail-
##   safe, or for use in any application requiring fail-safe
##   performance, such as life-support or safety devices or
##   systems, Class III medical devices, nuclear facilities,
##   applications related to the deployment of airbags, or any
##   other applications that could lead to death, personal
##   injury, or severe property or environmental damage
##   (individually and collectively, "Critical
##   Applications"). Customer assumes the sole risk and
##   liability of any use of Xilinx products in Critical
##   Applications, subject only to applicable laws and
##   regulations governing limitations on product liability.
## 
##   THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
##   PART OF THIS FILE AT ALL TIMES.
##   
##-----------------------------------------------------------------------------
##
##  History
##
##  Date        Version   Description
##
##  03/01/2011  1.1       Initial release
##
##-----------------------------------------------------------------------------

use File::Path;
use File::Copy;
use Cwd;

$cwd = cwd;

## Move the previous top-level core wrapper file to the /wrapper_bak directory
$filename = "./cam_wrapper.vhd"; # wrapper file to be generated
$bakfilename = "./wrapper_bak/cam_wrapper_bak.vhd"; # back up wrapper
copy($filename, $bakfilename) or
    die("Error:  $filename file cannot be backed up to $bakfilename\n");

## Copy the wrapper template file to the destination wrapper file
## Create a temporary file from the wrapper and user input
## (At the end, overwrite the wrapper file with the temporary file generated)
$template = "./wrapper_bak/WrapperTemplate.txt"; # template file
copy($template, $filename) or
    die("Error:  $template file cannot be copied to $filename\n");
$mode = 0644;
chmod $mode, $filename;
open(FILE, '<', "$filename") or
    die("Error:  Cannot open file $filename\n");
open(FILETMP, '>', "$filename.tmp") or
    die("Error:  Cannot open temp file $filename.tmp\n");

## Query user to configure the CAM generics
print "\n\n***************************************************************\n";
print "CAM Reference Design Customizer v1.1 \n";
print "***************************************************************\n";

print "\n***************************************************************\n";
print "Please input the following parameters for the CAM: \n";
print "***************************************************************\n\n";

print "Enter the FPGA base architecture to target\n";
$arch = lc(query4("Valid options are virtex4, virtex5, virtex6, virtex6l, spartan3, spartan3e, spartan3a, spartan3adsp, aspartan3, aspartan3e, spartan6:\n"));

$width = query5( "\nInput the CAM data width.  Valid values are 1-512: \n");

$depth = query6( "\nInput the CAM depth.  Valid values are 16-4096: \n");

$mem_type = query1("\nEnter the CAM memory type to implement\n(Choose SRL-based if you need a Ternary or Enhanced Ternary mode CAM)\n0 = SRL-based, 1 = BRAM-based: ");

if ($mem_type eq '0') {
	print "\nChoose the Ternary Mode setting. \n";
    $ternary_mode = query3("0 = Ternary Mode Off, 1 = Standard Ternary Mode, 2 = Enhanced Ternary Mode: ");
    }
else {
	print "\nNOTE: BRAM-based CAMs do not support Ternary Modes.\n";
	print "Setting C_TERNARY_MODE = 0 ...\n";
	$ternary_mode = '0';
    }
    
if ($ternary_mode eq '2') {
	print "\nNOTE: Enhanced Ternary Mode does not support MIF file memory initialization, thus a Write Enable is required.\n";
	print "Setting C_MEM_INIT = 0 ...\n";
	print "Setting C_HAS_WE = 1 ...\n";
	$has_we = "y";
    }
else {
	$has_we = query2("\nWill the CAM be write-able (WE pin)? (If no, CAM will be read-only) (y/n): ");
}


if ($has_we eq "n") {
	print "\nNOTE:  Read-only CAMs require an initialization MIF file\n";
        print "\nNOTE:  Example MIF file must be modified for exact width and depth of CAM\n";
        print "Setting C_MEM_INIT = 1 ...\n";
    $mem_init = "y";
	}
elsif ($ternary_mode eq '2') {
     $mem_init = "n";
     }
else {
	 $mem_init = query2("\nUse a MIF file to initialize the memory contents? (y/n): ");
         print "\nNOTE:  Example MIF file must be modified for exact width and depth of CAM\n";
     }
     
   
print "\nChoose what type of encoding the MATCH_ADDR port will have. \n";
$match_encode = query3("0 = Binary Encoded, 1 = Single Match Unencoded (one-hot), 2 = Multi-match Unencoded: ");

if ($match_encode eq '2') {
    $match_resolution = '0';
     }
else {
    print "\nFor Binary Encoded or Single Match Unencoded MATCH_ADDR, output lowest address match or highest address match?\n";
    $match_resolution = query1("0 = Lowest, 1 = Highest:");
    }


print "\nPlease select the optional features to be implemented: \n";
$has_cmp_din = query2("Simultaneous Read/Write (y/n): ");

if ($mem_type eq "1") {
	$reg_outputs = query2("Register Outputs (y/n): ");
	}
else {
	$reg_outputs = "n";
     }
     
print "\nPlease select from the following optional input ports: \n";
$has_en = query2("Enable (EN) (y/n): ");

print "\nPlease select from the following optional output ports: \n";
$has_multiple_match = query2("Multiple Match Flag (MULTIPLE_MATCH) (y/n): ");
$has_single_match = query2("Single Match Flag (SINGLE_MATCH) (y/n): ");
$has_read_warning = query2("Read Warning Flag (READ_WARNING) (y/n): ");


print ("\n\n\nVHDL parameters were generated as follows: \n");
print ("===============================================\n");
print ("C_FAMILY                  : string  := $arch;\n");
print ("C_MEM_TYPE                : integer := $mem_type;\n");
print ("C_WIDTH                   : integer := $width;\n");
print ("C_DEPTH                   : integer := $depth;\n");
print ("C_ADDR_TYPE               : integer := $match_encode;\n");
print ("C_MATCH_RESOLUTION_TYPE   : integer := $match_resolution;\n");
print ("C_TERNARY_MODE            : integer := $ternary_mode;\n");
print ("C_HAS_WE                  : integer := ", get_optpin($has_we),";\n");
print ("C_MEM_INIT                : integer := ", get_optpin($mem_init),";\n");
print ("C_HAS_CMP_DIN             : integer := ", get_optpin($has_cmp_din),";\n");
print ("C_REG_OUTPUTS             : integer := ", get_optpin($reg_outputs),";\n");
print ("C_HAS_EN                  : integer := ", get_optpin($has_en),";\n");
print ("C_HAS_MULTIPLE_MATCH      : integer := ", get_optpin($has_multiple_match),";\n");
print ("C_HAS_SINGLE_MATCH        : integer := ", get_optpin($has_single_match),";\n");
print ("C_HAS_READ_WARNING        : integer := ", get_optpin($has_read_warning),";\n\n");
print ("===============================================\n");

## set variable that define which ports are needed
$onlyreq    = (($ternary_mode eq '0' ) and
               (not get_optpin($has_we)) and
               (not get_optpin($has_cmp_din)) and
               (not get_optpin($has_en)) and
               (not get_optpin($has_multiple_match)) and
               (not get_optpin($has_single_match)) and
               (not get_optpin($has_read_warning)));

               
$datamasklast = (($ternary_mode eq '1' ) and
               (not get_optpin($has_we)) and
               (not get_optpin($has_cmp_din)) and
               (not get_optpin($has_en)) and
               (not get_optpin($has_multiple_match)) and
               (not get_optpin($has_single_match)) and
               (not get_optpin($has_read_warning)));
               
$welast =      ((get_optpin($has_we)) and
               (not get_optpin($has_cmp_din)) and
               (not get_optpin($has_en)) and
               (not get_optpin($has_multiple_match)) and
               (not get_optpin($has_single_match)) and
               (not get_optpin($has_read_warning)));

$cmpdinlast =  ((get_optpin($has_cmp_din)) and
               (not get_optpin($has_en)) and
               (not get_optpin($has_multiple_match)) and
               (not get_optpin($has_single_match)) and
               (not get_optpin($has_read_warning)));

$enlast   = ((get_optpin($has_en)) and
               (not get_optpin($has_multiple_match)) and
               (not get_optpin($has_single_match)) and
               (not get_optpin($has_read_warning)));

$multmatchlast = ((get_optpin($has_multiple_match)) and
               (not get_optpin($has_single_match)) and
               (not get_optpin($has_read_warning)));

$singmatchlast = ((get_optpin($has_single_match)) and
               (not get_optpin($has_read_warning)));

$readwarnlast  = (get_optpin($has_read_warning));



## Write the selected configuration to the wrapper temporary file
while (my $line = <FILE>)
{
    my $line1 = $line;
    $line1 =~ s/^\s+//;

    if ($line1 =~ /^\-\-/)
    {
        print FILETMP $line; #skip comment
    }
   
    ## Set instantiation generic
    elsif (($line1 =~ /C_ADDR_TYPE/) and ($line1 =~ /=>/))
    {
        print FILETMP "   C_ADDR_TYPE                => $match_encode, \n";
    }
    elsif (($line1 =~ /C_DEPTH/) and ($line1 =~ /=>/))
    {
        print FILETMP "   C_DEPTH                    => $depth, \n";
    }
    elsif (($line1 =~ /C_FAMILY/) and ($line1 =~ /=>/))
    {
        print FILETMP "   C_FAMILY                   => \"$arch\",\n";
    }
    elsif (($line1 =~ /C_HAS_CMP_DIN/) and ($line1 =~ /=>/))
    {
        print FILETMP "   C_HAS_CMP_DIN              => ", get_optpin($has_cmp_din),",\n";
    }
    elsif (($line1 =~ /C_HAS_EN/) and ($line1 =~ /=>/))
    {
        print FILETMP "   C_HAS_EN                   => ", get_optpin($has_en),",\n";
    }
    elsif (($line1 =~ /C_HAS_MULTIPLE_MATCH/ and ($line1 =~ /=>/)))
    {
        print FILETMP "   C_HAS_MULTIPLE_MATCH       => ", get_optpin($has_multiple_match),",\n";
    }
    elsif (($line1 =~ /C_HAS_READ_WARNING/) and ($line1 =~ /=>/))
    {
        print FILETMP "   C_HAS_READ_WARNING         => ", get_optpin($has_read_warning),",\n";
    }
    elsif (($line1 =~ /C_HAS_SINGLE_MATCH/) and ($line1 =~ /=>/))
    {
        print FILETMP "   C_HAS_SINGLE_MATCH         => ", get_optpin($has_single_match),",\n";
    }
    elsif (($line1 =~ /C_HAS_WE/) and ($line1 =~ /=>/))
    {
        print FILETMP "   C_HAS_WE                   => ", get_optpin($has_we),",\n";
    }
    elsif (($line1 =~ /C_MATCH_RESOLUTION_TYPE/) and ($line1 =~ /=>/))
    {
        print FILETMP "   C_MATCH_RESOLUTION_TYPE    => $match_resolution,\n";
    }
    elsif (($line1 =~ /C_MEM_INIT/) and ($line1 =~ /=>/))
    {
        print FILETMP "   C_MEM_INIT                 => ", get_optpin($mem_init),",\n";
    }
    elsif (($line1 =~ /C_MEM_TYPE/) and ($line1 =~ /=>/))
    {
        print FILETMP "   C_MEM_TYPE                 => $mem_type,\n";
    }
    elsif (($line1 =~ /C_REG_OUTPUTS/) and ($line1 =~ /=>/))
    {
        print FILETMP "   C_REG_OUTPUTS              => ", get_optpin($reg_outputs),",\n";
    }
    elsif (($line1 =~ /C_TERNARY_MODE/) and ($line1 =~ /=>/))
    {
        print FILETMP "   C_TERNARY_MODE             => $ternary_mode,\n";
    }
    elsif (($line1 =~ /C_WIDTH/) and ($line1 =~ /=>/))
    {
        print FILETMP "   C_WIDTH                    => $width\n";
    }

    ## Set ports for top level entity
    
    #Set DIN port width
    elsif (($line1 =~ /DIN/) and not( $line1 =~ /CMP_DIN/) and ($line1 =~ /STD/))
    {
        print FILETMP "    DIN             : IN  STD_LOGIC_VECTOR(", $width-1," DOWNTO 0)  := (OTHERS => '0');";
        
    }
    
    #Set MATCH_ADDR port width
    elsif (($line1 =~ /MATCH_ADDR/) and ($line1 =~ /STD/))
    {
	    
	    if ($match_encode eq '0')
	    { 
		    	print FILETMP "    MATCH_ADDR      : OUT STD_LOGIC_VECTOR(", log2roundup($depth)-1," DOWNTO 0)  := (OTHERS => '0')";
	    }
	    else
	    {
		    	print FILETMP "    MATCH_ADDR      : OUT STD_LOGIC_VECTOR(", $depth-1," DOWNTO 0)  := (OTHERS => '0')";
	    }
	    
	    if ($onlyreq) {print FILETMP "\n"} else {print FILETMP ";\n"}

    }
    
    #DATA_MASK port in entity
    elsif (($line1 =~ /DATA_MASK/) and not( $line1 =~ /CMP_DATA_MASK/) and ($line1 =~ /STD/))
    {
        if ($ternary_mode ne '0')
        	{
	        	print FILETMP "    DATA_MASK       : IN  STD_LOGIC_VECTOR(", $width-1," DOWNTO 0)  := (OTHERS => '0')";
	        	if ($datamasklast) {print FILETMP "\n"} else {print FILETMP ";\n"}
    	    }              
    }
    
	#WE port in entity
    elsif (($line1 =~ /WE/) and ($line1 =~ /STD/))
    {
        if (get_optpin($has_we))
        	{
	        	print FILETMP "    WE              : IN  STD_LOGIC := '0' ;\n";
    	    }            
    }
    
    #WR_ADDR port in entity
    elsif (($line1 =~ /WR_ADDR/) and ($line1 =~ /STD/))
    {
        if (get_optpin($has_we))
        	{
	        	print FILETMP "    WR_ADDR         : IN  STD_LOGIC_VECTOR(", log2roundup($depth)-1," DOWNTO 0)  := (OTHERS => '0')";
	        	if ($welast) {print FILETMP "\n"} else {print FILETMP ";\n"}
    	    }            
    }
    
    #CMP_DIN port in entity
    elsif (($line1 =~ /CMP_DIN/) and ($line1 =~ /STD/))
    {
        if (get_optpin($has_cmp_din))
        	{
	        	print FILETMP "    CMP_DIN         : IN  STD_LOGIC_VECTOR(", $width-1," DOWNTO 0)  := (OTHERS => '0')";
	        	if (($cmpdinlast) and ($ternary_mode eq '0')) {print FILETMP "\n"} else {print FILETMP ";\n"}
    	    }            
    }
    
    #CMP_DATA_MASK port in entity
    elsif (($line1 =~ /CMP_DATA_MASK/) and ($line1 =~ /STD/))
    {
        if ( (get_optpin($has_cmp_din)) and ($ternary_mode ne '0') )
        	{
	        	print FILETMP "    CMP_DATA_MASK   : IN  STD_LOGIC_VECTOR(", $width-1," DOWNTO 0)  := (OTHERS => '0')";
	        	if ($cmpdinlast) {print FILETMP "\n"} else {print FILETMP ";\n"}
    	    }            
    }
    
    
    #EN port in entity
    elsif (($line1 =~ /EN/) and ($line1 =~ /STD/))
    {
        if (get_optpin($has_en))
        	{
	        	print FILETMP "    EN              : IN  STD_LOGIC := '0'";
	        	if ($enlast) {print FILETMP "\n"} else {print FILETMP ";\n"}
    	    }            
    }
    
    #MULTIPLE_MATCH port in entity
    elsif (($line1 =~ /MULTIPLE_MATCH/) and ($line1 =~ /STD/))
    {
        if (get_optpin($has_multiple_match))
        	{
	        	print FILETMP "    MULTIPLE_MATCH  : OUT STD_LOGIC := '0'";
	        	if ($multmatchlast) {print FILETMP "\n"} else {print FILETMP ";\n"}
    	    }            
    }
    
    #SINGLE_MATCH port in entity
    elsif (($line1 =~ /SINGLE_MATCH/) and ($line1 =~ /STD/))
    {
        if (get_optpin($has_single_match))
        	{
	        	print FILETMP "    SINGLE_MATCH    : OUT STD_LOGIC := '0'";
	        	if ($singmatchlast) {print FILETMP "\n"} else {print FILETMP ";\n"}
    	    }            
    }
    
    #READ_WARNING port in entity
    elsif (($line1 =~ /READ_WARNING/) and ($line1 =~ /STD/))
    {
        if (get_optpin($has_read_warning))
        	{
	        	print FILETMP "    READ_WARNING    : OUT STD_LOGIC := '0'";
	        	if ($readwarnlast) {print FILETMP "\n"} else {print FILETMP ";\n"}
    	    }            
    }
    
    ## Port assignments for CAM module
    
    # DATA_MASK port
    elsif (($line1 =~ /DATA_MASK/) and not($line1 =~ /CMP_DATA_MASK/) and ($line1 =~ /=>/))
    {
        if ($ternary_mode ne '0')
        {   print FILETMP $line; }
        else
        {
            print FILETMP "    DATA_MASK               =>  (OTHERS => '0'),\n";

        }
    }
    
    # WE port
    elsif (($line1 =~ /WE/) and ($line1 =~ /=>/))
    {
        if (get_optpin($has_we))
        	{   print FILETMP $line; }
		else
		{
	        print FILETMP "    WE                      =>  HIGH,\n";
		}      
        
	}
	
    # WR_ADDR port
    elsif (($line1 =~ /WR_ADDR/) and ($line1 =~ /=>/))
    {
        if (get_optpin($has_we))
        	{   print FILETMP $line; }
		else
		{
	        print FILETMP "    WR_ADDR                 =>  (OTHERS => '0'),\n";
		}      
        
	}
	
    # CMP_DIN port
    elsif (($line1 =~ /CMP_DIN/) and ($line1 =~ /=>/))
    {
        if (get_optpin($has_cmp_din))
        	{   print FILETMP $line; }
		else
		{
	        print FILETMP "    CMP_DIN                 =>  (OTHERS => '0'),\n";
		}      
        
	}	
    
	# CMP_DATA_MASK port
    elsif (($line1 =~ /CMP_DATA_MASK/) and ($line1 =~ /=>/))
    {
        if (get_optpin($has_cmp_din) and ($ternary_mode ne '0'))
        	{   print FILETMP $line; }
		else
		{
	        print FILETMP "    CMP_DATA_MASK           =>  (OTHERS => '0'),\n";
		}      
        
	}	
	
    # EN port
    elsif (($line1 =~ /EN/) and ($line1 =~ /=>/))
    {
        if (get_optpin($has_en))
        	{   print FILETMP $line; }
		else
		{
	        print FILETMP "    EN                      =>  HIGH,\n";
		}      
        
	}		
	
	# MULTIPLE_MATCH port
    elsif (($line1 =~ /MULTIPLE_MATCH/) and ($line1 =~ /=>/))
    {
        if (get_optpin($has_multiple_match))
        	{   print FILETMP $line; }
		else
		{
	        print FILETMP "    MULTIPLE_MATCH          =>  open,\n";
		}      
        
	}	
	
	# SINGLE_MATCH port
    elsif (($line1 =~ /SINGLE_MATCH/) and ($line1 =~ /=>/))
    {
        if (get_optpin($has_single_match))
        	{   print FILETMP $line; }
		else
		{
	        print FILETMP "    SINGLE_MATCH            =>  open,\n";
		}      
        
	}
	
	# READ_WARNING port
    elsif (($line1 =~ /READ_WARNING/) and ($line1 =~ /=>/))
    {
        if (get_optpin($has_read_warning))
        	{   print FILETMP $line; }
		else
		{
	        print FILETMP "    READ_WARNING            =>  open\n";
		}      
        
	}		

    else
    {
        print FILETMP $line;
    }
}

close FILE;
close FILETMP;

# Over-write the wrapper file with the configured (temporary) wrapper file
rename "$filename.tmp", $filename or
    die("Error:  Cannot overwrite $filename\n");

#####################################################
#####################################################
#####################################################
####
####     General Subroutines
####
#####################################################
#####################################################
#####################################################

#-----------------------------------------------------
# log2roundup function
#-----------------------------------------------------
sub log2roundup {
	my $n = shift();
	my $m = (log($n)/ log(2));
	return int($m + .9999)
}


#-----------------------------------------------------
# Convert user response from y/n to 1/0
#-----------------------------------------------------
sub get_optpin {
    my $sel = shift();
    if ($sel eq 'y' || $sel eq 'Y') {return '1';}
    else {return '0';}
}


#-----------------------------------------------------
# Query user for input; re-query if invalid
#-----------------------------------------------------
sub query1 {
    my $txt = shift();
    do {
        print $txt;
        $_ = <STDIN>;
        chomp($_);
        if (is_valid1($_) == 0) {print "  *** Invalid input $_ ***\n";}
    }
    while (is_valid1($_) == 0);
    return $_;
}
#-----------------------------------------------------
# Query user for input; re-query if invalid
#-----------------------------------------------------
sub query2 {
    my $txt = shift();
    do {
        print $txt;
        $_ = <STDIN>;
        chomp($_);
        if (is_valid2($_) == 0) {print "  *** Invalid input $_ ***\n";}
    }
    while (is_valid2($_) == 0);
    return $_;
}
#-----------------------------------------------------
# Query user for input; re-query if invalid
#-----------------------------------------------------
sub query3 {
    my $txt = shift();
    do {
        print $txt;
        $_ = <STDIN>;
        chomp($_);
        if (is_valid3($_) == 0) {print "  *** Invalid input $_ ***\n";}
    }
    while (is_valid3($_) == 0);
    return $_;
}

#-----------------------------------------------------
# Query user for input; re-query if invalid
#-----------------------------------------------------
sub query4 {
    my $txt = shift();
    do {
        print $txt;
        $_ = <STDIN>;
        chomp($_);
        if (is_valid4($_) == 0) {print "  *** Invalid input $_ ***\n";}
    }
    while (is_valid4($_) == 0);
    return $_;
}

#-----------------------------------------------------
# Query user for input; re-query if invalid
#-----------------------------------------------------
sub query5 {
    my $txt = shift();
    do {
        print $txt;
        $_ = <STDIN>;
        chomp($_);
        if (is_valid5($_) == 0) {print "  *** Invalid input $_ ***\n";}
    }
    while (is_valid5($_) == 0);
    return $_;
}

#-----------------------------------------------------
# Query user for input; re-query if invalid
#-----------------------------------------------------
sub query6 {
    my $txt = shift();
    do {
        print $txt;
        $_ = <STDIN>;
        chomp($_);
        if (is_valid6($_) == 0) {print "  *** Invalid input $_ ***\n";}
    }
    while (is_valid6($_) == 0);
    return $_;
}


#-----------------------------------------------------
# Check if the user response is 0 or 1
#-----------------------------------------------------
sub is_valid1 {
    my $rsp = shift();
    if ($rsp eq '0' || $rsp eq '1') {return 1;}
    else {return 0;}
}

#-----------------------------------------------------
# Check if the user response is y, Y, n, or N
#-----------------------------------------------------
sub is_valid2 {
    my $rsp = shift();
    if ($rsp eq 'y' || $rsp eq 'Y' ||
        $rsp eq 'n' || $rsp eq 'N') {return 1;}
    else {return 0;}
}

#-----------------------------------------------------
# Check if the user response is 0, 1, or 2
#-----------------------------------------------------
sub is_valid3 {
    my $rsp = shift();
    if ($rsp eq '0' || $rsp eq '1' || $rsp eq '2') {return 1;}
    else {return 0;}
}

#-----------------------------------------------------
# Check if the user response is a valid architecture
#-----------------------------------------------------
sub is_valid4 {
    my $rsp = lc(shift());
    if ($rsp eq 'virtex4' || $rsp eq 'virtex5' || $rsp eq 'virtex6' ||
        $rsp eq 'virtex6l' || $rsp eq 'spartan3' || $rsp eq 'spartan3e' || $rsp eq 'aspartan3' 
        || $rsp eq 'aspartan3e'|| $rsp eq 'spartan3a' || $rsp eq 'spartan3adsp' 
        || $rsp eq 'spartan6' ) {return 1;}
    else {return 0;}
}

#-----------------------------------------------------
# Check if the user response is between 1 and 512 bits
#-----------------------------------------------------
sub is_valid5 {
    my $rsp = shift();
    if ($rsp >=  1 && $rsp <= 512 ) {return 1;}
    else {return 0;}
}

#-----------------------------------------------------
# Check if the user response is between 16 and 4096
#-----------------------------------------------------
sub is_valid6 {
    my $rsp = shift();
    if ($rsp >=  16 && $rsp <= 4096 ) {return 1;}
    else {return 0;}
}
