###############################################################################
# User options
###############################################################################

#Platform name
## TySOM-3-ZU7
#set platform_name "TySOM_3_ZU7"
#set platform_name "TySOM_3_ZU7_FMC1_FMC_ADAS"

##TySOM-2-7Z100
#set platform_name "TySOM_2_7Z100"
#set platform_name "TySOM_2_7Z100_FMC2_FMC_ADAS"
#set platform_name "TySOM_2_7Z100_FMC3_FMC_ADAS"
#set platform_name "TySOM_2_7Z100_FMC2_FMC_VISION_FMC3_FMC_ADAS"

##TySOM-2-7Z045
#set platform_name "TySOM_2_7Z045"
#set platform_name "TySOM_2_7Z045_FMC2_FMC_ADAS"
#set platform_name "TySOM_2_7Z045_FMC3_FMC_ADAS"
#set platform_name "TySOM_2_7Z045_FMC2_FMC_VISION_FMC3_FMC_ADAS"

##TySOM-2A-7Z030
#set platform_name "TySOM_2A_7Z030"
#set platform_name "TySOM_2A_7Z030_FMC_ADAS"

##TySOM-1-7Z030
#set platform_name "TySOM_1_7Z030"

if {![info exists platform_name]} {
	puts "ERROR: platform_name variable is not set."
	puts "INFO: Open write_dsa.tcl file and set correct platform name at the beginning of the script."
	puts "------EXIT------"
	return 1
}

#Xilinx path
#set APPROOT /edatools/Xilinx/SDx/2017.4

if {![info exists APPROOT]} {
	puts "ERROR: APPROOT variable is not set."
	puts "INFO: Open write_dsa.tcl file and set path to the SDx tool in 37 line."
	puts "------EXIT------"
	return 1
}

# Set directory from which the program was launched and project directory
# This is a global 
set run_dir [pwd]

#user specified options
set rel_dir [pwd]
set out_dir [pwd]
set vivado_proj_dir [file join $run_dir ""]
set cfg_path ""
set vendor ""
set version "0.0"
set desc ""
set vivado_proj "${vivado_proj_dir}/${platform_name}.xpr"
set bdName ""
set runName "None"
set configs [list]
set sw_pfm ""
set hw_pfm ""
set hw_pfm_tcl "${vivado_proj_dir}/${platform_name}_pfm.tcl"
set samples_dir ""
set prebuilt_hw ""
set prebuilt_proj ""
set sd_files []
set app_list [list]

if {![file exists $vivado_proj]} {
	puts "ERROR: $vivado_proj file does not exists in you Vivado project directory."
	puts "INFO: Please go to your Vivado project directory."
	puts "------EXIT------"
	return 1
}

if {![file exists $hw_pfm_tcl]} {
	puts "ERROR: $hw_pfm_tcl file does not exists in you Vivado project directory."
	puts "INFO: Please copy it from Aldec GitHub https://github.com/Aldecinc/TySOM into your Vivado project directory."
	puts "------EXIT------"
	return 1
}

###############################################################################
# Globals
###############################################################################

# Associative array containing shared global data
array set apc {}

proc apc_set_global {global_param global_value} {
  global apc

  set apc($global_param) $global_value
}

proc apc_get_global {global_param} {
  global apc
  return $apc($global_param)
}

#set APPROOT [lindex $argv 0]
apc_set_global APCC_COMMAND_NAME "create_dsa"

# SDSoC global settings for pre- and post-limited access 1 release

apc_set_global APCC_COPYRIGHT "(c) Copyright 2012-2017 Xilinx, Inc. All Rights Reserved."
apc_set_global APCC_VERSION "[apc_get_global APCC_COMMAND_NAME] 2017.4 [exec sdsbuildinfo]"
apc_set_global APCC_START_TIME [clock format [clock seconds]]

# Save the command line
set arg_list [apc_get_global APCC_COMMAND_NAME]
set argnum 0
foreach arg $argv {
  if {$argnum > 0 } {
    lappend arg_list $arg
  }
  incr argnum
}
apc_set_global APCC_COMMAND_LINE $arg_list

proc print_standard_header_simple {fp} {
  puts $fp "#[apc_get_global APCC_COPYRIGHT]"
  puts $fp "#-----------------------------------------------------------"
  puts $fp "# Tool version  : [apc_get_global APCC_VERSION]"
  puts $fp "# Start time    : [apc_get_global APCC_START_TIME]"
  puts $fp "# Command line  : [apc_get_global APCC_COMMAND_LINE]"
  puts $fp "#-----------------------------------------------------------"
}

proc print_standard_header {fp} {
  puts $fp "#[apc_get_global APCC_COPYRIGHT]"
  puts $fp "#-----------------------------------------------------------"
  puts $fp "# Tool version  : [apc_get_global APCC_VERSION]"
  puts $fp "# Start time    : [apc_get_global APCC_START_TIME]"
  puts $fp "# Command line  : [apc_get_global APCC_COMMAND_LINE]"
  puts $fp "# Log file      : [apc_get_global APCC_LOG]"
  puts $fp "# Journal file  : [apc_get_global APCC_JOURNAL]"
  puts $fp "#-----------------------------------------------------------"
  puts $fp ""
}

proc apc_is_windows {} {
  global tcl_platform

  if {[string equal -nocase $tcl_platform(platform) "windows"]} {
    return 1
  }
  return 0
}

###############################################################################
# Output logging and command journaling
###############################################################################
set log_enabled     0
set journal_enabled 0
proc log_open {log_name} {
  global fp_log log_enabled

  set fp_log [open ${log_name} w]
  set log_enabled 1
  print_standard_header $fp_log
}

proc log_puts {log_text} {
  global fp_log log_enabled

  if {$log_enabled} {
    puts $fp_log $log_text
  }
}

proc log_close {} {
  global fp_log log_enabled

  if {$log_enabled} {
    close $fp_log
  }
  set log_enabled 0
}

proc journal_open {journal_name} {
  global fp_journal journal_enabled

  set fp_journal [open ${journal_name} w]
  print_standard_header $fp_journal
  set journal_enabled 1
}

proc journal_puts {journal_text} {
  global fp_journal journal_enabled

  if {$journal_enabled} {
    puts $fp_journal $journal_text
  }
}

proc journal_close {} {
  global fp_journal journal_enabled

  if {$journal_enabled} {
    close $fp_journal
  }
  set journal_enabled 0
}

# Output message to stdout and log
proc puts_command {msg_text} {
  journal_puts "# $msg_text"
  log_puts "$msg_text"
  puts $msg_text
}

###############################################################################
# Message strings
###############################################################################



proc MSG_STRING {msg_type msg_id msg_text} {
  puts_command "$msg_type: \[-$msg_id\] $msg_text"
}

