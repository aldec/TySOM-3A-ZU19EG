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

################################################################################################
######################################### FMC1 CONNECTOR #######################################
################################################################################################

# FMC1 GPIO 1:
set_property  -dict {PACKAGE_PIN AU8  IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[0]}]
set_property  -dict {PACKAGE_PIN AT8  IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[1]}]
set_property  -dict {PACKAGE_PIN AP16 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[2]}]
set_property  -dict {PACKAGE_PIN AP17 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[3]}]
set_property  -dict {PACKAGE_PIN AR4  IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[4]}]
set_property  -dict {PACKAGE_PIN AR5  IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[5]}]
set_property  -dict {PACKAGE_PIN AJ10 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[6]}]
set_property  -dict {PACKAGE_PIN AJ11 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[7]}]
set_property  -dict {PACKAGE_PIN AN13 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[8]}]
set_property  -dict {PACKAGE_PIN AM13 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[9]}]
set_property  -dict {PACKAGE_PIN AK19 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[10]}]
set_property  -dict {PACKAGE_PIN AJ19 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[11]}]
set_property  -dict {PACKAGE_PIN AV13 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[12]}]
set_property  -dict {PACKAGE_PIN AU13 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[13]}]
set_property  -dict {PACKAGE_PIN AL10 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[14]}]
set_property  -dict {PACKAGE_PIN AK10 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[15]}]
set_property  -dict {PACKAGE_PIN AN11 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[16]}]
set_property  -dict {PACKAGE_PIN AN12 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[17]}]
set_property  -dict {PACKAGE_PIN AL12 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[18]}]
set_property  -dict {PACKAGE_PIN AK12 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[19]}]
set_property  -dict {PACKAGE_PIN AP4  IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[20]}]
set_property  -dict {PACKAGE_PIN AP5  IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[21]}]
set_property  -dict {PACKAGE_PIN AT12 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[22]}]
set_property  -dict {PACKAGE_PIN AT13 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[23]}]
set_property  -dict {PACKAGE_PIN AR10 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[24]}]
set_property  -dict {PACKAGE_PIN AP11 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[25]}]
set_property  -dict {PACKAGE_PIN AK8  IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[26]}]
set_property  -dict {PACKAGE_PIN AK9  IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[27]}]
set_property  -dict {PACKAGE_PIN AP9 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[28]}]
set_property  -dict {PACKAGE_PIN AP10 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[29]}]
set_property  -dict {PACKAGE_PIN AP14 IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[30]}]
set_property  -dict {PACKAGE_PIN AN14  IOSTANDARD LVCMOS18} [get_ports {FMC1_1_tri_io[31]}]

