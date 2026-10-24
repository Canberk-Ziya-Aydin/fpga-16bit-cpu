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
    LIL R10, C2 ; fill_rect = 0AC2
    LIH R10, 0A
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
    LIL R10, C2 ; fill_rect = 0AC2
    LIH R10, 0A
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
    LIL R10, C2 ; fill_rect = 0AC2
    LIH R10, 0A
    JMP R10
return_3:
    LIL R1, 00
    LIH R1, 00
    LIL R9, 00
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 00
    LIH R1, 00
    LIL R9, 01
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 00
    LIH R1, 00
    LIL R9, 02
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 00
    LIH R1, 00
    LIL R9, 03
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 00
    LIH R1, 00
    LIL R9, 04
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 00
    LIH R1, 00
    LIL R9, 05
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 00
    LIH R1, 00
    LIL R9, 06
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 00
    LIH R1, 00
    LIL R9, 07
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 00
    LIH R1, 00
    LIL R9, 08
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 00
    LIH R1, 00
    LIL R9, 09
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 10
    LIH R1, 27
    LIL R9, 00
    LIH R9, 33
    STORE [R9], R1
    LIL R1, E8
    LIH R1, 03
    LIL R9, 01
    LIH R9, 33
    STORE [R9], R1
    LIL R1, 64
    LIH R1, 00
    LIL R9, 02
    LIH R9, 33
    STORE [R9], R1
    LIL R1, 0A
    LIH R1, 00
    LIL R9, 03
    LIH R9, 33
    STORE [R9], R1
    LIL R1, 01
    LIH R1, 00
    LIL R9, 04
    LIH R9, 33
    STORE [R9], R1
    LIL R2, 08
    LIH R2, 02
    LIL R3, 00
    LIH R3, 1B
    LIL R1, 31
    LIH R1, 00
    LIL R10, 91 ; return_4 = 0091
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_4:
    LIL R1, 36
    LIH R1, 00
    LIL R10, 9C ; return_5 = 009C
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_5:
    LIL R1, 20
    LIH R1, 00
    LIL R10, A7 ; return_6 = 00A7
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_6:
    LIL R1, 42
    LIH R1, 00
    LIL R10, B2 ; return_7 = 00B2
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_7:
    LIL R1, 49
    LIH R1, 00
    LIL R10, BD ; return_8 = 00BD
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_8:
    LIL R1, 54
    LIH R1, 00
    LIL R10, C8 ; return_9 = 00C8
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_9:
    LIL R1, 20
    LIH R1, 00
    LIL R10, D3 ; return_10 = 00D3
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_10:
    LIL R1, 43
    LIH R1, 00
    LIL R10, DE ; return_11 = 00DE
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_11:
    LIL R1, 50
    LIH R1, 00
    LIL R10, E9 ; return_12 = 00E9
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_12:
    LIL R1, 55
    LIH R1, 00
    LIL R10, F4 ; return_13 = 00F4
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_13:
    LIL R1, 20
    LIH R1, 00
    LIL R10, FF ; return_14 = 00FF
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_14:
    LIL R1, 43
    LIH R1, 00
    LIL R10, 0A ; return_15 = 010A
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_15:
    LIL R1, 41
    LIH R1, 00
    LIL R10, 15 ; return_16 = 0115
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_16:
    LIL R1, 4C
    LIH R1, 00
    LIL R10, 20 ; return_17 = 0120
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_17:
    LIL R1, 43
    LIH R1, 00
    LIL R10, 2B ; return_18 = 012B
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_18:
    LIL R2, 08
    LIH R2, 07
    LIL R3, 00
    LIH R3, 36
    LIL R1, 41
    LIH R1, 00
    LIL R10, 3A ; return_19 = 013A
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_19:
    LIL R1, 2B
    LIH R1, 00
    LIL R10, 45 ; return_20 = 0145
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_20:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 50 ; return_21 = 0150
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_21:
    LIL R1, 53
    LIH R1, 00
    LIL R10, 5B ; return_22 = 015B
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_22:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 66 ; return_23 = 0166
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_23:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 71 ; return_24 = 0171
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_24:
    LIL R1, 4D
    LIH R1, 00
    LIL R10, 7C ; return_25 = 017C
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_25:
    LIL R1, 2A
    LIH R1, 00
    LIL R10, 87 ; return_26 = 0187
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_26:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 92 ; return_27 = 0192
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_27:
    LIL R1, 44
    LIH R1, 00
    LIL R10, 9D ; return_28 = 019D
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_28:
    LIL R1, 2F
    LIH R1, 00
    LIL R10, A8 ; return_29 = 01A8
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_29:
    LIL R2, 08
    LIH R2, 0B
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
    LIL R1, 4C
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
    LIL R1, 43
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
    LIL R1, 20
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 4F
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
    LIL R1, 45
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
    LIL R1, 41
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
    LIL R1, 49
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 4F
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 4E
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
    LIL R1, 2D
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
    LIL R1, 54
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 59
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
    LIL R1, 46
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 49
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
    LIL R1, 20
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 4E
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
    LIL R1, 42
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
    LIL R1, 2D
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
    LIL R1, 45
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 4E
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
    LIL R1, 45
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
    LIL R1, 2D
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
    LIL R1, 43
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 4F
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 4E
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 44
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
    LIL R1, 4E
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
    LIL R1, 42
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
    LIL R1, 2D
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
    LIL R1, 45
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 4E
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
    LIL R1, 45
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
    LIL R2, 08
    LIH R2, 0E
    LIL R1, 46
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 49
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
    LIL R1, 20
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 28
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 30
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 2D
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 32
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 35
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 35
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 29
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R2, 2B
    LIH R2, 0E
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
    LIL R1, 43
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 4F
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 4E
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 44
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
    LIL R1, 28
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 30
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 2D
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 32
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 35
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 35
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 29
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R2, 4F
    LIH R2, 0E
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
    LIL R1, 4C
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
    LIL R1, 20
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 28
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 44
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
    LIL R1, 43
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 49
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
    LIL R1, 41
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 4C
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 29
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R2, C3
    LIH R2, 0F
    LIL R3, 00
    LIH R3, 1B
    LIL R1, 3D
    LIH R1, 00
    LIL R10, 59 ; return_30 = 0459
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_30:
    LIL R2, 88
    LIH R2, 29
    LIL R3, 00
    LIH R3, 1B
    LIL R1, 52
    LIH R1, 00
    LIL R10, 68 ; return_31 = 0468
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_31:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 73 ; return_32 = 0473
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_32:
    LIL R1, 52
    LIH R1, 00
    LIL R10, 7E ; return_33 = 047E
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_33:
    LIL R1, 45
    LIH R1, 00
    LIL R10, 89 ; return_34 = 0489
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_34:
    LIL R1, 53
    LIH R1, 00
    LIL R10, 94 ; return_35 = 0494
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_35:
    LIL R1, 54
    LIH R1, 00
    LIL R10, 9F ; return_36 = 049F
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_36:
    LIL R1, 41
    LIH R1, 00
    LIL R10, AA ; return_37 = 04AA
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_37:
    LIL R1, 52
    LIH R1, 00
    LIL R10, B5 ; return_38 = 04B5
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_38:
    LIL R1, 54
    LIH R1, 00
    LIL R10, C0 ; return_39 = 04C0
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_39:
    LIL R10, C9 ; return_40 = 04C9
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 47 ; draw_inputs = 0647
    LIH R10, 06
    JMP R10
