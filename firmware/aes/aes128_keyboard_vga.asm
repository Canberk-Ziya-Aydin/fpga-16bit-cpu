; Existing CPU ISA. All numeric operands are hexadecimal.
; R0 = zero, R10 = branch/call scratch, R11 = software stack pointer.
boot:
    LIL R0, 00
    LIH R0, 00
    LIL R11, 00
    LIH R11, 3F
    LIL R10, 0D ; return_1 = 000D
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, F4 ; init_tables = 15F4
    LIH R10, 15
    JMP R10
return_1:
    LIL R10, 10 ; new_session = 0010
    LIH R10, 00
    JMP R10
new_session:
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
    LIL R10, 25 ; return_2 = 0025
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 8B ; fill_rect = 158B
    LIH R10, 15
    JMP R10
return_2:
    LIL R1, 00
    LIH R1, 00
    LIL R2, 80
    LIH R2, 00
    LIL R3, 01
    LIH R3, 00
    LIL R4, 00
    LIH R4, 1B
    LIL R10, 36 ; return_3 = 0036
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 8B ; fill_rect = 158B
    LIH R10, 15
    JMP R10
return_3:
    LIL R1, 00
    LIH R1, 2E
    LIL R2, 80
    LIH R2, 00
    LIL R3, 01
    LIH R3, 00
    LIL R4, 00
    LIH R4, 1B
    LIL R10, 47 ; return_4 = 0047
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 8B ; fill_rect = 158B
    LIH R10, 15
    JMP R10
return_4:
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
    LIL R2, 88
    LIH R2, 01
    LIL R3, 00
    LIH R3, 1B
    LIL R1, 41
    LIH R1, 00
    LIL R10, 74 ; return_5 = 0074
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_5:
    LIL R1, 45
    LIH R1, 00
    LIL R10, 7F ; return_6 = 007F
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_6:
    LIL R1, 53
    LIH R1, 00
    LIL R10, 8A ; return_7 = 008A
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_7:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 95 ; return_8 = 0095
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_8:
    LIL R1, 31
    LIH R1, 00
    LIL R10, A0 ; return_9 = 00A0
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_9:
    LIL R1, 32
    LIH R1, 00
    LIL R10, AB ; return_10 = 00AB
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_10:
    LIL R1, 38
    LIH R1, 00
    LIL R10, B6 ; return_11 = 00B6
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_11:
    LIL R2, 08
    LIH R2, 06
    LIL R3, 00
    LIH R3, 36
    LIL R1, 45
    LIH R1, 00
    LIL R10, C5 ; return_12 = 00C5
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_12:
    LIL R1, 20
    LIH R1, 00
    LIL R10, D0 ; return_13 = 00D0
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_13:
    LIL R1, 45
    LIH R1, 00
    LIL R10, DB ; return_14 = 00DB
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_14:
    LIL R1, 4E
    LIH R1, 00
    LIL R10, E6 ; return_15 = 00E6
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_15:
    LIL R1, 43
    LIH R1, 00
    LIL R10, F1 ; return_16 = 00F1
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_16:
    LIL R1, 52
    LIH R1, 00
    LIL R10, FC ; return_17 = 00FC
    LIH R10, 00
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_17:
    LIL R1, 59
    LIH R1, 00
    LIL R10, 07 ; return_18 = 0107
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_18:
    LIL R1, 50
    LIH R1, 00
    LIL R10, 12 ; return_19 = 0112
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_19:
    LIL R1, 54
    LIH R1, 00
    LIL R10, 1D ; return_20 = 011D
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_20:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 28 ; return_21 = 0128
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_21:
    LIL R1, 44
    LIH R1, 00
    LIL R10, 33 ; return_22 = 0133
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_22:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 3E ; return_23 = 013E
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_23:
    LIL R1, 44
    LIH R1, 00
    LIL R10, 49 ; return_24 = 0149
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_24:
    LIL R1, 45
    LIH R1, 00
    LIL R10, 54 ; return_25 = 0154
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_25:
    LIL R1, 43
    LIH R1, 00
    LIL R10, 5F ; return_26 = 015F
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_26:
    LIL R1, 52
    LIH R1, 00
    LIL R10, 6A ; return_27 = 016A
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_27:
    LIL R1, 59
    LIH R1, 00
    LIL R10, 75 ; return_28 = 0175
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_28:
    LIL R1, 50
    LIH R1, 00
    LIL R10, 80 ; return_29 = 0180
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_29:
    LIL R1, 54
    LIH R1, 00
    LIL R10, 8B ; return_30 = 018B
    LIH R10, 01
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_30:
    LIL R2, 08
    LIH R2, 0A
    LIL R1, 33
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
    LIL R1, 20
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 48
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
    LIL R1, 58
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
    LIL R1, 44
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
    LIL R1, 47
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
    LIL R1, 54
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
    LIL R1, 4B
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
    LIL R1, 59
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
    LIL R1, 42
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
    LIL R1, 4F
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
    LIL R1, 4B
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 2E
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
    LIL R1, 2F
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
    LIL R1, 43
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
    LIL R1, 53
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
    LIL R1, 52
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
    LIL R1, 53
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
    LIL R1, 48
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
    LIL R1, 56
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
    LIL R1, 55
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
    LIL R1, 50
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
    LIL R1, 54
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 2E
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R2, 08
    LIH R2, 0C
    LIL R1, 4B
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
    LIL R1, 59
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
    LIL R1, 31
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
    LIL R1, 38
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
    LIL R1, 42
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
    LIL R1, 54
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
    LIL R2, 08
    LIH R2, 17
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
    LIL R1, 50
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
    LIL R1, 31
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
    LIL R1, 38
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
    LIL R1, 42
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
    LIL R1, 54
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
    LIL R2, 08
    LIH R2, 22
    LIL R1, 4F
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
    LIL R1, 54
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
    LIL R1, 55
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
    LIL R1, 31
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
    LIL R1, 38
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
    LIL R1, 42
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
    LIL R1, 54
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
    LIL R2, 08
    LIH R2, 0D
    LIL R3, 00
    LIH R3, 3F
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 6C ; return_31 = 046C
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_31:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 77 ; return_32 = 0477
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_32:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 82 ; return_33 = 0482
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_33:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 8D ; return_34 = 048D
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_34:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 98 ; return_35 = 0498
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_35:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, A3 ; return_36 = 04A3
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_36:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, AE ; return_37 = 04AE
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_37:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, B9 ; return_38 = 04B9
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_38:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, C4 ; return_39 = 04C4
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_39:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, CF ; return_40 = 04CF
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_40:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, DA ; return_41 = 04DA
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_41:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, E5 ; return_42 = 04E5
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_42:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, F0 ; return_43 = 04F0
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_43:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, FB ; return_44 = 04FB
    LIH R10, 04
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_44:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 06 ; return_45 = 0506
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_45:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 11 ; return_46 = 0511
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_46:
    LIL R2, 88
    LIH R2, 10
    LIL R3, 00
    LIH R3, 3F
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 20 ; return_47 = 0520
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_47:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 2B ; return_48 = 052B
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_48:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 36 ; return_49 = 0536
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_49:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 41 ; return_50 = 0541
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_50:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 4C ; return_51 = 054C
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_51:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 57 ; return_52 = 0557
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_52:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 62 ; return_53 = 0562
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_53:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 6D ; return_54 = 056D
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_54:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 78 ; return_55 = 0578
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_55:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 83 ; return_56 = 0583
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_56:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 8E ; return_57 = 058E
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_57:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 99 ; return_58 = 0599
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_58:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, A4 ; return_59 = 05A4
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_59:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, AF ; return_60 = 05AF
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_60:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, BA ; return_61 = 05BA
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_61:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, C5 ; return_62 = 05C5
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_62:
    LIL R2, 08
    LIH R2, 18
    LIL R3, 00
    LIH R3, 3F
    LIL R1, 2D
    LIH R1, 00
    LIL R10, D4 ; return_63 = 05D4
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_63:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, DF ; return_64 = 05DF
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_64:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, EA ; return_65 = 05EA
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_65:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, F5 ; return_66 = 05F5
    LIH R10, 05
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_66:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 00 ; return_67 = 0600
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_67:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 0B ; return_68 = 060B
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_68:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 16 ; return_69 = 0616
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_69:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 21 ; return_70 = 0621
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_70:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 2C ; return_71 = 062C
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_71:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 37 ; return_72 = 0637
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_72:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 42 ; return_73 = 0642
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_73:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 4D ; return_74 = 064D
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_74:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 58 ; return_75 = 0658
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_75:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 63 ; return_76 = 0663
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_76:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 6E ; return_77 = 066E
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_77:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 79 ; return_78 = 0679
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_78:
    LIL R2, 88
    LIH R2, 1B
    LIL R3, 00
    LIH R3, 3F
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 88 ; return_79 = 0688
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_79:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 93 ; return_80 = 0693
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_80:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 9E ; return_81 = 069E
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_81:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, A9 ; return_82 = 06A9
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_82:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, B4 ; return_83 = 06B4
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_83:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, BF ; return_84 = 06BF
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_84:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, CA ; return_85 = 06CA
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_85:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, D5 ; return_86 = 06D5
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_86:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, E0 ; return_87 = 06E0
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_87:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, EB ; return_88 = 06EB
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_88:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, F6 ; return_89 = 06F6
    LIH R10, 06
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_89:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 01 ; return_90 = 0701
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_90:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 0C ; return_91 = 070C
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_91:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 17 ; return_92 = 0717
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_92:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 22 ; return_93 = 0722
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_93:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 2D ; return_94 = 072D
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_94:
    LIL R2, 08
    LIH R2, 23
    LIL R3, 00
    LIH R3, 12
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 3C ; return_95 = 073C
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_95:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 47 ; return_96 = 0747
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_96:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 52 ; return_97 = 0752
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_97:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 5D ; return_98 = 075D
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_98:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 68 ; return_99 = 0768
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_99:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 73 ; return_100 = 0773
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_100:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 7E ; return_101 = 077E
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_101:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 89 ; return_102 = 0789
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_102:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 94 ; return_103 = 0794
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_103:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 9F ; return_104 = 079F
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_104:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, AA ; return_105 = 07AA
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_105:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, B5 ; return_106 = 07B5
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_106:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, C0 ; return_107 = 07C0
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_107:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, CB ; return_108 = 07CB
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_108:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, D6 ; return_109 = 07D6
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_109:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, E1 ; return_110 = 07E1
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_110:
    LIL R2, 88
    LIH R2, 26
    LIL R3, 00
    LIH R3, 12
    LIL R1, 2D
    LIH R1, 00
    LIL R10, F0 ; return_111 = 07F0
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_111:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, FB ; return_112 = 07FB
    LIH R10, 07
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_112:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 06 ; return_113 = 0806
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_113:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 11 ; return_114 = 0811
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_114:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 1C ; return_115 = 081C
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_115:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 27 ; return_116 = 0827
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_116:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 32 ; return_117 = 0832
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_117:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 3D ; return_118 = 083D
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_118:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 48 ; return_119 = 0848
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_119:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 53 ; return_120 = 0853
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_120:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 5E ; return_121 = 085E
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_121:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 69 ; return_122 = 0869
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_122:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 74 ; return_123 = 0874
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_123:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 7F ; return_124 = 087F
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_124:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 8A ; return_125 = 088A
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_125:
    LIL R1, 2D
    LIH R1, 00
    LIL R10, 95 ; return_126 = 0895
    LIH R10, 08
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_126:
    LIL R2, 88
    LIH R2, 2D
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
    LIL R1, 4E
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
    LIL R1, 58
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
    LIL R1, 4E
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
    LIL R1, 57
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
    LIL R1, 4B
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
    LIL R1, 59
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R1, 2E
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
    LIL R1, 42
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
    LIL R1, 4B
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
    LIL R1, 45
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
    LIL R1, 49
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
    LIL R1, 2E
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
    LIL R1, 58
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
    LIL R1, 4D
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
    LIL R1, 2E
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
    LIL R1, 2E
    LIH R1, 07
    STORE [R2], R1
    LIL R1, 01
    LIH R1, 00
    ADD R2, R2, R1
    LIL R10, 02 ; return_127 = 0A02
    LIH R10, 0A
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 60 ; status = 1260
    LIH R10, 12
    JMP R10
