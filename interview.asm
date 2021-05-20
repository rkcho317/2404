;***************************************************************************************************************************
;Program name: "King of Assembly".  This program demonstrates how to pass user inputs to generate different messages                        *
;to an X86 function, and into a C++ main function.   Copyright (C) 2021 Rosa Cho                                                                             *
;This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License  *
;version 3 as published by the Free Software Foundation.                                                                    *
;This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied         *
;warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.     *
;A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                           *
;****************************************************************************************************************************



;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**

;Author information
;  Author name: Rosa Cho
;  Author email: rkcho317@fullerton.edu
;
;Program information
;  Program name: King of Assembly 
;  Programming languages: Main function in C++; string and char input/output functions in X86-64
;  Date program initiated: 2021-Apr-12
;  Date last updated: 2021-May-16
;  Files in the program: main.cpp, interview.asm, run.sh
;
;Purpose
;
;
;This file
;  File name: interview.asm
;  Language: X86-64
;  Syntax: Intel
;  Assemble: nasm -f elf64 -l interview.lis -o interview.o interview.asm
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
;
;Author information
;  Author name: Rosa Cho
;  Author email: rkcho317@fullerton.edu
;
;Program information
;  Program name: interview.asm
;  Programming languages: X86 with one module in C++
;  Date program began: 2021-Apr-12
;  Date of last update: 2021-May-16
;
;Purpose
;  The intent of this program is to show some of the basic tools or techniques for working with user inputs of strings (with embedded white space) and chars then output the results to a txt file.
;
;Project information
;  Project files: main.cpp, interview.asm, run.sh
;  Status: Available for public review.
;
;Translator information
;  Linux: nasm -f elf64 -l interview.lis -o interview.o interview.asm
;
;
;
;
;========1=========2=========3=========4=========5=========6=========7=========8=========9=========0=========1=========2=========3=========4=========5=========6=========7**
;
extern printf
extern scanf

global interview

segment .data

info db "Hello %s. I am Ms Fenster. The interview will begin now.",10,0
salary db "Wow! %5.2lf That's a lot of cash.", 10,0
who db "Who do you think you are, Chris Sawyer (y or n)?: %c", 10,0
compy db "Were you a computer science major (y or n)?: %c ",10, 0
elec1 db "Alright.  Now we will work on your electricity.", 10,0
res1 db "Please enter the resistance of circuit #1 in ohms: %5.3lf", 10,0
res2 db "What is the resistance of circuit #2 in ohms: %5.3lf", 10,0
res3 db "The total resistance is %5.3lf Ohms.", 10,0 
thanks db "Thank you. Please follow the exit signs to the front desk.", 10,0

resans1 db "%lf",0 ;answer to res1
resans2 db "%lf",0 ;answer to res2

compyq db "%s",0 ;answer to the computer science major question
chrisq db "%s",0 ;answer to the Chris Sawyer question
stringformat db "%s", 0

compscisal dq 88000.88
chrissal dq 1000000.00
socialsal dq 1200.12
one1 dq 1.0

segment .bss


segment .text

interview:
;Backup registers

push rbp
mov rbp, rsp
push rdi
push rsi
push rdx
push rcx
push r8
push r9
push r10
push r11
push r12
push r13
push r14
push r15
push rbx
pushf

push qword -1

 ;Move values from cpp to stack
 mov r15, rdi ;string Name
 movsd xmm15, xmm0 ;double Salary

;Print "Hello __ I am Ms Fenster. The Interview will begin" message
push qword 0
mov qword rax,0
mov qword rdi, info
mov qword rsi, r15
call printf
pop rax


;Print "wow that's a lot of cash!" with salary
push qword 0
mov rax, 1
mov rdi, salary
movsd xmm0, xmm15
call printf 
pop rax

;Print "Are you Chris Sawyer?" 
mov rdi, who
mov qword rax, 0
call printf
pop rax

;Answer the Chris Sawyer Question
mov rax, 0
mov rdi, chrisq  ;%s
mov rsi, rsp
call scanf

;Compare if answer is 'y' or 'n'
mov r14, 'y'
cmp [rsp], r14
je chris_yes
jne chris_no

;If yes to Chris Sawyer
chris_yes:
movsd xmm15, [chrissal]
jmp final

;If no to Chris Sawyer
chris_no:
jmp electricity


;===BEGIN ELECTRICITY TEST===
electricity: 
;Print Message that begins the Electricity Test
mov rdi, elec1
mov qword rax,0
call printf 

;Print Question 1
mov rdi, res1
mov qword rax, 0 
call printf 

;Accept Answer for Q1
mov rax,0
mov rdi, resans1  ;%lf
mov rsi,rsp
call scanf
movsd xmm10,[rsp]

;Print Question 2
mov rdi, res2
mov qword rax, 0 
call printf 

;Accept Answer for Q2
mov rax,0
mov rdi, resans2 ;%lf
mov rsi, rsp
call scanf
movsd xmm11, [rsp]

;Calculate Total Resistance
mov rax, 0
movsd xmm12, xmm10
movsd xmm1, [one1]
divsd xmm1, xmm12 ;1/resans1 
movsd xmm12, xmm1
movsd xmm2,[one1]
movsd xmm13, xmm11
divsd xmm2, xmm13 ;1/resans2
movsd xmm13, xmm2
addsd xmm13,xmm12
movsd xmm3,[one1]
divsd xmm3, xmm13 ; 1/(1/r1 + 1/r2) = total resistance
movsd xmm13, xmm3 ;the Total resistance

;Print Total Resistance 
mov rax,1
mov rdi, res3
movsd xmm0, xmm13
call printf

;== Are you a Computer Science Major Block ==
major:
;Print Computer Science Major Question
mov rax, 0
mov rdi, compy
call printf
pop rax

;Accept answer to the CS Major Question
push qword  99
mov rax, 0
mov rdi, compyq ;%s
mov rsi, rsp
call scanf

;Compare if answer is 'y' or 'n'
mov rax, 121
cmp rax, [rsp]
jne cs_no

;If yes to Computer Science major
movsd xmm15, [compscisal]
jmp final

;If no to Computer science major
cs_no:
movsd xmm15, [socialsal] 

; == FINAL prints a final message and sends a code to the main.cpp == 
final: 
;Thank you message
push qword 0
mov rax, 0
mov rdi, thanks

call printf
 pop rax
 movsd xmm0,xmm15 ;Sends a code to the main.cpp 
 popf                                                 
 pop rbx                                                     
 pop r15                                                     
 pop r14                                                      
 pop r13                                                      
 pop r12                                                      
 pop r11                                                     
 pop r10                                                     
 pop r9                                                      
 pop r8                                                      
 pop rcx                                                     
 pop rdx                                                     
 pop rsi                                                     
 pop rdi                                                     
 pop rbp

ret