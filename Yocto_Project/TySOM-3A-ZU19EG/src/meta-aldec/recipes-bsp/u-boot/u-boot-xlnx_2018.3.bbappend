FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot-xlnx/${MACHINE}:${THISDIR}/u-boot-xlnx/: "


UBOOT_ENV_tysom-3-zu7ev = "uEnv"

SRC_URI_append_tysom-3-zu7ev = " file://uEnv.txt \
                           file://TySOM.patch \
                         "



UBOOT_ENV_tysom-3a-zu19eg = "uEnv"

SRC_URI_append_tysom-3a-zu19eg = " file://uEnv.txt \
                           file://TySOM.patch \
                         "