# FMC1 GPIO 2:
set_property  -dict {PACKAGE_PIN AN9  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[0]}]
set_property  -dict {PACKAGE_PIN AM9  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[1]}]
set_property  -dict {PACKAGE_PIN AL7  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[2]}]
set_property  -dict {PACKAGE_PIN AL8  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[3]}]
set_property  -dict {PACKAGE_PIN AV16 IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[4]}]
set_property  -dict {PACKAGE_PIN AU16 IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[5]}]
set_property  -dict {PACKAGE_PIN AW14 IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[6]}]
set_property  -dict {PACKAGE_PIN AW15 IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[7]}]
set_property  -dict {PACKAGE_PIN AV14 IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[8]}]
set_property  -dict {PACKAGE_PIN AU14 IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[9]}]
set_property  -dict {PACKAGE_PIN AU15 IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[10]}]
set_property  -dict {PACKAGE_PIN AT15 IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[11]}]
set_property  -dict {PACKAGE_PIN R33  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[12]}] ;# HB00_HB03_N
set_property  -dict {PACKAGE_PIN V27  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[13]}] ;# HB00_HB03_N
set_property  -dict {PACKAGE_PIN R32  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[14]}] ;# HB00_HB03_P
set_property  -dict {PACKAGE_PIN V26  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[15]}] ;# HB00_HB03_P
set_property  -dict {PACKAGE_PIN T32  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[16]}] ;# HB02_HB05_N
set_property  -dict {PACKAGE_PIN U35  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[17]}] ;# HB02_HB05_N
set_property  -dict {PACKAGE_PIN T31  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[18]}] ;# HB02_HB05_P
set_property  -dict {PACKAGE_PIN U34  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[19]}] ;# HB02_HB05_P
set_property  -dict {PACKAGE_PIN V29  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[20]}] ;# HB04_HB07_N
set_property  -dict {PACKAGE_PIN N34  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[21]}] ;# HB04_HB07_N
set_property  -dict {PACKAGE_PIN V28  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[22]}] ;# HB04_HB07_P
set_property  -dict {PACKAGE_PIN N33  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[23]}] ;# HB04_HB07_P
set_property  -dict {PACKAGE_PIN N36  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[24]}] ;# HB01_HB08_N
set_property  -dict {PACKAGE_PIN T36  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[25]}] ;# HB01_HB08_N
set_property  -dict {PACKAGE_PIN P36  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[26]}] ;# HB01_HB08_P
set_property  -dict {PACKAGE_PIN U36  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[27]}] ;# HB01_HB08_P
set_property  -dict {PACKAGE_PIN R30  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[28]}] ;# HB06_HB09_N
set_property  -dict {PACKAGE_PIN P35  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[29]}] ;# HB06_HB09_N
set_property  -dict {PACKAGE_PIN T30  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[30]}] ;# HB06_HB09_P
set_property  -dict {PACKAGE_PIN P34  IOSTANDARD LVCMOS18} [get_ports {FMC1_2_tri_io[31]}] ;# HB06_HB09_P

# FMC1 GPIO 3:
set_property  -dict {PACKAGE_PIN AN3  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[0]}] ;# HA22
set_property  -dict {PACKAGE_PIN AN4  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[1]}] ;# HA22
set_property  -dict {PACKAGE_PIN AU18 IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[2]}] ;# HA23
set_property  -dict {PACKAGE_PIN AU19 IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[3]}] ;# HA23
set_property  -dict {PACKAGE_PIN U31  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[4]}]
set_property  -dict {PACKAGE_PIN U30  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[5]}]
set_property  -dict {PACKAGE_PIN T28  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[6]}]
set_property  -dict {PACKAGE_PIN T27  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[7]}]
set_property  -dict {PACKAGE_PIN P37  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[8]}]
set_property  -dict {PACKAGE_PIN R37  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[9]}]
set_property  -dict {PACKAGE_PIN R27  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[10]}]
set_property  -dict {PACKAGE_PIN T26  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[11]}]
set_property  -dict {PACKAGE_PIN P39  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[12]}]
set_property  -dict {PACKAGE_PIN R39  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[13]}]
set_property  -dict {PACKAGE_PIN R38  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[14]}]
set_property  -dict {PACKAGE_PIN T37  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[15]}]
set_property  -dict {PACKAGE_PIN P29  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[16]}]
set_property  -dict {PACKAGE_PIN R29  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[17]}]
set_property  -dict {PACKAGE_PIN R35  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[18]}]
set_property  -dict {PACKAGE_PIN R34  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[19]}]
set_property  -dict {PACKAGE_PIN T38  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[20]}]
set_property  -dict {PACKAGE_PIN U38  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[21]}]
set_property  -dict {PACKAGE_PIN P32  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[22]}]
set_property  -dict {PACKAGE_PIN P31  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[23]}]
set_property  -dict {PACKAGE_PIN N39  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[24]}]
set_property  -dict {PACKAGE_PIN N38  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[25]}]
set_property  -dict {PACKAGE_PIN U39  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[26]}]
set_property  -dict {PACKAGE_PIN V39  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[27]}]
set_property  -dict {PACKAGE_PIN AV7  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[28]}]
set_property  -dict {PACKAGE_PIN AV8  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[29]}]
set_property  -dict {PACKAGE_PIN AU5  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[30]}]
set_property  -dict {PACKAGE_PIN AU6  IOSTANDARD LVCMOS18} [get_ports {FMC1_3_tri_io[31]}]

