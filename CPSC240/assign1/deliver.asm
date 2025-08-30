;Software license
;Program Name:


;Author info
;Author name: Sola Lhim
;Author email: pooloom069@csu.fullerton.edu


;Program information
;Program name:
;Program languages:
;Date Program began:
;Date of last update:
;		 
;Purpose
;
;Project Information:
;Files: main.cpp deliver.asm run.sh
;Language: C86-64
;Status:


;Declaration

extern printf
extern scanf
extern strlen


; segment .data is where initialized data is declared
segment .data

float_format db "%4.2lf",0
ftom_mile db "Enter the miles driven from Fullerton to Mission Viejo: %4.2lf",0
ftom_speed db "Enter the average speed(miles per hour)of that leg of the trip: %4.2lf",0
mtol_mile db "Enter the miles driven from Mission viejo to Long Beach: %4.2lf",0
mtol_speed db "Enter the average spped(miles per hour)of that leg of the trip: %4.2lf",0
ltof_mile db "Enter the miles driven from Long Beach to Fullerton: %4.2lf",0
ltof_speed db "Enter the average speed(miles per hour)of that leg of the trip: %4.2lf",0

total_time db "The total driving time was %4.2lf hours",0
ave_speed db "The average speed was %4.2lf m/h",0


; segment .bss is where ruinitialized data is declared
segment .bss



; segment .text is the code
segment .text

; The header or label 'deliver' defines the initial program entry point
deliver:


;Save/back up the base pointer
push rbp
mov rbp, rsp

;Save back up the general purpose registers (GPRs)
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


; Implement function call here 

;Input miles to Fullerton to Mission Viejo
mov rax,0
mov rdi, ftom_mile
push qword -1
mov rsi,rsp 
call scanf

;Input average speed from F to M
mov rax,0
mov rdi, ftom_speed
push qword -1
mov rsi,rsp
call scanf

;Input miles to Mission Viejo to Long Beach
mov rax,0
mov rdi, mtol_mile
push qword -1
mov rsi, rsp
call scanf

;Input average speed form M to L
mov rax,0
mov rdi, mtol_speed
push qword -1
mov rsi,rsp
call scanf

;Input miles to Long Beach to Fullerton
mov rax,0
mov rdi, ltof_mile
push qword -1
mov rsi,rsp
call scanf

;Input speed to L to F
mov rax,0
mov rdi, ltof_speed
push qword -1
mov rsi,rsp
call scanf

;Output total driving time
mov rax,0
mov rdi, total_time
addsd xmm0, 
call printf

;Output average speed 
mov rax,0
mov rdi, ave_speed
call printf
 


; Pop the general Purpose Registers (GPRs) so the pointer can be restored to the top of the stack 
; and the values can be restored before this fuction was called.
; After all the pops are done, the stack will be back how it was before the function executed.
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

; Restore the base pointer
pop rbp

; Return
ret



	





