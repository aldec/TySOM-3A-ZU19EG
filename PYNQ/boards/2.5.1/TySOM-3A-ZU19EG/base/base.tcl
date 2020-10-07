
################################################################
# This is a generated script based on design: base
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source base.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./base/base.xpr> in the current working folder.

set overlay_name base
set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project ${overlay_name} ${overlay_name} -part xczu19eg-ffvb1517-2-i
}

set_property  ip_repo_paths  ../../ip [current_project]
update_ip_catalog


# CHANGE DESIGN NAME HERE
variable design_name
set design_name base

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

  # Add USER_COMMENTS on $design_name
  set_property USER_COMMENTS.comment_0 "EMIO pins:
----------
78 - Video Processing Subsystem reset
79 - Video Mixer reset
80 - Video Frame Buffer reset
81 - Video PHY Tx RefClkRdy
82 - Bluetooth enable
83 - WLAN enable
84 - 
85 - LEDS[0]
86 - LEDS[1]
87 - LEDS[2]
88 - LEDS[3]
89 - SWITCHES[0]
90 - SWITCHES[1]
91 - SWITCHES[2]
92 - SWITCHES[3]
93 - PUSHBUTTON
----------" [get_bd_designs $design_name]

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}


##################################################################
# DATA FILE TCL PROCs
##################################################################

proc write_ddr4_file_design_1_ddr4_0_0 { str_filepath } {

   file mkdir [ file dirname "$str_filepath" ]
   set data_file [open $str_filepath  w+]

   puts $data_file {Part type,Part name,Rank,CA Mirror,Data mask,Address width,Row width,Column width,Bank width,Bank group width,CS width,CKE width,ODT width,CK width,Memory speed grade,Memory density,Component density,Memory device width,Memory component width,Data bits per strobe,IO Voltages,Data widths,Min period,Max period,tCKE,tFAW,tMRD,tRAS,tRCD,tREFI,tRFC,tRP,tRRD_S,tRRD_L,tRTP,tWR,tWTR_S,tWTR_L,tXPR,tZQCS,tZQINIT,cas latency,cas write latency,burst length,RTT (nominal) - ODT}
   puts $data_file {SODIMMs,DDR4_1R_ALDEC,1,0,1,17,16,10,2,2,1,1,1,1,2G1,8GB,1Gb,64,8,8,1.2V,64,1071,1600,5000 ps,22000 ps,8 tck,34000 ps,13920 ps,7800000 ps,350000 ps,13920 ps,4000 ps,5400 ps,7500 ps,15000 ps,2500 ps,7500 ps,270 ns,128 tck,1024 tck,11,11,8,RZQ/6}
   puts $data_file {SODIMMs,MT40A1G8-2133,1,0,1,17,16,10,2,2,1,1,1,1,093E,8GB,1Gb,64,8,8,1.2V,64,938,1600,5000 ps,21000 ps,8 tck,33000 ps,14060 ps,7800000 ps,350000 ps,14060 ps,3700 ps,5300 ps,7500 ps,15000 ps,2500 ps,7500 ps,270 ns,128 tck,1024 tck,15,11,8,RZQ/6}
   puts $data_file {SODIMMs,MT40A1G8-1600,1,0,1,17,16,10,2,2,1,1,1,1,093E,8GB,1Gb,64,8,8,1.2V,64,938,1600,5000 ps,21000 ps,8 tck,33000 ps,13500 ps,7800000 ps,350000 ps,13500 ps,3700 ps,5300 ps,7500 ps,15000 ps,2500 ps,7500 ps,270 ns,128 tck,1024 tck,11,11,8,RZQ/6}
   puts $data_file {SODIMMs,MT40A1G8-1333,1,0,1,17,16,10,2,2,1,1,1,1,093E,8GB,1Gb,64,8,8,1.2V,64,938,1600,5000 ps,21000 ps,8 tck,33000 ps,13500 ps,7800000 ps,350000 ps,13500 ps,3700 ps,5300 ps,7500 ps,15000 ps,2500 ps,7500 ps,270 ns,128 tck,1024 tck,9,9,8,RZQ/6}

   close $data_file
}
# End of write_ddr4_file_design_1_ddr4_0_0()



##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: TX_REFCLK
proc create_hier_cell_TX_REFCLK { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_TX_REFCLK() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 HDMI_TX_REFCLK


  # Create pins
  create_bd_pin -dir I -from 0 -to 0 BUFG_GT_CE
  create_bd_pin -dir O -from 0 -to 0 -type clk BUFG_GT_O
  create_bd_pin -dir O -from 0 -to 0 -type clk IBUF_OUT

  # Create instance: HDMI_TX_REFCLK, and set properties
  set HDMI_TX_REFCLK [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 HDMI_TX_REFCLK ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {IBUFDSGTE} \
 ] $HDMI_TX_REFCLK

  # Create instance: util_ds_buf_0, and set properties
  set util_ds_buf_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_0 ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {BUFG_GT} \
 ] $util_ds_buf_0

  # Create interface connections
  connect_bd_intf_net -intf_net CLK_IN_D_0_2 [get_bd_intf_pins HDMI_TX_REFCLK] [get_bd_intf_pins HDMI_TX_REFCLK/CLK_IN_D]

  # Create port connections
  connect_bd_net -net HDMI_TX_REFCLK_IBUF_DS_ODIV2 [get_bd_pins HDMI_TX_REFCLK/IBUF_DS_ODIV2] [get_bd_pins util_ds_buf_0/BUFG_GT_I]
  connect_bd_net -net VCC_dout [get_bd_pins BUFG_GT_CE] [get_bd_pins util_ds_buf_0/BUFG_GT_CE]
  connect_bd_net -net util_ds_buf_0_BUFG_GT_O [get_bd_pins BUFG_GT_O] [get_bd_pins util_ds_buf_0/BUFG_GT_O]
  connect_bd_net -net util_ds_buf_1_IBUF_OUT [get_bd_pins IBUF_OUT] [get_bd_pins HDMI_TX_REFCLK/IBUF_OUT]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: RX_DRU_CLK
proc create_hier_cell_RX_DRU_CLK { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_RX_DRU_CLK() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 HDMI_RX_DRU_CLK


  # Create pins
  create_bd_pin -dir I -from 0 -to 0 BUFG_GT_CE
  create_bd_pin -dir O -from 0 -to 0 -type clk BUFG_GT_O
  create_bd_pin -dir O -from 0 -to 0 -type clk IBUF_OUT

  # Create instance: CLK_MGTX_CLK1, and set properties
  set CLK_MGTX_CLK1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 CLK_MGTX_CLK1 ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {IBUFDSGTE} \
 ] $CLK_MGTX_CLK1

  # Create instance: util_ds_buf_1, and set properties
  set util_ds_buf_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.1 util_ds_buf_1 ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {BUFG_GT} \
 ] $util_ds_buf_1

  # Create interface connections
  connect_bd_intf_net -intf_net CLK_IN_D_1_1 [get_bd_intf_pins HDMI_RX_DRU_CLK] [get_bd_intf_pins CLK_MGTX_CLK1/CLK_IN_D]

  # Create port connections
  connect_bd_net -net CLK_MGTX_CLK1_IBUF_DS_ODIV2 [get_bd_pins CLK_MGTX_CLK1/IBUF_DS_ODIV2] [get_bd_pins util_ds_buf_1/BUFG_GT_I]
  connect_bd_net -net VCC_dout [get_bd_pins BUFG_GT_CE] [get_bd_pins util_ds_buf_1/BUFG_GT_CE]
  connect_bd_net -net util_ds_buf_1_BUFG_GT_O [get_bd_pins BUFG_GT_O] [get_bd_pins util_ds_buf_1/BUFG_GT_O]
  connect_bd_net -net util_ds_buf_2_IBUF_OUT [get_bd_pins IBUF_OUT] [get_bd_pins CLK_MGTX_CLK1/IBUF_OUT]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: HDMI_TX
proc create_hier_cell_HDMI_TX { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_HDMI_TX() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 HDMI_TX_SRC

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 LINK_DATA0_OUT

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 LINK_DATA1_OUT

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 LINK_DATA2_OUT

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 SB_STATUS_IN

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CPU_IN

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_CTRL


  # Create pins
  create_bd_pin -dir I -type clk ACLK
  create_bd_pin -dir I -type rst ARESETN
  create_bd_pin -dir I -from 94 -to 0 Din
  create_bd_pin -dir I HDMI_TX_HPD
  create_bd_pin -dir I -type rst S00_ARESETN
  create_bd_pin -dir O -type intr interrupt
  create_bd_pin -dir O -type intr irq
  create_bd_pin -dir I -type clk link_clk
  create_bd_pin -dir I -type clk s_axis_audio_aclk
  create_bd_pin -dir I -from 47 -to 0 s_axis_video_TDATA
  create_bd_pin -dir I -type clk video_clk

  # Create instance: axi_interconnect_hp1, and set properties
  set axi_interconnect_hp1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_hp1 ]
  set_property -dict [ list \
   CONFIG.M00_HAS_DATA_FIFO {2} \
   CONFIG.M00_HAS_REGSLICE {4} \
   CONFIG.NUM_MI {1} \
   CONFIG.NUM_SI {4} \
   CONFIG.S00_HAS_DATA_FIFO {2} \
   CONFIG.S00_HAS_REGSLICE {4} \
   CONFIG.S01_HAS_DATA_FIFO {2} \
   CONFIG.S01_HAS_REGSLICE {4} \
   CONFIG.S02_HAS_DATA_FIFO {2} \
   CONFIG.S02_HAS_REGSLICE {4} \
   CONFIG.S03_HAS_DATA_FIFO {2} \
   CONFIG.S03_HAS_REGSLICE {4} \
   CONFIG.STRATEGY {2} \
 ] $axi_interconnect_hp1

  # Create instance: mix_reset, and set properties
  set mix_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 mix_reset ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {1} \
   CONFIG.DIN_TO {1} \
   CONFIG.DIN_WIDTH {95} \
   CONFIG.DOUT_WIDTH {1} \
 ] $mix_reset

  # Create instance: v_hdmi_tx_ss_0, and set properties
  set v_hdmi_tx_ss_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_hdmi_tx_ss:3.1 v_hdmi_tx_ss_0 ]
  set_property -dict [ list \
   CONFIG.C_EXDES_NIDRU {true} \
   CONFIG.C_EXDES_RX_PLL_SELECTION {6} \
   CONFIG.C_EXDES_TOPOLOGY {0} \
   CONFIG.C_EXDES_TX_PLL_SELECTION {0} \
   CONFIG.C_INCLUDE_YUV420_SUP {true} \
 ] $v_hdmi_tx_ss_0

  # Create instance: v_mix_0, and set properties
  set v_mix_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_mix:4.0 v_mix_0 ]
  set_property -dict [ list \
   CONFIG.AXIMM_DATA_WIDTH {128} \
   CONFIG.C_M_AXI_MM_VIDEO1_DATA_WIDTH {128} \
   CONFIG.C_M_AXI_MM_VIDEO2_DATA_WIDTH {128} \
   CONFIG.C_M_AXI_MM_VIDEO3_DATA_WIDTH {128} \
   CONFIG.C_M_AXI_MM_VIDEO4_DATA_WIDTH {128} \
   CONFIG.C_M_AXI_MM_VIDEO5_DATA_WIDTH {128} \
   CONFIG.C_M_AXI_MM_VIDEO6_DATA_WIDTH {128} \
   CONFIG.C_M_AXI_MM_VIDEO7_DATA_WIDTH {128} \
   CONFIG.C_M_AXI_MM_VIDEO8_DATA_WIDTH {128} \
   CONFIG.LAYER1_ALPHA {true} \
   CONFIG.LAYER1_VIDEO_FORMAT {12} \
   CONFIG.LAYER2_ALPHA {true} \
   CONFIG.LAYER2_VIDEO_FORMAT {12} \
   CONFIG.LAYER3_ALPHA {true} \
   CONFIG.LAYER3_VIDEO_FORMAT {28} \
   CONFIG.LAYER4_ALPHA {true} \
   CONFIG.LAYER4_VIDEO_FORMAT {26} \
   CONFIG.MAX_COLS {4096} \
   CONFIG.NR_LAYERS {5} \
   CONFIG.SAMPLES_PER_CLOCK {2} \
 ] $v_mix_0

  # Create interface connections
  connect_bd_intf_net -intf_net axi_interconnect_0_M09_AXI [get_bd_intf_pins S_AXI_CPU_IN] [get_bd_intf_pins v_hdmi_tx_ss_0/S_AXI_CPU_IN]
  connect_bd_intf_net -intf_net axi_interconnect_hp1_M00_AXI [get_bd_intf_pins M00_AXI] [get_bd_intf_pins axi_interconnect_hp1/M00_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M01_AXI [get_bd_intf_pins s_axi_CTRL] [get_bd_intf_pins v_mix_0/s_axi_CTRL]
  connect_bd_intf_net -intf_net v_hdmi_tx_ss_0_DDC_OUT [get_bd_intf_pins HDMI_TX_SRC] [get_bd_intf_pins v_hdmi_tx_ss_0/DDC_OUT]
  connect_bd_intf_net -intf_net v_hdmi_tx_ss_0_LINK_DATA0_OUT [get_bd_intf_pins LINK_DATA0_OUT] [get_bd_intf_pins v_hdmi_tx_ss_0/LINK_DATA0_OUT]
  connect_bd_intf_net -intf_net v_hdmi_tx_ss_0_LINK_DATA1_OUT [get_bd_intf_pins LINK_DATA1_OUT] [get_bd_intf_pins v_hdmi_tx_ss_0/LINK_DATA1_OUT]
  connect_bd_intf_net -intf_net v_hdmi_tx_ss_0_LINK_DATA2_OUT [get_bd_intf_pins LINK_DATA2_OUT] [get_bd_intf_pins v_hdmi_tx_ss_0/LINK_DATA2_OUT]
  connect_bd_intf_net -intf_net v_mix_0_m_axi_mm_video1 [get_bd_intf_pins axi_interconnect_hp1/S00_AXI] [get_bd_intf_pins v_mix_0/m_axi_mm_video1]
  connect_bd_intf_net -intf_net v_mix_0_m_axi_mm_video2 [get_bd_intf_pins axi_interconnect_hp1/S01_AXI] [get_bd_intf_pins v_mix_0/m_axi_mm_video2]
  connect_bd_intf_net -intf_net v_mix_0_m_axi_mm_video3 [get_bd_intf_pins axi_interconnect_hp1/S02_AXI] [get_bd_intf_pins v_mix_0/m_axi_mm_video3]
  connect_bd_intf_net -intf_net v_mix_0_m_axi_mm_video4 [get_bd_intf_pins axi_interconnect_hp1/S03_AXI] [get_bd_intf_pins v_mix_0/m_axi_mm_video4]
  connect_bd_intf_net -intf_net v_mix_0_m_axis_video [get_bd_intf_pins v_hdmi_tx_ss_0/VIDEO_IN] [get_bd_intf_pins v_mix_0/m_axis_video]
  connect_bd_intf_net -intf_net vid_phy_controller_0_vid_phy_status_sb_tx [get_bd_intf_pins SB_STATUS_IN] [get_bd_intf_pins v_hdmi_tx_ss_0/SB_STATUS_IN]

  # Create port connections
  connect_bd_net -net GND_dout [get_bd_pins s_axis_video_TDATA] [get_bd_pins v_mix_0/s_axis_video_TDATA] [get_bd_pins v_mix_0/s_axis_video_TVALID]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins s_axis_audio_aclk] [get_bd_pins v_hdmi_tx_ss_0/s_axi_cpu_aclk] [get_bd_pins v_hdmi_tx_ss_0/s_axis_audio_aclk]
  connect_bd_net -net clk_wiz_0_clk_out3 [get_bd_pins ACLK] [get_bd_pins axi_interconnect_hp1/ACLK] [get_bd_pins axi_interconnect_hp1/M00_ACLK] [get_bd_pins axi_interconnect_hp1/S00_ACLK] [get_bd_pins axi_interconnect_hp1/S01_ACLK] [get_bd_pins axi_interconnect_hp1/S02_ACLK] [get_bd_pins axi_interconnect_hp1/S03_ACLK] [get_bd_pins v_hdmi_tx_ss_0/s_axis_video_aclk] [get_bd_pins v_mix_0/ap_clk]
  connect_bd_net -net hpd_0_1 [get_bd_pins HDMI_TX_HPD] [get_bd_pins v_hdmi_tx_ss_0/hpd]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins ARESETN] [get_bd_pins axi_interconnect_hp1/ARESETN]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins S00_ARESETN] [get_bd_pins axi_interconnect_hp1/M00_ARESETN] [get_bd_pins axi_interconnect_hp1/S00_ARESETN] [get_bd_pins axi_interconnect_hp1/S01_ARESETN] [get_bd_pins axi_interconnect_hp1/S02_ARESETN] [get_bd_pins axi_interconnect_hp1/S03_ARESETN] [get_bd_pins v_hdmi_tx_ss_0/s_axi_cpu_aresetn] [get_bd_pins v_hdmi_tx_ss_0/s_axis_audio_aresetn] [get_bd_pins v_hdmi_tx_ss_0/s_axis_video_aresetn]
  connect_bd_net -net v_hdmi_tx_ss_0_irq [get_bd_pins irq] [get_bd_pins v_hdmi_tx_ss_0/irq]
  connect_bd_net -net v_mix_0_interrupt [get_bd_pins interrupt] [get_bd_pins v_mix_0/interrupt]
  connect_bd_net -net vid_phy_controller_0_tx_video_clk [get_bd_pins video_clk] [get_bd_pins v_hdmi_tx_ss_0/video_clk]
  connect_bd_net -net vid_phy_controller_0_txoutclk [get_bd_pins link_clk] [get_bd_pins v_hdmi_tx_ss_0/link_clk]
  connect_bd_net -net xlslice_0_Dout [get_bd_pins mix_reset/Dout] [get_bd_pins v_mix_0/ap_rst_n]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_gpio_o [get_bd_pins Din] [get_bd_pins mix_reset/Din]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: HDMI_RX