# FMC1 GPIO 4:
set_property  -dict {PACKAGE_PIN AM11 IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[0]}]
set_property  -dict {PACKAGE_PIN AL11 IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[1]}]
set_property  -dict {PACKAGE_PIN AL18 IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[2]}]
set_property  -dict {PACKAGE_PIN AK18 IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[3]}]
set_property  -dict {PACKAGE_PIN AJ16 IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[4]}]
set_property  -dict {PACKAGE_PIN AJ17 IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[5]}]
set_property  -dict {PACKAGE_PIN AL17 IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[6]}]
set_property  -dict {PACKAGE_PIN AK17 IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[7]}]
set_property  -dict {PACKAGE_PIN AL15 IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[8]}]
set_property  -dict {PACKAGE_PIN AL16 IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[9]}]
set_property  -dict {PACKAGE_PIN AK3  IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[10]}]
set_property  -dict {PACKAGE_PIN AK4  IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[11]}]
set_property  -dict {PACKAGE_PIN AL5  IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[12]}]
set_property  -dict {PACKAGE_PIN AK5  IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[13]}]
set_property  -dict {PACKAGE_PIN AW12 IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[14]}]
set_property  -dict {PACKAGE_PIN AV12 IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[15]}]
set_property  -dict {PACKAGE_PIN AR12 IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[16]}]
set_property  -dict {PACKAGE_PIN AR13 IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[17]}]
set_property  -dict {PACKAGE_PIN AM3  IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[18]}]
set_property  -dict {PACKAGE_PIN AL3  IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[19]}]
set_property  -dict {PACKAGE_PIN AM14 IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[20]}]
set_property  -dict {PACKAGE_PIN AM15 IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[21]}]
set_property  -dict {PACKAGE_PIN AN1  IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[22]}]
set_property  -dict {PACKAGE_PIN AN2  IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[23]}]
set_property  -dict {PACKAGE_PIN AP1  IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[24]}]
set_property  -dict {PACKAGE_PIN AP2  IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[25]}]
set_property  -dict {PACKAGE_PIN AL1  IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[26]}]
set_property  -dict {PACKAGE_PIN AK1  IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[27]}]
set_property  -dict {PACKAGE_PIN AL2  IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[28]}]
set_property  -dict {PACKAGE_PIN AK2  IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[29]}]
set_property  -dict {PACKAGE_PIN AN6  IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[30]}]
set_property  -dict {PACKAGE_PIN AM6  IOSTANDARD LVCMOS18} [get_ports {FMC1_4_tri_io[31]}]

