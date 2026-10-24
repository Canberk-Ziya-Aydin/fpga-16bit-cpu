; All numeric operands are hexadecimal; labels are for readability.
; .org controls ROM placement; it is not a CPU instruction.
    LIL R0, 00
    LIH R0, 00
    LIL R1, 00
    LIH R1, 00
    LIL R2, 01
    LIH R2, 00
    LIL R3, 00
    LIH R3, 30
    LIL R4, 0A ; clear_screen: 000A
    LIH R4, 00
clear_screen:
    STORE [R1], R0
    ADD R1, R1, R2
    CMP R1, R3
    BLT R4
    LIL R9, 00
    LIH R9, 30
    STORE [R9], R0
    LIL R9, 01
    LIH R9, 30
    STORE [R9], R0
    LIL R9, 02
    LIH R9, 30
    STORE [R9], R0
    LIL R9, 03
    LIH R9, 30
    STORE [R9], R0
    LIL R9, 04
    LIH R9, 30
    STORE [R9], R0
    LIL R9, 05
    LIH R9, 30
    STORE [R9], R0
    LIL R9, 06
    LIH R9, 30
    STORE [R9], R0
    LIL R9, 07
    LIH R9, 30
    STORE [R9], R0
    LIL R9, 08
    LIH R9, 30
    STORE [R9], R0
    LIL R9, 09
    LIH R9, 30
    STORE [R9], R0
    LIL R9, 0A
    LIH R9, 30
    STORE [R9], R0
    LIL R9, 0B
    LIH R9, 30
    STORE [R9], R0
    LIL R9, 0C
    LIH R9, 30
    STORE [R9], R0
    LIL R9, 0D
    LIH R9, 30
    STORE [R9], R0
    LIL R9, F0
    LIH R9, 30
    STORE [R9], R0
    LIL R9, F1
    LIH R9, 30
    STORE [R9], R0
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R0
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R0
    LIL R9, F4
    LIH R9, 30
    STORE [R9], R0
    LIL R1, 34
    LIH R1, 12
    LIL R2, F0
    LIH R2, 00
    ADD R3, R1, R2
    SUB R4, R3, R2
    LIL R9, 00
    LIH R9, 30
    STORE [R9], R3
    LIL R8, 24
    LIH R8, 13
    LIL R10, 01
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R3
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 61 ; check_01_ok: 0061
    LIH R11, 00
    CMP R3, R8
    BEQ R11
    LIL R11, 96 ; failure: 0196
    LIH R11, 01
    JMP R11
check_01_ok:
    LIL R9, 01
    LIH R9, 30
    STORE [R9], R4
    LIL R8, 34
    LIH R8, 12
    LIL R10, 02
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R4
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 75 ; check_02_ok: 0075
    LIH R11, 00
    CMP R4, R8
    BEQ R11
    LIL R11, 96 ; failure: 0196
    LIH R11, 01
    JMP R11
check_02_ok:
    LIL R1, AA
    LIH R1, 55
    LIL R2, F0
    LIH R2, 0F
    NAND R3, R1, R2
    LIL R9, 02
    LIH R9, 30
    STORE [R9], R3
    LIL R8, 5F
    LIH R8, FA
    LIL R10, 03
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R3
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 8E ; check_03_ok: 008E
    LIH R11, 00
    CMP R3, R8
    BEQ R11
    LIL R11, 96 ; failure: 0196
    LIH R11, 01
    JMP R11
check_03_ok:
    LIL R1, 01
    LIH R1, 80
    SLL R2, R1
    LIL R9, 03
    LIH R9, 30
    STORE [R9], R2
    LIL R8, 02
    LIH R8, 00
    LIL R10, 04
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R2
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, A5 ; check_04_ok: 00A5
    LIH R11, 00
    CMP R2, R8
    BEQ R11
    LIL R11, 96 ; failure: 0196
    LIH R11, 01
    JMP R11
check_04_ok:
    LIL R1, 01
    LIH R1, 80
    SRL R2, R1
    LIL R9, 04
    LIH R9, 30
    STORE [R9], R2
    LIL R8, 00
    LIH R8, 40
    LIL R10, 05
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R2
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, BC ; check_05_ok: 00BC
    LIH R11, 00
    CMP R2, R8
    BEQ R11
    LIL R11, 96 ; failure: 0196
    LIH R11, 01
    JMP R11
