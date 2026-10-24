# Firmware RTL simulations

These are the original testbenches behind the archived AES, calculator and
animation logs. They were written and run by ChatGPT/Codex, and were omitted
from the initial repository upload. The three VHDL files are restored unchanged.

From the repository root, with Python 3 and GHDL on PATH:

```sh
python tests/firmware/run_tests.py
```

To run one case or supply a GHDL executable explicitly:

```sh
python tests/firmware/run_tests.py --only aes --ghdl /path/to/ghdl
```

The runner compiles the eleven CPU modules, keyboard filter, FIFO, memory mux
and VGA driver from `rtl/`. ROM/RAM are behavioral synchronous one-clock models.
Scan codes enter at the deserializer output; these tests do not check PS/2 pin
timing, generated vendor BRAM or implementation timing. No Vivado installation
or Python packages beyond the standard library are needed for these runs.

| Case | Original testbench | Archived log |
|---|---|---|
| AES-128 | [aes/aes_tb.vhd](aes/aes_tb.vhd) | [pipeline_simulation.log](../../firmware/aes/pipeline_simulation.log) |
| Calculator | [calculator/presentation_tb.vhd](calculator/presentation_tb.vhd) | [presentation_calculator.log](../../firmware/presentation/simulation_logs/presentation_calculator.log) |
| Animation | [animation/presentation_tb.vhd](animation/presentation_tb.vhd) | [presentation_animation.log](../../firmware/presentation/simulation_logs/presentation_animation.log) |

The input text files are generated from the repository COEs and AES table JSON.
AES and calculator use the exact delivered ROMs. Animation uses the original
simulation shortcut: only the two instructions at `04F1`/`04F2` change from
`81FF 91FF` to `8108 9100`, reducing the software delay from `FFFF` to `0008`.
The hardware COE stays unchanged. Calculator and animation share an entity name
and therefore run in separate work directories.

`fixtures.json` records SHA-256 hashes of the original testbenches, generated
inputs and archived logs. The runner checks the testbench/input hashes before
simulation. These fixtures target the included firmware revision; intentional
firmware changes require reviewing the checks and fixture hashes.

Fresh compile logs, simulation logs and screen RAM dumps go under
`build/firmware-tests/` by default. Use `--work-dir` to choose another location.
The archived logs are retained; fresh runs can differ in paths and line numbers.
Warnings at time zero can appear in a successful run. A final completion PASS
marker is required; assertions at error severity or higher fail the runner.

All three cases were rerun successfully with the repository RTL using GHDL
4.1.0 (mcode). Their reported results and simulated event times matched the
archived runs. Those rerun logs are saved in [simulation_logs](simulation_logs).
