# Build notes

Use Vivado 2025.2 with Artix-7 support. The board is Basys 3, device
`xc7a35tcpg236-1`, using a 100 MHz clock and synchronous active-high reset.
The XDC maps reset to the center button and PS/2 clock/data to JA pins J1/L2.

## Keyboard hardware

The author's hardware setup uses a logic level shifter between the external
PS/2 keyboard and the Basys 3. The FPGA pin assignments are JA clock J1 and
data L2.

## Project recreation status

The previous project-creation script has been removed. A clean rebuild attempt
on 25 November 2026 failed at `open_bd_design` after missing generated-file
messages. A verified recreation procedure is not yet available; the block
design is retained as a source reference.

The author's existing Vivado project has run the keyboard/VGA, calculator and
AES demos on the Basys 3. Recreating that working project from this source
export remains to be verified. Check setup and hold timing after rebuilding.

## Memory IP

| Instance | Configuration | Initialization |
|---|---|---|
| `blk_mem_gen_0` | 32768x16 single-port ROM | Selected firmware COE |
| `blk_mem_gen_1` | 57344x16 true dual-port RAM | Firmware initializes its working data |
| `blk_mem_gen_2` | 512x16 true dual-port RAM | Included font COE |

CPU reads and VGA B-port reads require **one-clock memory latency**. Optional
primitive/core output registers must remain disabled. VGA uses RAM port B, with
`web` and `dinb` tied to zero. Changing the shared clock also changes VGA timing.

Save each successful `.bit` under a distinct name outside the implementation
run directory before rebuilding another program.

## Source snapshot

The sixteen RTL modules and XDC come from the complete current file set uploaded
on 25 October 2026 (Istanbul time), together with `top_design(8).bd`.
No RTL logic was changed during packaging. One obsolete ID comment was corrected:
branches consume their target operands in EX, not ID. The comment-only difference
appears in `source-adjustments.patch`; hashes are in `source-manifest.json`.
Windows line endings in WB were normalized to LF for Git; the original source
hash is retained separately in the manifest.

The block design retains the uploaded cell connections and memory configuration.
Local COE/generated-file paths and reset metadata were normalized for portability;
reset metadata now matches the active-high RTL. The uploaded design already
disables the screen/glyph B-port primitive output registers.

The clean project recreation attempt failed before synthesis or implementation.
GHDL checks are separate from the Vivado build. This source export does not
include the latest bitstream or Vivado run artifacts. The test utilities were
written by ChatGPT/Codex.