check_05_ok:
    LIL R1, 01
    LIH R1, 80
    SLA R2, R1
    LIL R9, 05
    LIH R9, 30
    STORE [R9], R2
    LIL R8, 03
    LIH R8, 00
    LIL R10, 06
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R2
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, D3 ; check_06_ok: 00D3
    LIH R11, 00
    CMP R2, R8
    BEQ R11
    LIL R11, 96 ; failure: 0196
    LIH R11, 01
    JMP R11
check_06_ok:
    LIL R1, 01
    LIH R1, 80
    SRA R2, R1
    LIL R9, 06
    LIH R9, 30
    STORE [R9], R2
    LIL R8, 00
    LIH R8, C0
    LIL R10, 07
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R2
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, EA ; check_07_ok: 00EA
    LIH R11, 00
    CMP R2, R8
    BEQ R11
    LIL R11, 96 ; failure: 0196
    LIH R11, 01
    JMP R11
check_07_ok:
    LIL R1, CD
    LIH R1, AB
    LIL R1, 12
    LIL R9, 07
    LIH R9, 30
    STORE [R9], R1
    LIL R8, 12
    LIH R8, AB
    LIL R10, 08
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 01 ; check_08_ok: 0101
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, 96 ; failure: 0196
    LIH R11, 01
    JMP R11
check_08_ok:
    LIH R1, 34
    LIL R9, 08
    LIH R9, 30
    STORE [R9], R1
    LIL R8, 12
    LIH R8, 34
    LIL R10, 09
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 16 ; check_09_ok: 0116
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, 96 ; failure: 0196
    LIH R11, 01
    JMP R11
check_09_ok:
    LIL R1, 01
    LIH R1, 00
    ADD R1, R1, R1
    ADD R1, R1, R1
    ADD R2, R1, R1
    LIL R9, 09
    LIH R9, 30
    STORE [R9], R2
    LIL R8, 08
    LIH R8, 00
    LIL R10, 0A
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R2
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 2F ; check_0A_ok: 012F
    LIH R11, 01
    CMP R2, R8
    BEQ R11
    LIL R11, 96 ; failure: 0196
    LIH R11, 01
    JMP R11
check_0A_ok:
    LIL R1, 03
    LIH R1, 00
    LIL R2, 05
    LIH R2, 00
    ADD R3, R1, R2
    ADD R4, R3, R1
    ADD R5, R3, R4
    LIL R9, 0A
    LIH R9, 30
    STORE [R9], R5
    LIL R8, 13
    LIH R8, 00
    LIL R10, 0B
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R5
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 4A ; check_0B_ok: 014A
    LIH R11, 01
    CMP R5, R8
    BEQ R11
    LIL R11, 96 ; failure: 0196
    LIH R11, 01
    JMP R11
check_0B_ok:
    LIL R1, 2A
    LIH R1, 00
    LIL R2, 01
    LIH R2, 00
    ADD R3, R1, R2
    NOP
    ADD R4, R3, R0
    LIL R9, 0B
    LIH R9, 30
    STORE [R9], R4
    LIL R8, 2B
    LIH R8, 00
    LIL R10, 0C
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R4
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 65 ; check_0C_ok: 0165
    LIH R11, 01
    CMP R4, R8
    BEQ R11
    LIL R11, 96 ; failure: 0196
    LIH R11, 01
    JMP R11
check_0C_ok:
    LIL R1, FF
    LIH R1, FF
    LIL R2, 01
    LIH R2, 00
    ADD R3, R1, R2
    LIL R9, 0C
    LIH R9, 30
    STORE [R9], R3
    LIL R8, 00
    LIH R8, 00
    LIL R10, 0D
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R3
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 7E ; check_0D_ok: 017E
    LIH R11, 01
    CMP R3, R8
    BEQ R11
    LIL R11, 96 ; failure: 0196
    LIH R11, 01
    JMP R11
check_0D_ok:
    SUB R3, R0, R2
    LIL R9, 0D
    LIH R9, 30
    STORE [R9], R3
    LIL R8, FF
    LIH R8, FF
    LIL R10, 0E
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R3
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 93 ; check_0E_ok: 0193
    LIH R11, 01
    CMP R3, R8
    BEQ R11
    LIL R11, 96 ; failure: 0196
    LIH R11, 01
    JMP R11
