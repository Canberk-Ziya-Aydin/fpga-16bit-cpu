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
    LIL R1, 07
    LIH R1, 00
    LIL R2, 07
    LIH R2, 00
    LIL R10, 01
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R2
    LIL R11, 45 ; condition_0_ok: 0045
    LIH R11, 00
    CMP R1, R2
    BEQ R11
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
condition_0_ok:
    LIL R1, 07
    LIH R1, 00
    LIL R2, 08
    LIH R2, 00
    LIL R10, 02
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R2
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    CMP R1, R2
    BEQ R11
condition_1_ok:
    LIL R1, 02
    LIH R1, 00
    LIL R2, 03
    LIH R2, 00
    LIL R10, 03
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R2
    LIL R11, 68 ; condition_2_ok: 0068
    LIH R11, 00
    CMP R1, R2
    BLT R11
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
condition_2_ok:
    LIL R1, 03
    LIH R1, 00
    LIL R2, 02
    LIH R2, 00
    LIL R10, 04
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R2
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    CMP R1, R2
    BLT R11
condition_3_ok:
    LIL R1, 00
    LIH R1, 00
    LIL R2, 00
    LIH R2, 00
    LIL R10, 05
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R2
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    CMP R1, R2
    BLT R11
condition_4_ok:
    LIL R1, FF
    LIH R1, FF
    LIL R2, 00
    LIH R2, 00
    LIL R10, 06
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R2
    LIL R11, 9B ; condition_5_ok: 009B
    LIH R11, 00
    CMP R1, R2
    BLT R11
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
condition_5_ok:
    LIL R1, 00
    LIH R1, 00
    LIL R2, FF
    LIH R2, FF
    LIL R10, 07
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R2
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    CMP R1, R2
    BLT R11
condition_6_ok:
    LIL R1, 00
    LIH R1, 80
    LIL R2, 01
    LIH R2, 00
    LIL R10, 08
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R2
    LIL R11, BE ; condition_7_ok: 00BE
    LIH R11, 00
    CMP R1, R2
    BLT R11
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
condition_7_ok:
    LIL R1, FF
    LIH R1, 7F
    LIL R2, FF
    LIH R2, FF
    LIL R10, 09
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R2
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    CMP R1, R2
    BLT R11
condition_8_ok:
    LIL R1, 00
    LIH R1, 80
    LIL R2, FF
    LIH R2, 7F
    LIL R10, 0A
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R2
    LIL R11, E1 ; condition_9_ok: 00E1
    LIH R11, 00
    CMP R1, R2
    BLT R11
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
condition_9_ok:
    LIL R1, 0A
    LIH R1, 00
    LIL R9, 00
    LIH R9, 30
    STORE [R9], R1
    LIL R8, 0A
    LIH R8, 00
    LIL R10, 0B
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, F7 ; check_0B_ok: 00F7
    LIH R11, 00
    CMP R1, R8
    BEQ R11
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
check_0B_ok:
    LIL R9, 00
    LIH R9, 60
    STORE [R9], R0
    LIL R1, AD
    LIH R1, DE
    LIL R3, 00
    LIH R3, 00
    LIL R11, 03 ; flush_landing: 0103
    LIH R11, 01
    JMP R11
    STORE [R9], R1
    ADD R3, R1, R1
flush_landing:
    LOAD R1, [R9]
    LIL R9, 01
    LIH R9, 30
    STORE [R9], R1
    LIL R8, 00
    LIH R8, 00
    LIL R10, 0C
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R1
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 18 ; check_0C_ok: 0118
    LIH R11, 01
    CMP R1, R8
    BEQ R11
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
check_0C_ok:
    LIL R9, 02
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
    LIL R11, 2C ; check_0D_ok: 012C
    LIH R11, 01
    CMP R3, R8
    BEQ R11
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
check_0D_ok:
    LIL R5, 01
    LIH R5, 00
    LIL R1, 35 ; alu_target_minus_one: 0135
    LIH R1, 01
    ADD R1, R1, R5
    JMP R1
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
alu_target_minus_one:
    NOP
