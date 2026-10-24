#!/usr/bin/env python3
"""Build five standalone diagnostic ROMs for this project's 16-bit ISA."""
from pathlib import Path
import json

OUT = Path(__file__).resolve().parent
OPS = {'ADD':1, 'SUB':2, 'NAND':3, 'SLL':4, 'SRL':5,
       'SLA':6, 'SRA':7, 'BEQ':12, 'BLT':13, 'JMP':15}

class Program:
    def __init__(self, name, title, results):
        self.name, self.title, self.results = name, title, results
        self.words, self.lines, self.labels, self.fixups = {}, [], {}, []
        self.pc = 0
        self.checks = []
        self.screen = {}

    def emit(self, word, asm, comment=''):
        assert self.pc not in self.words and 0 <= self.pc < 32768
        self.words[self.pc] = word
        self.lines.append((self.pc, asm, comment))
        self.pc += 1

    def label(self, label):
        assert label not in self.labels
        self.labels[label] = self.pc
        self.lines.append((None, label+':', ''))

    def org(self, address):
        assert address >= self.pc
        self.pc = address
        self.lines.append((None, f'.org {address:04X}', ''))

    def imm(self, reg, value):
        if isinstance(value, str):
            self.fixups.append((self.pc, reg, value))
            value = 0
        self.emit(0x8000 | reg << 8 | value & 255, f'LIL R{reg}, {value & 255:02X}')
        self.emit(0x9000 | reg << 8 | value >> 8 & 255, f'LIH R{reg}, {value >> 8 & 255:02X}')

    def alu(self, op, rd, a, b=0):
        tail = f', R{b}' if op in ('ADD','SUB','NAND') else ''
        self.emit(OPS[op] << 12 | rd << 8 | a << 4 | b,
                  f'{op} R{rd}, R{a}{tail}')

    def load(self, dst, addr):
        self.emit(0xA000 | dst << 8 | addr << 4, f'LOAD R{dst}, [R{addr}]')

    def store(self, addr, src):
        self.emit(0xB000 | addr << 4 | src, f'STORE [R{addr}], R{src}')

    def cmp(self, a, b):
        self.emit(0xE000 | a << 4 | b, f'CMP R{a}, R{b}')

    def branch(self, op, target):
        self.emit(OPS[op] << 12 | target << 4, f'{op} R{target}')

    def jump(self, label):
        self.imm(11, label)
        self.branch('JMP', 11)

    def boot(self):
        self.imm(0, 0)  # R0 is writable; explicitly establish zero.
        self.imm(1, 0)
        self.imm(2, 1)
        self.imm(3, 0x3000)
        self.imm(4, 'clear_screen')
        self.label('clear_screen')
        self.store(1, 0)
        self.alu('ADD',1,1,2)
        self.cmp(1,3)
        self.branch('BLT',4)
        for address in [0x3000+i for i in range(len(self.results))] + list(range(0x30F0,0x30F5)):
            self.imm(9, address)
            self.store(9,0)

    def remember(self, index, reg):
        self.imm(9,0x3000+index)
        self.store(9,reg)

    def check(self, reg, expected, description, *, expected_reg=False, result=None):
        """Clobbers R8-R11 only; comparison's flags feed the very next branch."""
        check_id = len(self.checks)+1
        self.checks.append({'id':check_id, 'description':description})
        if result is not None:
            self.remember(result,reg)
        if expected_reg:
            self.alu('ADD',8,expected,0)
        else:
            self.imm(8,expected)
        self.imm(10,check_id)
        self.imm(9,0x30F2)
        self.store(9,reg)
        self.imm(9,0x30F3)
        self.store(9,8)
        self.imm(11,f'check_{check_id:02X}_ok')
        self.cmp(reg,8)
        self.branch('BEQ',11)
        self.jump('failure')
        self.label(f'check_{check_id:02X}_ok')

    def read_check(self, index, expected, description):
        self.imm(9,0x3000+index)
        self.load(1,9)
        self.check(1,expected,description)

    def text(self, row, col, text, color=0x0700, *, expected=True):
        self.imm(6,row*128+col)
        self.imm(7,1)
        for char in text:
            word = color + ord(char)
            self.imm(2,word)
            self.store(6,2)
            self.alu('ADD',6,6,7)
            if expected:
                self.screen[row*128+col] = word
            col += 1

    def hexword(self,row,col,address,tag):
        self.imm(9,address)
        self.load(1,9)
        self.imm(6,row*128+col)
        self.imm(7,1)
        for digit,shift in enumerate((12,8,4,0)):
            self.alu('ADD',2,1,0)
            for _ in range(shift):
                self.alu('SRL',2,2)
            self.imm(4,0x000F)
            self.alu('NAND',2,2,4)
            self.alu('NAND',2,2,2)
            self.imm(4,0x000A)
            self.imm(11,f'{tag}_digit_{digit}')
            self.cmp(2,4)
            self.branch('BLT',11)
            self.imm(4,0x0737)  # 'A' - 10, white foreground.
            self.jump(f'{tag}_emit_{digit}')
            self.label(f'{tag}_digit_{digit}')
            self.imm(4,0x0730)
            self.label(f'{tag}_emit_{digit}')
            self.alu('ADD',2,2,4)
            self.store(6,2)
            self.alu('ADD',6,6,7)

    def finish(self):
        self.jump('success')
        self.label('failure')
        self.imm(9,0x30F1)
        self.store(9,10)
        self.imm(1,0xBAD0)
        self.jump('status')
        self.label('success')
        self.imm(1,0x600D)
        self.label('status')
        self.imm(9,0x30F0)
        self.store(9,1)
        self.text(0,2,self.title,0x0300)
        self.imm(9,0x30F0)
        self.load(1,9)
        self.imm(4,0x600D)
        self.imm(11,'show_pass')
        self.cmp(1,4)
        self.branch('BEQ',11)
        self.text(1,2,'FAIL',0x0400,expected=False)
        self.jump('details')
        self.label('show_pass')
        self.text(1,2,'PASS',0x0200)
        self.label('details')
        for row,label,address in ((2,'CHECK',0x30F1),(3,'ACTUAL',0x30F2),(4,'EXPECTED',0x30F3)):
            self.text(row,2,label)
            self.hexword(row,20,address,f'detail_{row}')
        for index,(label,value) in enumerate(self.results):
            row = 6+index
            self.text(row,2,label)
            self.hexword(row,20,0x3000+index,f'result_{index}')
            for offset,char in enumerate(f'{value:04X}'):
                self.screen[row*128+20+offset] = 0x0700+ord(char)
        for offset,char in enumerate('0000'):
            self.screen[2*128+20+offset] = 0x0700+ord(char)
        for row in (3,4):
            for offset,char in enumerate(f'{self.results[-1][1]:04X}'):
                self.screen[row*128+20+offset] = 0x0700+ord(char)
        # Written only after all screen stores: convenient simulation completion marker.
        self.imm(9,0x30F4)
        self.imm(1,0xCAFE)
        self.store(9,1)
        self.label('halt')
        self.imm(11,'halt')
        self.branch('JMP',11)

    def save(self):
        text_by_address={addr:(asm,comment) for addr,asm,comment in self.lines if addr is not None}
        for address,reg,label in self.fixups:
            assert label in self.labels, label
            value=self.labels[label]
            self.words[address]=0x8000 | reg << 8 | value & 255
            self.words[address+1]=0x9000 | reg << 8 | value >> 8 & 255
            text_by_address[address]=(f'LIL R{reg}, {value & 255:02X}', f'{label}: {value:04X}')
            text_by_address[address+1]=(f'LIH R{reg}, {value >> 8:02X}', '')
        rom=[self.words.get(i,0) for i in range(32768)]
        (OUT/f'{self.name}.coe').write_text('memory_initialization_radix=16;\nmemory_initialization_vector=\n'+',\n'.join(f'{w:04X}' for w in rom)+';\n')
        assembly=['; All numeric operands are hexadecimal; labels are for readability.',
                  '; .org controls ROM placement; it is not a CPU instruction.']
        listing=[]
        for address,asm,comment in self.lines:
            if address is None:
                assembly.append(asm)
            else:
                asm,comment=text_by_address[address]
                suffix=f' ; {comment}' if comment else ''
                assembly.append('    '+asm+suffix)
                listing.append(f'{address:04X}  {self.words[address]:04X}  {asm}{suffix}')
        (OUT/f'{self.name}.asm').write_text('\n'.join(assembly)+'\n')
        (OUT/f'{self.name}_listing.txt').write_text('\n'.join(listing)+'\n')
        return {'name':self.name,'title':self.title,'instruction_words':len(self.words),
                'highest_address':max(self.words),'labels':self.labels,'checks':self.checks,
                'results':[{'label':label,'address':0x3000+i,'expected':value} for i,(label,value) in enumerate(self.results)],
                'expected_screen':{str(k):v for k,v in self.screen.items()}}