check_0E_ok:
    LIL R11, 9E ; success: 019E
    LIH R11, 01
    JMP R11
failure:
    LIL R9, F1
    LIH R9, 30
    STORE [R9], R10
    LIL R1, D0
    LIH R1, BA
    LIL R11, A0 ; status: 01A0
    LIH R11, 01
    JMP R11
success:
    LIL R1, 0D
    LIH R1, 60
status:
    LIL R9, F0
    LIH R9, 30
    STORE [R9], R1
    LIL R6, 02
    LIH R6, 00
    LIL R7, 01
    LIH R7, 00
    LIL R2, 41
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4C
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 55
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4E
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 44
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 46
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4F
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 57
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 44
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 49
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4E
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 47
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, F0
    LIH R9, 30
    LOAD R1, [R9]
    LIL R4, 0D
    LIH R4, 60
    LIL R11, 0F ; show_pass: 020F
    LIH R11, 02
    CMP R1, R4
    BEQ R11
    LIL R6, 82
    LIH R6, 00
    LIL R7, 01
    LIH R7, 00
    LIL R2, 46
    LIH R2, 04
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 04
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 49
    LIH R2, 04
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4C
    LIH R2, 04
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R11, 23 ; details: 0223
    LIH R11, 02
    JMP R11
show_pass:
    LIL R6, 82
    LIH R6, 00
    LIL R7, 01
    LIH R7, 00
    LIL R2, 50
    LIH R2, 02
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 02
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 53
    LIH R2, 02
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 53
    LIH R2, 02
    STORE [R6], R2
    ADD R6, R6, R7
details:
    LIL R6, 02
    LIH R6, 01
    LIL R7, 01
    LIH R7, 00
    LIL R2, 43
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 48
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 43
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4B
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, F1
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 14
    LIH R6, 01
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 5E ; detail_2_digit_0: 025E
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 60 ; detail_2_emit_0: 0260
    LIH R11, 02
    JMP R11
detail_2_digit_0:
    LIL R4, 30
    LIH R4, 07
detail_2_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 7B ; detail_2_digit_1: 027B
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 7D ; detail_2_emit_1: 027D
    LIH R11, 02
    JMP R11
detail_2_digit_1:
    LIL R4, 30
    LIH R4, 07
detail_2_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 94 ; detail_2_digit_2: 0294
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 96 ; detail_2_emit_2: 0296
    LIH R11, 02
    JMP R11
detail_2_digit_2:
    LIL R4, 30
    LIH R4, 07
detail_2_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, A9 ; detail_2_digit_3: 02A9
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, AB ; detail_2_emit_3: 02AB
    LIH R11, 02
    JMP R11
detail_2_digit_3:
    LIL R4, 30
    LIH R4, 07
detail_2_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 82
    LIH R6, 01
    LIL R7, 01
    LIH R7, 00
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 43
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 54
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 55
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4C
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, F2
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 94
    LIH R6, 01
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, ED ; detail_3_digit_0: 02ED
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, EF ; detail_3_emit_0: 02EF
    LIH R11, 02
    JMP R11
detail_3_digit_0:
    LIL R4, 30
    LIH R4, 07
detail_3_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 0A ; detail_3_digit_1: 030A
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 0C ; detail_3_emit_1: 030C
    LIH R11, 03
    JMP R11
detail_3_digit_1:
    LIL R4, 30
    LIH R4, 07
detail_3_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 23 ; detail_3_digit_2: 0323
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 25 ; detail_3_emit_2: 0325
    LIH R11, 03
    JMP R11
detail_3_digit_2:
    LIL R4, 30
    LIH R4, 07
detail_3_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 38 ; detail_3_digit_3: 0338
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 3A ; detail_3_emit_3: 033A
    LIH R11, 03
    JMP R11
detail_3_digit_3:
    LIL R4, 30
    LIH R4, 07
detail_3_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 02
    LIH R6, 02
    LIL R7, 01
    LIH R7, 00
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 58
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 50
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 43
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 54
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 44
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, F3
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 14
    LIH R6, 02
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 84 ; detail_4_digit_0: 0384
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 86 ; detail_4_emit_0: 0386
    LIH R11, 03
    JMP R11