return_40:
    LIL R9, 05
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, CF
    LIH R2, 0F
    LIL R3, 00
    LIH R3, 12
    LIL R4, 05
    LIH R4, 00
    LIL R10, DB ; return_41 = 04DB
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 2B ; decimal = 0B2B
    LIH R10, 0B
    JMP R10
return_41:
    LIL R10, E4 ; return_42 = 04E4
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 70 ; prompt = 0670
    LIH R10, 06
    JMP R10
return_42:
poll:
    LIL R9, FF
    LIH R9, FF
    LOAD R1, [R9]
    CMP R1, R0
    LIL R10, E4 ; poll = 04E4
    LIH R10, 04
    BEQ R10
    LIL R9, 08
    LIH R9, 30
    STORE [R9], R1
    LIL R2, 12
    LIH R2, 00
    CMP R1, R2
    LIL R10, 00 ; start = 0000
    LIH R10, 00
    BEQ R10
    LIL R9, 03
    LIH R9, 30
    LOAD R4, [R9]
    CMP R4, R0
    LIL R10, 98 ; select_op = 0598
    LIH R10, 05
    BEQ R10
    LIL R2, 03
    LIH R2, 00
    CMP R4, R2
    LIL R10, 55 ; finished_key = 0555
    LIH R10, 05
    BEQ R10
    LIL R2, 1C
    LIH R2, 00
    CMP R1, R2
    LIL R10, 5E ; enter_key = 055E
    LIH R10, 05
    BEQ R10
    LIL R8, 00
    LIH R8, 30
    LIL R2, 01
    LIH R2, 00
    CMP R4, R2
    LIL R10, 11 ; input_address = 0511
    LIH R10, 05
    BEQ R10
    LIL R8, 01
    LIH R8, 30
