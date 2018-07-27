//
// Copyright (C) 2016 Salvator Galea <salvator.galea@cl.cam.ac.uk>
// All rights reserved.
//
// This software was developed by
// Stanford University and the University of Cambridge Computer Laboratory
// under National Science Foundation under Grant No. CNS-0855268,
// the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
// by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
// as part of the DARPA MRC research programme.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
// license agreements.  See the NOTICE file distributed with this work for
// additional information regarding copyright ownership.  NetFPGA licenses this
// file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
// "License"); you may not use this file except in compliance with the
// License.  You may obtain a copy of the License at:
//
//   http://www.netfpga-cic.org
//
// Unless required by applicable law or agreed to in writing, Work distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@
//
//
//    ICMP-echo response
//
//    Kiwi Scientific Acceleration (KiwiC .net/CIL/C# to Verilog/SystemC compiler): Version alpha 2.03a: Feb-2016 Unix 3.16.0.30
//  	/root/kiwi/kiwipro/kiwic/distro/lib/kiwic.exe EthernetEcho.dll -bevelab-default-pause-mode=hard -vnl-resets=synchronous -vnl-roundtrip=disable -res2-no-dram-ports=0 -restructure2=disable -vnl EthernetEcho.v
//


using System;
using KiwiSystem;

class Emu
{

        // These are the ports of the circuit (and will appear as ports in the generated Verilog)
	// Slave Stream Ports	
        [Kiwi.InputWordPort("s_axis_tdata")]	// s_axis_tdata
        static ulong s_axis_tdata; 		// Data to be received
        [Kiwi.InputBitPort("s_axis_tkeep")]	// s_axis_tkeep
        static byte s_axis_tkeep;       	// Offset of valid bytes in the data bus
        [Kiwi.InputBitPort("s_axis_tlast")]	// s_axis_tlast		
        static bool s_axis_tlast;      		// End of frame indicator
        [Kiwi.InputBitPort("s_axis_tvalid")]	// s_axis_tvalid
        static bool s_axis_tvalid;		// Valid data on the bus - indicator
        [Kiwi.OutputBitPort("s_axis_tready")]	// s_axis_tready
        static bool s_axis_tready;	  	// Ready to receive data - indicator
        [Kiwi.InputWordPort("s_axis_tuser_hi")]	// s_axis_tuser_hi
        static ulong s_axis_tuser_hi; 		// metadata
        [Kiwi.InputWordPort("s_axis_tuser_low")]// s_axis_tuser_low
        static ulong s_axis_tuser_low; 		// metadata

	// Master Stream Ports
        [Kiwi.OutputWordPort("m_axis_tdata")]	// m_axis_tdata
        static ulong m_axis_tdata;		// Data to be sent 
        [Kiwi.OutputBitPort("m_axis_tkeep")]	// m_axis_tkeep
        static byte m_axis_tkeep;		// Offset of valid bytes in the data bus
        [Kiwi.OutputBitPort("m_axis_tlast")]	// m_axis_tlast
        static bool m_axis_tlast;		// End of frame indicator
        [Kiwi.OutputBitPort("m_axis_tvalid")]	// m_axis_tvalid
        static bool m_axis_tvalid;		// Valid data on the bus - indicator
        [Kiwi.InputBitPort("m_axis_tready")]	// m_axis_tready
        static bool m_axis_tready ;    		// Ready to transmit data - indicator
        [Kiwi.OutputBitPort("m_axis_tuser_hi")]	// m_axis_tuser_hi
        static ulong m_axis_tuser_hi;		// metadata
        [Kiwi.OutputBitPort("m_axis_tuser_low")]// m_axis_tuser_low
        static ulong m_axis_tuser_low;		// metadata

	// CAM Memory Ports
	// Input Ports
        [Kiwi.InputBitPort("cam_busy")]		// cam_busy
        static bool cam_busy;			// Busy signal from the CAM
        [Kiwi.InputBitPort("cam_match")]	// cam_match
        static bool cam_match;			// Match singal if data has been found
        [Kiwi.InputBitPort("cam_match_addr")]	// cam_match_addr
        static byte cam_match_addr;		// Return address of the matched data
	// Output Ports
        [Kiwi.OutputWordPort("cam_cmp_din")]	// cam_cmp_din
        static ulong cam_cmp_din=~(ulong)0x00;	// Data to compare against the content of the CAM
        [Kiwi.OutputWordPort("cam_din")]	// cam_din
        static ulong cam_din=0x00;		// Data to be writen in the CAM
        [Kiwi.OutputBitPort("cam_we")]		// cam_we
        static bool cam_we=false;		// Write enable signal
        [Kiwi.OutputBitPort("cam_wr_addr")]	// cam_wr_addr
        static byte cam_wr_addr=0x00;		// Address to write data in CAM

