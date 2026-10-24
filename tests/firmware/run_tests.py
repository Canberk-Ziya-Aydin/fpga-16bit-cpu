#!/usr/bin/env python3
"""Reproduce the archived firmware RTL simulations with the repository sources."""
import argparse
import hashlib
import json
from pathlib import Path
import re
import subprocess


CPU_SOURCES = [
    "EX_block", "MEM_block", "WB_block", "REG_file", "ID_block", "IF_block",
    "IF_ID_reg", "ID_EX_reg", "EX_MEM_reg", "MEM_WB_reg", "data_forwarding_unit",
]
PROGRAMS = {
    "aes": ("firmware/aes/aes128_keyboard_vga.coe", "aes_tb"),
    "calculator": ("firmware/presentation/presentation_calculator.coe", "presentation_tb"),
    "animation": ("firmware/presentation/presentation_animation.coe", "presentation_tb"),
}


def coe_words(path, count):
    text = path.read_text(encoding="utf-8")
    radix = re.search(r"memory_initialization_radix\s*=\s*(\d+)\s*;", text, re.I)
    vector = re.search(r"memory_initialization_vector\s*=\s*(.*?)\s*;", text, re.I | re.S)
    if not radix or radix.group(1) != "16" or not vector:
        raise ValueError(f"Expected a radix-16 COE: {path}")
    tokens = [word.strip() for word in vector.group(1).split(",")]
    if len(tokens) != count or any(not re.fullmatch(r"[0-9a-fA-F]{4}", word) for word in tokens):
        raise ValueError(f"Expected {count} 16-bit words: {path}")
    return [int(word, 16) for word in tokens]


def write_words(path, words):
    path.write_bytes("".join(f"{word:04X}\n" for word in words).encode("ascii"))


def check_hash(path, expected):
    actual = hashlib.sha256(path.read_bytes()).hexdigest()
    if actual != expected:
        raise ValueError(f"Fixture differs from the archived simulation: {path}")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--ghdl", default="ghdl", help="GHDL executable, or its full path")
    parser.add_argument("--only", nargs="+", choices=PROGRAMS, help="Run only the named cases")
    parser.add_argument("--work-dir", type=Path, help="Output directory (default: build/firmware-tests)")
    args = parser.parse_args()
    tests = Path(__file__).resolve().parent
    repo = tests.parent.parent
    work = args.work_dir.resolve() if args.work_dir else repo / "build/firmware-tests"
    fixtures = json.loads((tests / "fixtures.json").read_text(encoding="utf-8"))["cases"]
    sources = [repo / "rtl/cpu" / f"{name}.vhd" for name in CPU_SOURCES]
    sources += [repo / "rtl/io" / f"{name}.vhd" for name in
                ("fifo_buffer", "ps2_scancode_filter", "fifo_bram_mux")]
    sources.append(repo / "rtl/video/vga_driver.vhd")
    font = coe_words(repo / "firmware/font/nitram_micro_font_5x5_512x16.coe", 512)
    presentation = json.loads((repo / "firmware/presentation/manifest.json").read_text(encoding="utf-8"))
    summary = []

    def command(arguments, directory, log):
        with log.open("w", encoding="utf-8") as output:
            result = subprocess.run([args.ghdl, *arguments], cwd=directory,
                                    stdout=output, stderr=subprocess.STDOUT)
        if result.returncode:
            raise RuntimeError(f"GHDL failed; see {log}\n{log.read_text(encoding='utf-8')}")

    for name in args.only or PROGRAMS:
        firmware, entity = PROGRAMS[name]
        fixture = fixtures[name]
        directory = work / name
        directory.mkdir(parents=True, exist_ok=True)
        bench = tests / fixture["testbench"]
        check_hash(bench, fixture["testbench_sha256"])
        words = coe_words(repo / firmware, 32768)
        if name == "animation":
            metadata = next(item for item in presentation if item["name"] == "presentation_animation")
            address = metadata["labels"]["delay_constant"]
            if words[address:address + 2] != [0x81FF, 0x91FF]:
                raise ValueError("Animation delay instructions changed; review the simulation fixture")
            # Original fixture: shorten only the FFFF software delay to 0008.
            words[address:address + 2] = [0x8108, 0x9100]
        write_words(directory / "rom_words.txt", words)
        write_words(directory / "font_words.txt", font)
        if name == "aes":
            tables = json.loads((repo / "firmware/aes/aes_tables.json").read_text(encoding="utf-8"))
            expected = "".join(f"{int(base, 16) + i:04X} {value:04X}\n"
                               for base, values in tables.items() for i, value in enumerate(values))
            (directory / "tables_expected.txt").write_bytes(expected.encode("ascii"))
        for filename, expected in fixture["inputs_sha256"].items():
            check_hash(directory / filename, expected)

        print(f"{name}: original fixture inputs verified; compiling repository RTL", flush=True)
        command(["-a", "--std=08", *(str(path) for path in sources), str(bench)],
                directory, directory / "compile.log")
        log = directory / "simulation.log"
        # Both presentation cases use the same entity name, with separate work libraries.
        command(["-r", "--std=08", entity, "--assert-level=error", "--stop-time=100ms"],
                directory, log)
        output = log.read_text(encoding="utf-8")
        marker = ("OVERALL PASS: AES-128 keyboard/VGA program" if name == "aes" else
                  "PASS: calculator keyboard" if name == "calculator" else "PASS: animated sprite")
        if marker not in output:
            raise RuntimeError(f"No completion PASS marker; see {log}")
        result = name + ": " + next(line.split("(report note):", 1)[-1].strip()
                                    for line in output.splitlines() if marker in line)
        print(result, flush=True)
        summary.append(result)
    (work / "summary.txt").write_text("\n".join(summary) + "\n", encoding="utf-8")
    print(f"All {len(summary)} selected firmware simulations passed. Logs: {work}")


if __name__ == "__main__":
    main()