input_address:
    LOAD R2, [R8]
    LIL R3, 1B
    LIH R3, 00
    CMP R1, R3
    LIL R10, 38 ; backspace = 0538
    LIH R10, 05
    BEQ R10
    LIL R3, 1E
    LIH R3, 00
    CMP R1, R3
    LIL R10, E4 ; poll = 04E4
    LIH R10, 04
    BLT R10
    LIL R3, 28
    LIH R3, 00
    CMP R1, R3
    LIL R10, 27 ; digit_key = 0527
    LIH R10, 05
    BLT R10
    LIL R10, E4 ; poll = 04E4
    LIH R10, 04
    JMP R10
digit_key:
    LIL R3, 1E
    LIH R3, 00
    SUB R1, R1, R3
    SLL R3, R2
    SLL R4, R3
    SLL R4, R4
    ADD R2, R3, R4
    ADD R2, R2, R1
    LIL R3, 00
    LIH R3, 01
    CMP R2, R3
    LIL R10, 48 ; save_input = 0548
    LIH R10, 05
    BLT R10
    LIL R10, E4 ; poll = 04E4
    LIH R10, 04
    JMP R10
backspace:
    LIL R1, 00
    LIH R1, 00
    LIL R3, 0A
    LIH R3, 00
    LIL R4, 01
    LIH R4, 00
backspace_loop:
    CMP R2, R3
    LIL R10, 47 ; backspace_done = 0547
    LIH R10, 05
    BLT R10
    SUB R2, R2, R3
    ADD R1, R1, R4
    LIL R10, 3E ; backspace_loop = 053E
    LIH R10, 05
    JMP R10
backspace_done:
    ADD R2, R1, R0
save_input:
    STORE [R8], R2
    LIL R10, 52 ; return_43 = 0552
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 47 ; draw_inputs = 0647
    LIH R10, 06
    JMP R10
return_43:
    LIL R10, E4 ; poll = 04E4
    LIH R10, 04
    JMP R10
finished_key:
    LIL R2, 1C
    LIH R2, 00
    CMP R1, R2
    LIL R10, 00 ; start = 0000
    LIH R10, 00
    BEQ R10
    LIL R10, E4 ; poll = 04E4
    LIH R10, 04
    JMP R10
enter_key:
    LIL R2, 01
    LIH R2, 00
    CMP R4, R2
    LIL R10, 87 ; second_phase = 0587
    LIH R10, 05
    BEQ R10
    LIL R10, 6D ; return_44 = 056D
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 22 ; calculate = 0922
    LIH R10, 09
    JMP R10
return_44:
    LIL R1, 03
    LIH R1, 00
    LIL R9, 03
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 7B ; return_45 = 057B
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 93 ; draw_result = 0993
    LIH R10, 09
    JMP R10
return_45:
    LIL R10, 84 ; return_46 = 0584
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 70 ; prompt = 0670
    LIH R10, 06
    JMP R10
return_46:
    LIL R10, E4 ; poll = 04E4
    LIH R10, 04
    JMP R10
second_phase:
    LIL R1, 02
    LIH R1, 00
    LIL R9, 03
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 95 ; return_47 = 0595
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 70 ; prompt = 0670
    LIH R10, 06
    JMP R10
return_47:
    LIL R10, E4 ; poll = 04E4
    LIH R10, 04
    JMP R10
select_op:
    LIL R2, 01
    LIH R2, 00
    CMP R1, R2
    LIL R10, B3 ; select_1 = 05B3
    LIH R10, 05
    BEQ R10
    LIL R2, 13
    LIH R2, 00
    CMP R1, R2
    LIL R10, D8 ; select_2 = 05D8
    LIH R10, 05
    BEQ R10
    LIL R2, 0D
    LIH R2, 00
    CMP R1, R2
    LIL R10, FD ; select_3 = 05FD
    LIH R10, 05
    BEQ R10
    LIL R2, 04
    LIH R2, 00
    CMP R1, R2
    LIL R10, 22 ; select_4 = 0622
    LIH R10, 06
    BEQ R10
    LIL R10, E4 ; poll = 04E4
    LIH R10, 04
    JMP R10
select_1:
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
    LIL R2, 9F
    LIH R2, 0F
    LIL R3, 00
    LIH R3, 36
    LIL R1, 2B
    LIH R1, 00
    LIL R10, CC ; return_48 = 05CC
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_48:
    LIL R10, D5 ; return_49 = 05D5
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 70 ; prompt = 0670
    LIH R10, 06
    JMP R10