def alu_test():
    outputs=[('ADD',0x1324),('SUB',0x1234),('NAND',0xFA5F),('SLL',0x0002),
             ('SRL',0x4000),('SLA',0x0003),('SRA',0xC000),('LIL PRESERVE',0xAB12),
             ('LIH PRESERVE',0x3412),('LATEST WRITER',0x0008),('BOTH OPERANDS',0x0013),
             ('WB FORWARD',0x002B),('ADD WRAP',0x0000),('SUB WRAP',0xFFFF)]
    p=Program('01_alu_forwarding','ALU AND FORWARDING',outputs); p.boot()
    p.imm(1,0x1234); p.imm(2,0x00F0)
    p.alu('ADD',3,1,2); p.alu('SUB',4,3,2)
    p.check(3,0x1324,'ADD result forwarded to the next SUB',result=0)
    p.check(4,0x1234,'dependent SUB result',result=1)
    p.imm(1,0x55AA); p.imm(2,0x0FF0); p.alu('NAND',3,1,2)
    p.check(3,0xFA5F,'NAND',result=2)
    for i,(op,value) in enumerate((('SLL',2),('SRL',0x4000),('SLA',3),('SRA',0xC000)),3):
        p.imm(1,0x8001); p.alu(op,2,1); p.check(2,value,op,result=i)
    p.imm(1,0xABCD); p.emit(0x8112,'LIL R1, 12')
    p.check(1,0xAB12,'LIL preserves upper byte',result=7)
    p.emit(0x9134,'LIH R1, 34'); p.check(1,0x3412,'LIH preserves lower byte',result=8)
    p.imm(1,1); p.alu('ADD',1,1,1); p.alu('ADD',1,1,1); p.alu('ADD',2,1,1)
    p.check(2,8,'newest EX/MEM value takes priority over older WB value',result=9)
    p.imm(1,3); p.imm(2,5); p.alu('ADD',3,1,2); p.alu('ADD',4,3,1); p.alu('ADD',5,3,4)
    p.check(5,19,'both operands need forwarding from different stages',result=10)
    p.imm(1,0x002A); p.imm(2,1); p.alu('ADD',3,1,2)
    p.emit(0,'NOP'); p.alu('ADD',4,3,0)
    p.check(4,0x002B,'WB forwarding with one intervening instruction',result=11)
    p.imm(1,0xFFFF); p.imm(2,1); p.alu('ADD',3,1,2); p.check(3,0,'16-bit ADD wrap',result=12)
    p.alu('SUB',3,0,2); p.check(3,0xFFFF,'16-bit SUB wrap',result=13)
    p.finish(); return p