	// Debug register - Output Port
        [Kiwi.OutputWordPort("debug_reg")]	// debug_reg
        static uint debug_reg=0x00;		// Register for debuging purpose

	// Constants variables
	const uint BUF_SIZE = (uint)256;	
	const uint MEM_SIZE = (uint)256;

	// Constants for the Memcached header
	// Magic numbers
	const byte  REQUEST 	= 0x80;
	const byte  RESPONSE	= 0x81;
	// Opcode
	const byte GET 		= 0x00;
	const byte SET		= 0x01;
	const byte DELETE	= 0x04;
	// Error textual message
	const ulong ERROR_MSG	= 0x313020524f525245; // ASQII = "10 RORRE" ~ "ERROR 01" 

	//static ulong[] KEYS_MEM = new ulong[MEM_SIZE];
	static ulong[] VALUES_MEM = new ulong[MEM_SIZE];
	static ulong[] EXTRAS_MEM = new ulong[MEM_SIZE];

	static ulong dst_mac, src_mac, src_port, dst_port, src_ip, dst_ip; 
	static bool IPv4 = false, proto_UDP = false, proto_ICMP = false;
	static byte magic_num, opcode;
	static uint key_length;
	static byte extras_length;
	static ulong IP_total_length, UDP_total_length, app_src_port, app_dst_port, ICMP_code_type;
	static ulong key, key_value, extras, flag;
	static ulong segm_num=0;

	static uint num=0;
    
	// Local buffer for storing the incoming packet
	static byte[] tkeep	= new byte[BUF_SIZE];
	static bool[] tlast	= new bool[BUF_SIZE];
	static ulong[] tdata	= new ulong[BUF_SIZE];
	static ulong[] tuser_hi	= new ulong[BUF_SIZE];
	static ulong[] tuser_low= new ulong[BUF_SIZE];

	static ulong chksum_UDP=0;

	static ulong chksumIP=0,tmp, tmp3, tmp2, tmp1;

	static uint cnt;
	static uint mem_controller_cnt=0;

        // This method describes the main logic functionality of the Server
        static public void ICMP_echo_logic()
        {
	    ulong local_icmp_code_type, local_chksum_udp, d, u;//, ipv4;		
	    uint i=0, free=0, mem_cnt=0;
	    byte ii=0, local_magic_num=0, local_opcode=0 ;
            
	    uint pkt_size=0;
	    bool exist = false, is_ipv4=false, is_udp=false, is_icmp=false;
	    uint cam_addr=0,  tmp_addr=0, addr=0;
	    bool good_IP_checksum = false, error = false;
	    ulong local_key_value, local_extras, local_flag;
	
            while (true) // Process packets indefinately
            {
		// Store the packet into the buffer
		pkt_size = ReceiveFrame();
	
		// Extract information from the Ethernet, IP, TCP, UDP frames
		// Currently this information is located in the buffer entries 0-11
		for(i=0; i<=11; i++)
		{
			d = tdata[i];
			u = tuser_low[i];
			Kiwi.Pause();
			Extract_headers(i, d, u);
		}
	
		Kiwi.Pause();
		// We need to store the shared-threat variables here 
		// otherwise if we use it explicity we get long compilation times
		is_ipv4 		= IPv4;
		is_udp 			= proto_UDP;
		is_icmp			= proto_ICMP; 
		local_magic_num 	= magic_num;
		local_opcode		= opcode;
		local_icmp_code_type 	= ICMP_code_type;
		local_chksum_udp 	= chksum_UDP;
		local_key_value		= key_value;
		local_extras		= extras;
		local_flag		= flag;


		Kiwi.Pause();
 
		// ###########################################################################################
		// # 				ICMP - ECHO
		if(is_ipv4 && is_icmp)
		{
			good_IP_checksum = ( calc_IP_checksum() == (ulong)0x00 );
			Kiwi.Pause();		

			//ICMP - echo request
			if( (local_icmp_code_type == (ulong)0x0008) && good_IP_checksum )//&& (local_chksum_udp==(ulong)0x00ffff) )
			{				
				swap_multiple_fields(is_udp, is_icmp);					
				chksum_UDP = (ulong)0x00;

				// currently we dont need the type and the code of the ICMP
				// here is the icmp checksum - set to zero all of them
				tmp = (ulong)(tdata[4] & (ulong)0xffff00000000ffff);
				Kiwi.Pause();
				// The 4th element in the buffer is the start of the ICMP frame
				for(i=4; i<=pkt_size; i++)
				{
					tmp2 = (i!=4) ? tdata[i] : tdata[i]>>16; 
					Kiwi.Pause();
					calc_UDP_checksum(tmp2);
				}

				// 1's complement of the result
				tmp1 = ( chksum_UDP ^ ~(ulong)0x00 ) & (ulong)0x00ffff;
				Kiwi.Pause();
				// make it back to little endian
				tmp2 = ((tmp1>>8) | (tmp1&(ulong)0x00ff)<<8) ;
				// Set the new UDP checksum
				tdata[4] = tmp | tmp2<<32;
				tmp3 = tuser_low[0] & (ulong)0x00ffff;
				Kiwi.Pause();
				// Set the output port
				tuser_low[0] = (src_port<<24) | (src_port<<16) | tmp3;
				
			}
		}
		Kiwi.Pause();
		// # 
		// ###########################################################################################


		// Procedure to send out the packet
		SendFrame(pkt_size); 
                //End of frame, ready for next frame
		IPv4		= false;
		proto_UDP	= false;
		proto_ICMP	= false;
		chksum_UDP	= 0x00;
		pkt_size	= 0x00;
            }
        }


