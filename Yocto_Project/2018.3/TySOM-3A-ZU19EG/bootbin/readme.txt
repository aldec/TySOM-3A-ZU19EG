1. Copy yocto_linux.bif to TySOM/SDx-platforms/2018.3/TySOM_3A_ZU19EG/sv
2. source settings64.sh from SDK
. /path/to/Xilinx/SDK/2018.3/settings64.sh
3. bootgen -w on -arch zynqmp -image yocto_linux.bif -o i BOOT.bin
