// ****************************************************************************************************************************
//  Project name: "Gnu Debugger".  
//  This program demonstrates how to make an assembly program that teaches all of the following(Purpose):
//  This project develops a mixed-language program that integrates C/C++ functions with x86-64 assembly routines in order to 
//  create a workspace for GDB exploration. The program accepts an array of floating-point numbers from the user, 
//  computes their sum, sorts the values, and outputs the results.                                                          *
//  This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
//  version 3 as published by the Free Software Foundation.                                                                    *
//  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
//  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
//  A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
// ****************************************************************************************************************************

//  Author Information:
//  Author name    : Sola Lhim
//  Author email   : pooloom069@csu.fullerton.edu
//  Author CWID    : 830259727 
// 
//  Program information
//  Program name: Gnu Debugger
//  Program languages: C86-64
//  Date Program began: 09/29/2025
//  Date of last update: 10//2025
// 		 
// 
//  Project Information:
//  The primary purpose of this project is to provide a structured environment for learning and practicing the GNU Debugger (GDB). 
//  While previous assignments focused on building functional x86-64 assembly and C/C++ programs, 
//  this assignment emphasizes the debugging process—setting breakpoints, stepping through code, examining registers and memory, 
//  and observing program behavior at runtime. By reusing and extending earlier functions (such as inputarray, outputarray, and sum), 
//  students can focus on mastering GDB commands and techniques in the context of a working program.
// 
// 
//  Files: input_array.asm
//  Language: C86-64
//  Status: The program has been tested extensively with no detectable errors.
// 
// ===== Begin code area ====================================================================================================================================================
%include "data.inc"


; Declaration

extern strlen
extern stdin
extern NULL
extern EOF
extern getchar
extern isfloat
extern fgets
extern atof
extern printf

global input_array

; segment .data is where initialized data is declared
segment .data



; segment .bss is where uninitialized data is declared
; create 3 arrays
segment .bss
arr resb 20 ; temporary array which is size of 20 


; segment .text is the code
segment .text

; The header or label 'deliver' defines the initial program entry point
input_array:

; Backup macro
backup

; Save incoming double values
mov r13, rdi    ; r13= array for float 
mov r14, rsi    ; r14= size of array 
mov r15, 0      ; r15= counts 

; if user inputs invalid data
; clean up after call to fgets
; if fgets returns 0 then it is time to exit check if user does Control+ D


; try_again 
try_again:
jmp begin_loop



; Begin the loop
begin_loop:
cmp r15,r14
je finish_loop


; Read in 1 float number
mov rdi, arr
mov rsi, 20
mov rdx, [stdin]
call fgets

; ctrl+d /EOF 
cmp rax,0
je finish_loop

; Calculate the length of what user inputted, remove newline
mov rdi,arr
call strlen     ;rax= len

; check the length =0 
cmp rax,0
je done


mov rdx, rax    ;rdx= len   
dec rdx         ;rdx= len -1
mov al, [arr+rdx]
cmp al, 10  ; 10 == new line
jne done

mov byte [arr+rdx],0    ; \n -> \0

done:

; check for valid float in arr
mov rax,0
mov rdi, arr
call isfloat

; test for Control + d
cmp rax,0
je try_again


; convert arr to xmm0
mov rax,0
mov rdi, arr
call atof


; if user input wasn't float go back to repeat and input valid float number

; copy the newly input float into the next cell of array
lea r8, [r13+8*r15]
movsd [r8], xmm0
inc r15
cmp r15,r14
jl begin_loop


; finish_loop
finish_loop:
mov rax, r15
restore 
ret




