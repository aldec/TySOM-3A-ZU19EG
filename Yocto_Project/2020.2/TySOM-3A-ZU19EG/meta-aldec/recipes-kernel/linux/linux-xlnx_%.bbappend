SRC_URI += "file://plnx_kernel.cfg \
file://0004-drm_atomic_helper-Supress-vblank-timeout-warning-mes.patch \
file://002-set-gpio-number.patch \
file://003-fix-xilinx-uartps-driver.patch \
file://004-add-gpio-reset-driver.patch \
file://010-add-axi-pwm-xlnx.patch \
file://011-si570-tx-refclk-rdy.patch \
"

KERNEL_FEATURES_append = " bsp.cfg"
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
