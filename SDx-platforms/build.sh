# build.sh - build dtb file
#
# DTC (Device Tree Compiler) is part of the Linux source directory. linux-xlnx/scripts/dtc/ contains the source code for DTC and needs to be compiled in order to be used. One way to compile the DTC is to build the Linux tree.
#
# for platforms for TySOM-1, TySOM-2 and TySOM-2A DTC from linux-xlnx with tag 'xilinx-v2017.2' was used,
# for TySOM-3 - from branch '2017.3_video_ea'
#

# path to dtc 
export DTC_PATH=/<linux-xlnx-path>/scripts/dtc

# generate a DTB file
${DTC_PATH}/dtc -I dts -O dtb -o devicetree.dtb system-top.dts

# convert a DTB back into a DTS
#${DTC_PATH}/dtc -I dtb -O dts -o system.dts devicetree.dtb