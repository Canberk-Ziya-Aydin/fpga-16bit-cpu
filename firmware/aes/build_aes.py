#!/usr/bin/env python3
"""AES-128 encryption/decryption firmware for the existing custom CPU ISA.

Algorithm: NIST FIPS 197-upd1. No AES, XOR or multiply hardware is required.
"""
from pathlib import Path
import json
from cpu_assembler import Demo, common, tile

OUT=Path(__file__).resolve().parent
MODE,PHASE,COUNT=0x3000,0x3001,0x3002
INDEX,ASCII,CURSOR=0x3007,0x3008,0x3009
PREV,KSROUND,RCON,ROUND,RKPTR=0x3020,0x3021,0x3022,0x3023,0x3024
HEX_PTR,HEX_COUNT,HEX_BYTE=0x3028,0x3029,0x302A
KEY,INPUT,KNIB,INIB,STATE,RKEY=0x3100,0x3120,0x3200,0x3220,0x3400,0x3500
SBOX,ISBOX=0x4000,0x4100
MUL={2:0x4200,3:0x4300,9:0x4400,11:0x4500,13:0x4600,14:0x4700}
EXAMPLE_KEY=bytes.fromhex('000102030405060708090A0B0C0D0E0F')
EXAMPLE_PLAIN=bytes.fromhex('00112233445566778899AABBCCDDEEFF')
EXAMPLE_CIPHER=bytes.fromhex('69C4E0D86A7B0430D8CDB78070B4C55A')

def mul(a,b):
    value=0
    for _ in range(8):
        if b&1:value^=a
        a=((a<<1)^ (0x11B if a&0x80 else 0))&255;b>>=1
    return value

def power(a,n):
    value=1
    while n:
        if n&1:value=mul(value,a)
        a=mul(a,a);n>>=1
    return value

def tables():
    box=[]
    for byte in range(256):
        inv=power(byte,254) if byte else 0
        v=inv
        for shift in (1,2,3,4):v^=((inv<<shift)|(inv>>(8-shift)))&255
        box.append(v^0x63)
    inverse=[0]*256
    for i,v in enumerate(box):inverse[v]=i
    assert box[:4]==[0x63,0x7C,0x77,0x7B] and inverse[:4]==[0x52,0x09,0x6A,0xD5]
    return {SBOX:box,ISBOX:inverse,**{base:[mul(x,k) for x in range(256)] for k,base in MUL.items()}}

def xor(p,dst,a,b):
    # R7 and R9 are scratch; all four NANDs are real CPU instructions.
    assert not {dst,a,b}&{7,9}
    p.alu('NAND',7,a,b);p.alu('NAND',9,a,7)
    p.alu('NAND',dst,b,7);p.alu('NAND',dst,9,dst)

def table_initialization(p):
    p.label('init_tables');p.imm(1,0);p.imm(3,1)
    for base,values in tables().items():
        p.imm(2,base)
        for value in values:
            p.emit(0x8100|value,f'LIL R1, {value:02X}')
            p.store(2,1);p.alu('ADD',2,2,3)
    p.ret()