# FMC1 GPIO 5:
set_property  -dict {PACKAGE_PIN AM5  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[0]}]
set_property  -dict {PACKAGE_PIN AL6  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[1]}]
set_property  -dict {PACKAGE_PIN AW6  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[2]}]
set_property  -dict {PACKAGE_PIN AW7  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[3]}]
set_property  -dict {PACKAGE_PIN AP6  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[4]}]
set_property  -dict {PACKAGE_PIN AP7  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[5]}]
set_property  -dict {PACKAGE_PIN AT7  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[6]}]
set_property  -dict {PACKAGE_PIN AR7  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[7]}]
set_property  -dict {PACKAGE_PIN AW5  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[8]}]
set_property  -dict {PACKAGE_PIN AV6  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[9]}]
set_property  -dict {PACKAGE_PIN AU10 IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[10]}]
set_property  -dict {PACKAGE_PIN AT10 IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[11]}]
set_property  -dict {PACKAGE_PIN AV4  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[12]}]
set_property  -dict {PACKAGE_PIN AU4  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[13]}]
set_property  -dict {PACKAGE_PIN AU1  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[14]}]
set_property  -dict {PACKAGE_PIN AT1  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[15]}]
set_property  -dict {PACKAGE_PIN AT2  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[16]}]
set_property  -dict {PACKAGE_PIN AR2  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[17]}]
set_property  -dict {PACKAGE_PIN AW16 IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[18]}]
set_property  -dict {PACKAGE_PIN AW17 IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[19]}]
set_property  -dict {PACKAGE_PIN AV2  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[20]}]
set_property  -dict {PACKAGE_PIN AU2  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[21]}]
set_property  -dict {PACKAGE_PIN AT3  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[22]}]
set_property  -dict {PACKAGE_PIN AR3  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[23]}]
set_property  -dict {PACKAGE_PIN AW10 IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[24]}]
set_property  -dict {PACKAGE_PIN AW11 IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[25]}]
set_property  -dict {PACKAGE_PIN AW3  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[26]}]
set_property  -dict {PACKAGE_PIN AV3  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[27]}]
set_property  -dict {PACKAGE_PIN AW9  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[28]}]
set_property  -dict {PACKAGE_PIN AV9  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[29]}]
set_property  -dict {PACKAGE_PIN AR8  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[30]}]
set_property  -dict {PACKAGE_PIN AR9  IOSTANDARD LVCMOS18} [get_ports {FMC1_5_tri_io[31]}]

# FMC1 GPIO 6:
set_property  -dict {PACKAGE_PIN W12  IOSTANDARD LVCMOS25} [get_ports {FMC1_6_tri_io[0]}]
set_property  -dict {PACKAGE_PIN Y12  IOSTANDARD LVCMOS25} [get_ports {FMC1_6_tri_io[1]}]
set_property  -dict {PACKAGE_PIN U14  IOSTANDARD LVCMOS25} [get_ports {FMC1_6_tri_io[2]}]
set_property  -dict {PACKAGE_PIN V14  IOSTANDARD LVCMOS25} [get_ports {FMC1_6_tri_io[3]}]
set_property  -dict {PACKAGE_PIN AN7  IOSTANDARD LVCMOS18} [get_ports {FMC1_6_tri_io[4]}]
set_property  -dict {PACKAGE_PIN AN8  IOSTANDARD LVCMOS18} [get_ports {FMC1_6_tri_io[5]}]
set_property  -dict {PACKAGE_PIN AT5  IOSTANDARD LVCMOS18} [get_ports {FMC1_6_tri_io[6]}]
set_property  -dict {PACKAGE_PIN AT6  IOSTANDARD LVCMOS18} [get_ports {FMC1_6_tri_io[7]}]
set_property  -dict {PACKAGE_PIN AP19 IOSTANDARD LVCMOS18} [get_ports {FMC1_6_tri_io[8]}]
set_property  -dict {PACKAGE_PIN AR14 IOSTANDARD LVCMOS18} [get_ports {FMC1_6_tri_io[9]}]

