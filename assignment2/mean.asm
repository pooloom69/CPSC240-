;****************************************************************************************************************************
;Program name: "Arrays".  This program demonstrates how to make an assembly program that teaches all of the following:
    =how to make an array
    =how to implement iteration
    =how to make professional looking programs
    =how to reject invalid inputs
    =add assembly programmer to your list of qualifications in your resume.  Copyright (C) 2021 Sola Lhim                                                                           *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.                                                                    *
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
;****************************************************************************************************************************


; Author Information:
; Author name    : Sola Lhim
; Author email   : pooloom069@csu.fullerton.edu
; Author CWID    : 830259727 


; Program information
; Program name: Arrays
; Program languages: C86-64
; Date Program began: 09/16/2025
; Date of last update: 09//2025
;		 
; Purpose:
; This program introduces key concepts of assembly language by demonstrating how to create and manipulate arrays, 
; implement iteration with loops, and enforce input validation. It emphasizes professional coding practices through clear structure, 
; consistent formatting, and meaningful documentation. By completing this project, the programmer gains hands-on experience in 
; low-level programming and can confidently include assembly programming as a technical qualification on their résumé.
;
; Project Information:

;
; Files: main.cpp deliver.asm run.sh data.inc
; Language: C86-64
; Status: The program has been tested extensively with no detectable errors.
;
;
;===== Begin code area ====================================================================================================================================================
%include "data.inc"


; Declaration

extern printf
extern scanf
global input_array

; segment .data is where initialized data is declared
segment .data



; segment .bss is where ruinitialized data is declared
segment .bss
; empty


; segment .text is the code
segment .text

; The header or label 'deliver' defines the initial program entry point
deliver:

backup




restore 
ret     ; Return	



