# Display and keyboard

## Screen RAM

The screen contains 128 columns and 96 rows of 5x5 cells. Its word address is
`row * 128 + column`, starting at `0000`. There are 12,288 screen words.

| Screen-word bits | Meaning |
|---|---|
| 7:0 | Glyph index |
| 10:8 | Foreground RGB |
| 13:11 | Background RGB |
| 15:14 | Unused |

In each RGB field, bit 2 is red, bit 1 green and bit 0 blue. A glyph bit of one
selects foreground; zero selects background. Keyboard FIFO codes are not ASCII
glyph indices: firmware translates between them.

## Glyph RAM

Each of the 256 glyphs has two 16-bit words. CPU addresses are `E000 + 2*index`
and the following word. VGA port B uses the corresponding local 9-bit address.

| Glyph row | Word | Bits |
|---|---|---|
| 0 | First | 14:10 |
| 1 | First | 9:5 |
| 2 | First | 4:0 |
| 3 | Second | 9:5 |
| 4 | Second | 4:0 |

The highest bit of each five-bit row is the leftmost pixel. Programs can change
the font while running. The included font follows ASCII/CP437-style glyph
indices, including `41` for A and `20` for Space.

## Timing and memory ports

All logic uses the 100 MHz system clock. A two-bit divider gives one pixel
enable every four clocks. Active video is 640x480; total timing is 800x525,
with active-low sync pulses. The 25 MHz pixel enable gives about 59.52 Hz.

Main and glyph RAM use true dual ports, CPU on A and VGA on B. B-port writes
are disabled and their data inputs tied to zero. Each memory response takes one
clock. Optional primitive/core output registers must be disabled on both ports.
Same-address CPU writes and VGA reads may be affected by BRAM collision behavior;
the design has no frame-buffer swap or tearing prevention.

The keyboard demo leaves a two-cell left margin. This is a firmware workaround
for observed clipping at the extreme left of one physical monitor, not a change
to VGA timing or a confirmed fix for that clipping.

## Keyboard FIFO

The filter emits one 16-bit custom code for each accepted key press. Releases
are filtered. Shift and Caps Lock do not alter the output.

| FIFO code | Key |
|---|---|
| `0000` | Empty read; not a valid key |
| `0001`-`001A` | A-Z |
| `001B` | Backspace |
| `001C` | Enter |
| `001D` | Space |
| `001E`-`0027` | Top-row digits 0-9 |

`FFFE` returns 0 when empty, 1 when partially full, or 2 when full. `FFFF`
returns and removes the next code, or returns zero without advancing if empty.
There are 32 physical entries and 31 usable entries; a new key is dropped when
the FIFO is full. Reads are clocked and match CPU memory latency.

## Optional arrows

The default source matches the uploaded hardware filter. To enable arrows,
replace `rtl/io/ps2_scancode_filter.vhd` with the same-named file in
`extras/keyboard_arrows/`. Compile only one version of the entity.

The replacement adds `0028` Up, `0029` Down, `002A` Left and `002B` Right,
and extended keypad Enter. Page Up and Page Down are not mapped. Use it with
the cursor demo; its cursor is steady, not blinking. That demo does not implement
scrollback, insertion, or a persistent console history.
