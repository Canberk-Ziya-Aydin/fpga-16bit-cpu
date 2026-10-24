#!/usr/bin/env python3
"""Architectural instruction simulation; independent AES oracle: cryptography.

This simulates real ROM instructions, not the assembler's source operations.
Full pipeline RTL verification is documented separately in verification.txt.
"""
from pathlib import Path
from collections import deque
import json
import random
from cryptography.hazmat.primitives.ciphers import Cipher,algorithms,modes

ROOT=Path(__file__).resolve().parent
MASK=0xFFFF

class CPU:
    def __init__(self,rom,font=None):
        self.rom=rom;self.r=[0]*12;self.ram=[0]*65536;self.flags=[0]*4
        self.pc=0;self.keys=deque();self.steps=0
        if font is not None:self.ram[0xE000:0xE200]=font
    def read(self,reg):return self.r[reg] if reg<12 else self.flags[reg-12]
    def step(self):
        ins=self.rom[self.pc&0x7FFF];self.pc=(self.pc+1)&MASK;self.steps+=1
        op=ins>>12;d=(ins>>8)&15;a=(ins>>4)&15;b=ins&15
        av=self.read(a);bv=self.read(b);result=None
        if op in (1,2,14):
            full=av+bv if op==1 else av+(bv^MASK)+1
            result=full&MASK
            overflow=(~(av^bv)&(av^result)&0x8000)!=0 if op==1 else ((av^bv)&(av^result)&0x8000)!=0
            self.flags=[int(result==0),result>>15,int(full>MASK),int(overflow)]
            if op==14:result=None
        elif op==3:
            result=(~(av&bv))&MASK;self.flags=[int(result==0),result>>15,0,0]
        elif op in (4,5,6,7):
            if op==4:result=(av<<1)&MASK
            elif op==5:result=av>>1
            elif op==6:result=((av<<1)|(av&1))&MASK
            else:result=(av>>1)|(av&0x8000)
            carry=av>>15 if op in (4,6) else av&1
            self.flags=[int(result==0),result>>15,carry,0]
        elif op==8:result=(self.read(d)&0xFF00)|(ins&255)
        elif op==9:result=(self.read(d)&255)|((ins&255)<<8)
        elif op==10:
            result=(self.keys.popleft() if self.keys else 0) if av==0xFFFF else (int(bool(self.keys)) if av==0xFFFE else self.ram[av])
        elif op==11:
            assert av<0xE000,hex(av)
            self.ram[av]=bv
        elif op in (12,13,15):
            taken=op==15 or (op==12 and self.flags[0]) or (op==13 and self.flags[1]!=self.flags[3])
            if taken:self.pc=av
        if result is not None and d<12:self.r[d]=result
    def run_to(self,pc,limit=3000000):
        for _ in range(limit):
            if self.pc==pc:return
            self.step()
        raise AssertionError(f'timeout at {self.pc:04X}, expected {pc:04X}')
    def call(self,pc):
        assert self.r[11]==0x3F00,hex(self.r[11])
        self.ram[0x3F00]=0x7FFE;self.r[11]=0x3F01;self.pc=pc
        self.run_to(0x7FFE)
        assert self.r[11]==0x3F00
    def press(self,key,poll):
        assert self.pc==poll
        self.keys.append(key);self.step();self.run_to(poll)
        assert not self.keys and self.r[11]==0x3F00

def image():
    text=(ROOT/'aes128_keyboard_vga.coe').read_text().split('memory_initialization_vector=')[1]
    rom=[int(w,16) for w in text.strip().rstrip(';').split(',')]
    assert len(rom)==32768
    return rom

def oracle(key,block,decrypt=False):
    cipher=Cipher(algorithms.AES(key),modes.ECB())
    transform=cipher.decryptor() if decrypt else cipher.encryptor()
    return transform.update(block)+transform.finalize()

