#!/bin/bash

# Author: Sola Lhim
# Program Name: Assignment1 
# Purpose: 

set -e
echo "Remove old executable files if there are any"
rm *.out

echo "Assenble the X86 file deliver.asm"
nasm -f elf64 -o deliver.o deliver.asm

echo "Compile the C++ file main.cpp"
g++ -c -m64 -Wall -no-pie -std=c++17 -o main.o main.cpp

echo "Link the two 'o' files main.o deliver.o"
g++ -m64 -no-pie -std=c++17 -o assign1.out main.o deliver.o

echo "Next ""assignment1 program"" will run"
./assignment1.out

 