proc MSG_DEBUG {msg_id msg_text} {
  MSG_STRING "DEBUG" $msg_id $msg_text
}

proc MSG_STATUS {msg_id msg_text} {
  MSG_STRING "STATUS" $msg_id $msg_text
}

proc MSG_INFO {msg_id msg_text} {
  MSG_STRING "INFO" $msg_id $msg_text
}

proc MSG_CRITICAL_WARNING {msg_id msg_text} {
  MSG_STRING "CRITICAL WARNING" $msg_id $msg_text
}

proc MSG_WARNING {msg_id msg_text} {
  MSG_STRING "WARNING" $msg_id $msg_text
}

proc MSG_ERROR {msg_id msg_text} {
  MSG_STRING "ERROR" $msg_id $msg_text
}

###############################################################################
# Start up
###############################################################################
proc sdscc_start_message {} {
    #print_standard_header_simple stdout
}

proc sdscc_finish_message {} {
    set time_string [clock format [clock seconds]]
    set finish_string "[apc_get_global APCC_COMMAND_NAME] completed at $time_string"
    apc_set_global APCC_FINISH_TIME $time_string
    apc_set_global APCC_FINISH_STRING $finish_string
    
    puts $finish_string
}

sdscc_start_message
 
# Set XILINX_XD
apc_set_global APCC_PATH_XILINX_XD $APPROOT
MSG_INFO 5406 "Using user-defined path for XILINX_XD environment variable [apc_get_global APCC_PATH_XILINX_XD]"

#command line option globals
apc_set_global APCC_OPT_SW_BLOCK      "-sds-sw"
apc_set_global APCC_OPT_END_BLOCK     "-sds-end"
set SDS_SW_BLOCK    [apc_get_global APCC_OPT_SW_BLOCK]
set SDS_END_BLOCK   [apc_get_global APCC_OPT_END_BLOCK]

###############################################################################T
# Cleanup
###############################################################################
proc sdscc_on_exit {exit_code} {
  global log_enabled

  # Close log files
  if { $log_enabled } {
    puts "[apc_get_global APCC_COMMAND_NAME] log file saved as [apc_get_global APCC_LOG]"
    log_puts "[apc_get_global APCC_COMMAND_NAME] log file saved as [apc_get_global APCC_LOG]"
  }
  sdscc_finish_message
  log_puts [apc_get_global APCC_FINISH_STRING]
  journal_puts "# [apc_get_global APCC_FINISH_STRING]"

  log_close
  journal_close

  # exit
  puts "------EXIT------"
  #exit ${exit_code}
}

###############################################################################
# Utilities
###############################################################################

proc get_files {dir pattern} {
  # Ensure directory name is correct for platform
  set dir [string trimright [file join [file normalize $dir] { }]]

  set fileList {}
  foreach fileName [glob -nocomplain -type f -directory $dir $pattern] {
    lappend fileList $fileName
  }
  foreach dirName [glob -nocomplain -type d -directory $dir *] {
    set subDirList [get_files $dirName $pattern]
    foreach subDirFile $subDirList {
      lappend fileList $subDirFile
    }
  }
  return $fileList
}

proc copy_file_force {source dest} {
  set status [catch {file copy -force $source $dest} result]
  if {$status != 0} {
    if {[apc_is_windows] && [string length $dest] > 240} {
      MSG_ERROR 5431 "Cannot copy '$source' to '$dest' because the destination is in use or not writable, the destination path does not exist, or path names are too long (ensure all path names for the SDSoC installation and design folders are as short as possible)."
    } else {
      MSG_ERROR 5432 "Cannot copy '$source' to '$dest' because the destination is in use or not writable, the destination path does not exist, or another error has occurred."
    }
    sdscc_on_exit 1
  }
}

proc copy_file_forcex {source dest} {
  journal_puts "cp $source $dest"
  set status [catch {file copy -force $source $dest} result]
  if {$status != 0} {
    if {[apc_is_windows] && [string length $dest] > 240} {
      MSG_ERROR 5433 "Cannot copy '$source' to '$dest' because the destination is in use or not writable, the destination path does not exist, or path names are too long (ensure all path names for the SDSoC installation and design folders are as short as possible)."
    } else {
      MSG_ERROR 5434 "Cannot copy '$source' to '$dest' because the destination is in use or not writable, the destination path does not exist, or another error has occurred."
    }
    sdscc_on_exit 1
  }
}

proc delete_directory {mydirectory} {
  set status [catch {file delete -force $mydirectory} result]
  if {$status != 0} {
    MSG_ERROR 5435 "Cannot delete directory '$mydirectory' because it is being used. Ensure all files under it are closed and the directory is not being used."
    sdscc_on_exit 1
  }
}

proc delete_file {myfile} {
  set status [catch {file delete -force $myfile} result]
  if {$status != 0} {
    MSG_ERROR 5436 "Cannot delete file '$myfile' because it is being used. Ensure the file is closed and is not being used."
    sdscc_on_exit 1
  }
}

# source and dest both must be file path names, not directories.
# copy file by reading it and writing it to the destination, rather
# than use "file copy", which preserves the file permission (e.g. read-only),
# which can be a problem later if you need to write the file again.
proc copy_file_force_writeable {source dest} {
  if {! [file exists $source]} {
      MSG_ERROR 5437 "Cannot copy '$source' to '$dest' because the source does not exist."
    sdscc_on_exit 1
  }
  if {[file exists $dest]} {
    delete_file $dest
  }
  set sp [open $source r]
  set dp [open $dest w]
  # make exact copy of the file except metadata (e.g. file permissions)
  fconfigure $sp -translation binary
  fconfigure $dp -translation binary
  fcopy $sp $dp
  close $sp
  close $dp
}

###############################################################################
# Command execution
###############################################################################
# Execute cd command; wrapper allows the command to be captured
proc cd_command {cd_path} {
  journal_puts "cd $cd_path"
  if {! [file exists $cd_path]} {
    MSG_ERROR 5448 "Exiting [apc_get_global APCC_COMMAND_NAME] : Error when calling 'cd $cd_path'"
    sdscc_on_exit
    exit 1
  }
  cd $cd_path
}

proc mkdir_command {mkdir_path} {
    journal_puts "mkdir $mkdir_path"

    file mkdir $mkdir_path
}

proc rename_command {old new} {
    journal_puts "mv $old $new"
    
    file rename -force $old $new
}

# Run a command and optionally tee output to a file
# (without using the Linux tee command for Windows
# portability). Returns 0 if successful, otherwise
# non-zero, but this is NOT the exit code of the
# command that was run.
#
# command      : command to run
# always_print : 1 always send stdout+stderr to screen
#              : 0 verbose option controls whether to send stdout to screen
# args         : optional proc to process error code (from XidanePass);
#                the name "args" is treated as optional to the calling function,#                and any other name makes it a required argument