return_49:
    LIL R10, E4 ; poll = 04E4
    LIH R10, 04
    JMP R10
select_2:
    LIL R1, 02
    LIH R1, 00
    LIL R9, 02
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 01
    LIH R1, 00
    LIL R9, 03
    LIH R9, 30
    STORE [R9], R1
    LIL R2, 9F
    LIH R2, 0F
    LIL R3, 00
    LIH R3, 36
    LIL R1, 2D
    LIH R1, 00
    LIL R10, F1 ; return_50 = 05F1
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_50:
    LIL R10, FA ; return_51 = 05FA
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 70 ; prompt = 0670
    LIH R10, 06
    JMP R10
return_51:
    LIL R10, E4 ; poll = 04E4
    LIH R10, 04
    JMP R10
select_3:
    LIL R1, 03
    LIH R1, 00
    LIL R9, 02
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 01
    LIH R1, 00
    LIL R9, 03
    LIH R9, 30
    STORE [R9], R1
    LIL R2, 9F
    LIH R2, 0F
    LIL R3, 00
    LIH R3, 36
    LIL R1, 2A
    LIH R1, 00
    LIL R10, 16 ; return_52 = 0616
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_52:
    LIL R10, 1F ; return_53 = 061F
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 70 ; prompt = 0670
    LIH R10, 06
    JMP R10
return_53:
    LIL R10, E4 ; poll = 04E4
    LIH R10, 04
    JMP R10
select_4:
    LIL R1, 04
    LIH R1, 00
    LIL R9, 02
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 01
    LIH R1, 00
    LIL R9, 03
    LIH R9, 30
    STORE [R9], R1
    LIL R2, 9F
    LIH R2, 0F
    LIL R3, 00
    LIH R3, 36
    LIL R1, 2F
    LIH R1, 00
    LIL R10, 3B ; return_54 = 063B
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_54:
    LIL R10, 44 ; return_55 = 0644
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 70 ; prompt = 0670
    LIH R10, 06
    JMP R10
return_55:
    LIL R10, E4 ; poll = 04E4
    LIH R10, 04
    JMP R10
draw_inputs:
    LIL R9, 00
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 88
    LIH R2, 0F
    LIL R3, 00
    LIH R3, 3F
    LIL R4, 03
    LIH R4, 00
    LIL R10, 59 ; return_56 = 0659
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 2B ; decimal = 0B2B
    LIH R10, 0B
    JMP R10
return_56:
    LIL R9, 01
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, AB
    LIH R2, 0F
    LIL R3, 00
    LIH R3, 3F
    LIL R4, 03
    LIH R4, 00
    LIL R10, 6B ; return_57 = 066B
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 2B ; decimal = 0B2B
    LIH R10, 0B
    JMP R10
return_57:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
prompt:
    LIL R1, 88
    LIH R1, 15
    LIL R2, 6C
    LIH R2, 00
    LIL R3, 05
    LIH R3, 00
    LIL R4, 00
    LIH R4, 00
    LIL R10, 81 ; return_58 = 0681
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, C2 ; fill_rect = 0AC2
    LIH R10, 0A
    JMP R10
return_58:
    LIL R1, 08
    LIH R1, 13
    LIL R2, 12
    LIH R2, 00
    LIL R3, 01
    LIH R3, 00
    LIL R4, 00
    LIH R4, 00
    LIL R10, 92 ; return_59 = 0692
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, C2 ; fill_rect = 0AC2
    LIH R10, 0A
    JMP R10
return_59:
    LIL R1, 2B
    LIH R1, 13
    LIL R2, 12
    LIH R2, 00
    LIL R3, 01
    LIH R3, 00
    LIL R4, 00
    LIH R4, 00
    LIL R10, A3 ; return_60 = 06A3
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, C2 ; fill_rect = 0AC2
    LIH R10, 0A
    JMP R10