return_127:
poll:
    LIL R9, FF
    LIH R9, FF
    LOAD R1, [R9]
    CMP R1, R0
    LIL R10, 02 ; poll = 0A02
    LIH R10, 0A
    BEQ R10
    LIL R9, 03
    LIH R9, 30
    STORE [R9], R1
    LIL R2, 12
    LIH R2, 00
    CMP R1, R2
    LIL R10, 10 ; new_session = 0010
    LIH R10, 00
    BEQ R10
    LIL R2, 14
    LIH R2, 00
    CMP R1, R2
    LIL R10, C7 ; example = 0BC7
    LIH R10, 0B
    BEQ R10
    LIL R9, 01
    LIH R9, 30
    LOAD R4, [R9]
    CMP R4, R0
    LIL R10, 42 ; choose_mode = 0B42
    LIH R10, 0B
    BEQ R10
    LIL R2, 03
    LIH R2, 00
    CMP R4, R2
    LIL R10, 7D ; completed_key = 0B7D
    LIH R10, 0B
    BEQ R10
    LIL R2, 1C
    LIH R2, 00
    CMP R1, R2
    LIL R10, DF ; enter_field = 0ADF
    LIH R10, 0A
    BEQ R10
    LIL R2, 1B
    LIH R2, 00
    CMP R1, R2
    LIL R10, AC ; erase_nibble = 0AAC
    LIH R10, 0A
    BEQ R10
    LIL R2, 01
    LIH R2, 00
    CMP R1, R2
    LIL R10, 02 ; poll = 0A02
    LIH R10, 0A
    BLT R10
    LIL R2, 07
    LIH R2, 00
    CMP R1, R2
    LIL R10, 4C ; letter_nibble = 0A4C
    LIH R10, 0A
    BLT R10
    LIL R2, 1E
    LIH R2, 00
    CMP R1, R2
    LIL R10, 02 ; poll = 0A02
    LIH R10, 0A
    BLT R10
    LIL R2, 28
    LIH R2, 00
    CMP R1, R2
    LIL R10, 52 ; digit_nibble = 0A52
    LIH R10, 0A
    BLT R10
    LIL R10, 02 ; poll = 0A02
    LIH R10, 0A
    JMP R10
letter_nibble:
    LIL R2, 09
    LIH R2, 00
    ADD R1, R1, R2
    LIL R10, 55 ; append_nibble = 0A55
    LIH R10, 0A
    JMP R10
digit_nibble:
    LIL R2, 1E
    LIH R2, 00
    SUB R1, R1, R2
append_nibble:
    LIL R9, 02
    LIH R9, 30
    LOAD R4, [R9]
    LIL R2, 20
    LIH R2, 00
    CMP R4, R2
    LIL R10, 61 ; append_valid = 0A61
    LIH R10, 0A
    BLT R10
    LIL R10, 02 ; poll = 0A02
    LIH R10, 0A
    JMP R10
append_valid:
    LIL R9, 07
    LIH R9, 30
    STORE [R9], R4
    LIL R5, 00
    LIH R5, 32
    LIL R9, 01
    LIH R9, 30
    LOAD R2, [R9]
    LIL R3, 01
    LIH R3, 00
    CMP R2, R3
    LIL R10, 71 ; append_address = 0A71
    LIH R10, 0A
    BEQ R10
    LIL R5, 20
    LIH R5, 32
append_address:
    ADD R5, R5, R4
    STORE [R5], R1
    LIL R4, 0A
    LIH R4, 00
    CMP R1, R4
    LIL R10, 7F ; nibble_number_128 = 0A7F
    LIH R10, 0A
    BLT R10
    LIL R4, 37
    LIH R4, 00
    ADD R1, R1, R4
    LIL R10, 82 ; nibble_ascii_129 = 0A82
    LIH R10, 0A
    JMP R10
nibble_number_128:
    LIL R4, 30
    LIH R4, 00
    ADD R1, R1, R4
nibble_ascii_129:
    LIL R9, 08
    LIH R9, 30
    STORE [R9], R1
    LIL R9, 02
    LIH R9, 30
    LOAD R4, [R9]
    LIL R2, 01
    LIH R2, 00
    ADD R4, R4, R2
    LIL R9, 02
    LIH R9, 30
    STORE [R9], R4
    LIL R10, 97 ; return_130 = 0A97
    LIH R10, 0A
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 08 ; cursor_clear = 1208
    LIH R10, 12
    JMP R10
return_130:
    LIL R10, A0 ; return_131 = 0AA0
    LIH R10, 0A
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E9 ; edit_echo = 11E9
    LIH R10, 11
    JMP R10
return_131:
    LIL R10, A9 ; return_132 = 0AA9
    LIH R10, 0A
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 26 ; cursor_update = 1226
    LIH R10, 12
    JMP R10
return_132:
    LIL R10, 02 ; poll = 0A02
    LIH R10, 0A
    JMP R10
erase_nibble:
    LIL R9, 02
    LIH R9, 30
    LOAD R1, [R9]
    CMP R1, R0
    LIL R10, 02 ; poll = 0A02
    LIH R10, 0A
    BEQ R10
    LIL R2, 01
    LIH R2, 00
    SUB R1, R1, R2
    LIL R9, 02
    LIH R9, 30
    STORE [R9], R1
    LIL R9, 07
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 2D
    LIH R1, 00
    LIL R9, 08
    LIH R9, 30
    STORE [R9], R1
    LIL R10, CA ; return_133 = 0ACA
    LIH R10, 0A
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 08 ; cursor_clear = 1208
    LIH R10, 12
    JMP R10
return_133:
    LIL R10, D3 ; return_134 = 0AD3
    LIH R10, 0A
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, E9 ; edit_echo = 11E9
    LIH R10, 11
    JMP R10
return_134:
    LIL R10, DC ; return_135 = 0ADC
    LIH R10, 0A
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 26 ; cursor_update = 1226
    LIH R10, 12
    JMP R10
return_135:
    LIL R10, 02 ; poll = 0A02
    LIH R10, 0A
    JMP R10
enter_field:
    LIL R9, 02
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 20
    LIH R2, 00
    CMP R1, R2
    LIL R10, EB ; field_complete = 0AEB
    LIH R10, 0A
    BEQ R10
    LIL R10, 02 ; poll = 0A02
    LIH R10, 0A
    JMP R10
field_complete:
    LIL R9, 01
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 01
    LIH R2, 00
    CMP R1, R2
    LIL R10, 0D ; key_complete = 0B0D
    LIH R10, 0B
    BEQ R10
    LIL R1, 20
    LIH R1, 32
    LIL R2, 20
    LIH R2, 31
    LIL R10, 01 ; return_136 = 0B01
    LIH R10, 0B
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 14 ; pack16 = 0D14
    LIH R10, 0D
    JMP R10
return_136:
    LIL R10, 0A ; return_137 = 0B0A
    LIH R10, 0B
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, D5 ; run_crypto = 14D5
    LIH R10, 14
    JMP R10
return_137:
    LIL R10, 02 ; poll = 0A02
    LIH R10, 0A
    JMP R10
