;Software license
;Program Name: Vehicle Speed This program demonstrates.  Copyright (C) 2025  Sola Lhim

; This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  
; version 3 as published by the Free Software Foundation.                                                                    
; This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         
; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.      
; A copy of the GNU General Public License v3 is available here: <https://www.gnu.org/licenses/>.

; Author Information:
;Author name: Sola Lhim
;Author email: pooloom069@csu.fullerton.edu


;Program information
;Program name: Vehicle Speed
;Program languages: C86-64
;Date Program began: 08/25/2025
;Date of last update: 
;		 
;Purpose:
;The educational purpose of this program is to teach the fundamental tools of programming in X86
;assembly language. These fundamental tools include partitioning the solution into multiple files,
;developing a bash file to manage translation and execution, introduction to the floating point registers
;better known as xmm registers, and the use of library functions within assembly code.
;The application purpose is to aid a delivery service find total driving time and average road speed of one
;of it delivery trucks.
;
;Project Information:
;American Express Delivery Service is trucking company that delivers high value cargo to commercial
;clients. It operates several routes in LA, Orange, and San Diego counties. One route goes from Fullerton
;to Mission Viejo to Long Beach and back to Fullerton. We focus on that one route.
;For each leg of the trip the GPS unit records the distance traveled and the average speed. Those numbers
;become inputs for this program. The program will then compute the total driving time and the average
;speed for the entire trip.
;The distance in miles for one specific leg of the trip will vary with the route chosen by the driver.
;Files: main.cpp deliver.asm run.sh
;Language: C86-64
;Status:


;Declaration

extern printf
extern scanf
global deliver

; segment .data is where initialized data is declared
segment .data


; input output format string 
format_in db "%lf",0
format_out db "%.2f",0

ftom_mile db "Enter the miles driven from Fullerton to Mission Viejo: ",0
ftom_speed db "Enter the average speed(miles per hour)of that leg of the trip: ",0
mtol_mile db "Enter the miles driven from Mission viejo to Long Beach: ",0
mtol_speed db "Enter the average spped(miles per hour)of that leg of the trip: ",0
ltof_mile db "Enter the miles driven from Long Beach to Fullerton: ",0
ltof_speed db "Enter the average speed(miles per hour)of that leg of the trip: ",0

total_time db "The total driving time was %.2f hours",10,0
ave_speed db "The average speed was %.2f m/h",10,0


; segment .bss is where ruinitialized data is declared
segment .bss


; segment .text is the code
segment .text

; The header or label 'deliver' defines the initial program entry point

;Save back up the general purpose registers (GPRs)
%macro backup 0
push rbx
push rcx
push rdx
push rdi
push rsi
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
pushf
%endmacro

%macro restore 0
popf
pop r15
pop r14
pop r13
pop r12
pop r11
pop r10
pop r9
pop r8
pop rsi
pop rdi
pop rdx
pop rcx
pop rbx
%endmacro 


deliver:

push rbp
mov rbp, rsp
backup


;Input miles to Fullerton to Mission Viejo
;print prompt
mov rdi, ftom_mile
xor eax, eax
call printf

;real value
sub rsp,8           ;reserve 8 bytes for a double
mov rdi, format_in  
mov rsi, rsp        ;address of that space
xor eax, eax
call scanf

movsd xmm15,[rsp]   ; load the double value in xmm15
add rsp, 8          ; clean up stack

;Input miles to Mission Viejo to Long Beach
;print prompt
mov rdi, mtol_mile
xor eax, eax
call printf

;real value
sub rsp,8
mov rdi, format_in
mov rsi, rsp
xor eax, eax
call scanf

movsd xmm14, [rsp]
add rsp, 8

;Input miles to Long Beach to Fullerton
mov rdi, ltof_mile
xor eax, eax
call printf

;real value
sub rsp, 8
mov rdi, format_in
mov rsi, rsp
xor eax, eax
call scanf

movsd xmm13, [rsp]
add rsp, 8

;Input average speed from F to M
;print prompt
mov rdi, ftom_speed
xor eax, eax
call printf

;real value
sub rsp, 8
mov rdi, format_in
mov rsi, rsp
xor eax,eax
call scanf

movsd xmm8,[rsp]
add rsp, 8


;Input average speed form M to L
mov rdi, mtol_speed
xor eax, eax
call printf

;real value
sub rsp,8
mov rdi, format_in
mov rsi, rsp
xor eax, eax
call scanf

movsd xmm9, [rsp]
add rsp, 8


;Input speed to L to F
;print prompt
mov rdi, ltof_speed
xor eax, eax
call printf

;real value
sub rsp, 8
mov rdi, format_in
mov rsi, rsp
xor eax, eax
call scanf

movsd xmm10, [rsp]
add rsp, 8

; Computation
xorpd xmm12, xmm12  
addsd xmm12, xmm15
addsd xmm12, xmm14 
addsd xmm12, xmm13  ; xmm12 = total distance

movapd xmm0, xmm15  ; copy d1 into xmm0
divsd xmm0, xmm8    ;time ftom  

movapd xmm1, xmm14
divsd xmm1, xmm9    ; time mtol

movapd xmm2, xmm13
divsd xmm2, xmm10   ; time ltof

xorpd xmm3, xmm3 
addsd xmm3, xmm0
addsd xmm3, xmm1 
addsd xmm3, xmm2    ; xmm3= total time 

movapd xmm11, xmm12
divsd xmm11,xmm3    ; xmm11 =average speed


;Output total driving time
;print prompt
mov rdi, total_time

movapd xmm0,xmm3 ; total time 
xor eax, eax
call printf

;Output average speed 
mov rdi, ave_speed
movapd xmm0,xmm11
xor eax, eax
call printf
 
restore  ; pop 
pop rbp
ret  ; Return	
