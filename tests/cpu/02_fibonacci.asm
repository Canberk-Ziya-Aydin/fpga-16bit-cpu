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
    LIL R9, 0E
    LIH R9, 30
    STORE [R9], R0
    LIL R9, 0F
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
    LIL R1, 00
    LIH R1, 00
    LIL R2, 01
    LIH R2, 00
    LIL R3, 10
    LIH R3, 00
    LIL R4, 00
    LIH R4, 30
    LIL R5, 01
    LIH R5, 00
    LIL R6, 5B ; fib_loop: 005B
    LIH R6, 00
    LIL R11, 64 ; fib_done: 0064
    LIH R11, 00
fib_loop:
    STORE [R4], R1
    ADD R7, R1, R2
    ADD R1, R2, R0
    ADD R2, R7, R0
    ADD R4, R4, R5
    SUB R3, R3, R5
    CMP R3, R0
    BEQ R11
    JMP R6
fib_done:
    LIL R9, 00
    LIH R9, 30
    LOAD R1, [R9]
    LIL R8, 00
    LIH R8, 00
    LIL R10, 01
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 78 ; check_01_ok: 0078
    LIH R11, 00
    CMP R1, R8
    BEQ R11
    LIL R11, A7 ; failure: 01A7
    LIH R11, 01
    JMP R11
check_01_ok:
    LIL R9, 01
    LIH R9, 30
    LOAD R1, [R9]
    LIL R8, 01
    LIH R8, 00
    LIL R10, 02
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 8C ; check_02_ok: 008C
    LIH R11, 00
    CMP R1, R8
    BEQ R11
    LIL R11, A7 ; failure: 01A7
    LIH R11, 01
    JMP R11
check_02_ok:
    LIL R9, 02
    LIH R9, 30
    LOAD R1, [R9]
    LIL R8, 01
    LIH R8, 00
    LIL R10, 03
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, A0 ; check_03_ok: 00A0
    LIH R11, 00
    CMP R1, R8
    BEQ R11
    LIL R11, A7 ; failure: 01A7
    LIH R11, 01
    JMP R11
check_03_ok:
    LIL R9, 03
    LIH R9, 30
    LOAD R1, [R9]
    LIL R8, 02
    LIH R8, 00
    LIL R10, 04
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, B4 ; check_04_ok: 00B4
    LIH R11, 00
    CMP R1, R8
    BEQ R11
    LIL R11, A7 ; failure: 01A7
    LIH R11, 01
    JMP R11
check_04_ok:
    LIL R9, 04
    LIH R9, 30
    LOAD R1, [R9]
    LIL R8, 03
    LIH R8, 00
    LIL R10, 05
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, C8 ; check_05_ok: 00C8
    LIH R11, 00
    CMP R1, R8
    BEQ R11
    LIL R11, A7 ; failure: 01A7
    LIH R11, 01
    JMP R11
check_05_ok:
    LIL R9, 05
    LIH R9, 30
    LOAD R1, [R9]
    LIL R8, 05
    LIH R8, 00
    LIL R10, 06
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, DC ; check_06_ok: 00DC
    LIH R11, 00
    CMP R1, R8
    BEQ R11
    LIL R11, A7 ; failure: 01A7
    LIH R11, 01
    JMP R11
check_06_ok:
    LIL R9, 06
    LIH R9, 30
    LOAD R1, [R9]
    LIL R8, 08
    LIH R8, 00
    LIL R10, 07
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, F0 ; check_07_ok: 00F0
    LIH R11, 00
    CMP R1, R8
    BEQ R11
    LIL R11, A7 ; failure: 01A7
    LIH R11, 01
    JMP R11
check_07_ok:
    LIL R9, 07
    LIH R9, 30
    LOAD R1, [R9]
    LIL R8, 0D
    LIH R8, 00
    LIL R10, 08
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 04 ; check_08_ok: 0104
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, A7 ; failure: 01A7
    LIH R11, 01
    JMP R11
check_08_ok:
    LIL R9, 08
    LIH R9, 30
    LOAD R1, [R9]
    LIL R8, 15
    LIH R8, 00
    LIL R10, 09
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 18 ; check_09_ok: 0118
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, A7 ; failure: 01A7
    LIH R11, 01
    JMP R11
check_09_ok:
    LIL R9, 09
    LIH R9, 30
    LOAD R1, [R9]
    LIL R8, 22
    LIH R8, 00
    LIL R10, 0A
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 2C ; check_0A_ok: 012C
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, A7 ; failure: 01A7
    LIH R11, 01
    JMP R11