proc create_hier_cell_HDMI_RX { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_HDMI_RX() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 HDMI_RX_DDC

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 LINK_DATA0_IN

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 LINK_DATA1_IN

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 LINK_DATA2_IN

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M00_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 SB_STATUS_IN

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_CPU_IN

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_CTRL

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 s_axi_ctrl1


  # Create pins
  create_bd_pin -dir I -type clk ACLK
  create_bd_pin -dir I -type rst ARESETN
  create_bd_pin -dir I -from 94 -to 0 Din
  create_bd_pin -dir I -type rst S00_ARESETN
  create_bd_pin -dir I -type clk aclk_ctrl
  create_bd_pin -dir O -type intr interrupt
  create_bd_pin -dir O -type intr irq
  create_bd_pin -dir I -type clk link_clk
  create_bd_pin -dir I -type clk video_clk

  # Create instance: axi_data_fifo_0, and set properties
  set axi_data_fifo_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_data_fifo:2.1 axi_data_fifo_0 ]
  set_property -dict [ list \
   CONFIG.ADDR_WIDTH {32} \
   CONFIG.DATA_WIDTH {128} \
   CONFIG.ID_WIDTH {0} \
   CONFIG.PROTOCOL {AXI4} \
   CONFIG.READ_WRITE_MODE {READ_WRITE} \
   CONFIG.WRITE_FIFO_DELAY {1} \
   CONFIG.WRITE_FIFO_DEPTH {512} \
 ] $axi_data_fifo_0

  # Create instance: axi_interconnect_hp2, and set properties
  set axi_interconnect_hp2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_hp2 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
   CONFIG.S00_HAS_DATA_FIFO {2} \
   CONFIG.S00_HAS_REGSLICE {1} \
 ] $axi_interconnect_hp2

  # Create instance: v_frmbuf_wr_0, and set properties
  set v_frmbuf_wr_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_frmbuf_wr:2.1 v_frmbuf_wr_0 ]
  set_property -dict [ list \
   CONFIG.HAS_RGB8 {0} \
   CONFIG.HAS_UYVY8 {1} \
   CONFIG.HAS_Y8 {1} \
   CONFIG.HAS_YUYV8 {1} \
 ] $v_frmbuf_wr_0

  # Create instance: v_frmbuf_wr_reset, and set properties
  set v_frmbuf_wr_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 v_frmbuf_wr_reset ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {2} \
   CONFIG.DIN_TO {2} \
   CONFIG.DIN_WIDTH {95} \
   CONFIG.DOUT_WIDTH {1} \
 ] $v_frmbuf_wr_reset

  # Create instance: v_hdmi_rx_ss_0, and set properties
  set v_hdmi_rx_ss_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_hdmi_rx_ss:3.1 v_hdmi_rx_ss_0 ]
  set_property -dict [ list \
   CONFIG.C_EXDES_RX_PLL_SELECTION {6} \
   CONFIG.C_EXDES_TX_PLL_SELECTION {0} \
   CONFIG.C_INCLUDE_YUV420_SUP {true} \
 ] $v_hdmi_rx_ss_0

  # Create instance: v_proc_ss_0, and set properties
  set v_proc_ss_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_proc_ss:2.1 v_proc_ss_0 ]
  set_property -dict [ list \
   CONFIG.C_ENABLE_CSC {true} \
   CONFIG.C_H_SCALER_TAPS {8} \
   CONFIG.C_MAX_DATA_WIDTH {8} \
   CONFIG.C_TOPOLOGY {0} \
   CONFIG.C_V_SCALER_TAPS {8} \
 ] $v_proc_ss_0

  # Create instance: v_proc_ss_reset, and set properties
  set v_proc_ss_reset [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 v_proc_ss_reset ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {0} \
   CONFIG.DIN_TO {0} \
   CONFIG.DIN_WIDTH {95} \
 ] $v_proc_ss_reset

  # Create interface connections
  connect_bd_intf_net -intf_net axi_data_fifo_0_M_AXI [get_bd_intf_pins axi_data_fifo_0/M_AXI] [get_bd_intf_pins axi_interconnect_hp2/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M10_AXI [get_bd_intf_pins S_AXI_CPU_IN] [get_bd_intf_pins v_hdmi_rx_ss_0/S_AXI_CPU_IN]
  connect_bd_intf_net -intf_net axi_interconnect_0_M11_AXI [get_bd_intf_pins s_axi_ctrl1] [get_bd_intf_pins v_proc_ss_0/s_axi_ctrl]
  connect_bd_intf_net -intf_net axi_interconnect_hp2_M00_AXI [get_bd_intf_pins M00_AXI] [get_bd_intf_pins axi_interconnect_hp2/M00_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins s_axi_CTRL] [get_bd_intf_pins v_frmbuf_wr_0/s_axi_CTRL]
  connect_bd_intf_net -intf_net v_frmbuf_wr_0_m_axi_mm_video [get_bd_intf_pins axi_data_fifo_0/S_AXI] [get_bd_intf_pins v_frmbuf_wr_0/m_axi_mm_video]
  connect_bd_intf_net -intf_net v_hdmi_rx_ss_0_DDC_OUT [get_bd_intf_pins HDMI_RX_DDC] [get_bd_intf_pins v_hdmi_rx_ss_0/DDC_OUT]
  connect_bd_intf_net -intf_net v_hdmi_rx_ss_0_VIDEO_OUT [get_bd_intf_pins v_hdmi_rx_ss_0/VIDEO_OUT] [get_bd_intf_pins v_proc_ss_0/s_axis]
  connect_bd_intf_net -intf_net v_proc_ss_0_m_axis [get_bd_intf_pins v_frmbuf_wr_0/s_axis_video] [get_bd_intf_pins v_proc_ss_0/m_axis]
  connect_bd_intf_net -intf_net vid_phy_controller_0_vid_phy_rx_axi4s_ch0 [get_bd_intf_pins LINK_DATA0_IN] [get_bd_intf_pins v_hdmi_rx_ss_0/LINK_DATA0_IN]
  connect_bd_intf_net -intf_net vid_phy_controller_0_vid_phy_rx_axi4s_ch1 [get_bd_intf_pins LINK_DATA1_IN] [get_bd_intf_pins v_hdmi_rx_ss_0/LINK_DATA1_IN]
  connect_bd_intf_net -intf_net vid_phy_controller_0_vid_phy_rx_axi4s_ch2 [get_bd_intf_pins LINK_DATA2_IN] [get_bd_intf_pins v_hdmi_rx_ss_0/LINK_DATA2_IN]
  connect_bd_intf_net -intf_net vid_phy_controller_0_vid_phy_status_sb_rx [get_bd_intf_pins SB_STATUS_IN] [get_bd_intf_pins v_hdmi_rx_ss_0/SB_STATUS_IN]

  # Create port connections
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins aclk_ctrl] [get_bd_pins v_hdmi_rx_ss_0/s_axi_cpu_aclk] [get_bd_pins v_proc_ss_0/aclk_ctrl]
  connect_bd_net -net clk_wiz_0_clk_out3 [get_bd_pins ACLK] [get_bd_pins axi_data_fifo_0/aclk] [get_bd_pins axi_interconnect_hp2/ACLK] [get_bd_pins axi_interconnect_hp2/M00_ACLK] [get_bd_pins axi_interconnect_hp2/S00_ACLK] [get_bd_pins v_frmbuf_wr_0/ap_clk] [get_bd_pins v_hdmi_rx_ss_0/s_axis_audio_aclk] [get_bd_pins v_hdmi_rx_ss_0/s_axis_video_aclk] [get_bd_pins v_proc_ss_0/aclk_axis]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins ARESETN] [get_bd_pins axi_interconnect_hp2/ARESETN]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins S00_ARESETN] [get_bd_pins axi_data_fifo_0/aresetn] [get_bd_pins axi_interconnect_hp2/M00_ARESETN] [get_bd_pins axi_interconnect_hp2/S00_ARESETN] [get_bd_pins v_hdmi_rx_ss_0/s_axi_cpu_aresetn] [get_bd_pins v_hdmi_rx_ss_0/s_axis_audio_aresetn] [get_bd_pins v_hdmi_rx_ss_0/s_axis_video_aresetn]
  connect_bd_net -net v_frmbuf_wr_0_interrupt [get_bd_pins interrupt] [get_bd_pins v_frmbuf_wr_0/interrupt]
  connect_bd_net -net v_hdmi_rx_ss_0_irq [get_bd_pins irq] [get_bd_pins v_hdmi_rx_ss_0/irq]
  connect_bd_net -net vid_phy_controller_0_rx_video_clk [get_bd_pins video_clk] [get_bd_pins v_hdmi_rx_ss_0/video_clk]
  connect_bd_net -net vid_phy_controller_0_rxoutclk [get_bd_pins link_clk] [get_bd_pins v_hdmi_rx_ss_0/link_clk]
  connect_bd_net -net xlslice_0_Dout1 [get_bd_pins v_proc_ss_0/aresetn_ctrl] [get_bd_pins v_proc_ss_reset/Dout]
  connect_bd_net -net xlslice_1_Dout [get_bd_pins v_frmbuf_wr_0/ap_rst_n] [get_bd_pins v_frmbuf_wr_reset/Dout]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_gpio_o [get_bd_pins Din] [get_bd_pins v_frmbuf_wr_reset/Din] [get_bd_pins v_proc_ss_reset/Din]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: GPIO_OUT