def main():
    metadata=json.loads((ROOT/'manifest.json').read_text());labels=metadata['labels']
    cpu=CPU(image());cpu.run_to(labels['poll'])
    assert cpu.r[11]==0x3F00
    tables=json.loads((ROOT/'aes_tables.json').read_text())
    for base,expected in tables.items():assert cpu.ram[int(base,16):int(base,16)+256]==expected
    print('PASS: boot, all 2048 lookup entries, call stack and keyboard poll')
    rng=random.Random(0xAE5128)
    vectors=[(bytes.fromhex(metadata['example']['key']),bytes.fromhex(metadata['example']['plaintext'])),
             (bytes(16),bytes(16)),(bytes([255])*16,bytes([255])*16),
             (bytes.fromhex('2B7E151628AED2A6ABF7158809CF4F3C'),bytes.fromhex('6BC1BEE22E409F96E93D7E117393172A'))]
    vectors += [(rng.randbytes(16),rng.randbytes(16)) for _ in range(64)]
    before=cpu.steps
    for n,(key,plain) in enumerate(vectors):
        cpu.ram[0x3100:0x3110]=key
        cpu.call(labels['key_expand'])
        if n==0:
            assert bytes(cpu.ram[0x35A0:0x35B0]).hex()=='13111d7fe3944a17f307a78b4d2b30c5'
        cpu.ram[0x3400:0x3410]=plain;cpu.call(labels['encrypt'])
        encrypted=bytes(cpu.ram[0x3400:0x3410]);expected=oracle(key,plain)
        assert encrypted==expected,(n,encrypted.hex(),expected.hex())
        if n==0:assert encrypted.hex()=='69c4e0d86a7b0430d8cdb78070b4c55a'
        cpu.call(labels['decrypt']);assert bytes(cpu.ram[0x3400:0x3410])==plain,n
        # An unrelated ciphertext checks inverse correctness independently of round trips.
        unrelated=rng.randbytes(16);cpu.ram[0x3400:0x3410]=unrelated
        cpu.call(labels['decrypt'])
        assert bytes(cpu.ram[0x3400:0x3410])==oracle(key,unrelated,True),n
    print(f'PASS: {len(vectors)} keys, {len(vectors)} encryptions, {2*len(vectors)} decryptions against independent AES oracle')
    print(f'Core verification executed {cpu.steps-before} actual instructions')

    # Test the actual keyboard state machine and entry limits.
    cpu.pc=labels['new_session'];cpu.run_to(labels['poll']);poll=labels['poll']
    cpu.press(5,poll);assert cpu.ram[0x3001]==1
    cpu.press(0x1C,poll);assert cpu.ram[0x3001]==1  # Reject incomplete key.
    cpu.press(0x1E,poll);cpu.press(0x1F,poll);cpu.press(0x1B,poll)
    assert cpu.ram[0x3002]==1
    def hex_keys(value):
        for c in value:
            v=int(c,16);cpu.press(0x1E+v if v<10 else v-9,poll)
    hex_keys(metadata['example']['key'][1:])
    assert cpu.ram[0x3002]==32
    cpu.press(6,poll);assert cpu.ram[0x3002]==32  # Extra hex digit ignored.
    cpu.press(0x1C,poll);assert cpu.ram[0x3001]==2
    hex_keys(metadata['example']['plaintext'])
    cpu.press(0x1C,poll);assert bytes(cpu.ram[0x3400:0x3410]).hex()==metadata['example']['ciphertext'].lower()
    cpu.press(4,poll);assert bytes(cpu.ram[0x3400:0x3410]).hex()==metadata['example']['plaintext'].lower()
    cpu.press(5,poll);assert bytes(cpu.ram[0x3400:0x3410]).hex()==metadata['example']['ciphertext'].lower()
    cpu.press(0x12,poll);cpu.press(4,poll);cpu.press(0x14,poll)
    assert bytes(cpu.ram[0x3400:0x3410]).hex()==metadata['example']['plaintext'].lower()
    print('PASS: manual hexadecimal entry, incomplete/extra entry handling, backspace, example, E/D chaining and restart')

if __name__=='__main__':main()
