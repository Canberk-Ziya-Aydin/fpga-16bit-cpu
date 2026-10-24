# Standalone VGA regression

`tb_vga_driver.vhd` exercises the driver against synchronous one-clock RAM
models. It checks every pixel for two frames, RGB hold timing, blanking, sync
pulses, memory addresses, glyph packing, content changes and reset behavior.

With GHDL on PATH, from the repository root:

```sh
mkdir -p build/vga-tests
cd build/vga-tests
ghdl -a --std=08 ../../rtl/video/vga_driver.vhd ../../tests/vga/tb_vga_driver.vhd
ghdl -r --std=08 tb_vga_driver --assert-level=error
```

In Vivado's Tcl console, use the full paths on your computer:

```tcl
source {/path/to/repository/tests/vga/vga_regression.tcl}
vga_test::run {/path/to/repository/rtl/video/vga_driver.vhd}
```

Pass the driver path explicitly: the original standalone runner defaults to a
driver beside the testbench, while this repository keeps it under `rtl/video`.
`test_results.txt` records the original standalone verification; package checks
are recorded in `docs/validation.md`.
