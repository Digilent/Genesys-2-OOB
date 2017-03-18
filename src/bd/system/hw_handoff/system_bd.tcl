
################################################################
# This is a generated script based on design: system
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
set scripts_vivado_version 2016.4
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
# source system_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7k325tffg900-2
   set_property BOARD_PART digilentinc.com:genesys2:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
set design_name system

# This script was generated for a remote BD. To create a non-remote design,
# change the variable <run_remote_bd_flow> to <0>.

set run_remote_bd_flow 1
if { $run_remote_bd_flow == 1 } {
  # Set the reference directory for source file relative paths (by default 
  # the value is script directory path)
  set origin_dir ./bd

  # Use origin directory path location variable, if specified in the tcl shell
  if { [info exists ::origin_dir_loc] } {
     set origin_dir $::origin_dir_loc
  }

  set str_bd_folder [file normalize ${origin_dir}]
  set str_bd_filepath ${str_bd_folder}/${design_name}/${design_name}.bd

  # Check if remote design exists on disk
  if { [file exists $str_bd_filepath ] == 1 } {
     catch {common::send_msg_id "BD_TCL-110" "ERROR" "The remote BD file path <$str_bd_filepath> already exists!"}
     common::send_msg_id "BD_TCL-008" "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0>."
     common::send_msg_id "BD_TCL-009" "INFO" "Also make sure there is no design <$design_name> existing in your current project."

     return 1
  }

  # Check if design exists in memory
  set list_existing_designs [get_bd_designs -quiet $design_name]
  if { $list_existing_designs ne "" } {
     catch {common::send_msg_id "BD_TCL-111" "ERROR" "The design <$design_name> already exists in this project! Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_msg_id "BD_TCL-010" "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Check if design exists on disk within project
  set list_existing_designs [get_files */${design_name}.bd]
  if { $list_existing_designs ne "" } {
     catch {common::send_msg_id "BD_TCL-112" "ERROR" "The design <$design_name> already exists in this project at location:
    $list_existing_designs"}
     catch {common::send_msg_id "BD_TCL-113" "ERROR" "Will not create the remote BD <$design_name> at the folder <$str_bd_folder>."}

     common::send_msg_id "BD_TCL-011" "INFO" "To create a non-remote BD, change the variable <run_remote_bd_flow> to <0> or please set a different value to variable <design_name>."

     return 1
  }

  # Now can create the remote BD
  # NOTE - usage of <-dir> will create <$str_bd_folder/$design_name/$design_name.bd>
  create_bd_design -dir $str_bd_folder $design_name
} else {

  # Create regular design
  if { [catch {create_bd_design $design_name} errmsg] } {
     common::send_msg_id "BD_TCL-012" "INFO" "Please set a different value to variable <design_name>."

     return 1
  }
}

current_bd_design $design_name


##################################################################
# MIG PRJ FILE TCL PROCs
##################################################################

proc write_mig_file_system_mig_7series_0_0 { str_mig_prj_filepath } {

   set mig_prj_file [open $str_mig_prj_filepath  w+]

   puts $mig_prj_file {<?xml version='1.0' encoding='UTF-8'?>}
   puts $mig_prj_file {<!-- IMPORTANT: This is an internal file that has been generated by the MIG software. Any direct editing or changes made to this file may result in unpredictable behavior or data corruption. It is strongly advised that users do not edit the contents of this file. Re-run the MIG GUI with the required settings if any of the options provided below need to be altered. -->}
   puts $mig_prj_file {<Project NoOfControllers="1" >}
   puts $mig_prj_file {    <ModuleName>system_mig_7series_0_0</ModuleName>}
   puts $mig_prj_file {    <dci_inouts_inputs>1</dci_inouts_inputs>}
   puts $mig_prj_file {    <dci_inputs>1</dci_inputs>}
   puts $mig_prj_file {    <Debug_En>OFF</Debug_En>}
   puts $mig_prj_file {    <DataDepth_En>1024</DataDepth_En>}
   puts $mig_prj_file {    <LowPower_En>ON</LowPower_En>}
   puts $mig_prj_file {    <XADC_En>Disabled</XADC_En>}
   puts $mig_prj_file {    <TargetFPGA>xc7k325t-ffg900/-2</TargetFPGA>}
   puts $mig_prj_file {    <Version>2.3</Version>}
   puts $mig_prj_file {    <SystemClock>Differential</SystemClock>}
   puts $mig_prj_file {    <ReferenceClock>Use System Clock</ReferenceClock>}
   puts $mig_prj_file {    <SysResetPolarity>ACTIVE LOW</SysResetPolarity>}
   puts $mig_prj_file {    <BankSelectionFlag>FALSE</BankSelectionFlag>}
   puts $mig_prj_file {    <InternalVref>0</InternalVref>}
   puts $mig_prj_file {    <dci_hr_inouts_inputs>50 Ohms</dci_hr_inouts_inputs>}
   puts $mig_prj_file {    <dci_cascade>0</dci_cascade>}
   puts $mig_prj_file {    <Controller number="0" >}
   puts $mig_prj_file {        <MemoryDevice>DDR3_SDRAM/Components/MT41J256m16XX-107</MemoryDevice>}
   puts $mig_prj_file {        <TimePeriod>2500</TimePeriod>}
   puts $mig_prj_file {        <VccAuxIO>1.8V</VccAuxIO>}
   puts $mig_prj_file {        <PHYRatio>4:1</PHYRatio>}
   puts $mig_prj_file {        <InputClkFreq>200</InputClkFreq>}
   puts $mig_prj_file {        <UIExtraClocks>1</UIExtraClocks>}
   puts $mig_prj_file {        <MMCM_VCO>800</MMCM_VCO>}
   puts $mig_prj_file {        <MMCMClkOut0> 4.000</MMCMClkOut0>}
   puts $mig_prj_file {        <MMCMClkOut1>1</MMCMClkOut1>}
   puts $mig_prj_file {        <MMCMClkOut2>1</MMCMClkOut2>}
   puts $mig_prj_file {        <MMCMClkOut3>1</MMCMClkOut3>}
   puts $mig_prj_file {        <MMCMClkOut4>1</MMCMClkOut4>}
   puts $mig_prj_file {        <DataWidth>32</DataWidth>}
   puts $mig_prj_file {        <DeepMemory>1</DeepMemory>}
   puts $mig_prj_file {        <DataMask>1</DataMask>}
   puts $mig_prj_file {        <ECC>Disabled</ECC>}
   puts $mig_prj_file {        <Ordering>Normal</Ordering>}
   puts $mig_prj_file {        <CustomPart>FALSE</CustomPart>}
   puts $mig_prj_file {        <NewPartName></NewPartName>}
   puts $mig_prj_file {        <RowAddress>15</RowAddress>}
   puts $mig_prj_file {        <ColAddress>10</ColAddress>}
   puts $mig_prj_file {        <BankAddress>3</BankAddress>}
   puts $mig_prj_file {        <MemoryVoltage>1.5V</MemoryVoltage>}
   puts $mig_prj_file {        <C0_MEM_SIZE>1073741824</C0_MEM_SIZE>}
   puts $mig_prj_file {        <UserMemoryAddressMap>BANK_ROW_COLUMN</UserMemoryAddressMap>}
   puts $mig_prj_file {        <PinSelection>}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AC12" SLEW="" name="ddr3_addr[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AB8" SLEW="" name="ddr3_addr[10]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AA8" SLEW="" name="ddr3_addr[11]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AB12" SLEW="" name="ddr3_addr[12]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AA12" SLEW="" name="ddr3_addr[13]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AH9" SLEW="" name="ddr3_addr[14]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AE8" SLEW="" name="ddr3_addr[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AD8" SLEW="" name="ddr3_addr[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AC10" SLEW="" name="ddr3_addr[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AD9" SLEW="" name="ddr3_addr[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AA13" SLEW="" name="ddr3_addr[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AA10" SLEW="" name="ddr3_addr[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AA11" SLEW="" name="ddr3_addr[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="Y10" SLEW="" name="ddr3_addr[8]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="Y11" SLEW="" name="ddr3_addr[9]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AE9" SLEW="" name="ddr3_ba[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AB10" SLEW="" name="ddr3_ba[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AC11" SLEW="" name="ddr3_ba[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AF11" SLEW="" name="ddr3_cas_n" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15" PADName="AC9" SLEW="" name="ddr3_ck_n[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15" PADName="AB9" SLEW="" name="ddr3_ck_p[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AJ9" SLEW="" name="ddr3_cke[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AH12" SLEW="" name="ddr3_cs_n[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AD4" SLEW="" name="ddr3_dm[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AF3" SLEW="" name="ddr3_dm[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AH4" SLEW="" name="ddr3_dm[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AF8" SLEW="" name="ddr3_dm[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AD3" SLEW="" name="ddr3_dq[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AF1" SLEW="" name="ddr3_dq[10]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AE4" SLEW="" name="ddr3_dq[11]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AE3" SLEW="" name="ddr3_dq[12]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AE5" SLEW="" name="ddr3_dq[13]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AF5" SLEW="" name="ddr3_dq[14]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AF6" SLEW="" name="ddr3_dq[15]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AJ4" SLEW="" name="ddr3_dq[16]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AH6" SLEW="" name="ddr3_dq[17]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AH5" SLEW="" name="ddr3_dq[18]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AH2" SLEW="" name="ddr3_dq[19]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AC2" SLEW="" name="ddr3_dq[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AJ2" SLEW="" name="ddr3_dq[20]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AJ1" SLEW="" name="ddr3_dq[21]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AK1" SLEW="" name="ddr3_dq[22]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AJ3" SLEW="" name="ddr3_dq[23]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AF7" SLEW="" name="ddr3_dq[24]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AG7" SLEW="" name="ddr3_dq[25]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AJ6" SLEW="" name="ddr3_dq[26]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AK6" SLEW="" name="ddr3_dq[27]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AJ8" SLEW="" name="ddr3_dq[28]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AK8" SLEW="" name="ddr3_dq[29]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AC1" SLEW="" name="ddr3_dq[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AK5" SLEW="" name="ddr3_dq[30]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AK4" SLEW="" name="ddr3_dq[31]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AC5" SLEW="" name="ddr3_dq[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AC4" SLEW="" name="ddr3_dq[4]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AD6" SLEW="" name="ddr3_dq[5]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AE6" SLEW="" name="ddr3_dq[6]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AC7" SLEW="" name="ddr3_dq[7]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AF2" SLEW="" name="ddr3_dq[8]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15_T_DCI" PADName="AE1" SLEW="" name="ddr3_dq[9]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AD1" SLEW="" name="ddr3_dqs_n[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AG3" SLEW="" name="ddr3_dqs_n[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AH1" SLEW="" name="ddr3_dqs_n[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AJ7" SLEW="" name="ddr3_dqs_n[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AD2" SLEW="" name="ddr3_dqs_p[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AG4" SLEW="" name="ddr3_dqs_p[1]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AG2" SLEW="" name="ddr3_dqs_p[2]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AH7" SLEW="" name="ddr3_dqs_p[3]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AK9" SLEW="" name="ddr3_odt[0]" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AE11" SLEW="" name="ddr3_ras_n" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="LVCMOS15" PADName="AG5" SLEW="" name="ddr3_reset_n" IN_TERM="" />}
   puts $mig_prj_file {            <Pin VCCAUX_IO="NORMAL" IOSTANDARD="SSTL15" PADName="AG13" SLEW="" name="ddr3_we_n" IN_TERM="" />}
   puts $mig_prj_file {        </PinSelection>}
   puts $mig_prj_file {        <System_Clock>}
   puts $mig_prj_file {            <Pin PADName="AD12/AD11(CC_P/N)" Bank="33" name="sys_clk_p/n" />}
   puts $mig_prj_file {        </System_Clock>}
   puts $mig_prj_file {        <System_Control>}
   puts $mig_prj_file {            <Pin PADName="No connect" Bank="Select Bank" name="sys_rst" />}
   puts $mig_prj_file {            <Pin PADName="No connect" Bank="Select Bank" name="init_calib_complete" />}
   puts $mig_prj_file {            <Pin PADName="No connect" Bank="Select Bank" name="tg_compare_error" />}
   puts $mig_prj_file {        </System_Control>}
   puts $mig_prj_file {        <TimingParameters>}
   puts $mig_prj_file {            <Parameters twtr="7.5" trrd="5" trefi="7.8" tfaw="35" trtp="7.5" tcke="5" trfc="260" trp="13.91" tras="34" trcd="13.91" />}
   puts $mig_prj_file {        </TimingParameters>}
   puts $mig_prj_file {        <mrBurstLength name="Burst Length" >8 - Fixed</mrBurstLength>}
   puts $mig_prj_file {        <mrBurstType name="Read Burst Type and Length" >Sequential</mrBurstType>}
   puts $mig_prj_file {        <mrCasLatency name="CAS Latency" >6</mrCasLatency>}
   puts $mig_prj_file {        <mrMode name="Mode" >Normal</mrMode>}
   puts $mig_prj_file {        <mrDllReset name="DLL Reset" >No</mrDllReset>}
   puts $mig_prj_file {        <mrPdMode name="DLL control for precharge PD" >Slow Exit</mrPdMode>}
   puts $mig_prj_file {        <emrDllEnable name="DLL Enable" >Enable</emrDllEnable>}
   puts $mig_prj_file {        <emrOutputDriveStrength name="Output Driver Impedance Control" >RZQ/7</emrOutputDriveStrength>}
   puts $mig_prj_file {        <emrMirrorSelection name="Address Mirroring" >Disable</emrMirrorSelection>}
   puts $mig_prj_file {        <emrCSSelection name="Controller Chip Select Pin" >Enable</emrCSSelection>}
   puts $mig_prj_file {        <emrRTT name="RTT (nominal) - On Die Termination (ODT)" >RZQ/6</emrRTT>}
   puts $mig_prj_file {        <emrPosted name="Additive Latency (AL)" >0</emrPosted>}
   puts $mig_prj_file {        <emrOCD name="Write Leveling Enable" >Disabled</emrOCD>}
   puts $mig_prj_file {        <emrDQS name="TDQS enable" >Enabled</emrDQS>}
   puts $mig_prj_file {        <emrRDQS name="Qoff" >Output Buffer Enabled</emrRDQS>}
   puts $mig_prj_file {        <mr2PartialArraySelfRefresh name="Partial-Array Self Refresh" >Full Array</mr2PartialArraySelfRefresh>}
   puts $mig_prj_file {        <mr2CasWriteLatency name="CAS write latency" >5</mr2CasWriteLatency>}
   puts $mig_prj_file {        <mr2AutoSelfRefresh name="Auto Self Refresh" >Enabled</mr2AutoSelfRefresh>}
   puts $mig_prj_file {        <mr2SelfRefreshTempRange name="High Temparature Self Refresh Rate" >Normal</mr2SelfRefreshTempRange>}
   puts $mig_prj_file {        <mr2RTTWR name="RTT_WR - Dynamic On Die Termination (ODT)" >Dynamic ODT off</mr2RTTWR>}
   puts $mig_prj_file {        <PortInterface>AXI</PortInterface>}
   puts $mig_prj_file {        <AXIParameters>}
   puts $mig_prj_file {            <C0_C_RD_WR_ARB_ALGORITHM>RD_PRI_REG</C0_C_RD_WR_ARB_ALGORITHM>}
   puts $mig_prj_file {            <C0_S_AXI_ADDR_WIDTH>30</C0_S_AXI_ADDR_WIDTH>}
   puts $mig_prj_file {            <C0_S_AXI_DATA_WIDTH>256</C0_S_AXI_DATA_WIDTH>}
   puts $mig_prj_file {            <C0_S_AXI_ID_WIDTH>3</C0_S_AXI_ID_WIDTH>}
   puts $mig_prj_file {            <C0_S_AXI_SUPPORTS_NARROW_BURST>0</C0_S_AXI_SUPPORTS_NARROW_BURST>}
   puts $mig_prj_file {        </AXIParameters>}
   puts $mig_prj_file {    </Controller>}
   puts $mig_prj_file {</Project>}

   close $mig_prj_file
}
# End of write_mig_file_system_mig_7series_0_0()



##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: video
proc create_hier_cell_video { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" create_hier_cell_video() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:aximm_rtl:1.0 M_AXI_MM2S
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI_LITE
  create_bd_intf_pin -mode Master -vlnv digilentinc.com:interface:tmds_rtl:1.0 TMDS
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 ctrl1
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 dp_s_axilite

  # Create pins
  create_bd_pin -dir I -type clk OutPixelClk
  create_bd_pin -dir IO PS2_Clk_IO
  create_bd_pin -dir IO PS2_Data_IO
  create_bd_pin -dir I aux_tx_channel_in_n
  create_bd_pin -dir I aux_tx_channel_in_p
  create_bd_pin -dir O aux_tx_channel_out_n
  create_bd_pin -dir O aux_tx_channel_out_p
  create_bd_pin -dir O -type intr axi_int
  create_bd_pin -dir I -from 0 -to 0 -type rst axi_resetn
  create_bd_pin -dir I -type clk lnk_clk_n
  create_bd_pin -dir I -type clk lnk_clk_p
  create_bd_pin -dir O -from 3 -to 0 lnk_tx_lane_n
  create_bd_pin -dir O -from 3 -to 0 lnk_tx_lane_p
  create_bd_pin -dir I -type clk m_axi_mm2s_aclk
  create_bd_pin -dir O mm2s_buffer_empty
  create_bd_pin -dir O -type intr mm2s_introut
  create_bd_pin -dir I tx_hpd
  create_bd_pin -dir O -from 4 -to 0 vga_pBlue
  create_bd_pin -dir O -from 5 -to 0 vga_pGreen
  create_bd_pin -dir O vga_pHSync
  create_bd_pin -dir O -from 4 -to 0 vga_pRed
  create_bd_pin -dir O vga_pVSync

  # Create instance: axi_vdma_0, and set properties
  set axi_vdma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_vdma:6.2 axi_vdma_0 ]
  set_property -dict [ list \
CONFIG.c_enable_debug_all {1} \
CONFIG.c_include_s2mm {0} \
CONFIG.c_m_axi_mm2s_data_width {256} \
CONFIG.c_m_axis_mm2s_tdata_width {24} \
CONFIG.c_mm2s_genlock_mode {0} \
CONFIG.c_mm2s_linebuffer_depth {4096} \
CONFIG.c_mm2s_max_burst_length {2} \
 ] $axi_vdma_0

  # Create instance: displayport_0, and set properties
  set displayport_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:displayport:7.0 displayport_0 ]
  set_property -dict [ list \
CONFIG.Link_Rate {5.4} \
CONFIG.Max_Bits_Per_Color {8} \
CONFIG.Protocol_Selection {DP_1_2} \
 ] $displayport_0

  # Create instance: ps2_mouse_overlay_0, and set properties
  set ps2_mouse_overlay_0 [ create_bd_cell -type ip -vlnv digilentinc.com:ip:ps2_mouse_overlay:1.1 ps2_mouse_overlay_0 ]

  # Create instance: rgb2dpvid_1, and set properties
  set rgb2dpvid_1 [ create_bd_cell -type ip -vlnv digilentinc.com:ip:rgb2dpvid:1.0 rgb2dpvid_1 ]

  # Create instance: rgb2dvi_0, and set properties
  set rgb2dvi_0 [ create_bd_cell -type ip -vlnv digilentinc.com:ip:rgb2dvi:1.3 rgb2dvi_0 ]
  set_property -dict [ list \
CONFIG.kClkPrimitive {MMCM} \
 ] $rgb2dvi_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.kClkPrimitive.VALUE_SRC {DEFAULT} \
 ] $rgb2dvi_0

  # Create instance: rgb2vga_0, and set properties
  set rgb2vga_0 [ create_bd_cell -type ip -vlnv digilentinc.com:ip:rgb2vga:1.0 rgb2vga_0 ]

  # Create instance: v_axi4s_vid_out_0, and set properties
  set v_axi4s_vid_out_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_axi4s_vid_out:4.0 v_axi4s_vid_out_0 ]
  set_property -dict [ list \
CONFIG.C_VTG_MASTER_SLAVE {1} \
 ] $v_axi4s_vid_out_0

  # Create instance: vtg, and set properties
  set vtg [ create_bd_cell -type ip -vlnv xilinx.com:ip:v_tc:6.1 vtg ]
  set_property -dict [ list \
CONFIG.HAS_AXI4_LITE {false} \
CONFIG.VIDEO_MODE {1080p} \
CONFIG.enable_detection {false} \
CONFIG.horizontal_blank_generation {true} \
CONFIG.vertical_blank_generation {true} \
 ] $vtg

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins M_AXI_MM2S] [get_bd_intf_pins axi_vdma_0/M_AXI_MM2S]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins S_AXI_LITE] [get_bd_intf_pins axi_vdma_0/S_AXI_LITE]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins TMDS] [get_bd_intf_pins rgb2dvi_0/TMDS]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins dp_s_axilite] [get_bd_intf_pins displayport_0/dp_s_axilite]
  connect_bd_intf_net -intf_net Conn6 [get_bd_intf_pins ctrl1] [get_bd_intf_pins ps2_mouse_overlay_0/ctrl]
  connect_bd_intf_net -intf_net axi_vdma_0_M_AXIS_MM2S [get_bd_intf_pins axi_vdma_0/M_AXIS_MM2S] [get_bd_intf_pins v_axi4s_vid_out_0/video_in]
  connect_bd_intf_net -intf_net v_axi4s_vid_out_0_vid_io_out [get_bd_intf_pins ps2_mouse_overlay_0/vid_i] [get_bd_intf_pins v_axi4s_vid_out_0/vid_io_out]
  connect_bd_intf_net -intf_net vtg_vtiming_out [get_bd_intf_pins v_axi4s_vid_out_0/vtiming_in] [get_bd_intf_pins vtg/vtiming_out]

  # Create port connections
  connect_bd_net -net Net [get_bd_pins PS2_Clk_IO] [get_bd_pins ps2_mouse_overlay_0/PS2_Clk_IO]
  connect_bd_net -net Net1 [get_bd_pins PS2_Data_IO] [get_bd_pins ps2_mouse_overlay_0/PS2_Data_IO]
  connect_bd_net -net aclk_1 [get_bd_pins OutPixelClk] [get_bd_pins axi_vdma_0/m_axis_mm2s_aclk] [get_bd_pins ps2_mouse_overlay_0/PixelClk] [get_bd_pins rgb2dpvid_1/PixelClk] [get_bd_pins rgb2dvi_0/PixelClk] [get_bd_pins rgb2vga_0/PixelClk] [get_bd_pins v_axi4s_vid_out_0/aclk] [get_bd_pins vtg/clk]
  connect_bd_net -net aux_tx_channel_in_n_1 [get_bd_pins aux_tx_channel_in_n] [get_bd_pins displayport_0/aux_tx_channel_in_n]
  connect_bd_net -net aux_tx_channel_in_p_1 [get_bd_pins aux_tx_channel_in_p] [get_bd_pins displayport_0/aux_tx_channel_in_p]
  connect_bd_net -net axi_resetn_1 [get_bd_pins axi_resetn] [get_bd_pins axi_vdma_0/axi_resetn] [get_bd_pins displayport_0/s_axi_aresetn] [get_bd_pins ps2_mouse_overlay_0/s00_axi_aresetn]
  connect_bd_net -net axi_vdma_0_mm2s_buffer_empty [get_bd_pins mm2s_buffer_empty] [get_bd_pins axi_vdma_0/mm2s_buffer_empty]
  connect_bd_net -net axi_vdma_0_mm2s_introut [get_bd_pins mm2s_introut] [get_bd_pins axi_vdma_0/mm2s_introut]
  connect_bd_net -net displayport_1_aux_tx_channel_out_n [get_bd_pins aux_tx_channel_out_n] [get_bd_pins displayport_0/aux_tx_channel_out_n]
  connect_bd_net -net displayport_1_aux_tx_channel_out_p [get_bd_pins aux_tx_channel_out_p] [get_bd_pins displayport_0/aux_tx_channel_out_p]
  connect_bd_net -net displayport_1_axi_int [get_bd_pins axi_int] [get_bd_pins displayport_0/axi_int]
  connect_bd_net -net displayport_1_lnk_tx_lane_n [get_bd_pins lnk_tx_lane_n] [get_bd_pins displayport_0/lnk_tx_lane_n]
  connect_bd_net -net displayport_1_lnk_tx_lane_p [get_bd_pins lnk_tx_lane_p] [get_bd_pins displayport_0/lnk_tx_lane_p]
  connect_bd_net -net lnk_clk_n_1 [get_bd_pins lnk_clk_n] [get_bd_pins displayport_0/lnk_clk_n]
  connect_bd_net -net lnk_clk_p_1 [get_bd_pins lnk_clk_p] [get_bd_pins displayport_0/lnk_clk_p]
  connect_bd_net -net m_axi_mm2s_aclk_1 [get_bd_pins m_axi_mm2s_aclk] [get_bd_pins axi_vdma_0/m_axi_mm2s_aclk] [get_bd_pins axi_vdma_0/s_axi_lite_aclk] [get_bd_pins displayport_0/s_axi_aclk] [get_bd_pins ps2_mouse_overlay_0/s00_axi_aclk]
  connect_bd_net -net rgb2dpvid_1_pVidClk [get_bd_pins displayport_0/tx_vid_clk] [get_bd_pins rgb2dpvid_1/pVidClk]
  connect_bd_net -net rgb2dpvid_1_pVidEnable [get_bd_pins displayport_0/tx_vid_enable] [get_bd_pins rgb2dpvid_1/pVidEnable]
  connect_bd_net -net rgb2dpvid_1_pVidHSync [get_bd_pins displayport_0/tx_vid_hsync] [get_bd_pins rgb2dpvid_1/pVidHSync]
  connect_bd_net -net rgb2dpvid_1_pVidOddEven [get_bd_pins displayport_0/tx_vid_oddeven] [get_bd_pins rgb2dpvid_1/pVidOddEven]
  connect_bd_net -net rgb2dpvid_1_pVidPixel0 [get_bd_pins displayport_0/tx_vid_pixel0] [get_bd_pins rgb2dpvid_1/pVidPixel0]
  connect_bd_net -net rgb2dpvid_1_pVidRst [get_bd_pins displayport_0/tx_vid_rst] [get_bd_pins rgb2dpvid_1/pVidRst]
  connect_bd_net -net rgb2dpvid_1_pVidVSync [get_bd_pins displayport_0/tx_vid_vsync] [get_bd_pins rgb2dpvid_1/pVidVSync]
  connect_bd_net -net rgb2vga_0_vga_pBlue [get_bd_pins vga_pBlue] [get_bd_pins rgb2vga_0/vga_pBlue]
  connect_bd_net -net rgb2vga_0_vga_pGreen [get_bd_pins vga_pGreen] [get_bd_pins rgb2vga_0/vga_pGreen]
  connect_bd_net -net rgb2vga_0_vga_pHSync [get_bd_pins vga_pHSync] [get_bd_pins rgb2vga_0/vga_pHSync]
  connect_bd_net -net rgb2vga_0_vga_pRed [get_bd_pins vga_pRed] [get_bd_pins rgb2vga_0/vga_pRed]
  connect_bd_net -net rgb2vga_0_vga_pVSync [get_bd_pins vga_pVSync] [get_bd_pins rgb2vga_0/vga_pVSync]
  connect_bd_net -net tx_hpd_1 [get_bd_pins tx_hpd] [get_bd_pins displayport_0/tx_hpd]
  connect_bd_net -net v_axi4s_vid_out_0_vid_active_video [get_bd_pins ps2_mouse_overlay_0/pVde_out] [get_bd_pins rgb2dpvid_1/pVde] [get_bd_pins rgb2dvi_0/vid_pVDE] [get_bd_pins rgb2vga_0/rgb_pVDE]
  connect_bd_net -net v_axi4s_vid_out_0_vid_data [get_bd_pins ps2_mouse_overlay_0/pData_out] [get_bd_pins rgb2dpvid_1/pData] [get_bd_pins rgb2dvi_0/vid_pData] [get_bd_pins rgb2vga_0/rgb_pData]
  connect_bd_net -net v_axi4s_vid_out_0_vid_hsync [get_bd_pins ps2_mouse_overlay_0/pHSync_out] [get_bd_pins rgb2dpvid_1/pHSync] [get_bd_pins rgb2dvi_0/vid_pHSync] [get_bd_pins rgb2vga_0/rgb_pHSync]
  connect_bd_net -net v_axi4s_vid_out_0_vid_vsync [get_bd_pins ps2_mouse_overlay_0/pVSync_out] [get_bd_pins rgb2dpvid_1/pVSync] [get_bd_pins rgb2dvi_0/vid_pVSync] [get_bd_pins rgb2vga_0/rgb_pVSync]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: oled
proc create_hier_cell_oled { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" create_hier_cell_oled() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 AXI_LITE
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  # Create pins
  create_bd_pin -dir O -from 3 -to 0 gpio_io_o
  create_bd_pin -dir O io0_o
  create_bd_pin -dir O -type intr ip2intc_irpt
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -from 0 -to 0 -type rst s_axi_aresetn
  create_bd_pin -dir O sck_o

  # Create instance: axi_gpio_0, and set properties
  set axi_gpio_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 axi_gpio_0 ]
  set_property -dict [ list \
CONFIG.C_GPIO_WIDTH {4} \
 ] $axi_gpio_0

  # Create instance: axi_quad_spi_0, and set properties
  set axi_quad_spi_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 axi_quad_spi_0 ]
  set_property -dict [ list \
CONFIG.C_FIFO_DEPTH {256} \
CONFIG.C_USE_STARTUP {0} \
CONFIG.Multiples16 {6} \
 ] $axi_quad_spi_0

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI] [get_bd_intf_pins axi_gpio_0/S_AXI]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins AXI_LITE] [get_bd_intf_pins axi_quad_spi_0/AXI_LITE]

  # Create port connections
  connect_bd_net -net axi_gpio_0_gpio_io_o [get_bd_pins gpio_io_o] [get_bd_pins axi_gpio_0/gpio_io_i] [get_bd_pins axi_gpio_0/gpio_io_o]
  connect_bd_net -net axi_quad_spi_0_io0_o [get_bd_pins io0_o] [get_bd_pins axi_quad_spi_0/io0_o]
  connect_bd_net -net axi_quad_spi_0_ip2intc_irpt [get_bd_pins ip2intc_irpt] [get_bd_pins axi_quad_spi_0/ip2intc_irpt]
  connect_bd_net -net axi_quad_spi_0_sck_o [get_bd_pins sck_o] [get_bd_pins axi_quad_spi_0/sck_o]
  connect_bd_net -net s_axi_aclk_1 [get_bd_pins s_axi_aclk] [get_bd_pins axi_gpio_0/s_axi_aclk] [get_bd_pins axi_quad_spi_0/ext_spi_clk] [get_bd_pins axi_quad_spi_0/s_axi_aclk]
  connect_bd_net -net s_axi_aresetn_1 [get_bd_pins s_axi_aresetn] [get_bd_pins axi_gpio_0/s_axi_aresetn] [get_bd_pins axi_quad_spi_0/s_axi_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB

  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -from 0 -to 0 -type rst LMB_Rst

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_ECC {0} \
 ] $dlmb_bram_if_cntlr

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property -dict [ list \
CONFIG.C_ECC {0} \
 ] $ilmb_bram_if_cntlr

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.3 lmb_bram ]
  set_property -dict [ list \
CONFIG.Memory_Type {True_Dual_Port_RAM} \
CONFIG.use_bram_block {BRAM_Controller} \
 ] $lmb_bram

  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins DLMB] [get_bd_intf_pins dlmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB] [get_bd_intf_pins dlmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ILMB] [get_bd_intf_pins ilmb_v10/LMB_M]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB] [get_bd_intf_pins ilmb_v10/LMB_Sl_0]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net microblaze_0_Clk [get_bd_pins LMB_Clk] [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] [get_bd_pins dlmb_v10/LMB_Clk] [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk] [get_bd_pins ilmb_v10/LMB_Clk]
  connect_bd_net -net microblaze_0_LMB_Rst [get_bd_pins LMB_Rst] [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] [get_bd_pins dlmb_v10/SYS_Rst] [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst] [get_bd_pins ilmb_v10/SYS_Rst]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: Audio
proc create_hier_cell_Audio { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" create_hier_cell_Audio() - Empty argument(s)!"}
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
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 AXI_L
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 AXI_MM2S
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 AXI_S2MM
  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 IIC
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:aximm_rtl:1.0 S_AXI

  # Create pins
  create_bd_pin -dir O BCLK_O
  create_bd_pin -dir O LRCLK1_O
  create_bd_pin -dir O MCLK_O
  create_bd_pin -dir I SDATA_I
  create_bd_pin -dir O SDATA_O
  create_bd_pin -dir O -from 0 -to 0 dout
  create_bd_pin -dir I -type clk s_axi_aclk
  create_bd_pin -dir I -from 0 -to 0 -type rst s_axi_aresetn

  # Create instance: axi_iic_0, and set properties
  set axi_iic_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 axi_iic_0 ]

  # Create instance: d_axi_i2s_audio_0, and set properties
  set d_axi_i2s_audio_0 [ create_bd_cell -type ip -vlnv digilentinc.com:user:d_axi_i2s_audio:2.0 d_axi_i2s_audio_0 ]
  set_property -dict [ list \
CONFIG.ENABLE_STREAM {true} \
CONFIG.OUTPUT_ONLY_CLK {true} \
 ] $d_axi_i2s_audio_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net Conn1 [get_bd_intf_pins S_AXI] [get_bd_intf_pins axi_iic_0/S_AXI]
  connect_bd_intf_net -intf_net Conn2 [get_bd_intf_pins AXI_L] [get_bd_intf_pins d_axi_i2s_audio_0/AXI_L]
  connect_bd_intf_net -intf_net Conn3 [get_bd_intf_pins AXI_MM2S] [get_bd_intf_pins d_axi_i2s_audio_0/AXI_MM2S]
  connect_bd_intf_net -intf_net Conn4 [get_bd_intf_pins AXI_S2MM] [get_bd_intf_pins d_axi_i2s_audio_0/AXI_S2MM]
  connect_bd_intf_net -intf_net axi_iic_0_IIC [get_bd_intf_pins IIC] [get_bd_intf_pins axi_iic_0/IIC]

  # Create port connections
  connect_bd_net -net SDATA_I_1 [get_bd_pins SDATA_I] [get_bd_pins d_axi_i2s_audio_0/SDATA_I]
  connect_bd_net -net d_axi_i2s_audio_0_BCLK_O [get_bd_pins BCLK_O] [get_bd_pins d_axi_i2s_audio_0/BCLK_O]
  connect_bd_net -net d_axi_i2s_audio_0_LRCLK1_O [get_bd_pins LRCLK1_O] [get_bd_pins d_axi_i2s_audio_0/LRCLK1_O]
  connect_bd_net -net d_axi_i2s_audio_0_MCLK_O [get_bd_pins MCLK_O] [get_bd_pins d_axi_i2s_audio_0/MCLK_O]
  connect_bd_net -net d_axi_i2s_audio_0_SDATA_O [get_bd_pins SDATA_O] [get_bd_pins d_axi_i2s_audio_0/SDATA_O]
  connect_bd_net -net s_axi_aclk_1 [get_bd_pins s_axi_aclk] [get_bd_pins axi_iic_0/s_axi_aclk] [get_bd_pins d_axi_i2s_audio_0/AXI_L_aclk] [get_bd_pins d_axi_i2s_audio_0/CLK_100MHZ_I] [get_bd_pins d_axi_i2s_audio_0/M_AXIS_S2MM_ACLK] [get_bd_pins d_axi_i2s_audio_0/S_AXIS_MM2S_ACLK]
  connect_bd_net -net s_axi_aresetn_1 [get_bd_pins s_axi_aresetn] [get_bd_pins axi_iic_0/s_axi_aresetn] [get_bd_pins d_axi_i2s_audio_0/AXI_L_aresetn] [get_bd_pins d_axi_i2s_audio_0/M_AXIS_S2MM_ARESETN] [get_bd_pins d_axi_i2s_audio_0/S_AXIS_MM2S_ARESETN]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins dout] [get_bd_pins xlconstant_0/dout]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder

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
  set DDR3 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR3 ]
  set aud [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 aud ]
  set hdmi_tx [ create_bd_intf_port -mode Master -vlnv digilentinc.com:interface:tmds_rtl:1.0 hdmi_tx ]
  set mdio_io [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:mdio_io:1.0 mdio_io ]
  set power_iic [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:iic_rtl:1.0 power_iic ]
  set qspi [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:spi_rtl:1.0 qspi ]
  set rgmii [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:rgmii_rtl:1.0 rgmii ]
  set sysclk [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:diff_clock_rtl:1.0 sysclk ]

  # Create ports
  set AUD_ADC_SDATA [ create_bd_port -dir I AUD_ADC_SDATA ]
  set AUD_ADDR_0 [ create_bd_port -dir O -from 0 -to 0 AUD_ADDR_0 ]
  set AUD_ADDR_1 [ create_bd_port -dir O -from 0 -to 0 AUD_ADDR_1 ]
  set AUD_BCLK [ create_bd_port -dir O AUD_BCLK ]
  set AUD_DAC_SDATA [ create_bd_port -dir O AUD_DAC_SDATA ]
  set AUD_LRCLK [ create_bd_port -dir O AUD_LRCLK ]
  set AUD_MCLK [ create_bd_port -dir O AUD_MCLK ]
  set btnc [ create_bd_port -dir I btnc ]
  set btnd [ create_bd_port -dir I btnd ]
  set btnl [ create_bd_port -dir I btnl ]
  set btnr [ create_bd_port -dir I btnr ]
  set btnu [ create_bd_port -dir I btnu ]
  set cpu_resetn [ create_bd_port -dir I -type rst cpu_resetn ]
  set dp_aux_in_n [ create_bd_port -dir I dp_aux_in_n ]
  set dp_aux_in_p [ create_bd_port -dir I dp_aux_in_p ]
  set dp_aux_out_n [ create_bd_port -dir O dp_aux_out_n ]
  set dp_aux_out_p [ create_bd_port -dir O dp_aux_out_p ]
  set dp_hpd [ create_bd_port -dir I dp_hpd ]
  set dp_lnk_clk_n [ create_bd_port -dir I dp_lnk_clk_n ]
  set dp_lnk_clk_p [ create_bd_port -dir I dp_lnk_clk_p ]
  set dp_tx_lane_n [ create_bd_port -dir O -from 3 -to 0 dp_tx_lane_n ]
  set dp_tx_lane_p [ create_bd_port -dir O -from 3 -to 0 dp_tx_lane_p ]
  set eth_intb [ create_bd_port -dir I -type intr eth_intb ]
  set_property -dict [ list \
CONFIG.SENSITIVITY {LEVEL_LOW} \
 ] $eth_intb
  set fan_en [ create_bd_port -dir O fan_en ]
  set hdmi_rx_hpa [ create_bd_port -dir O -from 0 -to 0 hdmi_rx_hpa ]
  set led [ create_bd_port -dir O -from 7 -to 0 led ]
  set oled_gpio [ create_bd_port -dir O -from 3 -to 0 oled_gpio ]
  set oled_sclk [ create_bd_port -dir O oled_sclk ]
  set oled_sdin [ create_bd_port -dir O oled_sdin ]
  set phy_rst_n [ create_bd_port -dir O -type rst phy_rst_n ]
  set ps2_clk [ create_bd_port -dir IO ps2_clk ]
  set ps2_data [ create_bd_port -dir IO ps2_data ]
  set sw [ create_bd_port -dir I -from 7 -to 0 sw ]
  set uart_rxd_out [ create_bd_port -dir O uart_rxd_out ]
  set uart_txd_in [ create_bd_port -dir I uart_txd_in ]
  set vga_b [ create_bd_port -dir O -from 4 -to 0 vga_b ]
  set vga_g [ create_bd_port -dir O -from 5 -to 0 vga_g ]
  set vga_hs [ create_bd_port -dir O vga_hs ]
  set vga_r [ create_bd_port -dir O -from 4 -to 0 vga_r ]
  set vga_vs [ create_bd_port -dir O vga_vs ]

  # Create instance: Audio
  create_hier_cell_Audio [current_bd_instance .] Audio

  # Create instance: axi_dma_0, and set properties
  set axi_dma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0 ]
  set_property -dict [ list \
CONFIG.c_include_sg {0} \
CONFIG.c_mm2s_burst_size {16} \
CONFIG.c_s2mm_burst_size {16} \
CONFIG.c_sg_length_width {23} \
 ] $axi_dma_0

  # Create instance: axi_ethernet_0, and set properties
  set axi_ethernet_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_ethernet:7.0 axi_ethernet_0 ]
  set_property -dict [ list \
CONFIG.PHY_TYPE {RGMII} \
 ] $axi_ethernet_0

  # Create instance: axi_ethernet_0_fifo, and set properties
  set axi_ethernet_0_fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_fifo_mm_s:4.1 axi_ethernet_0_fifo ]
  set_property -dict [ list \
CONFIG.C_AXI4_BASEADDR {0x80001000} \
CONFIG.C_AXI4_HIGHADDR {0x80002FFF} \
CONFIG.C_HAS_AXIS_TKEEP {true} \
CONFIG.C_RX_FIFO_DEPTH {4096} \
CONFIG.C_RX_FIFO_PE_THRESHOLD {10} \
CONFIG.C_RX_FIFO_PF_THRESHOLD {4000} \
CONFIG.C_TX_FIFO_DEPTH {4096} \
CONFIG.C_TX_FIFO_PE_THRESHOLD {10} \
CONFIG.C_TX_FIFO_PF_THRESHOLD {4000} \
 ] $axi_ethernet_0_fifo

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.C_AXI4_BASEADDR.VALUE_SRC {DEFAULT} \
CONFIG.C_AXI4_HIGHADDR.VALUE_SRC {DEFAULT} \
 ] $axi_ethernet_0_fifo

  # Create instance: axi_mem_intercon, and set properties
  set axi_mem_intercon [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_mem_intercon ]
  set_property -dict [ list \
CONFIG.NUM_MI {2} \
CONFIG.NUM_SI {5} \
 ] $axi_mem_intercon

  # Create instance: axi_uart16550_0, and set properties
  set axi_uart16550_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uart16550:2.0 axi_uart16550_0 ]
  set_property -dict [ list \
CONFIG.C_EXTERNAL_XIN_CLK_HZ {25000000} \
CONFIG.C_S_AXI_ACLK_FREQ_HZ {100000000} \
 ] $axi_uart16550_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.C_EXTERNAL_XIN_CLK_HZ.VALUE_SRC {DEFAULT} \