def fibonacci():
    values=[0,1]
    while len(values)<16: values.append(values[-1]+values[-2])
    p=Program('02_fibonacci','FIBONACCI - 16 VALUES',[(f'F{i:02X}',v) for i,v in enumerate(values)])
    p.boot(); p.imm(1,0); p.imm(2,1); p.imm(3,16); p.imm(4,0x3000)
    p.imm(5,1); p.imm(6,'fib_loop'); p.imm(11,'fib_done')
    p.label('fib_loop'); p.store(4,1); p.alu('ADD',7,1,2); p.alu('ADD',1,2,0)
    p.alu('ADD',2,7,0); p.alu('ADD',4,4,5); p.alu('SUB',3,3,5)
    p.cmp(3,0); p.branch('BEQ',11); p.branch('JMP',6); p.label('fib_done')
    for i,v in enumerate(values): p.read_check(i,v,f'Fibonacci term {i}')
    p.finish(); return p

def math_loops():
    p=Program('03_math_loops','MULTIPLY DIVIDE AND GCD',[
        ('13 TIMES 17',221),('47 DIV 6',7),('REMAINDER',5),('GCD 1071 462',21)])
    p.boot(); p.imm(1,13); p.imm(2,17); p.imm(3,0); p.imm(4,1)
    p.imm(5,'multiply'); p.imm(6,'multiply_done')
    p.label('multiply'); p.cmp(2,0); p.branch('BEQ',6)
    p.alu('ADD',3,3,1); p.alu('SUB',2,2,4); p.branch('JMP',5)
    p.label('multiply_done'); p.check(3,221,'13 * 17 through repeated addition',result=0)
    p.imm(1,47); p.imm(2,6); p.imm(3,0); p.imm(4,1)
    p.imm(5,'divide'); p.imm(6,'divide_done')
    p.label('divide'); p.cmp(1,2); p.branch('BLT',6)
    p.alu('SUB',1,1,2); p.alu('ADD',3,3,4); p.branch('JMP',5)
    p.label('divide_done'); p.check(3,7,'47 / 6 quotient',result=1)
    p.check(1,5,'47 / 6 remainder',result=2)
    p.imm(1,1071); p.imm(2,462); p.imm(5,'gcd_loop')
    p.imm(6,'gcd_b_larger'); p.imm(7,'gcd_done')
    p.label('gcd_loop'); p.cmp(1,2); p.branch('BEQ',7); p.branch('BLT',6)
    p.alu('SUB',1,1,2); p.branch('JMP',5)
    p.label('gcd_b_larger'); p.alu('SUB',2,2,1); p.branch('JMP',5)
    p.label('gcd_done'); p.check(1,21,'Euclid by subtraction',result=3)
    p.finish(); return p