check_0A_ok:
    LIL R9, 0A
    LIH R9, 30
    LOAD R1, [R9]
    LIL R8, 37
    LIH R8, 00
    LIL R10, 0B
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 40 ; check_0B_ok: 0140
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, A7 ; failure: 01A7
    LIH R11, 01
    JMP R11
check_0B_ok:
    LIL R9, 0B
    LIH R9, 30
    LOAD R1, [R9]
    LIL R8, 59
    LIH R8, 00
    LIL R10, 0C
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 54 ; check_0C_ok: 0154
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, A7 ; failure: 01A7
    LIH R11, 01
    JMP R11
check_0C_ok:
    LIL R9, 0C
    LIH R9, 30
    LOAD R1, [R9]
    LIL R8, 90
    LIH R8, 00
    LIL R10, 0D
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 68 ; check_0D_ok: 0168
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, A7 ; failure: 01A7
    LIH R11, 01
    JMP R11
check_0D_ok:
    LIL R9, 0D
    LIH R9, 30
    LOAD R1, [R9]
    LIL R8, E9
    LIH R8, 00
    LIL R10, 0E
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 7C ; check_0E_ok: 017C
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, A7 ; failure: 01A7
    LIH R11, 01
    JMP R11
check_0E_ok:
    LIL R9, 0E
    LIH R9, 30
    LOAD R1, [R9]
    LIL R8, 79
    LIH R8, 01
    LIL R10, 0F
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 90 ; check_0F_ok: 0190
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, A7 ; failure: 01A7
    LIH R11, 01
    JMP R11
check_0F_ok:
    LIL R9, 0F
    LIH R9, 30
    LOAD R1, [R9]
    LIL R8, 62
    LIH R8, 02
    LIL R10, 10
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, A4 ; check_10_ok: 01A4
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, A7 ; failure: 01A7
    LIH R11, 01
    JMP R11
check_10_ok:
    LIL R11, AF ; success: 01AF
    LIH R11, 01
    JMP R11