key_complete:
    LIL R1, 00
    LIH R1, 32
    LIL R2, 00
    LIH R2, 31
    LIL R10, 1A ; return_138 = 0B1A
    LIH R10, 0B
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 14 ; pack16 = 0D14
    LIH R10, 0D
    JMP R10
return_138:
    LIL R10, 23 ; return_139 = 0B23
    LIH R10, 0B
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 32 ; key_expand = 0D32
    LIH R10, 0D
    JMP R10
return_139:
    LIL R1, 02
    LIH R1, 00
    LIL R9, 01
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 00
    LIH R1, 00
    LIL R9, 02
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 36 ; return_140 = 0B36
    LIH R10, 0B
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 60 ; status = 1260
    LIH R10, 12
    JMP R10
return_140:
    LIL R10, 3F ; return_141 = 0B3F
    LIH R10, 0B
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 26 ; cursor_update = 1226
    LIH R10, 12
    JMP R10
return_141:
    LIL R10, 02 ; poll = 0A02
    LIH R10, 0A
    JMP R10
choose_mode:
    LIL R2, 05
    LIH R2, 00
    CMP R1, R2
    LIL R10, 51 ; select_encrypt = 0B51
    LIH R10, 0B
    BEQ R10
    LIL R2, 04
    LIH R2, 00
    CMP R1, R2
    LIL R10, 59 ; select_decrypt = 0B59
    LIH R10, 0B
    BEQ R10
    LIL R10, 02 ; poll = 0A02
    LIH R10, 0A
    JMP R10
select_encrypt:
    LIL R1, 00
    LIH R1, 00
    LIL R9, 00
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 5E ; mode_selected = 0B5E
    LIH R10, 0B
    JMP R10
select_decrypt:
    LIL R1, 01
    LIH R1, 00
    LIL R9, 00
    LIH R9, 30
    STORE [R9], R1
mode_selected:
    LIL R1, 01
    LIH R1, 00
    LIL R9, 01
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 00
    LIH R1, 00
    LIL R9, 02
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 71 ; return_142 = 0B71
    LIH R10, 0B
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 60 ; status = 1260
    LIH R10, 12
    JMP R10
return_142:
    LIL R10, 7A ; return_143 = 0B7A
    LIH R10, 0B
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 26 ; cursor_update = 1226
    LIH R10, 12
    JMP R10
return_143:
    LIL R10, 02 ; poll = 0A02
    LIH R10, 0A
    JMP R10
completed_key:
    LIL R2, 1C
    LIH R2, 00
    CMP R1, R2
    LIL R10, 10 ; new_session = 0010
    LIH R10, 00
    BEQ R10
    LIL R2, 05
    LIH R2, 00
    CMP R1, R2
    LIL R10, 92 ; chain_encrypt = 0B92
    LIH R10, 0B
    BEQ R10
    LIL R2, 04
    LIH R2, 00
    CMP R1, R2
    LIL R10, 9A ; chain_decrypt = 0B9A
    LIH R10, 0B
    BEQ R10
    LIL R10, 02 ; poll = 0A02
    LIH R10, 0A
    JMP R10
chain_encrypt:
    LIL R1, 00
    LIH R1, 00
    LIL R9, 00
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 9F ; chain_input = 0B9F
    LIH R10, 0B
    JMP R10
chain_decrypt:
    LIL R1, 01
    LIH R1, 00
    LIL R9, 00
    LIH R9, 30
    STORE [R9], R1
chain_input:
    LIL R1, 00
    LIH R1, 34
    LIL R2, 20
    LIH R2, 31
    LIL R10, AC ; return_144 = 0BAC
    LIH R10, 0B
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, FD ; copy16 = 0CFD
    LIH R10, 0C
    JMP R10
return_144:
    LIL R1, 20
    LIH R1, 31
    LIL R2, 08
    LIH R2, 18
    LIL R3, 00
    LIH R3, 3F
    LIL R10, BB ; return_145 = 0BBB
    LIH R10, 0B
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 52 ; draw_hex = 1152
    LIH R10, 11
    JMP R10
return_145:
    LIL R10, C4 ; return_146 = 0BC4
    LIH R10, 0B
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, D5 ; run_crypto = 14D5
    LIH R10, 14
    JMP R10
return_146:
    LIL R10, 02 ; poll = 0A02
    LIH R10, 0A
    JMP R10
example:
    LIL R10, D0 ; return_147 = 0BD0
    LIH R10, 0B
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 08 ; cursor_clear = 1208
    LIH R10, 12
    JMP R10
return_147:
    LIL R1, 00
    LIH R1, 00
    LIL R9, 00
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 01
    LIH R1, 00
    LIL R9, 01
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 02
    LIH R1, 00
    LIL R9, 02
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 03
    LIH R1, 00
    LIL R9, 03
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 04
    LIH R1, 00
    LIL R9, 04
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 05
    LIH R1, 00
    LIL R9, 05
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 06
    LIH R1, 00
    LIL R9, 06
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 07
    LIH R1, 00
    LIL R9, 07
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 08
    LIH R1, 00
    LIL R9, 08
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 09
    LIH R1, 00
    LIL R9, 09
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 0A
    LIH R1, 00
    LIL R9, 0A
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 0B
    LIH R1, 00
    LIL R9, 0B
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 0C
    LIH R1, 00
    LIL R9, 0C
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 0D
    LIH R1, 00
    LIL R9, 0D
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 0E
    LIH R1, 00
    LIL R9, 0E
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 0F
    LIH R1, 00
    LIL R9, 0F
    LIH R9, 31
    STORE [R9], R1
    LIL R9, 00
    LIH R9, 30
    LOAD R1, [R9]
    CMP R1, R0
    LIL R10, 7A ; example_plain = 0C7A
    LIH R10, 0C
    BEQ R10
    LIL R1, 69
    LIH R1, 00
    LIL R9, 20
    LIH R9, 31
    STORE [R9], R1
    LIL R1, C4
    LIH R1, 00
    LIL R9, 21
    LIH R9, 31
    STORE [R9], R1
    LIL R1, E0
    LIH R1, 00
    LIL R9, 22
    LIH R9, 31
    STORE [R9], R1
    LIL R1, D8
    LIH R1, 00
    LIL R9, 23
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 6A
    LIH R1, 00
    LIL R9, 24
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 7B
    LIH R1, 00
    LIL R9, 25
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 04
    LIH R1, 00
    LIL R9, 26
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 30
    LIH R1, 00
    LIL R9, 27
    LIH R9, 31
    STORE [R9], R1
    LIL R1, D8
    LIH R1, 00
    LIL R9, 28
    LIH R9, 31
    STORE [R9], R1
    LIL R1, CD
    LIH R1, 00
    LIL R9, 29
    LIH R9, 31
    STORE [R9], R1
    LIL R1, B7
    LIH R1, 00
    LIL R9, 2A
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 80
    LIH R1, 00
    LIL R9, 2B
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 70
    LIH R1, 00
    LIL R9, 2C
    LIH R9, 31
    STORE [R9], R1
    LIL R1, B4
    LIH R1, 00
    LIL R9, 2D
    LIH R9, 31
    STORE [R9], R1
    LIL R1, C5
    LIH R1, 00
    LIL R9, 2E
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 5A
    LIH R1, 00
    LIL R9, 2F
    LIH R9, 31
    STORE [R9], R1
    LIL R10, CA ; example_ready = 0CCA
    LIH R10, 0C
    JMP R10
example_plain:
    LIL R1, 00
    LIH R1, 00
    LIL R9, 20
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 11
    LIH R1, 00
    LIL R9, 21
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 22
    LIH R1, 00
    LIL R9, 22
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 33
    LIH R1, 00
    LIL R9, 23
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 44
    LIH R1, 00
    LIL R9, 24
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 55
    LIH R1, 00
    LIL R9, 25
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 66
    LIH R1, 00
    LIL R9, 26
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 77
    LIH R1, 00
    LIL R9, 27
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 88
    LIH R1, 00
    LIL R9, 28
    LIH R9, 31
    STORE [R9], R1
    LIL R1, 99
    LIH R1, 00
    LIL R9, 29
    LIH R9, 31
    STORE [R9], R1
    LIL R1, AA
    LIH R1, 00
    LIL R9, 2A
    LIH R9, 31
    STORE [R9], R1
    LIL R1, BB
    LIH R1, 00
    LIL R9, 2B
    LIH R9, 31
    STORE [R9], R1
    LIL R1, CC
    LIH R1, 00
    LIL R9, 2C
    LIH R9, 31
    STORE [R9], R1
    LIL R1, DD
    LIH R1, 00
    LIL R9, 2D
    LIH R9, 31
    STORE [R9], R1
    LIL R1, EE
    LIH R1, 00
    LIL R9, 2E
    LIH R9, 31
    STORE [R9], R1
    LIL R1, FF
    LIH R1, 00
    LIL R9, 2F
    LIH R9, 31
    STORE [R9], R1
example_ready:
    LIL R1, 00
    LIH R1, 31
    LIL R2, 08
    LIH R2, 0D
    LIL R3, 00
    LIH R3, 3F
    LIL R10, D9 ; return_148 = 0CD9
    LIH R10, 0C
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 52 ; draw_hex = 1152
    LIH R10, 11
    JMP R10
return_148:
    LIL R1, 20
    LIH R1, 31
    LIL R2, 08
    LIH R2, 18
    LIL R3, 00
    LIH R3, 3F
    LIL R10, E8 ; return_149 = 0CE8
    LIH R10, 0C
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 52 ; draw_hex = 1152
    LIH R10, 11
    JMP R10
return_149:
    LIL R10, F1 ; return_150 = 0CF1
    LIH R10, 0C
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 32 ; key_expand = 0D32
    LIH R10, 0D
    JMP R10
