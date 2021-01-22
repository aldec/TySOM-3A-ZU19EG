####################################################################################################
###################################### TySOM-3A constraints ########################################
####################################################################################################

#  WL1837MOD WLAN_EN#
set_property  -dict {PACKAGE_PIN AD14 IOSTANDARD LVCMOS33} [get_ports {WLAN_EN[0]}]

#  WL1837MOD BT_EN#
set_property  -dict {PACKAGE_PIN AD12 IOSTANDARD LVCMOS33} [get_ports {BT_EN[0]}]

set_property  -dict {PACKAGE_PIN AE14 IOSTANDARD LVCMOS33} [get_ports BT_HCI_RX]
set_property  -dict {PACKAGE_PIN AF12 IOSTANDARD LVCMOS33} [get_ports BT_HCI_TX]
set_property  -dict {PACKAGE_PIN AE13 IOSTANDARD LVCMOS33} [get_ports BT_HCI_CTS]
set_property  -dict {PACKAGE_PIN AE12 IOSTANDARD LVCMOS33} [get_ports BT_HCI_RTS]

#  ETH1 MDIO
set_property  -dict {PACKAGE_PIN K23 IOSTANDARD LVCMOS18} [get_ports ETH1_MDIO_mdc]
set_property  -dict {PACKAGE_PIN K22 IOSTANDARD LVCMOS18} [get_ports ETH1_MDIO_mdio_io]

#  ETH1 Reset
set_property  -dict {PACKAGE_PIN A22 IOSTANDARD LVCMOS18} [get_ports ETH1_RESET_n_tri_io[0]]

#  ETH1
set_property  -dict {PACKAGE_PIN M23 IOSTANDARD LVCMOS18} [get_ports {ETH1_RGMII_rd[0]}]
set_property  -dict {PACKAGE_PIN P21 IOSTANDARD LVCMOS18} [get_ports {ETH1_RGMII_rd[1]}]
set_property  -dict {PACKAGE_PIN N23 IOSTANDARD LVCMOS18} [get_ports {ETH1_RGMII_rd[2]}]
set_property  -dict {PACKAGE_PIN M21 IOSTANDARD LVCMOS18} [get_ports {ETH1_RGMII_rd[3]}]

set_property  -dict {PACKAGE_PIN L22 IOSTANDARD LVCMOS18} [get_ports ETH1_RGMII_rx_ctl]
set_property  -dict {PACKAGE_PIN J21 IOSTANDARD LVCMOS18} [get_ports ETH1_RGMII_rxc]

set_property  -dict {PACKAGE_PIN N24 IOSTANDARD LVCMOS18} [get_ports {ETH1_RGMII_td[0]}]
set_property  -dict {PACKAGE_PIN P24 IOSTANDARD LVCMOS18} [get_ports {ETH1_RGMII_td[1]}]
set_property  -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS18} [get_ports {ETH1_RGMII_td[2]}]
set_property  -dict {PACKAGE_PIN P20 IOSTANDARD LVCMOS18} [get_ports {ETH1_RGMII_td[3]}]
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports ETH1_RGMII_td[3]]

set_property  -dict {PACKAGE_PIN L23 IOSTANDARD LVCMOS18} [get_ports ETH1_RGMII_tx_ctl]
set_property  -dict {PACKAGE_PIN H21 IOSTANDARD LVCMOS18} [get_ports ETH1_RGMII_txc]
  
# ETH1 Clock Period Constraints 
create_clock -period 8.000 -name rgmii_rxc -add [get_ports ETH1_RGMII_rxc]  
  
# UART PL
set_property  -dict {PACKAGE_PIN AC12 IOSTANDARD LVCMOS33} [get_ports UART_rxd]
set_property  -dict {PACKAGE_PIN AC13 IOSTANDARD LVCMOS33} [get_ports UART_txd]

# LEDs
set_property  -dict {PACKAGE_PIN AA12 IOSTANDARD LVCMOS25} [get_ports {LEDS[0]}]
set_property -dict {PACKAGE_PIN Y13 IOSTANDARD LVCMOS25} [get_ports {LEDS[1]}]
set_property -dict {PACKAGE_PIN AV11 IOSTANDARD LVCMOS18} [get_ports {LEDS[2]}]
#set_property -dict {PACKAGE_PIN AU11 IOSTANDARD LVCMOS18} [get_ports {LEDS[3]}]

