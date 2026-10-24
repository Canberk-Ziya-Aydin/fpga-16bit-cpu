# CPU test programs

Five separate program ROM images for your current 16-bit CPU, 32K instruction
ROM, 128-column VGA screen and already loaded Nitram font. Each program runs
after reset, shows green PASS or red FAIL, prints its calculated values in
hexadecimal, and then stays on that screen. No keyboard input is needed.

## Run on the FPGA

1. Choose one of the five `.coe` files below.
2. Select it as the initialization file for the **program ROM** in Vivado.
3. Regenerate the ROM output products and rebuild/program the bitstream.
4. Press reset to run the same test again.

Keep your existing glyph RAM font, VGA driver and wiring. Each test clears the
screen and uses the same two-character left margin as the keyboard demo.

| Program ROM | What it exercises | Expected examples on VGA |
|---|---|---|
| `01_alu_forwarding.coe` | ADD, SUB, NAND, all four shifts, partial-byte immediate loads, forwarding priority, both source operands and WB forwarding | ADD `1324`, NAND `FA5F`, latest writer `0008`, both operands `0013` |
| `02_fibonacci.coe` | Register dependencies, repeated loops, conditional jumps, STORE and LOAD | First 16 Fibonacci values, ending `0262` |
| `03_math_loops.coe` | Multiplication through addition, division through subtraction, Euclid's GCD algorithm | 13 x 17 = `00DD`; 47 / 6 = `0007`, remainder `0005`; GCD(1071,462) = `0015` |
| `04_ram_hazards.coe` | 256-word pattern, distinct low/high RAM addresses and immediate LOAD dependencies | Pattern count `0100`, last pattern word `E21D`, doubled loaded value `48D0` |
| `05_jumps_and_calls.coe` | Equality, signed comparisons with overflow cases, branch flushing, forwarded jump targets, calls/returns and the end of ROM | Flushed values `0000`, function count `0003`, last-ROM return `7FFF` |

The first 16 Fibonacci values are:

```text
0000 0001 0001 0002 0003 0005 0008 000D
0015 0022 0037 0059 0090 00E9 0179 0262
```

The RAM test checks `3FFF`, `4000`, `4001`, `7FFF`, `8000`, `BFFF`, `C000`
and `DFFF` after writing a different value at every address. Its immediate
dependencies are LOAD -> ADD, LOAD -> LOAD address, LOAD -> STORE data, and
LOAD -> STORE address. The jumps test additionally checks LOAD -> JMP target.

The jump test calls code at `1000`, calls the same function at `4000` twice,
and executes a return instruction at the last ROM word, `7FFF`. These are
register-based jumps using your existing instruction encoding.

SLA follows your current EX block: it shifts left and copies the old least
significant bit into bit 0. Therefore SLA of `8001` is `0003`. SLL of the
same input is `0002`; SRA is `C000`; SRL is `4000`.

## Reading a failure

`CHECK` identifies the first failed check. Find the matching number in
`manifest.json` under the selected program's `checks` array (JSON numbers are
decimal; the screen shows hexadecimal). The screen also prints ACTUAL and
EXPECTED. For the initial branch-condition cases, these two fields contain
the left and right CMP operands; the check description states which branch
must be taken.

If a fundamental fetch, loop or jump operation fails, the program may stop
before it can display a result. The supplied simulation runner also detects
that case with a timeout.

The programs use these general RAM locations:

| Address | Meaning |
|---|---|
| `3000` onward | Calculated values, in the order displayed |
| `30F0` | `0000` while running, `600D` for PASS, `BAD0` for FAIL |
| `30F1` | First failed check ID, or `0000` on PASS |
| `30F2` | Actual value from the last check |
| `30F3` | Expected value from the last check |
| `30F4` | `CAFE` once the final screen has been written |

Other scratch addresses used by the RAM and jump tests are `4000`–`40FF`,
`6000`–`6001`, `7000`, `7100`, `7200`, and the boundary addresses listed above.
Each test initializes its working data before using it.

## Source and optional simulation

Every ROM has an assembly source and a listing with exact ROM addresses and
machine words. Numeric operands in the assembly are hexadecimal. Labels are
for readability; jumps still use registers loaded with their final numerical
addresses. `.org` is a source placement directive, not a CPU instruction.

Regenerate all five ROMs with Python 3, without extra packages:

```sh
python build_programs.py
```

To run the supplied testbench with GHDL and your CPU sources:

```sh
python run_tests.py --rtl-dir /path/to/cpu/rtl
```

The RTL directory must contain `EX_block.vhd`, `MEM_block.vhd`, `WB_block.vhd`,
`REG_file.vhd`, `ID_block.vhd`, `IF_block.vhd`, `IF_ID_reg.vhd`,
`ID_EX_reg.vhd`, `EX_MEM_reg.vhd`, `MEM_WB_reg.vhd`, and
`data_forwarding_unit.vhd`. It must include your agreed register-jump,
15-bit ROM-address and LOAD-use hazard changes. The runner does not alter RTL.

The testbench instantiates all eleven CPU modules with one-clock synchronous
ROM and RAM models. It checks every screen RAM word, all result words and
completion markers; the RAM test also checks its scratch data. It checks the
expected dependency stalls and that the jump test actually fetches ROM `7FFF`.
It does not simulate the VGA pixel output or PS/2 receiver.

All five passed against the saved CPU RTL. See `verification.txt` and the five
simulation logs for the results. These ROMs have not yet been run on the FPGA.
