"""Generate basic and cursor keyboard demos with a two-cell left margin.

Python 3; no dependencies. Glyph RAM must already contain the existing font.
Both programs use the current 16-bit ISA and a 32768-word instruction ROM.
"""
from pathlib import Path
import json

OUT = Path(__file__).resolve().parent
MARGIN = 0x0002
FIRST = 0x0080 + MARGIN

def build(cursor):
    rom, listing, labels, fixups = [], [], {}, []
    def label(name):
        assert name not in labels
        labels[name] = len(rom)
        listing.append((None, name + ':'))
    def emit(word, source):
        listing.append((len(rom), source))
        rom.append(word)
    def constant(r, value):
        if isinstance(value, str):
            fixups.append((len(rom), r, value))
            value = 0
        emit(0x8000 | r << 8 | value & 0xFF, f'LIL R{r}, {value & 255:02X}')
        emit(0x9000 | r << 8 | value >> 8, f'LIH R{r}, {value >> 8:02X}')
    def alu(opcode, rd, ra, rb, name):
        emit(opcode << 12 | rd << 8 | ra << 4 | rb,
             f'{name} R{rd}, R{ra}, R{rb}')
    def add(rd, ra, rb): alu(1, rd, ra, rb, 'ADD')
    def sub(rd, ra, rb): alu(2, rd, ra, rb, 'SUB')
    def nand(rd, ra, rb): alu(3, rd, ra, rb, 'NAND')
    def compare(ra, rb): emit(0xE000 | ra << 4 | rb, f'CMP R{ra}, R{rb}')
    def load(rd, ra): emit(0xA000 | rd << 8 | ra << 4, f'LOAD R{rd}, [R{ra}]')
    def store(ra, rd): emit(0xB000 | ra << 4 | rd, f'STORE [R{ra}], R{rd}')
    def jump(opcode, r):
        emit(opcode << 12 | r << 4, f'{ {0xC:"BEQ",0xD:"BLT",0xF:"JMP"}[opcode]} R{r}')
    def goto(name):
        constant(9, name)
        jump(0xF, 9)
    def key_equals(value, destination):
        constant(4, value)
        compare(2, 4)
        constant(9, destination)
        jump(0xC, 9)
    def column_in_r2():
        constant(4, 0x007F)
        nand(2, 6, 4)
        nand(2, 2, 2)

    label('start')
    constant(0, 0)
    constant(3, 1)
    constant(1, 0)                   # Clear the whole screen, including margins.
    constant(4, 0x3000)
    constant(5, 'clear_screen')
    label('clear_screen')
    store(1, 0)
    add(1, 1, 3)
    compare(1, 4)
    jump(0xD, 5)

    constant(1, MARGIN)
    for char in 'FPGA READY':
        constant(2, 0x0300 | ord(char))
        store(1, 2)
        add(1, 1, 3)
    constant(1, 0xFFFF)
    constant(6, FIRST)
    constant(7, 'poll')
    constant(8, 0x0700)
    constant(11, 'resume')

    label('resume')
    if cursor:
        load(10, 6)                  # Preserve the original word under the cursor.
        constant(4, 0x00FF)
        nand(2, 10, 4)
        nand(2, 2, 2)
        constant(4, 0x3800)          # Black glyph on a white background.
        add(2, 2, 4)
        store(6, 2)
    jump(0xF, 7)

    label('poll')
    load(2, 1)
    compare(2, 0)
    jump(0xC, 7)
    if cursor:
        store(6, 10)
    key_equals(0x001B, 'backspace')
    key_equals(0x001C, 'enter')
    key_equals(0x001D, 'space')
    if cursor:
        key_equals(0x0028, 'up')
        key_equals(0x0029, 'down')
        key_equals(0x002A, 'left')
        key_equals(0x002B, 'right')
    constant(4, 0x001B)
    compare(2, 4)
    constant(9, 'letter')
    jump(0xD, 9)
    constant(4, 0x0028)
    compare(2, 4)
    constant(9, 'digit')
    jump(0xD, 9)
    jump(0xF, 11)

    label('letter')
    constant(4, 0x0040)
    add(2, 2, 4)
    goto('print')
    label('digit')
    constant(4, 0x0012)
    add(2, 2, 4)
    goto('print')
    label('space')
    constant(2, 0x0020)
    label('print')
    add(2, 2, 8)
    store(6, 2)
    add(6, 6, 3)
    goto('bounds')

    label('enter')
    constant(4, 0xFF80)
    nand(6, 6, 4)
    nand(6, 6, 6)
    constant(4, 0x0080 + MARGIN)
    add(6, 6, 4)                    # Following row, column two.
    label('bounds')
    constant(4, 0x3000)
    compare(6, 4)
    constant(9, 'check_margin')
    jump(0xD, 9)
    constant(6, FIRST)
    jump(0xF, 11)
    label('check_margin')
    column_in_r2()
    compare(2, 0)
    constant(9, 'skip_margin')
    jump(0xC, 9)
    jump(0xF, 11)
    label('skip_margin')
    add(6, 6, 3)
    add(6, 6, 3)                    # Natural row wrap landed at column zero.
    jump(0xF, 11)

    label('backspace')
    constant(4, FIRST)
    compare(6, 4)
    jump(0xC, 11)
    constant(5, 'erase_left')
    goto('move_left')
    if cursor:
        label('left')
        constant(4, FIRST)
        compare(6, 4)
        jump(0xC, 11)
        add(5, 11, 0)               # Return to resume without erasing.
    label('move_left')
    sub(6, 6, 3)
    column_in_r2()
    compare(2, 3)                   # Column one means crossing the left margin.
    constant(9, 'left_skip_margin')
    jump(0xC, 9)
    jump(0xF, 5)
    label('left_skip_margin')
    sub(6, 6, 3)
    sub(6, 6, 3)                    # Move to column 127 of the previous row.
    jump(0xF, 5)
    label('erase_left')
    store(6, 0)
    jump(0xF, 11)

    if cursor:
        label('right')
        constant(4, 0x2FFF)
        compare(6, 4)
        jump(0xC, 11)
        add(6, 6, 3)
        goto('bounds')
        label('up')
        constant(4, 0x0100)
        compare(6, 4)
        jump(0xD, 11)
        constant(4, 0x0080)
        sub(6, 6, 4)
        jump(0xF, 11)
        label('down')
        constant(4, 0x2F80)
        compare(6, 4)
        constant(9, 'down_move')
        jump(0xD, 9)
        jump(0xF, 11)
        label('down_move')
        constant(4, 0x0080)
        add(6, 6, 4)
        jump(0xF, 11)

    for address, register, name in fixups:
        value = labels[name]
        rom[address] = 0x8000 | register << 8 | value & 0xFF
        rom[address + 1] = 0x9000 | register << 8 | value >> 8
    words = len(rom)
    assert words <= 32768
    padded = rom + [0] * (32768 - words)
    stem = 'vga_keyboard_demo' if cursor else 'vga_keyboard_demo_margin'
    (OUT / (stem + '.coe')).write_text(
        '; Two-cell left margin; preinitialized glyph RAM.\n'
        'memory_initialization_radix=16;\nmemory_initialization_vector=\n'
        + ',\n'.join(f'{word:04X}' for word in padded) + ';\n')
    assembly = ['; Existing 16-bit ISA; all immediate values are hexadecimal.',
                '; Two-cell margin on every row.']
    annotated = ['ADDR  WORD  INSTRUCTION']
    for address, source in listing:
        if address is None:
            assembly.append(source)
            annotated.append(source)
        else:
            word = rom[address]
            if word >> 12 in (8, 9):
                source = f'{"LIL" if word >> 12 == 8 else "LIH"} R{word >> 8 & 15}, {word & 255:02X}'
            assembly.append('    ' + source)
            annotated.append(f'{address:04X}  {word:04X}  {source}')
    prefix = 'program' if cursor else 'basic_program'
    (OUT / (prefix + '.asm')).write_text('\n'.join(assembly) + '\n')
    (OUT / (prefix + '_listing.txt')).write_text('\n'.join(annotated) + '\n')
    info = {'program_words': words, 'program_bytes': words * 2,
            'rom_depth': 32768, 'cursor': cursor, 'margin_cells': MARGIN,
            'margin_pixels': MARGIN * 5, 'first_text_address': FIRST,
            'heading_address': MARGIN, 'labels': labels}
    (OUT / (prefix + '_info.json')).write_text(json.dumps(info, indent=2) + '\n')
    print(f'{stem}: {words} instructions, {words * 2} bytes; padded to 32768 words.')

if __name__ == '__main__':
    build(cursor=False)
    build(cursor=True)
