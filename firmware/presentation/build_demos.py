#!/usr/bin/env python3
"""Two interactive presentation ROMs for the project's existing 16-bit ISA."""
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

def calculator():
    p=Demo('presentation_calculator');p.label('start');p.startup()
    for address in range(0x3000,0x300A):p.put(address,0)
    for i,value in enumerate((10000,1000,100,10,1)):p.put(0x3300+i,value)
    p.big(4,8,'16 BIT CPU CALC',3);p.big(14,8,'A+ S- M* D/',6)
    p.small(22,8,'SELECT OPERATION - TYPE FIRST NUMBER - ENTER - SECOND NUMBER - ENTER')
    p.small(28,8,'FIRST (0-255)');p.small(28,43,'SECOND (0-255)');p.small(28,79,'RESULT (DECIMAL)')
    p.big(31,67,'=',3);p.big(83,8,'R RESTART',3)
    p.call('draw_inputs');p.decimal(0x3005,31,79,5,2);p.call('prompt')
    p.label('poll');p.ld(1,0xFFFF);p.cmp(1,0);p.branch('BEQ','poll')
    p.st(0x3008,1);p.imm(2,0x12);p.cmp(1,2);p.branch('BEQ','start')
    p.ld(4,0x3003);p.cmp(4,0);p.branch('BEQ','select_op')
    p.imm(2,3);p.cmp(4,2);p.branch('BEQ','finished_key')
    p.imm(2,0x1C);p.cmp(1,2);p.branch('BEQ','enter_key')
    p.imm(8,0x3000);p.imm(2,1);p.cmp(4,2);p.branch('BEQ','input_address')
    p.imm(8,0x3001)
    p.label('input_address');p.load(2,8)
    p.imm(3,0x1B);p.cmp(1,3);p.branch('BEQ','backspace')
    p.imm(3,0x1E);p.cmp(1,3);p.branch('BLT','poll')
    p.imm(3,0x28);p.cmp(1,3);p.branch('BLT','digit_key');p.jump('poll')
    p.label('digit_key');p.imm(3,0x1E);p.alu('SUB',1,1,3)
    p.alu('SLL',3,2);p.alu('SLL',4,3);p.alu('SLL',4,4)
    p.alu('ADD',2,3,4);p.alu('ADD',2,2,1);p.imm(3,256)
    p.cmp(2,3);p.branch('BLT','save_input');p.jump('poll')
    p.label('backspace');p.imm(1,0);p.imm(3,10);p.imm(4,1)
    p.label('backspace_loop');p.cmp(2,3);p.branch('BLT','backspace_done')
    p.alu('SUB',2,2,3);p.alu('ADD',1,1,4);p.jump('backspace_loop')
    p.label('backspace_done');p.mov(2,1)
    p.label('save_input');p.store(8,2);p.call('draw_inputs');p.jump('poll')
    p.label('finished_key');p.imm(2,0x1C);p.cmp(1,2);p.branch('BEQ','start');p.jump('poll')
    p.label('enter_key');p.imm(2,1);p.cmp(4,2);p.branch('BEQ','second_phase')
    p.call('calculate');p.put(0x3003,3);p.call('draw_result');p.call('prompt');p.jump('poll')
    p.label('second_phase');p.put(0x3003,2);p.call('prompt');p.jump('poll')
    p.label('select_op')
    for key,op,character in ((1,1,'+'),(0x13,2,'-'),(0x0D,3,'*'),(4,4,'/')):
        label=f'select_{op}';p.imm(2,key);p.cmp(1,2);p.branch('BEQ',label)
    p.jump('poll')
    for op,ch in ((1,'+'),(2,'-'),(3,'*'),(4,'/')):
        p.label(f'select_{op}');p.put(0x3002,op);p.put(0x3003,1)
        p.big(31,31,ch,6);p.call('prompt');p.jump('poll')

    p.label('draw_inputs');p.decimal(0x3000,31,8);p.decimal(0x3001,31,43);p.ret()
    p.label('prompt');p.rect(43,8,108,5,0);p.rect(38,8,18,1,0);p.rect(38,43,18,1,0)
    p.ld(1,0x3003);p.cmp(1,0);p.branch('BEQ','prompt_op')
    p.imm(2,1);p.cmp(1,2);p.branch('BEQ','prompt_first')
    p.imm(2,2);p.cmp(1,2);p.branch('BEQ','prompt_second')
    p.big(43,8,'ENTER TO RESTART',3);p.ret()
    p.label('prompt_op');p.big(43,8,'CHOOSE OP',3);p.ret()
    p.label('prompt_first');p.big(43,8,'FIRST NUMBER',3);p.rect(38,8,18,1,tile(6));p.ret()
    p.label('prompt_second');p.big(43,8,'SECOND NUMBER',3);p.rect(38,43,18,1,tile(6));p.ret()

    p.label('calculate');p.ld(1,0x3000);p.ld(2,0x3001);p.ld(4,0x3002)
    p.st(0x3004,0);p.st(0x3006,0);p.st(0x3007,0)
    for op,label in ((1,'calc_add'),(2,'calc_sub'),(3,'calc_mul')):
        p.imm(3,op);p.cmp(4,3);p.branch('BEQ',label)
    p.cmp(2,0);p.branch('BEQ','calc_zero_divisor');p.imm(3,0);p.imm(4,1)
    p.label('calc_div_loop');p.cmp(1,2);p.branch('BLT','calc_div_done')
    p.alu('SUB',1,1,2);p.alu('ADD',3,3,4);p.jump('calc_div_loop')
    p.label('calc_div_done');p.st(0x3007,1);p.mov(1,3);p.jump('calc_save')
    p.label('calc_zero_divisor');p.imm(1,1);p.st(0x3004,1);p.imm(1,0);p.jump('calc_save')
    p.label('calc_add');p.alu('ADD',1,1,2);p.jump('calc_save')
    p.label('calc_sub');p.cmp(1,2);p.branch('BLT','calc_negative')
    p.alu('SUB',1,1,2);p.jump('calc_save')
    p.label('calc_negative');p.alu('SUB',1,2,1);p.imm(3,1);p.st(0x3006,3);p.jump('calc_save')
    p.label('calc_mul');p.imm(3,0);p.imm(4,1)
    p.label('calc_mul_loop');p.cmp(2,0);p.branch('BEQ','calc_mul_done')
    p.alu('ADD',3,3,1);p.alu('SUB',2,2,4);p.jump('calc_mul_loop')
    p.label('calc_mul_done');p.mov(1,3)
    p.label('calc_save');p.st(0x3005,1);p.ret()
    p.label('draw_result');p.ld(1,0x3004);p.cmp(1,0);p.branch('BEQ','draw_number')
    p.big(58,8,'DIVIDE BY ZERO',4);p.ret()
    p.label('draw_number');p.decimal(0x3005,31,79,5,2)
    p.ld(1,0x3006);p.cmp(1,0);p.branch('BEQ','draw_remainder')
    p.big(31,73,'-',2)
    p.label('draw_remainder');p.ld(1,0x3002);p.imm(2,4);p.cmp(1,2);p.branch('BEQ','draw_division_rem');p.ret()
    p.label('draw_division_rem');p.small(58,79,'REMAINDER');p.decimal(0x3007,62,79,3,6);p.ret()
    common(p,decimal=True)
    return p.save({'globals':{'first':0x3000,'second':0x3001,'operation':0x3002,'phase':0x3003,
                            'error':0x3004,'result':0x3005,'negative':0x3006,'remainder':0x3007}})

