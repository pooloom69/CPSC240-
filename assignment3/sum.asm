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
; Program name: sum.asm
; Program languages: C86-64
; Date Program began: 09/29/2025
; Date of last update: //2025
;		 
; Purpose:
; Computes arithmetic sum of the array.
; Iterates through array values (64-bit floats).
; Accumulates total using XMM registers.
; Returns the sum to the manager and then executive.
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


; Declaration


; External functions 

global sum

; segment .data is where initialized data is declared
segment .data




; segment .bss is where uninitialized data is declared
segment .bss

; segment .text is the code
segment .text

; The header or label 'deliver' defines the initial program entry point
sum: