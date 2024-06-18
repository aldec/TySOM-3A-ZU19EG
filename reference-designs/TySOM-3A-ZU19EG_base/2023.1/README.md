![Aldec, Inc.](https://www.aldec.com/images/content/corporate/Corporate_Logo_Aldec_Crescent.png)
## Base example design for TySOM-3A-ZU19EG development board
This is example design for Aldec TySOM-3A-ZU19EG development board. The platform is powered by Petalinux operating system.

### Hardware requirements
- Host board: [TySOM-3A-ZU19EG](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_ultrascale_mpsoc/tysom_3a_zu19eg)

### Software requirements
- Vivado 2023.1
- Petalinux 2023.1

### Supported hardware
- 2x Ethernet
- 2x micro SD
- 4x USB 2.0
- UART
- QSPI flash memory

### Package structure
- Files:
	- README.md: this readme
	- sd_card: pre-built boot files to copy on micro SD card
	- vivado: directory with files for Vivado design regeneration and readme
	- petalinux: directory with Petalinux 2023.1 BSP and readme

### Quick start guide
1. Copy ***sd_card*** directory content to micro SD card
2. Insert memory card to TySOM-3A-ZU19EG evaluation board
3. Connect power supply to TySOM board
4. Connect UART cable
5. Connect Ethernet cable
6. Power on the board
7. Check if Ethernet interface acquired an IP address
8. Check if other peripherals are properly detected

### Known issues
- none