	// This procedure calculates the checksum of a given byte stream
	// It returns the result in big endianess format
	// It doenst compute the 1's complement
	static public void calc_UDP_checksum(ulong data)
	{
		ulong tmp0=0x00, tmp1=0x00, tmp2=0x00, tmp3=0x00, sum0=0, sum1=0, sum=0, chk=0;

		chk = chksum_UDP;
			// The ICMP header & payload start from this packet number
			if( true )//cnt > (uint)3 )
			{
				// extract every 16-bit from the stream for addition and reorder it to big endianess

				tmp0 = ((ulong)(data>>0) & (ulong)0x00ff)<<8 | ((ulong)(data>>0) & (ulong)0x00ff00)>>8;
				tmp1 = ((ulong)(data>>16) & (ulong)0x00ff)<<8 | ((ulong)(data>>16) & (ulong)0x00ff00)>>8;
				tmp2 = ((ulong)(data>>32) & (ulong)0x00ff)<<8 | ((ulong)(data>>32) & (ulong)0x00ff00)>>8;
				tmp3 = ((ulong)(data>>48) & (ulong)0x00ff)<<8 | ((ulong)(data>>48) & (ulong)0x00ff00)>>8;

				// check for carry and add it if its needed
				sum0 = (ulong)( (tmp0 + tmp1)& (ulong)0x00ffff ) + (ulong)( (tmp0 + tmp1)>>16); 
				sum1 = (ulong)( (tmp2 + tmp3)& (ulong)0x00ffff ) + (ulong)( (tmp2 + tmp3)>>16); 
				Kiwi.Pause();
				// check for carry and add it if its needed
				sum = (ulong)( (sum0 + sum1)& (ulong)0x00ffff ) + (ulong)((sum0 + sum1)>>16);
				// add the current sum to the previous sums
				chksum_UDP = (ulong)( (sum + chk)& (ulong)0x00ffff ) + (ulong)((sum + chk)>>16);
			}

	}