failure:
    LIL R9, F1
    LIH R9, 30
    STORE [R9], R10
    LIL R1, D0
    LIH R1, BA
    LIL R11, B1 ; status: 01B1
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
    LIL R2, 46
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 49
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 42
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4F
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4E
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 43
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 43
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 49
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 2D
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 31
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 36
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 56
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
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
    LIL R2, 45
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 53
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, F0
    LIH R9, 30
    LOAD R1, [R9]
    LIL R4, 0D
    LIH R4, 60
    LIL R11, 2C ; show_pass: 022C
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
    LIL R11, 40 ; details: 0240
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
    LIL R11, 7B ; detail_2_digit_0: 027B
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 7D ; detail_2_emit_0: 027D
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
    LIL R11, 98 ; detail_2_digit_1: 0298
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 9A ; detail_2_emit_1: 029A
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
    LIL R11, B1 ; detail_2_digit_2: 02B1
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, B3 ; detail_2_emit_2: 02B3
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
    LIL R11, C6 ; detail_2_digit_3: 02C6
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, C8 ; detail_2_emit_3: 02C8
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
    LIL R11, 0A ; detail_3_digit_0: 030A
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 0C ; detail_3_emit_0: 030C
    LIH R11, 03
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
    LIL R11, 27 ; detail_3_digit_1: 0327
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 29 ; detail_3_emit_1: 0329
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
    LIL R11, 40 ; detail_3_digit_2: 0340
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 42 ; detail_3_emit_2: 0342
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
    LIL R11, 55 ; detail_3_digit_3: 0355
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 57 ; detail_3_emit_3: 0357
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
    LIL R11, A1 ; detail_4_digit_0: 03A1
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, A3 ; detail_4_emit_0: 03A3
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
    LIL R11, BE ; detail_4_digit_1: 03BE
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, C0 ; detail_4_emit_1: 03C0
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
    LIL R11, D7 ; detail_4_digit_2: 03D7
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, D9 ; detail_4_emit_2: 03D9
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
    LIL R11, EC ; detail_4_digit_3: 03EC
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, EE ; detail_4_emit_3: 03EE
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
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
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
    LIL R11, 24 ; result_0_digit_0: 0424
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 26 ; result_0_emit_0: 0426
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
    LIL R11, 41 ; result_0_digit_1: 0441
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 43 ; result_0_emit_1: 0443
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
    LIL R11, 5A ; result_0_digit_2: 045A
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 5C ; result_0_emit_2: 045C
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
    LIL R11, 6F ; result_0_digit_3: 046F
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 71 ; result_0_emit_3: 0471
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
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 31
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
    LIL R11, A7 ; result_1_digit_0: 04A7
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, A9 ; result_1_emit_0: 04A9
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
    LIL R11, C4 ; result_1_digit_1: 04C4
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, C6 ; result_1_emit_1: 04C6
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
    LIL R11, DD ; result_1_digit_2: 04DD
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, DF ; result_1_emit_2: 04DF
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
    LIL R11, F2 ; result_1_digit_3: 04F2
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, F4 ; result_1_emit_3: 04F4
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
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 32
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
    LIL R11, 2A ; result_2_digit_0: 052A
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 2C ; result_2_emit_0: 052C
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
    LIL R11, 47 ; result_2_digit_1: 0547
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 49 ; result_2_emit_1: 0549
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
    LIL R11, 60 ; result_2_digit_2: 0560
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 62 ; result_2_emit_2: 0562
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
    LIL R11, 75 ; result_2_digit_3: 0575
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 77 ; result_2_emit_3: 0577
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
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 33
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
    LIL R11, AD ; result_3_digit_0: 05AD
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, AF ; result_3_emit_0: 05AF
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
    LIL R11, CA ; result_3_digit_1: 05CA
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, CC ; result_3_emit_1: 05CC
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
    LIL R11, E3 ; result_3_digit_2: 05E3
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, E5 ; result_3_emit_2: 05E5
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
    LIL R11, F8 ; result_3_digit_3: 05F8
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, FA ; result_3_emit_3: 05FA
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
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 34
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
    LIL R11, 30 ; result_4_digit_0: 0630
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 32 ; result_4_emit_0: 0632
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
    LIL R11, 4D ; result_4_digit_1: 064D
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 4F ; result_4_emit_1: 064F
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
    LIL R11, 66 ; result_4_digit_2: 0666
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 68 ; result_4_emit_2: 0668
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
    LIL R11, 7B ; result_4_digit_3: 067B
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 7D ; result_4_emit_3: 067D
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
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 35
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
    LIL R11, B3 ; result_5_digit_0: 06B3
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, B5 ; result_5_emit_0: 06B5
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
    LIL R11, D0 ; result_5_digit_1: 06D0
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, D2 ; result_5_emit_1: 06D2
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
    LIL R11, E9 ; result_5_digit_2: 06E9
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, EB ; result_5_emit_2: 06EB
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
    LIL R11, FE ; result_5_digit_3: 06FE
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 00 ; result_5_emit_3: 0700
    LIH R11, 07
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
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 36
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
    LIL R11, 36 ; result_6_digit_0: 0736
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 38 ; result_6_emit_0: 0738
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
    LIL R11, 53 ; result_6_digit_1: 0753
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 55 ; result_6_emit_1: 0755
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
    LIL R11, 6C ; result_6_digit_2: 076C
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 6E ; result_6_emit_2: 076E
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
    LIL R11, 81 ; result_6_digit_3: 0781
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 83 ; result_6_emit_3: 0783
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
    LIL R2, 46
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
    LIL R11, B9 ; result_7_digit_0: 07B9
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, BB ; result_7_emit_0: 07BB
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
    LIL R11, D6 ; result_7_digit_1: 07D6
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, D8 ; result_7_emit_1: 07D8
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
    LIL R11, EF ; result_7_digit_2: 07EF
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, F1 ; result_7_emit_2: 07F1
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
    LIL R11, 04 ; result_7_digit_3: 0804
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 06 ; result_7_emit_3: 0806
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
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 38
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
    LIL R11, 3C ; result_8_digit_0: 083C
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 3E ; result_8_emit_0: 083E
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
    LIL R11, 59 ; result_8_digit_1: 0859
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 5B ; result_8_emit_1: 085B
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
    LIL R11, 72 ; result_8_digit_2: 0872
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 74 ; result_8_emit_2: 0874
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
    LIL R11, 87 ; result_8_digit_3: 0887
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 89 ; result_8_emit_3: 0889
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
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 39
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
    LIL R11, BF ; result_9_digit_0: 08BF
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, C1 ; result_9_emit_0: 08C1
    LIH R11, 08
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
    LIL R11, DC ; result_9_digit_1: 08DC
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, DE ; result_9_emit_1: 08DE
    LIH R11, 08
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
    LIL R11, F5 ; result_9_digit_2: 08F5
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, F7 ; result_9_emit_2: 08F7
    LIH R11, 08
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
    LIL R11, 0A ; result_9_digit_3: 090A
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 0C ; result_9_emit_3: 090C
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
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
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
    LIL R11, 42 ; result_10_digit_0: 0942
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 44 ; result_10_emit_0: 0944
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
    LIL R11, 5F ; result_10_digit_1: 095F
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 61 ; result_10_emit_1: 0961
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
    LIL R11, 78 ; result_10_digit_2: 0978
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 7A ; result_10_emit_2: 097A
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
    LIL R11, 8D ; result_10_digit_3: 098D
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 8F ; result_10_emit_3: 098F
    LIH R11, 09
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
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 42
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
    LIL R11, C5 ; result_11_digit_0: 09C5
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, C7 ; result_11_emit_0: 09C7
    LIH R11, 09
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
    LIL R11, E2 ; result_11_digit_1: 09E2
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, E4 ; result_11_emit_1: 09E4
    LIH R11, 09
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
    LIL R11, FB ; result_11_digit_2: 09FB
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, FD ; result_11_emit_2: 09FD
    LIH R11, 09
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
    LIL R11, 10 ; result_11_digit_3: 0A10
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 12 ; result_11_emit_3: 0A12
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
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 43
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
    LIL R11, 48 ; result_12_digit_0: 0A48
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 4A ; result_12_emit_0: 0A4A
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
    LIL R11, 65 ; result_12_digit_1: 0A65
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 67 ; result_12_emit_1: 0A67
    LIH R11, 0A
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
    LIL R11, 7E ; result_12_digit_2: 0A7E
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 80 ; result_12_emit_2: 0A80
    LIH R11, 0A
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
    LIL R11, 93 ; result_12_digit_3: 0A93
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 95 ; result_12_emit_3: 0A95
    LIH R11, 0A
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
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 44
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
    LIL R11, CB ; result_13_digit_0: 0ACB
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, CD ; result_13_emit_0: 0ACD
    LIH R11, 0A
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
    LIL R11, E8 ; result_13_digit_1: 0AE8
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, EA ; result_13_emit_1: 0AEA
    LIH R11, 0A
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
    LIL R11, 01 ; result_13_digit_2: 0B01
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 03 ; result_13_emit_2: 0B03
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
    LIL R11, 16 ; result_13_digit_3: 0B16
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 18 ; result_13_emit_3: 0B18
    LIH R11, 0B
    JMP R11