return_150:
    LIL R10, FA ; return_151 = 0CFA
    LIH R10, 0C
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, D5 ; run_crypto = 14D5
    LIH R10, 14
    JMP R10
return_151:
    LIL R10, 02 ; poll = 0A02
    LIH R10, 0A
    JMP R10
copy16:
    ADD R8, R1, R0
    ADD R6, R2, R0
    LIL R5, 10
    LIH R5, 00
    LIL R4, 01
    LIH R4, 00
copy_loop:
    LOAD R1, [R8]
    STORE [R6], R1
    ADD R8, R8, R4
    ADD R6, R6, R4
    SUB R5, R5, R4
    CMP R5, R0
    LIL R10, 0F ; copy_done = 0D0F
    LIH R10, 0D
    BEQ R10
    LIL R10, 03 ; copy_loop = 0D03
    LIH R10, 0D
    JMP R10
copy_done:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
pack16:
    ADD R8, R1, R0
    ADD R6, R2, R0
    LIL R5, 10
    LIH R5, 00
    LIL R4, 01
    LIH R4, 00
pack_loop:
    LOAD R1, [R8]
    ADD R8, R8, R4
    LOAD R2, [R8]
    SLL R1, R1
    SLL R1, R1
    SLL R1, R1
    SLL R1, R1
    ADD R3, R1, R2
    STORE [R6], R3
    ADD R8, R8, R4
    ADD R6, R6, R4
    SUB R5, R5, R4
    CMP R5, R0
    LIL R10, 2D ; pack_done = 0D2D
    LIH R10, 0D
    BEQ R10
    LIL R10, 1A ; pack_loop = 0D1A
    LIH R10, 0D
    JMP R10
pack_done:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
key_expand:
    LIL R1, 00
    LIH R1, 31
    LIL R2, 00
    LIH R2, 35
    LIL R10, 3F ; return_152 = 0D3F
    LIH R10, 0D
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, FD ; copy16 = 0CFD
    LIH R10, 0C
    JMP R10
return_152:
    LIL R1, 00
    LIH R1, 35
    LIL R9, 20
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 01
    LIH R1, 00
    LIL R9, 21
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 01
    LIH R1, 00
    LIL R9, 22
    LIH R9, 30
    STORE [R9], R1
key_round:
    LIL R9, 20
    LIH R9, 30
    LOAD R8, [R9]
    LIL R6, 10
    LIH R6, 00
    ADD R6, R8, R6
    LIL R9, 0D
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R2, 00
    LIH R2, 40
    ADD R2, R1, R2
    LOAD R2, [R2]
    LIL R9, 00
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 22
    LIH R9, 30
    LOAD R2, [R9]
    NAND R7, R3, R2
    NAND R9, R3, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 00
    LIH R9, 00
    ADD R9, R6, R9
    STORE [R9], R3
    LIL R9, 0E
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R2, 00
    LIH R2, 40
    ADD R2, R1, R2
    LOAD R2, [R2]
    LIL R9, 01
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 01
    LIH R9, 00
    ADD R9, R6, R9
    STORE [R9], R3
    LIL R9, 0F
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R2, 00
    LIH R2, 40
    ADD R2, R1, R2
    LOAD R2, [R2]
    LIL R9, 02
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 02
    LIH R9, 00
    ADD R9, R6, R9
    STORE [R9], R3
    LIL R9, 0C
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R2, 00
    LIH R2, 40
    ADD R2, R1, R2
    LOAD R2, [R2]
    LIL R9, 03
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 03
    LIH R9, 00
    ADD R9, R6, R9
    STORE [R9], R3
    LIL R9, 04
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R9, 00
    LIH R9, 00
    ADD R9, R6, R9
    LOAD R2, [R9]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 04
    LIH R9, 00
    ADD R9, R6, R9
    STORE [R9], R3
    LIL R9, 05
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R9, 01
    LIH R9, 00
    ADD R9, R6, R9
    LOAD R2, [R9]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 05
    LIH R9, 00
    ADD R9, R6, R9
    STORE [R9], R3
    LIL R9, 06
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R9, 02
    LIH R9, 00
    ADD R9, R6, R9
    LOAD R2, [R9]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 06
    LIH R9, 00
    ADD R9, R6, R9
    STORE [R9], R3
    LIL R9, 07
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R9, 03
    LIH R9, 00
    ADD R9, R6, R9
    LOAD R2, [R9]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 07
    LIH R9, 00
    ADD R9, R6, R9
    STORE [R9], R3
    LIL R9, 08
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R9, 04
    LIH R9, 00
    ADD R9, R6, R9
    LOAD R2, [R9]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 08
    LIH R9, 00
    ADD R9, R6, R9
    STORE [R9], R3
    LIL R9, 09
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R9, 05
    LIH R9, 00
    ADD R9, R6, R9
    LOAD R2, [R9]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 09
    LIH R9, 00
    ADD R9, R6, R9
    STORE [R9], R3
    LIL R9, 0A
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R9, 06
    LIH R9, 00
    ADD R9, R6, R9
    LOAD R2, [R9]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 0A
    LIH R9, 00
    ADD R9, R6, R9
    STORE [R9], R3
    LIL R9, 0B
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R9, 07
    LIH R9, 00
    ADD R9, R6, R9
    LOAD R2, [R9]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 0B
    LIH R9, 00
    ADD R9, R6, R9
    STORE [R9], R3
    LIL R9, 0C
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R9, 08
    LIH R9, 00
    ADD R9, R6, R9
    LOAD R2, [R9]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 0C
    LIH R9, 00
    ADD R9, R6, R9
    STORE [R9], R3
    LIL R9, 0D
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R9, 09
    LIH R9, 00
    ADD R9, R6, R9
    LOAD R2, [R9]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 0D
    LIH R9, 00
    ADD R9, R6, R9
    STORE [R9], R3
    LIL R9, 0E
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R9, 0A
    LIH R9, 00
    ADD R9, R6, R9
    LOAD R2, [R9]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 0E
    LIH R9, 00
    ADD R9, R6, R9
    STORE [R9], R3
    LIL R9, 0F
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R9, 0B
    LIH R9, 00
    ADD R9, R6, R9
    LOAD R2, [R9]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    LIL R9, 0F
    LIH R9, 00
    ADD R9, R6, R9
    STORE [R9], R3
    LIL R9, 20
    LIH R9, 30
    STORE [R9], R6
    LIL R9, 22
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 00
    LIH R2, 42
    ADD R1, R1, R2
    LOAD R1, [R1]
    LIL R9, 22
    LIH R9, 30
    STORE [R9], R1
    LIL R9, 21
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 01
    LIH R2, 00
    ADD R1, R1, R2
    LIL R9, 21
    LIH R9, 30
    STORE [R9], R1
    LIL R2, 0B
    LIH R2, 00
    CMP R1, R2
    LIL R10, 4E ; key_round = 0D4E
    LIH R10, 0D
    BLT R10
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
add_round_key:
    LIL R8, 00
    LIH R8, 34
    LIL R9, 24
    LIH R9, 30
    LOAD R6, [R9]
    LIL R4, 10
    LIH R4, 34
    LIL R5, 01
    LIH R5, 00
add_key_loop:
    LOAD R1, [R8]
    LOAD R2, [R6]
    NAND R7, R1, R2
    NAND R9, R1, R7
    NAND R3, R2, R7
    NAND R3, R9, R3
    STORE [R8], R3
    ADD R8, R8, R5
    ADD R6, R6, R5
    CMP R8, R4
    LIL R10, 95 ; add_key_loop = 0E95
    LIH R10, 0E
    BLT R10
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
sub_enc:
    LIL R8, 00
    LIH R8, 34
    LIL R6, 00
    LIH R6, 40
    LIL R7, 10
    LIH R7, 34
    LIL R5, 01
    LIH R5, 00
sub_loop_enc:
    LOAD R1, [R8]
    ADD R2, R1, R6
    LOAD R1, [R2]
    STORE [R8], R1
    ADD R8, R8, R5
    CMP R8, R7
    LIL R10, AF ; sub_loop_enc = 0EAF
    LIH R10, 0E
    BLT R10
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
shift_enc:
    LIL R9, 01
    LIH R9, 34
    LOAD R1, [R9]
    LIL R9, 05
    LIH R9, 34
    LOAD R2, [R9]
    LIL R9, 09
    LIH R9, 34
    LOAD R3, [R9]
    LIL R9, 0D
    LIH R9, 34
    LOAD R4, [R9]
    LIL R9, 01
    LIH R9, 34
    STORE [R9], R2
    LIL R9, 05
    LIH R9, 34
    STORE [R9], R3
    LIL R9, 09
    LIH R9, 34
    STORE [R9], R4
    LIL R9, 0D
    LIH R9, 34
    STORE [R9], R1
    LIL R9, 02
    LIH R9, 34
    LOAD R1, [R9]
    LIL R9, 06
    LIH R9, 34
    LOAD R2, [R9]
    LIL R9, 0A
    LIH R9, 34
    LOAD R3, [R9]
    LIL R9, 0E
    LIH R9, 34
    LOAD R4, [R9]
    LIL R9, 02
    LIH R9, 34
    STORE [R9], R3
    LIL R9, 06
    LIH R9, 34
    STORE [R9], R4
    LIL R9, 0A
    LIH R9, 34
    STORE [R9], R1
    LIL R9, 0E
    LIH R9, 34
    STORE [R9], R2
    LIL R9, 03
    LIH R9, 34
    LOAD R1, [R9]
    LIL R9, 07
    LIH R9, 34
    LOAD R2, [R9]
    LIL R9, 0B
    LIH R9, 34
    LOAD R3, [R9]
    LIL R9, 0F
    LIH R9, 34
    LOAD R4, [R9]
    LIL R9, 03
    LIH R9, 34
    STORE [R9], R4
    LIL R9, 07
    LIH R9, 34
    STORE [R9], R1
    LIL R9, 0B
    LIH R9, 34
    STORE [R9], R2
    LIL R9, 0F
    LIH R9, 34
    STORE [R9], R3
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
sub_dec:
    LIL R8, 00
    LIH R8, 34
    LIL R6, 00
    LIH R6, 41
    LIL R7, 10
    LIH R7, 34
    LIL R5, 01
    LIH R5, 00
