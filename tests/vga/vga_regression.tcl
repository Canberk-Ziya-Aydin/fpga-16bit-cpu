# Vivado 2025.2 Tcl Console:
#   source {C:/FPGA_tests/vga_regression.tcl}
#   vga_test::run
# Keep vga_driver.vhd and tb_vga_driver.vhd beside this script.
# This standalone test does not change your open Vivado project.

namespace eval vga_test {
    variable source_dir [file dirname [file normalize [info script]]]

    proc tool {name} {
        set command [auto_execok $name]
        if {[llength $command] != 0} {
            return $command
        }
        if {[info exists ::env(XILINX_VIVADO)]} {
            foreach suffix {.bat .exe {}} {
                set candidate [file join $::env(XILINX_VIVADO) bin ${name}${suffix}]
                if {[file isfile $candidate]} {
                    if {$::tcl_platform(platform) eq "windows" && $suffix eq ".bat"} {
                        return [list $::env(COMSPEC) /c $candidate]
                    }
                    return [list $candidate]
                }
            }
        }
        error "Cannot find $name. Run this from the Vivado Tcl Console or a Vivado command shell."
    }

    proc invoke {command log_path} {
        set status [catch {exec {*}$command 2>@1} output options]
        set handle [open $log_path w]
        puts $handle $output
        close $handle
        if {$status != 0} {
            puts $output
            error "Simulation tool failed. See $log_path"
        }
        return $output
    }

    proc run {{driver_path {}}} {
        variable source_dir
        if {$driver_path eq {}} {
            set driver_path [file join $source_dir vga_driver.vhd]
        }
        set driver_path [file normalize $driver_path]
        set testbench_path [file join $source_dir tb_vga_driver.vhd]
        foreach source [list $driver_path $testbench_path] {
            if {![file isfile $source]} {error "Missing source file: $source"}
        }

        # Pass the source's screen base to the independent RAM model.
        set handle [open $driver_path r]
        set source_text [read $handle]
        close $handle
        if {![regexp -nocase {constant\s+SCREEN_BASE\s*:\s*UNSIGNED\s*\(15\s+downto\s+0\)\s*:=\s*x"([0-9a-f]{4})"} $source_text -> base_hex]} {
            error {Cannot find SCREEN_BASE. Keep its declaration as UNSIGNED(15 downto 0) := x"hhhh".}
        }
        scan $base_hex %x screen_base

        set xvhdl [tool xvhdl]
        set xelab [tool xelab]
        set xsim [tool xsim]
        set run_dir [file join $source_dir runs [format "vga_%s_%s" \
            [clock format [clock seconds] -format %Y%m%d_%H%M%S] [clock clicks]]]
        file mkdir $run_dir
        set previous_dir [pwd]
        set status [catch {
            cd $run_dir
            puts "Compiling VGA driver and testbench..."
            invoke [concat $xvhdl [list -2008 -work work $driver_path $testbench_path]] \
                [file join $run_dir compile.log]
            puts "Elaborating standalone VGA test..."
            invoke [concat $xelab [list work.tb_vga_driver -s vga_tb_snapshot \
                -debug off -generic_top SCREEN_BASE_FOR_TEST=$screen_base]] \
                [file join $run_dir elaborate.log]

            set batch_path [file join $run_dir run_simulation.tcl]
            set handle [open $batch_path w]
            puts $handle "run all"
            puts $handle "quit"
            close $handle
            puts "Checking two complete frames and reset recovery..."
            set output [invoke [concat $xsim [list vga_tb_snapshot -tclbatch $batch_path]] \
                [file join $run_dir simulation.log]]
            if {![regexp {OVERALL PASS:[^\r\n]*} $output pass_message]} {
                puts $output
                error "OVERALL FAIL: no passing test result. See $run_dir"
            }
            puts $pass_message
            puts "Logs: $run_dir"
            set run_dir
        } result options]
        cd $previous_dir
        if {$status != 0} {return -options $options $result}
        return $result
    }
}
puts {VGA regression loaded. Run: vga_test::run}