def core(p):
    p.label('copy16');p.mov(8,1);p.mov(6,2);p.imm(5,16);p.imm(4,1)
    p.label('copy_loop');p.load(1,8);p.store(6,1)
    p.alu('ADD',8,8,4);p.alu('ADD',6,6,4);p.alu('SUB',5,5,4)
    p.cmp(5,0);p.branch('BEQ','copy_done');p.jump('copy_loop')
    p.label('copy_done');p.ret()

    p.label('pack16');p.mov(8,1);p.mov(6,2);p.imm(5,16);p.imm(4,1)
    p.label('pack_loop');p.load(1,8);p.alu('ADD',8,8,4);p.load(2,8)
    for _ in range(4):p.alu('SLL',1,1)
    p.alu('ADD',3,1,2);p.store(6,3);p.alu('ADD',8,8,4);p.alu('ADD',6,6,4)
    p.alu('SUB',5,5,4);p.cmp(5,0);p.branch('BEQ','pack_done');p.jump('pack_loop')
    p.label('pack_done');p.ret()

    p.label('key_expand');p.imm(1,KEY);p.imm(2,RKEY);p.call('copy16')
    p.put(PREV,RKEY);p.put(KSROUND,1);p.put(RCON,1)
    p.label('key_round');p.ld(8,PREV);p.imm(6,16);p.alu('ADD',6,8,6)
    for i in range(16):
        if i<4:
            p.imm(9,12+(i+1)%4);p.alu('ADD',9,8,9);p.load(1,9)
            p.imm(2,SBOX);p.alu('ADD',2,1,2);p.load(2,2)
            p.imm(9,i);p.alu('ADD',9,8,9);p.load(1,9)
            xor(p,3,1,2)
            if i==0:p.ld(2,RCON);xor(p,3,3,2)
        else:
            p.imm(9,i);p.alu('ADD',9,8,9);p.load(1,9)
            p.imm(9,i-4);p.alu('ADD',9,6,9);p.load(2,9);xor(p,3,1,2)
        p.imm(9,i);p.alu('ADD',9,6,9);p.store(9,3)
    p.st(PREV,6);p.ld(1,RCON);p.imm(2,MUL[2]);p.alu('ADD',1,1,2);p.load(1,1);p.st(RCON,1)
    p.ld(1,KSROUND);p.imm(2,1);p.alu('ADD',1,1,2);p.st(KSROUND,1)
    p.imm(2,11);p.cmp(1,2);p.branch('BLT','key_round');p.ret()

    p.label('add_round_key');p.imm(8,STATE);p.ld(6,RKPTR);p.imm(4,STATE+16);p.imm(5,1)
    p.label('add_key_loop');p.load(1,8);p.load(2,6);xor(p,3,1,2);p.store(8,3)
    p.alu('ADD',8,8,5);p.alu('ADD',6,6,5);p.cmp(8,4);p.branch('BLT','add_key_loop');p.ret()

    for direction,box in (('enc',SBOX),('dec',ISBOX)):
        p.label('sub_'+direction);p.imm(8,STATE);p.imm(6,box);p.imm(7,STATE+16);p.imm(5,1)
        p.label('sub_loop_'+direction);p.load(1,8);p.alu('ADD',2,1,6);p.load(1,2);p.store(8,1)
        p.alu('ADD',8,8,5);p.cmp(8,7);p.branch('BLT','sub_loop_'+direction);p.ret()
        p.label('shift_'+direction)
        for row in range(1,4):
            for col in range(4):p.ld(1+col,STATE+row+4*col)
            for col in range(4):
                source=(col+row)%4 if direction=='enc' else (col-row)%4
                p.st(STATE+row+4*col,source+1)
        p.ret()

    for direction,coefficients in (('enc',((2,3,1,1),(1,2,3,1),(1,1,2,3),(3,1,1,2))),
                                   ('dec',((14,11,13,9),(9,14,11,13),(13,9,14,11),(11,13,9,14)))):
        p.label('mix_'+direction);p.imm(8,STATE)
        p.label('mix_loop_'+direction)
        for i in range(4):p.imm(9,i);p.alu('ADD',9,8,9);p.load(i+1,9)
        for row,terms in enumerate(coefficients):
            for i,k in enumerate(terms):
                if k==1:p.mov(5,i+1)
                else:p.imm(5,MUL[k]);p.alu('ADD',5,5,i+1);p.load(5,5)
                if i==0:p.mov(6,5)
                else:xor(p,6,6,5)
            p.imm(9,row);p.alu('ADD',9,8,9);p.store(9,6)
        p.imm(5,4);p.alu('ADD',8,8,5);p.imm(5,STATE+16)
        p.cmp(8,5);p.branch('BLT','mix_loop_'+direction);p.ret()

    p.label('encrypt');p.put(RKPTR,RKEY);p.call('add_round_key');p.put(ROUND,1)
    p.label('enc_round');p.call('sub_enc');p.call('shift_enc')
    p.ld(1,ROUND);p.imm(2,10);p.cmp(1,2);p.branch('BEQ','enc_no_mix');p.call('mix_enc')
    p.label('enc_no_mix');p.ld(1,RKPTR);p.imm(2,16);p.alu('ADD',1,1,2);p.st(RKPTR,1);p.call('add_round_key')
    p.ld(1,ROUND);p.imm(2,1);p.alu('ADD',1,1,2);p.st(ROUND,1)
    p.imm(2,11);p.cmp(1,2);p.branch('BLT','enc_round');p.ret()

    p.label('decrypt');p.put(RKPTR,RKEY+160);p.call('add_round_key');p.put(ROUND,9)
    p.label('dec_round');p.call('shift_dec');p.call('sub_dec')
    p.ld(1,RKPTR);p.imm(2,16);p.alu('SUB',1,1,2);p.st(RKPTR,1);p.call('add_round_key')
    p.ld(1,ROUND);p.cmp(1,0);p.branch('BEQ','dec_done');p.call('mix_dec')
    p.ld(1,ROUND);p.imm(2,1);p.alu('SUB',1,1,2);p.st(ROUND,1);p.jump('dec_round')
    p.label('dec_done');p.ret()