sub_loop_dec:
    LOAD R1, [R8]
    ADD R2, R1, R6
    LOAD R1, [R2]
    STORE [R8], R1
    ADD R8, R8, R5
    CMP R8, R7
    LIL R10, 12 ; sub_loop_dec = 0F12
    LIH R10, 0F
    BLT R10
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
shift_dec:
    LIL R9, 01
    LIH R9, 34
    LOAD R1, [R9]
    LIL R9, 05
    LIH R9, 34
    LOAD R2, [R9]
    LIL R9, 09
    LIH R9, 34
    LOAD R3, [R9]
    LIL R9, 0D
    LIH R9, 34
    LOAD R4, [R9]
    LIL R9, 01
    LIH R9, 34
    STORE [R9], R4
    LIL R9, 05
    LIH R9, 34
    STORE [R9], R1
    LIL R9, 09
    LIH R9, 34
    STORE [R9], R2
    LIL R9, 0D
    LIH R9, 34
    STORE [R9], R3
    LIL R9, 02
    LIH R9, 34
    LOAD R1, [R9]
    LIL R9, 06
    LIH R9, 34
    LOAD R2, [R9]
    LIL R9, 0A
    LIH R9, 34
    LOAD R3, [R9]
    LIL R9, 0E
    LIH R9, 34
    LOAD R4, [R9]
    LIL R9, 02
    LIH R9, 34
    STORE [R9], R3
    LIL R9, 06
    LIH R9, 34
    STORE [R9], R4
    LIL R9, 0A
    LIH R9, 34
    STORE [R9], R1
    LIL R9, 0E
    LIH R9, 34
    STORE [R9], R2
    LIL R9, 03
    LIH R9, 34
    LOAD R1, [R9]
    LIL R9, 07
    LIH R9, 34
    LOAD R2, [R9]
    LIL R9, 0B
    LIH R9, 34
    LOAD R3, [R9]
    LIL R9, 0F
    LIH R9, 34
    LOAD R4, [R9]
    LIL R9, 03
    LIH R9, 34
    STORE [R9], R2
    LIL R9, 07
    LIH R9, 34
    STORE [R9], R3
    LIL R9, 0B
    LIH R9, 34
    STORE [R9], R4
    LIL R9, 0F
    LIH R9, 34
    STORE [R9], R1
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
mix_enc:
    LIL R8, 00
    LIH R8, 34
mix_loop_enc:
    LIL R9, 00
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R9, 01
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R2, [R9]
    LIL R9, 02
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R3, [R9]
    LIL R9, 03
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R4, [R9]
    LIL R5, 00
    LIH R5, 42
    ADD R5, R5, R1
    LOAD R5, [R5]
    ADD R6, R5, R0
    LIL R5, 00
    LIH R5, 43
    ADD R5, R5, R2
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    ADD R5, R3, R0
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    ADD R5, R4, R0
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R9, 00
    LIH R9, 00
    ADD R9, R8, R9
    STORE [R9], R6
    ADD R5, R1, R0
    ADD R6, R5, R0
    LIL R5, 00
    LIH R5, 42
    ADD R5, R5, R2
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R5, 00
    LIH R5, 43
    ADD R5, R5, R3
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    ADD R5, R4, R0
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R9, 01
    LIH R9, 00
    ADD R9, R8, R9
    STORE [R9], R6
    ADD R5, R1, R0
    ADD R6, R5, R0
    ADD R5, R2, R0
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R5, 00
    LIH R5, 42
    ADD R5, R5, R3
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R5, 00
    LIH R5, 43
    ADD R5, R5, R4
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R9, 02
    LIH R9, 00
    ADD R9, R8, R9
    STORE [R9], R6
    LIL R5, 00
    LIH R5, 43
    ADD R5, R5, R1
    LOAD R5, [R5]
    ADD R6, R5, R0
    ADD R5, R2, R0
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    ADD R5, R3, R0
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R5, 00
    LIH R5, 42
    ADD R5, R5, R4
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R9, 03
    LIH R9, 00
    ADD R9, R8, R9
    STORE [R9], R6
    LIL R5, 04
    LIH R5, 00
    ADD R8, R8, R5
    LIL R5, 10
    LIH R5, 34
    CMP R8, R5
    LIL R10, 6F ; mix_loop_enc = 0F6F
    LIH R10, 0F
    BLT R10
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
mix_dec:
    LIL R8, 00
    LIH R8, 34
mix_loop_dec:
    LIL R9, 00
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R1, [R9]
    LIL R9, 01
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R2, [R9]
    LIL R9, 02
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R3, [R9]
    LIL R9, 03
    LIH R9, 00
    ADD R9, R8, R9
    LOAD R4, [R9]
    LIL R5, 00
    LIH R5, 47
    ADD R5, R5, R1
    LOAD R5, [R5]
    ADD R6, R5, R0
    LIL R5, 00
    LIH R5, 45
    ADD R5, R5, R2
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R5, 00
    LIH R5, 46
    ADD R5, R5, R3
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R5, 00
    LIH R5, 44
    ADD R5, R5, R4
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R9, 00
    LIH R9, 00
    ADD R9, R8, R9
    STORE [R9], R6
    LIL R5, 00
    LIH R5, 44
    ADD R5, R5, R1
    LOAD R5, [R5]
    ADD R6, R5, R0
    LIL R5, 00
    LIH R5, 47
    ADD R5, R5, R2
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R5, 00
    LIH R5, 45
    ADD R5, R5, R3
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R5, 00
    LIH R5, 46
    ADD R5, R5, R4
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R9, 01
    LIH R9, 00
    ADD R9, R8, R9
    STORE [R9], R6
    LIL R5, 00
    LIH R5, 46
    ADD R5, R5, R1
    LOAD R5, [R5]
    ADD R6, R5, R0
    LIL R5, 00
    LIH R5, 44
    ADD R5, R5, R2
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R5, 00
    LIH R5, 47
    ADD R5, R5, R3
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R5, 00
    LIH R5, 45
    ADD R5, R5, R4
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R9, 02
    LIH R9, 00
    ADD R9, R8, R9
    STORE [R9], R6
    LIL R5, 00
    LIH R5, 45
    ADD R5, R5, R1
    LOAD R5, [R5]
    ADD R6, R5, R0
    LIL R5, 00
    LIH R5, 46
    ADD R5, R5, R2
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R5, 00
    LIH R5, 44
    ADD R5, R5, R3
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R5, 00
    LIH R5, 47
    ADD R5, R5, R4
    LOAD R5, [R5]
    NAND R7, R6, R5
    NAND R9, R6, R7
    NAND R6, R5, R7
    NAND R6, R9, R6
    LIL R9, 03
    LIH R9, 00
    ADD R9, R8, R9
    STORE [R9], R6
    LIL R5, 04
    LIH R5, 00
    ADD R8, R8, R5
    LIL R5, 10
    LIH R5, 34
    CMP R8, R5
    LIL R10, FB ; mix_loop_dec = 0FFB
    LIH R10, 0F
    BLT R10
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
encrypt:
    LIL R1, 00
    LIH R1, 35
    LIL R9, 24
    LIH R9, 30
    STORE [R9], R1
    LIL R10, AB ; return_153 = 10AB
    LIH R10, 10
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 8C ; add_round_key = 0E8C
    LIH R10, 0E
    JMP R10
return_153:
    LIL R1, 01
    LIH R1, 00
    LIL R9, 23
    LIH R9, 30
    STORE [R9], R1
enc_round:
    LIL R10, B9 ; return_154 = 10B9
    LIH R10, 10
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, A7 ; sub_enc = 0EA7
    LIH R10, 0E
    JMP R10
return_154:
    LIL R10, C2 ; return_155 = 10C2
    LIH R10, 10
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, BD ; shift_enc = 0EBD
    LIH R10, 0E
    JMP R10
return_155:
    LIL R9, 23
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 0A
    LIH R2, 00
    CMP R1, R2
    LIL R10, D4 ; enc_no_mix = 10D4
    LIH R10, 10
    BEQ R10
    LIL R10, D4 ; return_156 = 10D4
    LIH R10, 10
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 6D ; mix_enc = 0F6D
    LIH R10, 0F
    JMP R10
return_156:
enc_no_mix:
    LIL R9, 24
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 10
    LIH R2, 00
    ADD R1, R1, R2
    LIL R9, 24
    LIH R9, 30
    STORE [R9], R1
    LIL R10, E6 ; return_157 = 10E6
    LIH R10, 10
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 8C ; add_round_key = 0E8C
    LIH R10, 0E
    JMP R10
return_157:
    LIL R9, 23
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 01
    LIH R2, 00
    ADD R1, R1, R2
    LIL R9, 23
    LIH R9, 30
    STORE [R9], R1
    LIL R2, 0B
    LIH R2, 00
    CMP R1, R2
    LIL R10, B0 ; enc_round = 10B0
    LIH R10, 10
    BLT R10
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
decrypt:
    LIL R1, A0
    LIH R1, 35
    LIL R9, 24
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 08 ; return_158 = 1108
    LIH R10, 11
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 8C ; add_round_key = 0E8C
    LIH R10, 0E
    JMP R10
return_158:
    LIL R1, 09
    LIH R1, 00
    LIL R9, 23
    LIH R9, 30
    STORE [R9], R1
