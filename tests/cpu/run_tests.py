#!/usr/bin/env python3
"""Run the ROMs against the user's full CPU RTL in GHDL (VHDL-2008)."""
import argparse
import json
from pathlib import Path
import re
import subprocess
import tempfile

SOURCES=['EX_block','MEM_block','WB_block','REG_file','ID_block','IF_block',
         'IF_ID_reg','ID_EX_reg','EX_MEM_reg','MEM_WB_reg','data_forwarding_unit']

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--rtl-dir',required=True,type=Path,help='directory with the 11 CPU .vhd files')
    parser.add_argument('--ghdl',default='ghdl',help='GHDL executable')
    parser.add_argument('--work-dir',type=Path,help='optional directory for logs and generated simulation inputs')
    parser.add_argument('--only',nargs='+',help='run only these program names (without file extensions)')
    args=parser.parse_args()
    root=Path(__file__).resolve().parent
    rtl=args.rtl_dir.resolve()
    work=args.work_dir.resolve() if args.work_dir else Path(tempfile.mkdtemp(prefix='cpu_rom_tests_'))
    work.mkdir(parents=True,exist_ok=True)
    files=[rtl/f'{name}.vhd' for name in SOURCES]
    missing=[str(p) for p in files if not p.is_file()]
    if missing: parser.error('Missing RTL files: '+', '.join(missing))
    manifest=json.loads((root/'manifest.json').read_text())
    if args.only:
        unknown=set(args.only)-{item['name'] for item in manifest}
        if unknown: parser.error('Unknown program names: '+', '.join(sorted(unknown)))
        manifest=[item for item in manifest if item['name'] in args.only]

    def command(arguments,log):
        with log.open('w') as output:
            result=subprocess.run([args.ghdl]+arguments,cwd=work,stdout=output,stderr=subprocess.STDOUT)
        if result.returncode:
            print(log.read_text())
            raise SystemExit(f'FAILED: see {log}')

    command(['-a','--std=08']+[str(p) for p in files]+[str(root/'cpu_program_tb.vhd')],work/'compile.log')
    summary=[]
    for item in manifest:
        name=item['name']
        coe=(root/f'{name}.coe').read_text().split('memory_initialization_vector=')[1]
        words=re.findall(r'[0-9A-Fa-f]{4}',coe)
        assert len(words)==32768,name
        rom=work/f'{name}_rom.txt';rom.write_text('\n'.join(words)+'\n')
        expected={i:item['expected_screen'].get(str(i),0) for i in range(0x3000)}
        expected.update({r['address']:r['expected'] for r in item['results']})
        expected.update({0x30F0:0x600D,0x30F1:0,0x30F2:item['results'][-1]['expected'],
                         0x30F3:item['results'][-1]['expected'],0x30F4:0xCAFE})
        if name.startswith('04'):
            expected.update({0x4000+i:(0xA55A+i*0x003D)&0xFFFF for i in range(256)})
            expected.update({a:0x5100+i*0x0111 for i,a in enumerate((0x3FFF,0x4000,0x4001,0x7FFF,0x8000,0xBFFF,0xC000,0xDFFF))})
            expected.update({0x7000:0x7100,0x7100:0x2468,0x7200:0x2468})
        if name.startswith('05'):
            expected.update({0x6000:0,0x6001:item['labels']['loaded_target']})
        expected_file=work/f'{name}_expected.txt'
        expected_file.write_text(''.join(f'{a:04X} {v:04X}\n' for a,v in sorted(expected.items())))
        arguments=['-r','--std=08','cpu_program_tb',f'-gROM_FILE={rom}',f'-gEXPECTED_FILE={expected_file}',
                   '-gREQUIRE_LAST_ROM='+('true' if name.startswith('05') else 'false'),
                   '-gMIN_LOAD_STALLS='+('4' if name.startswith('04') else '1' if name.startswith('05') else '0'),
                   '--assert-level=error']
        log=work/f'{name}.log';command(arguments,log)
        match=re.search(r'PASS:.*',log.read_text())
        assert match,log
        result=name+': '+match.group(0)
        print(result);summary.append(result)
    (work/'summary.txt').write_text('\n'.join(summary)+'\n')
    print(f'All {len(manifest)} selected programs passed. Logs: '+str(work))

if __name__=='__main__': main()