proc execpipe_command {command always_print args} {
  global verbose

  journal_puts $command
  log_puts $command

  set error_detected 0
  set enable_print 0
  set is_hls_compilation_error 0
  set is_hls_compilation_warning 0
  set skip_pragma_warning 0
  set in_clang_pragma_warning 0
  set pragma_warning_buffer ""
  if {$verbose} {
    puts $command
  }
  if {$verbose || $always_print} {
    set enable_print 1
  }

  # stderr sent to stdout, so pipe will have both. Note that messages
  # sent to stderr can cause the catch when you close the pipe
  # to return error (return code 1). This should mean only errors that
  # cause an application to exit will trigger the catch.

  set pipe_redirect "2>@1"
  if { [catch { open "| $command $pipe_redirect" "r+"} pipe] } {
    MSG_ERROR 5449 "Cannot execute '$command'"
    sdscc_on_exit 1
  }
  fconfigure $pipe -buffering none
  while { [gets $pipe data] >= 0 } {

    # if errors haven't been detected yet, check to see if the
    # current line looks like it contains an error. If errors
    # started, then start enabling error output even if 
    if { ! $enable_print && ! $error_detected } {
      # clang_wrapper warnings and errors we care about start on a
      # line containing the string SDSCC.
      if { [string first "(SDSoC)" $data] >= 0 } {
        set error_detected 1
      # Vivado HLS errors begin with @E
      } elseif { [string first "@E " $data] >= 0 } {
        set error_detected 1
        if { [string first "Compilation errors found" $data] >= 0 } {
          set is_hls_compilation_error 1
        }
      } elseif { [string first "@W " $data] >= 0 } {
        if { [string first "improper streaming access" $data] >= 0 } {
          set error_detected 1
          set is_hls_compilation_warning 1
        }
      # Other SDSoC tool errors
      } elseif { [string first "ERROR" $data] >= 0 } {
        set error_detected 1
      }
    }

    # =============================================================
    # SDSoC pragma unrecognized by gcc or other parser frontends
    # can be filtered out. Skip HLS pragma warnings also.
    # Note that the message formats used by various tools differ,
    # so you need to handle each one. Depending on what tool is
    # called, you may want to ignore certain unknown pragma warnings,
    # not necessarily all of them. For example, for clang frontends,
    # ignore unknown pragma warnings for HLS pragmas, but don't ignore
    # SDSoC pragma warnings which could be typos.
    # =============================================================
    # GCC warnings about unknown pragmas look like this (this is for
    # a .c file which includes a .h containing HLS pragmas - note that
    # warning line contains the pragma plus the warning type
    # -Wunknown-pragmas, the source text, and a line with a carat ^).
    #
    # Once you've read the warning, the same line contains the pragma
    # and it's possible to decide if the message should be skipped.
    #
    #   In file included from /proj/fv7/tshui/xidane/test/test_mmult_datasize/mmult.cpp:4:0:
    #   /proj/fv7/tshui/xidane/test/test_mmult_datasize/mmult_accel.h:9:0: warning: ignoring #pragma APF data [-Wunknown-pragmas]
    #   #pragma APF data copy(in_A[0:dim1*dim1])
    #   ^
    # =============================================================
    # In contrast, clang-based tool (sdslint, pragma_gen, et al) warnings
    # are slightly different (don't contain the pragma in the warning line but
    # includes the warning type -Wunknown-pragmas, the source text, and a line
    # with a carat ^).
    #
    # Once you've read the warning, you need to read the next line to
    # know the pragma and decide if the message should be skipped.
    #
    #   C:\Users\tshui\ws_demo\apf_mmultadd\src\mmult.cpp:10:9: warning: unknown pragma ignored [-Wunknown-pragmas]
    #   #pragma HLS INLINE self
    #           ^
    # =============================================================

    # suppress: 1 warning and 1 error generated.
    if { [string first "generated." $data] >= 0 } {
        continue
    }
    # suppress: warning: clang: 'linker' input unused
    # suppress: warning: clang++: 'linker' input unused
    if { [string first "warning: clang: 'linker' input unused" $data] >= 0 } {
        continue
    }
    if { [string first "warning: clang++: 'linker' input unused" $data] >= 0 } {
        continue
    }

    if { $always_print && [string first "In file included from" $data] >= 0 } {
        continue
    }
    if { [string first "-Wunknown-pragmas" $data] >= 0 } {

      set pragma_warning_buffer ""

      # gcc -Wunknown-pragmas (pragma is known on the same line)
      if { [string first "#pragma SDS" $data] >= 0 &&
         [string first "(SDSoC)" $data] < 0 } {
        set skip_pragma_warning 1
        continue
      } elseif {$always_print && ([string first "#pragma HLS" $data] >= 0
                               || [string first "#pragma AP" $data] >= 0) } {
        set skip_pragma_warning 1
        continue
      } elseif { [string first "unknown pragma ignored" $data] >= 0 } {

      # clang -Wunknown-pragmas (need to buffer the warning and read next line)
      # print the buffer later if you decide it needs to be

        set in_clang_pragma_warning 1
        set pragma_warning_buffer $data
        continue
      }

    }

    # if this is a clang warning, read the pragma and decided if we should
    # pass through the warning or not. If yes, flush the buffer containing
    # the warning message. If no, set a flag to skip the pragma warning.
    if { $in_clang_pragma_warning && [string first "#pragma" $data] >= 0 } {
      if { [string first "HLS" $data] >= 0
        || [string first "AP " $data] >= 0
        || [string first "APF" $data] >= 0 } {
        set skip_pragma_warning 1
      } else {
        if {$enable_print} {
          puts $pragma_warning_buffer
        }
        log_puts $pragma_warning_buffer
        set pragma_warning_buffer ""
      }
    }

    # print output if enabled or triggered by an error
    if {$enable_print || $error_detected} {
      # llvm-link
      if { [string first "link error" $data] >= 0 } {
        MSG_ERROR 5450 "Error detected : $data"
      } elseif {! $skip_pragma_warning } {
        puts $data
      }
    }

    # Text is always printed to the log
    if {! $skip_pragma_warning } {
      log_puts $data
    }

    # Look for string to terminate printing of error and
    # related text
    if { $error_detected } {
      # For HLS compilation errors, keep printing text until exit
      # (it's failed and will write out a lot of error text).
      # For warnings, print only the warning message.
      if { $is_hls_compilation_error } {
        continue
      }
      if { $is_hls_compilation_warning } {
        set error_detected 0
        set is_hls_compilation_warning 0
      }
      # clang_wrapper warnings and errors end on a line
      # containing a carat ^ under the error.
      if { [string first "^" $data] >= 0 } {
        set error_detected 0
      }
    } elseif { $skip_pragma_warning } {
      if { [string first "^" $data] >= 0 } {
        set skip_pragma_warning 0
      }
    }
  }
  # if there is an error in execution, when you close the pipe,
  # $err contains "child process exited abnormally". It hasn't
  # been printed yet, though. The "catch" doesn't return the
  # actual exit code - it returns 0 or 1.
  set ec [catch {close $pipe} err]
  if { $ec } {
    # if there is a handler, let it perform more processing and
    # and exit if it returns a non-zero value. It doesn't process
    # the actual exit code from the command, though.
    if {$args ne ""} {
      if { ! [$args] } {
        return $ec
      }
    }

    # output error message from close the pipe
    # $err contains "child process exited abnormally", which seems to
    # confuse people, so don't print that string
    # puts_command $err
    MSG_ERROR 5451 "Exiting [apc_get_global APCC_COMMAND_NAME] : Error when calling '$command'"
    # clean up and close log files (if open)
    sdscc_on_exit 1
  }
  return 0
}