dec_round:
    LIL R10, 16 ; return_159 = 1116
    LIH R10, 11
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 20 ; shift_dec = 0F20
    LIH R10, 0F
    JMP R10
return_159:
    LIL R10, 1F ; return_160 = 111F
    LIH R10, 11
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 0A ; sub_dec = 0F0A
    LIH R10, 0F
    JMP R10
return_160:
    LIL R9, 24
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 10
    LIH R2, 00
    SUB R1, R1, R2
    LIL R9, 24
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 31 ; return_161 = 1131
    LIH R10, 11
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 8C ; add_round_key = 0E8C
    LIH R10, 0E
    JMP R10
return_161:
    LIL R9, 23
    LIH R9, 30
    LOAD R1, [R9]
    CMP R1, R0
    LIL R10, 4D ; dec_done = 114D
    LIH R10, 11
    BEQ R10
    LIL R10, 41 ; return_162 = 1141
    LIH R10, 11
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, F9 ; mix_dec = 0FF9
    LIH R10, 0F
    JMP R10
return_162:
    LIL R9, 23
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 01
    LIH R2, 00
    SUB R1, R1, R2
    LIL R9, 23
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 0D ; dec_round = 110D
    LIH R10, 11
    JMP R10
dec_done:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
draw_hex:
    LIL R9, 28
    LIH R9, 30
    STORE [R9], R1
    LIL R1, 10
    LIH R1, 00
    LIL R9, 29
    LIH R9, 30
    STORE [R9], R1
hex_byte:
    LIL R9, 28
    LIH R9, 30
    LOAD R4, [R9]
    LOAD R1, [R4]
    LIL R9, 2A
    LIH R9, 30
    STORE [R9], R1
    SRL R1, R1
    SRL R1, R1
    SRL R1, R1
    SRL R1, R1
    LIL R4, 0A
    LIH R4, 00
    CMP R1, R4
    LIL R10, 71 ; nibble_number_163 = 1171
    LIH R10, 11
    BLT R10
    LIL R4, 37
    LIH R4, 00
    ADD R1, R1, R4
    LIL R10, 74 ; nibble_ascii_164 = 1174
    LIH R10, 11
    JMP R10
nibble_number_163:
    LIL R4, 30
    LIH R4, 00
    ADD R1, R1, R4
nibble_ascii_164:
    LIL R10, 7D ; return_165 = 117D
    LIH R10, 11
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_165:
    LIL R9, 2A
    LIH R9, 30
    LOAD R1, [R9]
    LIL R4, 0F
    LIH R4, 00
    NAND R1, R1, R4
    NAND R1, R1, R1
    LIL R4, 0A
    LIH R4, 00
    CMP R1, R4
    LIL R10, 90 ; nibble_number_166 = 1190
    LIH R10, 11
    BLT R10
    LIL R4, 37
    LIH R4, 00
    ADD R1, R1, R4
    LIL R10, 93 ; nibble_ascii_167 = 1193
    LIH R10, 11
    JMP R10
nibble_number_166:
    LIL R4, 30
    LIH R4, 00
    ADD R1, R1, R4
nibble_ascii_167:
    LIL R10, 9C ; return_168 = 119C
    LIH R10, 11
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_168:
    LIL R9, 28
    LIH R9, 30
    LOAD R1, [R9]
    LIL R4, 01
    LIH R4, 00
    ADD R1, R1, R4
    LIL R9, 28
    LIH R9, 30
    STORE [R9], R1
    LIL R9, 29
    LIH R9, 30
    LOAD R1, [R9]
    SUB R1, R1, R4
    LIL R9, 29
    LIH R9, 30
    STORE [R9], R1
    CMP R1, R0
    LIL R10, BF ; hex_done = 11BF
    LIH R10, 11
    BEQ R10
    LIL R4, 08
    LIH R4, 00
    CMP R1, R4
    LIL R10, B9 ; hex_second_row = 11B9
    LIH R10, 11
    BEQ R10
    LIL R10, 5A ; hex_byte = 115A
    LIH R10, 11
    JMP R10
hex_second_row:
    LIL R4, 20
    LIH R4, 03
    ADD R2, R2, R4
    LIL R10, 5A ; hex_byte = 115A
    LIH R10, 11
    JMP R10
hex_done:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
input_address:
    LIL R4, 00
    LIH R4, 00
    LIL R3, 10
    LIH R3, 00
    CMP R1, R3
    LIL R10, CF ; address_first_row = 11CF
    LIH R10, 11
    BLT R10
    SUB R1, R1, R3
    LIL R4, 80
    LIH R4, 03
address_first_row:
    SLL R2, R1
    SLL R1, R2
    ADD R2, R2, R1
    ADD R2, R2, R4
    LIL R9, 01
    LIH R9, 30
    LOAD R1, [R9]
    LIL R3, 01
    LIH R3, 00
    CMP R1, R3
    LIL R10, E1 ; address_key = 11E1
    LIH R10, 11
    BEQ R10
    LIL R3, 08
    LIH R3, 18
    LIL R10, E3 ; address_finish = 11E3
    LIH R10, 11
    JMP R10
address_key:
    LIL R3, 08
    LIH R3, 0D
address_finish:
    ADD R2, R2, R3
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
edit_echo:
    LIL R9, 07
    LIH R9, 30
    LOAD R1, [R9]
    LIL R10, F5 ; return_169 = 11F5
    LIH R10, 11
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, C4 ; input_address = 11C4
    LIH R10, 11
    JMP R10
return_169:
    LIL R9, 08
    LIH R9, 30
    LOAD R1, [R9]
    LIL R3, 00
    LIH R3, 3F
    LIL R10, 03 ; return_170 = 1203
    LIH R10, 12
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_170:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
cursor_clear:
    LIL R9, 09
    LIH R9, 30
    LOAD R1, [R9]
    CMP R1, R0
    LIL R10, 21 ; cursor_clear_done = 1221
    LIH R10, 12
    BEQ R10
    LIL R2, 05
    LIH R2, 00
    LIL R3, 01
    LIH R3, 00
    LIL R4, 00
    LIH R4, 00
    LIL R10, 1E ; return_171 = 121E
    LIH R10, 12
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 8B ; fill_rect = 158B
    LIH R10, 15
    JMP R10
return_171:
    LIL R9, 09
    LIH R9, 30
    STORE [R9], R0
cursor_clear_done:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
cursor_update:
    LIL R10, 2F ; return_172 = 122F
    LIH R10, 12
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 08 ; cursor_clear = 1208
    LIH R10, 12
    JMP R10
return_172:
    LIL R9, 02
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 20
    LIH R2, 00
    CMP R1, R2
    LIL R10, 3D ; cursor_draw = 123D
    LIH R10, 12
    BLT R10
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
cursor_draw:
    LIL R10, 46 ; return_173 = 1246
    LIH R10, 12
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, C4 ; input_address = 11C4
    LIH R10, 11
    JMP R10
return_173:
    LIL R1, 80
    LIH R1, 02
    ADD R1, R2, R1
    LIL R9, 09
    LIH R9, 30
    STORE [R9], R1
    LIL R2, 05
    LIH R2, 00
    LIL R3, 01
    LIH R3, 00
    LIL R4, 00
    LIH R4, 36
    LIL R10, 5B ; return_174 = 125B
    LIH R10, 12
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 8B ; fill_rect = 158B
    LIH R10, 15
    JMP R10
return_174:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
status:
    LIL R1, 88
    LIH R1, 2A
    LIL R2, 72
    LIH R2, 00
    LIL R3, 05
    LIH R3, 00
    LIL R4, 00
    LIH R4, 00
    LIL R10, 71 ; return_175 = 1271
    LIH R10, 12
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 8B ; fill_rect = 158B
    LIH R10, 15
    JMP R10