# Switches
set_property -dict {PACKAGE_PIN W14 IOSTANDARD LVCMOS25} [get_ports {SWITCHES[0]}]
set_property -dict {PACKAGE_PIN Y14 IOSTANDARD LVCMOS25} [get_ports {SWITCHES[1]}]
set_property -dict {PACKAGE_PIN AA13 IOSTANDARD LVCMOS25} [get_ports {SWITCHES[2]}]
set_property -dict {PACKAGE_PIN AB12 IOSTANDARD LVCMOS25} [get_ports {SWITCHES[3]}]

# PushButton
set_property -dict {PACKAGE_PIN AB14 IOSTANDARD LVCMOS25} [get_ports PUSHBUTTON]

# PMOD1
set_property -dict {PACKAGE_PIN L12 IOSTANDARD LVCMOS33} [get_ports {PMOD1_tri_io[0]}]
set_property -dict {PACKAGE_PIN M13 IOSTANDARD LVCMOS33} [get_ports {PMOD1_tri_io[1]}]
set_property -dict {PACKAGE_PIN L13 IOSTANDARD LVCMOS33} [get_ports {PMOD1_tri_io[2]}]
set_property -dict {PACKAGE_PIN M12 IOSTANDARD LVCMOS33} [get_ports {PMOD1_tri_io[3]}]
set_property -dict {PACKAGE_PIN M14 IOSTANDARD LVCMOS33} [get_ports {PMOD1_tri_io[4]}]
set_property -dict {PACKAGE_PIN N13 IOSTANDARD LVCMOS33} [get_ports {PMOD1_tri_io[5]}]
set_property -dict {PACKAGE_PIN K12 IOSTANDARD LVCMOS33} [get_ports {PMOD1_tri_io[6]}]
set_property -dict {PACKAGE_PIN N12 IOSTANDARD LVCMOS33} [get_ports {PMOD1_tri_io[7]}]

# PMOD2
set_property -dict {PACKAGE_PIN J14 IOSTANDARD LVCMOS33} [get_ports {PMOD2_tri_io[0]}]
set_property -dict {PACKAGE_PIN J15 IOSTANDARD LVCMOS33} [get_ports {PMOD2_tri_io[1]}]
set_property -dict {PACKAGE_PIN H14 IOSTANDARD LVCMOS33} [get_ports {PMOD2_tri_io[2]}]
set_property -dict {PACKAGE_PIN G14 IOSTANDARD LVCMOS33} [get_ports {PMOD2_tri_io[3]}]
set_property -dict {PACKAGE_PIN H13 IOSTANDARD LVCMOS33} [get_ports {PMOD2_tri_io[4]}]
set_property -dict {PACKAGE_PIN G13 IOSTANDARD LVCMOS33} [get_ports {PMOD2_tri_io[5]}]
set_property -dict {PACKAGE_PIN K13 IOSTANDARD LVCMOS33} [get_ports {PMOD2_tri_io[6]}]
set_property -dict {PACKAGE_PIN K14 IOSTANDARD LVCMOS33} [get_ports {PMOD2_tri_io[7]}]

# SYSMON
set_property -dict {PACKAGE_PIN R14 IOSTANDARD LVCMOS25} [get_ports {SYSMON_tri_io[0]}] ;# GPIO0
set_property -dict {PACKAGE_PIN R13 IOSTANDARD LVCMOS25} [get_ports {SYSMON_tri_io[1]}] ;# GPIO1
set_property -dict {PACKAGE_PIN T13 IOSTANDARD LVCMOS25} [get_ports {SYSMON_tri_io[2]}] ;# GPIO2
set_property -dict {PACKAGE_PIN T12 IOSTANDARD LVCMOS25} [get_ports {SYSMON_tri_io[3]}] ;# GPIO3
set_property -dict {PACKAGE_PIN P12 IOSTANDARD LVCMOS25} [get_ports {SYSMON_tri_io[4]}] ;# AUX0_N
set_property -dict {PACKAGE_PIN R12 IOSTANDARD LVCMOS25} [get_ports {SYSMON_tri_io[5]}] ;# AUX0_P
set_property -dict {PACKAGE_PIN P14 IOSTANDARD LVCMOS25} [get_ports {SYSMON_tri_io[6]}] ;# AUX1_N
set_property -dict {PACKAGE_PIN P15 IOSTANDARD LVCMOS25} [get_ports {SYSMON_tri_io[7]}] ;# AUX1_P

