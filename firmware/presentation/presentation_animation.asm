; Existing CPU ISA. All numeric operands are hexadecimal.
; R0 = zero, R10 = branch/call scratch, R11 = software stack pointer.
start:
    LIL R0, 00
    LIH R0, 00
    LIL R11, 00
    LIH R11, 3F
    LIL R1, 00
    LIH R1, 00
    LIL R2, 80
    LIH R2, 00
    LIL R3, 60
    LIH R3, 00
    LIL R4, 00
    LIH R4, 00
    LIL R10, 15 ; return_1 = 0015
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 08 ; fill_rect = 0508
    LIH R10, 05
    JMP R10
return_1:
    LIL R1, 00
    LIH R1, 00
    LIL R2, 80
    LIH R2, 00
    LIL R3, 01
    LIH R3, 00
    LIL R4, 00
    LIH R4, 1B
    LIL R10, 26 ; return_2 = 0026
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 08 ; fill_rect = 0508
    LIH R10, 05
    JMP R10
return_2:
    LIL R1, 00
    LIH R1, 2E
    LIL R2, 80
    LIH R2, 00
    LIL R3, 01
    LIH R3, 00
    LIL R4, 00
    LIH R4, 1B
    LIL R10, 37 ; return_3 = 0037
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 08 ; fill_rect = 0508
    LIH R10, 05
    JMP R10
return_3:
    LIL R1, 14
    LIH R1, 00
    LIL R9, 00
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 23
    LIH R1, 00
    LIL R9, 01
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 01
    LIH R1, 00
    LIL R9, 02
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 01
    LIH R1, 00
    LIL R9, 03
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 03
    LIH R1, 00
    LIL R9, 04
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 00
    LIH R1, 00
    LIL R9, 05
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 04
    LIH R1, 00
    LIL R9, 06
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 00
    LIH R1, 00
    LIL R9, 07
    LIH R9, 30
    STORE [R9], R1
    LIL R2, 22
    LIH R2, 02
    LIL R3, 00
    LIH R3, 1B
    LIL R1, 31
    LIH R1, 00
    LIL R10, 6E ; return_4 = 006E
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_4:
    LIL R1, 36
    LIH R1, 00
    LIL R10, 79 ; return_5 = 0079
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_5:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 84 ; return_6 = 0084
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_6:
    LIL R1, 42
    LIH R1, 00
    LIL R10, 8F ; return_7 = 008F
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_7:
    LIL R1, 49
    LIH R1, 00
    LIL R10, 9A ; return_8 = 009A
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_8:
    LIL R1, 54
    LIH R1, 00
    LIL R10, A5 ; return_9 = 00A5
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_9:
    LIL R1, 20
    LIH R1, 00
    LIL R10, B0 ; return_10 = 00B0
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_10:
    LIL R1, 43
    LIH R1, 00
    LIL R10, BB ; return_11 = 00BB
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_11:
    LIL R1, 50
    LIH R1, 00
    LIL R10, C6 ; return_12 = 00C6
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_12:
    LIL R1, 55
    LIH R1, 00
    LIL R10, D1 ; return_13 = 00D1
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_13:
    LIL R2, 28
    LIH R2, 07
    LIL R3, 00
    LIH R3, 3F
    LIL R1, 56
    LIH R1, 00
    LIL R10, E0 ; return_14 = 00E0
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_14:
    LIL R1, 47
    LIH R1, 00
    LIL R10, EB ; return_15 = 00EB
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_15:
    LIL R1, 41
    LIH R1, 00
    LIL R10, F6 ; return_16 = 00F6
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_16:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 01 ; return_17 = 0101
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_17:
    LIL R1, 44
    LIH R1, 00
    LIL R10, 0C ; return_18 = 010C
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_18:
    LIL R1, 45
    LIH R1, 00
    LIL R10, 17 ; return_19 = 0117
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_19:
    LIL R1, 4D
    LIH R1, 00
    LIL R10, 22 ; return_20 = 0122
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_20:
    LIL R1, 4F
    LIH R1, 00
    LIL R10, 2D ; return_21 = 012D
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_21:
    LIL R2, 88
    LIH R2, 29
    LIL R3, 00
    LIH R3, 36
    LIL R1, 41
    LIH R1, 00
    LIL R10, 3C ; return_22 = 013C
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_22:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 47 ; return_23 = 0147
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_23:
    LIL R1, 43
    LIH R1, 00
    LIL R10, 52 ; return_24 = 0152
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_24:
    LIL R1, 4F
    LIH R1, 00
    LIL R10, 5D ; return_25 = 015D
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_25:
    LIL R1, 4C
    LIH R1, 00
    LIL R10, 68 ; return_26 = 0168
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_26:
    LIL R1, 4F
    LIH R1, 00
    LIL R10, 73 ; return_27 = 0173
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_27:
    LIL R1, 52
    LIH R1, 00
    LIL R10, 7E ; return_28 = 017E
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_28:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 89 ; return_29 = 0189
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_29:
    LIL R1, 53
    LIH R1, 00
    LIL R10, 94 ; return_30 = 0194
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_30:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 9F ; return_31 = 019F
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_31:
    LIL R1, 53
    LIH R1, 00
    LIL R10, AA ; return_32 = 01AA
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_32:
    LIL R1, 50
    LIH R1, 00
    LIL R10, B5 ; return_33 = 01B5
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_33:
    LIL R1, 45
    LIH R1, 00
    LIL R10, C0 ; return_34 = 01C0
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_34:
    LIL R1, 45
    LIH R1, 00
    LIL R10, CB ; return_35 = 01CB
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_35:
    LIL R1, 44
    LIH R1, 00
    LIL R10, D6 ; return_36 = 01D6
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_36:
    LIL R2, 08
    LIH R2, 2D
    LIL R1, 53
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 50
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 41
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 43
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 45
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 20
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 50
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 41
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 55
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 53
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 45
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 20
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 2F
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 20
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 52
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 45
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 53
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 55
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 4D
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 45
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 20
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 20
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 20
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 20
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 20
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 52
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 20
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 52
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 45
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 53
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 54
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 41
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 52
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 54
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 84
    LIH R1, 0C
    LIL R2, 78
    LIH R2, 00
    LIL R3, 01
    LIH R3, 00
    LIL R4, 00
    LIH R4, 3F
    LIL R10, B5 ; return_37 = 02B5
    LIH R10, 02
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 08 ; fill_rect = 0508
    LIH R10, 05
    JMP R10