	// This procedure perform the calculation of the new checksum and verification
	// It returns the new checksum(on calculation process) or 0x00 if no-errors were detected(on verification process)
	static ulong calc_IP_checksum()
	{	byte i;
		ulong data=0x00, tmp0=0x00, tmp1=0x00, tmp2=0x00, tmp3=0x00;
		ulong sum0=0x00, sum1=0x00, sum=0x00;	
		ulong sum_all = 0x00;


		for(i=1; i<=4; i++)
		{
			data = (i==1) ? tdata[1]>>48 : (i==4) ? tdata[4]<<48 : (i==2 || i==3) ? tdata[i] : (ulong)0x00;
			Kiwi.Pause();
			// extract every 16-bit from the stream for addition and reorder it to big endianess
			tmp0 = ((ulong)(data>>0) & (ulong)0x00ff)<<8 | ((ulong)(data>>0) & (ulong)0x00ff00)>>8;
			tmp1 = ((ulong)(data>>16) & (ulong)0x00ff)<<8 | ((ulong)(data>>16) & (ulong)0x00ff00)>>8;
			tmp2 = ((ulong)(data>>32) & (ulong)0x00ff)<<8 | ((ulong)(data>>32) & (ulong)0x00ff00)>>8;
			tmp3 = ((ulong)(data>>48) & (ulong)0x00ff)<<8 | ((ulong)(data>>48) & (ulong)0x00ff00)>>8;

			// check for carry and add it if its needed
			sum0 = (ulong)( (tmp0 + tmp1)& (ulong)0x00ffff ) + (ulong)( (tmp0 + tmp1)>>16); 
			sum1 = (ulong)( (tmp2 + tmp3)& (ulong)0x00ffff ) + (ulong)( (tmp2 + tmp3)>>16); 
			Kiwi.Pause();
			// check for carry and add it if its needed
			sum = (ulong)( (sum0 + sum1)& (ulong)0x00ffff ) + (ulong)((sum0 + sum1)>>16);
			// add the current sum to the previous sums
			sum_all = (ulong)( (sum + sum_all)& (ulong)0x00ffff ) + (ulong)((sum + sum_all)>>16);
		}

		//(ulong)(~sum0 & (ulong)0x00ffff); DOESNT WORK	
		sum_all = ( sum_all ^ ~(ulong)0x00 ) & (ulong)0x00ffff;
		
		return( sum_all ); 
	}


	// This procedure perform basic control operation for the CAM 
	static uint cam_controller(byte mode)
	{
		uint tmp_addr=0x00;

		// Poll until CAM is ready 	
		while(cam_busy){Kiwi.Pause();}

		//addr = mem_controller_cnt;
		//tmp_key = key;

		//if(mem_controller_cnt == (uint)(MEM_SIZE-1U)) mem_controller_cnt = 0; 
	
		switch (mode)
		{	// WRITE operation - returns the address in which the key is stored
			case SET: // 0x01
				// Check if the key exists in the CAM
				cam_cmp_din  = key;				
				Kiwi.Pause();
				cam_cmp_din  = key;
				Kiwi.Pause();
				// Perform the store operation
				cam_din		= key;
				cam_wr_addr	= (cam_match) ? (byte)cam_match_addr : (byte)mem_controller_cnt;
				tmp_addr	= (cam_match) ? (byte)cam_match_addr : (byte)mem_controller_cnt;
				Kiwi.Pause();

				cam_we = true;
				Kiwi.Pause();
				cam_we = false;
				Kiwi.Pause();
						
				break;
			// READ operation - return the address if we have a match otherwhise MEM_SIZE
			case GET: // 0x00
				cam_cmp_din  = key;				
				Kiwi.Pause();
				cam_cmp_din  = key;
				Kiwi.Pause();

				tmp_addr = (cam_match) ? (uint)cam_match_addr : (uint)MEM_SIZE; 
				
				break;	
			// DELETE operation - return the address if we have a match otherwhise MEM_SIZE
			case DELETE: // 0x04
				cam_cmp_din  = key;
				Kiwi.Pause();
				cam_cmp_din  = key;
				Kiwi.Pause();				
				if(cam_match)
					tmp_addr = (uint)cam_match_addr;
				else 
					tmp_addr = (uint)MEM_SIZE; 

				Kiwi.Pause();
				if(cam_match){
					Kiwi.Pause();
					cam_din	= (ulong)0x00;
					cam_wr_addr = (byte)tmp_addr;
					Kiwi.Pause();
					cam_we = true;
					Kiwi.Pause();
					cam_we = false;	
					Kiwi.Pause();					
				}
				break;	
			default: break;				
		}

		if(mem_controller_cnt == (uint)(MEM_SIZE-1U)) mem_controller_cnt = 0; else mem_controller_cnt += 1U;	

		return tmp_addr;
	}


