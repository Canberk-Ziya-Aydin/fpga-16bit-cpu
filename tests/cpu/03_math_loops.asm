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
    LIL R1, 0D
    LIH R1, 00
    LIL R2, 11
    LIH R2, 00
    LIL R3, 00
    LIH R3, 00
    LIL R4, 01
    LIH R4, 00
    LIL R5, 35 ; multiply: 0035
    LIH R5, 00
    LIL R6, 3A ; multiply_done: 003A
    LIH R6, 00
multiply:
    CMP R2, R0
    BEQ R6
    ADD R3, R3, R1
    SUB R2, R2, R4
    JMP R5
multiply_done:
    LIL R9, 00
    LIH R9, 30
    STORE [R9], R3
    LIL R8, DD
    LIH R8, 00
    LIL R10, 01
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R3
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 4E ; check_01_ok: 004E
    LIH R11, 00
    CMP R3, R8
    BEQ R11
    LIL R11, AF ; failure: 00AF
    LIH R11, 00
    JMP R11
check_01_ok:
    LIL R1, 2F
    LIH R1, 00
    LIL R2, 06
    LIH R2, 00
    LIL R3, 00
    LIH R3, 00
    LIL R4, 01
    LIH R4, 00
    LIL R5, 5A ; divide: 005A
    LIH R5, 00
    LIL R6, 5F ; divide_done: 005F
    LIH R6, 00
divide:
    CMP R1, R2
    BLT R6
    SUB R1, R1, R2
    ADD R3, R3, R4
    JMP R5
divide_done:
    LIL R9, 01
    LIH R9, 30
    STORE [R9], R3
    LIL R8, 07
    LIH R8, 00
    LIL R10, 02
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R3
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 73 ; check_02_ok: 0073
    LIH R11, 00
    CMP R3, R8
    BEQ R11
    LIL R11, AF ; failure: 00AF
    LIH R11, 00
    JMP R11
check_02_ok:
    LIL R9, 02
    LIH R9, 30
    STORE [R9], R1
    LIL R8, 05
    LIH R8, 00
    LIL R10, 03
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 87 ; check_03_ok: 0087
    LIH R11, 00
    CMP R1, R8
    BEQ R11
    LIL R11, AF ; failure: 00AF
    LIH R11, 00
    JMP R11
check_03_ok:
    LIL R1, 2F
    LIH R1, 04
    LIL R2, CE
    LIH R2, 01
    LIL R5, 91 ; gcd_loop: 0091
    LIH R5, 00
    LIL R6, 96 ; gcd_b_larger: 0096
    LIH R6, 00
    LIL R7, 98 ; gcd_done: 0098
    LIH R7, 00
gcd_loop:
    CMP R1, R2
    BEQ R7
    BLT R6
    SUB R1, R1, R2
    JMP R5
gcd_b_larger:
    SUB R2, R2, R1
    JMP R5
gcd_done:
    LIL R9, 03
    LIH R9, 30
    STORE [R9], R1
    LIL R8, 15
    LIH R8, 00
    LIL R10, 04
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, AC ; check_04_ok: 00AC
    LIH R11, 00
    CMP R1, R8
    BEQ R11
    LIL R11, AF ; failure: 00AF
    LIH R11, 00
    JMP R11
check_04_ok:
    LIL R11, B7 ; success: 00B7
    LIH R11, 00
    JMP R11
