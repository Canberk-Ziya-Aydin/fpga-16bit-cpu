#!/usr/bin/env python3
"""Assembler and VGA drawing helpers for the project's existing 16-bit ISA."""
from pathlib import Path
import json

ROOT=Path(__file__).resolve().parent
OP={'ADD':1,'SUB':2,'NAND':3,'SLL':4,'SRL':5,'SLA':6,'SRA':7,'BEQ':12,'BLT':13,'JMP':15}
def tile(rgb): return (rgb<<11)|(rgb<<8)

class Demo:
    def __init__(self,name):
        self.name=name;self.words=[];self.lines=[];self.labels={};self.fix=[];self.serial=0
    def emit(self,word,asm):
        self.lines.append((len(self.words),asm));self.words.append(word)
    def label(self,label):
        assert label not in self.labels,label
        self.labels[label]=len(self.words);self.lines.append((None,label+':'))
    def unique(self,stem):
        self.serial+=1;return f'{stem}_{self.serial}'
    def imm(self,r,value):
        if isinstance(value,str): self.fix.append((len(self.words),r,value));value=0
        self.emit(0x8000|(r<<8)|(value&255),f'LIL R{r}, {value&255:02X}')
        self.emit(0x9000|(r<<8)|((value>>8)&255),f'LIH R{r}, {(value>>8)&255:02X}')
    def alu(self,op,r,a,b=0):
        suffix=f', R{b}' if op in ('ADD','SUB','NAND') else ''
        self.emit((OP[op]<<12)|(r<<8)|(a<<4)|b,f'{op} R{r}, R{a}{suffix}')
    def mov(self,r,a): self.alu('ADD',r,a,0)
    def cmp(self,a,b): self.emit(0xE000|(a<<4)|b,f'CMP R{a}, R{b}')
    def load(self,r,a): self.emit(0xA000|(r<<8)|(a<<4),f'LOAD R{r}, [R{a}]')
    def store(self,a,r): self.emit(0xB000|(a<<4)|r,f'STORE [R{a}], R{r}')
    def ld(self,r,address): self.imm(9,address);self.load(r,9)
    def st(self,address,r): self.imm(9,address);self.store(9,r)
    def put(self,address,value): self.imm(1,value);self.st(address,1)
    def branch(self,op,label): self.imm(10,label);self.emit((OP[op]<<12)|0xA0,f'{op} R10')
    def jump(self,label): self.branch('JMP',label)
    def call(self,label):
        ret=self.unique('return')
        self.imm(10,ret);self.store(11,10);self.imm(10,1);self.alu('ADD',11,11,10)
        self.jump(label);self.label(ret)
    def ret(self):
        self.imm(10,1);self.alu('SUB',11,11,10);self.load(10,11)
        self.emit(0xF0A0,'JMP R10')
    def rect(self,row,col,width,height,color):
        self.imm(1,row*128+col);self.imm(2,width);self.imm(3,height);self.imm(4,color);self.call('fill_rect')
    def big(self,row,col,text,rgb=7):
        assert col+6*len(text)<=128,(col,text)
        self.imm(2,row*128+col);self.imm(3,tile(rgb))
        for ch in text: self.imm(1,ord(ch));self.call('big_char')
    def small(self,row,col,text,rgb=7):
        self.imm(2,row*128+col)
        for ch in text:
            self.imm(1,(rgb<<8)+ord(ch));self.store(2,1);self.imm(1,1);self.alu('ADD',2,2,1)
    def startup(self):
        self.imm(0,0);self.imm(11,0x3F00);self.rect(0,0,128,96,0)
        self.rect(0,0,128,1,tile(3));self.rect(92,0,128,1,tile(3))
    def decimal(self,address,row,col,digits=3,rgb=7):
        self.ld(1,address);self.imm(2,row*128+col);self.imm(3,tile(rgb));self.imm(4,digits);self.call('decimal')
    def save(self,extra):
        lines={a:s for a,s in self.lines if a is not None}
        for a,r,label in self.fix:
            value=self.labels[label]
            self.words[a]=0x8000|(r<<8)|(value&255);self.words[a+1]=0x9000|(r<<8)|(value>>8)
            lines[a]=f'LIL R{r}, {value&255:02X} ; {label} = {value:04X}'
            lines[a+1]=f'LIH R{r}, {value>>8:02X}'
        assert len(self.words)<=32768
        rom=self.words+[0]*(32768-len(self.words))
        (ROOT/(self.name+'.coe')).write_text('memory_initialization_radix=16;\nmemory_initialization_vector=\n'+',\n'.join(f'{w:04X}' for w in rom)+';\n')
        assembly=['; Existing CPU ISA. All numeric operands are hexadecimal.',
                  '; R0 = zero, R10 = branch/call scratch, R11 = software stack pointer.']
        listing=[]
        for a,s in self.lines:
            if a is None:assembly.append(s)
            else:
                assembly.append('    '+lines[a]);listing.append(f'{a:04X}  {self.words[a]:04X}  {lines[a]}')
        (ROOT/(self.name+'.asm')).write_text('\n'.join(assembly)+'\n')
        (ROOT/(self.name+'_listing.txt')).write_text('\n'.join(listing)+'\n')
        return dict(name=self.name,instruction_words=len(self.words),labels=self.labels,**extra)