# FMC1 GPIO 7:
#set_property  -dict {PACKAGE_PIN Y7 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[0]}]
#set_property  -dict {PACKAGE_PIN W1 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[1]}]
#set_property  -dict {PACKAGE_PIN Y8 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[2]}]
#set_property  -dict {PACKAGE_PIN W2 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[3]}]
#set_property  -dict {PACKAGE_PIN Y3 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[4]}]
#set_property  -dict {PACKAGE_PIN W5 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[5]}]
#set_property  -dict {PACKAGE_PIN Y4 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[6]}]
#set_property  -dict {PACKAGE_PIN W6 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[7]}]
#set_property  -dict {PACKAGE_PIN V7 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[8]}]
#set_property  -dict {PACKAGE_PIN U1 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[9]}]
#set_property  -dict {PACKAGE_PIN V8 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[10]}]
#set_property  -dict {PACKAGE_PIN U2 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[11]}]
#set_property  -dict {PACKAGE_PIN V3 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[12]}]
#set_property  -dict {PACKAGE_PIN U5 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[13]}]
#set_property  -dict {PACKAGE_PIN V4 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[14]}]
#set_property  -dict {PACKAGE_PIN U6 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[15]}]
#set_property  -dict {PACKAGE_PIN T7 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[16]}]
#set_property  -dict {PACKAGE_PIN R1 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[17]}]
#set_property  -dict {PACKAGE_PIN T8 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[18]}]
#set_property  -dict {PACKAGE_PIN R2 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[19]}]
#set_property  -dict {PACKAGE_PIN T3 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[20]}]
#set_property  -dict {PACKAGE_PIN R5 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[21]}]
#set_property  -dict {PACKAGE_PIN T4 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[22]}]
#set_property  -dict {PACKAGE_PIN R6 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[23]}]
#set_property  -dict {PACKAGE_PIN P7 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[24]}]
#set_property  -dict {PACKAGE_PIN N1 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[25]}]
#set_property  -dict {PACKAGE_PIN P8 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[26]}]
#set_property  -dict {PACKAGE_PIN N2 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[27]}]
#set_property  -dict {PACKAGE_PIN P3 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[28]}]
#set_property  -dict {PACKAGE_PIN N5 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[29]}]
#set_property  -dict {PACKAGE_PIN P4 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[30]}]
#set_property  -dict {PACKAGE_PIN N6 IOSTANDARD LVCMOS18} [get_ports {FMC1_7_tri_io[31]}]

################################################################################################
######################################### FMC2 CONNECTOR #######################################
################################################################################################

# FMC2 GPIO 1:
set_property  -dict {PACKAGE_PIN F21 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[0]}]
set_property  -dict {PACKAGE_PIN F20 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[1]}]
set_property  -dict {PACKAGE_PIN G21  IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[2]}]
set_property  -dict {PACKAGE_PIN G20  IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[3]}]
set_property  -dict {PACKAGE_PIN G23 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[4]}]
set_property  -dict {PACKAGE_PIN H23 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[5]}]
set_property  -dict {PACKAGE_PIN F23 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[6]}]
set_property  -dict {PACKAGE_PIN F22 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[7]}]
set_property  -dict {PACKAGE_PIN D24 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[8]}]
set_property  -dict {PACKAGE_PIN E24 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[9]}]
set_property  -dict {PACKAGE_PIN E23 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[10]}]
set_property  -dict {PACKAGE_PIN E22 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[11]}]
set_property  -dict {PACKAGE_PIN B24 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[12]}]
set_property  -dict {PACKAGE_PIN C24 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[13]}]
set_property  -dict {PACKAGE_PIN F15 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[14]}]
set_property  -dict {PACKAGE_PIN F16 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[15]}]
set_property  -dict {PACKAGE_PIN E13 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[16]}]
set_property  -dict {PACKAGE_PIN E14 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[17]}]
set_property  -dict {PACKAGE_PIN B23 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[18]}]
set_property  -dict {PACKAGE_PIN C23 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[19]}]
set_property  -dict {PACKAGE_PIN K20 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[20]}]
set_property  -dict {PACKAGE_PIN L20 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[21]}]
set_property  -dict {PACKAGE_PIN N22 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[22]}]
set_property  -dict {PACKAGE_PIN N21 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[23]}]
set_property  -dict {PACKAGE_PIN A20 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[24]}]
set_property  -dict {PACKAGE_PIN B20 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[25]}]
set_property  -dict {PACKAGE_PIN C22 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[26]}]
set_property  -dict {PACKAGE_PIN C21 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[27]}]
set_property  -dict {PACKAGE_PIN G19 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[28]}]
set_property  -dict {PACKAGE_PIN H19 IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[29]}]
set_property  -dict {PACKAGE_PIN K9  IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[30]}]
set_property  -dict {PACKAGE_PIN L9  IOSTANDARD LVCMOS18} [get_ports {FMC2_1_tri_io[31]}]

