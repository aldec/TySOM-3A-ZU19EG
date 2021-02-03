# device tree sources for the various machines

DTC_FLAGS_append = " -@ "

COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE_tysom-3a-zu19eg = "tysom-3a-zu19eg"
SRC_URI_append_tysom-3a-zu19eg = " \
    file://system-user.dtsi \
    "
    
COMPATIBLE_MACHINE_tysom-3-zu7ev = "tysom-3-zu7ev"
SRC_URI_append_tysom-3-zu7ev = " \
    file://system-user.dtsi \
    "
    
do_configure_append_tysom-3a-zu19eg() {
    cp ${WORKDIR}/system-user.dtsi ${B}/device-tree
    echo "/include/ \"system-user.dtsi\"" >> ${B}/device-tree/system-top.dts
}

do_configure_append_tysom-3-zu7ev() {
    cp ${WORKDIR}/system-user.dtsi ${B}/device-tree
    echo "/include/ \"system-user.dtsi\"" >> ${B}/device-tree/system-top.dts
}

FILESEXTRAPATHS_append := ":${THISDIR}/files/:${THISDIR}/files/${MACHINE}"
