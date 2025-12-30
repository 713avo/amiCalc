# AmiCalc

## About
AmiCalc 1.3 is a Workbench/Intuition native scientific calculator that fits comfortably on any Kickstart 1.3 desktop. The repository ships with the full C source plus the compiled binary and icon so it can be copied directly to real hardware or an emulator. The goal is to provide a classic button-driven experience with menus for constants, view modes, and configuration without relying on external utilities.

## Key features
- Compact Intuition UI (300x200 px) with dedicated clusters for scientific and numeric keys.
- `Inv` toggle that swaps between direct and inverse functions (`sin`/`asin`, `cos`/`acos`, `tan`/`atan`, `ln`/`exp`, `log`/`10^x`, `sqrt`/`x^2`, `x^y`/`y`th root, `e^x`/`ln`).
- Full arithmetic toolkit: `+`, `-`, `*`, `/`, `x^y`, `e^x`, `Exp`, sign change, `%`, `n!`, parentheses, and backspace.
- **Constantes** menu to inject pi or e at double precision.
- **Modo** menu that switches trigonometric functions between radians and degrees.
- **Vista** menu that toggles a live expression readout so you can confirm precedence and parentheses.
- Error readouts (`ERR`) whenever invalid inputs are detected (negative roots, non-integer factorials, overflow, division by zero, etc.).

## Requirements
- [VBCC](http://sun.hasenbraten.de/vbcc/) compiler accessible via `vc` or through the `VBCC_ROOT` environment variable.
- Amiga NDK 1.3 headers; set the `NDK` variable (defaults to `$(HOME)/Amiga/NDK_1.3`) or override `NDK_INC` to point at your installation.
- Standard Intuition and Graphics libraries present on the Amiga system where the binary will run.

## Building
1. Export `VBCC_ROOT` if `vc` is not already in your `PATH`:
   ```bash
   export VBCC_ROOT=/path/to/vbcc
   ```
2. (Optional) Target a different Kickstart flavor by passing `TARGET` (defaults to `kick13`):
   ```bash
   make TARGET=kick20
   ```
3. Build the project from the repo root:
   ```bash
   make
   ```
   The rule runs `vc` with the flags in `Makefile` and produces `amicalc` plus the accompanying `amicalc.info`.
4. Remove build artifacts with:
   ```bash
   make clean
   ```

## Running on Amiga
1. Copy `amicalc` and `amicalc.info` to a directory on your Workbench volume (physical machine or emulator).
2. Launch from Workbench via double-click or from CLI (`execute amicalc`). A window titled **AmiCalc 1.3** opens on the Workbench screen.
3. The layout is tuned for Kickstart/Workbench 1.3, but it also works on later versions as long as Intuition and Graphics libraries are available.

## Usage notes
- Enter numbers with the keypad and press `Exp` to append an exponent for scientific notation (`mantissa e exponent`).
- `C` clears every register and expression, while `<-` deletes the last character.
- Pressing `Inv` flashes the `INV` prefix in expression view to remind you that the scientific keys now use their alternate behaviors. `x^y` combined with `Inv` calculates the y-th root of the left operand.
- `%` divides the current value by 100; `n!` computes factorials for integers 0 through 170.
- Trigonometric functions honor the RAD/DEG option selected in the **Modo** menu.
- Enable **Vista → Expresion** to see the algebraic string that is being evaluated in real time, which helps debug parentheses-heavy formulas.

## Repository layout
- `amicalc.c` – complete calculator implementation including math core, Intuition drawing code, and menu handling.
- `amicalc` – prebuilt AmiCalc 1.3 binary ready to copy to Workbench.
- `amicalc.info` – Workbench icon for the executable.
- `Makefile` – VBCC/NDK build rules and overridable variables (`TARGET`, `VBCC_ROOT`, `NDK`, `NDK_INC`).

## License
No explicit license file is included. If you plan to redistribute or modify the code, coordinate with the original author or add the appropriate license file before publishing derived builds.
