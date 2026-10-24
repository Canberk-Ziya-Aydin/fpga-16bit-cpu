# Vivado 2025.2. Creates a fresh project without starting a bitstream build.
# Optional first argument: program ROM COE, absolute or relative to the repo.
set repo_root [file normalize [file join [file dirname [info script]] ..]]
set build_dir [file join $repo_root build vivado]
set project_name fpga_16bit_cpu

set rom_file [file join $repo_root firmware aes aes128_keyboard_vga.coe]
if {[info exists argv] && [llength $argv] > 0} {
    set rom_file [lindex $argv 0]
    if {[file pathtype $rom_file] ne "absolute"} {
        set rom_file [file join $repo_root $rom_file]
    }
    set rom_file [file normalize $rom_file]
}
set font_file [file join $repo_root firmware font nitram_micro_font_5x5_512x16.coe]
foreach input_file [list $rom_file $font_file] {
    if {![file isfile $input_file]} { error "Missing initialization file: $input_file" }
}
if {[file exists [file join $build_dir ${project_name}.xpr]]} {
    error "Generated project already exists at $build_dir. Open it, or use a fresh build directory."
}

create_project $project_name $build_dir -part xc7a35tcpg236-1
set_property target_language VHDL [current_project]
set_property simulator_language Mixed [current_project]
set rtl_files [concat \
    [glob [file join $repo_root rtl cpu *.vhd]] \
    [glob [file join $repo_root rtl io *.vhd]] \
    [glob [file join $repo_root rtl video *.vhd]]]
add_files -norecurse $rtl_files
set_property file_type {VHDL 2008} [get_files *.vhd]
add_files -fileset constrs_1 -norecurse [file join $repo_root constraints basys3.xdc]
update_compile_order -fileset sources_1

# Import into the generated project so Vivado does not rewrite the source BD.
import_files -norecurse [file join $repo_root vivado top_design.bd]
set bd_files [get_files -all */top_design.bd]
if {[llength $bd_files] != 1} { error "Expected exactly one imported top_design.bd" }
set bd_file [lindex $bd_files 0]
open_bd_design $bd_file
set_property CONFIG.Coe_File $rom_file [get_bd_cells blk_mem_gen_0]
set_property CONFIG.Coe_File $font_file [get_bd_cells blk_mem_gen_2]
foreach memory {blk_mem_gen_0 blk_mem_gen_1 blk_mem_gen_2} {
    set_property -dict [list \
        CONFIG.Register_PortA_Output_of_Memory_Primitives false \
        CONFIG.Register_PortA_Output_of_Memory_Core false] [get_bd_cells $memory]
}
foreach memory {blk_mem_gen_1 blk_mem_gen_2} {
    set_property -dict [list \
        CONFIG.Register_PortB_Output_of_Memory_Primitives false \
        CONFIG.Register_PortB_Output_of_Memory_Core false] [get_bd_cells $memory]
}
set_property CONFIG.POLARITY ACTIVE_HIGH [get_bd_ports reset_0]
validate_bd_design
save_bd_design
generate_target all $bd_file
set wrapper_files [make_wrapper -files $bd_file -top]
add_files -norecurse $wrapper_files
set_property top top_design_wrapper [current_fileset]
update_compile_order -fileset sources_1
set_property strategy Performance_ExplorePostRoutePhysOpt [get_runs impl_1]
puts "Project ready: [file join $build_dir ${project_name}.xpr]"
puts "Program ROM: $rom_file"
puts "Generate a bitstream locally and check timing before programming."