return_37:
    LIL R1, 04
    LIH R1, 23
    LIL R2, 78
    LIH R2, 00
    LIL R3, 01
    LIH R3, 00
    LIL R4, 00
    LIH R4, 3F
    LIL R10, C6 ; return_38 = 02C6
    LIH R10, 02
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 08 ; fill_rect = 0508
    LIH R10, 05
    JMP R10
return_38:
    LIL R1, 84
    LIH R1, 0C
    LIL R2, 01
    LIH R2, 00
    LIL R3, 2E
    LIH R3, 00
    LIL R4, 00
    LIH R4, 3F
    LIL R10, D7 ; return_39 = 02D7
    LIH R10, 02
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 08 ; fill_rect = 0508
    LIH R10, 05
    JMP R10
return_39:
    LIL R1, FB
    LIH R1, 0C
    LIL R2, 01
    LIH R2, 00
    LIL R3, 2E
    LIH R3, 00
    LIL R4, 00
    LIH R4, 3F
    LIL R10, E8 ; return_40 = 02E8
    LIH R10, 02
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 08 ; fill_rect = 0508
    LIH R10, 05
    JMP R10
return_40:
    LIL R10, F1 ; return_41 = 02F1
    LIH R10, 02
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 33 ; animation_status = 0433
    LIH R10, 04
    JMP R10
return_41:
frame:
    LIL R10, FA ; return_42 = 02FA
    LIH R10, 02
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AF ; poll_animation = 03AF
    LIH R10, 03
    JMP R10
return_42:
    LIL R4, 00
    LIH R4, 00
    LIL R10, 05 ; return_43 = 0305
    LIH R10, 03
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 8F ; sprite = 038F
    LIH R10, 03
    JMP R10
return_43:
    LIL R9, 05
    LIH R9, 30
    LOAD R1, [R9]
    CMP R1, R0
    LIL R10, 0F ; move_sprite = 030F
    LIH R10, 03
    BEQ R10
    LIL R10, 61 ; draw_sprite = 0361
    LIH R10, 03
    JMP R10