# Solution for [DRC PDRC-203] 
set_property UNAVAILABLE_DURING_CALIBRATION TRUE [get_ports FMC2_1_tri_io[23]]

# FMC2 GPIO 2:
set_property  -dict {PACKAGE_PIN C18 IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[0]}]
set_property  -dict {PACKAGE_PIN C19 IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[1]}]
set_property  -dict {PACKAGE_PIN J4  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[2]}]
set_property  -dict {PACKAGE_PIN J5  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[3]}]
set_property  -dict {PACKAGE_PIN K18 IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[4]}]
set_property  -dict {PACKAGE_PIN L18 IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[5]}]
set_property  -dict {PACKAGE_PIN C13 IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[6]}]
set_property  -dict {PACKAGE_PIN C14 IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[7]}]
set_property  -dict {PACKAGE_PIN B14 IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[8]}]
set_property  -dict {PACKAGE_PIN B15 IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[9]}]
set_property  -dict {PACKAGE_PIN H16 IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[10]}]
set_property  -dict {PACKAGE_PIN J16 IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[11]}]
set_property  -dict {PACKAGE_PIN D6  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[12]}]
set_property  -dict {PACKAGE_PIN A11 IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[13]}]
set_property  -dict {PACKAGE_PIN D7  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[14]}]
set_property  -dict {PACKAGE_PIN A12 IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[15]}]
set_property  -dict {PACKAGE_PIN B3  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[16]}]
set_property  -dict {PACKAGE_PIN A2  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[17]}]
set_property  -dict {PACKAGE_PIN B4  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[18]}]
set_property  -dict {PACKAGE_PIN A3  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[19]}]
set_property  -dict {PACKAGE_PIN C2  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[20]}]
set_property  -dict {PACKAGE_PIN E2  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[21]}]
set_property  -dict {PACKAGE_PIN C3  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[22]}]
set_property  -dict {PACKAGE_PIN E3  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[23]}]
set_property  -dict {PACKAGE_PIN A6  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[24]}]
set_property  -dict {PACKAGE_PIN B1  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[25]}]
set_property  -dict {PACKAGE_PIN A7  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[26]}]
set_property  -dict {PACKAGE_PIN C1  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[27]}]
set_property  -dict {PACKAGE_PIN A10 IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[28]}]
set_property  -dict {PACKAGE_PIN C6  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[29]}]
set_property  -dict {PACKAGE_PIN B11 IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[30]}]
set_property  -dict {PACKAGE_PIN C7  IOSTANDARD LVCMOS18} [get_ports {FMC2_2_tri_io[31]}]

# FMC2 GPIO 3:
set_property  -dict {PACKAGE_PIN J17 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[0]}]
set_property  -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[1]}]
set_property  -dict {PACKAGE_PIN G10 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[2]}]
set_property  -dict {PACKAGE_PIN G11 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[3]}]
set_property  -dict {PACKAGE_PIN D5  IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[4]}]
set_property  -dict {PACKAGE_PIN E5  IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[5]}]
set_property  -dict {PACKAGE_PIN B5  IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[6]}]
set_property  -dict {PACKAGE_PIN B6  IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[7]}]
set_property  -dict {PACKAGE_PIN D4  IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[8]}]
set_property  -dict {PACKAGE_PIN E4  IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[9]}]
set_property  -dict {PACKAGE_PIN B9  IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[10]}]
set_property  -dict {PACKAGE_PIN B10 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[11]}]
set_property  -dict {PACKAGE_PIN C11 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[12]}]
set_property  -dict {PACKAGE_PIN C12 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[13]}]
set_property  -dict {PACKAGE_PIN D10 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[14]}]
set_property  -dict {PACKAGE_PIN D11 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[15]}]
set_property  -dict {PACKAGE_PIN E8  IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[16]}]
set_property  -dict {PACKAGE_PIN E9  IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[17]}]
set_property  -dict {PACKAGE_PIN B8  IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[18]}]
set_property  -dict {PACKAGE_PIN C8  IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[19]}]
set_property  -dict {PACKAGE_PIN D12 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[20]}]
set_property  -dict {PACKAGE_PIN E12 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[21]}]
set_property  -dict {PACKAGE_PIN F7  IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[22]}]
set_property  -dict {PACKAGE_PIN F8  IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[23]}]
set_property  -dict {PACKAGE_PIN F11 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[24]}]
set_property  -dict {PACKAGE_PIN F12 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[25]}]
set_property  -dict {PACKAGE_PIN E10 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[26]}]
set_property  -dict {PACKAGE_PIN F10 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[27]}]
set_property  -dict {PACKAGE_PIN E17 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[28]}]
set_property  -dict {PACKAGE_PIN E18 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[29]}]
set_property  -dict {PACKAGE_PIN C16 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[30]}]
set_property  -dict {PACKAGE_PIN C17 IOSTANDARD LVCMOS18} [get_ports {FMC2_3_tri_io[31]}]

