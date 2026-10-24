# Validation

## Hardware runs reported by the author

Canberk Ziya Aydın ran the keyboard/VGA, calculator and AES demos on the Basys 3.
These are hardware demonstrations; they are separate from the automated
simulation results below. Fibonacci and the animation have not been reported as
run on the FPGA.

## CPU regression simulations

ChatGPT/Codex supplied and ran the regression programs and test utilities using
GHDL, VHDL-2008, the complete eleven-module CPU pipeline and synchronous
one-clock ROM/RAM models.

| Program | Result | Checked RAM/screen words | LOAD-use stalls |
|---|---|---:|---:|
| ALU and forwarding | PASS | 12,307 | 0 |
| Fibonacci | PASS | 12,309 | 0 |
| Arithmetic loops | PASS | 12,297 | 0 |
| RAM addressing and hazards | PASS | 12,571 | 4 |
| Jumps and software calls | PASS | 12,302 | 1 |

The jump test verified a fetch from ROM word `7FFF`. The RAM test checked
distinct high addresses through `DFFF`. Logs are in `tests/cpu/simulation_logs`.
This suite compares screen and expected result words; it does not instantiate
the VGA renderer or serial PS/2 receiver.

## VGA regression simulation

The ChatGPT/Codex-written VGA driver/testbench checks two complete frames,
10,089,816 assertions/checks, RGB output, four-clock pixel holds, active-low sync,
blanking, screen/glyph addressing, glyph updates and reset recovery.

See `tests/vga/package_simulation.log`. The test uses behavioral one-clock RAM
models rather than generated vendor BRAM simulation models.

## Other checks and limits

All sixteen default RTL modules were checked as VHDL-2008. All ten program COEs
contain 32,768 valid 16-bit words each; the font COE contains 512 valid words.
Documentation links and the source manifest were checked.

The AES/calculator/animation folders retain their earlier simulation reports and
logs. Those firmware simulations were not repeated during packaging.
Their old references to hardware runs not performed "here" refer to the
simulation environment; the author's later calculator/AES hardware runs are
recorded above.

Vivado is unavailable in the packaging environment. Tcl completeness checking
does not validate Vivado commands or IP properties. Clean project regeneration,
synthesis, implementation, setup/hold timing and the resulting bitstream still
need local verification.