CONFIG.C_S_AXI_ACLK_FREQ_HZ.VALUE_SRC {DEFAULT} \
 ] $axi_uart16550_0

  # Create instance: generic_timer_0, and set properties
  set generic_timer_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 generic_timer_0 ]
  set_property -dict [ list \
CONFIG.enable_timer2 {1} \
 ] $generic_timer_0

  # Create instance: led_timer, and set properties
  set led_timer [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 led_timer ]

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]

  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:10.0 microblaze_0 ]
  set_property -dict [ list \
CONFIG.C_CACHE_BYTE_SIZE {8192} \
CONFIG.C_DCACHE_BYTE_SIZE {8192} \
CONFIG.C_DEBUG_ENABLED {1} \
CONFIG.C_D_AXI {1} \
CONFIG.C_D_LMB {1} \
CONFIG.C_ILL_OPCODE_EXCEPTION {0} \
CONFIG.C_I_LMB {1} \
CONFIG.C_OPCODE_0x0_ILLEGAL {0} \
CONFIG.C_UNALIGNED_EXCEPTIONS {0} \
CONFIG.C_USE_BARREL {1} \
CONFIG.C_USE_BRANCH_TARGET_CACHE {1} \
CONFIG.C_USE_DCACHE {1} \
CONFIG.C_USE_DIV {1} \
CONFIG.C_USE_HW_MUL {2} \
CONFIG.C_USE_ICACHE {1} \
CONFIG.C_USE_PCMP_INSTR {1} \
CONFIG.G_USE_EXCEPTIONS {0} \
 ] $microblaze_0

  # Create instance: microblaze_0_axi_intc, and set properties
  set microblaze_0_axi_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_intc:4.1 microblaze_0_axi_intc ]
  set_property -dict [ list \
CONFIG.C_HAS_FAST {1} \
 ] $microblaze_0_axi_intc

  # Create instance: microblaze_0_axi_periph, and set properties
  set microblaze_0_axi_periph [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 microblaze_0_axi_periph ]
  set_property -dict [ list \
CONFIG.NUM_MI {20} \
 ] $microblaze_0_axi_periph

  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory [current_bd_instance .] microblaze_0_local_memory

  # Create instance: microblaze_0_xlconcat, and set properties
  set microblaze_0_xlconcat [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 microblaze_0_xlconcat ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {14} \
 ] $microblaze_0_xlconcat

  # Create instance: mig_7series_0, and set properties
  set mig_7series_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mig_7series:4.0 mig_7series_0 ]

  # Generate the PRJ File for MIG
  set str_mig_folder [get_property IP_DIR [ get_ips [ get_property CONFIG.Component_Name $mig_7series_0 ] ] ]
  set str_mig_file_name mig_b.prj
  set str_mig_file_path ${str_mig_folder}/${str_mig_file_name}

  write_mig_file_system_mig_7series_0_0 $str_mig_file_path

  set_property -dict [ list \
CONFIG.BOARD_MIG_PARAM {Custom} \
CONFIG.MIG_DONT_TOUCH_PARAM {Custom} \
CONFIG.RESET_BOARD_INTERFACE {Custom} \
CONFIG.XML_INPUT_FILE {mig_b.prj} \
 ] $mig_7series_0

  # Create instance: oled
  create_hier_cell_oled [current_bd_instance .] oled

  # Create instance: one, and set properties
  set one [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 one ]

  # Create instance: pixel_eth_clk_gen, and set properties
  set pixel_eth_clk_gen [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.3 pixel_eth_clk_gen ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {229.006} \
CONFIG.CLKOUT1_PHASE_ERROR {248.735} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {125} \
CONFIG.CLKOUT1_USED {true} \
CONFIG.CLKOUT2_JITTER {222.598} \
CONFIG.CLKOUT2_PHASE_ERROR {248.735} \
CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {148.5} \
CONFIG.CLKOUT2_USED {true} \
CONFIG.CLKOUT3_JITTER {253.529} \
CONFIG.CLKOUT3_PHASE_ERROR {248.735} \
CONFIG.CLKOUT3_REQUESTED_OUT_FREQ {100.000} \
CONFIG.CLKOUT3_USED {false} \
CONFIG.MMCM_CLKFBOUT_MULT_F {35.625} \
CONFIG.MMCM_CLKIN1_PERIOD {10.0} \
CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {7.125} \
CONFIG.MMCM_CLKOUT1_DIVIDE {6} \
CONFIG.MMCM_CLKOUT2_DIVIDE {1} \
CONFIG.MMCM_COMPENSATION {ZHOLD} \
CONFIG.MMCM_DIVCLK_DIVIDE {4} \
CONFIG.NUM_OUT_CLKS {2} \
CONFIG.PRIM_SOURCE {No_buffer} \
CONFIG.RESET_PORT {resetn} \
CONFIG.RESET_TYPE {ACTIVE_LOW} \
 ] $pixel_eth_clk_gen

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.MMCM_CLKFBOUT_MULT_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN1_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN2_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT1_DIVIDE.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_COMPENSATION.VALUE_SRC {DEFAULT} \
CONFIG.RESET_PORT.VALUE_SRC {DEFAULT} \
 ] $pixel_eth_clk_gen

  # Create instance: power_iic, and set properties
  set power_iic [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_iic:2.0 power_iic ]
  set_property -dict [ list \
CONFIG.C_SCL_INERTIAL_DELAY {5} \
CONFIG.C_SDA_INERTIAL_DELAY {5} \
CONFIG.IIC_FREQ_KHZ {400} \
 ] $power_iic

  # Create instance: qspi_flash, and set properties
  set qspi_flash [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_quad_spi:3.2 qspi_flash ]
  set_property -dict [ list \
CONFIG.C_FIFO_DEPTH {256} \
CONFIG.C_SPI_MEMORY {3} \
CONFIG.C_SPI_MODE {2} \
CONFIG.C_TYPE_OF_AXI4_INTERFACE {1} \
CONFIG.C_USE_STARTUP {1} \
CONFIG.C_XIP_MODE {0} \
 ] $qspi_flash

  # Create instance: qspi_flash_clk_gen, and set properties
  set qspi_flash_clk_gen [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:5.3 qspi_flash_clk_gen ]
  set_property -dict [ list \
CONFIG.CLKOUT1_JITTER {127.220} \
CONFIG.CLKOUT1_PHASE_ERROR {105.461} \
CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {150} \
CONFIG.MMCM_CLKFBOUT_MULT_F {9} \
CONFIG.MMCM_CLKIN1_PERIOD {10.0} \
CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F {6} \
CONFIG.MMCM_COMPENSATION {ZHOLD} \
CONFIG.PRIMITIVE {PLL} \
CONFIG.PRIM_SOURCE {No_buffer} \
CONFIG.RESET_PORT {resetn} \
CONFIG.RESET_TYPE {ACTIVE_LOW} \
 ] $qspi_flash_clk_gen

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.MMCM_CLKFBOUT_MULT_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN1_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKIN2_PERIOD.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_CLKOUT0_DIVIDE_F.VALUE_SRC {DEFAULT} \
CONFIG.MMCM_COMPENSATION.VALUE_SRC {DEFAULT} \
CONFIG.RESET_PORT.VALUE_SRC {DEFAULT} \
 ] $qspi_flash_clk_gen

  # Create instance: rst_mig_7series_0_100M, and set properties
  set rst_mig_7series_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_mig_7series_0_100M ]

  # Create instance: userio, and set properties
  set userio [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_gpio:2.0 userio ]
  set_property -dict [ list \
CONFIG.C_ALL_INPUTS {1} \
CONFIG.C_ALL_OUTPUTS_2 {1} \
CONFIG.C_GPIO2_WIDTH {8} \
CONFIG.C_GPIO_WIDTH {13} \
CONFIG.C_INTERRUPT_PRESENT {1} \
CONFIG.C_IS_DUAL {1} \
 ] $userio

  # Create instance: video
  create_hier_cell_video [current_bd_instance .] video

  # Create instance: xadc_wiz_0, and set properties
  set xadc_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xadc_wiz:3.3 xadc_wiz_0 ]
  set_property -dict [ list \
CONFIG.ADC_CONVERSION_RATE {1000} \
CONFIG.ADC_OFFSET_AND_GAIN_CALIBRATION {true} \
CONFIG.ADC_OFFSET_CALIBRATION {true} \
CONFIG.CHANNEL_ENABLE_TEMPERATURE {true} \
CONFIG.CHANNEL_ENABLE_VBRAM {true} \
CONFIG.CHANNEL_ENABLE_VCCAUX {true} \
CONFIG.CHANNEL_ENABLE_VCCINT {true} \
CONFIG.CHANNEL_ENABLE_VP_VN {true} \
CONFIG.DCLK_FREQUENCY {100} \
CONFIG.ENABLE_RESET {false} \
CONFIG.ENABLE_TEMP_BUS {true} \
CONFIG.INTERFACE_SELECTION {Enable_AXI} \
CONFIG.SENSOR_OFFSET_AND_GAIN_CALIBRATION {true} \
CONFIG.SENSOR_OFFSET_CALIBRATION {true} \
CONFIG.SEQUENCER_MODE {Continuous} \
CONFIG.TEMPERATURE_ALARM_RESET {45} \
CONFIG.TEMPERATURE_ALARM_TRIGGER {60} \
CONFIG.XADC_STARUP_SELECTION {channel_sequencer} \
 ] $xadc_wiz_0

  # Need to retain value_src of defaults
  set_property -dict [ list \
CONFIG.ADC_CONVERSION_RATE.VALUE_SRC {DEFAULT} \
CONFIG.CHANNEL_ENABLE_TEMPERATURE.VALUE_SRC {DEFAULT} \
CONFIG.DCLK_FREQUENCY.VALUE_SRC {DEFAULT} \
CONFIG.ENABLE_RESET.VALUE_SRC {DEFAULT} \
CONFIG.INTERFACE_SELECTION.VALUE_SRC {DEFAULT} \
 ] $xadc_wiz_0

  set_property -dict [ list \
CONFIG.NUM_READ_OUTSTANDING {1} \
CONFIG.NUM_WRITE_OUTSTANDING {1} \
 ] [get_bd_intf_pins /xadc_wiz_0/s_axi_lite]

  # Create instance: xlconcat_0, and set properties
  set xlconcat_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 xlconcat_0 ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {6} \
 ] $xlconcat_0

  # Create interface connections
  connect_bd_intf_net -intf_net Audio_AXI_S2MM [get_bd_intf_pins Audio/AXI_S2MM] [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM]
  connect_bd_intf_net -intf_net S02_AXI_1 [get_bd_intf_pins axi_mem_intercon/S02_AXI] [get_bd_intf_pins video/M_AXI_MM2S]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXIS_MM2S [get_bd_intf_pins Audio/AXI_MM2S] [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXI_MM2S [get_bd_intf_pins axi_dma_0/M_AXI_MM2S] [get_bd_intf_pins axi_mem_intercon/S03_AXI]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXI_S2MM [get_bd_intf_pins axi_dma_0/M_AXI_S2MM] [get_bd_intf_pins axi_mem_intercon/S04_AXI]
  connect_bd_intf_net -intf_net axi_ethernet_0_fifo_AXI_STR_TXC [get_bd_intf_pins axi_ethernet_0/s_axis_txc] [get_bd_intf_pins axi_ethernet_0_fifo/AXI_STR_TXC]
  connect_bd_intf_net -intf_net axi_ethernet_0_fifo_AXI_STR_TXD [get_bd_intf_pins axi_ethernet_0/s_axis_txd] [get_bd_intf_pins axi_ethernet_0_fifo/AXI_STR_TXD]
  connect_bd_intf_net -intf_net axi_ethernet_0_m_axis_rxd [get_bd_intf_pins axi_ethernet_0/m_axis_rxd] [get_bd_intf_pins axi_ethernet_0_fifo/AXI_STR_RXD]
  connect_bd_intf_net -intf_net axi_ethernet_0_mdio_io [get_bd_intf_ports mdio_io] [get_bd_intf_pins axi_ethernet_0/mdio]
  connect_bd_intf_net -intf_net axi_ethernet_0_rgmii [get_bd_intf_ports rgmii] [get_bd_intf_pins axi_ethernet_0/rgmii]
  connect_bd_intf_net -intf_net axi_iic_0_IIC [get_bd_intf_ports aud] [get_bd_intf_pins Audio/IIC]
  connect_bd_intf_net -intf_net axi_mem_intercon_M00_AXI [get_bd_intf_pins axi_mem_intercon/M00_AXI] [get_bd_intf_pins mig_7series_0/S_AXI]
  connect_bd_intf_net -intf_net axi_mem_intercon_M01_AXI [get_bd_intf_pins axi_mem_intercon/M01_AXI] [get_bd_intf_pins qspi_flash/AXI_FULL]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DC [get_bd_intf_pins axi_mem_intercon/S00_AXI] [get_bd_intf_pins microblaze_0/M_AXI_DC]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_IC [get_bd_intf_pins axi_mem_intercon/S01_AXI] [get_bd_intf_pins microblaze_0/M_AXI_IC]
  connect_bd_intf_net -intf_net microblaze_0_axi_dp [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins microblaze_0_axi_periph/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M01_AXI [get_bd_intf_pins Audio/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M01_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M02_AXI [get_bd_intf_pins Audio/AXI_L] [get_bd_intf_pins microblaze_0_axi_periph/M02_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M03_AXI [get_bd_intf_pins axi_dma_0/S_AXI_LITE] [get_bd_intf_pins microblaze_0_axi_periph/M03_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M05_AXI [get_bd_intf_pins axi_uart16550_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M05_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M06_AXI [get_bd_intf_pins generic_timer_0/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M06_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M07_AXI [get_bd_intf_pins microblaze_0_axi_periph/M07_AXI] [get_bd_intf_pins power_iic/S_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M08_AXI [get_bd_intf_pins microblaze_0_axi_periph/M08_AXI] [get_bd_intf_pins userio/S_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M09_AXI [get_bd_intf_pins microblaze_0_axi_periph/M09_AXI] [get_bd_intf_pins oled/S_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M10_AXI [get_bd_intf_pins microblaze_0_axi_periph/M10_AXI] [get_bd_intf_pins oled/AXI_LITE]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M11_AXI [get_bd_intf_pins microblaze_0_axi_periph/M11_AXI] [get_bd_intf_pins xadc_wiz_0/s_axi_lite]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M12_AXI [get_bd_intf_pins microblaze_0_axi_periph/M12_AXI] [get_bd_intf_pins video/S_AXI_LITE]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M13_AXI [get_bd_intf_pins microblaze_0_axi_periph/M13_AXI] [get_bd_intf_pins video/dp_s_axilite]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M15_AXI [get_bd_intf_pins axi_ethernet_0/s_axi] [get_bd_intf_pins microblaze_0_axi_periph/M15_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M16_AXI [get_bd_intf_pins axi_ethernet_0_fifo/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M16_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M17_AXI [get_bd_intf_pins led_timer/S_AXI] [get_bd_intf_pins microblaze_0_axi_periph/M17_AXI]
  connect_bd_intf_net -intf_net microblaze_0_axi_periph_M19_AXI [get_bd_intf_pins microblaze_0_axi_periph/M19_AXI] [get_bd_intf_pins video/ctrl1]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net microblaze_0_intc_axi [get_bd_intf_pins microblaze_0_axi_intc/s_axi] [get_bd_intf_pins microblaze_0_axi_periph/M00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_interrupt [get_bd_intf_pins microblaze_0/INTERRUPT] [get_bd_intf_pins microblaze_0_axi_intc/interrupt]
  connect_bd_intf_net -intf_net mig_7series_0_DDR3 [get_bd_intf_ports DDR3] [get_bd_intf_pins mig_7series_0/DDR3]
  connect_bd_intf_net -intf_net power_iic_IIC [get_bd_intf_ports power_iic] [get_bd_intf_pins power_iic/IIC]
  connect_bd_intf_net -intf_net qspi_flash_SPI_0 [get_bd_intf_ports qspi] [get_bd_intf_pins qspi_flash/SPI_0]
  connect_bd_intf_net -intf_net sysclk_1 [get_bd_intf_ports sysclk] [get_bd_intf_pins mig_7series_0/SYS_CLK]
  connect_bd_intf_net -intf_net video_TMDS [get_bd_intf_ports hdmi_tx] [get_bd_intf_pins video/TMDS]

  # Create port connections
  connect_bd_net -net AUD_ADC_SDATA_1 [get_bd_ports AUD_ADC_SDATA] [get_bd_pins Audio/SDATA_I]
  connect_bd_net -net Net [get_bd_ports ps2_clk] [get_bd_pins video/PS2_Clk_IO]
  connect_bd_net -net Net1 [get_bd_ports ps2_data] [get_bd_pins video/PS2_Data_IO]
  connect_bd_net -net axi_dma_0_mm2s_introut [get_bd_pins axi_dma_0/mm2s_introut] [get_bd_pins microblaze_0_xlconcat/In7]
  connect_bd_net -net axi_dma_0_s2mm_introut [get_bd_pins axi_dma_0/s2mm_introut] [get_bd_pins microblaze_0_xlconcat/In8]
  connect_bd_net -net axi_ethernet_0_fifo_interrupt [get_bd_pins axi_ethernet_0_fifo/interrupt] [get_bd_pins microblaze_0_xlconcat/In12]
  connect_bd_net -net axi_ethernet_0_fifo_mm2s_cntrl_reset_out_n [get_bd_pins axi_ethernet_0/axi_txc_arstn] [get_bd_pins axi_ethernet_0_fifo/mm2s_cntrl_reset_out_n]
  connect_bd_net -net axi_ethernet_0_fifo_mm2s_prmry_reset_out_n [get_bd_pins axi_ethernet_0/axi_txd_arstn] [get_bd_pins axi_ethernet_0_fifo/mm2s_prmry_reset_out_n]
  connect_bd_net -net axi_ethernet_0_fifo_s2mm_prmry_reset_out_n [get_bd_pins axi_ethernet_0/axi_rxd_arstn] [get_bd_pins axi_ethernet_0/axi_rxs_arstn] [get_bd_pins axi_ethernet_0_fifo/s2mm_prmry_reset_out_n]
  connect_bd_net -net axi_ethernet_0_interrupt [get_bd_pins axi_ethernet_0/interrupt] [get_bd_pins microblaze_0_xlconcat/In11]
  connect_bd_net -net axi_ethernet_0_phy_rst_n [get_bd_ports phy_rst_n] [get_bd_pins axi_ethernet_0/phy_rst_n]
  connect_bd_net -net axi_gpio_0_gpio_io_o [get_bd_ports oled_gpio] [get_bd_pins oled/gpio_io_o]
  connect_bd_net -net axi_quad_spi_0_io0_o [get_bd_ports oled_sdin] [get_bd_pins oled/io0_o]
  connect_bd_net -net axi_quad_spi_0_sck_o [get_bd_ports oled_sclk] [get_bd_pins oled/sck_o]
  connect_bd_net -net axi_uart16550_0_ip2intc_irpt [get_bd_pins axi_uart16550_0/ip2intc_irpt] [get_bd_pins microblaze_0_xlconcat/In2]
  connect_bd_net -net axi_uart16550_0_sout [get_bd_ports uart_rxd_out] [get_bd_pins axi_uart16550_0/sout]
  connect_bd_net -net btnc_1 [get_bd_ports btnc] [get_bd_pins xlconcat_0/In5]
  connect_bd_net -net btnd_1 [get_bd_ports btnd] [get_bd_pins xlconcat_0/In3]
  connect_bd_net -net btnl_1 [get_bd_ports btnl] [get_bd_pins xlconcat_0/In4]
  connect_bd_net -net btnr_1 [get_bd_ports btnr] [get_bd_pins xlconcat_0/In2]
  connect_bd_net -net btnu_1 [get_bd_ports btnu] [get_bd_pins xlconcat_0/In1]
  connect_bd_net -net cpu_resetn_1 [get_bd_ports cpu_resetn] [get_bd_pins rst_mig_7series_0_100M/aux_reset_in]
  connect_bd_net -net d_axi_i2s_audio_0_BCLK_O [get_bd_ports AUD_BCLK] [get_bd_pins Audio/BCLK_O]
  connect_bd_net -net d_axi_i2s_audio_0_LRCLK1_O [get_bd_ports AUD_LRCLK] [get_bd_pins Audio/LRCLK1_O]
  connect_bd_net -net d_axi_i2s_audio_0_MCLK_O [get_bd_ports AUD_MCLK] [get_bd_pins Audio/MCLK_O]
  connect_bd_net -net d_axi_i2s_audio_0_SDATA_O [get_bd_ports AUD_DAC_SDATA] [get_bd_pins Audio/SDATA_O]
  connect_bd_net -net dp_aux_in_n_1 [get_bd_ports dp_aux_in_n] [get_bd_pins video/aux_tx_channel_in_n]
  connect_bd_net -net dp_aux_in_p_1 [get_bd_ports dp_aux_in_p] [get_bd_pins video/aux_tx_channel_in_p]
  connect_bd_net -net dp_hpd_1 [get_bd_ports dp_hpd] [get_bd_pins video/tx_hpd]
  connect_bd_net -net dp_lnk_clk_n_1 [get_bd_ports dp_lnk_clk_n] [get_bd_pins video/lnk_clk_n]
  connect_bd_net -net dp_lnk_clk_p_1 [get_bd_ports dp_lnk_clk_p] [get_bd_pins video/lnk_clk_p]
  connect_bd_net -net eth_intb_1 [get_bd_ports eth_intb] [get_bd_pins microblaze_0_xlconcat/In10]
  connect_bd_net -net generic_timer_0_interrupt [get_bd_pins generic_timer_0/interrupt] [get_bd_pins microblaze_0_xlconcat/In3]
  connect_bd_net -net led_timer_interrupt [get_bd_pins led_timer/interrupt] [get_bd_pins microblaze_0_xlconcat/In13]
  connect_bd_net -net mdm_1_debug_sys_rst [get_bd_pins mdm_1/Debug_SYS_Rst] [get_bd_pins rst_mig_7series_0_100M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk [get_bd_pins Audio/s_axi_aclk] [get_bd_pins axi_dma_0/m_axi_mm2s_aclk] [get_bd_pins axi_dma_0/m_axi_s2mm_aclk] [get_bd_pins axi_dma_0/s_axi_lite_aclk] [get_bd_pins axi_ethernet_0/axis_clk] [get_bd_pins axi_ethernet_0/s_axi_lite_clk] [get_bd_pins axi_ethernet_0_fifo/s_axi_aclk] [get_bd_pins axi_mem_intercon/ACLK] [get_bd_pins axi_mem_intercon/M00_ACLK] [get_bd_pins axi_mem_intercon/M01_ACLK] [get_bd_pins axi_mem_intercon/S00_ACLK] [get_bd_pins axi_mem_intercon/S01_ACLK] [get_bd_pins axi_mem_intercon/S02_ACLK] [get_bd_pins axi_mem_intercon/S03_ACLK] [get_bd_pins axi_mem_intercon/S04_ACLK] [get_bd_pins axi_uart16550_0/s_axi_aclk] [get_bd_pins generic_timer_0/s_axi_aclk] [get_bd_pins led_timer/s_axi_aclk] [get_bd_pins microblaze_0/Clk] [get_bd_pins microblaze_0_axi_intc/processor_clk] [get_bd_pins microblaze_0_axi_intc/s_axi_aclk] [get_bd_pins microblaze_0_axi_periph/ACLK] [get_bd_pins microblaze_0_axi_periph/M00_ACLK] [get_bd_pins microblaze_0_axi_periph/M01_ACLK] [get_bd_pins microblaze_0_axi_periph/M02_ACLK] [get_bd_pins microblaze_0_axi_periph/M03_ACLK] [get_bd_pins microblaze_0_axi_periph/M04_ACLK] [get_bd_pins microblaze_0_axi_periph/M05_ACLK] [get_bd_pins microblaze_0_axi_periph/M06_ACLK] [get_bd_pins microblaze_0_axi_periph/M07_ACLK] [get_bd_pins microblaze_0_axi_periph/M08_ACLK] [get_bd_pins microblaze_0_axi_periph/M09_ACLK] [get_bd_pins microblaze_0_axi_periph/M10_ACLK] [get_bd_pins microblaze_0_axi_periph/M11_ACLK] [get_bd_pins microblaze_0_axi_periph/M12_ACLK] [get_bd_pins microblaze_0_axi_periph/M13_ACLK] [get_bd_pins microblaze_0_axi_periph/M14_ACLK] [get_bd_pins microblaze_0_axi_periph/M15_ACLK] [get_bd_pins microblaze_0_axi_periph/M16_ACLK] [get_bd_pins microblaze_0_axi_periph/M17_ACLK] [get_bd_pins microblaze_0_axi_periph/M18_ACLK] [get_bd_pins microblaze_0_axi_periph/M19_ACLK] [get_bd_pins microblaze_0_axi_periph/S00_ACLK] [get_bd_pins microblaze_0_local_memory/LMB_Clk] [get_bd_pins mig_7series_0/ui_clk] [get_bd_pins oled/s_axi_aclk] [get_bd_pins pixel_eth_clk_gen/clk_in1] [get_bd_pins power_iic/s_axi_aclk] [get_bd_pins qspi_flash/s_axi4_aclk] [get_bd_pins qspi_flash_clk_gen/clk_in1] [get_bd_pins rst_mig_7series_0_100M/slowest_sync_clk] [get_bd_pins userio/s_axi_aclk] [get_bd_pins video/m_axi_mm2s_aclk] [get_bd_pins xadc_wiz_0/s_axi_aclk]
  connect_bd_net -net microblaze_0_intr [get_bd_pins microblaze_0_axi_intc/intr] [get_bd_pins microblaze_0_xlconcat/dout]
  connect_bd_net -net mig_7series_0_mmcm_locked [get_bd_pins mig_7series_0/mmcm_locked] [get_bd_pins pixel_eth_clk_gen/resetn]
  connect_bd_net -net mig_7series_0_ui_addn_clk_0 [get_bd_pins axi_ethernet_0/ref_clk] [get_bd_pins mig_7series_0/ui_addn_clk_0]
  connect_bd_net -net mig_7series_0_ui_clk_sync_rst [get_bd_pins mig_7series_0/ui_clk_sync_rst] [get_bd_pins rst_mig_7series_0_100M/ext_reset_in]
  connect_bd_net -net oled_ip2intc_irpt [get_bd_pins microblaze_0_xlconcat/In6] [get_bd_pins oled/ip2intc_irpt]
  connect_bd_net -net one_dout [get_bd_ports hdmi_rx_hpa] [get_bd_pins mig_7series_0/sys_rst] [get_bd_pins one/dout]
  connect_bd_net -net pixel_eth_clk_gen_clk_out1 [get_bd_pins axi_ethernet_0/gtx_clk] [get_bd_pins pixel_eth_clk_gen/clk_out1]
  connect_bd_net -net pixel_eth_clk_gen_clk_out2 [get_bd_pins pixel_eth_clk_gen/clk_out2] [get_bd_pins video/OutPixelClk]
  connect_bd_net -net pixel_eth_clk_gen_locked [get_bd_pins pixel_eth_clk_gen/locked] [get_bd_pins qspi_flash_clk_gen/resetn]
  connect_bd_net -net qspi_flash_clk_gen_clk_out1 [get_bd_pins qspi_flash/ext_spi_clk] [get_bd_pins qspi_flash_clk_gen/clk_out1]
  connect_bd_net -net qspi_flash_clk_gen_locked [get_bd_pins qspi_flash_clk_gen/locked] [get_bd_pins rst_mig_7series_0_100M/dcm_locked]
  connect_bd_net -net qspi_flash_ip2intc_irpt [get_bd_pins microblaze_0_xlconcat/In9] [get_bd_pins qspi_flash/ip2intc_irpt]
  connect_bd_net -net rst_mig_7series_0_100M_bus_struct_reset [get_bd_pins microblaze_0_local_memory/LMB_Rst] [get_bd_pins rst_mig_7series_0_100M/bus_struct_reset]
  connect_bd_net -net rst_mig_7series_0_100M_interconnect_aresetn [get_bd_pins axi_mem_intercon/ARESETN] [get_bd_pins microblaze_0_axi_periph/ARESETN] [get_bd_pins rst_mig_7series_0_100M/interconnect_aresetn]
  connect_bd_net -net rst_mig_7series_0_100M_mb_reset [get_bd_pins microblaze_0/Reset] [get_bd_pins microblaze_0_axi_intc/processor_rst] [get_bd_pins rst_mig_7series_0_100M/mb_reset]
  connect_bd_net -net rst_mig_7series_0_100M_peripheral_aresetn [get_bd_pins Audio/s_axi_aresetn] [get_bd_pins axi_dma_0/axi_resetn] [get_bd_pins axi_ethernet_0/s_axi_lite_resetn] [get_bd_pins axi_ethernet_0_fifo/s_axi_aresetn] [get_bd_pins axi_mem_intercon/M00_ARESETN] [get_bd_pins axi_mem_intercon/M01_ARESETN] [get_bd_pins axi_mem_intercon/S00_ARESETN] [get_bd_pins axi_mem_intercon/S01_ARESETN] [get_bd_pins axi_mem_intercon/S02_ARESETN] [get_bd_pins axi_mem_intercon/S03_ARESETN] [get_bd_pins axi_mem_intercon/S04_ARESETN] [get_bd_pins axi_uart16550_0/s_axi_aresetn] [get_bd_pins generic_timer_0/s_axi_aresetn] [get_bd_pins led_timer/s_axi_aresetn] [get_bd_pins microblaze_0_axi_intc/s_axi_aresetn] [get_bd_pins microblaze_0_axi_periph/M00_ARESETN] [get_bd_pins microblaze_0_axi_periph/M01_ARESETN] [get_bd_pins microblaze_0_axi_periph/M02_ARESETN] [get_bd_pins microblaze_0_axi_periph/M03_ARESETN] [get_bd_pins microblaze_0_axi_periph/M04_ARESETN] [get_bd_pins microblaze_0_axi_periph/M05_ARESETN] [get_bd_pins microblaze_0_axi_periph/M06_ARESETN] [get_bd_pins microblaze_0_axi_periph/M07_ARESETN] [get_bd_pins microblaze_0_axi_periph/M08_ARESETN] [get_bd_pins microblaze_0_axi_periph/M09_ARESETN] [get_bd_pins microblaze_0_axi_periph/M10_ARESETN] [get_bd_pins microblaze_0_axi_periph/M11_ARESETN] [get_bd_pins microblaze_0_axi_periph/M12_ARESETN] [get_bd_pins microblaze_0_axi_periph/M13_ARESETN] [get_bd_pins microblaze_0_axi_periph/M14_ARESETN] [get_bd_pins microblaze_0_axi_periph/M15_ARESETN] [get_bd_pins microblaze_0_axi_periph/M16_ARESETN] [get_bd_pins microblaze_0_axi_periph/M17_ARESETN] [get_bd_pins microblaze_0_axi_periph/M18_ARESETN] [get_bd_pins microblaze_0_axi_periph/M19_ARESETN] [get_bd_pins microblaze_0_axi_periph/S00_ARESETN] [get_bd_pins mig_7series_0/aresetn] [get_bd_pins oled/s_axi_aresetn] [get_bd_pins power_iic/s_axi_aresetn] [get_bd_pins qspi_flash/s_axi4_aresetn] [get_bd_pins rst_mig_7series_0_100M/peripheral_aresetn] [get_bd_pins userio/s_axi_aresetn] [get_bd_pins video/axi_resetn] [get_bd_pins xadc_wiz_0/s_axi_aresetn]
  connect_bd_net -net sin_1 [get_bd_ports uart_txd_in] [get_bd_pins axi_uart16550_0/sin]
  connect_bd_net -net sw_1 [get_bd_ports sw] [get_bd_pins xlconcat_0/In0]
  connect_bd_net -net userio_gpio2_io_o [get_bd_ports led] [get_bd_pins userio/gpio2_io_o]
  connect_bd_net -net userio_ip2intc_irpt [get_bd_pins microblaze_0_xlconcat/In4] [get_bd_pins userio/ip2intc_irpt]
  connect_bd_net -net video_aux_tx_channel_out_n [get_bd_ports dp_aux_out_n] [get_bd_pins video/aux_tx_channel_out_n]
  connect_bd_net -net video_aux_tx_channel_out_p [get_bd_ports dp_aux_out_p] [get_bd_pins video/aux_tx_channel_out_p]
  connect_bd_net -net video_axi_int [get_bd_pins microblaze_0_xlconcat/In5] [get_bd_pins video/axi_int]
  connect_bd_net -net video_lnk_tx_lane_n [get_bd_ports dp_tx_lane_n] [get_bd_pins video/lnk_tx_lane_n]
  connect_bd_net -net video_lnk_tx_lane_p [get_bd_ports dp_tx_lane_p] [get_bd_pins video/lnk_tx_lane_p]
  connect_bd_net -net video_mm2s_introut [get_bd_pins microblaze_0_xlconcat/In1] [get_bd_pins video/mm2s_introut]
  connect_bd_net -net video_vga_pBlue [get_bd_ports vga_b] [get_bd_pins video/vga_pBlue]
  connect_bd_net -net video_vga_pGreen [get_bd_ports vga_g] [get_bd_pins video/vga_pGreen]
  connect_bd_net -net video_vga_pHSync [get_bd_ports vga_hs] [get_bd_pins video/vga_pHSync]
  connect_bd_net -net video_vga_pRed [get_bd_ports vga_r] [get_bd_pins video/vga_pRed]
  connect_bd_net -net video_vga_pVSync [get_bd_ports vga_vs] [get_bd_pins video/vga_pVSync]
  connect_bd_net -net xadc_wiz_0_ip2intc_irpt [get_bd_pins microblaze_0_xlconcat/In0] [get_bd_pins xadc_wiz_0/ip2intc_irpt]
  connect_bd_net -net xadc_wiz_0_temp_out [get_bd_pins mig_7series_0/device_temp_i] [get_bd_pins xadc_wiz_0/temp_out]
  connect_bd_net -net xadc_wiz_0_user_temp_alarm_out [get_bd_ports fan_en] [get_bd_pins xadc_wiz_0/user_temp_alarm_out]
  connect_bd_net -net xlconcat_0_dout [get_bd_pins userio/gpio_io_i] [get_bd_pins xlconcat_0/dout]
  connect_bd_net -net xlconstant_0_dout [get_bd_ports AUD_ADDR_0] [get_bd_ports AUD_ADDR_1] [get_bd_pins Audio/dout]

  # Create address segments
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x00001000 -offset 0xC4000000 [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs qspi_flash/aximm/MEM0] SEG_qspi_flash_MEM0
  create_bd_addr_seg -range 0x00001000 -offset 0xC4000000 [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs qspi_flash/aximm/MEM0] SEG_qspi_flash_MEM0
  create_bd_addr_seg -range 0x00010000 -offset 0x41E00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_dma_0/S_AXI_LITE/Reg] SEG_axi_dma_0_Reg
  create_bd_addr_seg -range 0x00040000 -offset 0x40C00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_ethernet_0/s_axi/Reg0] SEG_axi_ethernet_0_Reg0
  create_bd_addr_seg -range 0x00010000 -offset 0x44A80000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_ethernet_0_fifo/S_AXI/Mem0] SEG_axi_ethernet_0_fifo_Mem0
  create_bd_addr_seg -range 0x00010000 -offset 0x40010000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs oled/axi_gpio_0/S_AXI/Reg] SEG_axi_gpio_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40800000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs Audio/axi_iic_0/S_AXI/Reg] SEG_axi_iic_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A30000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs oled/axi_quad_spi_0/AXI_LITE/Reg] SEG_axi_quad_spi_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x40400000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_uart16550_0/S_AXI/Reg] SEG_axi_uart16550_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A50000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs video/axi_vdma_0/S_AXI_LITE/Reg] SEG_axi_vdma_0_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A10000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs Audio/d_axi_i2s_audio_0/AXI_L/AXI_L_reg] SEG_d_axi_i2s_audio_0_AXI_L_reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A20000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs video/displayport_0/dp_s_axilite/Reg] SEG_displayport_0_Reg
  create_bd_addr_seg -range 0x00004000 -offset 0x00000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] SEG_dlmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00010000 -offset 0x41C00000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs generic_timer_0/S_AXI/Reg] SEG_generic_timer_0_Reg
  create_bd_addr_seg -range 0x00004000 -offset 0x00000000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] SEG_ilmb_bram_if_cntlr_Mem
  create_bd_addr_seg -range 0x00010000 -offset 0x41C10000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs led_timer/S_AXI/Reg] SEG_led_timer_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x41200000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_axi_intc/S_AXI/Reg] SEG_microblaze_0_axi_intc_Reg
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x00010000 -offset 0x40810000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs power_iic/S_AXI/Reg] SEG_power_iic_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A90000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs video/ps2_mouse_overlay_0/s00_axi/reg0] SEG_ps2_mouse_overlay_0_reg0
  create_bd_addr_seg -range 0x00001000 -offset 0xC4000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs qspi_flash/aximm/MEM0] SEG_qspi_flash_MEM0
  create_bd_addr_seg -range 0x00001000 -offset 0xC4000000 [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs qspi_flash/aximm/MEM0] SEG_qspi_flash_MEM0
  create_bd_addr_seg -range 0x00010000 -offset 0x40000000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs userio/S_AXI/Reg] SEG_userio_Reg
  create_bd_addr_seg -range 0x00010000 -offset 0x44A40000 [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs xadc_wiz_0/s_axi_lite/Reg] SEG_xadc_wiz_0_Reg
  create_bd_addr_seg -range 0x40000000 -offset 0x80000000 [get_bd_addr_spaces video/axi_vdma_0/Data_MM2S] [get_bd_addr_segs mig_7series_0/memmap/memaddr] SEG_mig_7series_0_memaddr
  create_bd_addr_seg -range 0x00001000 -offset 0xC4000000 [get_bd_addr_spaces video/axi_vdma_0/Data_MM2S] [get_bd_addr_segs qspi_flash/aximm/MEM0] SEG_qspi_flash_MEM0

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.6.5b  2016-09-06 bk=1.3687 VDI=39 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port dp_aux_in_n -pg 1 -y 2010 -defaultsOSRD
preplace port btnr -pg 1 -y 1670 -defaultsOSRD
preplace port AUD_ADC_SDATA -pg 1 -y 120 -defaultsOSRD
preplace port power_iic -pg 1 -y 960 -defaultsOSRD
preplace port mdio_io -pg 1 -y 360 -defaultsOSRD
preplace port aud -pg 1 -y 70 -defaultsOSRD
preplace port dp_aux_in_p -pg 1 -y 2050 -defaultsOSRD
preplace port AUD_MCLK -pg 1 -y 130 -defaultsOSRD
preplace port AUD_LRCLK -pg 1 -y 110 -defaultsOSRD
preplace port AUD_BCLK -pg 1 -y 90 -defaultsOSRD
preplace port btnu -pg 1 -y 1650 -defaultsOSRD
preplace port uart_rxd_out -pg 1 -y 1660 -defaultsOSRD
preplace port oled_sdin -pg 1 -y 1540 -defaultsOSRD
preplace port rgmii -pg 1 -y 380 -defaultsOSRD
preplace port vga_hs -pg 1 -y 1980 -defaultsOSRD
preplace port dp_lnk_clk_n -pg 1 -y 2070 -defaultsOSRD
preplace port fan_en -pg 1 -y 1280 -defaultsOSRD
preplace port dp_lnk_clk_p -pg 1 -y 2090 -defaultsOSRD
preplace port qspi -pg 1 -y 1330 -defaultsOSRD
preplace port AUD_DAC_SDATA -pg 1 -y 150 -defaultsOSRD
preplace port btnl -pg 1 -y 1710 -defaultsOSRD
preplace port DDR3 -pg 1 -y 1100 -defaultsOSRD
preplace port phy_rst_n -pg 1 -y 440 -defaultsOSRD
preplace port sysclk -pg 1 -y 1580 -defaultsOSRD
preplace port hdmi_tx -pg 1 -y 1740 -defaultsOSRD
preplace port oled_sclk -pg 1 -y 1580 -defaultsOSRD
preplace port vga_vs -pg 1 -y 2020 -defaultsOSRD
preplace port dp_aux_out_n -pg 1 -y 1800 -defaultsOSRD
preplace port ps2_data -pg 1 -y 1780 -defaultsOSRD
preplace port eth_intb -pg 1 -y 1910 -defaultsOSRD
preplace port dp_hpd -pg 1 -y 2110 -defaultsOSRD
preplace port btnc -pg 1 -y 1730 -defaultsOSRD
preplace port ps2_clk -pg 1 -y 1760 -defaultsOSRD
preplace port dp_aux_out_p -pg 1 -y 1820 -defaultsOSRD
preplace port uart_txd_in -pg 1 -y 2030 -defaultsOSRD
preplace port cpu_resetn -pg 1 -y 1420 -defaultsOSRD
preplace port btnd -pg 1 -y 1690 -defaultsOSRD
preplace portBus hdmi_rx_hpa -pg 1 -y 1260 -defaultsOSRD
preplace portBus vga_b -pg 1 -y 1940 -defaultsOSRD
preplace portBus sw -pg 1 -y 1630 -defaultsOSRD
preplace portBus vga_r -pg 1 -y 2000 -defaultsOSRD
preplace portBus led -pg 1 -y 1630 -defaultsOSRD
preplace portBus vga_g -pg 1 -y 1960 -defaultsOSRD
preplace portBus AUD_ADDR_0 -pg 1 -y 190 -defaultsOSRD
preplace portBus AUD_ADDR_1 -pg 1 -y 170 -defaultsOSRD
preplace portBus dp_tx_lane_n -pg 1 -y 1860 -defaultsOSRD
preplace portBus oled_gpio -pg 1 -y 1520 -defaultsOSRD
preplace portBus dp_tx_lane_p -pg 1 -y 1880 -defaultsOSRD
preplace inst power_iic -pg 1 -lvl 8 -y 980 -defaultsOSRD
preplace inst rst_mig_7series_0_100M -pg 1 -lvl 3 -y 1470 -defaultsOSRD
preplace inst axi_dma_0 -pg 1 -lvl 6 -y 530 -defaultsOSRD
preplace inst mig_7series_0 -pg 1 -lvl 8 -y 1150 -defaultsOSRD
preplace inst one -pg 1 -lvl 7 -y 1200 -defaultsOSRD
preplace inst xadc_wiz_0 -pg 1 -lvl 5 -y 1350 -defaultsOSRD
preplace inst qspi_flash -pg 1 -lvl 8 -y 1350 -defaultsOSRD
preplace inst Audio -pg 1 -lvl 8 -y 110 -defaultsOSRD
preplace inst userio -pg 1 -lvl 5 -y 1760 -defaultsOSRD
preplace inst microblaze_0_axi_periph -pg 1 -lvl 4 -y 1000 -defaultsOSRD
preplace inst xlconcat_0 -pg 1 -lvl 1 -y 1680 -defaultsOSRD
preplace inst microblaze_0_xlconcat -pg 1 -lvl 4 -y 1840 -defaultsOSRD
preplace inst axi_ethernet_0_fifo -pg 1 -lvl 7 -y 330 -defaultsOSRD
preplace inst qspi_flash_clk_gen -pg 1 -lvl 2 -y 1520 -defaultsOSRD
preplace inst microblaze_0_axi_intc -pg 1 -lvl 5 -y 1120 -defaultsOSRD
preplace inst mdm_1 -pg 1 -lvl 5 -y 740 -defaultsOSRD
preplace inst generic_timer_0 -pg 1 -lvl 5 -y 2210 -defaultsOSRD
preplace inst pixel_eth_clk_gen -pg 1 -lvl 1 -y 1500 -defaultsOSRD
preplace inst microblaze_0 -pg 1 -lvl 6 -y 740 -defaultsOSRD
preplace inst led_timer -pg 1 -lvl 5 -y 2410 -defaultsOSRD
preplace inst axi_uart16550_0 -pg 1 -lvl 5 -y 1960 -defaultsOSRD
preplace inst video -pg 1 -lvl 8 -y 1870 -defaultsOSRD
preplace inst axi_mem_intercon -pg 1 -lvl 7 -y 720 -defaultsOSRD
preplace inst axi_ethernet_0 -pg 1 -lvl 8 -y 400 -defaultsOSRD
preplace inst oled -pg 1 -lvl 8 -y 1550 -defaultsOSRD
preplace inst microblaze_0_local_memory -pg 1 -lvl 7 -y 1090 -defaultsOSRD
preplace netloc microblaze_0_axi_periph_M16_AXI 1 4 3 1320J 310 NJ 310 2270
preplace netloc microblaze_0_axi_periph_M02_AXI 1 4 4 1210 60 NJ 60 NJ 60 NJ
preplace netloc eth_intb_1 1 0 4 NJ 1910 NJ 1910 NJ 1910 NJ
preplace netloc mig_7series_0_DDR3 1 8 1 NJ
preplace netloc pixel_eth_clk_gen_locked 1 1 1 230
preplace netloc rst_mig_7series_0_100M_interconnect_aresetn 1 3 4 840 370 NJ 370 NJ 370 2320J
preplace netloc qspi_flash_SPI_0 1 8 1 NJ
preplace netloc axi_mem_intercon_M01_AXI 1 7 1 2730
preplace netloc xadc_wiz_0_temp_out 1 5 3 NJ 1450 NJ 1450 2690
preplace netloc axi_dma_0_mm2s_introut 1 3 4 860 350 NJ 350 NJ 350 2220
preplace netloc microblaze_0_axi_periph_M03_AXI 1 4 2 N 870 1700J
preplace netloc dp_lnk_clk_n_1 1 0 8 10J 2060 NJ 2060 NJ 2060 NJ 2060 NJ 2060 NJ 2060 NJ 2060 2790J
preplace netloc axi_ethernet_0_rgmii 1 8 1 NJ
preplace netloc microblaze_0_axi_periph_M01_AXI 1 4 4 1230 100 NJ 100 NJ 100 NJ
preplace netloc video_vga_pVSync 1 8 1 NJ
preplace netloc d_axi_i2s_audio_0_LRCLK1_O 1 8 1 NJ
preplace netloc axi_iic_0_IIC 1 8 1 NJ
preplace netloc video_vga_pBlue 1 8 1 NJ
preplace netloc microblaze_0_intc_axi 1 4 1 1340
preplace netloc microblaze_0_dlmb_1 1 6 1 2260
preplace netloc microblaze_0_M_AXI_IC 1 6 1 2250
preplace netloc dp_aux_in_p_1 1 0 8 20J 1580 NJ 1580 NJ 1580 NJ 1580 NJ 1580 NJ 1580 NJ 1580 2700J
preplace netloc xlconcat_0_dout 1 1 5 230J 1660 NJ 1660 NJ 1660 NJ 1660 1680
preplace netloc axi_quad_spi_0_sck_o 1 8 1 NJ
preplace netloc cpu_resetn_1 1 0 3 NJ 1420 NJ 1420 400J
preplace netloc qspi_flash_ip2intc_irpt 1 3 6 870 1550 NJ 1550 NJ 1550 NJ 1550 2820J 1440 3170
preplace netloc microblaze_0_axi_periph_M17_AXI 1 4 1 1210
preplace netloc axi_quad_spi_0_io0_o 1 8 1 NJ
preplace netloc dp_aux_in_n_1 1 0 8 NJ 2010 210J 1590 NJ 1590 NJ 1590 NJ 1590 NJ 1590 NJ 1590 2690J
preplace netloc dp_lnk_clk_p_1 1 0 8 0J 2100 NJ 2100 NJ 2100 NJ 2100 NJ 2100 NJ 2100 NJ 2100 2810J
preplace netloc mig_7series_0_mmcm_locked 1 0 9 20 1340 NJ 1340 NJ 1340 830J 1510 NJ 1510 NJ 1510 NJ 1510 2730J 1430 3180
preplace netloc axi_ethernet_0_mdio_io 1 8 1 NJ
preplace netloc btnr_1 1 0 1 NJ
preplace netloc xadc_wiz_0_user_temp_alarm_out 1 5 4 NJ 1270 NJ 1270 NJ 1270 3220J
preplace netloc btnu_1 1 0 1 NJ
preplace netloc btnl_1 1 0 1 NJ
preplace netloc mig_7series_0_ui_clk_sync_rst 1 2 7 430 1380 770J 1520 NJ 1520 NJ 1520 NJ 1520 2700J 1450 3190
preplace netloc qspi_flash_clk_gen_clk_out1 1 2 6 410J 1560 NJ 1560 NJ 1560 NJ 1560 NJ 1560 2680
preplace netloc d_axi_i2s_audio_0_BCLK_O 1 8 1 NJ
preplace netloc axi_uart16550_0_sout 1 5 4 1760J 1650 NJ 1650 NJ 1650 3220J
preplace netloc microblaze_0_ilmb_1 1 6 1 2240
preplace netloc microblaze_0_axi_periph_M12_AXI 1 4 4 1280 980 1720J 1770 NJ 1770 NJ
preplace netloc microblaze_0_axi_periph_M08_AXI 1 4 1 1270
preplace netloc rst_mig_7series_0_100M_peripheral_aresetn 1 3 5 810 170 1250 170 1750 170 2330 170 2790
preplace netloc userio_gpio2_io_o 1 5 4 1740J 1630 NJ 1630 NJ 1630 NJ
preplace netloc oled_ip2intc_irpt 1 3 6 880 1530 NJ 1530 NJ 1530 NJ 1530 2830J 1460 3170
preplace netloc microblaze_0_interrupt 1 5 1 1730
preplace netloc axi_ethernet_0_fifo_interrupt 1 3 5 950 2040 NJ 2040 NJ 2040 NJ 2040 2670
preplace netloc axi_dma_0_M_AXIS_MM2S 1 6 2 2250 80 NJ
preplace netloc mdm_1_debug_sys_rst 1 2 4 420 1370 800J 1500 NJ 1500 1690
preplace netloc mig_7series_0_ui_addn_clk_0 1 7 2 2830 580 3180
preplace netloc microblaze_0_axi_periph_M13_AXI 1 4 4 1330 1020 1700J 1810 NJ 1810 NJ
preplace netloc S02_AXI_1 1 6 3 2350 230 NJ 230 3200
preplace netloc led_timer_interrupt 1 3 3 940 2510 NJ 2510 1680
preplace netloc sin_1 1 0 6 NJ 2030 NJ 2030 NJ 2030 NJ 2030 1220J 2110 1690
preplace netloc Audio_AXI_S2MM 1 5 4 1770 180 NJ 180 2830J 220 3210
preplace netloc AUD_ADC_SDATA_1 1 0 8 NJ 120 NJ 120 NJ 120 NJ 120 NJ 120 NJ 120 NJ 120 NJ
preplace netloc power_iic_IIC 1 8 1 NJ
preplace netloc axi_dma_0_M_AXI_MM2S 1 6 1 2310
preplace netloc microblaze_0_Clk 1 0 9 10 140 220 140 410 140 850 140 1300 140 1760 140 2300 140 2750 1050 3170
preplace netloc video_TMDS 1 8 1 NJ
preplace netloc sw_1 1 0 1 NJ
preplace netloc axi_ethernet_0_m_axis_rxd 1 6 3 2360 430 2770J 570 3170
preplace netloc axi_dma_0_M_AXI_S2MM 1 6 1 2290
preplace netloc rst_mig_7series_0_100M_bus_struct_reset 1 3 4 790J 360 NJ 360 NJ 360 2270
preplace netloc video_vga_pHSync 1 8 1 NJ
preplace netloc d_axi_i2s_audio_0_MCLK_O 1 8 1 NJ
preplace netloc generic_timer_0_interrupt 1 3 3 900 2310 NJ 2310 1680
preplace netloc dp_hpd_1 1 0 8 10J 2090 NJ 2090 NJ 2090 NJ 2090 NJ 2090 NJ 2090 NJ 2090 2830J
preplace netloc video_vga_pGreen 1 8 1 NJ
preplace netloc Net 1 8 1 NJ
preplace netloc axi_uart16550_0_ip2intc_irpt 1 3 3 920 2050 NJ 2050 1680
preplace netloc video_axi_int 1 3 6 950 1650 NJ 1650 1710J 1660 NJ 1660 NJ 1660 3170
preplace netloc microblaze_0_axi_periph_M11_AXI 1 4 1 1260
preplace netloc microblaze_0_axi_periph_M10_AXI 1 4 4 N 1010 NJ 1010 2350J 1000 2710J
preplace netloc btnc_1 1 0 1 NJ
preplace netloc Net1 1 8 1 NJ
preplace netloc d_axi_i2s_audio_0_SDATA_O 1 8 1 NJ
preplace netloc microblaze_0_debug 1 5 1 N
preplace netloc microblaze_0_axi_periph_M09_AXI 1 4 4 NJ 990 NJ 990 NJ 990 2720
preplace netloc pixel_eth_clk_gen_clk_out1 1 1 7 200J 400 NJ 400 NJ 400 NJ 400 NJ 400 2340J 450 2760
preplace netloc microblaze_0_axi_dp 1 3 4 880 300 NJ 300 NJ 300 2230
preplace netloc pixel_eth_clk_gen_clk_out2 1 1 7 210J 1350 NJ 1350 780J 1540 NJ 1540 NJ 1540 NJ 1540 2710
preplace netloc axi_ethernet_0_fifo_AXI_STR_TXC 1 7 1 2820
preplace netloc axi_ethernet_0_interrupt 1 3 6 930 2080 NJ 2080 NJ 2080 NJ 2080 NJ 2080 3210
preplace netloc axi_ethernet_0_fifo_mm2s_prmry_reset_out_n 1 7 1 2830
preplace netloc axi_ethernet_0_fifo_AXI_STR_TXD 1 7 1 2830
preplace netloc video_aux_tx_channel_out_n 1 8 1 NJ
preplace netloc axi_ethernet_0_phy_rst_n 1 8 1 NJ
preplace netloc one_dout 1 7 2 2830 1250 3220J
preplace netloc xadc_wiz_0_ip2intc_irpt 1 3 3 920 1570 NJ 1570 1680
preplace netloc rst_mig_7series_0_100M_mb_reset 1 3 3 820J 500 1350 500 1740J
preplace netloc btnd_1 1 0 1 NJ
preplace netloc microblaze_0_axi_periph_M06_AXI 1 4 1 1230
preplace netloc axi_ethernet_0_fifo_mm2s_cntrl_reset_out_n 1 7 1 2820
preplace netloc video_aux_tx_channel_out_p 1 8 1 NJ
preplace netloc sysclk_1 1 0 8 0J 220 NJ 220 NJ 220 NJ 220 NJ 220 NJ 220 NJ 220 2810J
preplace netloc qspi_flash_clk_gen_locked 1 2 1 430
preplace netloc video_lnk_tx_lane_n 1 8 1 NJ
preplace netloc video_mm2s_introut 1 3 6 890 2070 NJ 2070 NJ 2070 NJ 2070 NJ 2070 3170
preplace netloc microblaze_0_axi_periph_M07_AXI 1 4 4 N 950 NJ 950 2250J 980 2710J
preplace netloc xlconstant_0_dout 1 8 1 3220
preplace netloc video_vga_pRed 1 8 1 NJ
preplace netloc video_lnk_tx_lane_p 1 8 1 NJ
preplace netloc microblaze_0_axi_periph_M19_AXI 1 4 4 1310 210 NJ 210 NJ 210 2780J
preplace netloc microblaze_0_M_AXI_DC 1 6 1 2280
preplace netloc axi_mem_intercon_M00_AXI 1 7 1 2740
preplace netloc axi_gpio_0_gpio_io_o 1 8 1 NJ
preplace netloc axi_dma_0_s2mm_introut 1 3 4 910 1610 NJ 1610 NJ 1610 2220
preplace netloc microblaze_0_intr 1 4 1 1360
preplace netloc microblaze_0_axi_periph_M15_AXI 1 4 4 1240J 160 NJ 160 NJ 160 2770
preplace netloc microblaze_0_axi_periph_M05_AXI 1 4 1 1290
preplace netloc userio_ip2intc_irpt 1 3 3 940 1630 NJ 1630 1690
preplace netloc axi_ethernet_0_fifo_s2mm_prmry_reset_out_n 1 7 1 2800
levelinfo -pg 1 -20 110 320 610 1080 1550 2000 2520 3010 3250 -top 0 -bot 2520
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""