proc create_hier_cell_GPIO_OUT { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_GPIO_OUT() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir O -from 0 -to 0 BT_EN
  create_bd_pin -dir I -from 94 -to 0 Din
  create_bd_pin -dir O -from 2 -to 0 LEDS
  create_bd_pin -dir O -from 0 -to 0 WLAN_EN

  # Create instance: BT_EN, and set properties
  set BT_EN [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 BT_EN ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {4} \
   CONFIG.DIN_TO {4} \
   CONFIG.DIN_WIDTH {95} \
   CONFIG.DOUT_WIDTH {1} \
 ] $BT_EN

  # Create instance: LEDS, and set properties
  set LEDS [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 LEDS ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {9} \
   CONFIG.DIN_TO {7} \
   CONFIG.DIN_WIDTH {95} \
   CONFIG.DOUT_WIDTH {3} \
 ] $LEDS

  # Create instance: WLAN_EN, and set properties
  set WLAN_EN [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 WLAN_EN ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {5} \
   CONFIG.DIN_TO {5} \
   CONFIG.DIN_WIDTH {95} \
   CONFIG.DOUT_WIDTH {1} \
 ] $WLAN_EN

  # Create port connections
  connect_bd_net -net BT_EN_Dout [get_bd_pins BT_EN] [get_bd_pins BT_EN/Dout]
  connect_bd_net -net WLAN_EN_Dout [get_bd_pins WLAN_EN] [get_bd_pins WLAN_EN/Dout]
  connect_bd_net -net xlslice_0_Dout3 [get_bd_pins LEDS] [get_bd_pins LEDS/Dout]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_gpio_o [get_bd_pins Din] [get_bd_pins BT_EN/Din] [get_bd_pins LEDS/Din] [get_bd_pins WLAN_EN/Din]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: GPIO
proc create_hier_cell_GPIO { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_GPIO() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 ETH1_RESET_n

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 PMOD1

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 PMOD2

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 SYSMON

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI1


  # Create pins
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn

  # Create instance: GPIO1, and set properties
  set GPIO1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 GPIO1 ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS_2 {0} \
   CONFIG.C_DOUT_DEFAULT {0x00000000} \
   CONFIG.C_DOUT_DEFAULT_2 {0xFFFFFFFF} \
   CONFIG.C_GPIO2_WIDTH {1} \
   CONFIG.C_GPIO_WIDTH {8} \
   CONFIG.C_IS_DUAL {1} \
 ] $GPIO1

  # Create instance: PMOD, and set properties
  set PMOD [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 PMOD ]
  set_property -dict [ list \
   CONFIG.C_ALL_INPUTS {0} \
   CONFIG.C_ALL_OUTPUTS {0} \
   CONFIG.C_GPIO2_WIDTH {8} \
   CONFIG.C_GPIO_WIDTH {8} \
   CONFIG.C_IS_DUAL {1} \
 ] $PMOD

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins ETH1_RESET_n] [get_bd_intf_pins GPIO1/GPIO2]
  connect_bd_intf_net -intf_net PMOD_GPIO [get_bd_intf_pins PMOD1] [get_bd_intf_pins PMOD/GPIO]
  connect_bd_intf_net -intf_net PMOD_GPIO2 [get_bd_intf_pins PMOD2] [get_bd_intf_pins PMOD/GPIO2]
  connect_bd_intf_net -intf_net SYSMON_ETH1_RST_GPIO [get_bd_intf_pins SYSMON] [get_bd_intf_pins GPIO1/GPIO]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins S_AXI1] [get_bd_intf_pins PMOD/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins S_AXI] [get_bd_intf_pins GPIO1/S_AXI]

  # Create port connections
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins s_axi_aclk] [get_bd_pins GPIO1/s_axi_aclk] [get_bd_pins PMOD/s_axi_aclk]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins s_axi_aresetn] [get_bd_pins GPIO1/s_axi_aresetn] [get_bd_pins PMOD/s_axi_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: FMC2
proc create_hier_cell_FMC2 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_FMC2() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC2_4

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC2_5

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC2_6

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC2_7

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC2_8

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC2_9

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI1

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI2


  # Create pins
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn

  # Create instance: FMC2_1, and set properties
  set FMC2_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 FMC2_1 ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {0} \
   CONFIG.C_GPIO_WIDTH {32} \
   CONFIG.C_IS_DUAL {1} \
 ] $FMC2_1

  # Create instance: FMC2_2, and set properties
  set FMC2_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 FMC2_2 ]
  set_property -dict [ list \
   CONFIG.C_ALL_INPUTS {0} \
   CONFIG.C_IS_DUAL {1} \
 ] $FMC2_2

  # Create instance: FMC2_3, and set properties
  set FMC2_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 FMC2_3 ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {0} \
   CONFIG.C_GPIO2_WIDTH {10} \
   CONFIG.C_IS_DUAL {1} \
 ] $FMC2_3

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins FMC2_4] [get_bd_intf_pins FMC2_1/GPIO]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins FMC2_5] [get_bd_intf_pins FMC2_1/GPIO2]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins FMC2_6] [get_bd_intf_pins FMC2_2/GPIO]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins FMC2_7] [get_bd_intf_pins FMC2_2/GPIO2]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins FMC2_8] [get_bd_intf_pins FMC2_3/GPIO]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins FMC2_9] [get_bd_intf_pins FMC2_3/GPIO2]
  connect_bd_intf_net -intf_net S_AXI1_1 [get_bd_intf_pins S_AXI1] [get_bd_intf_pins FMC2_2/S_AXI]
  connect_bd_intf_net -intf_net S_AXI2_1 [get_bd_intf_pins S_AXI2] [get_bd_intf_pins FMC2_3/S_AXI]
  connect_bd_intf_net -intf_net S_AXI_1 [get_bd_intf_pins S_AXI] [get_bd_intf_pins FMC2_1/S_AXI]

  # Create port connections
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins s_axi_aclk] [get_bd_pins FMC2_1/s_axi_aclk] [get_bd_pins FMC2_2/s_axi_aclk] [get_bd_pins FMC2_3/s_axi_aclk]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins s_axi_aresetn] [get_bd_pins FMC2_1/s_axi_aresetn] [get_bd_pins FMC2_2/s_axi_aresetn] [get_bd_pins FMC2_3/s_axi_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: FMC1
proc create_hier_cell_FMC1 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_FMC1() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC1_1

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC1_2

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC1_3

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC1_4

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC1_5

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC1_6

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI1

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI2


  # Create pins
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -type rst s_axi_aresetn

  # Create instance: FMC1_1, and set properties
  set FMC1_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 FMC1_1 ]
  set_property -dict [ list \
   CONFIG.C_ALL_INPUTS {0} \
   CONFIG.C_IS_DUAL {1} \
 ] $FMC1_1

  # Create instance: FMC1_2, and set properties
  set FMC1_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 FMC1_2 ]
  set_property -dict [ list \
   CONFIG.C_ALL_OUTPUTS {0} \
   CONFIG.C_IS_DUAL {1} \
 ] $FMC1_2

  # Create instance: FMC1_3, and set properties
  set FMC1_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 FMC1_3 ]
  set_property -dict [ list \
   CONFIG.C_ALL_INPUTS {0} \
   CONFIG.C_GPIO2_WIDTH {10} \
   CONFIG.C_IS_DUAL {1} \
 ] $FMC1_3

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins FMC1_2] [get_bd_intf_pins FMC1_1/GPIO2]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins FMC1_3] [get_bd_intf_pins FMC1_2/GPIO]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins FMC1_4] [get_bd_intf_pins FMC1_2/GPIO2]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins FMC1_5] [get_bd_intf_pins FMC1_3/GPIO]
  connect_bd_intf_net -intf_net Conn5 [get_bd_intf_pins FMC1_6] [get_bd_intf_pins FMC1_3/GPIO2]
  connect_bd_intf_net -intf_net FMC1_1_GPIO [get_bd_intf_pins FMC1_1] [get_bd_intf_pins FMC1_1/GPIO]
  connect_bd_intf_net -intf_net axi_interconnect_0_M09_AXI [get_bd_intf_pins S_AXI] [get_bd_intf_pins FMC1_1/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M10_AXI [get_bd_intf_pins S_AXI1] [get_bd_intf_pins FMC1_2/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M11_AXI [get_bd_intf_pins S_AXI2] [get_bd_intf_pins FMC1_3/S_AXI]

  # Create port connections
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins s_axi_aclk] [get_bd_pins FMC1_1/s_axi_aclk] [get_bd_pins FMC1_2/s_axi_aclk] [get_bd_pins FMC1_3/s_axi_aclk]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins s_axi_aresetn] [get_bd_pins FMC1_1/s_axi_aresetn] [get_bd_pins FMC1_2/s_axi_aresetn] [get_bd_pins FMC1_3/s_axi_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: DDR4
proc create_hier_cell_DDR4 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_DDR4() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 PL_DDR4

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 PL_DDR4_CLK

  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S00_AXI


  # Create pins
  create_bd_pin -dir O PL_DDR4_CALIB_LED
  create_bd_pin -dir O -type clk slowest_sync_clk
  create_bd_pin -dir I -from 47 -to 0 -type rst sys_rst

  # Create instance: DDR4_PL, and set properties
  set DDR4_PL [ create_bd_cell -type ip -vlnv xilinx.com:ip:ddr4:2.2 DDR4_PL ]

   # Generate the DDR4 Custom Parts File
   set str_ddr4_folder [get_property IP_DIR [ get_ips [ get_property CONFIG.Component_Name $DDR4_PL ] ] ]
   set str_ddr4_file_name custom_parts_ddr4_single_fixed.csv
   set str_ddr4_file_path ${str_ddr4_folder}/${str_ddr4_file_name}

   write_ddr4_file_design_1_ddr4_0_0 $str_ddr4_file_path

  set_property -dict [ list \
   CONFIG.C0.CKE_WIDTH {1} \
   CONFIG.C0.CK_WIDTH {1} \
   CONFIG.C0.CS_WIDTH {1} \
   CONFIG.C0.DDR4_AxiAddressWidth {33} \
   CONFIG.C0.DDR4_AxiDataWidth {512} \
   CONFIG.C0.DDR4_CLKFBOUT_MULT {8} \
   CONFIG.C0.DDR4_CLKOUT0_DIVIDE {6} \
   CONFIG.C0.DDR4_CasLatency {15} \
   CONFIG.C0.DDR4_CasWriteLatency {11} \
   CONFIG.C0.DDR4_CustomParts {custom_parts_ddr4_single_fixed.csv} \
   CONFIG.C0.DDR4_DataMask {DM_NO_DBI} \
   CONFIG.C0.DDR4_DataWidth {64} \
   CONFIG.C0.DDR4_Ecc {false} \
   CONFIG.C0.DDR4_InputClockPeriod {5002} \
   CONFIG.C0.DDR4_MemoryPart {MT40A1G8-2133} \
   CONFIG.C0.DDR4_MemoryType {SODIMMs} \
   CONFIG.C0.DDR4_Specify_MandD {false} \
   CONFIG.C0.DDR4_TimePeriod {938} \
   CONFIG.C0.DDR4_isCustom {true} \
   CONFIG.C0.ODT_WIDTH {1} \
 ] $DDR4_PL

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
   CONFIG.S00_HAS_REGSLICE {4} \
 ] $axi_interconnect_0

  # Create instance: rst_ddr4_0_200M, and set properties
  set rst_ddr4_0_200M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ddr4_0_200M ]

  # Create interface connections
  connect_bd_intf_net -intf_net C0_SYS_CLK_0_1 [get_bd_intf_pins PL_DDR4_CLK] [get_bd_intf_pins DDR4_PL/C0_SYS_CLK]
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S00_AXI] [get_bd_intf_pins axi_interconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins DDR4_PL/C0_DDR4_S_AXI] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net ddr4_0_C0_DDR4 [get_bd_intf_pins PL_DDR4] [get_bd_intf_pins DDR4_PL/C0_DDR4]

  # Create port connections
  connect_bd_net -net ARESETN_1 [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins rst_ddr4_0_200M/interconnect_aresetn]
  connect_bd_net -net DDR4_PL_c0_init_calib_complete [get_bd_pins PL_DDR4_CALIB_LED] [get_bd_pins DDR4_PL/c0_init_calib_complete]
  connect_bd_net -net GND_dout [get_bd_pins sys_rst] [get_bd_pins DDR4_PL/sys_rst]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins slowest_sync_clk] [get_bd_pins DDR4_PL/c0_ddr4_ui_clk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins rst_ddr4_0_200M/slowest_sync_clk]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk_sync_rst [get_bd_pins DDR4_PL/c0_ddr4_ui_clk_sync_rst] [get_bd_pins rst_ddr4_0_200M/ext_reset_in]
  connect_bd_net -net rst_ddr4_0_200M_peripheral_aresetn [get_bd_pins DDR4_PL/c0_ddr4_aresetn] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins rst_ddr4_0_200M/peripheral_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set ETH1_MDIO [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:mdio_rtl:1.0 ETH1_MDIO ]

  set ETH1_RESET_n [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 ETH1_RESET_n ]

  set ETH1_RGMII [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:rgmii_rtl:1.0 ETH1_RGMII ]

  set FMC1_1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC1_1 ]

  set FMC1_2 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC1_2 ]

  set FMC1_3 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC1_3 ]

  set FMC1_4 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC1_4 ]

  set FMC1_5 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC1_5 ]

  set FMC1_6 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC1_6 ]

  set FMC2_1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC2_1 ]

  set FMC2_2 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC2_2 ]

  set FMC2_3 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC2_3 ]

  set FMC2_4 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC2_4 ]

  set FMC2_5 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC2_5 ]

  set FMC2_6 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 FMC2_6 ]

  set HDMI_RX_DDC [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 HDMI_RX_DDC ]

  set HDMI_RX_DRU_CLK [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 HDMI_RX_DRU_CLK ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   ] $HDMI_RX_DRU_CLK

  set HDMI_TX_I2C [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 HDMI_TX_I2C ]

  set HDMI_TX_REFCLK [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 HDMI_TX_REFCLK ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
   ] $HDMI_TX_REFCLK

  set HDMI_TX_SRC [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 HDMI_TX_SRC ]

  set PL_DDR4 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddr4_rtl:1.0 PL_DDR4 ]

  set PL_DDR4_CLK [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 PL_DDR4_CLK ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {200000000} \
   ] $PL_DDR4_CLK

  set PMOD1 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 PMOD1 ]

  set PMOD2 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 PMOD2 ]

  set SYSMON [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:gpio_rtl:1.0 SYSMON ]

  set UART [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:uart_rtl:1.0 UART ]


  # Create ports
  set BT_EN [ create_bd_port -dir O -from 0 -to 0 BT_EN ]
  set BT_HCI_CTS [ create_bd_port -dir O BT_HCI_CTS ]
  set BT_HCI_RTS [ create_bd_port -dir I BT_HCI_RTS ]
  set BT_HCI_RX [ create_bd_port -dir O BT_HCI_RX ]
  set BT_HCI_TX [ create_bd_port -dir I BT_HCI_TX ]
  set HDMI_RX_CLK_N [ create_bd_port -dir I -type clk HDMI_RX_CLK_N ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
 ] $HDMI_RX_CLK_N
  set HDMI_RX_CLK_P [ create_bd_port -dir I -type clk HDMI_RX_CLK_P ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {156250000} \
 ] $HDMI_RX_CLK_P
  set HDMI_RX_DATA_N [ create_bd_port -dir I -from 2 -to 0 HDMI_RX_DATA_N ]
  set HDMI_RX_DATA_P [ create_bd_port -dir I -from 2 -to 0 HDMI_RX_DATA_P ]
  set HDMI_TXN [ create_bd_port -dir O -from 2 -to 0 HDMI_TXN ]
  set HDMI_TXP [ create_bd_port -dir O -from 2 -to 0 HDMI_TXP ]
  set HDMI_TX_CLKN [ create_bd_port -dir O -type clk HDMI_TX_CLKN ]
  set HDMI_TX_CLKP [ create_bd_port -dir O -type clk HDMI_TX_CLKP ]
  set HDMI_TX_HPD [ create_bd_port -dir I HDMI_TX_HPD ]
  set LEDS [ create_bd_port -dir O -from 2 -to 0 LEDS ]
  set PL_DDR4_CALIB_LED [ create_bd_port -dir O PL_DDR4_CALIB_LED ]
  set PUSHBUTTON [ create_bd_port -dir I -from 0 -to 0 PUSHBUTTON ]
  set SWITCHES [ create_bd_port -dir I -from 3 -to 0 SWITCHES ]
  set WLAN_EN [ create_bd_port -dir O -from 0 -to 0 WLAN_EN ]

  # Create instance: DDR4
  create_hier_cell_DDR4 [current_bd_instance .] DDR4

  # Create instance: FMC1
  create_hier_cell_FMC1 [current_bd_instance .] FMC1

  # Create instance: FMC2
  create_hier_cell_FMC2 [current_bd_instance .] FMC2

  # Create instance: GND, and set properties
  set GND [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 GND ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
   CONFIG.CONST_WIDTH {48} \
 ] $GND

  # Create instance: GPIO
  create_hier_cell_GPIO [current_bd_instance .] GPIO

  # Create instance: GPIO_IN, and set properties
  set GPIO_IN [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 GPIO_IN ]
  set_property -dict [ list \
   CONFIG.IN0_WIDTH {11} \
   CONFIG.IN1_WIDTH {4} \
   CONFIG.IN2_WIDTH {1} \
   CONFIG.IN3_WIDTH {79} \
   CONFIG.NUM_PORTS {4} \
 ] $GPIO_IN

  # Create instance: GPIO_OUT
  create_hier_cell_GPIO_OUT [current_bd_instance .] GPIO_OUT

  # Create instance: HDMI_RX
  create_hier_cell_HDMI_RX [current_bd_instance .] HDMI_RX

  # Create instance: HDMI_TX
  create_hier_cell_HDMI_TX [current_bd_instance .] HDMI_TX

  # Create instance: RX_DRU_CLK
  create_hier_cell_RX_DRU_CLK [current_bd_instance .] RX_DRU_CLK

  # Create instance: TX_REFCLK
  create_hier_cell_TX_REFCLK [current_bd_instance .] TX_REFCLK

  # Create instance: TX_REFCLK_RDY, and set properties
  set TX_REFCLK_RDY [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlslice:1.0 TX_REFCLK_RDY ]
  set_property -dict [ list \
   CONFIG.DIN_FROM {3} \
   CONFIG.DIN_TO {3} \
   CONFIG.DIN_WIDTH {95} \
   CONFIG.DOUT_WIDTH {1} \
 ] $TX_REFCLK_RDY

  # Create instance: VCC, and set properties
  set VCC [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 VCC ]

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {13} \
   CONFIG.STRATEGY {1} \
 ] $axi_interconnect_0

  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property -dict [ list \
   CONFIG.C_BAUDRATE {115200} \
 ] $axi_uartlite_0

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {200.0} \
   CONFIG.CLKOUT1_DRIVES {Buffer} \
   CONFIG.CLKOUT1_JITTER {126.827} \
   CONFIG.CLKOUT1_PHASE_ERROR {130.078} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {50} \
   CONFIG.CLKOUT2_DRIVES {Buffer} \
   CONFIG.CLKOUT2_JITTER {96.921} \
   CONFIG.CLKOUT2_PHASE_ERROR {130.078} \
   CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {300} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLKOUT3_DRIVES {Buffer} \
   CONFIG.CLKOUT3_JITTER {93.853} \
   CONFIG.CLKOUT3_PHASE_ERROR {130.078} \
   CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {375} \
   CONFIG.CLKOUT3_USED {true} \
   CONFIG.CLKOUT4_DRIVES {Buffer} \
   CONFIG.CLKOUT4_JITTER {93.853} \
   CONFIG.CLKOUT4_PHASE_ERROR {130.078} \
   CONFIG.CLKOUT4_REQUESTED_OUT_FREQ {375} \
   CONFIG.CLKOUT4_USED {false} \
   CONFIG.CLKOUT5_DRIVES {Buffer} \
   CONFIG.CLKOUT6_DRIVES {Buffer} \
   CONFIG.CLKOUT7_DRIVES {Buffer} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {30.000} \
   CONFIG.MMCM_CLKIN1_PERIOD {20.000} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {30.000} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {5} \
   CONFIG.MMCM_CLKOUT2_DIVIDE {4} \
   CONFIG.MMCM_CLKOUT3_DIVIDE {1} \
   CONFIG.MMCM_DIVCLK_DIVIDE {1} \
   CONFIG.NUM_OUT_CLKS {3} \
   CONFIG.PRIM_IN_FREQ {49.9995} \
   CONFIG.RESET_PORT {resetn} \
   CONFIG.RESET_TYPE {ACTIVE_LOW} \
   CONFIG.SECONDARY_SOURCE {Single_ended_clock_capable_pin} \
   CONFIG.USE_PHASE_ALIGNMENT {true} \
   CONFIG.USE_RESET {true} \
 ] $clk_wiz_0

  # Create instance: gmii_to_rgmii_0, and set properties
  set gmii_to_rgmii_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:gmii_to_rgmii:4.0 gmii_to_rgmii_0 ]
  set_property -dict [ list \
   CONFIG.C_EXTERNAL_CLOCK {false} \
   CONFIG.C_PHYADDR {7} \
   CONFIG.SupportLevel {Include_Shared_Logic_in_Core} \
 ] $gmii_to_rgmii_0

  # Create instance: irq_concat, and set properties
  set irq_concat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 irq_concat ]
  set_property -dict [ list \
   CONFIG.NUM_PORTS {6} \
 ] $irq_concat

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create instance: rst_clk_wiz_0_299M, and set properties
  set rst_clk_wiz_0_299M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_clk_wiz_0_299M ]

  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {2} \
   CONFIG.NUM_SI {1} \
 ] $smartconnect_0

  # Create instance: vid_phy_controller_0, and set properties
  set vid_phy_controller_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:vid_phy_controller:2.2 vid_phy_controller_0 ]
  set_property -dict [ list \
   CONFIG.CHANNEL_ENABLE {X0Y0 X0Y1 X0Y2} \
   CONFIG.C_INPUT_PIXELS_PER_CLOCK {2} \
   CONFIG.C_NIDRU {true} \
   CONFIG.C_NIDRU_REFCLK_SEL {5} \
   CONFIG.C_RX_PLL_SELECTION {6} \
   CONFIG.C_RX_REFCLK_SEL {0} \
   CONFIG.C_Rx_No_Of_Channels {3} \
   CONFIG.C_Rx_Protocol {HDMI} \
   CONFIG.C_TX_PLL_SELECTION {0} \
   CONFIG.C_TX_REFCLK_SEL {4} \
   CONFIG.C_Tx_No_Of_Channels {3} \
   CONFIG.C_Tx_Protocol {HDMI} \
   CONFIG.C_Txrefclk_Rdy_Invert {true} \
   CONFIG.C_Use_Oddr_for_Tmds_Clkout {true} \
   CONFIG.C_vid_phy_rx_axi4s_ch_INT_TDATA_WIDTH {20} \
   CONFIG.C_vid_phy_rx_axi4s_ch_TDATA_WIDTH {20} \
   CONFIG.C_vid_phy_rx_axi4s_ch_TUSER_WIDTH {1} \
   CONFIG.C_vid_phy_tx_axi4s_ch_INT_TDATA_WIDTH {20} \
   CONFIG.C_vid_phy_tx_axi4s_ch_TDATA_WIDTH {20} \
   CONFIG.C_vid_phy_tx_axi4s_ch_TUSER_WIDTH {1} \
   CONFIG.DRPCLK_FREQ {100.0} \
   CONFIG.Rx_GT_Line_Rate {5.94} \
   CONFIG.Rx_GT_Ref_Clock_Freq {297} \
   CONFIG.Rx_Max_GT_Line_Rate {5.94} \
   CONFIG.Tx_Buffer_Bypass {true} \
   CONFIG.Tx_GT_Line_Rate {5.94} \
   CONFIG.Tx_GT_Ref_Clock_Freq {297} \
   CONFIG.Tx_Max_GT_Line_Rate {5.94} \
   CONFIG.check_pll_selection {0} \
 ] $vid_phy_controller_0

  # Create instance: zynq_ultra_ps_e_0, and set properties
  set zynq_ultra_ps_e_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.3 zynq_ultra_ps_e_0 ]
  set_property -dict [ list \
   CONFIG.CAN0_BOARD_INTERFACE {custom} \
   CONFIG.CAN1_BOARD_INTERFACE {custom} \
   CONFIG.CSU_BOARD_INTERFACE {custom} \
   CONFIG.DP_BOARD_INTERFACE {custom} \
   CONFIG.GEM0_BOARD_INTERFACE {custom} \
   CONFIG.GEM1_BOARD_INTERFACE {custom} \
   CONFIG.GEM2_BOARD_INTERFACE {custom} \
   CONFIG.GEM3_BOARD_INTERFACE {custom} \
   CONFIG.GPIO_BOARD_INTERFACE {custom} \
   CONFIG.IIC0_BOARD_INTERFACE {custom} \
   CONFIG.IIC1_BOARD_INTERFACE {custom} \
   CONFIG.NAND_BOARD_INTERFACE {custom} \
   CONFIG.PCIE_BOARD_INTERFACE {custom} \
   CONFIG.PJTAG_BOARD_INTERFACE {custom} \
   CONFIG.PMU_BOARD_INTERFACE {custom} \
   CONFIG.PSU_BANK_0_IO_STANDARD {LVCMOS33} \
   CONFIG.PSU_BANK_1_IO_STANDARD {LVCMOS33} \
   CONFIG.PSU_BANK_2_IO_STANDARD {LVCMOS18} \
   CONFIG.PSU_BANK_3_IO_STANDARD {LVCMOS33} \
   CONFIG.PSU_DDR_RAM_HIGHADDR {0x1FFFFFFFF} \
   CONFIG.PSU_DDR_RAM_HIGHADDR_OFFSET {0x800000000} \
   CONFIG.PSU_DDR_RAM_LOWADDR_OFFSET {0x80000000} \
   CONFIG.PSU_DYNAMIC_DDR_CONFIG_EN {0} \
   CONFIG.PSU_IMPORT_BOARD_PRESET {} \
   CONFIG.PSU_MIO_0_DIRECTION {out} \
   CONFIG.PSU_MIO_0_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_0_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_0_POLARITY {Default} \
   CONFIG.PSU_MIO_0_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_0_SLEW {slow} \
   CONFIG.PSU_MIO_10_DIRECTION {inout} \
   CONFIG.PSU_MIO_10_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_10_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_10_POLARITY {Default} \
   CONFIG.PSU_MIO_10_PULLUPDOWN {pulldown} \
   CONFIG.PSU_MIO_10_SLEW {slow} \
   CONFIG.PSU_MIO_11_DIRECTION {inout} \
   CONFIG.PSU_MIO_11_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_11_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_11_POLARITY {Default} \
   CONFIG.PSU_MIO_11_PULLUPDOWN {pulldown} \
   CONFIG.PSU_MIO_11_SLEW {slow} \
   CONFIG.PSU_MIO_12_DIRECTION {inout} \
   CONFIG.PSU_MIO_12_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_12_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_12_POLARITY {Default} \
   CONFIG.PSU_MIO_12_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_12_SLEW {slow} \
   CONFIG.PSU_MIO_13_DIRECTION {out} \
   CONFIG.PSU_MIO_13_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_13_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_13_POLARITY {Default} \
   CONFIG.PSU_MIO_13_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_13_SLEW {slow} \
   CONFIG.PSU_MIO_14_DIRECTION {out} \
   CONFIG.PSU_MIO_14_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_14_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_14_POLARITY {Default} \
   CONFIG.PSU_MIO_14_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_14_SLEW {slow} \
   CONFIG.PSU_MIO_15_DIRECTION {out} \
   CONFIG.PSU_MIO_15_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_15_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_15_POLARITY {Default} \
   CONFIG.PSU_MIO_15_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_15_SLEW {slow} \
   CONFIG.PSU_MIO_16_DIRECTION {inout} \
   CONFIG.PSU_MIO_16_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_16_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_16_POLARITY {Default} \
   CONFIG.PSU_MIO_16_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_16_SLEW {slow} \
   CONFIG.PSU_MIO_17_DIRECTION {inout} \
   CONFIG.PSU_MIO_17_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_17_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_17_POLARITY {Default} \
   CONFIG.PSU_MIO_17_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_17_SLEW {slow} \
   CONFIG.PSU_MIO_18_DIRECTION {inout} \
   CONFIG.PSU_MIO_18_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_18_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_18_POLARITY {Default} \
   CONFIG.PSU_MIO_18_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_18_SLEW {slow} \
   CONFIG.PSU_MIO_19_DIRECTION {inout} \
   CONFIG.PSU_MIO_19_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_19_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_19_POLARITY {Default} \
   CONFIG.PSU_MIO_19_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_19_SLEW {slow} \
   CONFIG.PSU_MIO_1_DIRECTION {inout} \
   CONFIG.PSU_MIO_1_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_1_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_1_POLARITY {Default} \
   CONFIG.PSU_MIO_1_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_1_SLEW {slow} \
   CONFIG.PSU_MIO_20_DIRECTION {inout} \
   CONFIG.PSU_MIO_20_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_20_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_20_POLARITY {Default} \
   CONFIG.PSU_MIO_20_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_20_SLEW {slow} \
   CONFIG.PSU_MIO_21_DIRECTION {inout} \
   CONFIG.PSU_MIO_21_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_21_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_21_POLARITY {Default} \
   CONFIG.PSU_MIO_21_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_21_SLEW {slow} \
   CONFIG.PSU_MIO_22_DIRECTION {out} \
   CONFIG.PSU_MIO_22_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_22_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_22_POLARITY {Default} \
   CONFIG.PSU_MIO_22_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_22_SLEW {slow} \
   CONFIG.PSU_MIO_23_DIRECTION {inout} \
   CONFIG.PSU_MIO_23_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_23_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_23_POLARITY {Default} \
   CONFIG.PSU_MIO_23_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_23_SLEW {slow} \
   CONFIG.PSU_MIO_24_DIRECTION {inout} \
   CONFIG.PSU_MIO_24_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_24_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_24_POLARITY {Default} \
   CONFIG.PSU_MIO_24_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_24_SLEW {slow} \
   CONFIG.PSU_MIO_25_DIRECTION {out} \
   CONFIG.PSU_MIO_25_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_25_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_25_POLARITY {Default} \
   CONFIG.PSU_MIO_25_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_25_SLEW {slow} \
   CONFIG.PSU_MIO_26_DIRECTION {inout} \
   CONFIG.PSU_MIO_26_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_26_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_26_POLARITY {Default} \
   CONFIG.PSU_MIO_26_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_26_SLEW {slow} \
   CONFIG.PSU_MIO_27_DIRECTION {in} \
   CONFIG.PSU_MIO_27_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_27_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_27_POLARITY {Default} \
   CONFIG.PSU_MIO_27_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_27_SLEW {fast} \
   CONFIG.PSU_MIO_28_DIRECTION {inout} \
   CONFIG.PSU_MIO_28_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_28_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_28_POLARITY {Default} \
   CONFIG.PSU_MIO_28_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_28_SLEW {slow} \
   CONFIG.PSU_MIO_29_DIRECTION {out} \
   CONFIG.PSU_MIO_29_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_29_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_29_POLARITY {Default} \
   CONFIG.PSU_MIO_29_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_29_SLEW {slow} \
   CONFIG.PSU_MIO_2_DIRECTION {inout} \
   CONFIG.PSU_MIO_2_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_2_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_2_POLARITY {Default} \
   CONFIG.PSU_MIO_2_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_2_SLEW {slow} \
   CONFIG.PSU_MIO_30_DIRECTION {inout} \
   CONFIG.PSU_MIO_30_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_30_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_30_POLARITY {Default} \
   CONFIG.PSU_MIO_30_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_30_SLEW {slow} \
   CONFIG.PSU_MIO_31_DIRECTION {inout} \
   CONFIG.PSU_MIO_31_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_31_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_31_POLARITY {Default} \
   CONFIG.PSU_MIO_31_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_31_SLEW {slow} \
   CONFIG.PSU_MIO_32_DIRECTION {out} \
   CONFIG.PSU_MIO_32_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_32_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_32_POLARITY {Default} \
   CONFIG.PSU_MIO_32_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_32_SLEW {slow} \
   CONFIG.PSU_MIO_33_DIRECTION {in} \
   CONFIG.PSU_MIO_33_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_33_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_33_POLARITY {Default} \
   CONFIG.PSU_MIO_33_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_33_SLEW {fast} \
   CONFIG.PSU_MIO_34_DIRECTION {out} \
   CONFIG.PSU_MIO_34_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_34_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_34_POLARITY {Default} \
   CONFIG.PSU_MIO_34_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_34_SLEW {slow} \
   CONFIG.PSU_MIO_35_DIRECTION {in} \
   CONFIG.PSU_MIO_35_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_35_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_35_POLARITY {Default} \
   CONFIG.PSU_MIO_35_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_35_SLEW {fast} \
   CONFIG.PSU_MIO_36_DIRECTION {out} \
   CONFIG.PSU_MIO_36_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_36_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_36_POLARITY {Default} \
   CONFIG.PSU_MIO_36_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_36_SLEW {slow} \
   CONFIG.PSU_MIO_37_DIRECTION {in} \
   CONFIG.PSU_MIO_37_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_37_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_37_POLARITY {Default} \
   CONFIG.PSU_MIO_37_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_37_SLEW {fast} \
   CONFIG.PSU_MIO_38_DIRECTION {out} \
   CONFIG.PSU_MIO_38_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_38_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_38_POLARITY {Default} \
   CONFIG.PSU_MIO_38_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_38_SLEW {slow} \
   CONFIG.PSU_MIO_39_DIRECTION {inout} \
   CONFIG.PSU_MIO_39_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_39_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_39_POLARITY {Default} \
   CONFIG.PSU_MIO_39_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_39_SLEW {slow} \
   CONFIG.PSU_MIO_3_DIRECTION {inout} \
   CONFIG.PSU_MIO_3_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_3_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_3_POLARITY {Default} \
   CONFIG.PSU_MIO_3_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_3_SLEW {slow} \
   CONFIG.PSU_MIO_40_DIRECTION {inout} \
   CONFIG.PSU_MIO_40_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_40_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_40_POLARITY {Default} \
   CONFIG.PSU_MIO_40_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_40_SLEW {slow} \
   CONFIG.PSU_MIO_41_DIRECTION {inout} \
   CONFIG.PSU_MIO_41_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_41_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_41_POLARITY {Default} \
   CONFIG.PSU_MIO_41_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_41_SLEW {slow} \
   CONFIG.PSU_MIO_42_DIRECTION {inout} \
   CONFIG.PSU_MIO_42_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_42_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_42_POLARITY {Default} \
   CONFIG.PSU_MIO_42_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_42_SLEW {slow} \
   CONFIG.PSU_MIO_43_DIRECTION {inout} \
   CONFIG.PSU_MIO_43_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_43_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_43_POLARITY {Default} \
   CONFIG.PSU_MIO_43_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_43_SLEW {slow} \
   CONFIG.PSU_MIO_44_DIRECTION {inout} \
   CONFIG.PSU_MIO_44_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_44_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_44_POLARITY {Default} \
   CONFIG.PSU_MIO_44_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_44_SLEW {slow} \
   CONFIG.PSU_MIO_45_DIRECTION {in} \
   CONFIG.PSU_MIO_45_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_45_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_45_POLARITY {Default} \
   CONFIG.PSU_MIO_45_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_45_SLEW {fast} \
   CONFIG.PSU_MIO_46_DIRECTION {inout} \
   CONFIG.PSU_MIO_46_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_46_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_46_POLARITY {Default} \
   CONFIG.PSU_MIO_46_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_46_SLEW {slow} \
   CONFIG.PSU_MIO_47_DIRECTION {inout} \
   CONFIG.PSU_MIO_47_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_47_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_47_POLARITY {Default} \
   CONFIG.PSU_MIO_47_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_47_SLEW {slow} \
   CONFIG.PSU_MIO_48_DIRECTION {inout} \
   CONFIG.PSU_MIO_48_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_48_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_48_POLARITY {Default} \
   CONFIG.PSU_MIO_48_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_48_SLEW {slow} \
   CONFIG.PSU_MIO_49_DIRECTION {inout} \
   CONFIG.PSU_MIO_49_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_49_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_49_POLARITY {Default} \
   CONFIG.PSU_MIO_49_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_49_SLEW {slow} \
   CONFIG.PSU_MIO_4_DIRECTION {inout} \
   CONFIG.PSU_MIO_4_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_4_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_4_POLARITY {Default} \
   CONFIG.PSU_MIO_4_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_4_SLEW {slow} \
   CONFIG.PSU_MIO_50_DIRECTION {inout} \
   CONFIG.PSU_MIO_50_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_50_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_50_POLARITY {Default} \
   CONFIG.PSU_MIO_50_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_50_SLEW {slow} \
   CONFIG.PSU_MIO_51_DIRECTION {out} \
   CONFIG.PSU_MIO_51_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_51_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_51_POLARITY {Default} \
   CONFIG.PSU_MIO_51_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_51_SLEW {slow} \
   CONFIG.PSU_MIO_52_DIRECTION {out} \
   CONFIG.PSU_MIO_52_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_52_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_52_POLARITY {Default} \
   CONFIG.PSU_MIO_52_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_52_SLEW {slow} \
   CONFIG.PSU_MIO_53_DIRECTION {out} \
   CONFIG.PSU_MIO_53_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_53_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_53_POLARITY {Default} \
   CONFIG.PSU_MIO_53_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_53_SLEW {slow} \
   CONFIG.PSU_MIO_54_DIRECTION {out} \
   CONFIG.PSU_MIO_54_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_54_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_54_POLARITY {Default} \
   CONFIG.PSU_MIO_54_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_54_SLEW {slow} \
   CONFIG.PSU_MIO_55_DIRECTION {out} \
   CONFIG.PSU_MIO_55_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_55_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_55_POLARITY {Default} \
   CONFIG.PSU_MIO_55_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_55_SLEW {slow} \
   CONFIG.PSU_MIO_56_DIRECTION {out} \
   CONFIG.PSU_MIO_56_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_56_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_56_POLARITY {Default} \
   CONFIG.PSU_MIO_56_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_56_SLEW {slow} \
   CONFIG.PSU_MIO_57_DIRECTION {out} \
   CONFIG.PSU_MIO_57_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_57_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_57_POLARITY {Default} \
   CONFIG.PSU_MIO_57_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_57_SLEW {slow} \
   CONFIG.PSU_MIO_58_DIRECTION {in} \
   CONFIG.PSU_MIO_58_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_58_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_58_POLARITY {Default} \
   CONFIG.PSU_MIO_58_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_58_SLEW {fast} \
   CONFIG.PSU_MIO_59_DIRECTION {in} \
   CONFIG.PSU_MIO_59_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_59_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_59_POLARITY {Default} \
   CONFIG.PSU_MIO_59_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_59_SLEW {fast} \
   CONFIG.PSU_MIO_5_DIRECTION {out} \
   CONFIG.PSU_MIO_5_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_5_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_5_POLARITY {Default} \
   CONFIG.PSU_MIO_5_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_5_SLEW {slow} \
   CONFIG.PSU_MIO_60_DIRECTION {in} \
   CONFIG.PSU_MIO_60_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_60_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_60_POLARITY {Default} \
   CONFIG.PSU_MIO_60_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_60_SLEW {fast} \
   CONFIG.PSU_MIO_61_DIRECTION {in} \
   CONFIG.PSU_MIO_61_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_61_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_61_POLARITY {Default} \
   CONFIG.PSU_MIO_61_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_61_SLEW {fast} \
   CONFIG.PSU_MIO_62_DIRECTION {in} \
   CONFIG.PSU_MIO_62_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_62_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_62_POLARITY {Default} \
   CONFIG.PSU_MIO_62_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_62_SLEW {fast} \
   CONFIG.PSU_MIO_63_DIRECTION {in} \
   CONFIG.PSU_MIO_63_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_63_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_63_POLARITY {Default} \
   CONFIG.PSU_MIO_63_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_63_SLEW {fast} \
   CONFIG.PSU_MIO_64_DIRECTION {in} \
   CONFIG.PSU_MIO_64_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_64_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_64_POLARITY {Default} \
   CONFIG.PSU_MIO_64_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_64_SLEW {fast} \
   CONFIG.PSU_MIO_65_DIRECTION {in} \
   CONFIG.PSU_MIO_65_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_65_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_65_POLARITY {Default} \
   CONFIG.PSU_MIO_65_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_65_SLEW {fast} \
   CONFIG.PSU_MIO_66_DIRECTION {inout} \
   CONFIG.PSU_MIO_66_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_66_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_66_POLARITY {Default} \
   CONFIG.PSU_MIO_66_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_66_SLEW {slow} \
   CONFIG.PSU_MIO_67_DIRECTION {in} \
   CONFIG.PSU_MIO_67_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_67_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_67_POLARITY {Default} \
   CONFIG.PSU_MIO_67_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_67_SLEW {fast} \
   CONFIG.PSU_MIO_68_DIRECTION {inout} \
   CONFIG.PSU_MIO_68_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_68_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_68_POLARITY {Default} \
   CONFIG.PSU_MIO_68_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_68_SLEW {slow} \
   CONFIG.PSU_MIO_69_DIRECTION {inout} \
   CONFIG.PSU_MIO_69_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_69_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_69_POLARITY {Default} \
   CONFIG.PSU_MIO_69_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_69_SLEW {slow} \
   CONFIG.PSU_MIO_6_DIRECTION {inout} \
   CONFIG.PSU_MIO_6_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_6_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_6_POLARITY {Default} \
   CONFIG.PSU_MIO_6_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_6_SLEW {slow} \
   CONFIG.PSU_MIO_70_DIRECTION {out} \
   CONFIG.PSU_MIO_70_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_70_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_70_POLARITY {Default} \
   CONFIG.PSU_MIO_70_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_70_SLEW {slow} \
   CONFIG.PSU_MIO_71_DIRECTION {inout} \
   CONFIG.PSU_MIO_71_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_71_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_71_POLARITY {Default} \
   CONFIG.PSU_MIO_71_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_71_SLEW {slow} \
   CONFIG.PSU_MIO_72_DIRECTION {inout} \
   CONFIG.PSU_MIO_72_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_72_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_72_POLARITY {Default} \
   CONFIG.PSU_MIO_72_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_72_SLEW {slow} \
   CONFIG.PSU_MIO_73_DIRECTION {inout} \
   CONFIG.PSU_MIO_73_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_73_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_73_POLARITY {Default} \
   CONFIG.PSU_MIO_73_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_73_SLEW {slow} \
   CONFIG.PSU_MIO_74_DIRECTION {inout} \
   CONFIG.PSU_MIO_74_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_74_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_74_POLARITY {Default} \
   CONFIG.PSU_MIO_74_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_74_SLEW {slow} \
   CONFIG.PSU_MIO_75_DIRECTION {inout} \
   CONFIG.PSU_MIO_75_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_75_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_75_POLARITY {Default} \
   CONFIG.PSU_MIO_75_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_75_SLEW {slow} \
   CONFIG.PSU_MIO_76_DIRECTION {out} \
   CONFIG.PSU_MIO_76_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_76_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_76_POLARITY {Default} \
   CONFIG.PSU_MIO_76_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_76_SLEW {slow} \
   CONFIG.PSU_MIO_77_DIRECTION {inout} \
   CONFIG.PSU_MIO_77_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_77_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_77_POLARITY {Default} \
   CONFIG.PSU_MIO_77_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_77_SLEW {slow} \
   CONFIG.PSU_MIO_7_DIRECTION {inout} \
   CONFIG.PSU_MIO_7_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_7_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_7_POLARITY {Default} \
   CONFIG.PSU_MIO_7_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_7_SLEW {slow} \
   CONFIG.PSU_MIO_8_DIRECTION {out} \
   CONFIG.PSU_MIO_8_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_8_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_8_POLARITY {Default} \
   CONFIG.PSU_MIO_8_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_8_SLEW {slow} \
   CONFIG.PSU_MIO_9_DIRECTION {in} \
   CONFIG.PSU_MIO_9_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_9_INPUT_TYPE {schmitt} \
   CONFIG.PSU_MIO_9_POLARITY {Default} \
   CONFIG.PSU_MIO_9_PULLUPDOWN {pullup} \
   CONFIG.PSU_MIO_9_SLEW {fast} \
   CONFIG.PSU_MIO_TREE_PERIPHERALS {Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#GPIO0 MIO#GPIO0 MIO#CAN 1#CAN 1#GPIO0 MIO#GPIO0 MIO#NAND#NAND#NAND#NAND#NAND#NAND#NAND#NAND#NAND#NAND#NAND#NAND#NAND#NAND#GPIO1 MIO#NAND#GPIO1 MIO#PCIE#I2C 0#I2C 0#UART 1#UART 1#DPAUX#DPAUX#DPAUX#DPAUX#SD 0#GPIO1 MIO#SD 0#SD 0#SD 0#SD 0#SD 0#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#Gem 2#Gem 2#Gem 2#Gem 2#Gem 2#Gem 2#Gem 2#Gem 2#Gem 2#Gem 2#Gem 2#Gem 2#USB 1#USB 1#USB 1#USB 1#USB 1#USB 1#USB 1#USB 1#USB 1#USB 1#USB 1#USB 1#MDIO 2#MDIO 2} \
   CONFIG.PSU_MIO_TREE_SIGNALS {sclk_out#miso_mo1#mo2#mo3#mosi_mi0#n_ss_out#gpio0[6]#gpio0[7]#phy_tx#phy_rx#gpio0[10]#gpio0[11]#nfc_dqs_out#nfc_ce[0]#nfc_cle#nfc_ale#nfc_dq_out[0]#nfc_dq_out[1]#nfc_dq_out[2]#nfc_dq_out[3]#nfc_dq_out[4]#nfc_dq_out[5]#nfc_we_b#nfc_dq_out[6]#nfc_dq_out[7]#nfc_re_n#gpio1[26]#nfc_rb_n[0]#gpio1[28]#reset_n#scl_out#sda_out#txd#rxd#dp_aux_data_out#dp_hot_plug_detect#dp_aux_data_oe#dp_aux_data_in#sdio0_clk_out#gpio1[39]#sdio0_cmd_out#sdio0_data_out[0]#sdio0_data_out[1]#sdio0_data_out[2]#sdio0_data_out[3]#sdio1_cd_n#sdio1_data_out[0]#sdio1_data_out[1]#sdio1_data_out[2]#sdio1_data_out[3]#sdio1_cmd_out#sdio1_clk_out#rgmii_tx_clk#rgmii_txd[0]#rgmii_txd[1]#rgmii_txd[2]#rgmii_txd[3]#rgmii_tx_ctl#rgmii_rx_clk#rgmii_rxd[0]#rgmii_rxd[1]#rgmii_rxd[2]#rgmii_rxd[3]#rgmii_rx_ctl#ulpi_clk_in#ulpi_dir#ulpi_tx_data[2]#ulpi_nxt#ulpi_tx_data[0]#ulpi_tx_data[1]#ulpi_stp#ulpi_tx_data[3]#ulpi_tx_data[4]#ulpi_tx_data[5]#ulpi_tx_data[6]#ulpi_tx_data[7]#gem2_mdc#gem2_mdio_out} \
   CONFIG.PSU_PERIPHERAL_BOARD_PRESET {} \
   CONFIG.PSU_SD0_INTERNAL_BUS_WIDTH {4} \
   CONFIG.PSU_SD1_INTERNAL_BUS_WIDTH {4} \
   CONFIG.PSU_SMC_CYCLE_T0 {NA} \
   CONFIG.PSU_SMC_CYCLE_T1 {NA} \
   CONFIG.PSU_SMC_CYCLE_T2 {NA} \
   CONFIG.PSU_SMC_CYCLE_T3 {NA} \
   CONFIG.PSU_SMC_CYCLE_T4 {NA} \
   CONFIG.PSU_SMC_CYCLE_T5 {NA} \
   CONFIG.PSU_SMC_CYCLE_T6 {NA} \
   CONFIG.PSU_USB3__DUAL_CLOCK_ENABLE {1} \
   CONFIG.PSU_VALUE_SILVERSION {3} \
   CONFIG.PSU__ACPU0__POWER__ON {1} \
   CONFIG.PSU__ACPU1__POWER__ON {1} \
   CONFIG.PSU__ACPU2__POWER__ON {1} \
   CONFIG.PSU__ACPU3__POWER__ON {1} \
   CONFIG.PSU__ACTUAL__IP {1} \
   CONFIG.PSU__ACT_DDR_FREQ_MHZ {1066.656006} \
   CONFIG.PSU__AFI0_COHERENCY {0} \
   CONFIG.PSU__AFI1_COHERENCY {0} \
   CONFIG.PSU__AUX_REF_CLK__FREQMHZ {33.333} \
   CONFIG.PSU__CAN0_LOOP_CAN1__ENABLE {0} \
   CONFIG.PSU__CAN0__GRP_CLK__ENABLE {0} \
   CONFIG.PSU__CAN0__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__CAN1__GRP_CLK__ENABLE {0} \
   CONFIG.PSU__CAN1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__CAN1__PERIPHERAL__IO {MIO 8 .. 9} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__ACT_FREQMHZ {1333.320068} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__DIVISOR0 {1} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__FREQMHZ {1333.333} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__SRCSEL {APLL} \
   CONFIG.PSU__CRF_APB__ACPU__FRAC_ENABLED {0} \
   CONFIG.PSU__CRF_APB__AFI0_REF_CTRL__ACT_FREQMHZ {667} \
   CONFIG.PSU__CRF_APB__AFI0_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__AFI0_REF_CTRL__FREQMHZ {667} \
   CONFIG.PSU__CRF_APB__AFI0_REF_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__AFI0_REF__ENABLE {0} \
   CONFIG.PSU__CRF_APB__AFI1_REF_CTRL__ACT_FREQMHZ {667} \
   CONFIG.PSU__CRF_APB__AFI1_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__AFI1_REF_CTRL__FREQMHZ {667} \
   CONFIG.PSU__CRF_APB__AFI1_REF_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__AFI1_REF__ENABLE {0} \
   CONFIG.PSU__CRF_APB__AFI2_REF_CTRL__ACT_FREQMHZ {667} \
   CONFIG.PSU__CRF_APB__AFI2_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__AFI2_REF_CTRL__FREQMHZ {667} \
   CONFIG.PSU__CRF_APB__AFI2_REF_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__AFI2_REF__ENABLE {0} \
   CONFIG.PSU__CRF_APB__AFI3_REF_CTRL__ACT_FREQMHZ {667} \
   CONFIG.PSU__CRF_APB__AFI3_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__AFI3_REF_CTRL__FREQMHZ {667} \
   CONFIG.PSU__CRF_APB__AFI3_REF_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__AFI3_REF__ENABLE {0} \
   CONFIG.PSU__CRF_APB__AFI4_REF_CTRL__ACT_FREQMHZ {667} \
   CONFIG.PSU__CRF_APB__AFI4_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__AFI4_REF_CTRL__FREQMHZ {667} \
   CONFIG.PSU__CRF_APB__AFI4_REF_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__AFI4_REF__ENABLE {0} \
   CONFIG.PSU__CRF_APB__AFI5_REF_CTRL__ACT_FREQMHZ {667} \
   CONFIG.PSU__CRF_APB__AFI5_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__AFI5_REF_CTRL__FREQMHZ {667} \
   CONFIG.PSU__CRF_APB__AFI5_REF_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__AFI5_REF__ENABLE {0} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__FBDIV {80} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__FRACFREQ {27.138} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRF_APB__APLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRF_APB__APLL_TO_LPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRF_APB__APM_CTRL__ACT_FREQMHZ {1} \
   CONFIG.PSU__CRF_APB__APM_CTRL__DIVISOR0 {1} \
   CONFIG.PSU__CRF_APB__APM_CTRL__FREQMHZ {1} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__ACT_FREQMHZ {249.997498} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__ACT_FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__ACT_FREQMHZ {249.997498} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__ACT_FREQMHZ {533.328003} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__FREQMHZ {1067} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__ACT_FREQMHZ {533.328003} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__FREQMHZ {600} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__FBDIV {64} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__FRACFREQ {27.138} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRF_APB__DPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRF_APB__DPLL_TO_LPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__ACT_FREQMHZ {24.242182} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR0 {22} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__FREQMHZ {25} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRF_APB__DP_AUDIO__FRAC_ENABLED {0} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__ACT_FREQMHZ {26.666401} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR0 {20} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__FREQMHZ {27} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__ACT_FREQMHZ {299.997009} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__FREQMHZ {300} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__SRCSEL {VPLL} \
   CONFIG.PSU__CRF_APB__DP_VIDEO__FRAC_ENABLED {0} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__ACT_FREQMHZ {533.328003} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__FREQMHZ {600} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__GPU_REF_CTRL__ACT_FREQMHZ {499.994995} \
   CONFIG.PSU__CRF_APB__GPU_REF_CTRL__DIVISOR0 {1} \
   CONFIG.PSU__CRF_APB__GPU_REF_CTRL__FREQMHZ {600} \
   CONFIG.PSU__CRF_APB__GPU_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__GTGREF0_REF_CTRL__ACT_FREQMHZ {-1} \
   CONFIG.PSU__CRF_APB__GTGREF0_REF_CTRL__DIVISOR0 {-1} \
   CONFIG.PSU__CRF_APB__GTGREF0_REF_CTRL__FREQMHZ {-1} \
   CONFIG.PSU__CRF_APB__GTGREF0_REF_CTRL__SRCSEL {NA} \
   CONFIG.PSU__CRF_APB__GTGREF0__ENABLE {NA} \
   CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__ACT_FREQMHZ {249.997498} \
   CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__SATA_REF_CTRL__ACT_FREQMHZ {249.997498} \
   CONFIG.PSU__CRF_APB__SATA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__SATA_REF_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__SATA_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__ACT_FREQMHZ {99.999001} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__ACT_FREQMHZ {533.328003} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__FREQMHZ {533.333} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__FBDIV {90} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__FRACFREQ {27.138} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRF_APB__VPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRF_APB__VPLL_TO_LPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__ACT_FREQMHZ {533.328003} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__FREQMHZ {533.333} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__AFI6_REF_CTRL__ACT_FREQMHZ {500} \
   CONFIG.PSU__CRL_APB__AFI6_REF_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__AFI6_REF_CTRL__FREQMHZ {500} \
   CONFIG.PSU__CRL_APB__AFI6_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__AFI6__ENABLE {0} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__ACT_FREQMHZ {49.999500} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__DIVISOR0 {30} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__FREQMHZ {50} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__ACT_FREQMHZ {99.999000} \
   CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__ACT_FREQMHZ {99.999001} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__ACT_FREQMHZ {533.328003} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__FREQMHZ {533.333} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__CSU_PLL_CTRL__ACT_FREQMHZ {180} \
   CONFIG.PSU__CRL_APB__CSU_PLL_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__CSU_PLL_CTRL__FREQMHZ {180} \
   CONFIG.PSU__CRL_APB__CSU_PLL_CTRL__SRCSEL {SysOsc} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__ACT_FREQMHZ {249.997498} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__DEBUG_R5_ATCLK_CTRL__ACT_FREQMHZ {1000} \
   CONFIG.PSU__CRL_APB__DEBUG_R5_ATCLK_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__DEBUG_R5_ATCLK_CTRL__FREQMHZ {1000} \
   CONFIG.PSU__CRL_APB__DEBUG_R5_ATCLK_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__DLL_REF_CTRL__ACT_FREQMHZ {1499.984985} \
   CONFIG.PSU__CRL_APB__DLL_REF_CTRL__FREQMHZ {1500} \
   CONFIG.PSU__CRL_APB__DLL_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__ACT_FREQMHZ {125} \
   CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__FREQMHZ {125} \
   CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__ACT_FREQMHZ {124.998749} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__FREQMHZ {125} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__ACT_FREQMHZ {124.998749} \
   CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__FREQMHZ {125} \
   CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__ACT_FREQMHZ {125} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__FREQMHZ {125} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__ACT_FREQMHZ {249.997498} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__ACT_FREQMHZ {99.999001} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__ACT_FREQMHZ {99.999001} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__FBDIV {90} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__FRACFREQ {27.138} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRL_APB__IOPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRL_APB__IOPLL_TO_FPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__ACT_FREQMHZ {266.664001} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__FREQMHZ {267} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__ACT_FREQMHZ {99.999001} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__ACT_FREQMHZ {533.328003} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__FREQMHZ {533.333} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__NAND_REF_CTRL__ACT_FREQMHZ {99.999001} \
   CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__NAND_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__NAND_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__OCM_MAIN_CTRL__ACT_FREQMHZ {500} \
   CONFIG.PSU__CRL_APB__OCM_MAIN_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__OCM_MAIN_CTRL__FREQMHZ {500} \
   CONFIG.PSU__CRL_APB__OCM_MAIN_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__ACT_FREQMHZ {187.498123} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__DIVISOR0 {8} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__FREQMHZ {200} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__ACT_FREQMHZ {49.999500} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR0 {30} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {50} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__ACT_FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__ACT_FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__PL3_REF_CTRL__ACT_FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__PL3_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__PL3_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL3_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__PL3_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__ACT_FREQMHZ {299.997009} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__FREQMHZ {300} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__FBDIV {64} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__FRACFREQ {27.138} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRL_APB__RPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRL_APB__RPLL_TO_FPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__ACT_FREQMHZ {48.484364} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR0 {22} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__FREQMHZ {50} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__ACT_FREQMHZ {96.968727} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR0 {11} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__ACT_FREQMHZ {214} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR0 {7} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__FREQMHZ {200} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__ACT_FREQMHZ {214} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR0 {7} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__FREQMHZ {200} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__ACT_FREQMHZ {33.333000} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__DIVISOR0 {1} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__ACT_FREQMHZ {99.999001} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__ACT_FREQMHZ {99.999001} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__ACT_FREQMHZ {249.997500} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__ACT_FREQMHZ {249.997498} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__ACT_FREQMHZ {19.999800} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR0 {25} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR1 {3} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__FREQMHZ {20} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__USB3__ENABLE {0} \
   CONFIG.PSU__CSUPMU__PERIPHERAL__VALID {0} \
   CONFIG.PSU__CSU_COHERENCY {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_0__ENABLE {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_0__ERASE_BBRAM {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_10__ENABLE {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_10__ERASE_BBRAM {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_11__ENABLE {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_11__ERASE_BBRAM {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_12__ENABLE {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_12__ERASE_BBRAM {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_1__ENABLE {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_1__ERASE_BBRAM {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_2__ENABLE {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_2__ERASE_BBRAM {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_3__ENABLE {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_3__ERASE_BBRAM {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_4__ENABLE {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_4__ERASE_BBRAM {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_5__ENABLE {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_5__ERASE_BBRAM {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_6__ENABLE {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_6__ERASE_BBRAM {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_7__ENABLE {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_7__ERASE_BBRAM {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_8__ENABLE {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_8__ERASE_BBRAM {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_9__ENABLE {0} \
   CONFIG.PSU__CSU__CSU_TAMPER_9__ERASE_BBRAM {0} \
   CONFIG.PSU__CSU__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__DDRC__ADDR_MIRROR {0} \
   CONFIG.PSU__DDRC__AL {0} \
   CONFIG.PSU__DDRC__BANK_ADDR_COUNT {2} \
   CONFIG.PSU__DDRC__BG_ADDR_COUNT {2} \
   CONFIG.PSU__DDRC__BRC_MAPPING {ROW_BANK_COL} \
   CONFIG.PSU__DDRC__BUS_WIDTH {64 Bit} \
   CONFIG.PSU__DDRC__CL {15} \
   CONFIG.PSU__DDRC__CLOCK_STOP_EN {0} \
   CONFIG.PSU__DDRC__COL_ADDR_COUNT {10} \
   CONFIG.PSU__DDRC__COMPONENTS {UDIMM} \
   CONFIG.PSU__DDRC__CWL {14} \
   CONFIG.PSU__DDRC__DDR3L_T_REF_RANGE {NA} \
   CONFIG.PSU__DDRC__DDR3_T_REF_RANGE {NA} \
   CONFIG.PSU__DDRC__DDR4_ADDR_MAPPING {0} \
   CONFIG.PSU__DDRC__DDR4_CAL_MODE_ENABLE {0} \
   CONFIG.PSU__DDRC__DDR4_CRC_CONTROL {0} \
   CONFIG.PSU__DDRC__DDR4_MAXPWR_SAVING_EN {0} \
   CONFIG.PSU__DDRC__DDR4_T_REF_MODE {0} \
   CONFIG.PSU__DDRC__DDR4_T_REF_RANGE {Normal (0-85)} \
   CONFIG.PSU__DDRC__DEEP_PWR_DOWN_EN {0} \
   CONFIG.PSU__DDRC__DEVICE_CAPACITY {8192 MBits} \
   CONFIG.PSU__DDRC__DIMM_ADDR_MIRROR {0} \
   CONFIG.PSU__DDRC__DM_DBI {DM_NO_DBI} \
   CONFIG.PSU__DDRC__DQMAP_0_3 {0} \
   CONFIG.PSU__DDRC__DQMAP_12_15 {0} \
   CONFIG.PSU__DDRC__DQMAP_16_19 {0} \
   CONFIG.PSU__DDRC__DQMAP_20_23 {0} \
   CONFIG.PSU__DDRC__DQMAP_24_27 {0} \
   CONFIG.PSU__DDRC__DQMAP_28_31 {0} \
   CONFIG.PSU__DDRC__DQMAP_32_35 {0} \
   CONFIG.PSU__DDRC__DQMAP_36_39 {0} \
   CONFIG.PSU__DDRC__DQMAP_40_43 {0} \
   CONFIG.PSU__DDRC__DQMAP_44_47 {0} \
   CONFIG.PSU__DDRC__DQMAP_48_51 {0} \
   CONFIG.PSU__DDRC__DQMAP_4_7 {0} \
   CONFIG.PSU__DDRC__DQMAP_52_55 {0} \
   CONFIG.PSU__DDRC__DQMAP_56_59 {0} \
   CONFIG.PSU__DDRC__DQMAP_60_63 {0} \
   CONFIG.PSU__DDRC__DQMAP_64_67 {0} \
   CONFIG.PSU__DDRC__DQMAP_68_71 {0} \
   CONFIG.PSU__DDRC__DQMAP_8_11 {0} \
   CONFIG.PSU__DDRC__DRAM_WIDTH {8 Bits} \
   CONFIG.PSU__DDRC__ECC {Disabled} \
   CONFIG.PSU__DDRC__ECC_SCRUB {0} \
   CONFIG.PSU__DDRC__ENABLE {1} \
   CONFIG.PSU__DDRC__ENABLE_2T_TIMING {0} \
   CONFIG.PSU__DDRC__ENABLE_DP_SWITCH {0} \
   CONFIG.PSU__DDRC__ENABLE_LP4_HAS_ECC_COMP {0} \
   CONFIG.PSU__DDRC__ENABLE_LP4_SLOWBOOT {0} \
   CONFIG.PSU__DDRC__EN_2ND_CLK {0} \
   CONFIG.PSU__DDRC__FGRM {1X} \
   CONFIG.PSU__DDRC__FREQ_MHZ {1} \
   CONFIG.PSU__DDRC__LPDDR3_DUALRANK_SDP {0} \
   CONFIG.PSU__DDRC__LPDDR3_T_REF_RANGE {NA} \
   CONFIG.PSU__DDRC__LPDDR4_T_REF_RANGE {NA} \
   CONFIG.PSU__DDRC__LP_ASR {manual normal} \
   CONFIG.PSU__DDRC__MEMORY_TYPE {DDR 4} \
   CONFIG.PSU__DDRC__PARITY_ENABLE {0} \
   CONFIG.PSU__DDRC__PER_BANK_REFRESH {0} \
   CONFIG.PSU__DDRC__PHY_DBI_MODE {0} \
   CONFIG.PSU__DDRC__PLL_BYPASS {0} \
   CONFIG.PSU__DDRC__PWR_DOWN_EN {0} \
   CONFIG.PSU__DDRC__RANK_ADDR_COUNT {0} \
   CONFIG.PSU__DDRC__RD_DQS_CENTER {0} \
   CONFIG.PSU__DDRC__ROW_ADDR_COUNT {16} \
   CONFIG.PSU__DDRC__SB_TARGET {15-15-15} \
   CONFIG.PSU__DDRC__SELF_REF_ABORT {0} \
   CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2133P} \
   CONFIG.PSU__DDRC__STATIC_RD_MODE {0} \
   CONFIG.PSU__DDRC__TRAIN_DATA_EYE {1} \
   CONFIG.PSU__DDRC__TRAIN_READ_GATE {1} \
   CONFIG.PSU__DDRC__TRAIN_WRITE_LEVEL {1} \
   CONFIG.PSU__DDRC__T_FAW {30.0} \
   CONFIG.PSU__DDRC__T_RAS_MIN {33} \
   CONFIG.PSU__DDRC__T_RC {46.5} \
   CONFIG.PSU__DDRC__T_RCD {15} \
   CONFIG.PSU__DDRC__T_RP {15} \
   CONFIG.PSU__DDRC__VENDOR_PART {OTHERS} \
   CONFIG.PSU__DDRC__VIDEO_BUFFER_SIZE {0} \
   CONFIG.PSU__DDRC__VREF {1} \
   CONFIG.PSU__DDR_HIGH_ADDRESS_GUI_ENABLE {1} \
   CONFIG.PSU__DDR_QOS_ENABLE {0} \
   CONFIG.PSU__DDR_QOS_FIX_HP0_RDQOS {} \
   CONFIG.PSU__DDR_QOS_FIX_HP0_WRQOS {} \
   CONFIG.PSU__DDR_QOS_FIX_HP1_RDQOS {} \
   CONFIG.PSU__DDR_QOS_FIX_HP1_WRQOS {} \
   CONFIG.PSU__DDR_QOS_FIX_HP2_RDQOS {} \
   CONFIG.PSU__DDR_QOS_FIX_HP2_WRQOS {} \
   CONFIG.PSU__DDR_QOS_FIX_HP3_RDQOS {} \
   CONFIG.PSU__DDR_QOS_FIX_HP3_WRQOS {} \
   CONFIG.PSU__DDR_QOS_HP0_RDQOS {} \
   CONFIG.PSU__DDR_QOS_HP0_WRQOS {} \
   CONFIG.PSU__DDR_QOS_HP1_RDQOS {} \
   CONFIG.PSU__DDR_QOS_HP1_WRQOS {} \
   CONFIG.PSU__DDR_QOS_HP2_RDQOS {} \
   CONFIG.PSU__DDR_QOS_HP2_WRQOS {} \
   CONFIG.PSU__DDR_QOS_HP3_RDQOS {} \
   CONFIG.PSU__DDR_QOS_HP3_WRQOS {} \
   CONFIG.PSU__DDR_QOS_RD_HPR_THRSHLD {} \
   CONFIG.PSU__DDR_QOS_RD_LPR_THRSHLD {} \
   CONFIG.PSU__DDR_QOS_WR_THRSHLD {} \
   CONFIG.PSU__DDR_SW_REFRESH_ENABLED {1} \
   CONFIG.PSU__DDR__INTERFACE__FREQMHZ {533.500} \
   CONFIG.PSU__DEVICE_TYPE {EG} \
   CONFIG.PSU__DISPLAYPORT__LANE0__ENABLE {1} \
   CONFIG.PSU__DISPLAYPORT__LANE0__IO {GT Lane3} \
   CONFIG.PSU__DISPLAYPORT__LANE1__ENABLE {1} \
   CONFIG.PSU__DISPLAYPORT__LANE1__IO {GT Lane2} \
   CONFIG.PSU__DISPLAYPORT__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__DLL__ISUSED {1} \
   CONFIG.PSU__DPAUX__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__DPAUX__PERIPHERAL__IO {MIO 34 .. 37} \
   CONFIG.PSU__DP__LANE_SEL {Dual Higher} \
   CONFIG.PSU__DP__REF_CLK_FREQ {135} \
   CONFIG.PSU__DP__REF_CLK_SEL {Ref Clk2} \
   CONFIG.PSU__ENABLE__DDR__REFRESH__SIGNALS {0} \
   CONFIG.PSU__ENET0__FIFO__ENABLE {0} \
   CONFIG.PSU__ENET0__GRP_MDIO__ENABLE {0} \
   CONFIG.PSU__ENET0__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__ENET0__PTP__ENABLE {0} \
   CONFIG.PSU__ENET0__TSU__ENABLE {0} \
   CONFIG.PSU__ENET1__FIFO__ENABLE {0} \
   CONFIG.PSU__ENET1__GRP_MDIO__ENABLE {1} \
   CONFIG.PSU__ENET1__GRP_MDIO__IO {EMIO} \
   CONFIG.PSU__ENET1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__ENET1__PERIPHERAL__IO {EMIO} \
   CONFIG.PSU__ENET1__PTP__ENABLE {0} \
   CONFIG.PSU__ENET1__TSU__ENABLE {1} \
   CONFIG.PSU__ENET2__FIFO__ENABLE {0} \
   CONFIG.PSU__ENET2__GRP_MDIO__ENABLE {1} \
   CONFIG.PSU__ENET2__GRP_MDIO__IO {MIO 76 .. 77} \
   CONFIG.PSU__ENET2__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__ENET2__PERIPHERAL__IO {MIO 52 .. 63} \
   CONFIG.PSU__ENET2__PTP__ENABLE {0} \
   CONFIG.PSU__ENET2__TSU__ENABLE {0} \
   CONFIG.PSU__ENET3__FIFO__ENABLE {0} \
   CONFIG.PSU__ENET3__GRP_MDIO__ENABLE {0} \
   CONFIG.PSU__ENET3__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__ENET3__PTP__ENABLE {0} \
   CONFIG.PSU__ENET3__TSU__ENABLE {0} \
   CONFIG.PSU__EN_AXI_STATUS_PORTS {0} \
   CONFIG.PSU__EN_EMIO_TRACE {0} \
   CONFIG.PSU__EP__IP {0} \
   CONFIG.PSU__EXPAND__CORESIGHT {0} \
   CONFIG.PSU__EXPAND__FPD_SLAVES {0} \
   CONFIG.PSU__EXPAND__GIC {0} \
   CONFIG.PSU__EXPAND__LOWER_LPS_SLAVES {0} \
   CONFIG.PSU__EXPAND__UPPER_LPS_SLAVES {0} \
   CONFIG.PSU__FPDMASTERS_COHERENCY {0} \
   CONFIG.PSU__FPD_SLCR__WDT1__ACT_FREQMHZ {100} \
   CONFIG.PSU__FPD_SLCR__WDT1__FREQMHZ {100} \
   CONFIG.PSU__FPD_SLCR__WDT_CLK_SEL__SELECT {APB} \
   CONFIG.PSU__FPGA_PL0_ENABLE {1} \
   CONFIG.PSU__FPGA_PL1_ENABLE {0} \
   CONFIG.PSU__FPGA_PL2_ENABLE {0} \
   CONFIG.PSU__FPGA_PL3_ENABLE {0} \
   CONFIG.PSU__FP__POWER__ON {1} \
   CONFIG.PSU__FTM__CTI_IN_0 {0} \
   CONFIG.PSU__FTM__CTI_IN_1 {0} \
   CONFIG.PSU__FTM__CTI_IN_2 {0} \
   CONFIG.PSU__FTM__CTI_IN_3 {0} \
   CONFIG.PSU__FTM__CTI_OUT_0 {0} \
   CONFIG.PSU__FTM__CTI_OUT_1 {0} \
   CONFIG.PSU__FTM__CTI_OUT_2 {0} \
   CONFIG.PSU__FTM__CTI_OUT_3 {0} \
   CONFIG.PSU__FTM__GPI {0} \
   CONFIG.PSU__FTM__GPO {0} \
   CONFIG.PSU__GEM0_COHERENCY {0} \
   CONFIG.PSU__GEM0_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__GEM1_COHERENCY {0} \
   CONFIG.PSU__GEM1_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__GEM2_COHERENCY {0} \
   CONFIG.PSU__GEM2_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__GEM3_COHERENCY {0} \
   CONFIG.PSU__GEM3_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__GEM__TSU__ENABLE {0} \
   CONFIG.PSU__GEN_IPI_0__MASTER {APU} \
   CONFIG.PSU__GEN_IPI_10__MASTER {NONE} \
   CONFIG.PSU__GEN_IPI_1__MASTER {RPU0} \
   CONFIG.PSU__GEN_IPI_2__MASTER {RPU1} \
   CONFIG.PSU__GEN_IPI_3__MASTER {PMU} \
   CONFIG.PSU__GEN_IPI_4__MASTER {PMU} \
   CONFIG.PSU__GEN_IPI_5__MASTER {PMU} \
   CONFIG.PSU__GEN_IPI_6__MASTER {PMU} \
   CONFIG.PSU__GEN_IPI_7__MASTER {NONE} \
   CONFIG.PSU__GEN_IPI_8__MASTER {NONE} \
   CONFIG.PSU__GEN_IPI_9__MASTER {NONE} \
   CONFIG.PSU__GPIO0_MIO__IO {MIO 0 .. 25} \
   CONFIG.PSU__GPIO0_MIO__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__GPIO1_MIO__IO {MIO 26 .. 51} \
   CONFIG.PSU__GPIO1_MIO__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__GPIO2_MIO__IO {MIO 52 .. 77} \
   CONFIG.PSU__GPIO2_MIO__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__GPIO_EMIO_WIDTH {95} \
   CONFIG.PSU__GPIO_EMIO__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__GPIO_EMIO__PERIPHERAL__IO {95} \
   CONFIG.PSU__GPIO_EMIO__WIDTH {[94:0]} \
   CONFIG.PSU__GPU_PP0__POWER__ON {1} \
   CONFIG.PSU__GPU_PP1__POWER__ON {1} \
   CONFIG.PSU__GT_REF_CLK__FREQMHZ {33.333} \
   CONFIG.PSU__GT__LINK_SPEED {HBR} \
   CONFIG.PSU__GT__PRE_EMPH_LVL_4 {0} \
   CONFIG.PSU__GT__VLT_SWNG_LVL_4 {0} \
   CONFIG.PSU__HIGH_ADDRESS__ENABLE {1} \
   CONFIG.PSU__HPM0_FPD__NUM_READ_THREADS {4} \
   CONFIG.PSU__HPM0_FPD__NUM_WRITE_THREADS {4} \
   CONFIG.PSU__HPM0_LPD__NUM_READ_THREADS {4} \
   CONFIG.PSU__HPM0_LPD__NUM_WRITE_THREADS {4} \
   CONFIG.PSU__HPM1_FPD__NUM_READ_THREADS {4} \
   CONFIG.PSU__HPM1_FPD__NUM_WRITE_THREADS {4} \
   CONFIG.PSU__I2C0_LOOP_I2C1__ENABLE {0} \
   CONFIG.PSU__I2C0__GRP_INT__ENABLE {0} \
   CONFIG.PSU__I2C0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__I2C0__PERIPHERAL__IO {MIO 30 .. 31} \
   CONFIG.PSU__I2C1__GRP_INT__ENABLE {0} \
   CONFIG.PSU__I2C1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__I2C1__PERIPHERAL__IO {EMIO} \
   CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC0_SEL {APB} \
   CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC1_SEL {APB} \
   CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC2_SEL {APB} \
   CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC3_SEL {APB} \
   CONFIG.PSU__IOU_SLCR__TTC0__ACT_FREQMHZ {100} \
   CONFIG.PSU__IOU_SLCR__TTC0__FREQMHZ {100} \
   CONFIG.PSU__IOU_SLCR__TTC1__ACT_FREQMHZ {100} \
   CONFIG.PSU__IOU_SLCR__TTC1__FREQMHZ {100} \
   CONFIG.PSU__IOU_SLCR__TTC2__ACT_FREQMHZ {100} \
   CONFIG.PSU__IOU_SLCR__TTC2__FREQMHZ {100} \
   CONFIG.PSU__IOU_SLCR__TTC3__ACT_FREQMHZ {100} \
   CONFIG.PSU__IOU_SLCR__TTC3__FREQMHZ {100} \
   CONFIG.PSU__IOU_SLCR__WDT0__ACT_FREQMHZ {100} \
   CONFIG.PSU__IOU_SLCR__WDT0__FREQMHZ {100} \
   CONFIG.PSU__IOU_SLCR__WDT_CLK_SEL__SELECT {APB} \
   CONFIG.PSU__IRQ_P2F_ADMA_CHAN__INT {0} \
   CONFIG.PSU__IRQ_P2F_AIB_AXI__INT {0} \
   CONFIG.PSU__IRQ_P2F_AMS__INT {0} \
   CONFIG.PSU__IRQ_P2F_APM_FPD__INT {0} \
   CONFIG.PSU__IRQ_P2F_APU_COMM__INT {0} \
   CONFIG.PSU__IRQ_P2F_APU_CPUMNT__INT {0} \
   CONFIG.PSU__IRQ_P2F_APU_CTI__INT {0} \
   CONFIG.PSU__IRQ_P2F_APU_EXTERR__INT {0} \
   CONFIG.PSU__IRQ_P2F_APU_IPI__INT {0} \
   CONFIG.PSU__IRQ_P2F_APU_L2ERR__INT {0} \
   CONFIG.PSU__IRQ_P2F_APU_PMU__INT {0} \
   CONFIG.PSU__IRQ_P2F_APU_REGS__INT {0} \
   CONFIG.PSU__IRQ_P2F_ATB_LPD__INT {0} \
   CONFIG.PSU__IRQ_P2F_CAN0__INT {0} \
   CONFIG.PSU__IRQ_P2F_CAN1__INT {0} \
   CONFIG.PSU__IRQ_P2F_CLKMON__INT {0} \
   CONFIG.PSU__IRQ_P2F_CSUPMU_WDT__INT {0} \
   CONFIG.PSU__IRQ_P2F_CSU_DMA__INT {0} \
   CONFIG.PSU__IRQ_P2F_CSU__INT {0} \
   CONFIG.PSU__IRQ_P2F_DDR_SS__INT {0} \
   CONFIG.PSU__IRQ_P2F_DPDMA__INT {0} \
   CONFIG.PSU__IRQ_P2F_DPORT__INT {0} \
   CONFIG.PSU__IRQ_P2F_EFUSE__INT {0} \
   CONFIG.PSU__IRQ_P2F_ENT0_WAKEUP__INT {0} \
   CONFIG.PSU__IRQ_P2F_ENT0__INT {0} \
   CONFIG.PSU__IRQ_P2F_ENT1_WAKEUP__INT {0} \
   CONFIG.PSU__IRQ_P2F_ENT1__INT {0} \
   CONFIG.PSU__IRQ_P2F_ENT2_WAKEUP__INT {0} \
   CONFIG.PSU__IRQ_P2F_ENT2__INT {0} \
   CONFIG.PSU__IRQ_P2F_ENT3_WAKEUP__INT {0} \
   CONFIG.PSU__IRQ_P2F_ENT3__INT {0} \
   CONFIG.PSU__IRQ_P2F_FPD_APB__INT {0} \
   CONFIG.PSU__IRQ_P2F_FPD_ATB_ERR__INT {0} \
   CONFIG.PSU__IRQ_P2F_FP_WDT__INT {0} \
   CONFIG.PSU__IRQ_P2F_GDMA_CHAN__INT {0} \
   CONFIG.PSU__IRQ_P2F_GPIO__INT {0} \
   CONFIG.PSU__IRQ_P2F_GPU__INT {0} \
   CONFIG.PSU__IRQ_P2F_I2C0__INT {0} \
   CONFIG.PSU__IRQ_P2F_I2C1__INT {0} \
   CONFIG.PSU__IRQ_P2F_LPD_APB__INT {0} \
   CONFIG.PSU__IRQ_P2F_LPD_APM__INT {0} \
   CONFIG.PSU__IRQ_P2F_LP_WDT__INT {0} \
   CONFIG.PSU__IRQ_P2F_NAND__INT {0} \
   CONFIG.PSU__IRQ_P2F_OCM_ERR__INT {0} \
   CONFIG.PSU__IRQ_P2F_PCIE_DMA__INT {0} \
   CONFIG.PSU__IRQ_P2F_PCIE_LEGACY__INT {0} \
   CONFIG.PSU__IRQ_P2F_PCIE_MSC__INT {0} \
   CONFIG.PSU__IRQ_P2F_PCIE_MSI__INT {0} \
   CONFIG.PSU__IRQ_P2F_PL_IPI__INT {0} \
   CONFIG.PSU__IRQ_P2F_QSPI__INT {0} \
   CONFIG.PSU__IRQ_P2F_R5_CORE0_ECC_ERR__INT {0} \
   CONFIG.PSU__IRQ_P2F_R5_CORE1_ECC_ERR__INT {0} \
   CONFIG.PSU__IRQ_P2F_RPU_IPI__INT {0} \
   CONFIG.PSU__IRQ_P2F_RPU_PERMON__INT {0} \
   CONFIG.PSU__IRQ_P2F_RTC_ALARM__INT {0} \
   CONFIG.PSU__IRQ_P2F_RTC_SECONDS__INT {0} \
   CONFIG.PSU__IRQ_P2F_SATA__INT {0} \
   CONFIG.PSU__IRQ_P2F_SDIO0_WAKE__INT {0} \
   CONFIG.PSU__IRQ_P2F_SDIO0__INT {0} \
   CONFIG.PSU__IRQ_P2F_SDIO1_WAKE__INT {0} \
   CONFIG.PSU__IRQ_P2F_SDIO1__INT {0} \
   CONFIG.PSU__IRQ_P2F_SPI0__INT {0} \
   CONFIG.PSU__IRQ_P2F_SPI1__INT {0} \
   CONFIG.PSU__IRQ_P2F_TTC0__INT0 {0} \
   CONFIG.PSU__IRQ_P2F_TTC0__INT1 {0} \
   CONFIG.PSU__IRQ_P2F_TTC0__INT2 {0} \
   CONFIG.PSU__IRQ_P2F_TTC1__INT0 {0} \
   CONFIG.PSU__IRQ_P2F_TTC1__INT1 {0} \
   CONFIG.PSU__IRQ_P2F_TTC1__INT2 {0} \
   CONFIG.PSU__IRQ_P2F_TTC2__INT0 {0} \
   CONFIG.PSU__IRQ_P2F_TTC2__INT1 {0} \
   CONFIG.PSU__IRQ_P2F_TTC2__INT2 {0} \
   CONFIG.PSU__IRQ_P2F_TTC3__INT0 {0} \
   CONFIG.PSU__IRQ_P2F_TTC3__INT1 {0} \
   CONFIG.PSU__IRQ_P2F_TTC3__INT2 {0} \
   CONFIG.PSU__IRQ_P2F_UART0__INT {0} \
   CONFIG.PSU__IRQ_P2F_UART1__INT {0} \
   CONFIG.PSU__IRQ_P2F_USB3_ENDPOINT__INT0 {0} \
   CONFIG.PSU__IRQ_P2F_USB3_ENDPOINT__INT1 {0} \
   CONFIG.PSU__IRQ_P2F_USB3_OTG__INT0 {0} \
   CONFIG.PSU__IRQ_P2F_USB3_OTG__INT1 {0} \
   CONFIG.PSU__IRQ_P2F_USB3_PMU_WAKEUP__INT {0} \
   CONFIG.PSU__IRQ_P2F_XMPU_FPD__INT {0} \
   CONFIG.PSU__IRQ_P2F_XMPU_LPD__INT {0} \
   CONFIG.PSU__IRQ_P2F__INTF_FPD_SMMU__INT {0} \
   CONFIG.PSU__IRQ_P2F__INTF_PPD_CCI__INT {0} \
   CONFIG.PSU__L2_BANK0__POWER__ON {1} \
   CONFIG.PSU__LPDMA0_COHERENCY {0} \
   CONFIG.PSU__LPDMA1_COHERENCY {0} \
   CONFIG.PSU__LPDMA2_COHERENCY {0} \
   CONFIG.PSU__LPDMA3_COHERENCY {0} \
   CONFIG.PSU__LPDMA4_COHERENCY {0} \
   CONFIG.PSU__LPDMA5_COHERENCY {0} \
   CONFIG.PSU__LPDMA6_COHERENCY {0} \
   CONFIG.PSU__LPDMA7_COHERENCY {0} \
   CONFIG.PSU__LPD_SLCR__CSUPMU_WDT_CLK_SEL__SELECT {APB} \
   CONFIG.PSU__LPD_SLCR__CSUPMU__ACT_FREQMHZ {100} \
   CONFIG.PSU__LPD_SLCR__CSUPMU__FREQMHZ {100} \
   CONFIG.PSU__MAXIGP0__DATA_WIDTH {128} \
   CONFIG.PSU__MAXIGP1__DATA_WIDTH {128} \
   CONFIG.PSU__MAXIGP2__DATA_WIDTH {32} \
   CONFIG.PSU__M_AXI_GP0_SUPPORTS_NARROW_BURST {1} \
   CONFIG.PSU__M_AXI_GP1_SUPPORTS_NARROW_BURST {1} \
   CONFIG.PSU__M_AXI_GP2_SUPPORTS_NARROW_BURST {1} \
   CONFIG.PSU__NAND_COHERENCY {0} \
   CONFIG.PSU__NAND_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__NAND__CHIP_ENABLE__ENABLE {0} \
   CONFIG.PSU__NAND__DATA_STROBE__ENABLE {1} \
   CONFIG.PSU__NAND__DATA_STROBE__IO {MIO 12} \
   CONFIG.PSU__NAND__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__NAND__PERIPHERAL__IO {MIO 13 .. 25} \
   CONFIG.PSU__NAND__READY0_BUSY__ENABLE {1} \
   CONFIG.PSU__NAND__READY0_BUSY__IO {MIO 27} \
   CONFIG.PSU__NAND__READY1_BUSY__ENABLE {0} \
   CONFIG.PSU__NAND__READY_BUSY__ENABLE {0} \
   CONFIG.PSU__NUM_FABRIC_RESETS {1} \
   CONFIG.PSU__OCM_BANK0__POWER__ON {1} \
   CONFIG.PSU__OCM_BANK1__POWER__ON {1} \
   CONFIG.PSU__OCM_BANK2__POWER__ON {1} \
   CONFIG.PSU__OCM_BANK3__POWER__ON {1} \
   CONFIG.PSU__OVERRIDE__BASIC_CLOCK {0} \
   CONFIG.PSU__PCIE__ACS_VIOLAION {0} \
   CONFIG.PSU__PCIE__ACS_VIOLATION {0} \
   CONFIG.PSU__PCIE__AER_CAPABILITY {0} \
   CONFIG.PSU__PCIE__ATOMICOP_EGRESS_BLOCKED {0} \
   CONFIG.PSU__PCIE__BAR0_64BIT {0} \
   CONFIG.PSU__PCIE__BAR0_ENABLE {1} \
   CONFIG.PSU__PCIE__BAR0_PREFETCHABLE {0} \
   CONFIG.PSU__PCIE__BAR0_SCALE {Kilobytes} \
   CONFIG.PSU__PCIE__BAR0_SIZE {8} \
   CONFIG.PSU__PCIE__BAR0_TYPE {Memory} \
   CONFIG.PSU__PCIE__BAR0_VAL {0xffffe000} \
   CONFIG.PSU__PCIE__BAR1_64BIT {0} \
   CONFIG.PSU__PCIE__BAR1_ENABLE {0} \
   CONFIG.PSU__PCIE__BAR1_PREFETCHABLE {0} \
   CONFIG.PSU__PCIE__BAR1_VAL {0x0} \
   CONFIG.PSU__PCIE__BAR2_64BIT {0} \
   CONFIG.PSU__PCIE__BAR2_ENABLE {0} \
   CONFIG.PSU__PCIE__BAR2_PREFETCHABLE {0} \
   CONFIG.PSU__PCIE__BAR2_VAL {0x0} \
   CONFIG.PSU__PCIE__BAR3_64BIT {0} \
   CONFIG.PSU__PCIE__BAR3_ENABLE {0} \
   CONFIG.PSU__PCIE__BAR3_PREFETCHABLE {0} \
   CONFIG.PSU__PCIE__BAR3_VAL {0x0} \
   CONFIG.PSU__PCIE__BAR4_64BIT {0} \
   CONFIG.PSU__PCIE__BAR4_ENABLE {0} \
   CONFIG.PSU__PCIE__BAR4_PREFETCHABLE {0} \
   CONFIG.PSU__PCIE__BAR4_VAL {0x0} \
   CONFIG.PSU__PCIE__BAR5_64BIT {0} \
   CONFIG.PSU__PCIE__BAR5_ENABLE {0} \
   CONFIG.PSU__PCIE__BAR5_PREFETCHABLE {0} \
   CONFIG.PSU__PCIE__BAR5_VAL {0x0} \
   CONFIG.PSU__PCIE__CLASS_CODE_BASE {0x06} \
   CONFIG.PSU__PCIE__CLASS_CODE_INTERFACE {0x0} \
   CONFIG.PSU__PCIE__CLASS_CODE_SUB {0x4} \
   CONFIG.PSU__PCIE__CLASS_CODE_VALUE {0x60400} \
   CONFIG.PSU__PCIE__COMPLETER_ABORT {0} \
   CONFIG.PSU__PCIE__COMPLTION_TIMEOUT {0} \
   CONFIG.PSU__PCIE__CORRECTABLE_INT_ERR {0} \
   CONFIG.PSU__PCIE__CRS_SW_VISIBILITY {1} \
   CONFIG.PSU__PCIE__DEVICE_ID {0x7012} \
   CONFIG.PSU__PCIE__DEVICE_PORT_TYPE {Root Port} \
   CONFIG.PSU__PCIE__ECRC_CHECK {0} \
   CONFIG.PSU__PCIE__ECRC_ERR {0} \
   CONFIG.PSU__PCIE__ECRC_GEN {0} \
   CONFIG.PSU__PCIE__EROM_ENABLE {0} \
   CONFIG.PSU__PCIE__EROM_VAL {0x0} \
   CONFIG.PSU__PCIE__FLOW_CONTROL_ERR {0} \
   CONFIG.PSU__PCIE__FLOW_CONTROL_PROTOCOL_ERR {0} \
   CONFIG.PSU__PCIE__HEADER_LOG_OVERFLOW {0} \
   CONFIG.PSU__PCIE__INTX_GENERATION {0} \
   CONFIG.PSU__PCIE__LANE0__ENABLE {1} \
   CONFIG.PSU__PCIE__LANE0__IO {GT Lane0} \
   CONFIG.PSU__PCIE__LANE1__ENABLE {0} \
   CONFIG.PSU__PCIE__LANE2__ENABLE {0} \
   CONFIG.PSU__PCIE__LANE3__ENABLE {0} \
   CONFIG.PSU__PCIE__LINK_SPEED {5.0 Gb/s} \
   CONFIG.PSU__PCIE__MAXIMUM_LINK_WIDTH {x1} \
   CONFIG.PSU__PCIE__MAX_PAYLOAD_SIZE {256 bytes} \
   CONFIG.PSU__PCIE__MC_BLOCKED_TLP {0} \
   CONFIG.PSU__PCIE__MSIX_BAR_INDICATOR {} \
   CONFIG.PSU__PCIE__MSIX_CAPABILITY {0} \
   CONFIG.PSU__PCIE__MSIX_PBA_BAR_INDICATOR {} \
   CONFIG.PSU__PCIE__MSIX_PBA_OFFSET {0} \
   CONFIG.PSU__PCIE__MSIX_TABLE_OFFSET {0} \
   CONFIG.PSU__PCIE__MSIX_TABLE_SIZE {0} \
   CONFIG.PSU__PCIE__MSI_64BIT_ADDR_CAPABLE {0} \
   CONFIG.PSU__PCIE__MSI_CAPABILITY {0} \
   CONFIG.PSU__PCIE__MULTIHEADER {0} \
   CONFIG.PSU__PCIE__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__PCIE__PERIPHERAL__ENDPOINT_ENABLE {0} \
   CONFIG.PSU__PCIE__PERIPHERAL__ROOTPORT_ENABLE {1} \
   CONFIG.PSU__PCIE__PERIPHERAL__ROOTPORT_IO {MIO 29} \
   CONFIG.PSU__PCIE__PERM_ROOT_ERR_UPDATE {0} \
   CONFIG.PSU__PCIE__RECEIVER_ERR {0} \
   CONFIG.PSU__PCIE__RECEIVER_OVERFLOW {0} \
   CONFIG.PSU__PCIE__REF_CLK_FREQ {100} \
   CONFIG.PSU__PCIE__REF_CLK_SEL {Ref Clk0} \
   CONFIG.PSU__PCIE__RESET__POLARITY {Active Low} \
   CONFIG.PSU__PCIE__REVISION_ID {0x0} \
   CONFIG.PSU__PCIE__SUBSYSTEM_ID {0x7} \
   CONFIG.PSU__PCIE__SUBSYSTEM_VENDOR_ID {0x10EE} \
   CONFIG.PSU__PCIE__SURPRISE_DOWN {0} \
   CONFIG.PSU__PCIE__TLP_PREFIX_BLOCKED {0} \
   CONFIG.PSU__PCIE__UNCORRECTABL_INT_ERR {0} \
   CONFIG.PSU__PCIE__VENDOR_ID {0x10EE} \
   CONFIG.PSU__PJTAG__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__PL_CLK0_BUF {TRUE} \
   CONFIG.PSU__PL_CLK1_BUF {FALSE} \
   CONFIG.PSU__PL_CLK2_BUF {FALSE} \
   CONFIG.PSU__PL_CLK3_BUF {FALSE} \
   CONFIG.PSU__PL__POWER__ON {1} \
   CONFIG.PSU__PMU_COHERENCY {0} \
   CONFIG.PSU__PMU__AIBACK__ENABLE {0} \
   CONFIG.PSU__PMU__EMIO_GPI__ENABLE {0} \
   CONFIG.PSU__PMU__EMIO_GPO__ENABLE {0} \
   CONFIG.PSU__PMU__GPI0__ENABLE {0} \
   CONFIG.PSU__PMU__GPI1__ENABLE {0} \
   CONFIG.PSU__PMU__GPI2__ENABLE {0} \
   CONFIG.PSU__PMU__GPI3__ENABLE {0} \
   CONFIG.PSU__PMU__GPI4__ENABLE {0} \
   CONFIG.PSU__PMU__GPI5__ENABLE {0} \
   CONFIG.PSU__PMU__GPO0__ENABLE {0} \
   CONFIG.PSU__PMU__GPO1__ENABLE {0} \
   CONFIG.PSU__PMU__GPO2__ENABLE {0} \
   CONFIG.PSU__PMU__GPO3__ENABLE {0} \
   CONFIG.PSU__PMU__GPO4__ENABLE {0} \
   CONFIG.PSU__PMU__GPO5__ENABLE {0} \
   CONFIG.PSU__PMU__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__PMU__PLERROR__ENABLE {0} \
   CONFIG.PSU__PRESET_APPLIED {0} \
   CONFIG.PSU__PROTECTION__DDR_SEGMENTS {NONE} \
   CONFIG.PSU__PROTECTION__DEBUG {0} \
   CONFIG.PSU__PROTECTION__ENABLE {0} \
   CONFIG.PSU__PROTECTION__FPD_SEGMENTS {SA:0xFD1A0000 ;SIZE:1280;UNIT:KB ;RegionTZ:Secure ;WrAllowed:Read/Write;subsystemId:PMU Firmware | SA:0xFD000000 ;SIZE:64;UNIT:KB ;RegionTZ:Secure ;WrAllowed:Read/Write;subsystemId:PMU Firmware | SA:0xFD010000 ;SIZE:64;UNIT:KB ;RegionTZ:Secure ;WrAllowed:Read/Write;subsystemId:PMU Firmware | SA:0xFD020000 ;SIZE:64;UNIT:KB ;RegionTZ:Secure ;WrAllowed:Read/Write;subsystemId:PMU Firmware | SA:0xFD030000 ;SIZE:64;UNIT:KB ;RegionTZ:Secure ;WrAllowed:Read/Write;subsystemId:PMU Firmware | SA:0xFD040000 ;SIZE:64;UNIT:KB ;RegionTZ:Secure ;WrAllowed:Read/Write;subsystemId:PMU Firmware | SA:0xFD050000 ;SIZE:64;UNIT:KB ;RegionTZ:Secure ;WrAllowed:Read/Write;subsystemId:PMU Firmware | SA:0xFD610000 ;SIZE:512;UNIT:KB ;RegionTZ:Secure ;WrAllowed:Read/Write;subsystemId:PMU Firmware | SA:0xFD5D0000 ;SIZE:64;UNIT:KB ;RegionTZ:Secure ;WrAllowed:Read/Write;subsystemId:PMU Firmware} \
   CONFIG.PSU__PROTECTION__LOCK_UNUSED_SEGMENTS {0} \
   CONFIG.PSU__PROTECTION__LPD_SEGMENTS {SA:0xFF980000 ;SIZE:64;UNIT:KB ;RegionTZ:Secure ;WrAllowed:Read/Write;subsystemId:PMU Firmware|SA:0xFF5E0000 ;SIZE:2560;UNIT:KB ;RegionTZ:Secure ;WrAllowed:Read/Write;subsystemId:PMU Firmware|SA:0xFFCC0000 ;SIZE:64;UNIT:KB ;RegionTZ:Secure ;WrAllowed:Read/Write;subsystemId:PMU Firmware|SA:0xFF180000 ;SIZE:768;UNIT:KB ;RegionTZ:Secure ;WrAllowed:Read/Write;subsystemId:PMU Firmware|SA:0xFF410000 ;SIZE:640;UNIT:KB ;RegionTZ:Secure ;WrAllowed:Read/Write;subsystemId:PMU Firmware|SA:0xFFA70000 ;SIZE:64;UNIT:KB ;RegionTZ:Secure ;WrAllowed:Read/Write;subsystemId:PMU Firmware|SA:0xFF9A0000 ;SIZE:64;UNIT:KB ;RegionTZ:Secure ;WrAllowed:Read/Write;subsystemId:PMU Firmware} \
   CONFIG.PSU__PROTECTION__MASTERS {USB1:NonSecure;1|USB0:NonSecure;0|S_AXI_LPD:NA;0|S_AXI_HPC1_FPD:NA;0|S_AXI_HPC0_FPD:NA;0|S_AXI_HP3_FPD:NA;0|S_AXI_HP2_FPD:NA;1|S_AXI_HP1_FPD:NA;1|S_AXI_HP0_FPD:NA;0|S_AXI_ACP:NA;0|S_AXI_ACE:NA;0|SD1:NonSecure;1|SD0:NonSecure;1|SATA1:NonSecure;1|SATA0:NonSecure;1|RPU1:Secure;1|RPU0:Secure;1|QSPI:NonSecure;1|PMU:NA;1|PCIe:NonSecure;1|NAND:NonSecure;1|LDMA:NonSecure;1|GPU:NonSecure;1|GEM3:NonSecure;0|GEM2:NonSecure;1|GEM1:NonSecure;1|GEM0:NonSecure;0|FDMA:NonSecure;1|DP:NonSecure;1|DAP:NA;1|Coresight:NA;1|CSU:NA;1|APU:NA;1} \
   CONFIG.PSU__PROTECTION__MASTERS_TZ {GEM0:NonSecure|SD1:NonSecure|GEM2:NonSecure|GEM1:NonSecure|GEM3:NonSecure|PCIe:NonSecure|DP:NonSecure|NAND:NonSecure|GPU:NonSecure|USB1:NonSecure|USB0:NonSecure|LDMA:NonSecure|FDMA:NonSecure|QSPI:NonSecure|SD0:NonSecure} \
   CONFIG.PSU__PROTECTION__OCM_SEGMENTS {NONE} \
   CONFIG.PSU__PROTECTION__PRESUBSYSTEMS {NONE} \
   CONFIG.PSU__PROTECTION__SLAVES {LPD;USB3_1_XHCI;FE300000;FE3FFFFF;1|LPD;USB3_1;FF9E0000;FF9EFFFF;1|LPD;USB3_0_XHCI;FE200000;FE2FFFFF;0|LPD;USB3_0;FF9D0000;FF9DFFFF;0|LPD;UART1;FF010000;FF01FFFF;1|LPD;UART0;FF000000;FF00FFFF;1|LPD;TTC3;FF140000;FF14FFFF;0|LPD;TTC2;FF130000;FF13FFFF;0|LPD;TTC1;FF120000;FF12FFFF;0|LPD;TTC0;FF110000;FF11FFFF;0|FPD;SWDT1;FD4D0000;FD4DFFFF;0|LPD;SWDT0;FF150000;FF15FFFF;0|LPD;SPI1;FF050000;FF05FFFF;0|LPD;SPI0;FF040000;FF04FFFF;0|FPD;SMMU_REG;FD5F0000;FD5FFFFF;1|FPD;SMMU;FD800000;FDFFFFFF;1|FPD;SIOU;FD3D0000;FD3DFFFF;1|FPD;SERDES;FD400000;FD47FFFF;1|LPD;SD1;FF170000;FF17FFFF;1|LPD;SD0;FF160000;FF16FFFF;1|FPD;SATA;FD0C0000;FD0CFFFF;1|LPD;RTC;FFA60000;FFA6FFFF;1|LPD;RSA_CORE;FFCE0000;FFCEFFFF;1|LPD;RPU;FF9A0000;FF9AFFFF;1|LPD;R5_TCM_RAM_GLOBAL;FFE00000;FFE3FFFF;1|LPD;R5_1_Instruction_Cache;FFEC0000;FFECFFFF;1|LPD;R5_1_Data_Cache;FFED0000;FFEDFFFF;1|LPD;R5_1_BTCM_GLOBAL;FFEB0000;FFEBFFFF;1|LPD;R5_1_ATCM_GLOBAL;FFE90000;FFE9FFFF;1|LPD;R5_0_Instruction_Cache;FFE40000;FFE4FFFF;1|LPD;R5_0_Data_Cache;FFE50000;FFE5FFFF;1|LPD;R5_0_BTCM_GLOBAL;FFE20000;FFE2FFFF;1|LPD;R5_0_ATCM_GLOBAL;FFE00000;FFE0FFFF;1|LPD;QSPI_Linear_Address;C0000000;DFFFFFFF;1|LPD;QSPI;FF0F0000;FF0FFFFF;1|LPD;PMU_RAM;FFDC0000;FFDDFFFF;1|LPD;PMU_GLOBAL;FFD80000;FFDBFFFF;1|FPD;PCIE_MAIN;FD0E0000;FD0EFFFF;1|FPD;PCIE_LOW;E0000000;EFFFFFFF;1|FPD;PCIE_HIGH2;8000000000;BFFFFFFFFF;1|FPD;PCIE_HIGH1;600000000;7FFFFFFFF;1|FPD;PCIE_DMA;FD0F0000;FD0FFFFF;1|FPD;PCIE_ATTRIB;FD480000;FD48FFFF;1|LPD;OCM_XMPU_CFG;FFA70000;FFA7FFFF;1|LPD;OCM_SLCR;FF960000;FF96FFFF;1|OCM;OCM;FFFC0000;FFFFFFFF;1|LPD;NAND;FF100000;FF10FFFF;1|LPD;MBISTJTAG;FFCF0000;FFCFFFFF;1|LPD;LPD_XPPU_SINK;FF9C0000;FF9CFFFF;1|LPD;LPD_XPPU;FF980000;FF98FFFF;1|LPD;LPD_SLCR_SECURE;FF4B0000;FF4DFFFF;1|LPD;LPD_SLCR;FF410000;FF4AFFFF;1|LPD;LPD_GPV;FE100000;FE1FFFFF;1|LPD;LPD_DMA_7;FFAF0000;FFAFFFFF;1|LPD;LPD_DMA_6;FFAE0000;FFAEFFFF;1|LPD;LPD_DMA_5;FFAD0000;FFADFFFF;1|LPD;LPD_DMA_4;FFAC0000;FFACFFFF;1|LPD;LPD_DMA_3;FFAB0000;FFABFFFF;1|LPD;LPD_DMA_2;FFAA0000;FFAAFFFF;1|LPD;LPD_DMA_1;FFA90000;FFA9FFFF;1|LPD;LPD_DMA_0;FFA80000;FFA8FFFF;1|LPD;IPI_CTRL;FF380000;FF3FFFFF;1|LPD;IOU_SLCR;FF180000;FF23FFFF;1|LPD;IOU_SECURE_SLCR;FF240000;FF24FFFF;1|LPD;IOU_SCNTRS;FF260000;FF26FFFF;1|LPD;IOU_SCNTR;FF250000;FF25FFFF;1|LPD;IOU_GPV;FE000000;FE0FFFFF;1|LPD;I2C1;FF030000;FF03FFFF;1|LPD;I2C0;FF020000;FF02FFFF;1|FPD;GPU;FD4B0000;FD4BFFFF;1|LPD;GPIO;FF0A0000;FF0AFFFF;1|LPD;GEM3;FF0E0000;FF0EFFFF;0|LPD;GEM2;FF0D0000;FF0DFFFF;1|LPD;GEM1;FF0C0000;FF0CFFFF;1|LPD;GEM0;FF0B0000;FF0BFFFF;0|FPD;FPD_XMPU_SINK;FD4F0000;FD4FFFFF;1|FPD;FPD_XMPU_CFG;FD5D0000;FD5DFFFF;1|FPD;FPD_SLCR_SECURE;FD690000;FD6CFFFF;1|FPD;FPD_SLCR;FD610000;FD68FFFF;1|FPD;FPD_GPV;FD700000;FD7FFFFF;1|FPD;FPD_DMA_CH7;FD570000;FD57FFFF;1|FPD;FPD_DMA_CH6;FD560000;FD56FFFF;1|FPD;FPD_DMA_CH5;FD550000;FD55FFFF;1|FPD;FPD_DMA_CH4;FD540000;FD54FFFF;1|FPD;FPD_DMA_CH3;FD530000;FD53FFFF;1|FPD;FPD_DMA_CH2;FD520000;FD52FFFF;1|FPD;FPD_DMA_CH1;FD510000;FD51FFFF;1|FPD;FPD_DMA_CH0;FD500000;FD50FFFF;1|LPD;EFUSE;FFCC0000;FFCCFFFF;1|FPD;Display Port;FD4A0000;FD4AFFFF;1|FPD;DPDMA;FD4C0000;FD4CFFFF;1|FPD;DDR_XMPU5_CFG;FD050000;FD05FFFF;1|FPD;DDR_XMPU4_CFG;FD040000;FD04FFFF;1|FPD;DDR_XMPU3_CFG;FD030000;FD03FFFF;1|FPD;DDR_XMPU2_CFG;FD020000;FD02FFFF;1|FPD;DDR_XMPU1_CFG;FD010000;FD01FFFF;1|FPD;DDR_XMPU0_CFG;FD000000;FD00FFFF;1|FPD;DDR_QOS_CTRL;FD090000;FD09FFFF;1|FPD;DDR_PHY;FD080000;FD08FFFF;1|DDR;DDR_LOW;0;7FFFFFFF;1|DDR;DDR_HIGH;800000000;97FFFFFFF;1|FPD;DDDR_CTRL;FD070000;FD070FFF;1|LPD;Coresight;FE800000;FEFFFFFF;1|LPD;CSU_DMA;FFC80000;FFC9FFFF;1|LPD;CSU;FFCA0000;FFCAFFFF;0|LPD;CRL_APB;FF5E0000;FF85FFFF;1|FPD;CRF_APB;FD1A0000;FD2DFFFF;1|FPD;CCI_REG;FD5E0000;FD5EFFFF;1|FPD;CCI_GPV;FD6E0000;FD6EFFFF;1|LPD;CAN1;FF070000;FF07FFFF;1|LPD;CAN0;FF060000;FF06FFFF;0|FPD;APU;FD5C0000;FD5CFFFF;1|LPD;APM_INTC_IOU;FFA20000;FFA2FFFF;1|LPD;APM_FPD_LPD;FFA30000;FFA3FFFF;1|FPD;APM_5;FD490000;FD49FFFF;1|FPD;APM_0;FD0B0000;FD0BFFFF;1|LPD;APM2;FFA10000;FFA1FFFF;1|LPD;APM1;FFA00000;FFA0FFFF;1|LPD;AMS;FFA50000;FFA5FFFF;1|FPD;AFI_5;FD3B0000;FD3BFFFF;1|FPD;AFI_4;FD3A0000;FD3AFFFF;1|FPD;AFI_3;FD390000;FD39FFFF;1|FPD;AFI_2;FD380000;FD38FFFF;1|FPD;AFI_1;FD370000;FD37FFFF;1|FPD;AFI_0;FD360000;FD36FFFF;1|LPD;AFIFM6;FF9B0000;FF9BFFFF;1|FPD;ACPU_GIC;F9010000;F907FFFF;1} \
   CONFIG.PSU__PROTECTION__SUBSYSTEMS {PMU Firmware:PMU} \
   CONFIG.PSU__PSS_ALT_REF_CLK__ENABLE {0} \
   CONFIG.PSU__PSS_ALT_REF_CLK__FREQMHZ {33.333} \
   CONFIG.PSU__PSS_REF_CLK__FREQMHZ {33.333} \
   CONFIG.PSU__QSPI_COHERENCY {0} \
   CONFIG.PSU__QSPI_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__QSPI__GRP_FBCLK__ENABLE {0} \
   CONFIG.PSU__QSPI__PERIPHERAL__DATA_MODE {x4} \
   CONFIG.PSU__QSPI__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__QSPI__PERIPHERAL__IO {MIO 0 .. 5} \
   CONFIG.PSU__QSPI__PERIPHERAL__MODE {Single} \
   CONFIG.PSU__REPORT__DBGLOG {0} \
   CONFIG.PSU__RPU_COHERENCY {0} \
   CONFIG.PSU__RPU__POWER__ON {1} \
   CONFIG.PSU__SATA__LANE0__ENABLE {0} \
   CONFIG.PSU__SATA__LANE1__ENABLE {1} \
   CONFIG.PSU__SATA__LANE1__IO {GT Lane1} \
   CONFIG.PSU__SATA__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__SATA__REF_CLK_FREQ {150} \
   CONFIG.PSU__SATA__REF_CLK_SEL {Ref Clk1} \
   CONFIG.PSU__SAXIGP0__DATA_WIDTH {128} \
   CONFIG.PSU__SAXIGP1__DATA_WIDTH {128} \
   CONFIG.PSU__SAXIGP2__DATA_WIDTH {128} \
   CONFIG.PSU__SAXIGP3__DATA_WIDTH {128} \
   CONFIG.PSU__SAXIGP4__DATA_WIDTH {128} \
   CONFIG.PSU__SAXIGP5__DATA_WIDTH {128} \
   CONFIG.PSU__SAXIGP6__DATA_WIDTH {128} \
   CONFIG.PSU__SD0_COHERENCY {0} \
   CONFIG.PSU__SD0_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__SD0__DATA_TRANSFER_MODE {4Bit} \
   CONFIG.PSU__SD0__GRP_CD__ENABLE {0} \
   CONFIG.PSU__SD0__GRP_CD__IO {<Select>} \
   CONFIG.PSU__SD0__GRP_POW__ENABLE {0} \
   CONFIG.PSU__SD0__GRP_WP__ENABLE {0} \
   CONFIG.PSU__SD0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__SD0__PERIPHERAL__IO {MIO 38 .. 44} \
   CONFIG.PSU__SD0__RESET__ENABLE {0} \
   CONFIG.PSU__SD0__SLOT_TYPE {SD 2.0} \
   CONFIG.PSU__SD1_COHERENCY {0} \
   CONFIG.PSU__SD1_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__SD1__DATA_TRANSFER_MODE {4Bit} \
   CONFIG.PSU__SD1__GRP_CD__ENABLE {1} \
   CONFIG.PSU__SD1__GRP_CD__IO {MIO 45} \
   CONFIG.PSU__SD1__GRP_POW__ENABLE {0} \
   CONFIG.PSU__SD1__GRP_WP__ENABLE {0} \
   CONFIG.PSU__SD1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__SD1__PERIPHERAL__IO {MIO 46 .. 51} \
   CONFIG.PSU__SD1__RESET__ENABLE {0} \
   CONFIG.PSU__SD1__SLOT_TYPE {SD 2.0} \
   CONFIG.PSU__SPI0_LOOP_SPI1__ENABLE {0} \
   CONFIG.PSU__SPI0__GRP_SS0__ENABLE {0} \
   CONFIG.PSU__SPI0__GRP_SS1__ENABLE {0} \
   CONFIG.PSU__SPI0__GRP_SS2__ENABLE {0} \
   CONFIG.PSU__SPI0__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__SPI1__GRP_SS0__ENABLE {0} \
   CONFIG.PSU__SPI1__GRP_SS1__ENABLE {0} \
   CONFIG.PSU__SPI1__GRP_SS2__ENABLE {0} \
   CONFIG.PSU__SPI1__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__SWDT0__CLOCK__ENABLE {0} \
   CONFIG.PSU__SWDT0__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__SWDT0__PERIPHERAL__IO {NA} \
   CONFIG.PSU__SWDT0__RESET__ENABLE {0} \
   CONFIG.PSU__SWDT1__CLOCK__ENABLE {0} \
   CONFIG.PSU__SWDT1__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__SWDT1__PERIPHERAL__IO {NA} \
   CONFIG.PSU__SWDT1__RESET__ENABLE {0} \
   CONFIG.PSU__TCM0A__POWER__ON {1} \
   CONFIG.PSU__TCM0B__POWER__ON {1} \
   CONFIG.PSU__TCM1A__POWER__ON {1} \
   CONFIG.PSU__TCM1B__POWER__ON {1} \
   CONFIG.PSU__TESTSCAN__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__TRACE_PIPELINE_WIDTH {8} \
   CONFIG.PSU__TRACE__INTERNAL_WIDTH {32} \
   CONFIG.PSU__TRACE__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__TRISTATE__INVERTED {1} \
   CONFIG.PSU__TSU__BUFG_PORT_PAIR {0} \
   CONFIG.PSU__TTC0__CLOCK__ENABLE {0} \
   CONFIG.PSU__TTC0__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__TTC0__PERIPHERAL__IO {NA} \
   CONFIG.PSU__TTC0__WAVEOUT__ENABLE {0} \
   CONFIG.PSU__TTC1__CLOCK__ENABLE {0} \
   CONFIG.PSU__TTC1__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__TTC1__PERIPHERAL__IO {NA} \
   CONFIG.PSU__TTC1__WAVEOUT__ENABLE {0} \
   CONFIG.PSU__TTC2__CLOCK__ENABLE {0} \
   CONFIG.PSU__TTC2__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__TTC2__PERIPHERAL__IO {NA} \
   CONFIG.PSU__TTC2__WAVEOUT__ENABLE {0} \
   CONFIG.PSU__TTC3__CLOCK__ENABLE {0} \
   CONFIG.PSU__TTC3__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__TTC3__PERIPHERAL__IO {NA} \
   CONFIG.PSU__TTC3__WAVEOUT__ENABLE {0} \
   CONFIG.PSU__UART0_LOOP_UART1__ENABLE {0} \
   CONFIG.PSU__UART0__BAUD_RATE {115200} \
   CONFIG.PSU__UART0__MODEM__ENABLE {1} \
   CONFIG.PSU__UART0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__UART0__PERIPHERAL__IO {EMIO} \
   CONFIG.PSU__UART1__BAUD_RATE {115200} \
   CONFIG.PSU__UART1__MODEM__ENABLE {0} \
   CONFIG.PSU__UART1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__UART1__PERIPHERAL__IO {MIO 32 .. 33} \
   CONFIG.PSU__USB0_COHERENCY {0} \
   CONFIG.PSU__USB0__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__USB0__RESET__ENABLE {0} \
   CONFIG.PSU__USB1_COHERENCY {0} \
   CONFIG.PSU__USB1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__USB1__PERIPHERAL__IO {MIO 64 .. 75} \
   CONFIG.PSU__USB1__RESET__ENABLE {0} \
   CONFIG.PSU__USB2_0__EMIO__ENABLE {0} \
   CONFIG.PSU__USB2_1__EMIO__ENABLE {0} \
   CONFIG.PSU__USB3_0__EMIO__ENABLE {0} \
   CONFIG.PSU__USB3_0__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__USB3_1__EMIO__ENABLE {0} \
   CONFIG.PSU__USB3_1__PERIPHERAL__ENABLE {0} \
   CONFIG.PSU__USB__RESET__MODE {Boot Pin} \
   CONFIG.PSU__USB__RESET__POLARITY {Active Low} \
   CONFIG.PSU__USE_DIFF_RW_CLK_GP0 {0} \
   CONFIG.PSU__USE_DIFF_RW_CLK_GP1 {0} \
   CONFIG.PSU__USE_DIFF_RW_CLK_GP2 {0} \
   CONFIG.PSU__USE_DIFF_RW_CLK_GP3 {0} \
   CONFIG.PSU__USE_DIFF_RW_CLK_GP4 {0} \
   CONFIG.PSU__USE_DIFF_RW_CLK_GP5 {0} \
   CONFIG.PSU__USE_DIFF_RW_CLK_GP6 {0} \
   CONFIG.PSU__USE__ADMA {0} \
   CONFIG.PSU__USE__APU_LEGACY_INTERRUPT {0} \
   CONFIG.PSU__USE__AUDIO {0} \
   CONFIG.PSU__USE__CLK {0} \
   CONFIG.PSU__USE__CLK0 {0} \
   CONFIG.PSU__USE__CLK1 {0} \
   CONFIG.PSU__USE__CLK2 {0} \
   CONFIG.PSU__USE__CLK3 {0} \
   CONFIG.PSU__USE__CROSS_TRIGGER {0} \
   CONFIG.PSU__USE__DDR_INTF_REQUESTED {0} \
   CONFIG.PSU__USE__DEBUG__TEST {0} \
   CONFIG.PSU__USE__EVENT_RPU {0} \
   CONFIG.PSU__USE__FABRIC__RST {1} \
   CONFIG.PSU__USE__FTM {0} \
   CONFIG.PSU__USE__GDMA {0} \
   CONFIG.PSU__USE__IRQ {0} \
   CONFIG.PSU__USE__IRQ0 {1} \
   CONFIG.PSU__USE__IRQ1 {0} \
   CONFIG.PSU__USE__M_AXI_GP0 {1} \
   CONFIG.PSU__USE__M_AXI_GP1 {1} \
   CONFIG.PSU__USE__M_AXI_GP2 {1} \
   CONFIG.PSU__USE__PROC_EVENT_BUS {0} \
   CONFIG.PSU__USE__RPU_LEGACY_INTERRUPT {0} \
   CONFIG.PSU__USE__RST0 {0} \
   CONFIG.PSU__USE__RST1 {0} \
   CONFIG.PSU__USE__RST2 {0} \
   CONFIG.PSU__USE__RST3 {0} \
   CONFIG.PSU__USE__RTC {0} \
   CONFIG.PSU__USE__STM {0} \
   CONFIG.PSU__USE__S_AXI_ACE {0} \
   CONFIG.PSU__USE__S_AXI_ACP {0} \
   CONFIG.PSU__USE__S_AXI_GP0 {0} \
   CONFIG.PSU__USE__S_AXI_GP1 {0} \
   CONFIG.PSU__USE__S_AXI_GP2 {0} \
   CONFIG.PSU__USE__S_AXI_GP3 {1} \
   CONFIG.PSU__USE__S_AXI_GP4 {1} \
   CONFIG.PSU__USE__S_AXI_GP5 {0} \
   CONFIG.PSU__USE__S_AXI_GP6 {0} \
   CONFIG.PSU__USE__USB3_0_HUB {0} \
   CONFIG.PSU__USE__USB3_1_HUB {0} \
   CONFIG.PSU__USE__VIDEO {0} \
   CONFIG.PSU__VIDEO_REF_CLK__ENABLE {0} \
   CONFIG.PSU__VIDEO_REF_CLK__FREQMHZ {33.333} \
   CONFIG.QSPI_BOARD_INTERFACE {custom} \
   CONFIG.SATA_BOARD_INTERFACE {custom} \
   CONFIG.SD0_BOARD_INTERFACE {custom} \
   CONFIG.SD1_BOARD_INTERFACE {custom} \
   CONFIG.SPI0_BOARD_INTERFACE {custom} \
   CONFIG.SPI1_BOARD_INTERFACE {custom} \
   CONFIG.SUBPRESET1 {Custom} \
   CONFIG.SUBPRESET2 {Custom} \
   CONFIG.SWDT0_BOARD_INTERFACE {custom} \
   CONFIG.SWDT1_BOARD_INTERFACE {custom} \
   CONFIG.TRACE_BOARD_INTERFACE {custom} \
   CONFIG.TTC0_BOARD_INTERFACE {custom} \
   CONFIG.TTC1_BOARD_INTERFACE {custom} \
   CONFIG.TTC2_BOARD_INTERFACE {custom} \
   CONFIG.TTC3_BOARD_INTERFACE {custom} \
   CONFIG.UART0_BOARD_INTERFACE {custom} \
   CONFIG.UART1_BOARD_INTERFACE {custom} \
   CONFIG.USB0_BOARD_INTERFACE {custom} \
   CONFIG.USB1_BOARD_INTERFACE {custom} \
 ] $zynq_ultra_ps_e_0

  # Create interface connections
  connect_bd_intf_net -intf_net C0_SYS_CLK_0_1 [get_bd_intf_ports PL_DDR4_CLK] [get_bd_intf_pins DDR4/PL_DDR4_CLK]
  connect_bd_intf_net -intf_net CLK_IN_D_0_2 [get_bd_intf_ports HDMI_TX_REFCLK] [get_bd_intf_pins TX_REFCLK/HDMI_TX_REFCLK]
  connect_bd_intf_net -intf_net CLK_IN_D_1_1 [get_bd_intf_ports HDMI_RX_DRU_CLK] [get_bd_intf_pins RX_DRU_CLK/HDMI_RX_DRU_CLK]
  connect_bd_intf_net -intf_net FMC1_1_GPIO [get_bd_intf_ports FMC1_1] [get_bd_intf_pins FMC1/FMC1_1]
  connect_bd_intf_net -intf_net FMC1_FMC1_4 [get_bd_intf_ports FMC1_2] [get_bd_intf_pins FMC1/FMC1_2]
  connect_bd_intf_net -intf_net FMC1_FMC1_5 [get_bd_intf_ports FMC1_3] [get_bd_intf_pins FMC1/FMC1_3]
  connect_bd_intf_net -intf_net FMC1_FMC1_6 [get_bd_intf_ports FMC1_4] [get_bd_intf_pins FMC1/FMC1_4]
  connect_bd_intf_net -intf_net FMC1_FMC1_7 [get_bd_intf_ports FMC1_5] [get_bd_intf_pins FMC1/FMC1_5]
  connect_bd_intf_net -intf_net FMC1_FMC1_8 [get_bd_intf_ports FMC1_6] [get_bd_intf_pins FMC1/FMC1_6]
  connect_bd_intf_net -intf_net FMC2_1_GPIO [get_bd_intf_ports FMC2_1] [get_bd_intf_pins FMC2/FMC2_4]
  connect_bd_intf_net -intf_net FMC2_2_GPIO [get_bd_intf_ports FMC2_2] [get_bd_intf_pins FMC2/FMC2_5]
  connect_bd_intf_net -intf_net FMC2_3_GPIO [get_bd_intf_ports FMC2_3] [get_bd_intf_pins FMC2/FMC2_6]
  connect_bd_intf_net -intf_net FMC2_4_GPIO [get_bd_intf_ports FMC2_4] [get_bd_intf_pins FMC2/FMC2_7]
  connect_bd_intf_net -intf_net FMC2_5_GPIO [get_bd_intf_ports FMC2_5] [get_bd_intf_pins FMC2/FMC2_8]
  connect_bd_intf_net -intf_net FMC2_6_GPIO [get_bd_intf_ports FMC2_6] [get_bd_intf_pins FMC2/FMC2_9]
  connect_bd_intf_net -intf_net GPIO_INOUT_GPIO2_0 [get_bd_intf_ports ETH1_RESET_n] [get_bd_intf_pins GPIO/ETH1_RESET_n]
  connect_bd_intf_net -intf_net PMOD_GPIO [get_bd_intf_ports PMOD1] [get_bd_intf_pins GPIO/PMOD1]
  connect_bd_intf_net -intf_net PMOD_GPIO2 [get_bd_intf_ports PMOD2] [get_bd_intf_pins GPIO/PMOD2]
  connect_bd_intf_net -intf_net SYSMON_ETH1_RST_GPIO [get_bd_intf_ports SYSMON] [get_bd_intf_pins GPIO/SYSMON]
  connect_bd_intf_net -intf_net S_AXI1_1 [get_bd_intf_pins FMC1/S_AXI1] [get_bd_intf_pins axi_interconnect_0/M04_AXI]
  connect_bd_intf_net -intf_net S_AXI1_2 [get_bd_intf_pins FMC2/S_AXI1] [get_bd_intf_pins axi_interconnect_0/M07_AXI]
  connect_bd_intf_net -intf_net S_AXI2_1 [get_bd_intf_pins FMC1/S_AXI2] [get_bd_intf_pins axi_interconnect_0/M05_AXI]
  connect_bd_intf_net -intf_net S_AXI2_2 [get_bd_intf_pins FMC2/S_AXI2] [get_bd_intf_pins axi_interconnect_0/M08_AXI]
  connect_bd_intf_net -intf_net S_AXI_1 [get_bd_intf_pins FMC1/S_AXI] [get_bd_intf_pins axi_interconnect_0/M03_AXI]
  connect_bd_intf_net -intf_net S_AXI_2 [get_bd_intf_pins FMC2/S_AXI] [get_bd_intf_pins axi_interconnect_0/M06_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins axi_uartlite_0/S_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins GPIO/S_AXI1] [get_bd_intf_pins axi_interconnect_0/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins GPIO/S_AXI] [get_bd_intf_pins axi_interconnect_0/M02_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M09_AXI [get_bd_intf_pins HDMI_TX/S_AXI_CPU_IN] [get_bd_intf_pins axi_interconnect_0/M09_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M10_AXI [get_bd_intf_pins HDMI_RX/S_AXI_CPU_IN] [get_bd_intf_pins axi_interconnect_0/M10_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M11_AXI [get_bd_intf_pins HDMI_RX/s_axi_ctrl1] [get_bd_intf_pins axi_interconnect_0/M11_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M12_AXI [get_bd_intf_pins axi_interconnect_0/M12_AXI] [get_bd_intf_pins vid_phy_controller_0/vid_phy_axi4lite]
  connect_bd_intf_net -intf_net axi_interconnect_hp1_M00_AXI [get_bd_intf_pins HDMI_TX/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP1_FPD]
  connect_bd_intf_net -intf_net axi_interconnect_hp2_M00_AXI [get_bd_intf_pins HDMI_RX/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP2_FPD]
  connect_bd_intf_net -intf_net axi_uartlite_0_UART [get_bd_intf_ports UART] [get_bd_intf_pins axi_uartlite_0/UART]
  connect_bd_intf_net -intf_net ddr4_0_C0_DDR4 [get_bd_intf_ports PL_DDR4] [get_bd_intf_pins DDR4/PL_DDR4]
  connect_bd_intf_net -intf_net gmii_to_rgmii_0_MDIO_PHY [get_bd_intf_ports ETH1_MDIO] [get_bd_intf_pins gmii_to_rgmii_0/MDIO_PHY]
  connect_bd_intf_net -intf_net gmii_to_rgmii_0_RGMII [get_bd_intf_ports ETH1_RGMII] [get_bd_intf_pins gmii_to_rgmii_0/RGMII]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins HDMI_RX/s_axi_CTRL] [get_bd_intf_pins smartconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M01_AXI [get_bd_intf_pins HDMI_TX/s_axi_CTRL] [get_bd_intf_pins smartconnect_0/M01_AXI]
  connect_bd_intf_net -intf_net v_hdmi_rx_ss_0_DDC_OUT [get_bd_intf_ports HDMI_RX_DDC] [get_bd_intf_pins HDMI_RX/HDMI_RX_DDC]
  connect_bd_intf_net -intf_net v_hdmi_tx_ss_0_DDC_OUT [get_bd_intf_ports HDMI_TX_SRC] [get_bd_intf_pins HDMI_TX/HDMI_TX_SRC]
  connect_bd_intf_net -intf_net v_hdmi_tx_ss_0_LINK_DATA0_OUT [get_bd_intf_pins HDMI_TX/LINK_DATA0_OUT] [get_bd_intf_pins vid_phy_controller_0/vid_phy_tx_axi4s_ch0]
  connect_bd_intf_net -intf_net v_hdmi_tx_ss_0_LINK_DATA1_OUT [get_bd_intf_pins HDMI_TX/LINK_DATA1_OUT] [get_bd_intf_pins vid_phy_controller_0/vid_phy_tx_axi4s_ch1]
  connect_bd_intf_net -intf_net v_hdmi_tx_ss_0_LINK_DATA2_OUT [get_bd_intf_pins HDMI_TX/LINK_DATA2_OUT] [get_bd_intf_pins vid_phy_controller_0/vid_phy_tx_axi4s_ch2]
  connect_bd_intf_net -intf_net vid_phy_controller_0_vid_phy_rx_axi4s_ch0 [get_bd_intf_pins HDMI_RX/LINK_DATA0_IN] [get_bd_intf_pins vid_phy_controller_0/vid_phy_rx_axi4s_ch0]
  connect_bd_intf_net -intf_net vid_phy_controller_0_vid_phy_rx_axi4s_ch1 [get_bd_intf_pins HDMI_RX/LINK_DATA1_IN] [get_bd_intf_pins vid_phy_controller_0/vid_phy_rx_axi4s_ch1]
  connect_bd_intf_net -intf_net vid_phy_controller_0_vid_phy_rx_axi4s_ch2 [get_bd_intf_pins HDMI_RX/LINK_DATA2_IN] [get_bd_intf_pins vid_phy_controller_0/vid_phy_rx_axi4s_ch2]
  connect_bd_intf_net -intf_net vid_phy_controller_0_vid_phy_status_sb_rx [get_bd_intf_pins HDMI_RX/SB_STATUS_IN] [get_bd_intf_pins vid_phy_controller_0/vid_phy_status_sb_rx]
  connect_bd_intf_net -intf_net vid_phy_controller_0_vid_phy_status_sb_tx [get_bd_intf_pins HDMI_TX/SB_STATUS_IN] [get_bd_intf_pins vid_phy_controller_0/vid_phy_status_sb_tx]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_GMII_ENET1 [get_bd_intf_pins gmii_to_rgmii_0/GMII] [get_bd_intf_pins zynq_ultra_ps_e_0/GMII_ENET1]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_IIC_1 [get_bd_intf_ports HDMI_TX_I2C] [get_bd_intf_pins zynq_ultra_ps_e_0/IIC_1]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_MDIO_ENET1 [get_bd_intf_pins gmii_to_rgmii_0/MDIO_GEM] [get_bd_intf_pins zynq_ultra_ps_e_0/MDIO_ENET1]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_M_AXI_HPM0_FPD [get_bd_intf_pins smartconnect_0/S00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM0_FPD]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_M_AXI_HPM0_LPD [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM0_LPD]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_M_AXI_HPM1_FPD [get_bd_intf_pins DDR4/S00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM1_FPD]

  # Create port connections
  connect_bd_net -net BT_HCI_RTS_1 [get_bd_ports BT_HCI_RTS] [get_bd_pins zynq_ultra_ps_e_0/emio_uart0_ctsn]
  connect_bd_net -net BT_HCI_TX_1 [get_bd_ports BT_HCI_TX] [get_bd_pins zynq_ultra_ps_e_0/emio_uart0_rxd]
  connect_bd_net -net DDR4_PL_c0_init_calib_complete [get_bd_ports PL_DDR4_CALIB_LED] [get_bd_pins DDR4/PL_DDR4_CALIB_LED]
  connect_bd_net -net GND_dout [get_bd_pins DDR4/sys_rst] [get_bd_pins GND/dout] [get_bd_pins HDMI_TX/s_axis_video_TDATA]
  connect_bd_net -net GPIO_IN_dout [get_bd_pins GPIO_IN/dout] [get_bd_pins zynq_ultra_ps_e_0/emio_gpio_i]
  connect_bd_net -net GPIO_OUT_BT_EN [get_bd_ports BT_EN] [get_bd_pins GPIO_OUT/BT_EN]
  connect_bd_net -net In1_0_1 [get_bd_ports SWITCHES] [get_bd_pins GPIO_IN/In1]
  connect_bd_net -net In2_0_1 [get_bd_ports PUSHBUTTON] [get_bd_pins GPIO_IN/In2]
  connect_bd_net -net VCC_dout [get_bd_pins RX_DRU_CLK/BUFG_GT_CE] [get_bd_pins TX_REFCLK/BUFG_GT_CE] [get_bd_pins VCC/dout]
  connect_bd_net -net WLAN_EN_Dout [get_bd_ports WLAN_EN] [get_bd_pins GPIO_OUT/WLAN_EN]
  connect_bd_net -net axi_uartlite_0_interrupt [get_bd_pins axi_uartlite_0/interrupt] [get_bd_pins irq_concat/In0]
  connect_bd_net -net clk_wiz_0_clk_out1 [get_bd_pins FMC1/s_axi_aclk] [get_bd_pins FMC2/s_axi_aclk] [get_bd_pins GPIO/s_axi_aclk] [get_bd_pins HDMI_RX/aclk_ctrl] [get_bd_pins HDMI_TX/s_axis_audio_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/M02_ACLK] [get_bd_pins axi_interconnect_0/M03_ACLK] [get_bd_pins axi_interconnect_0/M04_ACLK] [get_bd_pins axi_interconnect_0/M05_ACLK] [get_bd_pins axi_interconnect_0/M06_ACLK] [get_bd_pins axi_interconnect_0/M07_ACLK] [get_bd_pins axi_interconnect_0/M08_ACLK] [get_bd_pins axi_interconnect_0/M09_ACLK] [get_bd_pins axi_interconnect_0/M10_ACLK] [get_bd_pins axi_interconnect_0/M11_ACLK] [get_bd_pins axi_interconnect_0/M12_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_uartlite_0/s_axi_aclk] [get_bd_pins clk_wiz_0/clk_out1] [get_bd_pins proc_sys_reset_0/slowest_sync_clk] [get_bd_pins vid_phy_controller_0/drpclk] [get_bd_pins vid_phy_controller_0/vid_phy_axi4lite_aclk] [get_bd_pins vid_phy_controller_0/vid_phy_sb_aclk] [get_bd_pins zynq_ultra_ps_e_0/maxihpm0_lpd_aclk]
  connect_bd_net -net clk_wiz_0_clk_out3 [get_bd_pins HDMI_RX/ACLK] [get_bd_pins HDMI_TX/ACLK] [get_bd_pins clk_wiz_0/clk_out2] [get_bd_pins rst_clk_wiz_0_299M/slowest_sync_clk] [get_bd_pins smartconnect_0/aclk] [get_bd_pins zynq_ultra_ps_e_0/maxihpm0_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp1_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp2_fpd_aclk]
  connect_bd_net -net clk_wiz_0_clk_out4 [get_bd_pins clk_wiz_0/clk_out3] [get_bd_pins gmii_to_rgmii_0/clkin]
  connect_bd_net -net clk_wiz_0_locked [get_bd_pins clk_wiz_0/locked] [get_bd_pins proc_sys_reset_0/dcm_locked] [get_bd_pins rst_clk_wiz_0_299M/dcm_locked]
  connect_bd_net -net ddr4_0_c0_ddr4_ui_clk [get_bd_pins DDR4/slowest_sync_clk] [get_bd_pins zynq_ultra_ps_e_0/maxihpm1_fpd_aclk]
  connect_bd_net -net hpd_0_1 [get_bd_ports HDMI_TX_HPD] [get_bd_pins HDMI_TX/HDMI_TX_HPD]
  connect_bd_net -net mgtrefclk0_pad_n_in_0_1 [get_bd_ports HDMI_RX_CLK_N] [get_bd_pins vid_phy_controller_0/mgtrefclk0_pad_n_in]
  connect_bd_net -net mgtrefclk0_pad_p_in_0_1 [get_bd_ports HDMI_RX_CLK_P] [get_bd_pins vid_phy_controller_0/mgtrefclk0_pad_p_in]
  connect_bd_net -net phy_rxn_in_0_1 [get_bd_ports HDMI_RX_DATA_N] [get_bd_pins vid_phy_controller_0/phy_rxn_in]
  connect_bd_net -net phy_rxp_in_0_1 [get_bd_ports HDMI_RX_DATA_P] [get_bd_pins vid_phy_controller_0/phy_rxp_in]
  connect_bd_net -net proc_sys_reset_0_interconnect_aresetn [get_bd_pins HDMI_RX/ARESETN] [get_bd_pins HDMI_TX/ARESETN] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins proc_sys_reset_0/interconnect_aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins FMC1/s_axi_aresetn] [get_bd_pins FMC2/s_axi_aresetn] [get_bd_pins GPIO/s_axi_aresetn] [get_bd_pins HDMI_RX/S00_ARESETN] [get_bd_pins HDMI_TX/S00_ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/M02_ARESETN] [get_bd_pins axi_interconnect_0/M03_ARESETN] [get_bd_pins axi_interconnect_0/M04_ARESETN] [get_bd_pins axi_interconnect_0/M05_ARESETN] [get_bd_pins axi_interconnect_0/M06_ARESETN] [get_bd_pins axi_interconnect_0/M07_ARESETN] [get_bd_pins axi_interconnect_0/M08_ARESETN] [get_bd_pins axi_interconnect_0/M09_ARESETN] [get_bd_pins axi_interconnect_0/M10_ARESETN] [get_bd_pins axi_interconnect_0/M11_ARESETN] [get_bd_pins axi_interconnect_0/M12_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_uartlite_0/s_axi_aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn] [get_bd_pins vid_phy_controller_0/vid_phy_axi4lite_aresetn] [get_bd_pins vid_phy_controller_0/vid_phy_sb_aresetn]
  connect_bd_net -net proc_sys_reset_0_peripheral_reset [get_bd_pins gmii_to_rgmii_0/rx_reset] [get_bd_pins gmii_to_rgmii_0/tx_reset] [get_bd_pins proc_sys_reset_0/peripheral_reset]
  connect_bd_net -net rst_clk_wiz_0_299M_interconnect_aresetn [get_bd_pins rst_clk_wiz_0_299M/interconnect_aresetn] [get_bd_pins smartconnect_0/aresetn]
  connect_bd_net -net util_ds_buf_0_BUFG_GT_O [get_bd_pins TX_REFCLK/BUFG_GT_O] [get_bd_pins vid_phy_controller_0/gtsouthrefclk0_odiv2_in]
  connect_bd_net -net util_ds_buf_1_BUFG_GT_O [get_bd_pins RX_DRU_CLK/BUFG_GT_O] [get_bd_pins vid_phy_controller_0/gtsouthrefclk1_odiv2_in]
  connect_bd_net -net util_ds_buf_1_IBUF_OUT [get_bd_pins TX_REFCLK/IBUF_OUT] [get_bd_pins vid_phy_controller_0/gtsouthrefclk0_in]
  connect_bd_net -net util_ds_buf_2_IBUF_OUT [get_bd_pins RX_DRU_CLK/IBUF_OUT] [get_bd_pins vid_phy_controller_0/gtsouthrefclk10_in] [get_bd_pins vid_phy_controller_0/gtsouthrefclk11_in] [get_bd_pins vid_phy_controller_0/gtsouthrefclk1_in]
  connect_bd_net -net v_frmbuf_wr_0_interrupt [get_bd_pins HDMI_RX/interrupt] [get_bd_pins irq_concat/In5]
  connect_bd_net -net v_hdmi_rx_ss_0_irq [get_bd_pins HDMI_RX/irq] [get_bd_pins irq_concat/In4]
  connect_bd_net -net v_hdmi_tx_ss_0_irq [get_bd_pins HDMI_TX/irq] [get_bd_pins irq_concat/In2]
  connect_bd_net -net v_mix_0_interrupt [get_bd_pins HDMI_TX/interrupt] [get_bd_pins irq_concat/In1]
  connect_bd_net -net vid_phy_controller_0_irq [get_bd_pins irq_concat/In3] [get_bd_pins vid_phy_controller_0/irq]
  connect_bd_net -net vid_phy_controller_0_phy_txn_out [get_bd_ports HDMI_TXN] [get_bd_pins vid_phy_controller_0/phy_txn_out]
  connect_bd_net -net vid_phy_controller_0_phy_txp_out [get_bd_ports HDMI_TXP] [get_bd_pins vid_phy_controller_0/phy_txp_out]
  connect_bd_net -net vid_phy_controller_0_rx_video_clk [get_bd_pins HDMI_RX/video_clk] [get_bd_pins vid_phy_controller_0/rx_video_clk]
  connect_bd_net -net vid_phy_controller_0_rxoutclk [get_bd_pins HDMI_RX/link_clk] [get_bd_pins vid_phy_controller_0/rxoutclk] [get_bd_pins vid_phy_controller_0/vid_phy_rx_axi4s_aclk]
  connect_bd_net -net vid_phy_controller_0_tx_tmds_clk_n [get_bd_ports HDMI_TX_CLKN] [get_bd_pins vid_phy_controller_0/tx_tmds_clk_n]
  connect_bd_net -net vid_phy_controller_0_tx_tmds_clk_p [get_bd_ports HDMI_TX_CLKP] [get_bd_pins vid_phy_controller_0/tx_tmds_clk_p]
  connect_bd_net -net vid_phy_controller_0_tx_video_clk [get_bd_pins HDMI_TX/video_clk] [get_bd_pins vid_phy_controller_0/tx_video_clk]
  connect_bd_net -net vid_phy_controller_0_txoutclk [get_bd_pins HDMI_TX/link_clk] [get_bd_pins vid_phy_controller_0/txoutclk] [get_bd_pins vid_phy_controller_0/vid_phy_tx_axi4s_aclk]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins irq_concat/dout] [get_bd_pins zynq_ultra_ps_e_0/pl_ps_irq0]
  connect_bd_net -net xlslice_0_Dout3 [get_bd_ports LEDS] [get_bd_pins GPIO_OUT/LEDS]
  connect_bd_net -net xlslice_0_Dout4 [get_bd_pins TX_REFCLK_RDY/Dout] [get_bd_pins vid_phy_controller_0/tx_refclk_rdy]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_gpio_o [get_bd_pins GPIO_OUT/Din] [get_bd_pins HDMI_RX/Din] [get_bd_pins HDMI_TX/Din] [get_bd_pins TX_REFCLK_RDY/Din] [get_bd_pins zynq_ultra_ps_e_0/emio_gpio_o]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_uart0_rtsn [get_bd_ports BT_HCI_CTS] [get_bd_pins zynq_ultra_ps_e_0/emio_uart0_rtsn]
  connect_bd_net -net zynq_ultra_ps_e_0_emio_uart0_txd [get_bd_ports BT_HCI_RX] [get_bd_pins zynq_ultra_ps_e_0/emio_uart0_txd]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_clk0 [get_bd_pins clk_wiz_0/clk_in1] [get_bd_pins zynq_ultra_ps_e_0/pl_clk0]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_resetn0 [get_bd_pins clk_wiz_0/resetn] [get_bd_pins proc_sys_reset_0/ext_reset_in] [get_bd_pins rst_clk_wiz_0_299M/ext_reset_in] [get_bd_pins zynq_ultra_ps_e_0/pl_resetn0]

  # Create address segments
  create_bd_addr_seg -range 0x000200000000 -offset 0x004800000000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs DDR4/DDR4_PL/C0_DDR4_MEMORY_MAP/C0_DDR4_ADDRESS_BLOCK] SEG_DDR4_PL_C0_DDR4_ADDRESS_BLOCK
  create_bd_addr_seg -range 0x00001000 -offset 0x80003000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs FMC1/FMC1_1/S_AXI/Reg] SEG_FMC1_1_Reg
  create_bd_addr_seg -range 0x00001000 -offset 0x80005000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs FMC1/FMC1_2/S_AXI/Reg] SEG_FMC1_2_Reg
  create_bd_addr_seg -range 0x00001000 -offset 0x80007000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs FMC1/FMC1_3/S_AXI/Reg] SEG_FMC1_3_Reg
  create_bd_addr_seg -range 0x00001000 -offset 0x8000D000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs FMC2/FMC2_1/S_AXI/Reg] SEG_FMC2_1_Reg
  create_bd_addr_seg -range 0x00001000 -offset 0x8000E000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs FMC2/FMC2_2/S_AXI/Reg] SEG_FMC2_2_Reg
  create_bd_addr_seg -range 0x00001000 -offset 0x8000F000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs FMC2/FMC2_3/S_AXI/Reg] SEG_FMC2_3_Reg
  create_bd_addr_seg -range 0x00001000 -offset 0x80002000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs GPIO/PMOD/S_AXI/Reg] SEG_PMOD1_Reg
  create_bd_addr_seg -range 0x00001000 -offset 0x80000000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs GPIO/GPIO1/S_AXI/Reg] SEG_SYSMON_ETH1_RST_Reg
  create_bd_addr_seg -range 0x00001000 -offset 0x80001000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] SEG_axi_uartlite_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0xA0000000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs HDMI_RX/v_frmbuf_wr_0/s_axi_CTRL/Reg] SEG_v_frmbuf_wr_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x80060000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs HDMI_RX/v_hdmi_rx_ss_0/S_AXI_CPU_IN/Reg] SEG_v_hdmi_rx_ss_0_Reg
  create_bd_addr_seg -range 0x00020000 -offset 0x80040000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs HDMI_TX/v_hdmi_tx_ss_0/S_AXI_CPU_IN/Reg] SEG_v_hdmi_tx_ss_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0xA0010000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs HDMI_TX/v_mix_0/s_axi_CTRL/Reg] SEG_v_mix_0_Reg
  create_bd_addr_seg -range 0x00040000 -offset 0x80080000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs HDMI_RX/v_proc_ss_0/s_axi_ctrl/Reg] SEG_v_proc_ss_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x80030000 [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs vid_phy_controller_0/vid_phy_axi4lite/Reg] SEG_vid_phy_controller_0_Reg
  create_bd_addr_seg -range 0x80000000 -offset 0x00000000 [get_bd_addr_spaces HDMI_RX/v_frmbuf_wr_0/Data_m_axi_mm_video] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_DDR_LOW] SEG_zynq_ultra_ps_e_0_HP2_DDR_LOW
  create_bd_addr_seg -range 0x01000000 -offset 0xFF000000 [get_bd_addr_spaces HDMI_RX/v_frmbuf_wr_0/Data_m_axi_mm_video] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_LPS_OCM] SEG_zynq_ultra_ps_e_0_HP2_LPS_OCM
  create_bd_addr_seg -range 0x10000000 -offset 0xE0000000 [get_bd_addr_spaces HDMI_RX/v_frmbuf_wr_0/Data_m_axi_mm_video] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_PCIE_LOW] SEG_zynq_ultra_ps_e_0_HP2_PCIE_LOW
  create_bd_addr_seg -range 0x20000000 -offset 0xC0000000 [get_bd_addr_spaces HDMI_RX/v_frmbuf_wr_0/Data_m_axi_mm_video] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_QSPI] SEG_zynq_ultra_ps_e_0_HP2_QSPI
  create_bd_addr_seg -range 0x80000000 -offset 0x00000000 [get_bd_addr_spaces HDMI_TX/v_mix_0/Data_m_axi_mm_video1] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_DDR_LOW] SEG_zynq_ultra_ps_e_0_HP1_DDR_LOW
  create_bd_addr_seg -range 0x80000000 -offset 0x00000000 [get_bd_addr_spaces HDMI_TX/v_mix_0/Data_m_axi_mm_video2] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_DDR_LOW] SEG_zynq_ultra_ps_e_0_HP1_DDR_LOW
  create_bd_addr_seg -range 0x80000000 -offset 0x00000000 [get_bd_addr_spaces HDMI_TX/v_mix_0/Data_m_axi_mm_video3] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_DDR_LOW] SEG_zynq_ultra_ps_e_0_HP1_DDR_LOW
  create_bd_addr_seg -range 0x80000000 -offset 0x00000000 [get_bd_addr_spaces HDMI_TX/v_mix_0/Data_m_axi_mm_video4] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_DDR_LOW] SEG_zynq_ultra_ps_e_0_HP1_DDR_LOW
  create_bd_addr_seg -range 0x01000000 -offset 0xFF000000 [get_bd_addr_spaces HDMI_TX/v_mix_0/Data_m_axi_mm_video1] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_LPS_OCM] SEG_zynq_ultra_ps_e_0_HP1_LPS_OCM
  create_bd_addr_seg -range 0x01000000 -offset 0xFF000000 [get_bd_addr_spaces HDMI_TX/v_mix_0/Data_m_axi_mm_video2] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_LPS_OCM] SEG_zynq_ultra_ps_e_0_HP1_LPS_OCM
  create_bd_addr_seg -range 0x01000000 -offset 0xFF000000 [get_bd_addr_spaces HDMI_TX/v_mix_0/Data_m_axi_mm_video3] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_LPS_OCM] SEG_zynq_ultra_ps_e_0_HP1_LPS_OCM
  create_bd_addr_seg -range 0x01000000 -offset 0xFF000000 [get_bd_addr_spaces HDMI_TX/v_mix_0/Data_m_axi_mm_video4] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_LPS_OCM] SEG_zynq_ultra_ps_e_0_HP1_LPS_OCM
  create_bd_addr_seg -range 0x10000000 -offset 0xE0000000 [get_bd_addr_spaces HDMI_TX/v_mix_0/Data_m_axi_mm_video1] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_PCIE_LOW] SEG_zynq_ultra_ps_e_0_HP1_PCIE_LOW
  create_bd_addr_seg -range 0x10000000 -offset 0xE0000000 [get_bd_addr_spaces HDMI_TX/v_mix_0/Data_m_axi_mm_video2] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_PCIE_LOW] SEG_zynq_ultra_ps_e_0_HP1_PCIE_LOW
  create_bd_addr_seg -range 0x10000000 -offset 0xE0000000 [get_bd_addr_spaces HDMI_TX/v_mix_0/Data_m_axi_mm_video3] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_PCIE_LOW] SEG_zynq_ultra_ps_e_0_HP1_PCIE_LOW
  create_bd_addr_seg -range 0x10000000 -offset 0xE0000000 [get_bd_addr_spaces HDMI_TX/v_mix_0/Data_m_axi_mm_video4] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_PCIE_LOW] SEG_zynq_ultra_ps_e_0_HP1_PCIE_LOW
  create_bd_addr_seg -range 0x20000000 -offset 0xC0000000 [get_bd_addr_spaces HDMI_TX/v_mix_0/Data_m_axi_mm_video1] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_QSPI] SEG_zynq_ultra_ps_e_0_HP1_QSPI
  create_bd_addr_seg -range 0x20000000 -offset 0xC0000000 [get_bd_addr_spaces HDMI_TX/v_mix_0/Data_m_axi_mm_video2] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_QSPI] SEG_zynq_ultra_ps_e_0_HP1_QSPI
  create_bd_addr_seg -range 0x20000000 -offset 0xC0000000 [get_bd_addr_spaces HDMI_TX/v_mix_0/Data_m_axi_mm_video3] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_QSPI] SEG_zynq_ultra_ps_e_0_HP1_QSPI
  create_bd_addr_seg -range 0x20000000 -offset 0xC0000000 [get_bd_addr_spaces HDMI_TX/v_mix_0/Data_m_axi_mm_video4] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_QSPI] SEG_zynq_ultra_ps_e_0_HP1_QSPI


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


