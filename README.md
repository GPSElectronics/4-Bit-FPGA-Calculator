# 4-Bit FPGA Calculator (ALU & 7-Segment Display)
![VHDL](https://img.shields.io/badge/VHDL-00599C?style=for-the-badge)
![Vivado](https://img.shields.io/badge/Vivado-222222?style=for-the-badge)
![Basys 3](https://img.shields.io/badge/Basys_3-FPGA-blue?style=for-the-badge)

## Description
This project consist of a 4-bit hardware calculator implemented on an FPGA using VHDL. It takes two 4-bit inputs (0 to 15 in decimal) via physical switches and performs arithmetic and logic operations (Addition, Subtraction, Bitwise AND, Bitwise OR) based on the user's selection. The result is  converted from binary to BCD (Binary-Coded Decimal) and displayed in real-time on a 4-digit 7-segment display.

## Logic 
This project does not relies on sequential logic, I only used combinational logic, with the exception of a single flip flop used in the operation button. Therefore here is the logic used in this project:
* **ALU (Arithmetic Logic Unit):** Acts as the brain, performing math and bitwise operations based on a 2-bit operation selector.
* **BCD Converter:** Converts the 4-bit and 5-bit binary results into separate ones and tens digits so they can be read as standard decimal numbers.
* **Clock Divider & Multiplexer:** Rapidly cycles through the 7-segment display anodes, creating the illusion that multiple numbers are turned on simultaneously.
* **Debouncer:** Cleans up physical button presses to prevent erratic mechanical bouncing from registering as multiple inputs.

## What I Learned & Implemented
* **Signal Routing & Concatenation:** Solving bit-width mismatches using concatenation (e.g., `'0' & a_in`).
* **Verification & Debugging:** Identifying synthesis vs. implementation errors, managing unconnected signals, and analyzing Vivado's Critical Warnings.
* **Bitwise Operations:** Understanding how hardware handles AND/OR operations bit-by-bit and outputs decimal representations.

## Hardware 
| FPGA Basys 3 | Function | Pins (XDC) |
| :--- | :--- | :--- |
| **Clock (`clk`)** | 100 MHz System Clock | `W5` |
| **Center Button (`btn`)** | Toggle Display (Result / Inputs) | `U18` |
| **Switches `a_in[3:0]`** | 4-bit Input A | `W17, W16, V16, V17` |
| **Switches `b_in[3:0]`** | 4-bit Input B | `W13, W14, V15, W15` |
| **Switches `operation[1:0]`** | 2-bit Operation Selector | `T3, V2` |
| **LED 0** | Operation Indicator (Bit 0) | `L1` |
| **LED 1** | Operation Indicator (Bit 1) | `V3` |
| **7-Seg Segments** | Cathodes A through G | `W7, W6, U8, V8, U5, V5, U7` |
| **7-Seg Anodes** | Digit Selectors (4 digits) | `W4, V4, U4, U2` |