detail_4_digit_0:
    LIL R4, 30
    LIH R4, 07
detail_4_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, A1 ; detail_4_digit_1: 03A1
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, A3 ; detail_4_emit_1: 03A3
    LIH R11, 03
    JMP R11
detail_4_digit_1:
    LIL R4, 30
    LIH R4, 07
detail_4_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, BA ; detail_4_digit_2: 03BA
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, BC ; detail_4_emit_2: 03BC
    LIH R11, 03
    JMP R11
detail_4_digit_2:
    LIL R4, 30
    LIH R4, 07
detail_4_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, CF ; detail_4_digit_3: 03CF
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, D1 ; detail_4_emit_3: 03D1
    LIH R11, 03
    JMP R11
detail_4_digit_3:
    LIL R4, 30
    LIH R4, 07
detail_4_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 02
    LIH R6, 03
    LIL R7, 01
    LIH R7, 00
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 44
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 44
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, 00
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 14
    LIH R6, 03
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 07 ; result_0_digit_0: 0407
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 09 ; result_0_emit_0: 0409
    LIH R11, 04
    JMP R11
result_0_digit_0:
    LIL R4, 30
    LIH R4, 07
result_0_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 24 ; result_0_digit_1: 0424
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 26 ; result_0_emit_1: 0426
    LIH R11, 04
    JMP R11
result_0_digit_1:
    LIL R4, 30
    LIH R4, 07
result_0_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 3D ; result_0_digit_2: 043D
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 3F ; result_0_emit_2: 043F
    LIH R11, 04
    JMP R11
result_0_digit_2:
    LIL R4, 30
    LIH R4, 07
result_0_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 52 ; result_0_digit_3: 0452
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 54 ; result_0_emit_3: 0454
    LIH R11, 04
    JMP R11
result_0_digit_3:
    LIL R4, 30
    LIH R4, 07
result_0_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 82
    LIH R6, 03
    LIL R7, 01
    LIH R7, 00
    LIL R2, 53
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 55
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 42
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, 01
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 94
    LIH R6, 03
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 8A ; result_1_digit_0: 048A
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 8C ; result_1_emit_0: 048C
    LIH R11, 04
    JMP R11
result_1_digit_0:
    LIL R4, 30
    LIH R4, 07
result_1_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, A7 ; result_1_digit_1: 04A7
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, A9 ; result_1_emit_1: 04A9
    LIH R11, 04
    JMP R11
result_1_digit_1:
    LIL R4, 30
    LIH R4, 07
result_1_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, C0 ; result_1_digit_2: 04C0
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, C2 ; result_1_emit_2: 04C2
    LIH R11, 04
    JMP R11
result_1_digit_2:
    LIL R4, 30
    LIH R4, 07
result_1_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, D5 ; result_1_digit_3: 04D5
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, D7 ; result_1_emit_3: 04D7
    LIH R11, 04
    JMP R11
result_1_digit_3:
    LIL R4, 30
    LIH R4, 07
result_1_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 02
    LIH R6, 04
    LIL R7, 01
    LIH R7, 00
    LIL R2, 4E
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4E
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 44
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, 02
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 14
    LIH R6, 04
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 11 ; result_2_digit_0: 0511
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 13 ; result_2_emit_0: 0513
    LIH R11, 05
    JMP R11
result_2_digit_0:
    LIL R4, 30
    LIH R4, 07
result_2_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 2E ; result_2_digit_1: 052E
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 30 ; result_2_emit_1: 0530
    LIH R11, 05
    JMP R11
result_2_digit_1:
    LIL R4, 30
    LIH R4, 07
result_2_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 47 ; result_2_digit_2: 0547
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 49 ; result_2_emit_2: 0549
    LIH R11, 05
    JMP R11
result_2_digit_2:
    LIL R4, 30
    LIH R4, 07
result_2_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 5C ; result_2_digit_3: 055C
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 5E ; result_2_emit_3: 055E
    LIH R11, 05
    JMP R11
result_2_digit_3:
    LIL R4, 30
    LIH R4, 07