return_60:
    LIL R9, 03
    LIH R9, 30
    LOAD R1, [R9]
    CMP R1, R0
    LIL R10, 6F ; prompt_op = 076F
    LIH R10, 07
    BEQ R10
    LIL R2, 01
    LIH R2, 00
    CMP R1, R2
    LIL R10, DB ; prompt_first = 07DB
    LIH R10, 07
    BEQ R10
    LIL R2, 02
    LIH R2, 00
    CMP R1, R2
    LIL R10, 79 ; prompt_second = 0879
    LIH R10, 08
    BEQ R10
    LIL R2, 88
    LIH R2, 15
    LIL R3, 00
    LIH R3, 1B
    LIL R1, 45
    LIH R1, 00
    LIL R10, C5 ; return_61 = 06C5
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_61:
    LIL R1, 4E
    LIH R1, 00
    LIL R10, D0 ; return_62 = 06D0
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_62:
    LIL R1, 54
    LIH R1, 00
    LIL R10, DB ; return_63 = 06DB
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_63:
    LIL R1, 45
    LIH R1, 00
    LIL R10, E6 ; return_64 = 06E6
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_64:
    LIL R1, 52
    LIH R1, 00
    LIL R10, F1 ; return_65 = 06F1
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_65:
    LIL R1, 20
    LIH R1, 00
    LIL R10, FC ; return_66 = 06FC
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_66:
    LIL R1, 54
    LIH R1, 00
    LIL R10, 07 ; return_67 = 0707
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_67:
    LIL R1, 4F
    LIH R1, 00
    LIL R10, 12 ; return_68 = 0712
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_68:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 1D ; return_69 = 071D
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_69:
    LIL R1, 52
    LIH R1, 00
    LIL R10, 28 ; return_70 = 0728
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_70:
    LIL R1, 45
    LIH R1, 00
    LIL R10, 33 ; return_71 = 0733
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_71:
    LIL R1, 53
    LIH R1, 00
    LIL R10, 3E ; return_72 = 073E
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_72:
    LIL R1, 54
    LIH R1, 00
    LIL R10, 49 ; return_73 = 0749
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_73:
    LIL R1, 41
    LIH R1, 00
    LIL R10, 54 ; return_74 = 0754
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_74:
    LIL R1, 52
    LIH R1, 00
    LIL R10, 5F ; return_75 = 075F
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_75:
    LIL R1, 54
    LIH R1, 00
    LIL R10, 6A ; return_76 = 076A
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_76:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
prompt_op:
    LIL R2, 88
    LIH R2, 15
    LIL R3, 00
    LIH R3, 1B
    LIL R1, 43
    LIH R1, 00
    LIL R10, 7E ; return_77 = 077E
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_77:
    LIL R1, 48
    LIH R1, 00
    LIL R10, 89 ; return_78 = 0789
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_78:
    LIL R1, 4F
    LIH R1, 00
    LIL R10, 94 ; return_79 = 0794
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_79:
    LIL R1, 4F
    LIH R1, 00
    LIL R10, 9F ; return_80 = 079F
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_80:
    LIL R1, 53
    LIH R1, 00
    LIL R10, AA ; return_81 = 07AA
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_81:
    LIL R1, 45
    LIH R1, 00
    LIL R10, B5 ; return_82 = 07B5
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_82:
    LIL R1, 20
    LIH R1, 00
    LIL R10, C0 ; return_83 = 07C0
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_83:
    LIL R1, 4F
    LIH R1, 00
    LIL R10, CB ; return_84 = 07CB
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_84:
    LIL R1, 50
    LIH R1, 00
    LIL R10, D6 ; return_85 = 07D6
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_85:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
prompt_first:
    LIL R2, 88
    LIH R2, 15
    LIL R3, 00
    LIH R3, 1B
    LIL R1, 46
    LIH R1, 00
    LIL R10, EA ; return_86 = 07EA
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_86:
    LIL R1, 49
    LIH R1, 00
    LIL R10, F5 ; return_87 = 07F5
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_87:
    LIL R1, 52
    LIH R1, 00
    LIL R10, 00 ; return_88 = 0800
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_88:
    LIL R1, 53
    LIH R1, 00
    LIL R10, 0B ; return_89 = 080B
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_89:
    LIL R1, 54
    LIH R1, 00
    LIL R10, 16 ; return_90 = 0816
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_90:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 21 ; return_91 = 0821
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_91:
    LIL R1, 4E
    LIH R1, 00
    LIL R10, 2C ; return_92 = 082C
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_92:
    LIL R1, 55
    LIH R1, 00
    LIL R10, 37 ; return_93 = 0837
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_93:
    LIL R1, 4D
    LIH R1, 00
    LIL R10, 42 ; return_94 = 0842
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_94:
    LIL R1, 42
    LIH R1, 00
    LIL R10, 4D ; return_95 = 084D
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_95:
    LIL R1, 45
    LIH R1, 00
    LIL R10, 58 ; return_96 = 0858
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_96:
    LIL R1, 52
    LIH R1, 00
    LIL R10, 63 ; return_97 = 0863
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_97:
    LIL R1, 08
    LIH R1, 13
    LIL R2, 12
    LIH R2, 00
    LIL R3, 01
    LIH R3, 00
    LIL R4, 00
    LIH R4, 36
    LIL R10, 74 ; return_98 = 0874
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, C2 ; fill_rect = 0AC2
    LIH R10, 0A
    JMP R10