alu_target:
    LIL R2, 11
    LIH R2, 11
    LIL R9, 03
    LIH R9, 30
    STORE [R9], R2
    LIL R8, 11
    LIH R8, 11
    LIL R10, 0E
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R2
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 4C ; check_0E_ok: 014C
    LIH R11, 01
    CMP R2, R8
    BEQ R11
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
check_0E_ok:
    LIL R9, 01
    LIH R9, 60
    LIL R2, 56 ; loaded_target: 0156
    LIH R2, 01
    STORE [R9], R2
    LOAD R1, [R9]
    JMP R1
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
loaded_target:
    LIL R2, 22
    LIH R2, 22
    LIL R9, 04
    LIH R9, 30
    STORE [R9], R2
    LIL R8, 22
    LIH R8, 22
    LIL R10, 0F
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R2
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 6C ; check_0F_ok: 016C
    LIH R11, 01
    CMP R2, R8
    BEQ R11
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
check_0F_ok:
    LIL R2, 00
    LIH R2, 00
    LIL R5, 01
    LIH R5, 00
    LIL R7, 78 ; return_0: 0178
    LIH R7, 01
    LIL R1, 00
    LIH R1, 10
    JMP R1
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
return_0:
    LIL R7, 80 ; return_1: 0180
    LIH R7, 01
    LIL R1, 00
    LIH R1, 40
    JMP R1
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
return_1:
    LIL R7, 88 ; return_2: 0188
    LIH R7, 01
    LIL R1, 00
    LIH R1, 40
    JMP R1
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
return_2:
    LIL R9, 05
    LIH R9, 30
    STORE [R9], R2
    LIL R8, 03
    LIH R8, 00
    LIL R10, 10
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R2
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, 9C ; check_10_ok: 019C
    LIH R11, 01
    CMP R2, R8
    BEQ R11
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
check_10_ok:
    LIL R7, A4 ; return_last: 01A4
    LIH R7, 01
    LIL R1, FF
    LIH R1, 7F
    JMP R1
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
return_last:
    LIL R2, FF
    LIH R2, 7F
    LIL R9, 06
    LIH R9, 30
    STORE [R9], R2
    LIL R8, FF
    LIH R8, 7F
    LIL R10, 11
    LIH R10, 00
    LIL R9, F2
    LIH R9, 30
    STORE [R9], R2
    LIL R9, F3
    LIH R9, 30
    STORE [R9], R8
    LIL R11, BA ; check_11_ok: 01BA
    LIH R11, 01
    CMP R2, R8
    BEQ R11
    LIL R11, BD ; failure: 01BD
    LIH R11, 01
    JMP R11
check_11_ok:
    LIL R11, C5 ; success: 01C5
    LIH R11, 01
    JMP R11
