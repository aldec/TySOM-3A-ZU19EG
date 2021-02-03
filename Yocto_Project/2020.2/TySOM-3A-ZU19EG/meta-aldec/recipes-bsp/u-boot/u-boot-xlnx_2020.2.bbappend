FILESEXTRAPATHS_prepend := "${THISDIR}/files/: "

SRC_URI_append = " \
                           file://0001-support-for-TySOM-3-TySOM-3A.patch \
                                 "

# u-boot-xlnx has support for these
HAS_PLATFORM_INIT_append ?= " \
		zynqmp_tysom_3_defconfig \
		zynqmp_tysom_3a_defconfig \
		"
