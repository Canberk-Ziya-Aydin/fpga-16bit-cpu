KEYBOARD / VGA DEMOS WITH A TWO-CELL LEFT MARGIN
==============================================

QUICK INSTALL FOR YOUR CURRENT HARDWARE
--------------------------------------
Use vga_keyboard_demo_margin.coe as the PROGRAM ROM initialization file.
Keep the program ROM at 32768 words x 16 bits, regenerate output products,
rebuild the bitstream, and reload the FPGA.

This basic version works with your existing VHDL/filter. It supports the
same letters, numbers, Space, Enter, and Backspace as the old demo. It adds
10 pixels of black space on the left: two character cells, each 5 pixels.
Your existing font must already be initialized in glyph RAM, as before.

CURSOR VERSION
--------------
vga_keyboard_demo.coe is the cursor/arrow-key version with the same margin.
For this version, also use the included ps2_scancode_filter.vhd. Its entity
ports are unchanged. Replace the existing entity source; do not add a
second copy of the same entity to the project.

The steady white cursor marks the next character position. Over an existing
character it displays the glyph black on white and restores the exact
original screen word when you move away. Typing overwrites the selected
cell. Left/Right move by one usable cell; Up/Down preserve the column.
The heading is protected. Scrolling and insertion are not implemented.
Shift and Caps Lock remain ignored.

MARGIN BEHAVIOR (BOTH VERSIONS)
------------------------------
The heading starts at 0002. Typing starts at 0082.
The first two cells of every screen row remain empty. There are 126 usable
columns in each of 95 typing rows beneath the heading.

Enter moves to column two of the next row. Automatic line wrapping also
skips the first two cells. Backspace crosses a row boundary directly to
column 127 of the previous row, skipping the margin, and erases that cell.
At the first typing cell (0082), Backspace is ignored.

In cursor mode, Left/Right also skip the margin at row boundaries. Arrow
keys clamp at the first/last typing cell and at the top/bottom typing row.
Typing past the final cell (2FFF), or Enter in the last row, wraps to 0082.
Enter does not clear the destination row; Backspace does not shift text.

RAM TIMING REQUIRED BY THE EXISTING VGA DRIVER
--------------------------------------------
The prior missing-last-character symptom was reproduced when an extra
glyph RAM output register was enabled. Vivado confirmed the Port B
primitive output register was enabled in the hardware configuration.

Keep both screen RAM (blk_mem_gen_1) and glyph RAM (blk_mem_gen_2) Port B
read latency at ONE clock: disable both primitive and core output registers.
The CPU Port A reads must also retain their existing one-clock timing.
The margin changes only the program; it does not change the VGA timing,
memory map, XDC, RAM sizes, or glyph contents.

KEYBOARD CONNECTIONS
--------------------
FIFO clk          <- system clock
FIFO write_data   <- filter fifo_char
FIFO write_enable <- filter fifo_trigger

These connections and your uploaded FIFO/receiver/filter/mux passed checks.
The supplied fifo_buffer.vhd is the unchanged reference FIFO, not a new
fix for the old display-timing issue. It has 32 physical slots, 31 usable.
FFFE reads status (0 empty, 1 partial, 2 full); FFFF reads/pops a key,
returning zero on empty. Read latency is one clock.

KEY CODES
---------
0000 empty; 0001..001A A..Z; 001B Backspace; 001C Enter;
001D Space; 001E..0027 digits 0..9.
The cursor filter adds 0028 Up, 0029 Down, 002A Left, 002B Right.
Extended arrow releases are ignored; keypad Enter emits 001C.
The existing font uses A=41, Space=20, digits=30..39. Firmware translates.

FILES
-----
vga_keyboard_demo_margin.coe : Basic margin demo; current VHDL compatible.
vga_keyboard_demo.coe        : Margin demo with cursor and arrow keys.
basic_program.asm           : Basic source in the existing ISA.
basic_program_listing.txt   : Basic word addresses and machine code.
program.asm                 : Cursor source in the existing ISA.
program_listing.txt         : Cursor word addresses and machine code.
build_program.py            : Regenerates BOTH versions; Python 3, no deps.
basic_program_info.json     : Basic program labels and size.
program_info.json           : Cursor program labels and size.
ps2_scancode_filter.vhd     : Updated filter for cursor/arrow support.
fifo_buffer.vhd             : Unchanged reference FIFO.
verification.txt            : Actual tests and scope.
FONT_LICENSE.txt            : Existing Nitram Micro Mono font license.

Basic: 173 instructions, 346 bytes. Cursor: 239 instructions, 478 bytes.
Both COEs contain 32768 16-bit words, with unused locations padded by NOPs.
To regenerate: python build_program.py
