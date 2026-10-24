# Instruction set

All instructions occupy one 16-bit program-ROM word. The PC increments by one
word. R0-R11 are writable general-purpose registers; R0 is not hardwired to zero.
R12-R15 expose Z, N, C and V respectively in bit 0; remaining bits are zero.
Normal register writes do not write R12-R15.

For encodings below, each letter represents one hexadecimal digit. Unused fields
are written as zero. `ii` is an eight-bit immediate.

| Opcode | Instruction | Encoding | Meaning |
|---|---|---|---|
| `0` | NOP | `0000` | No architectural operation |
| `1` | ADD Rd, Rs1, Rs2 | `1dst` | Rd = Rs1 + Rs2, modulo 65536 |
| `2` | SUB Rd, Rs1, Rs2 | `2dst` | Rd = Rs1 - Rs2, modulo 65536 |
| `3` | NAND Rd, Rs1, Rs2 | `3dst` | Bitwise NAND |
| `4` | SLL Rd, Rs1 | `4ds0` | Shift left by one, fill bit 0 with zero |
| `5` | SRL Rd, Rs1 | `5ds0` | Shift right by one, fill bit 15 with zero |
| `6` | SLA Rd, Rs1 | `6ds0` | Shift left by one, copy old bit 0 into new bit 0 |
| `7` | SRA Rd, Rs1 | `7ds0` | Shift right by one, preserve the sign bit |
| `8` | LIL Rd, imm8 | `8dii` | Replace Rd's low byte; retain its high byte |
| `9` | LIH Rd, imm8 | `9dii` | Replace Rd's high byte; retain its low byte |
| `A` | LOAD Rd, Ra | `Ada0` | Read a data-memory word at address Ra |
| `B` | STORE Ra, Rs | `B0as` | Store Rs at data-memory word address Ra |
| `C` | BEQ Rt | `C0t0` | Jump to Rt if Z = 1 |
| `D` | BLT Rt | `D0t0` | Jump to Rt if N differs from V |
| `E` | CMP Rs1, Rs2 | `E0st` | Compute subtraction flags without a register result |
| `F` | JMP Rt | `F0t0` | Unconditional jump to Rt |

The source retains the mnemonic SLA, but its bit-0 behavior is unusual: SLA of
`8001` produces `0003`, while SLL produces `0002`. Programs and emulators must
follow the RTL behavior rather than assume a conventional arithmetic-left shift.

ADD, SUB, CMP, NAND and all four shifts update flags. LIL, LIH, LOAD, STORE and
branches preserve them. Z indicates a zero result; N is result bit 15. Addition
and subtraction expose bit 16 of the implemented adder as C. For subtraction,
this corresponds to no unsigned borrow. V is signed overflow. NAND clears C/V;
shifts place the shifted-out bit in C and clear V.

## Addresses and branches

The architectural PC and branch targets are 16 bits. Physical ROM has 15 address
bits; valid program locations are `0000`-`7FFF`. Higher PC values alias through
the lower 15 bits and should not be used as distinct program locations.

BEQ, BLT and JMP take their absolute target from a register. They do not contain
an immediate PC-relative offset. Branches resolve in EX and flush IF/ID and
ID/EX when taken. There are no programmer-visible branch delay slots.

For example, to jump to ROM word `1234`:

```text
LIL R10, 0x34
LIH R10, 0x12
JMP R10
```

This encodes as `8A34`, `9A12`, `F0A0`. Calls and returns use the same mechanism,
with return addresses stored in registers or in a software-managed RAM stack.

## Pipeline dependencies

EX/MEM and WB forwarding provide newer arithmetic/immediate results. A LOAD
result is available through WB. Decode inserts a stall for a dependent following
instruction, including LOAD/STORE address/data operands, old Rd for LIL/LIH, and
register targets for BEQ, BLT and JMP. Firmware does not need to insert manual
NOPs for these supported cases.
