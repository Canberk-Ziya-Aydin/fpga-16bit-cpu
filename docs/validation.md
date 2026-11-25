# Validation

## Hardware runs reported by the author

Canberk Ziya Aydın ran the keyboard/VGA, calculator and AES demos on the Basys 3.
These are hardware demonstrations; they are separate from the automated
simulation results below. Fibonacci and the animation have not been reported as
run on the FPGA.

## Implemented hardware reports

On 25 November 2026 the author supplied screenshots of Vivado's utilization
and Design Timing Summary for `impl_1` / `top_design_wrapper` on
`xc7a35tcpg236-1`, from the existing working project. The documented system
clock is 100 MHz. The figures cover the full system, not only the CPU core.

| Resource | Used | Available | Utilization |
|---|---:|---:|---:|
| Slice LUTs | 762 | 20,800 | 3.66% |
| Slice registers | 516 | 41,600 | 1.24% |
| Block RAM tiles | 42 | 50 | 84.00% |

Additional utilization: 758 LUTs as logic, 4 LUTs as memory, 341 slices,
77 F7 muxes, 9 F8 muxes, 25 bonded IOBs and 1 BUFGCTRL.

| Timing check | Worst slack | Total negative slack | Failing endpoints | Total endpoints |
|---|---:|---:|---:|---:|
| Setup | +0.055 ns | 0.000 ns | 0 | 2,208 |
| Hold | +0.055 ns | 0.000 ns | 0 | 2,208 |
| Pulse width | +3.750 ns | 0.000 ns | 0 | 613 |

Vivado reports: **All user specified timing constraints are met.** The setup
and hold margins are small. This conclusion applies to the constraints in that
implemented project; the screenshots alone do not establish complete timing
constraint coverage or timing of unconstrained external I/O. No independent
Vivado rerun was performed while recording these results. They do not establish
that the repository export recreates the same implementation.

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

## Firmware RTL simulation reruns

The AES/calculator/animation folders retain their earlier simulation reports and
logs. Their original testbenches and a runner that regenerates the exact inputs
are now included in [tests/firmware](../tests/firmware/README.md). All three
testbenches were restored unchanged and rerun with the current repository RTL
using GHDL 4.1.0 (mcode), VHDL-2008. **AES, calculator and animation all passed.**
Their reported results and simulated event times matched the archived runs.
Fresh logs are in [tests/firmware/simulation_logs](../tests/firmware/simulation_logs).

The runner verifies hashes of the original testbenches and generated inputs.
AES and calculator use the delivered ROMs; animation retains the documented
two-instruction software-delay shortcut. These reruns cover the firmware HDL
fixtures; the separate older AES instruction-level report was not rerun here.
Their old references to hardware runs not performed "here" refer to the
simulation environment; the author's later calculator/AES hardware runs are
recorded above.

## Vivado build limits

A clean recreation attempt on 25 November 2026 failed at `open_bd_design`
after missing generated-file messages. The project-creation script has been
removed pending a verified replacement procedure. Clean project regeneration,
synthesis, implementation, setup/hold timing and the resulting bitstream still
need verification from the repository files. This does not replace or invalidate
the author's hardware runs using the existing working project.
