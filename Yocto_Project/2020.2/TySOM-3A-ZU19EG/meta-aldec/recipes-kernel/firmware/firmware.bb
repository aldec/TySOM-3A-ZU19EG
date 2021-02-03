#
# This file is the firmware recipe.
#

SUMMARY = "TI Wi-Fi Firmware and regulatory database"
SECTION = "Kernels"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

SRC_URI = " \
	file://TIInit_11.8.32.bts \
	file://wl18xx-conf.bin \
	file://wl12xx-nvs.bin \
	file://wl1251-nvs.bin \
	file://wl127x-nvs.bin \ 
	file://wl1271-nvs.bin \
	file://wl128x-nvs.bin \
	file://wl18xx-fw.bin \
	file://wl18xx-fw-2.bin \
	file://wl18xx-fw-3.bin \
	file://wl18xx-fw-4.bin \
	file://regulatory.db \
	file://regulatory.db.p7s \
	"

S = "${WORKDIR}"

do_install() {
	     install -d ${D}/${base_libdir}/firmware
	     install -m 0644 ${S}/TIInit_11.8.32.bts ${D}/${base_libdir}/firmware
	     install -d ${D}/${base_libdir}/firmware/ti-connectivity
	     install -m 0644 ${S}/TIInit_11.8.32.bts ${D}/${base_libdir}/firmware/ti-connectivity
	     install -m 0644 ${S}/wl127x-nvs.bin ${D}/${base_libdir}/firmware/ti-connectivity
	     install -m 0644 ${S}/wl1251-nvs.bin ${D}/${base_libdir}/firmware/ti-connectivity
	     install -m 0644 ${S}/wl128x-nvs.bin ${D}/${base_libdir}/firmware/ti-connectivity
	     install -m 0644 ${S}/wl1271-nvs.bin ${D}/${base_libdir}/firmware/ti-connectivity
	     install -m 0644 ${S}/wl12xx-nvs.bin ${D}/${base_libdir}/firmware/ti-connectivity
	     install -m 0644 ${S}/wl18xx-conf.bin ${D}/${base_libdir}/firmware/ti-connectivity
	     install -m 0644 ${S}/wl18xx-fw.bin ${D}/${base_libdir}/firmware/ti-connectivity
	     install -m 0644 ${S}/wl18xx-fw-2.bin ${D}/${base_libdir}/firmware/ti-connectivity
	     install -m 0644 ${S}/wl18xx-fw-3.bin ${D}/${base_libdir}/firmware/ti-connectivity
	     install -m 0644 ${S}/wl18xx-fw-4.bin ${D}/${base_libdir}/firmware/ti-connectivity
	     install -m 0644 ${S}/regulatory.db ${D}/${base_libdir}/firmware/
	     install -m 0644 ${S}/regulatory.db.p7s ${D}/${base_libdir}/firmware/
}

FILES_${PN} = "${base_libdir}/firmware"
