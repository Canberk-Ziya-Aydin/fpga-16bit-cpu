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
    LIL R1, 5A
    LIH R1, A5
    LIL R2, 3D
    LIH R2, 00
    LIL R3, 00
    LIH R3, 01
    LIL R4, 00
    LIH R4, 40
    LIL R5, 01
    LIH R5, 00
    LIL R6, 52 ; fill: 0052
    LIH R6, 00
    LIL R7, 59 ; filled: 0059
    LIH R7, 00
fill:
    STORE [R4], R1
    ADD R1, R1, R2
    ADD R4, R4, R5
    SUB R3, R3, R5
    CMP R3, R0
    BEQ R7
    JMP R6
filled:
    LIL R1, 5A
    LIH R1, A5
    LIL R3, 00
    LIH R3, 01
    LIL R4, 00
    LIH R4, 40
    LIL R6, 63 ; verify: 0063
    LIH R6, 00
    LIL R7, 7C ; verified: 007C
    LIH R7, 00
verify:
    LOAD R2, [R4]
    ADD R8, R1, R0
    LIL R10, 01
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R2
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 74 ; check_01_ok: 0074
    LIH R11, 00
    CMP R2, R8
    BEQ R11
    LIL R11, FC ; failure: 01FC
    LIH R11, 01
    JMP R11
check_01_ok:
    LIL R2, 3D
    LIH R2, 00
    ADD R1, R1, R2
    ADD R4, R4, R5
    SUB R3, R3, R5
    CMP R3, R0
    BEQ R7
    JMP R6
verified:
    LIL R1, 00
    LIH R1, 01
    LIL R9, 00
    LIH R9, 30
    STORE [R9], R1
    LIL R8, 00
    LIH R8, 01
    LIL R10, 02
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 92 ; check_02_ok: 0092
    LIH R11, 00
    CMP R1, R8
    BEQ R11
    LIL R11, FC ; failure: 01FC
    LIH R11, 01
    JMP R11
check_02_ok:
    LIL R9, FF
    LIH R9, 40
    LOAD R1, [R9]
    LIL R9, 01
    LIH R9, 30
    STORE [R9], R1
    LIL R8, 1D
    LIH R8, E2
    LIL R10, 03
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, A9 ; check_03_ok: 00A9
    LIH R11, 00
    CMP R1, R8
    BEQ R11
    LIL R11, FC ; failure: 01FC
    LIH R11, 01
    JMP R11
check_03_ok:
    LIL R9, 00
    LIH R9, 70
    LIL R1, 00
    LIH R1, 71
    STORE [R9], R1
    LIL R9, 00
    LIH R9, 71
    LIL R2, 68
    LIH R2, 24
    STORE [R9], R2
    LOAD R1, [R9]
    ADD R2, R1, R1
    LIL R9, 02
    LIH R9, 30
    STORE [R9], R2
    LIL R8, D0
    LIH R8, 48
    LIL R10, 04
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R2
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, C9 ; check_04_ok: 00C9
    LIH R11, 00
    CMP R2, R8
    BEQ R11
    LIL R11, FC ; failure: 01FC
    LIH R11, 01
    JMP R11
check_04_ok:
    LIL R9, 00
    LIH R9, 70
    LOAD R1, [R9]
    LOAD R2, [R1]
    LIL R9, 03
    LIH R9, 30
    STORE [R9], R2
    LIL R8, 68
    LIH R8, 24
    LIL R10, 05
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R2
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, E1 ; check_05_ok: 00E1
    LIH R11, 00
    CMP R2, R8
    BEQ R11
    LIL R11, FC ; failure: 01FC
    LIH R11, 01
    JMP R11
check_05_ok:
    LIL R9, 00
    LIH R9, 71
    LIL R4, 00
    LIH R4, 72
    LOAD R1, [R9]
    STORE [R4], R1
    LOAD R2, [R4]
    LIL R9, 04
    LIH R9, 30
    STORE [R9], R2
    LIL R8, 68
    LIH R8, 24
    LIL R10, 06
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R2
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, FC ; check_06_ok: 00FC
    LIH R11, 00
    CMP R2, R8
    BEQ R11
    LIL R11, FC ; failure: 01FC
    LIH R11, 01
    JMP R11
