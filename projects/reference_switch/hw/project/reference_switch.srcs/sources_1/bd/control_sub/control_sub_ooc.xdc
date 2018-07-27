################################################################################

# This XDC is used only for OOC mode of synthesis, implementation
# This constraints file contains default clock frequencies to be used during
# out-of-context flows such as OOC Synthesis and Hierarchical Designs.
# This constraints file is not used in normal top-down synthesis (default flow
# of Vivado)
################################################################################
create_clock -name axi_lite_aclk -period 10 [get_ports axi_lite_aclk]
create_clock -name axis_datapath_aclk -period 10 [get_ports axis_datapath_aclk]
create_clock -name sys_clk -period 10 [get_ports sys_clk]

################################################################################