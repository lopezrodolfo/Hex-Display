# Seven-Segment Hexadecimal Display

This project implements a 7-segment display that takes a 4-bit input representing a hexadecimal number and displays the corresponding character. The implementation uses a hexadecimal decoder created with Verilog case statements.

## Authors

- CEO: Frank Veldhuizen
- PM: Rodolfo Lopez
- Dev: Samuel Cacnio
- Tester: Tyson Aramaki

# Date

10/2/22

## Features

- Converts 4-bit hexadecimal input to 7-segment display output
- Implemented on UPduino3 FPGA board
- Includes debug LEDs and onboard RGB LED functionality

## File Structure

- `top.v`: Main Verilog module containing the hexadecimal decoder and display logic
- `upduino3.pcf`: Pin configuration file for the UPduino3 board
- `Makefile`: Build and upload instructions for the project

## Build and Upload

To build and upload the project to the UPduino3 board:

1. Ensure you have the necessary tools installed (Yosys, nextpnr-ice40, icepack, iceprog)
2. Run `make upload` in the project directory

## Acknowledgements

The starter code was written by Professor Chuck Pateros. Our team:

- Created consolidated truth tables for all segments for upside up and upside down
- Consolidated single number case statements into one case
- Confirmed all possible hex input sequences for each segment