	// This procedure perform swap of multiple fields
	// dst_mac<->src_mac, dst_ip<->src_ip, dst_port<->src_port
	static void swap_multiple_fields(bool udp, bool icmp)
	{
		ulong tmp;
		bool udp_tmp, icmp_tmp;

		udp_tmp = udp;
		icmp_tmp= icmp;
		// Ethernet header swap
		tdata[0] = src_mac | (dst_mac<<48);
		Kiwi.Pause();
		tmp = (tdata[1] & (ulong)0xffffffff00000000) | dst_mac>>16;
		Kiwi.Pause();		
		tdata[1] = tmp;
		Kiwi.Pause();	
		
		// IP header swap + UDP header swap 
		tmp = (tdata[3] & (ulong)0x00ffff) | dst_ip<<16 | src_ip<<48;
		// tmp = dst_ip<<16 | src_ip<<48;
		Kiwi.Pause();	
		tdata[3] = tmp;
		Kiwi.Pause();
		if(udp_tmp)
			// Swap the ports, Memcached
			tmp = (tdata[4] & (ulong)0xffff000000000000) | src_ip>>16 | app_src_port<<32 | app_dst_port<<16;
		if(icmp_tmp)	
			// Set the ICMP echo reply type=0, code=0 and checksum=0x00
			tmp = (tdata[4] & (ulong)0xffff000000000000) | src_ip>>16;
		Kiwi.Pause();	
		tdata[4] = tmp;
		Kiwi.Pause();	
	}

	// The procedure is implemented as a separate thread and
	// will extract usefull data from the incoming stream
	// In order to utilize more the icoming process 
	static public void Extract_headers(uint count, ulong data, ulong user)
	{	
		cnt=1U;
		ulong tdata, tuser;
	
		cnt = count;
		tdata = data;
		tuser = user;

		switch(cnt)
		{
			// Start of the Ethernet header
			case 0U:	
				dst_mac   =  tdata & (ulong)0x0000ffffffffffff;
				src_mac   =  tdata>>48 & (ulong)0x00ffff;
				// metadata ports - NOT UDP ports
				src_port  = ((tuser>>16) & 0xff);
				dst_port  = ((tuser>>24) & 0xff);
				break;
			case 1U:
				src_mac |= ( tdata & (ulong)0x00ffffffff)<<16 ;
				IPv4 = ( ( tdata>>32 & (ulong)0x00ffff) == (ulong)0x0008) && ( ( tdata>>52 & (ulong)0x0f) == (ulong)0x04);
				break;				
			case 2U:
				proto_ICMP = (  tdata>>56 & (ulong)0x00ff) == (ulong)0x0001;
				proto_UDP = (  tdata>>56 & (ulong)0x00ff) == (ulong)0x0011;
				IP_total_length = (  tdata & (ulong)0x00ffff );
				break;				
//				// Start of the IP header
			case 3U:
				src_ip = ( tdata>>16) & (ulong)0x00ffffffff;
				dst_ip = ( tdata>>48) & (ulong)0x00ffff;
				break;
//				// Start of the UDP header
			case 4U:				
				dst_ip |= (  tdata & (ulong)0x00ffff )<<16; 
				app_src_port = (  tdata>>16 & (ulong)0x00ffff);
				app_dst_port = (  tdata>>32 & (ulong)0x00ffff);
				UDP_total_length = (  tdata>>48 & (ulong)0x00ffff);
				ICMP_code_type = (  tdata>>16 & (ulong)0x00ffff);
				break;
//				// Start of the UDP frame & Memcached Header
			case 6U:
				magic_num	= (byte)( tdata>>16 & (ulong)0x00ff);
				opcode		= (byte)( tdata>>24 & (ulong)0x00ff);
				// Little endianess to big
				key_length	= (uint)( tdata>>16 & (ulong)0x00ff00) | (uint)( tdata>>40 & (ulong)0x00ff);
				extras_length	= (byte)( tdata>>48 & (ulong)0x00ff);
				break;
			case 9U:
				if ( (magic_num==(byte)0x80) && (opcode==(byte)0x00 || opcode==(byte)0x04) )
					key	= (ulong)( tdata & (ulong)0xffffffffffff0000);
				if ( (magic_num==(byte)0x80) && (opcode==(byte)0x01) )
					extras	=  tdata<<16;
				break;
//				// Start of the key
//				// Currently fixed-length of the key is 6 Bytes and 8 Bytes for the value
//				// Extras(Flags/Expiration) fixed length 8 Bytes
			case 10U:
				if ( (magic_num==(byte)0x80) && (opcode==(byte)0x01) ){
					key	= (ulong)( tdata & (ulong)0xffffffffffff0000);
					extras	|=  tdata&(ulong)0x00ffff;
				}
				break;
			case 11U:
				if ( (magic_num==(byte)0x80) && (opcode==(byte)0x01) ){
					key_value =  tdata;
				}
				break;
			default: break;
		   } 
	}