return_98:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
prompt_second:
    LIL R2, 88
    LIH R2, 15
    LIL R3, 00
    LIH R3, 1B
    LIL R1, 53
    LIH R1, 00
    LIL R10, 88 ; return_99 = 0888
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_99:
    LIL R1, 45
    LIH R1, 00
    LIL R10, 93 ; return_100 = 0893
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_100:
    LIL R1, 43
    LIH R1, 00
    LIL R10, 9E ; return_101 = 089E
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_101:
    LIL R1, 4F
    LIH R1, 00
    LIL R10, A9 ; return_102 = 08A9
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_102:
    LIL R1, 4E
    LIH R1, 00
    LIL R10, B4 ; return_103 = 08B4
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_103:
    LIL R1, 44
    LIH R1, 00
    LIL R10, BF ; return_104 = 08BF
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_104:
    LIL R1, 20
    LIH R1, 00
    LIL R10, CA ; return_105 = 08CA
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_105:
    LIL R1, 4E
    LIH R1, 00
    LIL R10, D5 ; return_106 = 08D5
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_106:
    LIL R1, 55
    LIH R1, 00
    LIL R10, E0 ; return_107 = 08E0
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_107:
    LIL R1, 4D
    LIH R1, 00
    LIL R10, EB ; return_108 = 08EB
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_108:
    LIL R1, 42
    LIH R1, 00
    LIL R10, F6 ; return_109 = 08F6
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_109:
    LIL R1, 45
    LIH R1, 00
    LIL R10, 01 ; return_110 = 0901
    LIH R10, 09
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_110:
    LIL R1, 52
    LIH R1, 00
    LIL R10, 0C ; return_111 = 090C
    LIH R10, 09
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_111:
    LIL R1, 2B
    LIH R1, 13
    LIL R2, 12
    LIH R2, 00
    LIL R3, 01
    LIH R3, 00
    LIL R4, 00
    LIH R4, 36
    LIL R10, 1D ; return_112 = 091D
    LIH R10, 09
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, C2 ; fill_rect = 0AC2
    LIH R10, 0A
    JMP R10
return_112:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
calculate:
    LIL R9, 00
    LIH R9, 30
    LOAD R1, [R9]
    LIL R9, 01
    LIH R9, 30
    LOAD R2, [R9]
    LIL R9, 02
    LIH R9, 30
    LOAD R4, [R9]
    LIL R9, 04
    LIH R9, 30
    STORE [R9], R0
    LIL R9, 06
    LIH R9, 30
    STORE [R9], R0
    LIL R9, 07
    LIH R9, 30
    STORE [R9], R0
    LIL R3, 01
    LIH R3, 00
    CMP R4, R3
    LIL R10, 68 ; calc_add = 0968
    LIH R10, 09
    BEQ R10
    LIL R3, 02
    LIH R3, 00
    CMP R4, R3
    LIL R10, 6C ; calc_sub = 096C
    LIH R10, 09
    BEQ R10
    LIL R3, 03
    LIH R3, 00
    CMP R4, R3
    LIL R10, 7D ; calc_mul = 097D
    LIH R10, 09
    BEQ R10
    CMP R2, R0
    LIL R10, 5E ; calc_zero_divisor = 095E
    LIH R10, 09
    BEQ R10
    LIL R3, 00
    LIH R3, 00
    LIL R4, 01
    LIH R4, 00
calc_div_loop:
    CMP R1, R2
    LIL R10, 57 ; calc_div_done = 0957
    LIH R10, 09
    BLT R10
    SUB R1, R1, R2
    ADD R3, R3, R4
    LIL R10, 4E ; calc_div_loop = 094E
    LIH R10, 09
    JMP R10
calc_div_done:
    LIL R9, 07
    LIH R9, 30
    STORE [R9], R1
    ADD R1, R3, R0
    LIL R10, 8B ; calc_save = 098B
    LIH R10, 09
    JMP R10
calc_zero_divisor:
    LIL R1, 01
    LIH R1, 00
    LIL R9, 04
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 00
    LIH R1, 00
    LIL R10, 8B ; calc_save = 098B
    LIH R10, 09
    JMP R10
calc_add:
    ADD R1, R1, R2
    LIL R10, 8B ; calc_save = 098B
    LIH R10, 09
    JMP R10