result_13_digit_3:
    LIL R4, 30
    LIH R4, 07
result_13_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 02
    LIH R6, 0A
    LIL R7, 01
    LIH R7, 00
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, 0E
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 14
    LIH R6, 0A
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
    LIL R11, 4E ; result_14_digit_0: 0B4E
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 50 ; result_14_emit_0: 0B50
    LIH R11, 0B
    JMP R11
result_14_digit_0:
    LIL R4, 30
    LIH R4, 07
result_14_emit_0:
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
    LIL R11, 6B ; result_14_digit_1: 0B6B
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 6D ; result_14_emit_1: 0B6D
    LIH R11, 0B
    JMP R11
result_14_digit_1:
    LIL R4, 30
    LIH R4, 07
result_14_emit_1:
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
    LIL R11, 84 ; result_14_digit_2: 0B84
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 86 ; result_14_emit_2: 0B86
    LIH R11, 0B
    JMP R11
result_14_digit_2:
    LIL R4, 30
    LIH R4, 07
result_14_emit_2:
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
    LIL R11, 99 ; result_14_digit_3: 0B99
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 9B ; result_14_emit_3: 0B9B
    LIH R11, 0B
    JMP R11
result_14_digit_3:
    LIL R4, 30
    LIH R4, 07
result_14_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R6, 82
    LIH R6, 0A
    LIL R7, 01
    LIH R7, 00
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 30
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, 0F
    LIH R9, 30
    LOAD R1, [R9]
    LIL R6, 94
    LIH R6, 0A
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
    LIL R11, D1 ; result_15_digit_0: 0BD1
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, D3 ; result_15_emit_0: 0BD3
    LIH R11, 0B
    JMP R11
result_15_digit_0:
    LIL R4, 30
    LIH R4, 07
result_15_emit_0:
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
    LIL R11, EE ; result_15_digit_1: 0BEE
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, F0 ; result_15_emit_1: 0BF0
    LIH R11, 0B
    JMP R11
result_15_digit_1:
    LIL R4, 30
    LIH R4, 07
result_15_emit_1:
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
    LIL R11, 07 ; result_15_digit_2: 0C07
    LIH R11, 0C
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 09 ; result_15_emit_2: 0C09
    LIH R11, 0C
    JMP R11
result_15_digit_2:
    LIL R4, 30
    LIH R4, 07
result_15_emit_2:
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
    LIL R11, 1C ; result_15_digit_3: 0C1C
    LIH R11, 0C
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 1E ; result_15_emit_3: 0C1E
    LIH R11, 0C
    JMP R11
result_15_digit_3:
    LIL R4, 30
    LIH R4, 07
result_15_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, F4
    LIH R9, 30
    LIL R1, FE
    LIH R1, CA
    STORE [R9], R1
halt:
    LIL R11, 26 ; halt: 0C26
    LIH R11, 0C
    JMP R11