result_2_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 82
    LIH R6, 04
    LIL R7, 01
    LIH R7, 00
    LIL R2, 53
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4C
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4C
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, 03
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 94
    LIH R6, 04
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 94 ; result_3_digit_0: 0594
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 96 ; result_3_emit_0: 0596
    LIH R11, 05
    JMP R11
result_3_digit_0:
    LIL R4, 30
    LIH R4, 07
result_3_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, B1 ; result_3_digit_1: 05B1
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, B3 ; result_3_emit_1: 05B3
    LIH R11, 05
    JMP R11
result_3_digit_1:
    LIL R4, 30
    LIH R4, 07
result_3_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, CA ; result_3_digit_2: 05CA
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, CC ; result_3_emit_2: 05CC
    LIH R11, 05
    JMP R11
result_3_digit_2:
    LIL R4, 30
    LIH R4, 07
result_3_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, DF ; result_3_digit_3: 05DF
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, E1 ; result_3_emit_3: 05E1
    LIH R11, 05
    JMP R11
result_3_digit_3:
    LIL R4, 30
    LIH R4, 07
result_3_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 02
    LIH R6, 05
    LIL R7, 01
    LIH R7, 00
    LIL R2, 53
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4C
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, 04
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 14
    LIH R6, 05
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 17 ; result_4_digit_0: 0617
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 19 ; result_4_emit_0: 0619
    LIH R11, 06
    JMP R11
result_4_digit_0:
    LIL R4, 30
    LIH R4, 07
result_4_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 34 ; result_4_digit_1: 0634
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 36 ; result_4_emit_1: 0636
    LIH R11, 06
    JMP R11
result_4_digit_1:
    LIL R4, 30
    LIH R4, 07
result_4_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 4D ; result_4_digit_2: 064D
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 4F ; result_4_emit_2: 064F
    LIH R11, 06
    JMP R11
result_4_digit_2:
    LIL R4, 30
    LIH R4, 07
result_4_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 62 ; result_4_digit_3: 0662
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 64 ; result_4_emit_3: 0664
    LIH R11, 06
    JMP R11
result_4_digit_3:
    LIL R4, 30
    LIH R4, 07
result_4_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 82
    LIH R6, 05
    LIL R7, 01
    LIH R7, 00
    LIL R2, 53
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4C
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, 05
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 94
    LIH R6, 05
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 9A ; result_5_digit_0: 069A
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 9C ; result_5_emit_0: 069C
    LIH R11, 06
    JMP R11
result_5_digit_0:
    LIL R4, 30
    LIH R4, 07
result_5_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, B7 ; result_5_digit_1: 06B7
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, B9 ; result_5_emit_1: 06B9
    LIH R11, 06
    JMP R11
result_5_digit_1:
    LIL R4, 30
    LIH R4, 07
result_5_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, D0 ; result_5_digit_2: 06D0
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, D2 ; result_5_emit_2: 06D2
    LIH R11, 06
    JMP R11
result_5_digit_2:
    LIL R4, 30
    LIH R4, 07
result_5_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, E5 ; result_5_digit_3: 06E5
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, E7 ; result_5_emit_3: 06E7
    LIH R11, 06
    JMP R11
result_5_digit_3:
    LIL R4, 30
    LIH R4, 07
result_5_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 02
    LIH R6, 06
    LIL R7, 01
    LIH R7, 00
    LIL R2, 53
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, 06
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 14
    LIH R6, 06
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 1D ; result_6_digit_0: 071D
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 1F ; result_6_emit_0: 071F
    LIH R11, 07
    JMP R11
result_6_digit_0:
    LIL R4, 30
    LIH R4, 07
result_6_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 3A ; result_6_digit_1: 073A
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 3C ; result_6_emit_1: 073C
    LIH R11, 07
    JMP R11
result_6_digit_1:
    LIL R4, 30
    LIH R4, 07
result_6_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 53 ; result_6_digit_2: 0753
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 55 ; result_6_emit_2: 0755
    LIH R11, 07
    JMP R11
result_6_digit_2:
    LIL R4, 30
    LIH R4, 07
result_6_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 68 ; result_6_digit_3: 0768
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 6A ; result_6_emit_3: 076A
    LIH R11, 07
    JMP R11
result_6_digit_3:
    LIL R4, 30
    LIH R4, 07
