COMPATIBLE_MACHINE = "^$"
COMPATIBLE_MACHINE_tysom-3a-zu19eg = "tysom-3a-zu19eg"
COMPATIBLE_MACHINE_tysom-3-zu7ev = "tysom-3-zu7ev"


HDF_BASE = "file://"
HDF_PATH = "system.xsa"

SRC_URI = " \
    file://system.xsa \
    "
FILESEXTRAPATHS_append := ":${THISDIR}/files/${MACHINE}"