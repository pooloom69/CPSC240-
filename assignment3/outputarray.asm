; ****************************************************************************************************************************
;  Project name: "Gnu Debugger".  
;  This program demonstrates how to make an assembly program that teaches all of the following(Purpose):
;  This project develops a mixed-language program that integrates C/C++ functions with x86-64 assembly routines in order to 
;  create a workspace for GDB exploration. The program accepts an array of floating-point numbers from the user, 
;  computes their sum, sorts the values, and outputs the results.                                                          *
;  This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;  version 3 as published by the Free Software Foundation.                                                                    *
;  This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
;  warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;  A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
; ****************************************************************************************************************************
;
;  Author Information:
;  Author name    : Sola Lhim
;  Author email   : pooloom069@csu.fullerton.edu
;  Author CWID    : 830259727 
; 
;  Program information
;  Program name: Gnu Debugger
;  Program languages: C86-64
;  Date Program began: 09/29/2025
;  Date of last update: 10//2025
; 		 
; 
;  Project Information:
;  The primary purpose of this project is to provide a structured environment for learning and practicing the GNU Debugger (GDB). 
;  While previous assignments focused on building functional x86-64 assembly and C/C++ programs, 
;  this assignment emphasizes the debugging process—setting breakpoints, stepping through code, examining registers and memory, 
;  and observing program behavior at runtime. By reusing and extending earlier functions (such as inputarray, outputarray, and sum), 
;  students can focus on mastering GDB commands and techniques in the context of a working program.
; 
; 
;  Files: outputarray.asm
;  Language: C86-64
;  Status: The program has been tested extensively with no detectable errors.
; 
; ===== Begin code area ====================================================================================================================================================
%include "data.inc"

; External functions 
extern printf
global outputarray

; segment .data is where initialized data is declared
segment .data
input db "%.1f",10,0

; segment .bss is where uninitialized data is declared
segment .bss


; segment .text is the code
segment .text

; The header or label 'deliver' defines the initial program entry point
outputarray:

; Macro backs up the GPRs
backup

; Save incoming double values
mov r13, rdi    ; r13= array for float 
mov r14, rsi    ; r14= size of array 
mov r15, 0      ; r15= counter = 0 

loop:
; Check the array is
cmp r15,r14 ; if r15 >= length of array
jge done

; load current double into the array xmm0
movsd xmm0, [r13+r15*8]
mov rdi, input
xor rax,1
call printf

inc r15
jmp loop


; Restore original values to general registers
done:
restore 
ret     