def ascii_nibble(p):
    number=p.unique('nibble_number');done=p.unique('nibble_ascii')
    p.imm(4,10);p.cmp(1,4);p.branch('BLT',number)
    p.imm(4,0x37);p.alu('ADD',1,1,4);p.jump(done)
    p.label(number);p.imm(4,0x30);p.alu('ADD',1,1,4);p.label(done)

def user_interface(p):
    p.label('draw_hex');p.st(HEX_PTR,1);p.put(HEX_COUNT,16)
    p.label('hex_byte');p.ld(4,HEX_PTR);p.load(1,4);p.st(HEX_BYTE,1)
    for _ in range(4):p.alu('SRL',1,1)
    ascii_nibble(p);p.call('big_char')
    p.ld(1,HEX_BYTE);p.imm(4,15);p.alu('NAND',1,1,4);p.alu('NAND',1,1,1)
    ascii_nibble(p);p.call('big_char')
    p.ld(1,HEX_PTR);p.imm(4,1);p.alu('ADD',1,1,4);p.st(HEX_PTR,1)
    p.ld(1,HEX_COUNT);p.alu('SUB',1,1,4);p.st(HEX_COUNT,1)
    p.cmp(1,0);p.branch('BEQ','hex_done');p.imm(4,8);p.cmp(1,4);p.branch('BEQ','hex_second_row');p.jump('hex_byte')
    p.label('hex_second_row');p.imm(4,800);p.alu('ADD',2,2,4);p.jump('hex_byte')
    p.label('hex_done');p.ret()

    p.label('input_address')  # R1=index; returns R2=screen address, clobbers R1,R3..R9.
    p.imm(4,0);p.imm(3,16);p.cmp(1,3);p.branch('BLT','address_first_row')
    p.alu('SUB',1,1,3);p.imm(4,7*128)
    p.label('address_first_row');p.alu('SLL',2,1);p.alu('SLL',1,2);p.alu('ADD',2,2,1);p.alu('ADD',2,2,4)
    p.ld(1,PHASE);p.imm(3,1);p.cmp(1,3);p.branch('BEQ','address_key')
    p.imm(3,48*128+8);p.jump('address_finish')
    p.label('address_key');p.imm(3,26*128+8)
    p.label('address_finish');p.alu('ADD',2,2,3);p.ret()

    p.label('edit_echo');p.ld(1,INDEX);p.call('input_address');p.ld(1,ASCII);p.imm(3,tile(7));p.call('big_char');p.ret()
    p.label('cursor_clear');p.ld(1,CURSOR);p.cmp(1,0);p.branch('BEQ','cursor_clear_done')
    p.imm(2,5);p.imm(3,1);p.imm(4,0);p.call('fill_rect');p.st(CURSOR,0)
    p.label('cursor_clear_done');p.ret()
    p.label('cursor_update');p.call('cursor_clear');p.ld(1,COUNT);p.imm(2,32);p.cmp(1,2);p.branch('BLT','cursor_draw');p.ret()
    p.label('cursor_draw');p.call('input_address');p.imm(1,5*128);p.alu('ADD',1,2,1);p.st(CURSOR,1)
    p.imm(2,5);p.imm(3,1);p.imm(4,tile(6));p.call('fill_rect');p.ret()

    p.label('status');p.rect(85,8,114,5,0);p.ld(1,PHASE)
    for value,label in ((0,'status_mode'),(1,'status_key'),(2,'status_block')):
        p.imm(2,value);p.cmp(1,2);p.branch('BEQ',label)
    p.ld(1,MODE);p.cmp(1,0);p.branch('BEQ','status_encrypted');p.big(85,8,'DECRYPTED',2);p.ret()
    p.label('status_encrypted');p.big(85,8,'ENCRYPTED',2);p.ret()
    for label,text in (('status_mode','SELECT MODE'),('status_key','ENTER KEY'),('status_block','ENTER BLOCK')):
        p.label(label);p.big(85,8,text,3);p.ret()

    p.label('run_crypto');p.call('cursor_clear');p.rect(85,8,114,5,0);p.big(85,8,'WORKING',6)
    p.imm(1,INPUT);p.imm(2,STATE);p.call('copy16');p.ld(1,MODE);p.cmp(1,0);p.branch('BEQ','run_encrypt')
    p.call('decrypt');p.jump('run_display')
    p.label('run_encrypt');p.call('encrypt')
    p.label('run_display');p.imm(1,STATE);p.imm(2,70*128+8);p.imm(3,tile(2));p.call('draw_hex')
    p.put(PHASE,3);p.call('status');p.ret()