# micro SD card
#set_property  -dict {PACKAGE_PIN AV18  IOSTANDARD LVCMOS18} [get_ports {SD_CD}]
#set_property  -dict {PACKAGE_PIN AN19  IOSTANDARD LVCMOS18} [get_ports {SD_CLK}]
#set_property  -dict {PACKAGE_PIN AN17  IOSTANDARD LVCMOS18} [get_ports {SD_CMD[0]}]
#set_property  -dict {PACKAGE_PIN AN18  IOSTANDARD LVCMOS18} [get_ports {SD_DATA[0]}]
#set_property  -dict {PACKAGE_PIN AM19  IOSTANDARD LVCMOS18} [get_ports {SD_DATA[1]}]
#set_property  -dict {PACKAGE_PIN AN16  IOSTANDARD LVCMOS18} [get_ports {SD_DATA[2]}]
#set_property  -dict {PACKAGE_PIN AM18  IOSTANDARD LVCMOS18} [get_ports {SD_DATA[3]}]

# PCIE x1 (PCIE Root)
#set_property -dict {PACKAGE_PIN AE9} [get_ports PCIE_REF100CLK_clk_n]
#set_property -dict {PACKAGE_PIN AE10} [get_ports PCIE_REF100CLK_clk_p]

#set_property -dict {PACKAGE_PIN AE1} [get_ports PCIE_rxn[0]]
#set_property -dict {PACKAGE_PIN AE2} [get_ports PCIE_rxp[0]]
#set_property -dict {PACKAGE_PIN AE5} [get_ports PCIE_txn[0]]
#set_property -dict {PACKAGE_PIN AE6} [get_ports PCIE_txp[0]]

#set_property -dict {PACKAGE_PIN AH13 IOSTANDARD LVCMOS33} [get_ports {PCIE_PERST_n[0]}]

# HDMI out
set_property  -dict {PACKAGE_PIN L17  IOSTANDARD LVDS} [get_ports {HDMI_TX_CLKN}]
set_property  -dict {PACKAGE_PIN M18  IOSTANDARD LVDS} [get_ports {HDMI_TX_CLKP}]

set_property  -dict {PACKAGE_PIN AC14  IOSTANDARD LVCMOS33} [get_ports {HDMI_TX_HPD}]
set_property  -dict {PACKAGE_PIN N14  IOSTANDARD LVCMOS33 PULLTYPE PULLUP} [get_ports {HDMI_TX_I2C_scl_io}]
set_property  -dict {PACKAGE_PIN P16  IOSTANDARD LVCMOS33 PULLTYPE PULLUP} [get_ports {HDMI_TX_I2C_sda_io}]

set_property  -dict {PACKAGE_PIN M15  IOSTANDARD LVCMOS33 PULLTYPE PULLUP} [get_ports {HDMI_TX_SRC_scl_io}]
set_property  -dict {PACKAGE_PIN N16  IOSTANDARD LVCMOS33 PULLTYPE PULLUP} [get_ports {HDMI_TX_SRC_sda_io}]

set_property  PACKAGE_PIN AH7 [get_ports {HDMI_TXN[0]}]
set_property  PACKAGE_PIN AH8 [get_ports {HDMI_TXP[0]}]

set_property  PACKAGE_PIN AG5 [get_ports {HDMI_TXN[1]}]
set_property  PACKAGE_PIN AG6 [get_ports {HDMI_TXP[1]}]

set_property  PACKAGE_PIN AF7 [get_ports {HDMI_TXN[2]}]
set_property  PACKAGE_PIN AF8 [get_ports {HDMI_TXP[2]}]

set_property  PACKAGE_PIN AC9 [get_ports {HDMI_TX_REFCLK_clk_n[0]}]
set_property  PACKAGE_PIN AC10 [get_ports {HDMI_TX_REFCLK_clk_p[0]}]