# FMC2 GPIO 4:
set_property  -dict {PACKAGE_PIN A17 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[0]}]
set_property  -dict {PACKAGE_PIN A18 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[1]}]
set_property  -dict {PACKAGE_PIN A21 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[2]}]
set_property  -dict {PACKAGE_PIN B21 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[3]}]
set_property  -dict {PACKAGE_PIN J19 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[4]}]
set_property  -dict {PACKAGE_PIN K19 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[5]}]
set_property  -dict {PACKAGE_PIN G15 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[6]}]
set_property  -dict {PACKAGE_PIN G16 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[7]}]
set_property  -dict {PACKAGE_PIN D22 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[8]}]
set_property  -dict {PACKAGE_PIN D21 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[9]}]
set_property  -dict {PACKAGE_PIN J10 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[10]}]
set_property  -dict {PACKAGE_PIN K10 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[11]}]
set_property  -dict {PACKAGE_PIN J11 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[12]}]
set_property  -dict {PACKAGE_PIN J12 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[13]}]
set_property  -dict {PACKAGE_PIN B18 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[14]}]
set_property  -dict {PACKAGE_PIN B19 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[15]}]
set_property  -dict {PACKAGE_PIN D19 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[16]}]
set_property  -dict {PACKAGE_PIN E19 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[17]}]
set_property  -dict {PACKAGE_PIN K7  IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[18]}]
set_property  -dict {PACKAGE_PIN L7  IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[19]}]
set_property  -dict {PACKAGE_PIN K8  IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[20]}]
set_property  -dict {PACKAGE_PIN L8  IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[21]}]
set_property  -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[22]}]
set_property  -dict {PACKAGE_PIN N18 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[23]}]
set_property  -dict {PACKAGE_PIN A15 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[24]}]
set_property  -dict {PACKAGE_PIN A16 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[25]}]
set_property  -dict {PACKAGE_PIN H17 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[26]}]
set_property  -dict {PACKAGE_PIN H18 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[27]}]
set_property  -dict {PACKAGE_PIN A13 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[28]}]
set_property  -dict {PACKAGE_PIN B13 IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[29]}]
set_property  -dict {PACKAGE_PIN J6  IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[30]}]
set_property  -dict {PACKAGE_PIN J7  IOSTANDARD LVCMOS18} [get_ports {FMC2_4_tri_io[31]}]

