; Existing 16-bit ISA; all immediate values are hexadecimal.
; Two-cell margin on every row.
start:
    LIL R0, 00
    LIH R0, 00
    LIL R3, 01
    LIH R3, 00
    LIL R1, 00
    LIH R1, 00
    LIL R4, 00
    LIH R4, 30
    LIL R5, 0A
    LIH R5, 00
clear_screen:
    STORE [R1], R0
    ADD R1, R1, R3
    CMP R1, R4
    BLT R5
    LIL R1, 02
    LIH R1, 00
    LIL R2, 46
    LIH R2, 03
    STORE [R1], R2
    ADD R1, R1, R3
    LIL R2, 50
    LIH R2, 03
    STORE [R1], R2
    ADD R1, R1, R3
    LIL R2, 47
    LIH R2, 03
    STORE [R1], R2
    ADD R1, R1, R3
    LIL R2, 41
    LIH R2, 03
    STORE [R1], R2
    ADD R1, R1, R3
    LIL R2, 20
    LIH R2, 03
    STORE [R1], R2
    ADD R1, R1, R3
    LIL R2, 52
    LIH R2, 03
    STORE [R1], R2
    ADD R1, R1, R3
    LIL R2, 45
    LIH R2, 03
    STORE [R1], R2
    ADD R1, R1, R3
    LIL R2, 41
    LIH R2, 03
    STORE [R1], R2
    ADD R1, R1, R3
    LIL R2, 44
    LIH R2, 03
    STORE [R1], R2
    ADD R1, R1, R3
    LIL R2, 59
    LIH R2, 03
    STORE [R1], R2
    ADD R1, R1, R3
    LIL R1, FF
    LIH R1, FF
    LIL R6, 82
    LIH R6, 00
    LIL R7, 4C
    LIH R7, 00
    LIL R8, 00
    LIH R8, 07
    LIL R11, 42
    LIH R11, 00
resume:
    LOAD R10, [R6]
    LIL R4, FF
    LIH R4, 00
    NAND R2, R10, R4
    NAND R2, R2, R2
    LIL R4, 00
    LIH R4, 38
    ADD R2, R2, R4
    STORE [R6], R2
    JMP R7
poll:
    LOAD R2, [R1]
    CMP R2, R0
    BEQ R7
    STORE [R6], R10
    LIL R4, 1B
    LIH R4, 00
    CMP R2, R4
    LIL R9, B7
    LIH R9, 00
    BEQ R9
    LIL R4, 1C
    LIH R4, 00
    CMP R2, R4
    LIL R9, 9B
    LIH R9, 00
    BEQ R9
    LIL R4, 1D
    LIH R4, 00
    CMP R2, R4
    LIL R9, 93
    LIH R9, 00
    BEQ R9
    LIL R4, 28
    LIH R4, 00
    CMP R2, R4
    LIL R9, DC
    LIH R9, 00
    BEQ R9
    LIL R4, 29
    LIH R4, 00
    CMP R2, R4
    LIL R9, E4
    LIH R9, 00
    BEQ R9
    LIL R4, 2A
    LIH R4, 00
    CMP R2, R4
    LIL R9, C0
    LIH R9, 00
    BEQ R9
    LIL R4, 2B
    LIH R4, 00
    CMP R2, R4
    LIL R9, D4
    LIH R9, 00
    BEQ R9
    LIL R4, 1B
    LIH R4, 00
    CMP R2, R4
    LIL R9, 87
    LIH R9, 00
    BLT R9
    LIL R4, 28
    LIH R4, 00
    CMP R2, R4
    LIL R9, 8D
    LIH R9, 00
    BLT R9
    JMP R11
letter:
    LIL R4, 40
    LIH R4, 00
    ADD R2, R2, R4
    LIL R9, 95
    LIH R9, 00
    JMP R9
digit:
    LIL R4, 12
    LIH R4, 00
    ADD R2, R2, R4
    LIL R9, 95
    LIH R9, 00
    JMP R9
space:
    LIL R2, 20
    LIH R2, 00
print:
    ADD R2, R2, R8
    STORE [R6], R2
    ADD R6, R6, R3
    LIL R9, A2
    LIH R9, 00
    JMP R9
enter:
    LIL R4, 80
    LIH R4, FF
    NAND R6, R6, R4
    NAND R6, R6, R6
    LIL R4, 82
    LIH R4, 00
    ADD R6, R6, R4
bounds:
    LIL R4, 00
    LIH R4, 30
    CMP R6, R4
    LIL R9, AB
    LIH R9, 00
    BLT R9
    LIL R6, 82
    LIH R6, 00
    JMP R11
check_margin:
    LIL R4, 7F
    LIH R4, 00
    NAND R2, R6, R4
    NAND R2, R2, R2
    CMP R2, R0
    LIL R9, B4
    LIH R9, 00
    BEQ R9
    JMP R11
skip_margin:
    ADD R6, R6, R3
    ADD R6, R6, R3
    JMP R11
backspace:
    LIL R4, 82
    LIH R4, 00
    CMP R6, R4
    BEQ R11
    LIL R5, D2
    LIH R5, 00
    LIL R9, C5
    LIH R9, 00
    JMP R9
left:
    LIL R4, 82
    LIH R4, 00
    CMP R6, R4
    BEQ R11
    ADD R5, R11, R0
move_left:
    SUB R6, R6, R3
    LIL R4, 7F
    LIH R4, 00
    NAND R2, R6, R4
    NAND R2, R2, R2
    CMP R2, R3
    LIL R9, CF
    LIH R9, 00
    BEQ R9
    JMP R5
left_skip_margin:
    SUB R6, R6, R3
    SUB R6, R6, R3
    JMP R5
erase_left:
    STORE [R6], R0
    JMP R11
right:
    LIL R4, FF
    LIH R4, 2F
    CMP R6, R4
    BEQ R11
    ADD R6, R6, R3
    LIL R9, A2
    LIH R9, 00
    JMP R9
up:
    LIL R4, 00
    LIH R4, 01
    CMP R6, R4
    BLT R11
    LIL R4, 80
    LIH R4, 00
    SUB R6, R6, R4
    JMP R11
down:
    LIL R4, 80
    LIH R4, 2F
    CMP R6, R4
    LIL R9, EB
    LIH R9, 00
    BLT R9
    JMP R11
down_move:
    LIL R4, 80
    LIH R4, 00
    ADD R6, R6, R4
    JMP R11