def memory_test():
    boundaries=[0x3FFF,0x4000,0x4001,0x7FFF,0x8000,0xBFFF,0xC000,0xDFFF]
    results=[('PATTERN WORDS',0x0100),('PATTERN LAST',(0xA55A+255*0x003D)&0xFFFF),
             ('LOAD TO ADD',0x48D0),('POINTER LOAD',0x2468),('LOAD TO STORE',0x2468)]
    results += [(f'RAM {address:04X}',0x5100+i*0x0111) for i,address in enumerate(boundaries)]
    p=Program('04_ram_hazards','RAM AND LOAD USE HAZARDS',results); p.boot()
    p.imm(1,0xA55A); p.imm(2,0x003D); p.imm(3,0x0100); p.imm(4,0x4000)
    p.imm(5,1); p.imm(6,'fill'); p.imm(7,'filled')
    p.label('fill'); p.store(4,1); p.alu('ADD',1,1,2); p.alu('ADD',4,4,5)
    p.alu('SUB',3,3,5); p.cmp(3,0); p.branch('BEQ',7); p.branch('JMP',6)
    p.label('filled'); p.imm(1,0xA55A); p.imm(3,0x0100); p.imm(4,0x4000)
    p.imm(6,'verify'); p.imm(7,'verified')
    p.label('verify'); p.load(2,4)
    p.check(2,1,'each of 256 RAM words matches independently regenerated pattern',expected_reg=True)
    p.imm(2,0x003D); p.alu('ADD',1,1,2); p.alu('ADD',4,4,5)
    p.alu('SUB',3,3,5); p.cmp(3,0); p.branch('BEQ',7); p.branch('JMP',6)
    p.label('verified'); p.imm(1,0x0100); p.check(1,0x0100,'all 256 words verified',result=0)
    p.imm(9,0x40FF); p.load(1,9); p.check(1,results[1][1],'last pattern word',result=1)
    p.imm(9,0x7000); p.imm(1,0x7100); p.store(9,1)
    p.imm(9,0x7100); p.imm(2,0x2468); p.store(9,2)
    p.load(1,9); p.alu('ADD',2,1,1)  # Immediate LOAD -> ADD dependency.
    p.check(2,0x48D0,'LOAD immediately followed by ADD on both operands',result=2)
    p.imm(9,0x7000); p.load(1,9); p.load(2,1)  # LOAD -> LOAD address.
    p.check(2,0x2468,'loaded pointer immediately feeds next LOAD address',result=3)
    p.imm(9,0x7100); p.imm(4,0x7200); p.load(1,9); p.store(4,1)
    p.load(2,4); p.check(2,0x2468,'loaded data immediately feeds STORE',result=4)
    p.imm(9,0x7100); p.store(9,0)  # Poison the destination before testing this path.
    p.imm(9,0x7000); p.imm(2,0x2468); p.load(1,9); p.store(1,2)
    p.imm(9,0x7100); p.load(1,9); p.check(1,0x2468,'loaded pointer immediately feeds STORE address')
    # Write all addresses before reading any, so address aliasing is observable.
    for i,address in enumerate(boundaries):
        p.imm(9,address); p.imm(1,0x5100+i*0x0111); p.store(9,1)
    for i,address in enumerate(boundaries):
        p.imm(9,address); p.load(1,9)
        p.check(1,0x5100+i*0x0111,f'word address {address:04X} stays distinct',result=5+i)
    p.finish(); return p