# HDMI in
set_property PACKAGE_PIN AA10 [get_ports HDMI_RX_DRU_CLK_clk_p[0]]
set_property PACKAGE_PIN AG10 [get_ports HDMI_RX_CLK_P];

set_property PACKAGE_PIN AH4 [get_ports {HDMI_RX_DATA_P[0]}];
set_property PACKAGE_PIN AG2 [get_ports {HDMI_RX_DATA_P[1]}];
set_property PACKAGE_PIN AF4 [get_ports {HDMI_RX_DATA_P[2]}];

set_property -dict {PACKAGE_PIN L15 IOSTANDARD LVCMOS33 PULLTYPE PULLUP} [get_ports HDMI_RX_DDC_scl_io]
set_property -dict {PACKAGE_PIN L16 IOSTANDARD LVCMOS33 PULLTYPE PULLUP} [get_ports HDMI_RX_DDC_sda_io]

# PL DDR4
# Referece 200 MHz clock
#create_clock -period 5.000 -name pl_ddr4_clk [get_ports PL_DDR4_CLK_clk_p]

set_property -dict {PACKAGE_PIN F31 IOSTANDARD DIFF_SSTL12} [get_ports PL_DDR4_CLK_clk_n]
set_property -dict {PACKAGE_PIN F30 IOSTANDARD DIFF_SSTL12} [get_ports PL_DDR4_CLK_clk_p]

# Address Bus
set_property -dict {PACKAGE_PIN C31 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[0]}]
set_property -dict {PACKAGE_PIN D32 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[1]}]
set_property -dict {PACKAGE_PIN J31 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[2]}]
set_property -dict {PACKAGE_PIN C33 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[3]}]
set_property -dict {PACKAGE_PIN J30 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[4]}]
set_property -dict {PACKAGE_PIN D31 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[5]}]
set_property -dict {PACKAGE_PIN D34 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[6]}]
set_property -dict {PACKAGE_PIN E32 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[7]}]
set_property -dict {PACKAGE_PIN H31 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[8]}]
set_property -dict {PACKAGE_PIN J29 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[9]}]
set_property -dict {PACKAGE_PIN D30 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[10]}]
set_property -dict {PACKAGE_PIN G33 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[11]}]
set_property -dict {PACKAGE_PIN B34 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[12]}]
set_property -dict {PACKAGE_PIN A35 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[13]}]
set_property -dict {PACKAGE_PIN B31 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[14]}]
set_property -dict {PACKAGE_PIN B35 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[15]}]
set_property -dict {PACKAGE_PIN A36 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_adr[16]}]

set_property -dict {PACKAGE_PIN A37 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_ba[0]}]
set_property -dict {PACKAGE_PIN A33 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_ba[1]}]
set_property -dict {PACKAGE_PIN C34 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_bg[0]}]
set_property -dict {PACKAGE_PIN G30 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_bg[1]}]

# Control Lines
set_property -dict {PACKAGE_PIN E33 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports PL_DDR4_act_n]
set_property -dict {PACKAGE_PIN G29 IOSTANDARD DIFF_SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_ck_c[0]}]
set_property -dict {PACKAGE_PIN H29 IOSTANDARD DIFF_SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_ck_t[0]}]
#set_property -dict {PACKAGE_PIN E30 IOSTANDARD DIFF_SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_ck_c[1]}]
#set_property -dict {PACKAGE_PIN E29 IOSTANDARD DIFF_SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_ck_t[1]}]
set_property -dict {PACKAGE_PIN G31 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_cke[0]}]
#set_property -dict {PACKAGE_PIN H32 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_cke[1]}]
set_property -dict {PACKAGE_PIN A32 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_cs_n[0]}]
#set_property -dict {PACKAGE_PIN D29 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_cs_n[1]}]
#set_property -dict {PACKAGE_PIN B33 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_cs_n[2]}]
#set_property -dict {PACKAGE_PIN A30 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_cs_n[3]}]
set_property -dict {PACKAGE_PIN A31 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_odt[0]}]
#set_property -dict {PACKAGE_PIN B30 IOSTANDARD SSTL12_DCI SLEW FAST} [get_ports {PL_DDR4_odt[1]}]
set_property -dict {PACKAGE_PIN K34 IOSTANDARD LVCMOS12 SLEW FAST} [get_ports PL_DDR4_reset_n]

