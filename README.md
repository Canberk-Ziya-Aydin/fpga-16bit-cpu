# 16-bit Pipelined CPU on FPGA

A personal CPU project implemented in VHDL on the **Digilent Basys 3**, with a
PS/2 keyboard and VGA text display.

## Features

- Five-stage IF / ID / EX / MEM / WB pipeline.
- Forwarding, automatic LOAD-use stalls and branch flushing.
- Custom 16-bit ISA, 12 general-purpose registers and four readable flag registers.
- Register-based absolute jumps and software-managed function calls.
- Separate 32K-word program ROM and 56K-word main RAM, using 16-bit word addresses.
- Memory-mapped keyboard FIFO with 31 usable entries.
- 640x480 VGA output, eight colors and a 128x96 grid of 5x5 character cells.
- Writable glyph RAM for 256 custom symbols.

**Board/tool:** Basys 3 (`xc7a35tcpg236-1`), Vivado 2025.2, VHDL-2008,
100 MHz system clock.

## Demonstrations and testing

I have run the keyboard/VGA demo, calculator and AES encryptor/decryptor on the
FPGA. The calculator and AES execute as software using the existing ISA;
there is no dedicated AES, multiplication or division accelerator.

| Program | ROM initialization file |
|---|---|
| Keyboard/VGA | `firmware/keyboard/vga_keyboard_demo_margin.coe` |
| Calculator | `firmware/presentation/presentation_calculator.coe` |
| AES-128 | `firmware/aes/aes128_keyboard_vga.coe` |
| Animation | `firmware/presentation/presentation_animation.coe` |

CPU/VGA regression simulations were run with Codex, including forwarding,
LOAD dependencies, high RAM addresses, branches and Fibonacci. **Fibonacci and
the animation are simulation-tested; I have not run them on the FPGA.**
See [validation](docs/validation.md) for the test scope and logs.

## Build

From a Vivado 2025.2 command prompt:

```sh
vivado -mode batch -source scripts/create_project.tcl
```

This prepares `build/vivado/fpga_16bit_cpu.xpr` with the AES demo. Open it and
generate/program the bitstream. Press **T** in AES to run its built-in example.
The setup script has not yet been verified through a clean local Vivado build.

The keyboard uses an external PS/2 connection on JA: clock J1, data L2.
See [build notes](docs/build.md) for memory timing and selecting another ROM.

## Contributions and AI assistance

CPU architecture, instruction-set and pipeline design, system integration and
hardware testing: **Canberk Ziya Aydın**. ChatGPT/Codex assisted with CPU review
and debugging.

**ChatGPT/Codex wrote the VGA module, all Tcl scripts, the demo/test programs
(including calculator and AES), and the accompanying build/test utilities.**
The documentation was also prepared with AI assistance. These components were
integrated and tested on the board as described above.

The font is from [nitram-micro-font](https://github.com/nitram509/nitram-micro-font)
by Martin W. Kirst; its MIT license is included. See [NOTICE.md](NOTICE.md).

## Source layout

`rtl/` contains CPU, keyboard/FIFO and VGA modules; `vivado/` and `constraints/`
contain the block design and pin assignments. `firmware/` holds the demos/font,
and `tests/` holds regression programs and testbenches.
The [ISA](docs/isa.md) and [display/keyboard map](docs/display-and-keyboard.md)
are documented separately.