def animation():
    p=Demo('presentation_animation');p.label('start');p.startup()
    for a,v in ((0x3000,20),(0x3001,35),(0x3002,1),(0x3003,1),(0x3004,3),
                (0x3005,0),(0x3006,4),(0x3007,0)):p.put(a,v)
    p.big(4,34,'16 BIT CPU',3);p.big(14,40,'VGA DEMO',7)
    p.big(83,8,'A COLOR S SPEED',6);p.small(90,8,'SPACE PAUSE / RESUME     R RESTART')
    p.rect(25,4,120,1,tile(7));p.rect(70,4,120,1,tile(7))
    p.rect(25,4,1,46,tile(7));p.rect(25,123,1,46,tile(7));p.call('animation_status')
    p.label('frame');p.call('poll_animation')
    p.imm(4,0);p.call('sprite');p.ld(1,0x3005);p.cmp(1,0);p.branch('BEQ','move_sprite');p.jump('draw_sprite')
    p.label('move_sprite')
    for address,velocity,low,high,axis in ((0x3000,0x3002,5,115,'x'),(0x3001,0x3003,26,62,'y')):
        p.ld(1,address);p.imm(2,low);p.cmp(1,2);p.branch('BEQ',f'{axis}_positive')
        p.imm(2,high);p.cmp(1,2);p.branch('BEQ',f'{axis}_negative');p.jump(f'{axis}_advance')
        p.label(f'{axis}_positive');p.put(velocity,1);p.jump(f'{axis}_advance')
        p.label(f'{axis}_negative');p.put(velocity,0xFFFF)
        p.label(f'{axis}_advance');p.ld(1,address);p.ld(2,velocity);p.alu('ADD',1,1,2);p.st(address,1)
    p.label('draw_sprite');p.ld(4,0x3004)
    for _ in range(8):p.alu('SLL',4,4)
    p.mov(5,4)
    for _ in range(3):p.alu('SLL',5,5)
    p.alu('ADD',4,4,5);p.call('sprite')
    p.ld(1,0x3007);p.imm(2,1);p.alu('ADD',1,1,2);p.st(0x3007,1)
    p.call('frame_delay');p.jump('frame')
    p.label('sprite');p.ld(1,0x3001)
    for _ in range(7):p.alu('SLL',1,1)
    p.ld(2,0x3000);p.alu('ADD',1,1,2);p.imm(2,8);p.imm(3,8);p.call('fill_rect');p.ret()
    p.label('poll_animation');p.ld(1,0xFFFF);p.cmp(1,0);p.branch('BEQ','animation_key_done')
    for key,label in ((1,'change_color'),(0x13,'change_speed'),(0x1D,'toggle_pause'),(0x12,'start')):
        p.imm(2,key);p.cmp(1,2);p.branch('BEQ',label)
    p.label('animation_key_done');p.ret()
    p.label('change_color');p.ld(1,0x3004);p.imm(2,1);p.alu('ADD',1,1,2)
    p.imm(2,8);p.cmp(1,2);p.branch('BLT','color_save');p.imm(1,1)
    p.label('color_save');p.st(0x3004,1);p.ret()
    p.label('change_speed');p.ld(1,0x3006);p.alu('SLL',1,1);p.imm(2,32)
    p.cmp(1,2);p.branch('BLT','speed_save');p.imm(1,4)
    p.label('speed_save');p.st(0x3006,1);p.call('animation_status');p.ret()
    p.label('toggle_pause');p.ld(1,0x3005);p.cmp(1,0);p.branch('BEQ','set_paused')
    p.put(0x3005,0);p.call('animation_status');p.ret()
    p.label('set_paused');p.put(0x3005,1);p.call('animation_status');p.ret()
    p.label('animation_status');p.rect(74,8,108,5,0)
    p.ld(1,0x3005);p.cmp(1,0);p.branch('BEQ','status_running')
    p.big(74,8,'PAUSED',6);p.ret()
    p.label('status_running');p.big(74,8,'RUNNING',3);p.ret()
    p.label('frame_delay');p.ld(2,0x3006);p.imm(3,1)
    p.label('delay_outer');p.label('delay_constant');p.imm(1,0xFFFF)
    p.label('delay_inner');p.alu('SUB',1,1,3);p.cmp(1,0);p.branch('BEQ','delay_next');p.jump('delay_inner')
    p.label('delay_next');p.alu('SUB',2,2,3);p.cmp(2,0);p.branch('BEQ','delay_done');p.jump('delay_outer')
    p.label('delay_done');p.ret()
    common(p)
    return p.save({'globals':{'x':0x3000,'y':0x3001,'dx':0x3002,'dy':0x3003,
                            'color':0x3004,'paused':0x3005,'speed':0x3006,'frames':0x3007}})

if __name__=='__main__':
    metadata=[calculator(),animation()]
    (ROOT/'manifest.json').write_text(json.dumps(metadata,indent=2)+'\n')
    for item in metadata:print(item['name'],item['instruction_words'],'instruction words')