return_175:
    LIL R9, 01
    LIH R9, 30
    LOAD R1, [R9]
    LIL R2, 00
    LIH R2, 00
    CMP R1, R2
    LIL R10, 65 ; status_mode = 1365
    LIH R10, 13
    BEQ R10
    LIL R2, 01
    LIH R2, 00
    CMP R1, R2
    LIL R10, E7 ; status_key = 13E7
    LIH R10, 13
    BEQ R10
    LIL R2, 02
    LIH R2, 00
    CMP R1, R2
    LIL R10, 53 ; status_block = 1453
    LIH R10, 14
    BEQ R10
    LIL R9, 00
    LIH R9, 30
    LOAD R1, [R9]
    CMP R1, R0
    LIL R10, F9 ; status_encrypted = 12F9
    LIH R10, 12
    BEQ R10
    LIL R2, 88
    LIH R2, 2A
    LIL R3, 00
    LIH R3, 12
    LIL R1, 44
    LIH R1, 00
    LIL R10, 9C ; return_176 = 129C
    LIH R10, 12
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_176:
    LIL R1, 45
    LIH R1, 00
    LIL R10, A7 ; return_177 = 12A7
    LIH R10, 12
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_177:
    LIL R1, 43
    LIH R1, 00
    LIL R10, B2 ; return_178 = 12B2
    LIH R10, 12
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_178:
    LIL R1, 52
    LIH R1, 00
    LIL R10, BD ; return_179 = 12BD
    LIH R10, 12
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_179:
    LIL R1, 59
    LIH R1, 00
    LIL R10, C8 ; return_180 = 12C8
    LIH R10, 12
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_180:
    LIL R1, 50
    LIH R1, 00
    LIL R10, D3 ; return_181 = 12D3
    LIH R10, 12
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_181:
    LIL R1, 54
    LIH R1, 00
    LIL R10, DE ; return_182 = 12DE
    LIH R10, 12
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_182:
    LIL R1, 45
    LIH R1, 00
    LIL R10, E9 ; return_183 = 12E9
    LIH R10, 12
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_183:
    LIL R1, 44
    LIH R1, 00
    LIL R10, F4 ; return_184 = 12F4
    LIH R10, 12
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_184:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
status_encrypted:
    LIL R2, 88
    LIH R2, 2A
    LIL R3, 00
    LIH R3, 12
    LIL R1, 45
    LIH R1, 00
    LIL R10, 08 ; return_185 = 1308
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_185:
    LIL R1, 4E
    LIH R1, 00
    LIL R10, 13 ; return_186 = 1313
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_186:
    LIL R1, 43
    LIH R1, 00
    LIL R10, 1E ; return_187 = 131E
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_187:
    LIL R1, 52
    LIH R1, 00
    LIL R10, 29 ; return_188 = 1329
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_188:
    LIL R1, 59
    LIH R1, 00
    LIL R10, 34 ; return_189 = 1334
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_189:
    LIL R1, 50
    LIH R1, 00
    LIL R10, 3F ; return_190 = 133F
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_190:
    LIL R1, 54
    LIH R1, 00
    LIL R10, 4A ; return_191 = 134A
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_191:
    LIL R1, 45
    LIH R1, 00
    LIL R10, 55 ; return_192 = 1355
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_192:
    LIL R1, 44
    LIH R1, 00
    LIL R10, 60 ; return_193 = 1360
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_193:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
status_mode:
    LIL R2, 88
    LIH R2, 2A
    LIL R3, 00
    LIH R3, 1B
    LIL R1, 53
    LIH R1, 00
    LIL R10, 74 ; return_194 = 1374
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_194:
    LIL R1, 45
    LIH R1, 00
    LIL R10, 7F ; return_195 = 137F
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_195:
    LIL R1, 4C
    LIH R1, 00
    LIL R10, 8A ; return_196 = 138A
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_196:
    LIL R1, 45
    LIH R1, 00
    LIL R10, 95 ; return_197 = 1395
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_197:
    LIL R1, 43
    LIH R1, 00
    LIL R10, A0 ; return_198 = 13A0
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_198:
    LIL R1, 54
    LIH R1, 00
    LIL R10, AB ; return_199 = 13AB
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_199:
    LIL R1, 20
    LIH R1, 00
    LIL R10, B6 ; return_200 = 13B6
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_200:
    LIL R1, 4D
    LIH R1, 00
    LIL R10, C1 ; return_201 = 13C1
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_201:
    LIL R1, 4F
    LIH R1, 00
    LIL R10, CC ; return_202 = 13CC
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_202:
    LIL R1, 44
    LIH R1, 00
    LIL R10, D7 ; return_203 = 13D7
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_203:
    LIL R1, 45
    LIH R1, 00
    LIL R10, E2 ; return_204 = 13E2
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_204:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
status_key:
    LIL R2, 88
    LIH R2, 2A
    LIL R3, 00
    LIH R3, 1B
    LIL R1, 45
    LIH R1, 00
    LIL R10, F6 ; return_205 = 13F6
    LIH R10, 13
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_205:
    LIL R1, 4E
    LIH R1, 00
    LIL R10, 01 ; return_206 = 1401
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_206:
    LIL R1, 54
    LIH R1, 00
    LIL R10, 0C ; return_207 = 140C
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_207:
    LIL R1, 45
    LIH R1, 00
    LIL R10, 17 ; return_208 = 1417
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_208:
    LIL R1, 52
    LIH R1, 00
    LIL R10, 22 ; return_209 = 1422
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_209:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 2D ; return_210 = 142D
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_210:
    LIL R1, 4B
    LIH R1, 00
    LIL R10, 38 ; return_211 = 1438
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_211:
    LIL R1, 45
    LIH R1, 00
    LIL R10, 43 ; return_212 = 1443
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_212:
    LIL R1, 59
    LIH R1, 00
    LIL R10, 4E ; return_213 = 144E
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_213:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
status_block:
    LIL R2, 88
    LIH R2, 2A
    LIL R3, 00
    LIH R3, 1B
    LIL R1, 45
    LIH R1, 00
    LIL R10, 62 ; return_214 = 1462
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_214:
    LIL R1, 4E
    LIH R1, 00
    LIL R10, 6D ; return_215 = 146D
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_215:
    LIL R1, 54
    LIH R1, 00
    LIL R10, 78 ; return_216 = 1478
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_216:
    LIL R1, 45
    LIH R1, 00
    LIL R10, 83 ; return_217 = 1483
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_217:
    LIL R1, 52
    LIH R1, 00
    LIL R10, 8E ; return_218 = 148E
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_218:
    LIL R1, 20
    LIH R1, 00
    LIL R10, 99 ; return_219 = 1499
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_219:
    LIL R1, 42
    LIH R1, 00
    LIL R10, A4 ; return_220 = 14A4
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_220:
    LIL R1, 4C
    LIH R1, 00
    LIL R10, AF ; return_221 = 14AF
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_221:
    LIL R1, 4F
    LIH R1, 00
    LIL R10, BA ; return_222 = 14BA
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_222:
    LIL R1, 43
    LIH R1, 00
    LIL R10, C5 ; return_223 = 14C5
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_223:
    LIL R1, 4B
    LIH R1, 00
    LIL R10, D0 ; return_224 = 14D0
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_224:
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
run_crypto:
    LIL R10, DE ; return_225 = 14DE
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 08 ; cursor_clear = 1208
    LIH R10, 12
    JMP R10
return_225:
    LIL R1, 88
    LIH R1, 2A
    LIL R2, 72
    LIH R2, 00
    LIL R3, 05
    LIH R3, 00
    LIL R4, 00
    LIH R4, 00
    LIL R10, EF ; return_226 = 14EF
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 8B ; fill_rect = 158B
    LIH R10, 15
    JMP R10
return_226:
    LIL R2, 88
    LIH R2, 2A
    LIL R3, 00
    LIH R3, 36
    LIL R1, 57
    LIH R1, 00
    LIL R10, FE ; return_227 = 14FE
    LIH R10, 14
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_227:
    LIL R1, 4F
    LIH R1, 00
    LIL R10, 09 ; return_228 = 1509
    LIH R10, 15
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_228:
    LIL R1, 52
    LIH R1, 00
    LIL R10, 14 ; return_229 = 1514
    LIH R10, 15
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_229:
    LIL R1, 4B
    LIH R1, 00
    LIL R10, 1F ; return_230 = 151F
    LIH R10, 15
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_230:
    LIL R1, 49
    LIH R1, 00
    LIL R10, 2A ; return_231 = 152A
    LIH R10, 15
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_231:
    LIL R1, 4E
    LIH R1, 00
    LIL R10, 35 ; return_232 = 1535
    LIH R10, 15
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_232:
    LIL R1, 47
    LIH R1, 00
    LIL R10, 40 ; return_233 = 1540
    LIH R10, 15
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, AA ; big_char = 15AA
    LIH R10, 15
    JMP R10
return_233:
    LIL R1, 20
    LIH R1, 31
    LIL R2, 00
    LIH R2, 34
    LIL R10, 4D ; return_234 = 154D
    LIH R10, 15
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, FD ; copy16 = 0CFD
    LIH R10, 0C
    JMP R10
return_234:
    LIL R9, 00
    LIH R9, 30
    LOAD R1, [R9]
    CMP R1, R0
    LIL R10, 60 ; run_encrypt = 1560
    LIH R10, 15
    BEQ R10
    LIL R10, 5D ; return_235 = 155D
    LIH R10, 15
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, FA ; decrypt = 10FA
    LIH R10, 10
    JMP R10
return_235:
    LIL R10, 69 ; run_display = 1569
    LIH R10, 15
    JMP R10
run_encrypt:
    LIL R10, 69 ; return_236 = 1569
    LIH R10, 15
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 9D ; encrypt = 109D
    LIH R10, 10
    JMP R10
return_236:
run_display:
    LIL R1, 00
    LIH R1, 34
    LIL R2, 08
    LIH R2, 23
    LIL R3, 00
    LIH R3, 12
    LIL R10, 78 ; return_237 = 1578
    LIH R10, 15
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 52 ; draw_hex = 1152
    LIH R10, 11
    JMP R10
return_237:
    LIL R1, 03
    LIH R1, 00
    LIL R9, 01
    LIH R9, 30
    STORE [R9], R1
    LIL R10, 86 ; return_238 = 1586
    LIH R10, 15
    STORE [R11], R10
    LIL R10, 01
    LIH R10, 00
    ADD R11, R11, R10
    LIL R10, 60 ; status = 1260
    LIH R10, 12
    JMP R10
return_238:
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
    LIL R10, 9C ; fill_next_row = 159C
    LIH R10, 15
    BEQ R10
    LIL R10, 92 ; fill_pixel = 1592
    LIH R10, 15
    JMP R10
fill_next_row:
    ADD R5, R5, R9
    SUB R3, R3, R8
    CMP R3, R0
    LIL R10, A5 ; fill_done = 15A5
    LIH R10, 15
    BEQ R10
    LIL R10, 90 ; fill_row = 1590
    LIH R10, 15
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
    LIL R10, C6 ; char_blank = 15C6
    LIH R10, 15
    BEQ R10
    STORE [R8], R3
    LIL R10, C7 ; char_advance = 15C7
    LIH R10, 15
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
    LIL R10, D3 ; char_row_done = 15D3
    LIH R10, 15
    BEQ R10
    LIL R10, BC ; char_pixel = 15BC
    LIH R10, 15
    JMP R10