move_sprite:
    LIL R9, 00
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 05
    LIH R2, 00
    CMP R1, R2
    LIL R10, 21 ; x_positive = 0321
    LIH R10, 03
    BEQ R10
    LIL R2, 73
    LIH R2, 00
    CMP R1, R2
    LIL R10, 29 ; x_negative = 0329
    LIH R10, 03
    BEQ R10
    LIL R10, 2E ; x_advance = 032E
    LIH R10, 03
    JMP R10
x_positive:
    LIL R1, 01
    LIH R1, 00
    LIL R9, 02
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 2E ; x_advance = 032E
    LIH R10, 03
    JMP R10
x_negative:
    LIL R1, FF
    LIH R1, FF
    LIL R9, 02
    LIH R9, 30
    STORE [R9], R1
x_advance:
    LIL R9, 00
    LIH R9, 30
    LOAD R1, [R9]
    LIL R9, 02
    LIH R9, 30
    LOAD R2, [R9]
    ADD R1, R1, R2
    LIL R9, 00
    LIH R9, 30
    STORE [R9], R1
    LIL R9, 01
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 1A
    LIH R2, 00
    CMP R1, R2
    LIL R10, 4A ; y_positive = 034A
    LIH R10, 03
    BEQ R10
    LIL R2, 3E
    LIH R2, 00
    CMP R1, R2
    LIL R10, 52 ; y_negative = 0352
    LIH R10, 03
    BEQ R10
    LIL R10, 57 ; y_advance = 0357
    LIH R10, 03
    JMP R10
y_positive:
    LIL R1, 01
    LIH R1, 00
    LIL R9, 03
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 57 ; y_advance = 0357
    LIH R10, 03
    JMP R10
y_negative:
    LIL R1, FF
    LIH R1, FF
    LIL R9, 03
    LIH R9, 30
    STORE [R9], R1
y_advance:
    LIL R9, 01
    LIH R9, 30
    LOAD R1, [R9]
    LIL R9, 03
    LIH R9, 30
    LOAD R2, [R9]
    ADD R1, R1, R2
    LIL R9, 01
    LIH R9, 30
    STORE [R9], R1
draw_sprite:
    LIL R9, 04
    LIH R9, 30
    LOAD R4, [R9]
    SLL R4, R4
    SLL R4, R4
    SLL R4, R4
    SLL R4, R4
    SLL R4, R4
    SLL R4, R4
    SLL R4, R4
    SLL R4, R4
    ADD R5, R4, R0
    SLL R5, R5
    SLL R5, R5
    SLL R5, R5
    ADD R4, R4, R5
    LIL R10, 7A ; return_44 = 037A
    LIH R10, 03
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 8F ; sprite = 038F
    LIH R10, 03
    JMP R10
return_44:
    LIL R9, 07
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 01
    LIH R2, 00
    ADD R1, R1, R2
    LIL R9, 07
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 8C ; return_45 = 038C
    LIH R10, 03
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, EC ; frame_delay = 04EC
    LIH R10, 04
    JMP R10
return_45:
    LIL R10, F1 ; frame = 02F1
    LIH R10, 02
    JMP R10
sprite:
    LIL R9, 01
    LIH R9, 30
    LOAD R1, [R9]
    SLL R1, R1
    SLL R1, R1
    SLL R1, R1
    SLL R1, R1
    SLL R1, R1
    SLL R1, R1
    SLL R1, R1
    LIL R9, 00
    LIH R9, 30
    LOAD R2, [R9]
    ADD R1, R1, R2
    LIL R2, 08
    LIH R2, 00
    LIL R3, 08
    LIH R3, 00
    LIL R10, AA ; return_46 = 03AA
    LIH R10, 03
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 08 ; fill_rect = 0508
    LIH R10, 05
    JMP R10
