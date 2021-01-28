# device tree sources for the various machines

FILESEXTRAPATHS_prepend := "${THISDIR}/files/:${THISDIR}/files/${MACHINE}: "

COMPATIBLE_MACHINE = "^$"

COMPATIBLE_MACHINE_tysom-3-zu7ev = "tysom-3-zu7ev"
SRC_URI_append_tysom-3-zu7ev = " \
			file://pcw.dtsi \
			file://pl.dtsi \
			file://zynqmp-clk-ccf.dtsi \
			file://zynqmp.dtsi \
			file://tysom-3-zu7ev.dts \
"


COMPATIBLE_MACHINE_tysom-3a-zu19eg = "tysom-3a-zu19eg"
SRC_URI_append_tysom-3a-zu19eg = " \
			file://pcw.dtsi \
			file://pl.dtsi \
			file://zynqmp-clk-ccf.dtsi \
			file://zynqmp.dtsi \
			file://tysom-3a-zu19eg.dts \
"