check_06_ok:
    LIL R9, 00
    LIH R9, 71
    STORE [R9], R0
    LIL R9, 00
    LIH R9, 70
    LIL R2, 68
    LIH R2, 24
    LOAD R1, [R9]
    STORE [R1], R2
    LIL R9, 00
    LIH R9, 71
    LOAD R1, [R9]
    LIL R8, 68
    LIH R8, 24
    LIL R10, 07
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 19 ; check_07_ok: 0119
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, FC ; failure: 01FC
    LIH R11, 01
    JMP R11
check_07_ok:
    LIL R9, FF
    LIH R9, 3F
    LIL R1, 00
    LIH R1, 51
    STORE [R9], R1
    LIL R9, 00
    LIH R9, 40
    LIL R1, 11
    LIH R1, 52
    STORE [R9], R1
    LIL R9, 01
    LIH R9, 40
    LIL R1, 22
    LIH R1, 53
    STORE [R9], R1
    LIL R9, FF
    LIH R9, 7F
    LIL R1, 33
    LIH R1, 54
    STORE [R9], R1
    LIL R9, 00
    LIH R9, 80
    LIL R1, 44
    LIH R1, 55
    STORE [R9], R1
    LIL R9, FF
    LIH R9, BF
    LIL R1, 55
    LIH R1, 56
    STORE [R9], R1
    LIL R9, 00
    LIH R9, C0
    LIL R1, 66
    LIH R1, 57
    STORE [R9], R1
    LIL R9, FF
    LIH R9, DF
    LIL R1, 77
    LIH R1, 58
    STORE [R9], R1
    LIL R9, FF
    LIH R9, 3F
    LOAD R1, [R9]
    LIL R9, 05
    LIH R9, 30
    STORE [R9], R1
    LIL R8, 00
    LIH R8, 51
    LIL R10, 08
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 58 ; check_08_ok: 0158
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, FC ; failure: 01FC
    LIH R11, 01
    JMP R11
check_08_ok:
    LIL R9, 00
    LIH R9, 40
    LOAD R1, [R9]
    LIL R9, 06
    LIH R9, 30
    STORE [R9], R1
    LIL R8, 11
    LIH R8, 52
    LIL R10, 09
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 6F ; check_09_ok: 016F
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, FC ; failure: 01FC
    LIH R11, 01
    JMP R11
check_09_ok:
    LIL R9, 01
    LIH R9, 40
    LOAD R1, [R9]
    LIL R9, 07
    LIH R9, 30
    STORE [R9], R1
    LIL R8, 22
    LIH R8, 53
    LIL R10, 0A
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 86 ; check_0A_ok: 0186
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, FC ; failure: 01FC
    LIH R11, 01
    JMP R11
check_0A_ok:
    LIL R9, FF
    LIH R9, 7F
    LOAD R1, [R9]
    LIL R9, 08
    LIH R9, 30
    STORE [R9], R1
    LIL R8, 33
    LIH R8, 54
    LIL R10, 0B
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 9D ; check_0B_ok: 019D
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, FC ; failure: 01FC
    LIH R11, 01
    JMP R11
check_0B_ok:
    LIL R9, 00
    LIH R9, 80
    LOAD R1, [R9]
    LIL R9, 09
    LIH R9, 30
    STORE [R9], R1
    LIL R8, 44
    LIH R8, 55
    LIL R10, 0C
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, B4 ; check_0C_ok: 01B4
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, FC ; failure: 01FC
    LIH R11, 01
    JMP R11
check_0C_ok:
    LIL R9, FF
    LIH R9, BF
    LOAD R1, [R9]
    LIL R9, 0A
    LIH R9, 30
    STORE [R9], R1
    LIL R8, 55
    LIH R8, 56
    LIL R10, 0D
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, CB ; check_0D_ok: 01CB
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, FC ; failure: 01FC
    LIH R11, 01
    JMP R11