return_46:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
poll_animation:
    LIL R9, FF
    LIH R9, FF
    LOAD R1, [R9]
    CMP R1, R0
    LIL R10, CE ; animation_key_done = 03CE
    LIH R10, 03
    BEQ R10
    LIL R2, 01
    LIH R2, 00
    CMP R1, R2
    LIL R10, D3 ; change_color = 03D3
    LIH R10, 03
    BEQ R10
    LIL R2, 13
    LIH R2, 00
    CMP R1, R2
    LIL R10, E9 ; change_speed = 03E9
    LIH R10, 03
    BEQ R10
    LIL R2, 1D
    LIH R2, 00
    CMP R1, R2
    LIL R10, 06 ; toggle_pause = 0406
    LIH R10, 04
    BEQ R10
    LIL R2, 12
    LIH R2, 00
    CMP R1, R2
    LIL R10, 00 ; start = 0000
    LIH R10, 00
    BEQ R10
animation_key_done:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
change_color:
    LIL R9, 04
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 01
    LIH R2, 00
    ADD R1, R1, R2
    LIL R2, 08
    LIH R2, 00
    CMP R1, R2
    LIL R10, E1 ; color_save = 03E1
    LIH R10, 03
    BLT R10
    LIL R1, 01
    LIH R1, 00
color_save:
    LIL R9, 04
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
change_speed:
    LIL R9, 06
    LIH R9, 30
    LOAD R1, [R9]
    SLL R1, R1
    LIL R2, 20
    LIH R2, 00
    CMP R1, R2
    LIL R10, F5 ; speed_save = 03F5
    LIH R10, 03
    BLT R10
    LIL R1, 04
    LIH R1, 00
speed_save:
    LIL R9, 06
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 01 ; return_47 = 0401
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 33 ; animation_status = 0433
    LIH R10, 04
    JMP R10
return_47:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
toggle_pause:
    LIL R9, 05
    LIH R9, 30
    LOAD R1, [R9]
    CMP R1, R0
    LIL R10, 20 ; set_paused = 0420
    LIH R10, 04
    BEQ R10
    LIL R1, 00
    LIH R1, 00
    LIL R9, 05
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 1B ; return_48 = 041B
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 33 ; animation_status = 0433
    LIH R10, 04
    JMP R10
return_48:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
set_paused:
    LIL R1, 01
    LIH R1, 00
    LIL R9, 05
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 2E ; return_49 = 042E
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 33 ; animation_status = 0433
    LIH R10, 04
    JMP R10
return_49:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
animation_status:
    LIL R1, 08
    LIH R1, 25
    LIL R2, 6C
    LIH R2, 00
    LIL R3, 05
    LIH R3, 00
    LIL R4, 00
    LIH R4, 00
    LIL R10, 44 ; return_50 = 0444
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 08 ; fill_rect = 0508
    LIH R10, 05
    JMP R10
return_50:
    LIL R9, 05
    LIH R9, 30
    LOAD R1, [R9]
    CMP R1, R0
    LIL R10, 96 ; status_running = 0496
    LIH R10, 04
    BEQ R10
    LIL R2, 08
    LIH R2, 25
    LIL R3, 00
    LIH R3, 36
    LIL R1, 50
    LIH R1, 00
    LIL R10, 5A ; return_51 = 045A
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_51:
    LIL R1, 41
    LIH R1, 00
    LIL R10, 65 ; return_52 = 0465
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_52:
    LIL R1, 55
    LIH R1, 00
    LIL R10, 70 ; return_53 = 0470
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_53:
    LIL R1, 53
    LIH R1, 00
    LIL R10, 7B ; return_54 = 047B
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_54:
    LIL R1, 45
    LIH R1, 00
    LIL R10, 86 ; return_55 = 0486
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_55:
    LIL R1, 44
    LIH R1, 00
    LIL R10, 91 ; return_56 = 0491
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_56:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
status_running:
    LIL R2, 08
    LIH R2, 25
    LIL R3, 00
    LIH R3, 1B
    LIL R1, 52
    LIH R1, 00
    LIL R10, A5 ; return_57 = 04A5
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_57:
    LIL R1, 55
    LIH R1, 00
    LIL R10, B0 ; return_58 = 04B0
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_58:
    LIL R1, 4E
    LIH R1, 00
    LIL R10, BB ; return_59 = 04BB
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_59:
    LIL R1, 4E
    LIH R1, 00
    LIL R10, C6 ; return_60 = 04C6
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_60:
    LIL R1, 49
    LIH R1, 00
    LIL R10, D1 ; return_61 = 04D1
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_61:
    LIL R1, 4E
    LIH R1, 00
    LIL R10, DC ; return_62 = 04DC
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_62:
    LIL R1, 47
    LIH R1, 00
    LIL R10, E7 ; return_63 = 04E7
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 27 ; big_char = 0527
    LIH R10, 05
    JMP R10
