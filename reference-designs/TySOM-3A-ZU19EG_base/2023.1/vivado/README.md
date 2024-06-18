![Aldec, Inc.](https://www.aldec.com/images/content/corporate/Corporate_Logo_Aldec_Crescent.png)
## TySOM-3A-ZU19EG example design with support for Ethernet, USB, 2x micro SD, SPI, UART.
|||
|---|---|
|Host|TySOM-3A-ZU19EG|

### Software requirements
- Vivado 2023.1
- The design requires Vivado board definition (rev. 1.1) for TySOM-3A-ZU19EG development board.
Download it from:
[github.com](https://github.com/aldec/TySOM-3A-ZU19EG/tree/master/Vivado-board_files/2018.3/TySOM-3A-ZU19EG)

The project was built with using US local settings.
```bash
LANG="en_US.UTF-8"
export LANG
```
### Build the project
Build the project with using a TCL script.
1. Go to "vivado" directory (directory with TCL script for the example design).
2. Source Vivado 2023.1 settings64.sh file
```bash
source <vivado_2023_1_path>/settings64.sh
```
3. Launch Vivado tool and run the script:
```bash
vivado -source ./TySOM-3A-ZU19EG_base.tcl
```
4. Run "Generate Bitstream"