calc_sub:
    CMP R1, R2
    LIL R10, 74 ; calc_negative = 0974
    LIH R10, 09
    BLT R10
    SUB R1, R1, R2
    LIL R10, 8B ; calc_save = 098B
    LIH R10, 09
    JMP R10
calc_negative:
    SUB R1, R2, R1
    LIL R3, 01
    LIH R3, 00
    LIL R9, 06
    LIH R9, 30
    STORE [R9], R3
    LIL R10, 8B ; calc_save = 098B
    LIH R10, 09
    JMP R10
calc_mul:
    LIL R3, 00
    LIH R3, 00
    LIL R4, 01
    LIH R4, 00
calc_mul_loop:
    CMP R2, R0
    LIL R10, 8A ; calc_mul_done = 098A
    LIH R10, 09
    BEQ R10
    ADD R3, R3, R1
    SUB R2, R2, R4
    LIL R10, 81 ; calc_mul_loop = 0981
    LIH R10, 09
    JMP R10
calc_mul_done:
    ADD R1, R3, R0
calc_save:
    LIL R9, 05
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
draw_result:
    LIL R9, 04
    LIH R9, 30
    LOAD R1, [R9]
    CMP R1, R0
    LIL R10, 3D ; draw_number = 0A3D
    LIH R10, 0A
    BEQ R10
    LIL R2, 08
    LIH R2, 1D
    LIL R3, 00
    LIH R3, 24
    LIL R1, 44
    LIH R1, 00
    LIL R10, A9 ; return_113 = 09A9
    LIH R10, 09
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_113:
    LIL R1, 49
    LIH R1, 00
    LIL R10, B4 ; return_114 = 09B4
    LIH R10, 09
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_114:
    LIL R1, 56
    LIH R1, 00
    LIL R10, BF ; return_115 = 09BF
    LIH R10, 09
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_115:
    LIL R1, 49
    LIH R1, 00
    LIL R10, CA ; return_116 = 09CA
    LIH R10, 09
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_116:
    LIL R1, 44
    LIH R1, 00
    LIL R10, D5 ; return_117 = 09D5
    LIH R10, 09
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_117:
    LIL R1, 45
    LIH R1, 00
    LIL R10, E0 ; return_118 = 09E0
    LIH R10, 09
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_118:
    LIL R1, 20
    LIH R1, 00
    LIL R10, EB ; return_119 = 09EB
    LIH R10, 09
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_119:
    LIL R1, 42
    LIH R1, 00
    LIL R10, F6 ; return_120 = 09F6
    LIH R10, 09
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_120:
    LIL R1, 59
    LIH R1, 00
    LIL R10, 01 ; return_121 = 0A01
    LIH R10, 0A
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_121:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 0C ; return_122 = 0A0C
    LIH R10, 0A
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_122:
    LIL R1, 5A
    LIH R1, 00
    LIL R10, 17 ; return_123 = 0A17
    LIH R10, 0A
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_123:
    LIL R1, 45
    LIH R1, 00
    LIL R10, 22 ; return_124 = 0A22
    LIH R10, 0A
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_124:
    LIL R1, 52
    LIH R1, 00
    LIL R10, 2D ; return_125 = 0A2D
    LIH R10, 0A
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_125:
    LIL R1, 4F
    LIH R1, 00
    LIL R10, 38 ; return_126 = 0A38
    LIH R10, 0A
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_126:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
draw_number:
    LIL R9, 05
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, CF
    LIH R2, 0F
    LIL R3, 00
    LIH R3, 12
    LIL R4, 05
    LIH R4, 00
    LIL R10, 4F ; return_127 = 0A4F
    LIH R10, 0A
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 2B ; decimal = 0B2B
    LIH R10, 0B
    JMP R10
return_127:
    LIL R9, 06
    LIH R9, 30
    LOAD R1, [R9]
    CMP R1, R0
    LIL R10, 65 ; draw_remainder = 0A65
    LIH R10, 0A
    BEQ R10
    LIL R2, C9
    LIH R2, 0F
    LIL R3, 00
    LIH R3, 12
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 65 ; return_128 = 0A65
    LIH R10, 0A
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_128:
draw_remainder:
    LIL R9, 02
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 04
    LIH R2, 00
    CMP R1, R2
    LIL R10, 73 ; draw_division_rem = 0A73
    LIH R10, 0A
    BEQ R10
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
draw_division_rem:
    LIL R2, 4F
    LIH R2, 1D
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
    LIL R1, 4D
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
    LIL R1, 49
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 4E
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 44
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
    LIL R1, 52
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R9, 07
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 4F
    LIH R2, 1F
    LIL R3, 00
    LIH R3, 36
    LIL R4, 03
    LIH R4, 00
    LIL R10, BD ; return_129 = 0ABD
    LIH R10, 0A
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 2B ; decimal = 0B2B
    LIH R10, 0B
    JMP R10