# Data Bus
set_property -dict {PACKAGE_PIN J39 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_c[0]}]
set_property -dict {PACKAGE_PIN K39 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_t[0]}]
set_property -dict {PACKAGE_PIN M38 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dm_n[0]}]

set_property -dict {PACKAGE_PIN H34 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_c[1]}]
set_property -dict {PACKAGE_PIN H33 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_t[1]}]
set_property -dict {PACKAGE_PIN M34 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dm_n[1]}]

set_property -dict {PACKAGE_PIN F38 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_c[2]}]
set_property -dict {PACKAGE_PIN G38 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_t[2]}]
set_property -dict {PACKAGE_PIN G35 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dm_n[2]}]

set_property -dict {PACKAGE_PIN B36 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_c[3]}]
set_property -dict {PACKAGE_PIN C36 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_t[3]}]
set_property -dict {PACKAGE_PIN E38 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dm_n[3]}]

set_property -dict {PACKAGE_PIN A26 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_c[4]}]
set_property -dict {PACKAGE_PIN B26 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_t[4]}]
set_property -dict {PACKAGE_PIN D27 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dm_n[4]}]

set_property -dict {PACKAGE_PIN J26 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_c[5]}]
set_property -dict {PACKAGE_PIN J25 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_t[5]}]
set_property -dict {PACKAGE_PIN L25 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dm_n[5]}]

set_property -dict {PACKAGE_PIN E25 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_c[6]}]
set_property -dict {PACKAGE_PIN F25 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_t[6]}]
set_property -dict {PACKAGE_PIN G28 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dm_n[6]}]

set_property -dict {PACKAGE_PIN M25 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_c[7]}]
set_property -dict {PACKAGE_PIN M24 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_t[7]}]
set_property -dict {PACKAGE_PIN R25 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dm_n[7]}]

#set_property -dict {PACKAGE_PIN L30 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_c[8]}]
#set_property -dict {PACKAGE_PIN M29 IOSTANDARD DIFF_POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dqs_t[8]}]
#set_property -dict {PACKAGE_PIN M31 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dm_n[8]}]

