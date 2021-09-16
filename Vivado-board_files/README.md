# Table of Content
1. [TySOM](#tysom_main)
   - [Vivado - board definition files](#tysom_board_def_files)
   - [Vivado - supported versions](#vivado_supported_versions)

# TySOM <a name="tysom_main"/>

TySOM is a family of development boards for embedded applications that features Xilinx® Zynq™ all programmable module combining FPGA with ARM® Cortex processor. Plethora of included peripherals makes these boards useful in various embedded applications like Automotive, IoT, Industrial automation or embedded HPC.

Aldec provides the following list of boards:
-	[TySOM-3A (Xilinx Zynq UltraScale+ ZU19EG)](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_ultrascale_mpsoc_boards/tysom_3a)
-	[TySOM-3 (Xilinx Zynq UltraScale+ Zu7EV)](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_ultrascale_mpsoc_boards/tysom_3)
-	[TySOM-2 (Xilinx Zynq XC7Z045 or XC7Z100)](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_7000/tysom_2)
-	[TySOM-2A (Xilinx Zynq XC7Z030)](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_7000/tysom_2a)
-	[TySOM-1 (Xilinx Zynq XC7Z030)](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_7000/tysom_1)
-	[TySOM-1A (Xilinx Zynq XC7Z010)](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_7000/tysom_1a)

[Link to the TySOM boards page](https://www.aldec.com/en/products/emulation/tysom_boards)

TySOM-3A, TySOM-3, TySOM-2 and TySOM-2A families contain FMC connectors which can be used to extend devices and peripherals not included in TySOM boards. Due to non-proprietary connectors like FMC Daughter Cards can be reused across different hardware platforms.

Daughter Cards provided by Aldec:
-	[FMC-NVMe](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_nvme)
-	[FMC-ADAS](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_adas)
-	[FMC-VISION](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_vision)
-	[FMC-INTF](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_intf)
-	[FMC-IOT](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_iot)
-	[FMC-NET](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_net)
-	[FMC-QSFP](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_qsfp)
-	[FMC-INDUSTRY](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_industry)

## Vivado - board definition files <a name="tysom_board_def_files"/>

Vivado board definition files contain configuration of Processing System and interfaces available on the board to simplify using the Aldec TySOM board in Xilinx Vivado tool.

The board definition files for all TySOM boards can be found in Vivado-board_files folder.

[Document](https://github.com/Aldecinc/TySOM/blob/master/Vivado-board_files/How_to_build_an_FPGA_design_for_Aldec_TySOM_boards_using_board_definition_in_Xilinx_Vivado.pdf) contains all necessary information about using Aldec TySOM board in Xilinx Vivado tool with the board definition files.

The board definition files are provided for the following Aldec TySOM boards:
-	[TySOM-3A (Xilinx Zynq UltraScale+ ZU19EG)](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_ultrascale_mpsoc_boards/tysom_3a)
-	[TySOM-3 (Xilinx Zynq UltraScale+ Zu7EV)](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_ultrascale_mpsoc_boards/tysom_3)
-	[TySOM-2 (Xilinx Zynq XC7Z045 or XC7Z100)](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_7000/tysom_2)
-	[TySOM-2A (Xilinx Zynq XC7Z030)](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_7000/tysom_2a)
-	[TySOM-1 (Xilinx Zynq XC7Z030)](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_7000/tysom_1)
-	[TySOM-1A (Xilinx Zynq XC7Z010)](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_7000/tysom_1a)

The board definition files contain also FMC cards definitions:
-	[FMC-NVMe](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_nvme)
-	[FMC-ADAS](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_adas)
-	[FMC-INTF](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_intf)
-	[FMC-IOT](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_iot)
-	[FMC-NET](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_net)
-	[FMC-INDUSTRY](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_industry)
-	[FMC-QSFP](https://www.aldec.com/en/products/emulation/daughter_cards/fmc_daughter/fmc_qsfp)

## Vivado - supported versions <a name="vivado_supported_versions"/>

The Vivado board files for TySOM-3-ZU7EV board are provided for the following Vivado versions:
- 2018.3
- 2019.1
- 2020.2 (works with 2021.1 version as well)
