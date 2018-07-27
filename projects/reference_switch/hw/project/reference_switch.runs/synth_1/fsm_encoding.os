
 add_fsm_encoding \
       {ten_gig_eth_mac_v15_1_2_pfc_tx_cntl.legacy_state} \
       { }  \
       {{000 0001} {001 0010} {010 0100} {011 1000} }

 add_fsm_encoding \
       {ten_gig_eth_mac_v15_1_2_rx_control.pause_state} \
       { }  \
       {{000 00001} {001 00010} {100 00100} {101 01000} {110 10000} }

 add_fsm_encoding \
       {ten_gig_eth_pcs_pma_v6_0_7_tx_pcs_fsm.state} \
       { }  \
       {{000 000} {001 010} {010 011} {011 100} {100 001} }

 add_fsm_encoding \
       {ten_gig_eth_pcs_pma_v6_0_7_rx_ber_mon_fsm.mcp1_state} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} {101 101} }

 add_fsm_encoding \
       {ten_gig_eth_pcs_pma_v6_0_7_rx_pcs_fsm.mcp1_state} \
       { }  \
       {{000 000} {001 011} {010 100} {011 010} {100 001} }

 add_fsm_encoding \
       {ten_gig_eth_pcs_pma_v6_0_7_cs_ipif_access.state} \
       { }  \
       {{000 00} {001 01} {010 10} {011 11} }

 add_fsm_encoding \
       {rx_queue__xdcDup__1.state} \
       { }  \
       {{0000 00} {0001 01} {0010 11} {0011 10} }

 add_fsm_encoding \
       {rx_queue__xdcDup__2.state} \
       { }  \
       {{0000 00} {0001 01} {0010 11} {0011 10} }

 add_fsm_encoding \
       {rx_queue__xdcDup__3.state} \
       { }  \
       {{0000 00} {0001 01} {0010 11} {0011 10} }

 add_fsm_encoding \
       {rx_queue.state} \
       { }  \
       {{0000 00} {0001 01} {0010 11} {0011 10} }