def build():
    p=Demo('aes128_keyboard_vga')
    p.label('boot');p.imm(0,0);p.imm(11,0x3F00);p.call('init_tables');p.jump('new_session')
    p.label('new_session');p.startup()
    for address in range(MODE,CURSOR+1):p.st(address,0)
    p.big(3,8,'AES 128',3);p.big(12,8,'E ENCRYPT D DECRYPT',6)
    p.small(20,8,'32 HEX DIGITS PER KEY / BLOCK. E/D CAN ALSO PROCESS THE PREVIOUS OUTPUT.')
    for row,label in ((24,'KEY - 128 BITS'),(46,'INPUT - 128 BITS'),(68,'OUTPUT - 128 BITS')):p.small(row,8,label)
    for row,rgb in ((26,7),(33,7),(48,7),(55,7),(70,2),(77,2)):p.big(row,8,'-'*16,rgb)
    p.small(91,8,'ENTER NEXT / NEW KEY. BACKSPACE EDIT. T EXAMPLE. R RESTART.')
    p.call('status')

    p.label('poll');p.ld(1,0xFFFF);p.cmp(1,0);p.branch('BEQ','poll')
    p.st(0x3003,1)
    p.imm(2,0x12);p.cmp(1,2);p.branch('BEQ','new_session')
    p.imm(2,0x14);p.cmp(1,2);p.branch('BEQ','example')
    p.ld(4,PHASE);p.cmp(4,0);p.branch('BEQ','choose_mode')
    p.imm(2,3);p.cmp(4,2);p.branch('BEQ','completed_key')
    p.imm(2,0x1C);p.cmp(1,2);p.branch('BEQ','enter_field')
    p.imm(2,0x1B);p.cmp(1,2);p.branch('BEQ','erase_nibble')
    p.imm(2,1);p.cmp(1,2);p.branch('BLT','poll')
    p.imm(2,7);p.cmp(1,2);p.branch('BLT','letter_nibble')
    p.imm(2,0x1E);p.cmp(1,2);p.branch('BLT','poll')
    p.imm(2,0x28);p.cmp(1,2);p.branch('BLT','digit_nibble');p.jump('poll')
    p.label('letter_nibble');p.imm(2,9);p.alu('ADD',1,1,2);p.jump('append_nibble')
    p.label('digit_nibble');p.imm(2,0x1E);p.alu('SUB',1,1,2)
    p.label('append_nibble');p.ld(4,COUNT);p.imm(2,32);p.cmp(4,2);p.branch('BLT','append_valid');p.jump('poll')
    p.label('append_valid');p.st(INDEX,4);p.imm(5,KNIB);p.ld(2,PHASE);p.imm(3,1)
    p.cmp(2,3);p.branch('BEQ','append_address');p.imm(5,INIB)
    p.label('append_address');p.alu('ADD',5,5,4);p.store(5,1);ascii_nibble(p);p.st(ASCII,1)
    p.ld(4,COUNT);p.imm(2,1);p.alu('ADD',4,4,2);p.st(COUNT,4)
    p.call('cursor_clear');p.call('edit_echo');p.call('cursor_update');p.jump('poll')
    p.label('erase_nibble');p.ld(1,COUNT);p.cmp(1,0);p.branch('BEQ','poll')
    p.imm(2,1);p.alu('SUB',1,1,2);p.st(COUNT,1);p.st(INDEX,1);p.put(ASCII,ord('-'))
    p.call('cursor_clear');p.call('edit_echo');p.call('cursor_update');p.jump('poll')
    p.label('enter_field');p.ld(1,COUNT);p.imm(2,32);p.cmp(1,2);p.branch('BEQ','field_complete');p.jump('poll')
    p.label('field_complete');p.ld(1,PHASE);p.imm(2,1);p.cmp(1,2);p.branch('BEQ','key_complete')
    p.imm(1,INIB);p.imm(2,INPUT);p.call('pack16');p.call('run_crypto');p.jump('poll')
    p.label('key_complete');p.imm(1,KNIB);p.imm(2,KEY);p.call('pack16');p.call('key_expand')
    p.put(PHASE,2);p.put(COUNT,0);p.call('status');p.call('cursor_update');p.jump('poll')

    p.label('choose_mode');p.imm(2,5);p.cmp(1,2);p.branch('BEQ','select_encrypt')
    p.imm(2,4);p.cmp(1,2);p.branch('BEQ','select_decrypt');p.jump('poll')
    p.label('select_encrypt');p.put(MODE,0);p.jump('mode_selected')
    p.label('select_decrypt');p.put(MODE,1)
    p.label('mode_selected');p.put(PHASE,1);p.put(COUNT,0);p.call('status');p.call('cursor_update');p.jump('poll')

    p.label('completed_key');p.imm(2,0x1C);p.cmp(1,2);p.branch('BEQ','new_session')
    p.imm(2,5);p.cmp(1,2);p.branch('BEQ','chain_encrypt')
    p.imm(2,4);p.cmp(1,2);p.branch('BEQ','chain_decrypt');p.jump('poll')
    p.label('chain_encrypt');p.put(MODE,0);p.jump('chain_input')
    p.label('chain_decrypt');p.put(MODE,1)
    p.label('chain_input');p.imm(1,STATE);p.imm(2,INPUT);p.call('copy16')
    p.imm(1,INPUT);p.imm(2,48*128+8);p.imm(3,tile(7));p.call('draw_hex');p.call('run_crypto');p.jump('poll')

    p.label('example');p.call('cursor_clear')
    for i,b in enumerate(EXAMPLE_KEY):p.put(KEY+i,b)
    p.ld(1,MODE);p.cmp(1,0);p.branch('BEQ','example_plain')
    for i,b in enumerate(EXAMPLE_CIPHER):p.put(INPUT+i,b)
    p.jump('example_ready');p.label('example_plain')
    for i,b in enumerate(EXAMPLE_PLAIN):p.put(INPUT+i,b)
    p.label('example_ready');p.imm(1,KEY);p.imm(2,26*128+8);p.imm(3,tile(7));p.call('draw_hex')
    p.imm(1,INPUT);p.imm(2,48*128+8);p.imm(3,tile(7));p.call('draw_hex')
    p.call('key_expand');p.call('run_crypto');p.jump('poll')

    core(p);user_interface(p);common(p);table_initialization(p)
    data=p.save({'algorithm':'AES-128 raw single-block encryption and decryption',
                 'globals':{'mode':MODE,'phase':PHASE,'nibble_count':COUNT},
                 'memory':{'key':KEY,'input':INPUT,'state_output':STATE,'round_keys':RKEY,
                           'tables_start':SBOX,'tables_end':0x47FF,'stack':0x3F00},
                 'example':{'key':EXAMPLE_KEY.hex().upper(),'plaintext':EXAMPLE_PLAIN.hex().upper(),
                            'ciphertext':EXAMPLE_CIPHER.hex().upper()}})
    (OUT/'manifest.json').write_text(json.dumps(data,indent=2)+'\n')
    (OUT/'aes_tables.json').write_text(json.dumps({f'{k:04X}':v for k,v in tables().items()},indent=2)+'\n')
    print(data['name'],data['instruction_words'],'instruction words')

if __name__=='__main__':build()