set_property -dict {PACKAGE_PIN L38 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[0]}]
set_property -dict {PACKAGE_PIN K38 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[1]}]
set_property -dict {PACKAGE_PIN L36 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[2]}]
set_property -dict {PACKAGE_PIN H38 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[3]}]
set_property -dict {PACKAGE_PIN M36 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[4]}]
set_property -dict {PACKAGE_PIN L37 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[5]}]
set_property -dict {PACKAGE_PIN H37 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[6]}]
set_property -dict {PACKAGE_PIN K37 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[7]}]
set_property -dict {PACKAGE_PIN K35 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[8]}]
set_property -dict {PACKAGE_PIN J34 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[9]}]
set_property -dict {PACKAGE_PIN J36 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[10]}]
set_property -dict {PACKAGE_PIN K33 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[11]}]
set_property -dict {PACKAGE_PIN L35 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[12]}]
set_property -dict {PACKAGE_PIN L33 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[13]}]
set_property -dict {PACKAGE_PIN H36 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[14]}]
set_property -dict {PACKAGE_PIN J35 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[15]}]
set_property -dict {PACKAGE_PIN G39 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[16]}]
set_property -dict {PACKAGE_PIN E37 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[17]}]
set_property -dict {PACKAGE_PIN E34 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[18]}]
set_property -dict {PACKAGE_PIN E35 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[19]}]
set_property -dict {PACKAGE_PIN H39 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[20]}]
set_property -dict {PACKAGE_PIN F37 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[21]}]
set_property -dict {PACKAGE_PIN F35 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[22]}]
set_property -dict {PACKAGE_PIN F36 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[23]}]
set_property -dict {PACKAGE_PIN D37 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[24]}]
set_property -dict {PACKAGE_PIN A38 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[25]}]
set_property -dict {PACKAGE_PIN D35 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[26]}]
set_property -dict {PACKAGE_PIN C37 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[27]}]
set_property -dict {PACKAGE_PIN D39 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[28]}]
set_property -dict {PACKAGE_PIN C39 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[29]}]
set_property -dict {PACKAGE_PIN D36 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[30]}]
set_property -dict {PACKAGE_PIN B38 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[31]}]
set_property -dict {PACKAGE_PIN C29 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[32]}]
set_property -dict {PACKAGE_PIN A27 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[33]}]
set_property -dict {PACKAGE_PIN B25 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[34]}]
set_property -dict {PACKAGE_PIN B28 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[35]}]
set_property -dict {PACKAGE_PIN B29 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[36]}]
set_property -dict {PACKAGE_PIN C28 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[37]}]
set_property -dict {PACKAGE_PIN A25 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[38]}]
set_property -dict {PACKAGE_PIN A28 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[39]}]
set_property -dict {PACKAGE_PIN H26 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[40]}]
set_property -dict {PACKAGE_PIN J27 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[41]}]
set_property -dict {PACKAGE_PIN K24 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[42]}]
set_property -dict {PACKAGE_PIN K28 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[43]}]
set_property -dict {PACKAGE_PIN H27 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[44]}]
set_property -dict {PACKAGE_PIN H28 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[45]}]
set_property -dict {PACKAGE_PIN K27 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[46]}]
set_property -dict {PACKAGE_PIN J24 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[47]}]
set_property -dict {PACKAGE_PIN G25 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[48]}]
set_property -dict {PACKAGE_PIN D25 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[49]}]
set_property -dict {PACKAGE_PIN E27 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[50]}]
set_property -dict {PACKAGE_PIN F26 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[51]}]
set_property -dict {PACKAGE_PIN G24 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[52]}]
set_property -dict {PACKAGE_PIN G26 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[53]}]
set_property -dict {PACKAGE_PIN E28 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[54]}]
set_property -dict {PACKAGE_PIN D26 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[55]}]
set_property -dict {PACKAGE_PIN L26 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[56]}]
set_property -dict {PACKAGE_PIN M26 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[57]}]
set_property -dict {PACKAGE_PIN N27 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[58]}]
set_property -dict {PACKAGE_PIN P27 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[59]}]
set_property -dict {PACKAGE_PIN M28 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[60]}]
set_property -dict {PACKAGE_PIN L28 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[61]}]
set_property -dict {PACKAGE_PIN N26 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[62]}]
set_property -dict {PACKAGE_PIN P26 IOSTANDARD POD12_DCI SLEW FAST} [get_ports {PL_DDR4_dq[63]}]

set_property DATA_RATE DDR [get_ports {{PL_DDR4_dm_n[*]} {PL_DDR4_dq[*]} {PL_DDR4_dqs_t[*]} {PL_DDR4_dqs_c[*]} {PL_DDR4_ck_t[*]} {PL_DDR4_ck_c[*]}}]
set_property DATA_RATE SDR [get_ports {{PL_DDR4_adr[*]} PL_DDR4_act_n {PL_DDR4_ba[*]} {PL_DDR4_bg[*]} {PL_DDR4_cke[*]} {PL_DDR4_odt[*]} {PL_DDR4_cs_n[*]}}]

## Status: init calibration LED
set_property -dict {PACKAGE_PIN AU11 IOSTANDARD LVCMOS18} [get_ports PL_DDR4_CALIB_LED]

################
# Clock Groups #
################

# There is no defined phase relationship, hence they are treated as asynchronous
set_clock_groups -asynchronous -group [get_clocks -of [get_pins */clk_wiz_0/inst/mmcme4_adv_inst/CLKOUT0]] \
                               -group [get_clocks -of [get_pins */clk_wiz_0/inst/mmcme4_adv_inst/CLKOUT1]] \
                               -group [get_clocks -of [get_pins */clk_wiz_0/inst/mmcme4_adv_inst/CLKOUT2]] \
                               -group [get_clocks "mdio1_mdc_clock"]
                               
create_clock -name video_clk -period 3.367 [get_pins *_i/HDMI_TX/v_hdmi_tx_ss_0/inst/v_tc/clk]
create_clock -name s_axi_aclk -period 20 [get_pins *_i/HDMI_TX/v_hdmi_tx_ss_0/inst/v_tc/s_axi_aclk]