# Execute command with optional processing of the exit code
# optional last arg: procedure name for exit code handler
proc exec_command {command args} {
  if {$args ne ""} {
    execpipe_command $command 0 $args
  } else {
    execpipe_command $command 0
  }
}

# This proc always prints the stdout/stderr of the called command,
# including a log file if enabled.
proc exec_command_and_print {command} {
    global dev_run_log
    # force stdout + stderr to print
    execpipe_command $command 1
}

###############################################################################
# XML interface
###############################################################################

proc xpath_get_value {xml_file xpath} {
  set xsl_file [file join [apc_get_global APCC_PATH_XILINX_XD] scripts xdcc xpathValueOf.xsl]
  set command "xsltproc --stringparam xpath \"$xpath\" $xsl_file $xml_file"
  #puts "COMMAND $command"
  # Escape opening brackets so they don't get evaluated by Tcl interpreter
  regsub -all {\[} $command "\\\[" escaped_command
  #puts "ESCAPED COMMAND $escaped_command"
  catch { eval exec $escaped_command 2>@ stderr } result
  #puts "RESULT $result"
  if {[string equal -nocase $result "child process exited abnormally"]} {
    return ""
  }
  return $result
}

proc find_bd {path {name *.bd}} {
    global platform_name

    set bds [get_files $path ${name}]
    if {[llength $bds] == 0} {
	MSG_ERROR 5456 "Error! Could not find any block design files ($name) from directory '$path'"
	sdscc_on_exit 1
    } elseif {[llength $bds] > 1} {
	#see if one is named platform.bd
	foreach bd $bds {
	    if {[string equal [file tail $bd] "${platform_name}.bd"]} {
		return [file tail $bd]
	    }
	}
	MSG_ERROR 5457 "Error! More than one block design file (*.bd) found, but none named '${platform_name}.bd' not sure which one is the top"
	MSG_ERROR 5458 "Either use only one *.bd file in your platform vivado project, or make sure the top block design file is named '${platform_name}.bd', or use -bd <name.bd> to specify the one to use"
	sdscc_on_exit 1
    } else {
	return $bds
    }
}

###############################################################################
# Main functions
###############################################################################
proc create_dsa {} {
    global vivado_proj hw_pfm_tcl tmp_dir run_dir vivado_script platform_name out_dir hw_pfm verbose redirect upgrade_ps upgrade_ips bdName runName no_copy
    MSG_INFO 5409 "Creating hardware platform XML file"

    #get info about run type
    if {![string equal $runName "None"]} {
	set xpath "/Project/Runs/Run\[@Id='$runName'\]/Strategy/Step\[@Id='synth_design'\]/@Id"
	set synth [xpath_get_value $vivado_proj $xpath]

	set xpath "/Project/Runs/Run\[@Id='$runName'\]/Strategy/Step\[@Id='route_design'\]/@Id"
	set route [xpath_get_value $vivado_proj $xpath]
    }

    set xpr_name [file tail $vivado_proj]

    if {$no_copy} {
	set proj_location $vivado_proj
    } else {
	set proj_location [file join $tmp_dir "vivado" $xpr_name]
    }
    
    if {[string equal $bdName ""]} {
	set bd_name [find_bd [file dirname $proj_location]]
    } else {
	set bd_name [find_bd [file dirname $proj_location] $bdName]
    }

    set pfm_file "${platform_name}.hpfm"
    set dsa_file "${platform_name}.dsa"
    
    cd_command $tmp_dir

    set fp [open "create_hw_pfm.tcl" w]
    #open bd
    puts $fp "open_bd_design \[get_files *$bd_name\]"

    if {$upgrade_ps} {
	puts $fp "upgrade_ip -quiet \[get_bd_cells * -quiet -hierarchical -filter \{VLNV =~ \"xilinx.com:ip:processing_system7:*\"\}\]"
	puts $fp "upgrade_ip -quiet \[get_bd_cells * -quiet -hierarchical -filter \{VLNV =~ \"xilinx.com:ip:zynq_ultra_ps_e:*\"\}\]"
    }
    if {$upgrade_ips} {
	puts $fp "upgrade_ip \[get_ips\]"
    }
    
    #check IP status
    puts $fp "set fp \[open \"locked.dat\" \"w\"\]"
    puts $fp "set ips \[get_ips\]"
    puts $fp "foreach ip \$ips \{"
    puts $fp "    set status \[get_property is_locked \$ip\]"
    puts $fp "    if \{\$status\} \{"
    puts $fp "        puts \$fp \"\$ip\""
    puts $fp "    \}"
    puts $fp "\}"
    puts $fp "close \$fp"
    puts $fp ""
    
    #source tcl scripts
    puts $fp "source -notrace $vivado_script"
    puts $fp "source -notrace $hw_pfm_tcl"
    
    puts $fp "set tmp_vendor \[lindex \[array get sdsoc::name vendor\] 1\]"
    puts $fp "set tmp_name \[lindex \[array get sdsoc::name name\] 1\]"
    puts $fp "set tmp_version \[lindex \[array get sdsoc::name version\] 1\]"
    
    puts $fp "if \{\[string equal \"\" \[get_property dsa.vendor   \[current_project\]\]\]\} \{ set_property dsa.vendor   \"\${tmp_vendor}\"  \[current_project\] \}"
    puts $fp "if \{\[string equal \"\" \[get_property dsa.board_id \[current_project\]\]\]\} \{ set_property dsa.board_id \"\${tmp_name}\"    \[current_project\] \}"
    puts $fp "if \{\[string equal \"\" \[get_property dsa.name     \[current_project\]\]\]\} \{ set_property dsa.name     \"\${tmp_name}\"    \[current_project\] \}"
    puts $fp "if \{\[string equal \"0.0\" \[get_property dsa.version  \[current_project\]\]\]\} \{ set_property dsa.version  \"\${tmp_version}\" \[current_project\] \}"
    
    puts $fp "set_property dsa.hpfm_file \"${pfm_file}\" \[current_project\]"

  # Hack to allow a DSA to be created in pre-synth state. This is done 
  # to generate an HDF file at least.
  puts $fp "generate_target all \[get_files $bd_name\]"
  
    if {[string equal $runName "None"]} {
	puts $fp "set_property dsa.platform_state \"pre_synth\" \[current_project\]"
	puts $fp "write_dsa -force -unified ${dsa_file}"
	puts $fp "validate_dsa ${dsa_file} -verbose"
    } elseif {[string equal $route "route_design"]} {
	puts $fp "set_property dsa.platform_state \"impl\" \[current_project\]"
	puts $fp "open_run $runName"
	puts $fp "write_dsa_rom -v"
	puts $fp "write_dsa -force -unified -include_bit ${dsa_file}"
	puts $fp "validate_dsa ${dsa_file} -verbose"
    } elseif {[string equal $synth "synth_design"]} {
	puts $fp "set_property dsa.platform_state \"synth\" \[current_project\]"
	puts $fp "open_run $runName"
	puts $fp "write_dsa -force -unified ${dsa_file}"
	puts $fp "validate_dsa ${dsa_file} -verbose"
    } else {
	MSG_ERROR 2 "Not sure how to call write_dsa with runName: $runName (synth: $synth, route: $route)"
	sdscc_on_exit 1
    }

    close $fp
    
    #call vivado
    set command "vivado -mode batch -notrace -source create_hw_pfm.tcl $proj_location"

    #execute command
    exec_command_and_print $command

    #open vivado log
    set log_file [open "vivado.log" r]
    set log [read $log_file]

    set to_find [list "invalid command name" "No cells matched" "ERROR"]
    
    set foundError 0
    for {set idx 0} {$idx < [llength $to_find]} {incr idx} {
	set find [lindex $to_find $idx]
	set res 0
	while {$res >= 0} {
	    #search for first 
	    set res [string first $find $log $res]
	    if {$res >= 0} {
		set foundError 1
		#find previous newline
		set bol [string last "\n" $log $res]
		if {$bol == -1} {
		    set bol 0
		} else {
		    set bol [expr $bol + 1]
		}
		#search for next newline
		set eol [expr [string first "\n" $log $res] - 1]
		set str "VIVADO: [string range $log $bol $eol]"
		log_puts $str
		puts $str
		set res [expr $res + 1]
	    }
	}
    }
    
    if { $foundError } {
	# handle error and exit if it returns a non-zero value	
	MSG_ERROR 5459 "Exiting [apc_get_global APCC_COMMAND_NAME] : Error when creating hardware platform XML file"
	MSG_ERROR 5460 "Try opening your vivado project '${vivado_proj}' and sourcing your tcl script '${hw_pfm_tcl}' manually to see the errors in your script."
	sdscc_on_exit 1
    }
    
    #check IP status
    set fp [open "locked.dat"]
    set ips [read $fp]
    if {[llength $ips] > 0} {
	MSG_ERROR 2 "The following IPs are locked in your block design:\n$ips"
	MSG_ERROR 2 "Open your Vivado project and upgrade the IPs before recreating your platform"
	sdscc_on_exit 1
    }

    #copy into out_dir
    if {[file exists $dsa_file]} {
	set out_dsa [file join $out_dir $dsa_file]
	copy_file_forcex $dsa_file $out_dsa
    } else {
	MSG_ERROR 5461 "Error creating DSA, cannot find file"
	sdscc_on_exit 1
    }

    cd_command $run_dir
}

proc create_hw_pfm {} {
    global vivado_proj hw_pfm_tcl tmp_dir run_dir vivado_script platform_name out_dir hw_pfm verbose redirect dsa upgrade_ps upgrade_ips bdName
    MSG_INFO 5410 "Creating hardware platform XML file"

    if {[string equal $bdName ""]} {
	set bd_name [find_bd [file join $tmp_dir "vivado"]]
    } else {
	set bd_name [find_bd [file join $tmp_dir "vivado"] $bdName]
    }
    set pfm_file "${platform_name}.hpfm"

    cd_command $tmp_dir

    set fp [open "create_hw_pfm.tcl" w]
    #open bd
    puts $fp "open_bd_design \[get_files *$bd_name\]"

    if {$upgrade_ps} {
	puts $fp "upgrade_ip -quiet \[get_bd_cells * -quiet -hierarchical -filter \{VLNV =~ \"xilinx.com:ip:processing_system7:*\"\}\]"
	puts $fp "upgrade_ip -quiet \[get_bd_cells * -quiet -hierarchical -filter \{VLNV =~ \"xilinx.com:ip:zynq_ultra_ps_e:*\"\}\]"
    }
    if {$upgrade_ips} {
	puts $fp "upgrade_ip \[get_ips\]"
    }

    #check IP status
    puts $fp "set fp \[open \"locked.dat\" \"w\"\]"
    puts $fp "set ips \[get_ips\]"
    puts $fp "foreach ip \$ips \{"
    puts $fp "    set status \[get_property is_locked \$ip\]"
    puts $fp "    if \{\$status\} \{"
    puts $fp "        puts \$fp \"\$ip\""
    puts $fp "    \}"
    puts $fp "\}"
    puts $fp "close \$fp"
    puts $fp ""

    #source tcl scripts
    puts $fp "source -notrace $vivado_script"
    puts $fp "source -notrace $hw_pfm_tcl"

    close $fp

    #call vivado
    set tmp_proj [file join $tmp_dir "vivado" [file tail $vivado_proj]]
    set command "vivado -mode batch -notrace -source create_hw_pfm.tcl $tmp_proj"

    #execute command
    exec_command_and_print $command

    #open vivado log
    set log_file [open "vivado.log" r]
    set log [read $log_file]

    set to_find [list "invalid command name" "No cells matched" "ERROR"]
    
    set foundError 0
    for {set idx 0} {$idx < [llength $to_find]} {incr idx} {
	set find [lindex $to_find $idx]
	set res 0
	while {$res >= 0} {
	    #search for first 
	    set res [string first $find $log $res]
	    if {$res >= 0} {
		set foundError 1
		#find previous newline
		set bol [string last "\n" $log $res]
		if {$bol == -1} {
		    set bol 0
		} else {
		    set bol [expr $bol + 1]
		}
		#search for next newline
		set eol [expr [string first "\n" $log $res] - 1]
		set str "VIVADO: [string range $log $bol $eol]"
		log_puts $str
		puts $str
		set res [expr $res + 1]
	    }
	}
    }

    if { $foundError } {
	# handle error and exit if it returns a non-zero value	
	MSG_ERROR 5462 "Exiting [apc_get_global APCC_COMMAND_NAME] : Error when creating hardware platform XML file"
	MSG_ERROR 5463 "Try opening your vivado project '${vivado_proj}' and sourcing your tcl script '${hw_pfm_tcl}' manually to see the errors in your script."
	sdscc_on_exit 1
    }

    #check IP status
    set fp [open "locked.dat"]
    set ips [read $fp]
    if {[llength $ips] > 0} {
	MSG_ERROR 2 "The following IPs are locked in your block design:\n$ips"
	MSG_ERROR 2 "Open your Vivado project and upgrade the IPs before recreating your platform"
	sdscc_on_exit 1
    }

    #copy into out_dir
    set pfm_file "${platform_name}.hpfm"
    #check if file exists
    if {[file exists $pfm_file]} {
	set hw_pfm [file join $out_dir $pfm_file]
        copy_file_forcex $pfm_file $hw_pfm
    } else {
	MSG_ERROR 5464 "Platform Tcl file '$hw_pfm_tcl' did not produce a hardware platform file."
	MSG_ERROR 5465 "Your platform tcl must create a file named '$pfm_file' in the local directory of your vivado project."
	MSG_ERROR 5466 "To do this, the following tcl API should be used: 'set pfm \[sdsoc::create_pfm $pfm_file\]'"
	sdscc_on_exit 1
    }

    cd_command $run_dir
}

#check the validity of the hpfm file
proc check_hw_pfm {} {
    global hw_pfm platform_name 

    set pass 1

    set path [file dirname $hw_pfm]
    set hw_pfm_path [file join $path "${platform_name}.hpfm"]

    #check hw_pfm
    if {![file exists $hw_pfm_path]} {
	puts "Error! Hardware platform xml file missing, expected file named '[file tail $hw_pfm_path]' located at '$hw_pfm_path'."
	set pass 0
    } else {
	## Run xmllint utility on the file
	set xmllint_cmd "xmllint -noout -schema $hw_pfm_schema $hw_pfm_path"
	if { [catch { eval exec $xmllint_cmd >@ stdout 2>@ stderr} err] } {
	    set pass 0
	}
    }

    return $pass
}

proc archive_project {} {
    global vivado_proj hw_pfm tmp_dir run_dir vivado_script platform_name out_dir local_cache

    MSG_INFO 5411 "Archiving vivado project"

    cd_command $tmp_dir

    set xpr_name [file rootname [file tail $vivado_proj]]
    set fp [open "archive_project.tcl" w]
    if {$local_cache} {
      puts $fp "set_param project.archive.preserveLocalIPCache 1"
    }
    puts $fp "archive_project ./${xpr_name}.xpr.zip -force -include_config_settings"
    close $fp

    #call vivado
    set command "vivado -mode batch -notrace -source archive_project.tcl $vivado_proj"
    exec_command_and_print $command

    #unzip archive
    set archive_dir [file join $tmp_dir "${xpr_name}.xpr.zip"]
    exec_command_and_print "unzip -o $archive_dir"
  
    rename_command $xpr_name "vivado"

    #change permissions of files
    set chmod_cmd [file normalize [exec which chmod]]
    exec_command_and_print "$chmod_cmd -R 777 vivado"

    cleanup_vivado

    #check if ipdefs dir is empty
    set file_list [glob -nocomplain -dir "${xpr_name}.ipdefs" *]
    if {[llength $file_list] == 0} {
	delete_directory "${xpr_name}.ipdefs"
    }

    cd_command [file join $tmp_dir "vivado"]

    #clean up xpr file
    set xsl_file [file join [apc_get_global APCC_PATH_XILINX_XD] scripts xsd cleanup_xpr.xsl]
    set command "xsltproc --stringparam P_PF_NM ${platform_name} -o ${xpr_name}.xpr $xsl_file ${xpr_name}.xpr"
    exec_command_and_print $command

    cd_command $run_dir
}

proc copy_proj {} {
    global vivado_proj hw_pfm tmp_dir run_dir vivado_script platform_name out_dir

    MSG_INFO 5411 "Copying vivado project"

    cd_command $tmp_dir

    set vivado_dir [file join $tmp_dir "vivado"]
    set xpr_dir [file dirname $vivado_proj]
    set xpr_name [file rootname [file tail $vivado_proj]]
    set fp [open "copy_project.tcl" w]
    puts $fp "save_project_as $xpr_name $vivado_dir -force"
    close $fp

    #call vivado
    set command "vivado -mode batch -notrace -source copy_project.tcl $vivado_proj"
    exec_command_and_print $command
  
    #change permissions of files
    set chmod_cmd [file normalize [exec which chmod]]
    exec_command_and_print "$chmod_cmd -R 777 vivado"

    cleanup_vivado

    cd_command [file join $tmp_dir "vivado"]

    #clean up xpr file
    set xsl_file [file join [apc_get_global APCC_PATH_XILINX_XD] scripts xsd cleanup_xpr.xsl]
    set command "xsltproc --stringparam P_PF_NM ${platform_name} -o ${xpr_name}.xpr $xsl_file ${xpr_name}.xpr"
    exec_command_and_print $command

    cd_command $run_dir
}

proc cleanup_vivado {} {
    global vivado_proj hw_pfm tmp_dir run_dir vivado_script platform_name out_dir
    #clean up generated files/folders

    delete_file [file join $tmp_dir "vivado" "vivado.log"]
    delete_file [file join $tmp_dir "vivado" "vivado.jou"]
    delete_file [file join $tmp_dir "vivado" "archive_project_summary.txt"]

    #stop deleting the cache, write_dsa will including it in the platform for faster build times
    #delete_directory [file join $tmp_dir "vivado" "${platform_name}.cache"]

    delete_directory [file join $tmp_dir "vivado" "${platform_name}.hw"]
}

proc start_gui {} {
    global APPROOT cfg_path internal no_xpr pcie
    set path_to_jar [file join $APPROOT "bin" "sdspfm.jar"]
    set java_cmd "java "
    set java_args "-Xms64m -Xmx512m -jar $path_to_jar"

    if {$internal} {
	set java_args "$java_args INTERNAL"
    } else {
	set java_args "$java_args sdspfm"
    }

    if {$no_xpr && $pcie} {
	set java_args "$java_args BOTH"
    } elseif {$no_xpr} {
	set java_args "$java_args DSA"
    } elseif {$pcie} {
	set java_args "$java_args PCIE"
    } else {
	set java_args "$java_args XPR"
    }

    if {[file exists $cfg_path]} {
	set java_args "$java_args $cfg_path"
    }
    exec_command_and_print "${java_cmd} ${java_args}"
}

proc start_builder {} {
    global APPROOT cfg_path
    set path_to_jar [file join $APPROOT "bin" "sdspfbuilder.jar"]
    set java_cmd "java "
    set java_args "-Xms64m -Xmx512m -jar $path_to_jar"

    set java_args "$java_args [file join $APPROOT bin]"

    exec_command_and_print "${java_cmd} ${java_args}"
}

proc start_library {} {
    global APPROOT cfg_path
    set path_to_jar [file join $APPROOT "bin" "sdslib.jar"]
    set java_cmd "java "
    set java_args "-Xms64m -Xmx512m -jar $path_to_jar"

    #add path to SDSoC IP library
    set java_args "$java_args $APPROOT"

    #find Vivado bin directory
    set VIVADO [file dirname [file normalize [exec which vivado]]]
    #go up one directory to main Vivado directory
    set VIVADO [file dirname $VIVADO]
    set java_args "$java_args $VIVADO"

    exec_command_and_print "${java_cmd} ${java_args}"
}

proc format_path {isRelative path} {
    global rel_dir

    if {![string equal $path ""]} {
	if {$isRelative} {
	    set absolute [file join $rel_dir $path]
	} else {
	    set absolute [file normalize $path]
	}
	return $absolute
    } else {
	return ""
    }
}

proc load_cfg {} {
    global cfg_path out_dir vivado_proj hw_pfm_tcl configs samples_dir bdName runName platform_name vendor version desc

    set xpath "/SDSoCPlatformConfig/@vendor"
    set vendor [xpath_get_value $cfg_path $xpath]

    set xpath "/SDSoCPlatformConfig/@name"
    set platform_name [xpath_get_value $cfg_path $xpath]

    set xpath "/SDSoCPlatformConfig/@version"
    set version [xpath_get_value $cfg_path $xpath]

    set xpath "/SDSoCPlatformConfig/@description"
    set desc [xpath_get_value $cfg_path $xpath]

    set xpath "/SDSoCPlatformConfig/@pathType"
    set path_type [xpath_get_value $cfg_path $xpath]
    if {[string equal $path_type "relative"]} {
	set isRelative 1
    } else {
	set isRelative 0
    }

    set xpath "/SDSoCPlatformConfig/@bd"
    set bdName [xpath_get_value $cfg_path $xpath]

    set xpath "/SDSoCPlatformConfig/@run"
    set val [xpath_get_value $cfg_path $xpath]
    if {![string equal $val ""]} {
	set runName $val
    }

    set xpath "/SDSoCPlatformConfig/@output"
    set out_dir [format_path $isRelative [xpath_get_value $cfg_path $xpath]]

    set xpath "/SDSoCPlatformConfig/@vivado"
    set vivado_proj [format_path $isRelative [xpath_get_value $cfg_path $xpath]]

    set xpath "/SDSoCPlatformConfig/@pfmtcl"
    set hw_pfm_tcl [format_path $isRelative [xpath_get_value $cfg_path $xpath]]

    set xpath "/SDSoCPlatformConfig/@samples"
    set samples_dir [format_path $isRelative [xpath_get_value $cfg_path $xpath]]

    set xpath "count(/SDSoCPlatformConfig/Proc)"
    set procCount [xpath_get_value $cfg_path $xpath]

    #loop over processors
    for {set procIdx 1} {$procIdx <= $procCount} {incr procIdx} {
	set xpath "/SDSoCPlatformConfig/Proc\[$procIdx\]/@type"
        set arch [xpath_get_value $cfg_path $xpath]

	#ignore cores for now
	set xpath "/SDSoCPlatformConfig/Proc\[$procIdx\]/@cores"
        set cores [xpath_get_value $cfg_path $xpath]
        if {![string equal $cores ""]} {
	    set cores_split [split $cores ":"]
	}

	set xpath "count(/SDSoCPlatformConfig/Proc\[$procIdx\]/OS)"
	set OScount [xpath_get_value $cfg_path $xpath]

	#loop over OSes
	for {set osIdx 1} {$osIdx <= $OScount} {incr osIdx} {
	    set os_map [dict create]
	    set inc [list]
	    set lib [list]
	    set qemu_args [list]
	    set freertos_lib ""
	    set freertos_inc ""

	    set xpath "/SDSoCPlatformConfig/Proc\[$procIdx\]/OS\[$osIdx\]/@type"
	    set OStype [xpath_get_value $cfg_path $xpath]
	    set os [string tolower $OStype]

	    set xpath "/SDSoCPlatformConfig/Proc\[$procIdx\]/OS\[$osIdx\]/@config"
	    set cfg_name [xpath_get_value $cfg_path $xpath]

	    set xpath "/SDSoCPlatformConfig/Proc\[$procIdx\]/OS\[$osIdx\]/@id"
	    set id [xpath_get_value $cfg_path $xpath]
	  
	    set xpath "/SDSoCPlatformConfig/Proc\[$procIdx\]/OS\[$osIdx\]/@runtime"
	    set rt [xpath_get_value $cfg_path $xpath]

	    set xpath "/SDSoCPlatformConfig/Proc\[$procIdx\]/OS\[$osIdx\]/@bif"
	    set bif [format_path $isRelative [xpath_get_value $cfg_path $xpath]]
	    
	    set xpath "/SDSoCPlatformConfig/Proc\[$procIdx\]/OS\[$osIdx\]/@readme"
	    set readme [format_path $isRelative [xpath_get_value $cfg_path $xpath]]
	    
	    set xpath "/SDSoCPlatformConfig/Proc\[$procIdx\]/OS\[$osIdx\]/@image"
	    set image [format_path $isRelative [xpath_get_value $cfg_path $xpath]]
	    
	    set xpath "/SDSoCPlatformConfig/Proc\[$procIdx\]/OS\[$osIdx\]/@linkerscript"
	    set lscript [format_path $isRelative [xpath_get_value $cfg_path $xpath]]
	    
	    set xpath "/SDSoCPlatformConfig/Proc\[$procIdx\]/OS\[$osIdx\]/@boot"
	    set boot [format_path $isRelative [xpath_get_value $cfg_path $xpath]]
	    
	    set xpath "/SDSoCPlatformConfig/Proc\[$procIdx\]/OS\[$osIdx\]/includes/@paths"
	    set includes [xpath_get_value $cfg_path $xpath]
	    set incPaths [split $includes ";"]
	    for {set incIdx 0} {$incIdx < [llength $incPaths]} {incr incIdx} {
		set path [lindex $incPaths $incIdx]
		if {![string equal $path ""]} {
		    lappend inc [format_path $isRelative $path]
		}
	    }
	    
	    set xpath "/SDSoCPlatformConfig/Proc\[$procIdx\]/OS\[$osIdx\]/librarysearch/@paths"
	    set search [xpath_get_value $cfg_path $xpath]
	    set searchPaths [split $search ";"]
	    for {set searchIdx 0} {$searchIdx < [llength $searchPaths]} {incr searchIdx} {
		set path [lindex $searchPaths $searchIdx]
		if {![string equal $path ""]} {
		    lappend lib [format_path $isRelative $path]
		}
	    }

	    set xpath "/SDSoCPlatformConfig/Proc\[$procIdx\]/OS\[$osIdx\]/qemuargs/@paths"
	    set qemu [xpath_get_value $cfg_path $xpath]
	    set qemuPaths [split $qemu ";"]
	    for {set qemuIdx 0} {$qemuIdx < [llength $qemuPaths]} {incr qemuIdx} {
		set path [lindex $qemuPaths $qemuIdx]
		if {![string equal $path ""]} {
		    lappend qemu_args [format_path $isRelative $path]
		}
	    }

	    dict append os_map os $os
	    dict append os_map arch $arch
	    dict append os_map id $id
	    dict append os_map rt $rt
	    dict append os_map name $cfg_name
	    dict append os_map inc $inc
	    dict append os_map lib $lib
	    dict append os_map bif $bif
	    dict append os_map boot $boot
	    dict append os_map readme $readme
	    dict append os_map qemu_args $qemu_args
	    if {[string equal $os "standalone"]} {
		dict append os_map lscript $lscript
	    } elseif {[string equal $os "freertos"]} {
		dict append os_map lscript $lscript
		dict append os_map freertos_lib $freertos_lib
		dict append os_map freertos_inc $freertos_inc
	    } elseif {[string equal $os "linux"]} {
		dict append os_map image $image
	    }
	    lappend configs $os_map
	}
    }
}

###############################################################################
# Initialize globals
# - Occurs after command line options have been parsed
###############################################################################
proc apc_initialize_globals {} {
  global apc
  global verbose

  if {$verbose} {
    set apc(APCC_OPT_VERBOSE) "-verbose"
  } else {
    set apc(APCC_OPT_VERBOSE) ""
  }

  if {$verbose} {
    parray apc
  }
}

###############################################################################
# Globals
###############################################################################
# Set default options
set verbose 0
set help 0
set force 1

# Initialize globals
apc_initialize_globals

set sdscc_log_name [file join $run_dir write_dsa.log]
apc_set_global APCC_LOG $sdscc_log_name

set sdscc_journal_name [file join $run_dir write_dsa.jou]
apc_set_global APCC_JOURNAL $sdscc_journal_name

#enable journalling and logging
journal_open $sdscc_journal_name
log_open $sdscc_log_name

# User environment variables to override or set command line options.
# These are applied after parsing command line options (additive).
set apc(SDS_CFLAGS) ""
if {[info exists ::env(SDSCC_CFLAGS)]} {
  set apc(SDS_CFLAGS) $::env(SDSCC_CFLAGS)
  MSG_WARNING 5404 "User-defined flags set with SDSCC_CFLAGS environment variable $apc(SDS_CFLAGS)"
}

set apc(SDS_LFLAGS) ""
if {[info exists ::env(SDSCC_LFLAGS)]} {
  set apc(SDS_LFLAGS) $::env(SDSCC_LFLAGS)
  MSG_WARNING 5405 "User-defined flags set with SDSCC_LFLAGS environment variable $apc(SDS_LFLAGS)"
}

#constant globals

#control flags
set archive 1
set no_copy 0
set no_xpr 0
set local_cache 0
set pcie 0
set internal 0
set open_gui 0
set open_builder 0
set open_library 0
set build_hw_pfm 0
set build_sw_lib 0
set build_sw_pfm 0
set build_boot 0
set build_bifs 0
set build_prebuilt 0
set build_samples 0
set copy_incLibs 0
set copy_samples 0
set upgrade_ps 0
set upgrade_ips 0

#status flags
set has_boot_files 0
set has_libraries 0


###############################################################################
# Define filenames and directories
###############################################################################

set tmp_dir     [file join $run_dir ".Xil"]

set redirect "NOT SET"
if {$verbose} {
  set redirect ">@ stdout 2>@ stderr"
} else {
  set redirect "2>@ stderr"
}

#setup output directory
set out_dir [file join $out_dir "dsa_file"]

# install files
set vivado_script [file join $APPROOT "scripts" "vivado" "sdsoc_pfm.tcl"]

# Create flow directories
if {[file exists $tmp_dir]} {
    delete_directory $tmp_dir
    if {[file exists $tmp_dir]} {
	MSG_ERROR 5495 "Cannot delete temporary directory '$tmp_dir'."
	MSG_ERROR 5496 "Please delete manually and then retry"
	#sdscc_on_exit 1
    }
}
file mkdir $tmp_dir


########################################################
#check combinations of arguments
### hardware flow
#check hw_pfm file if specified
if {![string equal $hw_pfm ""]} {
    if {![check_hw_pfm]} {
	sdscc_on_exit 1
    }
}

#check if out_dir exists
if {[file exists $out_dir] && !$force} {
    MSG_ERROR 5497 "Error! Output directory already exists: $out_dir"
    MSG_ERROR 5498 "choose another directory, delete the existing directory, or use -force to override the existing directory."
    sdscc_on_exit 1
} else {
    if {[file exists $out_dir] && $force} {
	delete_directory $out_dir
	MSG_INFO 5429 "Deleted existing output directory at '$out_dir'"
	if {[file exists $out_dir]} {
	    MSG_ERROR 5499 "Could not delete existing output direcotry."
	    MSG_ERROR 5500 "Please delete manually and then retry."
	    sdscc_on_exit 1
	}
    }
    mkdir_command $out_dir
}

#check vivado project file
if {[string equal $vivado_proj ""]} {
    puts "Error! No vivado project or DSA was specified."
    puts "Specify a vivado project file using -xpr <vivado_project.xpr> option"
    puts "Or specify a DSA file using -dsa <vivado.dsa> option"
    sdscc_on_exit 1
}

#check for hardware platform files
if {[string equal $hw_pfm ""] && [string equal $hw_pfm_tcl ""] && ![string equal $vivado_proj ""]} {
    puts "Error! No hardware platform file was specified. Either specify an existing hardware platform xml file, or a hardware platform tcl file."
    puts "You can specify a hardware platform xml file using -hwpfm <hardware.pfm> option or"
    puts "You can specify a hardware platform tcl file using -pfmtcl <platform.tcl> option"
    sdscc_on_exit 1
} elseif {![string equal $hw_pfm ""] && ![string equal $hw_pfm_tcl ""]} {
    puts "Error! Too many hardware platform files specified. Either specify a hardware platform xml or tcl file (not both)."
    sdscc_on_exit 1
} elseif {[string equal $hw_pfm ""] && ![string equal $hw_pfm_tcl ""]} {
    set build_hw_pfm 1
}

###############################################################################
# Main flow
###############################################################################

#hw_pfm - build or copy
if {![string equal $vivado_proj ""]} {
    if {$archive && !$no_copy} {
	archive_project
    } elseif {!$no_copy} {
	copy_proj
    }

    create_dsa

}

cleanup_vivado

#Done!
sdscc_on_exit 0