def common(p,decimal=False):
    # fill_rect: R1=start, R2=width, R3=height, R4=word. Clobbers R1..R9.
    p.label('fill_rect');p.mov(5,1);p.imm(8,1);p.imm(9,128)
    p.label('fill_row');p.mov(6,2);p.mov(7,5)
    p.label('fill_pixel');p.store(7,4);p.alu('ADD',7,7,8);p.alu('SUB',6,6,8)
    p.cmp(6,0);p.branch('BEQ','fill_next_row');p.jump('fill_pixel')
    p.label('fill_next_row');p.alu('ADD',5,5,9);p.alu('SUB',3,3,8)
    p.cmp(3,0);p.branch('BEQ','fill_done');p.jump('fill_row')
    p.label('fill_done');p.ret()

    # big_char: reads two words from existing glyph RAM; each font bit becomes
    # one 5x5 physical-pixel screen cell. R2 advances six cells; R3 is preserved.
    p.label('big_char');p.alu('SLL',1,1);p.imm(9,0xE000);p.alu('ADD',1,1,9)
    p.load(4,1);p.imm(9,1);p.alu('ADD',1,1,9);p.load(5,1)
    p.mov(1,4);p.mov(4,5);p.imm(5,0x4000);p.imm(6,5);p.mov(8,2)
    p.label('char_row');p.imm(7,5)
    p.label('char_pixel');p.alu('NAND',9,1,5);p.alu('NAND',9,9,9)
    p.cmp(9,0);p.branch('BEQ','char_blank');p.store(8,3);p.jump('char_advance')
    p.label('char_blank');p.store(8,0)
    p.label('char_advance');p.imm(9,1);p.alu('ADD',8,8,9);p.alu('SRL',5,5)
    p.alu('SUB',7,7,9);p.cmp(7,0);p.branch('BEQ','char_row_done');p.jump('char_pixel')
    p.label('char_row_done');p.imm(9,123);p.alu('ADD',8,8,9)
    p.imm(9,1);p.alu('SUB',6,6,9);p.cmp(6,0);p.branch('BEQ','char_done')
    p.imm(9,2);p.cmp(6,9);p.branch('BEQ','char_second_word');p.jump('char_row')
    p.label('char_second_word');p.mov(1,4);p.imm(5,0x0200);p.jump('char_row')
    p.label('char_done');p.imm(9,6);p.alu('ADD',2,2,9);p.ret()
    if not decimal:return
    # decimal: R1=unsigned value, R2=start, R3=color, R4=3 or 5 digits.
    # Scratch 3200..3203; glyph drawing preserves R2 and R3.
    p.label('decimal');p.st(0x3200,1);p.st(0x3201,4)
    p.imm(1,3);p.cmp(4,1);p.branch('BEQ','decimal_three')
    p.imm(1,0x3300);p.jump('decimal_pointer')
    p.label('decimal_three');p.imm(1,0x3302)
    p.label('decimal_pointer');p.st(0x3202,1)
    p.label('decimal_digit');p.ld(1,0x3200);p.ld(4,0x3202);p.load(4,4)
    p.imm(5,0);p.imm(8,1)
    p.label('decimal_subtract');p.cmp(1,0);p.branch('BLT','decimal_do_subtract')
    p.cmp(1,4);p.branch('BLT','decimal_draw')
    p.label('decimal_do_subtract');p.alu('SUB',1,1,4);p.alu('ADD',5,5,8);p.jump('decimal_subtract')
    p.label('decimal_draw');p.st(0x3200,1);p.imm(4,0x30);p.alu('ADD',1,5,4)
    p.call('big_char')
    p.ld(4,0x3201);p.imm(5,1);p.alu('SUB',4,4,5);p.st(0x3201,4)
    p.cmp(4,0);p.branch('BEQ','decimal_done')
    p.ld(4,0x3202);p.alu('ADD',4,4,5);p.st(0x3202,4);p.jump('decimal_digit')
    p.label('decimal_done');p.ret()