	// This method describes the operations required to rx a frame over the AXI4-Stream.
	// and extract basic information such as dst_MAC, src_MAC, dst_port, src_port
        static public uint ReceiveFrame()
        {	
     		m_axis_tdata 		= (ulong)0x0;
		m_axis_tkeep 		= (byte)0x0;	
   		m_axis_tlast  		= false;
		m_axis_tvalid		= false;
		m_axis_tuser_hi 	= (ulong)0x0;
		m_axis_tuser_low	= (ulong)0x0;		
		s_axis_tready 		= true;

		segm_num = 0U;

		Kiwi.Pause();

		// The start condition 
		uint cnt 	= 0;
		uint psize 	= 0;
		bool doneReading= true;
		ulong data 	= 0x00;
		byte data2	= 0x00;
		// #############################
		// # Receive the frame
		// #############################
		cnt = 0;
		
		doneReading = true;
		
		while (doneReading)
		{
			if (s_axis_tvalid)
			{
				tdata[cnt]	  = s_axis_tdata;
				tkeep[cnt]	  = s_axis_tkeep;
				tlast[cnt]	  = s_axis_tlast;
				tuser_hi[cnt]     = s_axis_tuser_hi;
				tuser_low[cnt]    = s_axis_tuser_low;

				segm_num += 1U;
				psize = cnt++;
				// Condition to stop receiving data
				doneReading = !s_axis_tlast && s_axis_tvalid;
				// Create backpresure to whatever sends data to us
				s_axis_tready = s_axis_tlast ? false : true;		
			}
			Kiwi.Pause();			
		}

		data  = tdata[psize];
		data2 = tkeep[psize];
		
		Kiwi.Pause();

		switch (data2) {
		case 0x01:
			tdata[psize] = data & (ulong)0x00ff;
			break;
		case 0x03:
			tdata[psize] = data & (ulong)0x00ffff;
			break;
		case 0x07:
			tdata[psize] = data & (ulong)0x00ffffff;
			break;
		case 0x0f:
			tdata[psize] = data & (ulong)0x00ffffffff;
			break;
		case 0x1f:
			tdata[psize] = data & (ulong)0x00ffffffffff;
			break;
		case 0x3f:
			tdata[psize] = data & (ulong)0x00ffffffffffff;
			break;
		case 0x7f:
			tdata[psize] = data & (ulong)0x00ffffffffffffff; 
			break;
		default:
			break;
		}

		Kiwi.Pause();
		
		s_axis_tready	= false;
		cnt		= 0;
		segm_num	= 0;

		return psize;
	}

	// This method describes the operations required to tx a frame over the AXI4-Stream.
	static void SendFrame(uint pkt_size)
	{
		// #############################
                // # Transmit the frame
		// #############################
                m_axis_tvalid 		= true;
		m_axis_tlast 		= false;
     		m_axis_tdata 		= (ulong)0x0;
		m_axis_tkeep 		= (byte)0x0;	
		m_axis_tuser_hi 	= (ulong)0x0;
		m_axis_tuser_low	= (ulong)0x0;

		uint i=0;
		
		while (i<=pkt_size)
                {
			if ( m_axis_tready )
			{
		     		m_axis_tdata	= tdata[i];
				m_axis_tkeep	= tkeep[i];
				m_axis_tlast	= i == (pkt_size);
				m_axis_tuser_hi = tuser_hi[i];
				m_axis_tuser_low= tuser_low[i];
				i++;
			}		
			Kiwi.Pause();				
               }

                m_axis_tvalid 		= false;
		m_axis_tlast 		= false;
     		m_axis_tdata 		= (ulong)0x0;
		m_axis_tkeep 		= (byte)0x0;	
		m_axis_tuser_hi 	= (ulong)0x0;
		m_axis_tuser_low	= (ulong)0x0;
		Kiwi.Pause();
	}


	/////////////////////////////
	// Main Hardware Enrty point
	/////////////////////////////
	[Kiwi.HardwareEntryPoint()] 
	static int EntryPoint()
	{
		while (true) ICMP_echo_logic();
	}
	
	static int Main()
	{
		return 0;
	}
    }

