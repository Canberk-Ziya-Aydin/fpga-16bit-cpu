# AES-128 keyboard/VGA demo

An interactive keyboard/VGA program using the CPU's existing instructions,
memory map, font and hardware connections. Encryption, decryption and key
expansion run as software on the CPU. The firmware and its test/build utilities
were written by ChatGPT/Codex. Canberk Ziya Aydın has run this demo on the Basys 3.

## Load it

Select `aes128_keyboard_vga.coe` as the **program ROM** initialization file,
regenerate its output products, rebuild the bitstream and program the FPGA.
Keep your existing glyph RAM font initialization. Reset starts the program.

The ROM is padded to 32,768 words; 11,789 words contain program instructions.

## Quick presentation

1. Press **T** to load the built-in standard example and encrypt it.
2. Read the green ciphertext at OUTPUT.
3. Press **D** to decrypt that output with the same key. The original input
   appears at OUTPUT.
4. Press **E** to encrypt the current output again.

You can also press **D**, then **T**, from the initial screen to demonstrate
decryption directly. The result is computed by the AES implementation.

## Enter your own key and block

1. Press **E** for encryption or **D** for decryption.
2. Enter exactly **32 hexadecimal digits** for the key, then press Enter.
3. Enter exactly **32 hexadecimal digits** for the input block, then press Enter.
4. Read the 32 hexadecimal output digits, split across two lines.

Use `0`–`9` and `A`–`F`; Shift is unnecessary. Spaces are ignored. Backspace
removes one digit from the active field. A yellow underline marks the next
digit position. Enter is accepted once the field contains all 32 digits;
additional digits are ignored.

At a completed result, **E** encrypts the current output and **D** decrypts it,
using the same key. Enter starts a new session. **R** restarts the interface
at any time. **T** loads the standard example for the selected operation.

This version implements the raw AES-128 operation on **one 16-byte block**,
with a **16-byte key**. It accepts hexadecimal data; it does not add a text/file
format, padding, a multi-block mode or authentication.

## Standard example

```text
KEY
000102030405060708090A0B0C0D0E0F

PLAINTEXT
00112233445566778899AABBCCDDEEFF

CIPHERTEXT
69C4E0D86A7B0430D8CDB78070B4C55A
```

Decrypting that ciphertext with that key returns the plaintext above.

Algorithm specification:
https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.197-upd1.pdf

The standard example also appears in Appendix C.1 of the original FIPS 197:
https://csrc.nist.gov/files/pubs/fips/197/final/docs/fips-197.pdf

## How the CPU implements it

AES-128 expands the key into eleven round keys. Encryption applies the
initial key addition, nine full rounds, and a final round without MixColumns.
Decryption applies the inverse transformations and the round keys in reverse
order, following FIPS 197.

Each byte occupies the low eight bits of one 16-bit RAM word. S-box,
inverse S-box and finite-field multiplication tables are loaded into ordinary
RAM by the program during startup. The round keys are generated from the
entered key at runtime. Every XOR is implemented with four existing NAND
instructions. Functions use register jumps and a software stack.

The interface enlarges your existing 5x5 font in software by drawing one
screen cell per font bit. Large characters are 25x25 physical pixels.

| Word addresses | Purpose |
|---|---|
| `0000`–`2FFF` | Existing screen RAM |
| `3000`–`3009` | Mode, entry phase, digit count and cursor state |
| `3020`–`302A` | AES and display working variables |
| `3100`–`310F` | Entered 16-byte key |
| `3120`–`312F` | Current input block |
| `3200`–`321F` | Key entry nibbles |
| `3220`–`323F` | Block entry nibbles |
| `3400`–`340F` | AES state and final output |
| `3500`–`35AF` | Eleven expanded round keys |
| `3F00` onward | Software call stack |
| `4000`–`47FF` | Eight 256-entry lookup tables |
| `E000`–`E1FF` | Existing glyph RAM, read by the interface |
| `FFFF` | Existing keyboard FIFO pop address |

## Source and verification

`aes128_keyboard_vga.asm` contains the program in your instruction language.
`aes128_keyboard_vga_listing.txt` includes every ROM address and machine word.
All numeric operands in assembly are hexadecimal.

Regenerate the firmware with standard Python 3:

```sh
python build_aes.py
```

The instruction simulator in `verify_aes.py` can also be run with Python 3
and the `cryptography` package. It checks the delivered machine code against
an independent AES implementation, including known vectors and deterministic
random keys/blocks:

```sh
python verify_aes.py
```

See `verification.txt` and the simulation logs for the checks performed with
the saved CPU pipeline, keyboard filter, FIFO, memory mux and VGA driver.
The preview images are rendered from simulation screen RAM. The reports describe
automated simulations; the author's later FPGA run is recorded separately in the
repository README and validation notes.
