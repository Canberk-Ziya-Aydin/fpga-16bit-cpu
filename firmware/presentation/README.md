# CPU presentation demos

Two interactive CPU demonstrations, written by ChatGPT/Codex. Both use the
current instruction set, keyboard FIFO, VGA screen RAM and existing Nitram
glyph RAM font. No VHDL or wiring changes are needed.

Load one `.coe` into the **program ROM**, regenerate its output products,
rebuild the bitstream and program the FPGA. Reset starts that demo again.
Keep the current glyph RAM font initialization.

## 1. Interactive calculator

Use `presentation_calculator.coe`.

1. Choose `A` for addition, `S` for subtraction, `M` for multiplication, or
   `D` for division.
2. Type the first decimal number and press Enter.
3. Type the second decimal number and press Enter.
4. Read the result. Enter starts another calculation; `R` restarts at any time.

Each input accepts **0–255**. Backspace removes the last digit from the active
input. A yellow underline marks that input. A digit that would exceed 255 is
ignored. Results are decimal, with leading zeroes. Subtraction supports a
negative result; division also shows its remainder and handles a zero divisor.

Suggested presentation:

| Keys | Result |
|---|---|
| `M`, `13`, Enter, `17`, Enter | `00221` |
| Enter, `S`, `12`, Enter, `34`, Enter | `-00022` |
| Enter, `M`, `255`, Enter, `255`, Enter | `65025` |
| Enter, `D`, `47`, Enter, `6`, Enter | `00007`, remainder `005` |

This demonstrates keyboard polling, input validation, arithmetic, conditional
jumps, functions, a software call stack, decimal conversion and screen updates.
Multiplication and division are implemented with your existing ADD/SUB and
jump instructions.

## 2. Interactive VGA animation

Use `presentation_animation.coe`.

A coloured square moves and bounces inside a frame.

| Key | Action |
|---|---|
| `A` | Cycle through seven colours |
| `S` | Cycle through three speeds |
| Space | Pause or resume |
| `R` | Restart the animation |

This demonstrates a program updating screen RAM while the independent VGA
module scans it, plus keyboard input and boundary calculations. Frame timing
uses a software delay loop intended for your 100 MHz CPU clock.

## Large text

Both demos enlarge your existing 5x5 font in software. The CPU reads a glyph
from glyph RAM and turns each font bit into one coloured screen cell. Each
large character is 25x25 physical pixels, with spacing between characters.
The VGA driver and glyph format stay the same.

The preview PNGs show frames rendered from simulation screen RAM. They are
not photographs of the FPGA output.

## Files and memory

Each demo includes a ready-to-load 32,768-word COE, assembly source and a
listing with exact ROM addresses. All numeric operands in assembly are
hexadecimal. `build_demos.py` regenerates both ROMs with standard Python 3.

The calculator is 2,948 instruction words; the animation is 1,393 instruction
words. Padding fills the remainder of program ROM with zero words.

Screen memory is `0000`–`2FFF`. Program variables use `3000` onward, decimal
conversion uses `3200`–`3202` and `3300`–`3304`, and the software call stack
starts at `3F00`. The program reads the existing glyphs at `E000`–`E1FF` and
pops keyboard data from `FFFF`.

The programs use letters, top-row digits, Backspace, Enter and Space. Both
your original filter and the newer arrow-enabled filter support these keys.
Shift and Caps Lock are unnecessary.

## Verification

See `verification.txt` and the simulation logs. The saved eleven-module CPU
pipeline, actual uploaded keyboard filter/FIFO/mux, existing VGA driver and
one-clock synchronous memory models were used. The calculator uses its exact
delivery ROM. The animation's software delay constant was shortened for its
simulation; its drawing, movement and keyboard instructions were unchanged.
Canberk Ziya Aydın has run the calculator on the Basys 3. The animation has only
been verified in simulation; a hardware run has not been reported.