failure:
    LIL R9, F1
    LIH R9, 30
    STORE [R9], R10
    LIL R1, D0
    LIH R1, BA
    LIL R11, B9 ; status: 00B9
    LIH R11, 00
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
    LIL R2, 4D
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 55
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4C
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 54
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 49
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 50
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4C
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 59
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
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
    LIL R2, 56
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 49
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 44
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
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
    LIL R2, 47
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 43
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 44
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, F0
    LIH R9, 30
    LOAD R1, [R9]
    LIL R4, 0D
    LIH R4, 60
    LIL R11, 3C ; show_pass: 013C
    LIH R11, 01
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
    LIL R11, 50 ; details: 0150
    LIH R11, 01
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
    LIL R11, 8B ; detail_2_digit_0: 018B
    LIH R11, 01
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 8D ; detail_2_emit_0: 018D
    LIH R11, 01
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
    LIL R11, A8 ; detail_2_digit_1: 01A8
    LIH R11, 01
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, AA ; detail_2_emit_1: 01AA
    LIH R11, 01
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
    LIL R11, C1 ; detail_2_digit_2: 01C1
    LIH R11, 01
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, C3 ; detail_2_emit_2: 01C3
    LIH R11, 01
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
    LIL R11, D6 ; detail_2_digit_3: 01D6
    LIH R11, 01
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, D8 ; detail_2_emit_3: 01D8
    LIH R11, 01
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
    LIL R11, 1A ; detail_3_digit_0: 021A
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 1C ; detail_3_emit_0: 021C
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
    LIL R11, 37 ; detail_3_digit_1: 0237
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 39 ; detail_3_emit_1: 0239
    LIH R11, 02
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
    LIL R11, 50 ; detail_3_digit_2: 0250
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 52 ; detail_3_emit_2: 0252
    LIH R11, 02
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
    LIL R11, 65 ; detail_3_digit_3: 0265
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 67 ; detail_3_emit_3: 0267
    LIH R11, 02
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
    LIL R11, B1 ; detail_4_digit_0: 02B1
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, B3 ; detail_4_emit_0: 02B3
    LIH R11, 02
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
    LIL R11, CE ; detail_4_digit_1: 02CE
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, D0 ; detail_4_emit_1: 02D0
    LIH R11, 02
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
    LIL R11, E7 ; detail_4_digit_2: 02E7
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, E9 ; detail_4_emit_2: 02E9
    LIH R11, 02
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
    LIL R11, FC ; detail_4_digit_3: 02FC
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, FE ; detail_4_emit_3: 02FE
    LIH R11, 02
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
    LIL R2, 31
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 33
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 54
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 49
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4D
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
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 31
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 37
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
    LIL R11, 54 ; result_0_digit_0: 0354
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 56 ; result_0_emit_0: 0356
    LIH R11, 03
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
    LIL R11, 71 ; result_0_digit_1: 0371
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 73 ; result_0_emit_1: 0373
    LIH R11, 03
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
    LIL R11, 8A ; result_0_digit_2: 038A
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 8C ; result_0_emit_2: 038C
    LIH R11, 03
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
    LIL R11, 9F ; result_0_digit_3: 039F
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, A1 ; result_0_emit_3: 03A1
    LIH R11, 03
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
    LIL R2, 34
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 37
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 44
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 49
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 56
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 36
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
    LIL R11, EB ; result_1_digit_0: 03EB
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, ED ; result_1_emit_0: 03ED
    LIH R11, 03
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
    LIL R11, 08 ; result_1_digit_1: 0408
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 0A ; result_1_emit_1: 040A
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
    LIL R11, 21 ; result_1_digit_2: 0421
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 23 ; result_1_emit_2: 0423
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
    LIL R11, 36 ; result_1_digit_3: 0436
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 38 ; result_1_emit_3: 0438
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
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4D
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 49
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
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
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
    LIL R11, 86 ; result_2_digit_0: 0486
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 88 ; result_2_emit_0: 0488
    LIH R11, 04
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
    LIL R11, A3 ; result_2_digit_1: 04A3
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, A5 ; result_2_emit_1: 04A5
    LIH R11, 04
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
    LIL R11, BC ; result_2_digit_2: 04BC
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, BE ; result_2_emit_2: 04BE
    LIH R11, 04
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
    LIL R11, D1 ; result_2_digit_3: 04D1
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, D3 ; result_2_emit_3: 04D3
    LIH R11, 04
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
    LIL R2, 47
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 43
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
    LIL R2, 31
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 37
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 31
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 34
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 36
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 32
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
    LIL R11, 2D ; result_3_digit_0: 052D
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 2F ; result_3_emit_0: 052F
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
    LIL R11, 4A ; result_3_digit_1: 054A
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 4C ; result_3_emit_1: 054C
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
    LIL R11, 63 ; result_3_digit_2: 0563
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 65 ; result_3_emit_2: 0565
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
    LIL R11, 78 ; result_3_digit_3: 0578
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 7A ; result_3_emit_3: 057A
    LIH R11, 05
    JMP R11
result_3_digit_3:
    LIL R4, 30
    LIH R4, 07
result_3_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, F4
    LIH R9, 30
    LIL R1, FE
    LIH R1, CA
    STORE [R9], R1
halt:
    LIL R11, 82 ; halt: 0582
    LIH R11, 05
    JMP R11
