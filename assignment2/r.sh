#!/bin/bash

# Author: Sola Lhim
# Program Name: CPSC240-13 Assignment 2
# Purpose: 

set -e
echo "Remove old executable files if there are any"
rm -f *.out *.o

echo "Assemble the X86 file manager.asm"
nasm -f elf64 -o manager.o manager.asm

echo "Assemble the X86 file input_array.asm"
nasm -f elf64 -o input_array.o input_array.asm

echo "Assemble the X86 file append.asm"
nasm -f elf64 -o append.o append.asm

echo "Assemble the X86 file magnitude.asm"
nasm -f elf64 -o magnitude.o magnitude.asm

echo "Assemble the X86 file isfloat.asm"
nasm -f elf64 -o isfloat.o isfloat.asm

echo "Assemble the X86 file mean.asm"
nasm -f elf64 -o mean.o mean.asm

echo "Compile the C file display_array.c"
gcc -c display_array.c -o display_array.o 

echo "Compile the C file driver.c"
gcc -c driver.c -o driver.o 


echo "Link the 'o' files manager.o input_array.o append.o magnitude.o isfloat.o mean.o display_array.o"
gcc -no-pie driver.o manager.o input_array.o append.o magnitude.o isfloat.o mean.o display_array.o -o assignment2

echo "Next assignment1 program will run"
./assignment2