return_63:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
frame_delay:
    LIL R9, 06
    LIH R9, 30
    LOAD R2, [R9]
    LIL R3, 01
    LIH R3, 00
delay_outer:
delay_constant:
    LIL R1, FF
    LIH R1, FF
delay_inner:
    SUB R1, R1, R3
    CMP R1, R0
    LIL R10, FB ; delay_next = 04FB
    LIH R10, 04
    BEQ R10
    LIL R10, F3 ; delay_inner = 04F3
    LIH R10, 04
    JMP R10
delay_next:
    SUB R2, R2, R3
    CMP R2, R0
    LIL R10, 03 ; delay_done = 0503
    LIH R10, 05
    BEQ R10
    LIL R10, F1 ; delay_outer = 04F1
    LIH R10, 04
    JMP R10
delay_done:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
fill_rect:
    ADD R5, R1, R0
    LIL R8, 01
    LIH R8, 00
    LIL R9, 80
    LIH R9, 00
fill_row:
    ADD R6, R2, R0
    ADD R7, R5, R0
fill_pixel:
    STORE [R7], R4
    ADD R7, R7, R8
    SUB R6, R6, R8
    CMP R6, R0
    LIL R10, 19 ; fill_next_row = 0519
    LIH R10, 05
    BEQ R10
    LIL R10, 0F ; fill_pixel = 050F
    LIH R10, 05
    JMP R10
fill_next_row:
    ADD R5, R5, R9
    SUB R3, R3, R8
    CMP R3, R0
    LIL R10, 22 ; fill_done = 0522
    LIH R10, 05
    BEQ R10
    LIL R10, 0D ; fill_row = 050D
    LIH R10, 05
    JMP R10
fill_done:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
big_char:
    SLL R1, R1
    LIL R9, 00
    LIH R9, E0
    ADD R1, R1, R9
    LOAD R4, [R1]
    LIL R9, 01
    LIH R9, 00
    ADD R1, R1, R9
    LOAD R5, [R1]
    ADD R1, R4, R0
    ADD R4, R5, R0
    LIL R5, 00
    LIH R5, 40
    LIL R6, 05
    LIH R6, 00
    ADD R8, R2, R0
char_row:
    LIL R7, 05
    LIH R7, 00
char_pixel:
    NAND R9, R1, R5
    NAND R9, R9, R9
    CMP R9, R0
    LIL R10, 43 ; char_blank = 0543
    LIH R10, 05
    BEQ R10
    STORE [R8], R3
    LIL R10, 44 ; char_advance = 0544
    LIH R10, 05
    JMP R10
char_blank:
    STORE [R8], R0
char_advance:
    LIL R9, 01
    LIH R9, 00
    ADD R8, R8, R9
    SRL R5, R5
    SUB R7, R7, R9
    CMP R7, R0
    LIL R10, 50 ; char_row_done = 0550
    LIH R10, 05
    BEQ R10
    LIL R10, 39 ; char_pixel = 0539
    LIH R10, 05
    JMP R10
char_row_done:
    LIL R9, 7B
    LIH R9, 00
    ADD R8, R8, R9
    LIL R9, 01
    LIH R9, 00
    SUB R6, R6, R9
    CMP R6, R0
    LIL R10, 69 ; char_done = 0569
    LIH R10, 05
    BEQ R10
    LIL R9, 02
    LIH R9, 00
    CMP R6, R9
    LIL R10, 63 ; char_second_word = 0563
    LIH R10, 05
    BEQ R10
    LIL R10, 37 ; char_row = 0537
    LIH R10, 05
    JMP R10
char_second_word:
    ADD R1, R4, R0
    LIL R5, 00
    LIH R5, 02
    LIL R10, 37 ; char_row = 0537
    LIH R10, 05
    JMP R10
char_done:
    LIL R9, 06
    LIH R9, 00
    ADD R2, R2, R9
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
