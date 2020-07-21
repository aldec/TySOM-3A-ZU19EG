SUMMARY = "Aldec Utils Script"
DESCRPTION = "Modification in xorg.conf, hdmi wake up"
HOMEPAGE = "http://www.aldec.com"
SECTION = "x11"

#INHIBIT_DEFAULT_DEPS = "1"

#inherit deploy

COMPATIBLE_MACHINE = "$^"
COMPATIBLE_MACHINE_zynqmp = "zynqmp"

LICENSE = "GPLv2+"
LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

PROVIDES = "aldec-utils"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
SRC_URI = "file://aldec-utils.sh"

S = "${WORKDIR}"

do_install() {
    install -d ${D}/${bindir}
    install -m 0755 ${S}/aldec-utils.sh ${D}${bindir}/
}

FILES_${PN} += "${bindir}/*"