# FMC2 GPIO 5:
set_property  -dict {PACKAGE_PIN K4  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[0]}]
set_property  -dict {PACKAGE_PIN K5  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[1]}]
set_property  -dict {PACKAGE_PIN F3  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[2]}]
set_property  -dict {PACKAGE_PIN G3  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[3]}]
set_property  -dict {PACKAGE_PIN D14 IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[4]}]
set_property  -dict {PACKAGE_PIN D15 IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[5]}]
set_property  -dict {PACKAGE_PIN L4  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[6]}]
set_property  -dict {PACKAGE_PIN L5  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[7]}]
set_property  -dict {PACKAGE_PIN G8  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[8]}]
set_property  -dict {PACKAGE_PIN G9  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[9]}]
set_property  -dict {PACKAGE_PIN H9  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[10]}]
set_property  -dict {PACKAGE_PIN J9  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[11]}]
set_property  -dict {PACKAGE_PIN G4  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[12]}]
set_property  -dict {PACKAGE_PIN G5  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[13]}]
set_property  -dict {PACKAGE_PIN F5  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[14]}]
set_property  -dict {PACKAGE_PIN F6  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[15]}]
set_property  -dict {PACKAGE_PIN H7  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[16]}]
set_property  -dict {PACKAGE_PIN H8  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[17]}]
set_property  -dict {PACKAGE_PIN L10 IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[18]}]
set_property  -dict {PACKAGE_PIN L11 IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[19]}]
set_property  -dict {PACKAGE_PIN H1  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[20]}]
set_property  -dict {PACKAGE_PIN H2  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[21]}]
set_property  -dict {PACKAGE_PIN H3  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[22]}]
set_property  -dict {PACKAGE_PIN H4  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[23]}]
set_property  -dict {PACKAGE_PIN J1  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[24]}]
set_property  -dict {PACKAGE_PIN J2  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[25]}]
set_property  -dict {PACKAGE_PIN F1  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[26]}]
set_property  -dict {PACKAGE_PIN F2  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[27]}]
set_property  -dict {PACKAGE_PIN L2  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[28]}]
set_property  -dict {PACKAGE_PIN L3  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[29]}]
set_property  -dict {PACKAGE_PIN K2  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[30]}]
set_property  -dict {PACKAGE_PIN K3  IOSTANDARD LVCMOS18} [get_ports {FMC2_5_tri_io[31]}]

# FMC2 GPIO 6:
set_property  -dict {PACKAGE_PIN U12 IOSTANDARD LVCMOS25} [get_ports {FMC2_6_tri_io[0]}]
set_property  -dict {PACKAGE_PIN V12 IOSTANDARD LVCMOS25} [get_ports {FMC2_6_tri_io[1]}]
set_property  -dict {PACKAGE_PIN D16 IOSTANDARD LVCMOS18} [get_ports {FMC2_6_tri_io[2]}]
set_property  -dict {PACKAGE_PIN D17 IOSTANDARD LVCMOS18} [get_ports {FMC2_6_tri_io[3]}]
set_property  -dict {PACKAGE_PIN G6  IOSTANDARD LVCMOS18} [get_ports {FMC2_6_tri_io[4]}]
set_property  -dict {PACKAGE_PIN H6  IOSTANDARD LVCMOS18} [get_ports {FMC2_6_tri_io[5]}]
set_property  -dict {PACKAGE_PIN C9  IOSTANDARD LVCMOS18} [get_ports {FMC2_6_tri_io[6]}]
set_property  -dict {PACKAGE_PIN D9  IOSTANDARD LVCMOS18} [get_ports {FMC2_6_tri_io[7]}]
set_property  -dict {PACKAGE_PIN L6  IOSTANDARD LVCMOS18} [get_ports {FMC2_6_tri_io[8]}]
set_property  -dict {PACKAGE_PIN L1  IOSTANDARD LVCMOS18} [get_ports {FMC2_6_tri_io[9]}]

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
                               -group [get_clocks -of [get_pins */clk_wiz_0/inst/mmcme4_adv_inst/CLKOUT2]]
                               
create_clock -name video_clk -period 3.367 [get_pins *_i/HDMI_TX/v_hdmi_tx_ss_0/inst/v_tc/clk]
create_clock -name s_axi_aclk -period 20 [get_pins *_i/HDMI_TX/v_hdmi_tx_ss_0/inst/v_tc/s_axi_aclk]