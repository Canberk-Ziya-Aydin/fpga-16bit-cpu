# My local GHDL test runs

I ran these tests on my Windows computer on **26 November 2026 (Istanbul time)**.
The terminal reported GHDL 6.0.0 (mcode, GNAT 15.2.0) and Python 3.14.
I supplied the resulting logs after running the separate local GHDL test bundle.
The bundle used source snapshot `1106c7ffb5a8f7933944b1059570c9eccf2be8aa`.
ChatGPT/Codex wrote the supplied testbenches and runners; I reproduced the runs.

| Suite | Result | Evidence |
|---|---|---|
| Five CPU programs | All PASS | [CPU summary](cpu/summary.txt) |
| AES-128 | PASS | [AES log](firmware/aes/simulation.log) |
| Calculator | PASS | [Calculator log](firmware/calculator/simulation.log) |
| Animation | PASS, 240 frames | [Animation log](firmware/animation/simulation.log) |
| Standalone VGA | PASS, 10,089,816 checks | [VGA log](vga/simulation.log) |

CPU logs retain the individual result counts, dependency stalls and ROM boundary
check. The firmware [summary](firmware/summary.txt) records all three completions.
The empty compile logs are retained: those compiler invocations emitted no output.
Time-zero numeric_std metavalue warnings occur in the firmware logs; the tests
continue to their final PASS markers without subsequent assertion errors.

## Source and input checks

The uploaded GHDL work-library metadata contains 62 source SHA-1 entries across
the suites. All 62 match the corresponding repository RTL/testbench bytes.
[evidence.json](evidence.json) records those hashes and log SHA-256 digests.
The logs use LF line endings in Git. Each log entry records the byte count and
digest for that committed copy, plus separate `original_upload_bytes` and
`original_upload_sha256` fields for the original Windows file with CRLF endings.
The five CPU ROM inputs match their repository COEs. AES and calculator use the
exact delivered ROMs. Animation changes only `04F1: 81FF -> 8108` and
`04F2: 91FF -> 9100` in generated simulation input, reducing the software
delay from `FFFF` to `0008`. Its hardware ROM and all RTL remain unchanged.

Only logs, summaries and this source/input record are included here. Generated
work-library caches, duplicate ROM/expected-input files and screen-RAM dumps
are omitted. Existing earlier logs remain in their original directories.

## Reproduce from the repository

With Python 3 and GHDL on PATH, run from the repository root:

```sh
python tests/cpu/run_tests.py --rtl-dir rtl/cpu --work-dir build/local-cpu
python tests/firmware/run_tests.py --work-dir build/local-firmware
```

Both Python runners accept `--ghdl "C:\Tools\bin\ghdl.exe"` if GHDL is
not on PATH. For standalone VGA in PowerShell, from the repository root:

```powershell
New-Item -ItemType Directory -Force build/local-vga | Out-Null
Push-Location build/local-vga
& "C:\Tools\bin\ghdl.exe" -a --std=08 ../../rtl/video/vga_driver.vhd ../../tests/vga/tb_vga_driver.vhd
& "C:\Tools\bin\ghdl.exe" -r --std=08 tb_vga_driver --assert-level=error
Pop-Location
```

Use the actual GHDL executable path on the computer running the tests.

## Scope

These are reruns of the existing fixtures. CPU tests use the full pipeline and
one-clock behavioral ROM/RAM. Firmware tests include CPU, keyboard filter/FIFO,
memory mux and VGA RTL, but inject scan codes at the deserializer output.
Standalone VGA tests check two complete frames and reset recovery.
They do not establish full test coverage, physical PS/2/VGA operation, vendor-IP
behavior or FPGA timing. They do not resolve the observed difference between
emulator colors/layout and physical monitor output.