failure:
    LIL R9, F1
    LIH R9, 30
    STORE [R9], R10
    LIL R1, D0
    LIH R1, BA
    LIL R11, C7 ; status: 01C7
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
    LIL R2, 42
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
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
    LIL R2, 43
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 48
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
    LIL R2, 20
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 43
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
    LIL R2, 4C
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 53
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
    LIL R2, 33
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 32
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4B
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4F
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4D
    LIH R2, 03
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, F0
    LIH R9, 30
    LOAD R1, [R9]
    LIL R4, 0D
    LIH R4, 60
    LIL R11, 56 ; show_pass: 0256
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
    LIL R11, 6A ; details: 026A
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
    LIL R11, A5 ; detail_2_digit_0: 02A5
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, A7 ; detail_2_emit_0: 02A7
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
    LIL R11, C2 ; detail_2_digit_1: 02C2
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, C4 ; detail_2_emit_1: 02C4
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
    LIL R11, DB ; detail_2_digit_2: 02DB
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, DD ; detail_2_emit_2: 02DD
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
    LIL R11, F0 ; detail_2_digit_3: 02F0
    LIH R11, 02
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, F2 ; detail_2_emit_3: 02F2
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
    LIL R11, 34 ; detail_3_digit_0: 0334
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 36 ; detail_3_emit_0: 0336
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
    LIL R11, 51 ; detail_3_digit_1: 0351
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 53 ; detail_3_emit_1: 0353
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
    LIL R11, 6A ; detail_3_digit_2: 036A
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 6C ; detail_3_emit_2: 036C
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
    LIL R11, 7F ; detail_3_digit_3: 037F
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 81 ; detail_3_emit_3: 0381
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
    LIL R11, CB ; detail_4_digit_0: 03CB
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, CD ; detail_4_emit_0: 03CD
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
    LIL R11, E8 ; detail_4_digit_1: 03E8
    LIH R11, 03
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, EA ; detail_4_emit_1: 03EA
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
    LIL R11, 01 ; detail_4_digit_2: 0401
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 03 ; detail_4_emit_2: 0403
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
    LIL R11, 16 ; detail_4_digit_3: 0416
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 18 ; detail_4_emit_3: 0418
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
    LIL R2, 43
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4F
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
    LIL R2, 49
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
    LIL R2, 4F
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4E
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
    LIL R11, 6A ; result_0_digit_0: 046A
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 6C ; result_0_emit_0: 046C
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
    LIL R11, 87 ; result_0_digit_1: 0487
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 89 ; result_0_emit_1: 0489
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
    LIL R11, A0 ; result_0_digit_2: 04A0
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, A2 ; result_0_emit_2: 04A2
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
    LIL R11, B5 ; result_0_digit_3: 04B5
    LIH R11, 04
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, B7 ; result_0_emit_3: 04B7
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
    LIL R2, 4C
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 55
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 53
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
    LIL R2, 44
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
    LIL R11, 15 ; result_1_digit_0: 0515
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 17 ; result_1_emit_0: 0517
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
    LIL R11, 32 ; result_1_digit_1: 0532
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 34 ; result_1_emit_1: 0534
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
    LIL R11, 4B ; result_1_digit_2: 054B
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 4D ; result_1_emit_2: 054D
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
    LIL R11, 60 ; result_1_digit_3: 0560
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 62 ; result_1_emit_3: 0562
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
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4C
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 55
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 53
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
    LIL R2, 44
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
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
    LIL R2, 47
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 49
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
    LIL R11, CC ; result_2_digit_0: 05CC
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, CE ; result_2_emit_0: 05CE
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
    LIL R11, E9 ; result_2_digit_1: 05E9
    LIH R11, 05
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, EB ; result_2_emit_1: 05EB
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
    LIL R11, 02 ; result_2_digit_2: 0602
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 04 ; result_2_emit_2: 0604
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
    LIL R11, 17 ; result_2_digit_3: 0617
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 19 ; result_2_emit_3: 0619
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
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4C
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 55
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4A
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 55
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4D
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 50
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
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 47
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 54
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
    LIL R11, 7F ; result_3_digit_0: 067F
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 81 ; result_3_emit_0: 0681
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
    LIL R11, 9C ; result_3_digit_1: 069C
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 9E ; result_3_emit_1: 069E
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
    LIL R11, B5 ; result_3_digit_2: 06B5
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, B7 ; result_3_emit_2: 06B7
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
    LIL R11, CA ; result_3_digit_3: 06CA
    LIH R11, 06
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, CC ; result_3_emit_3: 06CC
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
    LIL R2, 4A
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 55
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4D
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 50
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
    LIL R2, 41
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 47
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 54
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
    LIL R11, 36 ; result_4_digit_0: 0736
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 38 ; result_4_emit_0: 0738
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
    LIL R11, 53 ; result_4_digit_1: 0753
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 55 ; result_4_emit_1: 0755
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
    LIL R11, 6C ; result_4_digit_2: 076C
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 6E ; result_4_emit_2: 076E
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
    LIL R11, 81 ; result_4_digit_3: 0781
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 83 ; result_4_emit_3: 0783
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
    LIL R2, 46
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 55
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4E
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
    LIL R2, 49
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4F
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
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
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
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4E
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 53
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
    LIL R11, ED ; result_5_digit_0: 07ED
    LIH R11, 07
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, EF ; result_5_emit_0: 07EF
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
    LIL R11, 0A ; result_5_digit_1: 080A
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 0C ; result_5_emit_1: 080C
    LIH R11, 08
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
    LIL R11, 23 ; result_5_digit_2: 0823
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 25 ; result_5_emit_2: 0825
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
    LIL R11, 38 ; result_5_digit_3: 0838
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, 3A ; result_5_emit_3: 083A
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
    LIL R2, 20
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4F
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
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 45
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
    LIL R2, 52
    LIH R2, 07
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R2, 4E
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
    LIL R11, A0 ; result_6_digit_0: 08A0
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, A2 ; result_6_emit_0: 08A2
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
    LIL R11, BD ; result_6_digit_1: 08BD
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, BF ; result_6_emit_1: 08BF
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
    LIL R11, D6 ; result_6_digit_2: 08D6
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, D8 ; result_6_emit_2: 08D8
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
    LIL R11, EB ; result_6_digit_3: 08EB
    LIH R11, 08
    CMP R2, R4
    BLT R11
    LIL R4, 37
    LIH R4, 07
    LIL R11, ED ; result_6_emit_3: 08ED
    LIH R11, 08
    JMP R11
result_6_digit_3:
    LIL R4, 30
    LIH R4, 07
result_6_emit_3:
    ADD R2, R2, R4
    STORE [R6], R2
    ADD R6, R6, R7
    LIL R9, F4
    LIH R9, 30
    LIL R1, FE
    LIH R1, CA
    STORE [R9], R1
halt:
    LIL R11, F5 ; halt: 08F5
    LIH R11, 08
    JMP R11
.org 1000
function_1000:
    ADD R2, R2, R5
    JMP R7
.org 4000
function_4000:
    ADD R2, R2, R5
    JMP R7
.org 7FFF
function_7fff:
    JMP R7