check_0D_ok:
    LIL R9, 00
    LIH R9, C0
    LOAD R1, [R9]
    LIL R9, 0B
    LIH R9, 30
    STORE [R9], R1
    LIL R8, 66
    LIH R8, 57
    LIL R10, 0E
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, E2 ; check_0E_ok: 01E2
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, FC ; failure: 01FC
    LIH R11, 01
    JMP R11
check_0E_ok:
    LIL R9, FF
    LIH R9, DF
    LOAD R1, [R9]
    LIL R9, 0C
    LIH R9, 30
    STORE [R9], R1
    LIL R8, 77
    LIH R8, 58
    LIL R10, 0F
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, F9 ; check_0F_ok: 01F9
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, FC ; failure: 01FC
    LIH R11, 01
    JMP R11
check_0F_ok:
    LIL R11, 04 ; success: 0204
    LIH R11, 02
    JMP R11
failure:
    LIL R9, F1
    LIH R9, 30
    STORE [R9], R10
    LIL R1, D0
    LIH R1, BA
    LIL R11, 06 ; status: 0206
    LIH R11, 02
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
    LIL R2, 52
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4D
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
    LIL R2, 4C
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4F
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
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
    LIL R2, 55
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 53
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
    LIL R2, 48
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 5A
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
    LIL R2, 53
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, F0
    LIH R9, 30
    LOAD R1, [R9]
    LIL R4, 0D
    LIH R4, 60
    LIL R11, 8D ; show_pass: 028D
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
    LIL R11, A1 ; details: 02A1
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
    LIL R11, DC ; detail_2_digit_0: 02DC
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, DE ; detail_2_emit_0: 02DE
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
    LIL R11, F9 ; detail_2_digit_1: 02F9
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, FB ; detail_2_emit_1: 02FB
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
    LIL R11, 12 ; detail_2_digit_2: 0312
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 14 ; detail_2_emit_2: 0314
    LIH R11, 03
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
    LIL R11, 27 ; detail_2_digit_3: 0327
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 29 ; detail_2_emit_3: 0329
    LIH R11, 03
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
    LIL R11, 6B ; detail_3_digit_0: 036B
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 6D ; detail_3_emit_0: 036D
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
    LIL R11, 88 ; detail_3_digit_1: 0388
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 8A ; detail_3_emit_1: 038A
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
    LIL R11, A1 ; detail_3_digit_2: 03A1
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, A3 ; detail_3_emit_2: 03A3
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
    LIL R11, B6 ; detail_3_digit_3: 03B6
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, B8 ; detail_3_emit_3: 03B8
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
    LIL R11, 02 ; detail_4_digit_0: 0402
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 04 ; detail_4_emit_0: 0404
    LIH R11, 04
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
    LIL R11, 1F ; detail_4_digit_1: 041F
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 21 ; detail_4_emit_1: 0421
    LIH R11, 04
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
    LIL R11, 38 ; detail_4_digit_2: 0438
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 3A ; detail_4_emit_2: 043A
    LIH R11, 04
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
    LIL R11, 4D ; detail_4_digit_3: 044D
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 4F ; detail_4_emit_3: 044F
    LIH R11, 04
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
    LIL R2, 50
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
    LIL R2, 4E
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
    LIL R2, 4F
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
    LIL R2, 53
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
    LIL R11, AD ; result_0_digit_0: 04AD
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, AF ; result_0_emit_0: 04AF
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
    LIL R11, CA ; result_0_digit_1: 04CA
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, CC ; result_0_emit_1: 04CC
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
    LIL R11, E3 ; result_0_digit_2: 04E3
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, E5 ; result_0_emit_2: 04E5
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
    LIL R11, F8 ; result_0_digit_3: 04F8
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, FA ; result_0_emit_3: 04FA
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
    LIL R2, 50
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
    LIL R2, 4E
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
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
    LIL R2, 53
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 54
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
    LIL R11, 54 ; result_1_digit_0: 0554
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 56 ; result_1_emit_0: 0556
    LIH R11, 05
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
    LIL R11, 71 ; result_1_digit_1: 0571
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 73 ; result_1_emit_1: 0573
    LIH R11, 05
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
    LIL R11, 8A ; result_1_digit_2: 058A
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 8C ; result_1_emit_2: 058C
    LIH R11, 05
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
    LIL R11, 9F ; result_1_digit_3: 059F
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, A1 ; result_1_emit_3: 05A1
    LIH R11, 05
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
    LIL R2, 4C
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4F
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
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
    LIL R2, 54
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4F
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
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
    LIL R11, F7 ; result_2_digit_0: 05F7
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, F9 ; result_2_emit_0: 05F9
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
    LIL R11, 14 ; result_2_digit_1: 0614
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 16 ; result_2_emit_1: 0616
    LIH R11, 06
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
    LIL R11, 2D ; result_2_digit_2: 062D
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 2F ; result_2_emit_2: 062F
    LIH R11, 06
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
    LIL R11, 42 ; result_2_digit_3: 0642
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 44 ; result_2_emit_3: 0644
    LIH R11, 06
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
    LIL R2, 50
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4F
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
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4C
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4F
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 44
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
    LIL R11, 9E ; result_3_digit_0: 069E
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, A0 ; result_3_emit_0: 06A0
    LIH R11, 06
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
    LIL R11, BB ; result_3_digit_1: 06BB
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, BD ; result_3_emit_1: 06BD
    LIH R11, 06
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
    LIL R11, D4 ; result_3_digit_2: 06D4
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, D6 ; result_3_emit_2: 06D6
    LIH R11, 06
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
    LIL R11, E9 ; result_3_digit_3: 06E9
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, EB ; result_3_emit_3: 06EB
    LIH R11, 06
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
    LIL R2, 4C
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4F
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
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
    LIL R2, 54
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4F
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
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
    LIL R2, 4F
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
    LIL R11, 49 ; result_4_digit_0: 0749
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 4B ; result_4_emit_0: 074B
    LIH R11, 07
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
    LIL R11, 66 ; result_4_digit_1: 0766
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 68 ; result_4_emit_1: 0768
    LIH R11, 07
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
    LIL R11, 7F ; result_4_digit_2: 077F
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 81 ; result_4_emit_2: 0781
    LIH R11, 07
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
    LIL R11, 94 ; result_4_digit_3: 0794
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 96 ; result_4_emit_3: 0796
    LIH R11, 07
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
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4D
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 33
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 46
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
    LIL R11, E0 ; result_5_digit_0: 07E0
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, E2 ; result_5_emit_0: 07E2
    LIH R11, 07
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
    LIL R11, FD ; result_5_digit_1: 07FD
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, FF ; result_5_emit_1: 07FF
    LIH R11, 07
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
    LIL R11, 16 ; result_5_digit_2: 0816
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 18 ; result_5_emit_2: 0818
    LIH R11, 08
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
    LIL R11, 2B ; result_5_digit_3: 082B
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 2D ; result_5_emit_3: 082D
    LIH R11, 08
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
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4D
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
    LIL R2, 30
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
    LIL R11, 77 ; result_6_digit_0: 0877
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 79 ; result_6_emit_0: 0879
    LIH R11, 08
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
    LIL R11, 94 ; result_6_digit_1: 0894
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 96 ; result_6_emit_1: 0896
    LIH R11, 08
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
    LIL R11, AD ; result_6_digit_2: 08AD
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, AF ; result_6_emit_2: 08AF
    LIH R11, 08
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
    LIL R11, C2 ; result_6_digit_3: 08C2
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, C4 ; result_6_emit_3: 08C4
    LIH R11, 08
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
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4D
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
    LIL R2, 30
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
    LIL R11, 0E ; result_7_digit_0: 090E
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 10 ; result_7_emit_0: 0910
    LIH R11, 09
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
    LIL R11, 2B ; result_7_digit_1: 092B
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 2D ; result_7_emit_1: 092D
    LIH R11, 09
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
    LIL R11, 44 ; result_7_digit_2: 0944
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 46 ; result_7_emit_2: 0946
    LIH R11, 09
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
    LIL R11, 59 ; result_7_digit_3: 0959
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 5B ; result_7_emit_3: 095B
    LIH R11, 09
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
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4D
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 37
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 46
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
    LIL R11, A5 ; result_8_digit_0: 09A5
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, A7 ; result_8_emit_0: 09A7
    LIH R11, 09
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
    LIL R11, C2 ; result_8_digit_1: 09C2
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, C4 ; result_8_emit_1: 09C4
    LIH R11, 09
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
    LIL R11, DB ; result_8_digit_2: 09DB
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, DD ; result_8_emit_2: 09DD
    LIH R11, 09
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
    LIL R11, F0 ; result_8_digit_3: 09F0
    LIH R11, 09
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, F2 ; result_8_emit_3: 09F2
    LIH R11, 09
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
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4D
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 38
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
    LIL R2, 30
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
    LIL R11, 3C ; result_9_digit_0: 0A3C
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 3E ; result_9_emit_0: 0A3E
    LIH R11, 0A
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
    LIL R11, 59 ; result_9_digit_1: 0A59
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 5B ; result_9_emit_1: 0A5B
    LIH R11, 0A
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
    LIL R11, 72 ; result_9_digit_2: 0A72
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 74 ; result_9_emit_2: 0A74
    LIH R11, 0A
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
    LIL R11, 87 ; result_9_digit_3: 0A87
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 89 ; result_9_emit_3: 0A89
    LIH R11, 0A
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
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4D
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 42
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 46
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
    LIL R11, D3 ; result_10_digit_0: 0AD3
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, D5 ; result_10_emit_0: 0AD5
    LIH R11, 0A
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
    LIL R11, F0 ; result_10_digit_1: 0AF0
    LIH R11, 0A
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, F2 ; result_10_emit_1: 0AF2
    LIH R11, 0A
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
    LIL R11, 09 ; result_10_digit_2: 0B09
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 0B ; result_10_emit_2: 0B0B
    LIH R11, 0B
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
    LIL R11, 1E ; result_10_digit_3: 0B1E
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 20 ; result_10_emit_3: 0B20
    LIH R11, 0B
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
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4D
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 43
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
    LIL R2, 30
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
    LIL R11, 6A ; result_11_digit_0: 0B6A
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 6C ; result_11_emit_0: 0B6C
    LIH R11, 0B
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
    LIL R11, 87 ; result_11_digit_1: 0B87
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 89 ; result_11_emit_1: 0B89
    LIH R11, 0B
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
    LIL R11, A0 ; result_11_digit_2: 0BA0
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, A2 ; result_11_emit_2: 0BA2
    LIH R11, 0B
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
    LIL R11, B5 ; result_11_digit_3: 0BB5
    LIH R11, 0B
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, B7 ; result_11_emit_3: 0BB7
    LIH R11, 0B
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
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4D
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
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 46
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
    LIL R11, 01 ; result_12_digit_0: 0C01
    LIH R11, 0C
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 03 ; result_12_emit_0: 0C03
    LIH R11, 0C
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
    LIL R11, 1E ; result_12_digit_1: 0C1E
    LIH R11, 0C
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 20 ; result_12_emit_1: 0C20
    LIH R11, 0C
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
    LIL R11, 37 ; result_12_digit_2: 0C37
    LIH R11, 0C
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 39 ; result_12_emit_2: 0C39
    LIH R11, 0C
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
    LIL R11, 4C ; result_12_digit_3: 0C4C
    LIH R11, 0C
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 4E ; result_12_emit_3: 0C4E
    LIH R11, 0C
    JMP R11
result_12_digit_3:
    LIL R4, 30
    LIH R4, 07
result_12_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, F4
    LIH R9, 30
    LIL R1, FE
    LIH R1, CA
    STORE [R9], R1
halt:
    LIL R11, 56 ; halt: 0C56
    LIH R11, 0C
    JMP R11
