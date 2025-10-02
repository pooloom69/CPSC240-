#!/bin/bash

# Author: Sola Lhim
# Program Name: CPSC240-13 Assignment 3 - GDB Learning Place
# Description: This script assembles, compiles, links, and runs the Assignment 3 program.

set -e

echo "Remove old executable files if there are any"
rm -f *.o assignment3

echo "Assemble the X86 files..."
nasm -f elf64 manager.asm      -o manager.o
nasm -f elf64 input_array.asm  -o input_array.o
nasm -f elf64 output_array.asm -o output_array.o
nasm -f elf64 sum.asm          -o sum.o
nasm -f elf64 swap.asm         -o swap.o

echo "Compile the C files..."
gcc -c driver.c -o driver.o
gcc -c sort.c   -o sort.o

echo "Link object files into executable"
gcc -no-pie driver.o manager.o input_array.o output_array.o sum.o swap.o sort.o -o assignment3

echo "Next, the assignment3 program will run"
./assignment3
