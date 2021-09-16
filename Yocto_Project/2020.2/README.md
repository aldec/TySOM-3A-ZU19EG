# Yocto Project 2020.2 for [TySOM-3A-ZU19EG](https://www.aldec.com/en/products/emulation/tysom_boards/zynq_ultrascale_mpsoc/tysom_3a_zu19eg) board

## Table of Content
- [Provided files](#provided_files)
- [Yocto Project 2020.2 instruction](#yocto_instruction)
- [Yocto Project update with a new hardware project](#yocto_update)

<a name="provided_files"/>

## Provided files

This package is composed of the following files:
- meta-aldec - meta Aldec layer for Yocto Project

<a name="yocto_instruction"/>

## Yocto Project 2020.2 instruction

This step by step instruction allows to rebuild Linux with Yocto Project.

Note: This instruction is based on [Xilinx Wiki](https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/18841862/Install+and+Build+with+Xilinx+Yocto)

1. Install Repo

1.1. Got into a directory where you keep utilities and make sure it's in your PATH
```
$ cd ~/bin/
```

1.2. Download the repo script
```
$ curl https://storage.googleapis.com/git-repo-downloads/repo > repo
```

1.3. Make repo executable
```
$ chmod a+x repo
```

1.4. Test if repo is working
```
$ repo --help
```

2. Fetch Source
2.1. Create a workspace directory
```
mkdir yocto
cd yocto
```

2.2. Fetch the manifest and checkout the target release version
```
$ repo init -u git://github.com/Xilinx/yocto-manifests.git -b rel-v2020.2
```

2.3. Fetch all the source from the repositories in the manifest
```
$ repo sync
```

2.4. Checkout the corresponding release for each repository
```
$ repo start rel-v2020.2 --all
```

2.5. Copy meta-aldec to sources directory

3. Source the Yocto Environment

3.1. CentOS 7 requires tar in version 1.28
```
$ wget http://downloads.yoctoproject.org/releases/yocto/yocto-3.0/buildtools/x86_64-buildtools-nativesdk-standalone-3.0.sh
$ chmod u+x x86_64-buildtools-nativesdk-standalone-3.0.sh
$ ./x86_64-buildtools-nativesdk-standalone-3.0.sh
$ source /opt/poky/3.0/environment-setup-x86_64-pokysdk-linux

# source yocto environment and create build directory
$ source setupsdk build
$ cd build
```

3.2. Add Aldec layer to build/conf/bblayers.conf
```
$ bitbake-layers add-layer ../sources/meta-aldec
```

4. Bitbake the Image
```
$ MACHINE=tysom-3a-zu19eg bitbake petalinux-image-minimal
```

5. Copy files to boot partition on SD card
Created images are in the directory: build/tmp/deploy/images/tysom-3a-zu19eg
- BOOT-tysom-3a-zu19eg-builddate.bin
- Image--5.4+git0+62ea514294-r0-tysom-3a-zu19eg-builddate.bin
- petalinux-image-minimal-tysom-3a-zu19eg-builddate.rootfs.cpio.gz.u-boot
- u-boot-zynq-scr--1.0-r0-builddate.scr
- system-top.dtb

6. Rename the file names to the names expected by boot.scr (on SD card)
- BOOT-tysom-3a-zu19eg-builddate.bin    to    Boot.bin
- Image--5.4+git0+62ea514294-r0-tysom-3a-zu19eg-builddate.bin    to    Image
- petalinux-image-minimal-tysom-3a-zu19eg-builddate.rootfs.cpio.gz.u-boot    to    rootfs.cpio.gz.u-boot
- u-boot-zynq-scr--1.0-r0-builddate.scr   to    boot.scr

<a name="yocto_update"/>

## Yocto Project update with a new hardware project

It is possible to update the Yocto project with a new hardware from Vivado.
It is necessary to update two files:
- system.xsa - in meta-aldec/recipes-bsp/hdf/files/tysom-3a-zu19eg folder
- system-user.dtsi - in meta-aldec/recipes-bsp/device-tree/files/tysom-3a-zu19eg folder

And then rebuild the Yocto Project.