result_6_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 82
    LIH R6, 06
    LIL R7, 01
    LIH R7, 00
    LIL R2, 4C
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 49
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4C
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 50
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 53
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 56
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, 07
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 94
    LIH R6, 06
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, C4 ; result_7_digit_0: 07C4
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, C6 ; result_7_emit_0: 07C6
    LIH R11, 07
    JMP R11
result_7_digit_0:
    LIL R4, 30
    LIH R4, 07
result_7_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, E1 ; result_7_digit_1: 07E1
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, E3 ; result_7_emit_1: 07E3
    LIH R11, 07
    JMP R11
result_7_digit_1:
    LIL R4, 30
    LIH R4, 07
result_7_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, FA ; result_7_digit_2: 07FA
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, FC ; result_7_emit_2: 07FC
    LIH R11, 07
    JMP R11
result_7_digit_2:
    LIL R4, 30
    LIH R4, 07
result_7_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 0F ; result_7_digit_3: 080F
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 11 ; result_7_emit_3: 0811
    LIH R11, 08
    JMP R11
result_7_digit_3:
    LIL R4, 30
    LIH R4, 07
result_7_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 02
    LIH R6, 07
    LIL R7, 01
    LIH R7, 00
    LIL R2, 4C
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 49
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 48
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 50
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 53
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 56
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, 08
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 14
    LIH R6, 07
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 6B ; result_8_digit_0: 086B
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 6D ; result_8_emit_0: 086D
    LIH R11, 08
    JMP R11
result_8_digit_0:
    LIL R4, 30
    LIH R4, 07
result_8_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 88 ; result_8_digit_1: 0888
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 8A ; result_8_emit_1: 088A
    LIH R11, 08
    JMP R11
result_8_digit_1:
    LIL R4, 30
    LIH R4, 07
result_8_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, A1 ; result_8_digit_2: 08A1
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, A3 ; result_8_emit_2: 08A3
    LIH R11, 08
    JMP R11
result_8_digit_2:
    LIL R4, 30
    LIH R4, 07
result_8_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, B6 ; result_8_digit_3: 08B6
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, B8 ; result_8_emit_3: 08B8
    LIH R11, 08
    JMP R11
result_8_digit_3:
    LIL R4, 30
    LIH R4, 07
result_8_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 82
    LIH R6, 07
    LIL R7, 01
    LIH R7, 00
    LIL R2, 4C
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 54
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 53
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 54
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 57
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 49
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 54
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, 09
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 94
    LIH R6, 07
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 16 ; result_9_digit_0: 0916
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 18 ; result_9_emit_0: 0918
    LIH R11, 09
    JMP R11
result_9_digit_0:
    LIL R4, 30
    LIH R4, 07
result_9_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 33 ; result_9_digit_1: 0933
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 35 ; result_9_emit_1: 0935
    LIH R11, 09
    JMP R11
result_9_digit_1:
    LIL R4, 30
    LIH R4, 07
result_9_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 4C ; result_9_digit_2: 094C
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 4E ; result_9_emit_2: 094E
    LIH R11, 09
    JMP R11
result_9_digit_2:
    LIL R4, 30
    LIH R4, 07
result_9_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 61 ; result_9_digit_3: 0961
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 63 ; result_9_emit_3: 0963
    LIH R11, 09
    JMP R11
result_9_digit_3:
    LIL R4, 30
    LIH R4, 07
result_9_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 02
    LIH R6, 08
    LIL R7, 01
    LIH R7, 00
    LIL R2, 42
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4F
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 54
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 48
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4F
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 50
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4E
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 44
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 53
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, 0A
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 14
    LIH R6, 08
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, C1 ; result_10_digit_0: 09C1
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, C3 ; result_10_emit_0: 09C3
    LIH R11, 09
    JMP R11
result_10_digit_0:
    LIL R4, 30
    LIH R4, 07
result_10_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, DE ; result_10_digit_1: 09DE
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, E0 ; result_10_emit_1: 09E0
    LIH R11, 09
    JMP R11
result_10_digit_1:
    LIL R4, 30
    LIH R4, 07
result_10_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, F7 ; result_10_digit_2: 09F7
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, F9 ; result_10_emit_2: 09F9
    LIH R11, 09
    JMP R11
result_10_digit_2:
    LIL R4, 30
    LIH R4, 07
