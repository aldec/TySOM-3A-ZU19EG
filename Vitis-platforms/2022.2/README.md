![Aldec, Inc.](https://www.aldec.com/images/content/corporate/Corporate_Logo_Aldec_Crescent.png)

# How to create Vitis 2022.2 application with Aldec platforms

## Table of Content
- [Instruction](#instruction)
  - [Instruction](#instruction)
  - [Install sysroot and common images](#install_sysroot)
  - [Create a project application](#create_a_project_application)

<a name="instruction"/>

## Instruction

<a name="install_sysroot"/>

### Install sysroot and common images

Sysroot is necessary and this chapter demostrates how to download and build it.

1. Download file "ZYNQMP common image" from the [Xilinx webpage](https://www.xilinx.com/member/forms/download/xef.html?filename=xilinx-zynqmp-common-v2022.2_10141622.tar.gz)
2. Unpack downloaded file. The package contains common images and sysroot installer.

3. Install sysroot.
```
$ cd xilinx-zynqmp-common-v2022.2
$ ./sdk.sh -y -d .
```

4. Sysroot should be available in **xilinx-zynqmp-common-v2022.2/sysroots/cortexa72-cortexa53-xilinx-linux/** folder.

<a name="create_a_project_application"/>

### Create a project application

Now it is possible to create a project application in Vitis:

1. Run Vitis.

2. Select **File -> New -> Application Project...**.

3. Click **Next** on the welcome page.

4. Add the Aldec platform by clicking an icon **Add** and entering a path to the Aldec platform.

5. Select the platform and click **Next**.

6. Enter an application project name. Make sure that target processor is **psu_cortexa53 SMP** and click **Next**.

7. Enter a path to sysroot for aarch64 installed in the chapter **Install sysroot and common images** point 3.

8. Enter a path to root filesystem rootfs.ext4 image extracted in the chapter **Install sysroot and common images**.

9. Enter a path to kernel image Image for aarch64 installed in the chapter **Install sysroot and common images**.

10. Select **Empty Application** or an exemplary apllication. Click **Finish**.

11. Build the application.

12. Copy built files to a SD card and run the Aldec TySOM board.

For example, if for a **hello_world** application project Hardware building configuration was selected, needed files can be available in a directory: 
**hello_world_system/Hardware/package/sd_card/**.

By default the directory does not contain root filesystem. Use *sd_card.img* from **hello_world_system/Hardware/package/** for flashing memory card.
The image contains partitions for booting and root filesystem.

Flash a memory card with using [Balena Etcher](https://etcher.balena.io/), dd or other tool. For more information visit: [Vitis documentation](https://docs.amd.com/r/2022.2-English/ug1393-vitis-application-acceleration/Writing-Images-to-the-SD-Card).

After some project modifications, build the project and update boot partition with files from **hello_world_system/Hardware/package/sd_card/**.
