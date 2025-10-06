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
;  Files: inputarray.asm
;  Language: C86-64
;  Status: The program has been tested extensively with no detectable errors.
; 
; ===== Begin code area ====================================================================================================================================================
%include "data.inc"



; Declaration

extern strlen   ; computes length of a C-string
extern stdin    ; standard input file pointer
extern NULL
extern EOF
extern getchar  
extern fgets    ; read string from stdin
extern atof     ; convert ASCII to float
extern printf   

global inputarray

; segment .data is where initialized data is declared
segment .data
; empty


; segment .bss is where uninitialized data is declared
segment .bss
temp resb 20 ; temporary array which is size of 20 


; segment .text is the code
segment .text

inputarray:

; push and save all GPRs 
backup

; Save incoming double values
mov r13, rdi    ; r13= address of destination array
mov r14, rsi    ; r14= number of elements allowed total length
mov r15, 0      ; r15= counter =0 


; Begin the loop
begin_loop:
cmp r15,r14     ; is the array full? 
je finish_loop  ; if yes -> finish_loop


; Read in 1 float number from user 
mov rdi, temp    ; rdi = address of destination temp
mov rsi, 20     ; rsi = array size
mov rdx, [stdin]; rdx = stdin pointer
call fgets      ; fget(arr,20,stdin)

; check for ctrl+d /EOF 
cmp rax,0
je finish_loop  ; if EOF -> finish_loop

; Calculate the length of what user inputted, remove newline at the end
mov rdi,temp
call strlen     ;rax= length

; check the length =0 
cmp rax,0   ; if length is empty
je begin_loop     ; skip processing


mov rdx, rax    ;rdx= length   
dec rdx         ;rdx= length -1
mov al, [temp+rdx]   ; al = last char 
cmp al, 10  ; ASCII 10 == new line
jne done    ; if not newline skip replacement

mov byte[temp+rdx],0    ; replace \n -> \0

done:

; convert arr to xmm0
mov rdi, temp
call atof   ; xmm0 = result
movsd xmm1, xmm0 ; copy xmm0 to xmm1 for safety



; copy the newly input float into the next cell of array
lea r8, [r13+8*r15] ; compute address of element i
movsd [r8], xmm1    ; store double at that location 
inc r15             ; increment count
jmp begin_loop       ; if not full go to begin_loop 


; finish_loop
finish_loop:
mov rax, r15    ; rax= num of valid floats entered
restore         ; pop all GPRs 
ret             ; return to caller 




