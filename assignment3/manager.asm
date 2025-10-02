;****************************************************************************************************************************
; Project name: "Gnu Debugger".  
; This program demonstrates how to make an assembly program that teaches all of the following:
; This project develops a mixed-language program that integrates C/C++ functions with x86-64 assembly routines in order to 
; create a workspace for GDB exploration. The program accepts an array of floating-point numbers from the user, 
; computes their sum, sorts the values, and outputs the results.                                                          *
; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
; version 3 as published by the Free Software Foundation.                                                                    *
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
; A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
;****************************************************************************************************************************

; Author Information:
; Author name    : Sola Lhim
; Author email   : pooloom069@csu.fullerton.edu
; Author CWID    : 830259727 
;
; Program information
; Program name: manager.asm
; Program languages: C86-64
; Date Program began: 09/29/2025
; Date of last update: //2025
;		 
; Purpose:
; Coordinator between modules.
; Calls inputarray to gather user’s numbers.
; Calls sum to compute total.
; Calls outputarray to print the entered numbers.
; Calls sort (C/C++) to arrange numbers in ascending order.
; Ensures the workflow follows the assignment diagram.
;
; Project Information:
; The primary purpose of this project is to provide a structured environment for learning and practicing the GNU Debugger (GDB). 
; While previous assignments focused on building functional x86-64 assembly and C/C++ programs, 
; this assignment emphasizes the debugging process—setting breakpoints, stepping through code, examining registers and memory, 
; and observing program behavior at runtime. By reusing and extending earlier functions (such as inputarray, outputarray, and sum), 
; students can focus on mastering GDB commands and techniques in the context of a working program.
;
;
; Files: driver.c, manager.asm, input_array.asm, output_array.asm, sum.as, swap.asm, sort.c data.inc, r.sh
; Language: C86-64
; Status: The program has been tested extensively with no detectable errors.
;
;
;===== Begin code area ====================================================================================================================================================
%include "data.inc"

; External functions 
extern stdin
extern scanf
extern printf
extern clearerr
extern input_array
extern output_array
extern sum
extern sort
extern swap
global manager

; segment .data is where initialized data is declared
segment .data

; 
input     db "%s", 0  
promptName db "Please enter your name: ",10,0
replyName db "Thank you %s." ,0
promptJob db "Please enter your future occupation: ",10,0
replyJob db "Thank you. We like %s ",10,0
promptFloatNum db "Please enter float numbers separated by ws, Press enter followed by cont-d to terminate. ",10,0
checkNum db "Thank you. You entered these numbers: ",10,0

; 
sumOfValues db "The sum of values in this array is %.f",10,0
descSort db "The array will now be sorted.",10,0
curArray db "These are the current values in the array: ",10,0
;
descTerminate db "This program will terminate",10,0
descMessage db "Have a nice day %s.",10,0
desc db "Invite a %s to come with you next time.",10,0





; segment .bss is where uninitialized data is declared
segment .bss
name   resq 50       
job   resq 50

arr resq 50

; segment .text is the code
segment .text

; The header or label 'deliver' defines the initial program entry point
manager:

; Macro backs up the GPRs
backup

; Ask user name 
mov rdi, promptName
xor rax, rax
call printf

; Scan into name 
mov rdi, input
mov rsi, name
xor rax, rax
call scanf


; Reply with user name
mov rdi, replyName
mov rsi, name 
xor rax, rax
call printf 


; Ask user occupation
mov rdi, promptJob
xor rax, rax
call printf

; Scan into job
mov rdi, input
mov rsi, job
xor rax, rax
call scanf


; Reply with user job
mov rdi, replyJob
mov rsi, job
xor rax, rax
call printf 


; Prompt float numbers separated by white space  + cont+d to terminate
mov rdi, promptFloatNum
xor rax, rax 
call printf 

mov rdi, [stdin]
call clearerr

; Read up doubles into arr
mov rdi, arr
mov rsi, 50
call input_array
mov r12, rax          ; count arr 


; Confirm number message and display doubles stored in the arr 
mov rdi, checkNum
mov rsi, r12
call output_array

; Introduce Sum of the values in arr 
mov rdi, sumOfValues
mov rsi, 
call printf 

; Call sum function to calculate sum of the values in arr 
mov rdi, arr    ; pointer to arr
mov rsi, r12    ; count 
call sum        ; xmm = result 
movq xmm1, xmm0 ; save result in xmm1 


; Introduce the array will be sorted 
mov rdi, descSort
xor rax, rax 
call printf

; Call sort function to sort the input array
mov rdi, arr 
mov rsi, r12 
call sort 

; List the sorted current array
mov rdi, curArray
mov rsi, r13
call output_array


; Program termination notice
mov rdi, descTerminate
xor rax, rax
call printf 

; Have a nice day with user name
mov rdi, descMessage
mov rsi, name 
xor rax, rax 
call printf 

; Message with user job
mov rdi, desc
mov rsi, job
xor rax, rax
call printf 


; Restore original values to general registers
restore 
ret     