char_row_done:
    LIL R9, 7B
    LIH R9, 00
    ADD R8, R8, R9
    LIL R9, 01
    LIH R9, 00
    SUB R6, R6, R9
    CMP R6, R0
    LIL R10, EC ; char_done = 15EC
    LIH R10, 15
    BEQ R10
    LIL R9, 02
    LIH R9, 00
    CMP R6, R9
    LIL R10, E6 ; char_second_word = 15E6
    LIH R10, 15
    BEQ R10
    LIL R10, BA ; char_row = 15BA
    LIH R10, 15
    JMP R10
char_second_word:
    ADD R1, R4, R0
    LIL R5, 00
    LIH R5, 02
    LIL R10, BA ; char_row = 15BA
    LIH R10, 15
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
init_tables:
    LIL R1, 00
    LIH R1, 00
    LIL R3, 01
    LIH R3, 00
    LIL R2, 00
    LIH R2, 40
    LIL R1, 63
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 77
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 30
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 01
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 67
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 76
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 82
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 59
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 47
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 72
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 93
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 26
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 36
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 34
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 71
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 31
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 15
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 04
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 23
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 18
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 96
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 05
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 07
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 12
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 80
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 27
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 75
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 09
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 83
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 52
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 29
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 84
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 53
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 00
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, ED
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 20
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 39
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 58
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 43
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 33
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 85
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 45
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 02
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 50
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 51
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 40
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 92
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 38
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 21
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 10
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 13
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 97
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 44
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 17
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 64
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 19
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 73
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 60
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 81
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 22
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 90
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 88
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 46
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 14
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 32
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 49
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 06
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 24
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 62
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 91
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 95
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 79
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 37
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 56
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 65
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 08
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 78
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 25
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 74
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 70
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 66
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 48
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 03
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 61
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 35
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 57
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 86
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 98
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 11
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 69
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 94
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 87
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 55
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 28
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 89
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 42
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 68
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 41
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 99
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 54
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 16
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R2, 00
    LIH R2, 41
    LIL R1, 52
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 09
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 30
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 36
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 38
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 40
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 81
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 39
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 82
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 87
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 34
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 43
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 44
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 54
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 94
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 32
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 23
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 95
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 42
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 08
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 66
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 28
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 24
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 76
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 49
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 25
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 72
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 64
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 86
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 68
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 98
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 16
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 65
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 92
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 70
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 48
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 50
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, ED
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 15
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 46
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 57
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 84
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 90
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 00
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 58
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 05
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 45
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 06
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 02
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 03
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 01
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 13
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 91
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 11
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 41
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 67
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 97
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 73
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 96
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 74
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 22
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 35
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 85
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 37
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 75
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 47
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 71
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 29
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 89
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 62
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 18
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 56
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 79
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 20
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 78
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 33
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 88
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 07
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 31
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 12
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 10
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 59
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 27
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 80
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 60
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 51
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 19
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 93
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 83
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 53
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 99
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 61
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 17
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 04
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 77
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 26
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 69
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 14
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 63
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 55
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 21
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R2, 00
    LIH R2, 42
    LIL R1, 00
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 02
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 04
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 06
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 08
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 10
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 12
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 14
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 16
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 18
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 20
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 22
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 24
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 26
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 28
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 30
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 32
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 34
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 36
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 38
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 40
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 42
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 44
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 46
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 48
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 50
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 52
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 54
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 56
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 58
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 60
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 62
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 64
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 66
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 68
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 70
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 72
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 74
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 76
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 78
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 80
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 82
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 84
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 86
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 88
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 90
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 92
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 94
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 96
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 98
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 19
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 13
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 11
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 17
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 15
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 09
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 03
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 01
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 07
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 05
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 39
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 33
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 31
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 37
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 35
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 29
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 23
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 21
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 27
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 25
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 59
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 53
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 51
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 57
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 55
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 49
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 43
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 41
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 47
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 45
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 79
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 73
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 71
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 77
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 75
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 69
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 63
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 61
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 67
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 65
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 99
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 93
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 91
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 97
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 95
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 89
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 83
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 81
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 87
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 85
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, ED
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R2, 00
    LIH R2, 43
    LIL R1, 00
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 03
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 06
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 05
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 09
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 18
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 14
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 17
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 12
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 11
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 30
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 33
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 36
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 35
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 39
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 28
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 24
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 27
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 22
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 21
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 60
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 63
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 66
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 65
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 69
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 78
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 74
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 77
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 72
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 71
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 50
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 53
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 56
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 55
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 59
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 48
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 44
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 47
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 42
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 41
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, ED
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 90
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 93
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 96
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 95
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 99
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 88
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 84
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 87
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 82
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 81
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 98
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 97
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 94
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 91
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 92
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 83
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 80
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 85
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 86
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 89
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 58
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 57
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 54
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 51
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 52
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 43
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 40
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 45
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 46
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 49
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 68
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 67
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 64
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 61
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 62
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 73
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 70
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 75
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 76
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 79
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 38
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 37
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 34
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 31
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 32
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 23
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 20
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 25
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 26
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 29
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 08
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 07
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 04
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 01
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 02
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 13
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 10
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 15
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 16
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 19
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R2, 00
    LIH R2, 44
    LIL R1, 00
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 09
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 12
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 24
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 36
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 48
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 41
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 53
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 65
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 77
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 90
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 99
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 82
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 32
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 29
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 20
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 16
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 04
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 73
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 61
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 68
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 57
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 45
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 86
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 94
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 76
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 64
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 52
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 40
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 49
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 37
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 25
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 13
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 08
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 01
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 83
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 98
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 91
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 44
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 56
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 69
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 60
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 72
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 05
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 17
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 21
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 28
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 33
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 95
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 87
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 80
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 89
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 92
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 75
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 67
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 58
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 51
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 43
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 34
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 26
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 10
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 19
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 02
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 96
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 84
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 47
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 55
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 63
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 71
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 78
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 06
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 14
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 22
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 39
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 30
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 93
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 88
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 81
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, ED
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 03
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 18
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 11
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 27
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 35
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 42
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 50
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 59
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 66
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 74
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 85
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 97
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 31
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 38
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 23
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 15
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 07
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 79
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 70
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 62
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 54
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 46
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R2, 00
    LIH R2, 45
    LIL R1, 00
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 16
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 27
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 31
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 58
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 53
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 45
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 74
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 62
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 69
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 97
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 81
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 70
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 66
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 57
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 41
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 23
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 28
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 35
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 04
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 19
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 12
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 93
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 98
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 85
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 82
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 89
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 94
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 46
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 50
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 61
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 77
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 15
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 08
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 03
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 32
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 39
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 24
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 86
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 90
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 36
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 20
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 11
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 07
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 65
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 73
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 78
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 49
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 42
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 54
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 83
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 88
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 95
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 47
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 51
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 60
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 76
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 14
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 09
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 02
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 33
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 38
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 25
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 87
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 91
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 37
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 21
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 10
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 06
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 64
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 72
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 79
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 48
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 43
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 55
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 01
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 17
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 26
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 30
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 59
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 52
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 44
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 75
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 63
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 68
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 96
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 80
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 71
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 67
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 56
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 40
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 22
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 29
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 34
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 05
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 18
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 13
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, ED
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 92
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 99
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 84
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R2, 00
    LIH R2, 46
    LIL R1, 00
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 17
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 34
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 39
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 23
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 68
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 65
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 72
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 51
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 46
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 81
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 96
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 82
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 95
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 98
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 66
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 71
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 52
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 45
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 48
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 03
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 19
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 14
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 37
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 20
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 60
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 77
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 59
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 54
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 43
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 05
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 08
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 12
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 31
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 26
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 89
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 84
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 93
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 87
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 90
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 06
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 11
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 32
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 28
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 25
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 63
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 74
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 79
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 57
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 40
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 86
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 91
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 07
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 10
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 33
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 24
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 29
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 62
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 78
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 75
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 56
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 41
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 61
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 76
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 55
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 58
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 42
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 09
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 04
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 13
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 30
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 27
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 85
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 88
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 92
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, ED
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 83
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 99
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 94
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 67
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 70
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 53
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 49
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 44
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 02
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 15
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 18
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 36
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 21
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 01
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 16
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 38
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 35
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 22
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 64
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 69
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 73
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 50
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 47
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 80
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 97
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R2, 00
    LIH R2, 47
    LIL R1, 00
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 12
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 38
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 36
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 24
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 70
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 62
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 48
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 46
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 54
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 90
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 82
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, ED
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 93
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 81
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 35
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 27
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 29
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 03
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 11
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 45
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 57
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 59
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 73
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 61
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 95
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 89
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 87
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 43
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 51
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 75
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 69
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 67
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 33
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 21
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 05
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 19
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 17
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 76
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 78
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 64
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 40
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 52
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 06
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 08
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 14
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 30
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 22
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 96
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 98
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 84
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 41
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 53
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 79
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 77
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 65
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 31
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 23
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 09
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 07
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 15
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 99
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 97
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 85
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 94
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 86
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 88
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 74
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 66
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 68
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 42
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 50
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 04
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 16
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 18
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 32
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 20
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EC
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E2
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F0
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FE
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, DA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 92
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 80
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A4
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, AA
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B8
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B6
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 02
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 10
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 34
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 3A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 28
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 26
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7C
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 72
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 60
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6E
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 44
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 4A
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 58
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 56
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 37
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 39
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 2B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 25
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 0F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 01
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 13
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 1D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 47
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 49
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 5B
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 55
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 7F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 71
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 63
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 6D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, D9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, CB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, C5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, EF
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, E1
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, F3
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, FD
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A7
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, A9
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, BB
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, B5
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 9F
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 91
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 83
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R1, 8D
    STORE [R2], R1
    ADD R2, R2, R3
    LIL R10, 01
    LIH R10, 00
    SUB R11, R11, R10
    LOAD R10, [R11]
    JMP R10
