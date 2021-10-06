# Table of Content
[TySOM - SDx-platforms](#tysom_sdx_platforms)
   - [TySOM-3A-ZU19EG](#tysom_3a_zu19eg)
   - [TySOM-3A-ZU19EG_FMC1_ADAS](#tysom_3a_zu19eg_fmc1_adas)
   - [TySOM-3A-ZU19EG_FMC1_ADAS_AI](#tysom_3a_zu19eg_fmc1_adas_ai)

<a name="tysom_sdx_platforms"/>

# TySOM - SDx-platforms

This page contains configuration platforms for Xilinx SDx tool for Aldec TySOM boards. Every configuration is ready to use with SDx and TySOM boards.

>**Note: These platforms have to be downloaded and a zip file has to be extracted on Linux. SDx platform extracted on Windows will not work!**

<a name="tysom_3a_zu19eg"/>

## TySOM-3A-ZU19EG

The configuration for Aldec TySOM-3A-ZU19EG board consists of:

SoC |
:-------- |
Xilinx Zynq UltraScale+ ZU19EG-FFVB1517 MPSoC |
**Memory** |
8GB DDR4 SODIMM Memory for the Processing System and for PL |
2 Gb NAND Memory |
512Mb QSPI Flash Memory |
uSD Card Socket up to 32 GB |
**Connector Type for External Daughter Board** |
2× FMC VITA 57.1-2010 compliant |
**Interfaces** |
2× Gigabit Ethernet PHY DP83867CR |
Wi-Fi/Bluetooth module (WL18370MOD) |
4x USB 3.0 ports |
SATA |
2x8 IOs Pmod connector |
UART to USB bridge (CP2103) with Mini-USB B type connector |
JTAG USB Module for Zynq PL |
**Multimedia** |
HDMI 2.0 Out |
DisplayPort |
**Miscellaneous** |
4x User Dip Switches |
5x User LEDs |
Reset Pushbuttons for PL & PS |
SYSMON |

[Link to the TySOM board page](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_ultrascale_mpsoc/tysom_3a_zu19eg)

<a name="tysom_3a_zu19eg_fmc1_adas"/>

## TySOM-3A-ZU19EG_FMC1_ADAS

The configuration for Aldec TySOM-3A-ZU19EG board consists of:

SoC |
:-------- |
Xilinx Zynq UltraScale+ ZU19EG-FFVB1517 MPSoC |
**Memory** |
8GB DDR4 SODIMM Memory for the Processing System and for PL |
2 Gb NAND Memory |
512Mb QSPI Flash Memory |
uSD Card Socket up to 32 GB |
**Connector Type for External Daughter Board** |
2× FMC VITA 57.1-2010 compliant |
**Interfaces** |
2× Gigabit Ethernet PHY DP83867CR |
Wi-Fi/Bluetooth module (WL18370MOD) |
4x USB 3.0 ports |
SATA |
2x8 IOs Pmod connector |
UART to USB bridge (CP2103) with Mini-USB B type connector |
JTAG USB Module for Zynq PL |
**Multimedia** |
HDMI 2.0 Out |
DisplayPort |
**Miscellaneous** |
4x User Dip Switches |
5x User LEDs |
Reset Pushbuttons for PL & PS |
SYSMON |

Additionally it supports some components on FMC-ADAS card.
[Link to the FMC-ADAS board page](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_adas)

The following FMC ADAS interfaces are supported:

Interface |
:---------|
5x FPD-Link III |
Buzzer |
URM37 V4 |

<a name="tysom_3a_zu19eg_fmc1_adas_ai"/>

## TySOM-3A-ZU19EG_FMC1_ADAS_AI

This platform is designed to be used in AI applications in SDx 2018.3 version.
The configuration for Aldec TySOM-3A-ZU19EG board consists of:

SoC |
:-------- |
Xilinx Zynq UltraScale+ ZU19EG-FFVB1517 MPSoC |
**Memory** |
8GB DDR4 SODIMM Memory for the Processing System and for PL |
2 Gb NAND Memory |
512Mb QSPI Flash Memory |
uSD Card Socket up to 32 GB |
**Connector Type for External Daughter Board** |
2× FMC VITA 57.1-2010 compliant |
**Interfaces** |
2× Gigabit Ethernet PHY DP83867CR |
Wi-Fi/Bluetooth module (WL18370MOD) |
4x USB 3.0 ports |
SATA |
2x8 IOs Pmod connector |
UART to USB bridge (CP2103) with Mini-USB B type connector |
JTAG USB Module for Zynq PL |
**Multimedia** |
HDMI 2.0 Out |
DisplayPort |
**Miscellaneous** |
4x User Dip Switches |
5x User LEDs |
Reset Pushbuttons for PL & PS |
SYSMON |

Additionally it supports some components on FMC-ADAS card.
[Link to the FMC-ADAS board page](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_adas)

The following FMC ADAS interfaces are supported:

Interface |
:---------|
5x FPD-Link III |
Buzzer |
URM37 V4 |

To get more information about Deep Learning using Zynq US+ FPGA board go to [Aldec website](https://www.aldec.com/en/solutions/embedded/deep-learning-using-fpga).

An instruction of running AI application on TySOM boards is also available [link](https://www.aldec.com/en/downloads/private/1221).