return_129:
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
    LIL R10, D3 ; fill_next_row = 0AD3
    LIH R10, 0A
    BEQ R10
    LIL R10, C9 ; fill_pixel = 0AC9
    LIH R10, 0A
    JMP R10
fill_next_row:
    ADD R5, R5, R9
    SUB R3, R3, R8
    CMP R3, R0
    LIL R10, DC ; fill_done = 0ADC
    LIH R10, 0A
    BEQ R10
    LIL R10, C7 ; fill_row = 0AC7
    LIH R10, 0A
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
    LIL R10, FD ; char_blank = 0AFD
    LIH R10, 0A
    BEQ R10
    STORE [R8], R3
    LIL R10, FE ; char_advance = 0AFE
    LIH R10, 0A
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
    LIL R10, 0A ; char_row_done = 0B0A
    LIH R10, 0B
    BEQ R10
    LIL R10, F3 ; char_pixel = 0AF3
    LIH R10, 0A
    JMP R10
char_row_done:
    LIL R9, 7B
    LIH R9, 00
    ADD R8, R8, R9
    LIL R9, 01
    LIH R9, 00
    SUB R6, R6, R9
    CMP R6, R0
    LIL R10, 23 ; char_done = 0B23
    LIH R10, 0B
    BEQ R10
    LIL R9, 02
    LIH R9, 00
    CMP R6, R9
    LIL R10, 1D ; char_second_word = 0B1D
    LIH R10, 0B
    BEQ R10
    LIL R10, F1 ; char_row = 0AF1
    LIH R10, 0A
    JMP R10
char_second_word:
    ADD R1, R4, R0
    LIL R5, 00
    LIH R5, 02
    LIL R10, F1 ; char_row = 0AF1
    LIH R10, 0A
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
decimal:
    LIL R9, 00
    LIH R9, 32
    STORE [R9], R1
    LIL R9, 01
    LIH R9, 32
    STORE [R9], R4
    LIL R1, 03
    LIH R1, 00
    CMP R4, R1
    LIL R10, 3C ; decimal_three = 0B3C
    LIH R10, 0B
    BEQ R10
    LIL R1, 00
    LIH R1, 33
    LIL R10, 3E ; decimal_pointer = 0B3E
    LIH R10, 0B
    JMP R10
decimal_three:
    LIL R1, 02
    LIH R1, 33
decimal_pointer:
    LIL R9, 02
    LIH R9, 32
    STORE [R9], R1
decimal_digit:
    LIL R9, 00
    LIH R9, 32
    LOAD R1, [R9]
    LIL R9, 02
    LIH R9, 32
    LOAD R4, [R9]
    LOAD R4, [R4]
    LIL R5, 00
    LIH R5, 00
    LIL R8, 01
    LIH R8, 00
decimal_subtract:
    CMP R1, R0
    LIL R10, 54 ; decimal_do_subtract = 0B54
    LIH R10, 0B
    BLT R10
    CMP R1, R4
    LIL R10, 59 ; decimal_draw = 0B59
    LIH R10, 0B
    BLT R10
decimal_do_subtract:
    SUB R1, R1, R4
    ADD R5, R5, R8
    LIL R10, 4C ; decimal_subtract = 0B4C
    LIH R10, 0B
    JMP R10
decimal_draw:
    LIL R9, 00
    LIH R9, 32
    STORE [R9], R1
    LIL R4, 30
    LIH R4, 00
    ADD R1, R5, R4
    LIL R10, 68 ; return_130 = 0B68
    LIH R10, 0B
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E1 ; big_char = 0AE1
    LIH R10, 0A
    JMP R10
return_130:
    LIL R9, 01
    LIH R9, 32
    LOAD R4, [R9]
    LIL R5, 01
    LIH R5, 00
    SUB R4, R4, R5
    LIL R9, 01
    LIH R9, 32
    STORE [R9], R4
    CMP R4, R0
    LIL R10, 7F ; decimal_done = 0B7F
    LIH R10, 0B
    BEQ R10
    LIL R9, 02
    LIH R9, 32
    LOAD R4, [R9]
    ADD R4, R4, R5
    LIL R9, 02
    LIH R9, 32
    STORE [R9], R4
    LIL R10, 41 ; decimal_digit = 0B41
    LIH R10, 0B
    JMP R10
decimal_done:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
