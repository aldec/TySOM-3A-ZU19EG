//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (lin64) Build 3064766 Wed Nov 18 09:12:47 MST 2020
//Date        : Wed Dec  9 13:10:11 2020
//Host        : dedal running 64-bit CentOS Linux release 7.8.2003 (Core)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (BT_EN,
    BT_HCI_CTS,
    BT_HCI_RTS,
    BT_HCI_RX,
    BT_HCI_TX,
    ETH1_MDIO_mdc,
    ETH1_MDIO_mdio_io,
    ETH1_RESET_n_tri_io,
    ETH1_RGMII_rd,
    ETH1_RGMII_rx_ctl,
    ETH1_RGMII_rxc,
    ETH1_RGMII_td,
    ETH1_RGMII_tx_ctl,
    ETH1_RGMII_txc,
    HDMI_RX_CLK_N,
    HDMI_RX_CLK_P,
    HDMI_RX_DATA_N,
    HDMI_RX_DATA_P,
    HDMI_RX_DDC_scl_io,
    HDMI_RX_DDC_sda_io,
    HDMI_RX_DRU_CLK_clk_n,
    HDMI_RX_DRU_CLK_clk_p,
    HDMI_TXN,
    HDMI_TXP,
    HDMI_TX_CLKN,
    HDMI_TX_CLKP,
    HDMI_TX_HPD,
    HDMI_TX_I2C_scl_io,
    HDMI_TX_I2C_sda_io,
    HDMI_TX_REFCLK_clk_n,
    HDMI_TX_REFCLK_clk_p,
    HDMI_TX_SRC_scl_io,
    HDMI_TX_SRC_sda_io,
    LEDS,
    PL_DDR4_CALIB_LED,
    PL_DDR4_CLK_clk_n,
    PL_DDR4_CLK_clk_p,
    PL_DDR4_act_n,
    PL_DDR4_adr,
    PL_DDR4_ba,
    PL_DDR4_bg,
    PL_DDR4_ck_c,
    PL_DDR4_ck_t,
    PL_DDR4_cke,
    PL_DDR4_cs_n,
    PL_DDR4_dm_n,
    PL_DDR4_dq,
    PL_DDR4_dqs_c,
    PL_DDR4_dqs_t,
    PL_DDR4_odt,
    PL_DDR4_reset_n,
    PMOD1_tri_io,
    PMOD2_tri_io,
    PUSHBUTTON,
    SWITCHES,
    SYSMON_tri_io,
    UART_rxd,
    UART_txd,
    WLAN_EN);
  output [0:0]BT_EN;
  output BT_HCI_CTS;
  input BT_HCI_RTS;
  output BT_HCI_RX;
  input BT_HCI_TX;
  output ETH1_MDIO_mdc;
  inout ETH1_MDIO_mdio_io;
  inout [0:0]ETH1_RESET_n_tri_io;
  input [3:0]ETH1_RGMII_rd;
  input ETH1_RGMII_rx_ctl;
  input ETH1_RGMII_rxc;
  output [3:0]ETH1_RGMII_td;
  output ETH1_RGMII_tx_ctl;
  output ETH1_RGMII_txc;
  input HDMI_RX_CLK_N;
  input HDMI_RX_CLK_P;
  input [2:0]HDMI_RX_DATA_N;
  input [2:0]HDMI_RX_DATA_P;
  inout HDMI_RX_DDC_scl_io;
  inout HDMI_RX_DDC_sda_io;
  input [0:0]HDMI_RX_DRU_CLK_clk_n;
  input [0:0]HDMI_RX_DRU_CLK_clk_p;
  output [2:0]HDMI_TXN;
  output [2:0]HDMI_TXP;
  output HDMI_TX_CLKN;
  output HDMI_TX_CLKP;
  input HDMI_TX_HPD;
  inout HDMI_TX_I2C_scl_io;
  inout HDMI_TX_I2C_sda_io;
  input [0:0]HDMI_TX_REFCLK_clk_n;
  input [0:0]HDMI_TX_REFCLK_clk_p;
  inout HDMI_TX_SRC_scl_io;
  inout HDMI_TX_SRC_sda_io;
  output [2:0]LEDS;
  output PL_DDR4_CALIB_LED;
  input PL_DDR4_CLK_clk_n;
  input PL_DDR4_CLK_clk_p;
  output PL_DDR4_act_n;
  output [16:0]PL_DDR4_adr;
  output [1:0]PL_DDR4_ba;
  output [1:0]PL_DDR4_bg;
  output [0:0]PL_DDR4_ck_c;
  output [0:0]PL_DDR4_ck_t;
  output [0:0]PL_DDR4_cke;
  output [0:0]PL_DDR4_cs_n;
  inout [7:0]PL_DDR4_dm_n;
  inout [63:0]PL_DDR4_dq;
  inout [7:0]PL_DDR4_dqs_c;
  inout [7:0]PL_DDR4_dqs_t;
  output [0:0]PL_DDR4_odt;
  output PL_DDR4_reset_n;
  inout [7:0]PMOD1_tri_io;
  inout [7:0]PMOD2_tri_io;
  input [0:0]PUSHBUTTON;
  input [3:0]SWITCHES;
  inout [7:0]SYSMON_tri_io;
  input UART_rxd;
  output UART_txd;
  output [0:0]WLAN_EN;

  wire [0:0]BT_EN;
  wire BT_HCI_CTS;
  wire BT_HCI_RTS;
  wire BT_HCI_RX;
  wire BT_HCI_TX;
  wire ETH1_MDIO_mdc;
  wire ETH1_MDIO_mdio_i;
  wire ETH1_MDIO_mdio_io;
  wire ETH1_MDIO_mdio_o;
  wire ETH1_MDIO_mdio_t;
  wire [0:0]ETH1_RESET_n_tri_i_0;
  wire [0:0]ETH1_RESET_n_tri_io_0;
  wire [0:0]ETH1_RESET_n_tri_o_0;
  wire [0:0]ETH1_RESET_n_tri_t_0;
  wire [3:0]ETH1_RGMII_rd;
  wire ETH1_RGMII_rx_ctl;
  wire ETH1_RGMII_rxc;
  wire [3:0]ETH1_RGMII_td;
  wire ETH1_RGMII_tx_ctl;
  wire ETH1_RGMII_txc;
  wire HDMI_RX_CLK_N;
  wire HDMI_RX_CLK_P;
  wire [2:0]HDMI_RX_DATA_N;
  wire [2:0]HDMI_RX_DATA_P;
  wire HDMI_RX_DDC_scl_i;
  wire HDMI_RX_DDC_scl_io;
  wire HDMI_RX_DDC_scl_o;
  wire HDMI_RX_DDC_scl_t;
  wire HDMI_RX_DDC_sda_i;
  wire HDMI_RX_DDC_sda_io;
  wire HDMI_RX_DDC_sda_o;
  wire HDMI_RX_DDC_sda_t;
  wire [0:0]HDMI_RX_DRU_CLK_clk_n;
  wire [0:0]HDMI_RX_DRU_CLK_clk_p;
  wire [2:0]HDMI_TXN;
  wire [2:0]HDMI_TXP;
  wire HDMI_TX_CLKN;
  wire HDMI_TX_CLKP;
  wire HDMI_TX_HPD;
  wire HDMI_TX_I2C_scl_i;
  wire HDMI_TX_I2C_scl_io;
  wire HDMI_TX_I2C_scl_o;
  wire HDMI_TX_I2C_scl_t;
  wire HDMI_TX_I2C_sda_i;
  wire HDMI_TX_I2C_sda_io;
  wire HDMI_TX_I2C_sda_o;
  wire HDMI_TX_I2C_sda_t;
  wire [0:0]HDMI_TX_REFCLK_clk_n;
  wire [0:0]HDMI_TX_REFCLK_clk_p;
  wire HDMI_TX_SRC_scl_i;
  wire HDMI_TX_SRC_scl_io;
  wire HDMI_TX_SRC_scl_o;
  wire HDMI_TX_SRC_scl_t;
  wire HDMI_TX_SRC_sda_i;
  wire HDMI_TX_SRC_sda_io;
  wire HDMI_TX_SRC_sda_o;
  wire HDMI_TX_SRC_sda_t;
  wire [2:0]LEDS;
  wire PL_DDR4_CALIB_LED;
  wire PL_DDR4_CLK_clk_n;
  wire PL_DDR4_CLK_clk_p;
  wire PL_DDR4_act_n;
  wire [16:0]PL_DDR4_adr;
  wire [1:0]PL_DDR4_ba;
  wire [1:0]PL_DDR4_bg;
  wire [0:0]PL_DDR4_ck_c;
  wire [0:0]PL_DDR4_ck_t;
  wire [0:0]PL_DDR4_cke;
  wire [0:0]PL_DDR4_cs_n;
  wire [7:0]PL_DDR4_dm_n;
  wire [63:0]PL_DDR4_dq;
  wire [7:0]PL_DDR4_dqs_c;
  wire [7:0]PL_DDR4_dqs_t;
  wire [0:0]PL_DDR4_odt;
  wire PL_DDR4_reset_n;
  wire [0:0]PMOD1_tri_i_0;
  wire [1:1]PMOD1_tri_i_1;
  wire [2:2]PMOD1_tri_i_2;
  wire [3:3]PMOD1_tri_i_3;
  wire [4:4]PMOD1_tri_i_4;
  wire [5:5]PMOD1_tri_i_5;
  wire [6:6]PMOD1_tri_i_6;
  wire [7:7]PMOD1_tri_i_7;
  wire [0:0]PMOD1_tri_io_0;
  wire [1:1]PMOD1_tri_io_1;
  wire [2:2]PMOD1_tri_io_2;
  wire [3:3]PMOD1_tri_io_3;
  wire [4:4]PMOD1_tri_io_4;
  wire [5:5]PMOD1_tri_io_5;
  wire [6:6]PMOD1_tri_io_6;
  wire [7:7]PMOD1_tri_io_7;
  wire [0:0]PMOD1_tri_o_0;
  wire [1:1]PMOD1_tri_o_1;
  wire [2:2]PMOD1_tri_o_2;
  wire [3:3]PMOD1_tri_o_3;
  wire [4:4]PMOD1_tri_o_4;
  wire [5:5]PMOD1_tri_o_5;
  wire [6:6]PMOD1_tri_o_6;
  wire [7:7]PMOD1_tri_o_7;
  wire [0:0]PMOD1_tri_t_0;
  wire [1:1]PMOD1_tri_t_1;
  wire [2:2]PMOD1_tri_t_2;
  wire [3:3]PMOD1_tri_t_3;
  wire [4:4]PMOD1_tri_t_4;
  wire [5:5]PMOD1_tri_t_5;
  wire [6:6]PMOD1_tri_t_6;
  wire [7:7]PMOD1_tri_t_7;
  wire [0:0]PMOD2_tri_i_0;
  wire [1:1]PMOD2_tri_i_1;
  wire [2:2]PMOD2_tri_i_2;
  wire [3:3]PMOD2_tri_i_3;
  wire [4:4]PMOD2_tri_i_4;
  wire [5:5]PMOD2_tri_i_5;
  wire [6:6]PMOD2_tri_i_6;
  wire [7:7]PMOD2_tri_i_7;
  wire [0:0]PMOD2_tri_io_0;
  wire [1:1]PMOD2_tri_io_1;
  wire [2:2]PMOD2_tri_io_2;
  wire [3:3]PMOD2_tri_io_3;
  wire [4:4]PMOD2_tri_io_4;
  wire [5:5]PMOD2_tri_io_5;
  wire [6:6]PMOD2_tri_io_6;
  wire [7:7]PMOD2_tri_io_7;
  wire [0:0]PMOD2_tri_o_0;
  wire [1:1]PMOD2_tri_o_1;
  wire [2:2]PMOD2_tri_o_2;
  wire [3:3]PMOD2_tri_o_3;
  wire [4:4]PMOD2_tri_o_4;
  wire [5:5]PMOD2_tri_o_5;
  wire [6:6]PMOD2_tri_o_6;
  wire [7:7]PMOD2_tri_o_7;
  wire [0:0]PMOD2_tri_t_0;
  wire [1:1]PMOD2_tri_t_1;
  wire [2:2]PMOD2_tri_t_2;
  wire [3:3]PMOD2_tri_t_3;
  wire [4:4]PMOD2_tri_t_4;
  wire [5:5]PMOD2_tri_t_5;
  wire [6:6]PMOD2_tri_t_6;
  wire [7:7]PMOD2_tri_t_7;
  wire [0:0]PUSHBUTTON;
  wire [3:0]SWITCHES;
  wire [0:0]SYSMON_tri_i_0;
  wire [1:1]SYSMON_tri_i_1;
  wire [2:2]SYSMON_tri_i_2;
  wire [3:3]SYSMON_tri_i_3;
  wire [4:4]SYSMON_tri_i_4;
  wire [5:5]SYSMON_tri_i_5;
  wire [6:6]SYSMON_tri_i_6;
  wire [7:7]SYSMON_tri_i_7;
  wire [0:0]SYSMON_tri_io_0;
  wire [1:1]SYSMON_tri_io_1;
  wire [2:2]SYSMON_tri_io_2;
  wire [3:3]SYSMON_tri_io_3;
  wire [4:4]SYSMON_tri_io_4;
  wire [5:5]SYSMON_tri_io_5;
  wire [6:6]SYSMON_tri_io_6;
  wire [7:7]SYSMON_tri_io_7;
  wire [0:0]SYSMON_tri_o_0;
  wire [1:1]SYSMON_tri_o_1;
  wire [2:2]SYSMON_tri_o_2;
  wire [3:3]SYSMON_tri_o_3;
  wire [4:4]SYSMON_tri_o_4;
  wire [5:5]SYSMON_tri_o_5;
  wire [6:6]SYSMON_tri_o_6;
  wire [7:7]SYSMON_tri_o_7;
  wire [0:0]SYSMON_tri_t_0;
  wire [1:1]SYSMON_tri_t_1;
  wire [2:2]SYSMON_tri_t_2;
  wire [3:3]SYSMON_tri_t_3;
  wire [4:4]SYSMON_tri_t_4;
  wire [5:5]SYSMON_tri_t_5;
  wire [6:6]SYSMON_tri_t_6;
  wire [7:7]SYSMON_tri_t_7;
  wire UART_rxd;
  wire UART_txd;
  wire [0:0]WLAN_EN;

  IOBUF ETH1_MDIO_mdio_iobuf
       (.I(ETH1_MDIO_mdio_o),
        .IO(ETH1_MDIO_mdio_io),
        .O(ETH1_MDIO_mdio_i),
        .T(ETH1_MDIO_mdio_t));
  IOBUF ETH1_RESET_n_tri_iobuf_0
       (.I(ETH1_RESET_n_tri_o_0),
        .IO(ETH1_RESET_n_tri_io[0]),
        .O(ETH1_RESET_n_tri_i_0),
        .T(ETH1_RESET_n_tri_t_0));
  IOBUF HDMI_RX_DDC_scl_iobuf
       (.I(HDMI_RX_DDC_scl_o),
        .IO(HDMI_RX_DDC_scl_io),
        .O(HDMI_RX_DDC_scl_i),
        .T(HDMI_RX_DDC_scl_t));
  IOBUF HDMI_RX_DDC_sda_iobuf
       (.I(HDMI_RX_DDC_sda_o),
        .IO(HDMI_RX_DDC_sda_io),
        .O(HDMI_RX_DDC_sda_i),
        .T(HDMI_RX_DDC_sda_t));
  IOBUF HDMI_TX_I2C_scl_iobuf
       (.I(HDMI_TX_I2C_scl_o),
        .IO(HDMI_TX_I2C_scl_io),
        .O(HDMI_TX_I2C_scl_i),
        .T(HDMI_TX_I2C_scl_t));
  IOBUF HDMI_TX_I2C_sda_iobuf
       (.I(HDMI_TX_I2C_sda_o),
        .IO(HDMI_TX_I2C_sda_io),
        .O(HDMI_TX_I2C_sda_i),
        .T(HDMI_TX_I2C_sda_t));
  IOBUF HDMI_TX_SRC_scl_iobuf
       (.I(HDMI_TX_SRC_scl_o),
        .IO(HDMI_TX_SRC_scl_io),
        .O(HDMI_TX_SRC_scl_i),
        .T(HDMI_TX_SRC_scl_t));
  IOBUF HDMI_TX_SRC_sda_iobuf
       (.I(HDMI_TX_SRC_sda_o),
        .IO(HDMI_TX_SRC_sda_io),
        .O(HDMI_TX_SRC_sda_i),
        .T(HDMI_TX_SRC_sda_t));
  IOBUF PMOD1_tri_iobuf_0
       (.I(PMOD1_tri_o_0),
        .IO(PMOD1_tri_io[0]),
        .O(PMOD1_tri_i_0),
        .T(PMOD1_tri_t_0));
  IOBUF PMOD1_tri_iobuf_1
       (.I(PMOD1_tri_o_1),
        .IO(PMOD1_tri_io[1]),
        .O(PMOD1_tri_i_1),
        .T(PMOD1_tri_t_1));
  IOBUF PMOD1_tri_iobuf_2
       (.I(PMOD1_tri_o_2),
        .IO(PMOD1_tri_io[2]),
        .O(PMOD1_tri_i_2),
        .T(PMOD1_tri_t_2));
  IOBUF PMOD1_tri_iobuf_3
       (.I(PMOD1_tri_o_3),
        .IO(PMOD1_tri_io[3]),
        .O(PMOD1_tri_i_3),
        .T(PMOD1_tri_t_3));
  IOBUF PMOD1_tri_iobuf_4
       (.I(PMOD1_tri_o_4),
        .IO(PMOD1_tri_io[4]),
        .O(PMOD1_tri_i_4),
        .T(PMOD1_tri_t_4));
  IOBUF PMOD1_tri_iobuf_5
       (.I(PMOD1_tri_o_5),
        .IO(PMOD1_tri_io[5]),
        .O(PMOD1_tri_i_5),
        .T(PMOD1_tri_t_5));
  IOBUF PMOD1_tri_iobuf_6
       (.I(PMOD1_tri_o_6),
        .IO(PMOD1_tri_io[6]),
        .O(PMOD1_tri_i_6),
        .T(PMOD1_tri_t_6));
  IOBUF PMOD1_tri_iobuf_7
       (.I(PMOD1_tri_o_7),
        .IO(PMOD1_tri_io[7]),
        .O(PMOD1_tri_i_7),
        .T(PMOD1_tri_t_7));
  IOBUF PMOD2_tri_iobuf_0
       (.I(PMOD2_tri_o_0),
        .IO(PMOD2_tri_io[0]),
        .O(PMOD2_tri_i_0),
        .T(PMOD2_tri_t_0));
  IOBUF PMOD2_tri_iobuf_1
       (.I(PMOD2_tri_o_1),
        .IO(PMOD2_tri_io[1]),
        .O(PMOD2_tri_i_1),
        .T(PMOD2_tri_t_1));
  IOBUF PMOD2_tri_iobuf_2
       (.I(PMOD2_tri_o_2),
        .IO(PMOD2_tri_io[2]),
        .O(PMOD2_tri_i_2),
        .T(PMOD2_tri_t_2));
  IOBUF PMOD2_tri_iobuf_3
       (.I(PMOD2_tri_o_3),
        .IO(PMOD2_tri_io[3]),
        .O(PMOD2_tri_i_3),
        .T(PMOD2_tri_t_3));
  IOBUF PMOD2_tri_iobuf_4
       (.I(PMOD2_tri_o_4),
        .IO(PMOD2_tri_io[4]),
        .O(PMOD2_tri_i_4),
        .T(PMOD2_tri_t_4));
  IOBUF PMOD2_tri_iobuf_5
       (.I(PMOD2_tri_o_5),
        .IO(PMOD2_tri_io[5]),
        .O(PMOD2_tri_i_5),
        .T(PMOD2_tri_t_5));
  IOBUF PMOD2_tri_iobuf_6
       (.I(PMOD2_tri_o_6),
        .IO(PMOD2_tri_io[6]),
        .O(PMOD2_tri_i_6),
        .T(PMOD2_tri_t_6));
  IOBUF PMOD2_tri_iobuf_7
       (.I(PMOD2_tri_o_7),
        .IO(PMOD2_tri_io[7]),
        .O(PMOD2_tri_i_7),
        .T(PMOD2_tri_t_7));
  IOBUF SYSMON_tri_iobuf_0
       (.I(SYSMON_tri_o_0),
        .IO(SYSMON_tri_io[0]),
        .O(SYSMON_tri_i_0),
        .T(SYSMON_tri_t_0));
  IOBUF SYSMON_tri_iobuf_1
       (.I(SYSMON_tri_o_1),
        .IO(SYSMON_tri_io[1]),
        .O(SYSMON_tri_i_1),
        .T(SYSMON_tri_t_1));
  IOBUF SYSMON_tri_iobuf_2
       (.I(SYSMON_tri_o_2),
        .IO(SYSMON_tri_io[2]),
        .O(SYSMON_tri_i_2),
        .T(SYSMON_tri_t_2));
  IOBUF SYSMON_tri_iobuf_3
       (.I(SYSMON_tri_o_3),
        .IO(SYSMON_tri_io[3]),
        .O(SYSMON_tri_i_3),
        .T(SYSMON_tri_t_3));
  IOBUF SYSMON_tri_iobuf_4
       (.I(SYSMON_tri_o_4),
        .IO(SYSMON_tri_io[4]),
        .O(SYSMON_tri_i_4),
        .T(SYSMON_tri_t_4));
  IOBUF SYSMON_tri_iobuf_5
       (.I(SYSMON_tri_o_5),
        .IO(SYSMON_tri_io[5]),
        .O(SYSMON_tri_i_5),
        .T(SYSMON_tri_t_5));
  IOBUF SYSMON_tri_iobuf_6
       (.I(SYSMON_tri_o_6),
        .IO(SYSMON_tri_io[6]),
        .O(SYSMON_tri_i_6),
        .T(SYSMON_tri_t_6));
  IOBUF SYSMON_tri_iobuf_7
       (.I(SYSMON_tri_o_7),
        .IO(SYSMON_tri_io[7]),
        .O(SYSMON_tri_i_7),
        .T(SYSMON_tri_t_7));
  design_1 design_1_i
       (.BT_EN(BT_EN),
        .BT_HCI_CTS(BT_HCI_CTS),
        .BT_HCI_RTS(BT_HCI_RTS),
        .BT_HCI_RX(BT_HCI_RX),
        .BT_HCI_TX(BT_HCI_TX),
        .ETH1_MDIO_mdc(ETH1_MDIO_mdc),
        .ETH1_MDIO_mdio_i(ETH1_MDIO_mdio_i),
        .ETH1_MDIO_mdio_o(ETH1_MDIO_mdio_o),
        .ETH1_MDIO_mdio_t(ETH1_MDIO_mdio_t),
        .ETH1_RESET_n_tri_i(ETH1_RESET_n_tri_i_0),
        .ETH1_RESET_n_tri_o(ETH1_RESET_n_tri_o_0),
        .ETH1_RESET_n_tri_t(ETH1_RESET_n_tri_t_0),
        .ETH1_RGMII_rd(ETH1_RGMII_rd),
        .ETH1_RGMII_rx_ctl(ETH1_RGMII_rx_ctl),
        .ETH1_RGMII_rxc(ETH1_RGMII_rxc),
        .ETH1_RGMII_td(ETH1_RGMII_td),
        .ETH1_RGMII_tx_ctl(ETH1_RGMII_tx_ctl),
        .ETH1_RGMII_txc(ETH1_RGMII_txc),
        .HDMI_RX_CLK_N(HDMI_RX_CLK_N),
        .HDMI_RX_CLK_P(HDMI_RX_CLK_P),
        .HDMI_RX_DATA_N(HDMI_RX_DATA_N),
        .HDMI_RX_DATA_P(HDMI_RX_DATA_P),
        .HDMI_RX_DDC_scl_i(HDMI_RX_DDC_scl_i),
        .HDMI_RX_DDC_scl_o(HDMI_RX_DDC_scl_o),
        .HDMI_RX_DDC_scl_t(HDMI_RX_DDC_scl_t),
        .HDMI_RX_DDC_sda_i(HDMI_RX_DDC_sda_i),
        .HDMI_RX_DDC_sda_o(HDMI_RX_DDC_sda_o),
        .HDMI_RX_DDC_sda_t(HDMI_RX_DDC_sda_t),
        .HDMI_RX_DRU_CLK_clk_n(HDMI_RX_DRU_CLK_clk_n),
        .HDMI_RX_DRU_CLK_clk_p(HDMI_RX_DRU_CLK_clk_p),
        .HDMI_TXN(HDMI_TXN),
        .HDMI_TXP(HDMI_TXP),
        .HDMI_TX_CLKN(HDMI_TX_CLKN),
        .HDMI_TX_CLKP(HDMI_TX_CLKP),
        .HDMI_TX_HPD(HDMI_TX_HPD),
        .HDMI_TX_I2C_scl_i(HDMI_TX_I2C_scl_i),
        .HDMI_TX_I2C_scl_o(HDMI_TX_I2C_scl_o),
        .HDMI_TX_I2C_scl_t(HDMI_TX_I2C_scl_t),
        .HDMI_TX_I2C_sda_i(HDMI_TX_I2C_sda_i),
        .HDMI_TX_I2C_sda_o(HDMI_TX_I2C_sda_o),
        .HDMI_TX_I2C_sda_t(HDMI_TX_I2C_sda_t),
        .HDMI_TX_REFCLK_clk_n(HDMI_TX_REFCLK_clk_n),
        .HDMI_TX_REFCLK_clk_p(HDMI_TX_REFCLK_clk_p),
        .HDMI_TX_SRC_scl_i(HDMI_TX_SRC_scl_i),
        .HDMI_TX_SRC_scl_o(HDMI_TX_SRC_scl_o),
        .HDMI_TX_SRC_scl_t(HDMI_TX_SRC_scl_t),
        .HDMI_TX_SRC_sda_i(HDMI_TX_SRC_sda_i),
        .HDMI_TX_SRC_sda_o(HDMI_TX_SRC_sda_o),
        .HDMI_TX_SRC_sda_t(HDMI_TX_SRC_sda_t),
        .LEDS(LEDS),
        .PL_DDR4_CALIB_LED(PL_DDR4_CALIB_LED),
        .PL_DDR4_CLK_clk_n(PL_DDR4_CLK_clk_n),
        .PL_DDR4_CLK_clk_p(PL_DDR4_CLK_clk_p),
        .PL_DDR4_act_n(PL_DDR4_act_n),
        .PL_DDR4_adr(PL_DDR4_adr),
        .PL_DDR4_ba(PL_DDR4_ba),
        .PL_DDR4_bg(PL_DDR4_bg),
        .PL_DDR4_ck_c(PL_DDR4_ck_c),
        .PL_DDR4_ck_t(PL_DDR4_ck_t),
        .PL_DDR4_cke(PL_DDR4_cke),
        .PL_DDR4_cs_n(PL_DDR4_cs_n),
        .PL_DDR4_dm_n(PL_DDR4_dm_n),
        .PL_DDR4_dq(PL_DDR4_dq),
        .PL_DDR4_dqs_c(PL_DDR4_dqs_c),
        .PL_DDR4_dqs_t(PL_DDR4_dqs_t),
        .PL_DDR4_odt(PL_DDR4_odt),
        .PL_DDR4_reset_n(PL_DDR4_reset_n),
        .PMOD1_tri_i({PMOD1_tri_i_7,PMOD1_tri_i_6,PMOD1_tri_i_5,PMOD1_tri_i_4,PMOD1_tri_i_3,PMOD1_tri_i_2,PMOD1_tri_i_1,PMOD1_tri_i_0}),
        .PMOD1_tri_o({PMOD1_tri_o_7,PMOD1_tri_o_6,PMOD1_tri_o_5,PMOD1_tri_o_4,PMOD1_tri_o_3,PMOD1_tri_o_2,PMOD1_tri_o_1,PMOD1_tri_o_0}),
        .PMOD1_tri_t({PMOD1_tri_t_7,PMOD1_tri_t_6,PMOD1_tri_t_5,PMOD1_tri_t_4,PMOD1_tri_t_3,PMOD1_tri_t_2,PMOD1_tri_t_1,PMOD1_tri_t_0}),
        .PMOD2_tri_i({PMOD2_tri_i_7,PMOD2_tri_i_6,PMOD2_tri_i_5,PMOD2_tri_i_4,PMOD2_tri_i_3,PMOD2_tri_i_2,PMOD2_tri_i_1,PMOD2_tri_i_0}),
        .PMOD2_tri_o({PMOD2_tri_o_7,PMOD2_tri_o_6,PMOD2_tri_o_5,PMOD2_tri_o_4,PMOD2_tri_o_3,PMOD2_tri_o_2,PMOD2_tri_o_1,PMOD2_tri_o_0}),
        .PMOD2_tri_t({PMOD2_tri_t_7,PMOD2_tri_t_6,PMOD2_tri_t_5,PMOD2_tri_t_4,PMOD2_tri_t_3,PMOD2_tri_t_2,PMOD2_tri_t_1,PMOD2_tri_t_0}),
        .PUSHBUTTON(PUSHBUTTON),
        .SWITCHES(SWITCHES),
        .SYSMON_tri_i({SYSMON_tri_i_7,SYSMON_tri_i_6,SYSMON_tri_i_5,SYSMON_tri_i_4,SYSMON_tri_i_3,SYSMON_tri_i_2,SYSMON_tri_i_1,SYSMON_tri_i_0}),
        .SYSMON_tri_o({SYSMON_tri_o_7,SYSMON_tri_o_6,SYSMON_tri_o_5,SYSMON_tri_o_4,SYSMON_tri_o_3,SYSMON_tri_o_2,SYSMON_tri_o_1,SYSMON_tri_o_0}),
        .SYSMON_tri_t({SYSMON_tri_t_7,SYSMON_tri_t_6,SYSMON_tri_t_5,SYSMON_tri_t_4,SYSMON_tri_t_3,SYSMON_tri_t_2,SYSMON_tri_t_1,SYSMON_tri_t_0}),
        .UART_rxd(UART_rxd),
        .UART_txd(UART_txd),
        .WLAN_EN(WLAN_EN));
endmodule