result_10_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 0C ; result_10_digit_3: 0A0C
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 0E ; result_10_emit_3: 0A0E
    LIH R11, 0A
    JMP R11
result_10_digit_3:
    LIL R4, 30
    LIH R4, 07
result_10_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 82
    LIH R6, 08
    LIL R7, 01
    LIH R7, 00
    LIL R2, 57
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 42
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4F
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 57
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 44
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, 0B
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 94
    LIH R6, 08
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 60 ; result_11_digit_0: 0A60
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 62 ; result_11_emit_0: 0A62
    LIH R11, 0A
    JMP R11
result_11_digit_0:
    LIL R4, 30
    LIH R4, 07
result_11_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 7D ; result_11_digit_1: 0A7D
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 7F ; result_11_emit_1: 0A7F
    LIH R11, 0A
    JMP R11
result_11_digit_1:
    LIL R4, 30
    LIH R4, 07
result_11_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 96 ; result_11_digit_2: 0A96
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 98 ; result_11_emit_2: 0A98
    LIH R11, 0A
    JMP R11
result_11_digit_2:
    LIL R4, 30
    LIH R4, 07
result_11_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, AB ; result_11_digit_3: 0AAB
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, AD ; result_11_emit_3: 0AAD
    LIH R11, 0A
    JMP R11
result_11_digit_3:
    LIL R4, 30
    LIH R4, 07
result_11_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 02
    LIH R6, 09
    LIL R7, 01
    LIH R7, 00
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 44
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 44
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 57
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 50
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, 0C
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 14
    LIH R6, 09
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, F7 ; result_12_digit_0: 0AF7
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, F9 ; result_12_emit_0: 0AF9
    LIH R11, 0A
    JMP R11
result_12_digit_0:
    LIL R4, 30
    LIH R4, 07
result_12_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 14 ; result_12_digit_1: 0B14
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 16 ; result_12_emit_1: 0B16
    LIH R11, 0B
    JMP R11
result_12_digit_1:
    LIL R4, 30
    LIH R4, 07
result_12_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 2D ; result_12_digit_2: 0B2D
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 2F ; result_12_emit_2: 0B2F
    LIH R11, 0B
    JMP R11
result_12_digit_2:
    LIL R4, 30
    LIH R4, 07
result_12_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 42 ; result_12_digit_3: 0B42
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 44 ; result_12_emit_3: 0B44
    LIH R11, 0B
    JMP R11
result_12_digit_3:
    LIL R4, 30
    LIH R4, 07
result_12_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 82
    LIH R6, 09
    LIL R7, 01
    LIH R7, 00
    LIL R2, 53
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 55
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 42
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 57
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 50
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, 0D
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 94
    LIH R6, 09
    LIL R7, 01
    LIH R7, 00
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, 8E ; result_13_digit_0: 0B8E
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 90 ; result_13_emit_0: 0B90
    LIH R11, 0B
    JMP R11
result_13_digit_0:
    LIL R4, 30
    LIH R4, 07
result_13_emit_0:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, AB ; result_13_digit_1: 0BAB
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, AD ; result_13_emit_1: 0BAD
    LIH R11, 0B
    JMP R11
result_13_digit_1:
    LIL R4, 30
    LIH R4, 07
result_13_emit_1:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    SRL R2, R2
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, C4 ; result_13_digit_2: 0BC4
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, C6 ; result_13_emit_2: 0BC6
    LIH R11, 0B
    JMP R11
result_13_digit_2:
    LIL R4, 30
    LIH R4, 07
result_13_emit_2:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    ADD R2, R1, R0
    LIL R4, 0F
    LIH R4, 00
    NAND R2, R2, R4
    NAND R2, R2, R2
    LIL R4, 0A
    LIH R4, 00
    LIL R11, D9 ; result_13_digit_3: 0BD9
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, DB ; result_13_emit_3: 0BDB
    LIH R11, 0B
    JMP R11
result_13_digit_3:
    LIL R4, 30
    LIH R4, 07
result_13_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, F4
    LIH R9, 30
    LIL R1, FE
    LIH R1, CA
    STORE [R9], R1
halt:
    LIL R11, E3 ; halt: 0BE3
    LIH R11, 0B
    JMP R11