def jumps():
    p=Program('05_jumps_and_calls','BRANCHES CALLS AND 32K ROM',[
        ('CONDITIONS',10),('FLUSHED STORE',0),('FLUSHED REGISTER',0),
        ('ALU JUMP TARGET',0x1111),('LOAD JUMP TARGET',0x2222),
        ('FUNCTION RETURNS',3),('LAST ROM RETURN',0x7FFF)])
    p.boot()
    cases=[('BEQ',7,7,True),('BEQ',7,8,False),
           ('BLT',2,3,True),('BLT',3,2,False),('BLT',0,0,False),
           ('BLT',0xFFFF,0,True),('BLT',0,0xFFFF,False),
           ('BLT',0x8000,1,True),('BLT',0x7FFF,0xFFFF,False),('BLT',0x8000,0x7FFF,True)]
    for i,(op,a,b,taken) in enumerate(cases):
        check_id=len(p.checks)+1
        p.checks.append({'id':check_id,'description':f'{op}: {a:04X}, {b:04X}, taken={taken}'})
        p.imm(1,a); p.imm(2,b); p.imm(10,check_id)
        p.imm(9,0x30F2); p.store(9,1); p.imm(9,0x30F3); p.store(9,2)
        p.imm(11,f'condition_{i}_ok' if taken else 'failure')
        p.cmp(1,2); p.branch(op,11)
        if taken: p.jump('failure')
        p.label(f'condition_{i}_ok')
    p.imm(1,10); p.check(1,10,'ten signed/equality branch cases completed',result=0)
    p.imm(9,0x6000); p.store(9,0); p.imm(1,0xDEAD); p.imm(3,0)
    p.imm(11,'flush_landing'); p.branch('JMP',11)
    p.store(9,1); p.alu('ADD',3,1,1)
    p.label('flush_landing'); p.load(1,9)
    p.check(1,0,'taken jump flushes wrong-path STORE',result=1)
    p.check(3,0,'taken jump flushes wrong-path register write',result=2)
    p.imm(5,1); p.imm(1,'alu_target_minus_one'); p.alu('ADD',1,1,5); p.branch('JMP',1)
    p.jump('failure')
    p.label('alu_target_minus_one'); p.emit(0,'NOP')
    p.label('alu_target'); p.imm(2,0x1111)
    p.check(2,0x1111,'ADD result immediately used as JMP target',result=3)
    p.imm(9,0x6001); p.imm(2,'loaded_target'); p.store(9,2)
    p.load(1,9); p.branch('JMP',1); p.jump('failure')
    p.label('loaded_target'); p.imm(2,0x2222)
    p.check(2,0x2222,'LOAD result immediately used as JMP target',result=4)
    p.imm(2,0); p.imm(5,1)
    for i,target in enumerate((0x1000,0x4000,0x4000)):
        p.imm(7,f'return_{i}'); p.imm(1,target); p.branch('JMP',1)
        p.jump('failure'); p.label(f'return_{i}')
    p.check(2,3,'one subroutine at 1000 and same subroutine called twice at 4000',result=5)
    p.imm(7,'return_last'); p.imm(1,0x7FFF); p.branch('JMP',1)
    p.jump('failure'); p.label('return_last')
    p.imm(2,0x7FFF); p.check(2,0x7FFF,'instruction at ROM 7FFF returns through R7',result=6)
    p.finish()
    p.org(0x1000); p.label('function_1000'); p.alu('ADD',2,2,5); p.branch('JMP',7)
    p.org(0x4000); p.label('function_4000'); p.alu('ADD',2,2,5); p.branch('JMP',7)
    p.org(0x7FFF); p.label('function_7fff'); p.branch('JMP',7)
    return p

def main():
    manifest=[]
    for build in (alu_test,fibonacci,math_loops,memory_test,jumps):
        p=build(); manifest.append(p.save())
        print(f'{p.name}: {len(p.words)} instruction words, {len(p.checks)} check sites')
    (OUT/'manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')

if __name__=='__main__': main()
