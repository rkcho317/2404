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

name_size equ 100

global interview

segment .data

info db "Hello %s. I am Ms Fenster. The interview will begin now.",10,0
salary db "Wow! %5.3lf That's a lot of cash.", 10,0
who db "Who do you think you are, Chris Sawyer (y or n)?: %c", 10,0
compy db "Were you a computer science major (y or n)?: %c ",10, 0
elec1 db "Alright.  Now we will work on your electricity.", 10,0
res1 db "Please enter the resistance of circuit #1 in ohms: %5.3lf", 10,0
res2 db "What is the resistance of circuit #2 in ohms: %5.3lf", 10,0
res3 db "The total resistance is %5.3lf Ohms.", 10,0 
thanks db "Thank you. Please follow the exit signs to the front desk.", 10,0

resans1 db "%lf",0 ;answer to res1
resans2 db "%lf",0 ;answer to res2
resans3 db "%lf",0 ;answer to res3

compyq db "%c",0 ;answer to computer science major question

chrissal dq 1000000.00
socialsal dq 1200.12

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

push qword 0

 ;Move values from cpp to stack
 mov r15, rdi ;string Name
 movsd xmm15, xmm0 ;double Salary

;Print "who are you?" with name
push qword 0
mov qword rax,0
mov qword rdi, info
mov qword rsi, r15
call printf
pop rax

;Print "wow that's a lot of cash!" with salary
push qword 0
mov qword rax, 0
mov rdi, salary
mov rsi, rsp
call printf 
movsd xmm15, [rsp]
pop rax


;Print "Are you Chris Sawyer?" 
push qword 0
mov qword rax, 0
mov rdi, who
call printf
pop rax

;Answer the Chris Sawyer Question
push qword 0
mov rax,0
mov rdi, chrisq
mov rdi, rsp
call scanf 

;If yes to Chris Sawyer
cmp rdi, 'y'
movsd xmm0, [chrissal]
movsd xmm15, xmm0
jmp final

;If no to Chris Sawyer
cmp rdi, 'n'
jmp major

;===BEGIN ELECTRICITY TEST===
electricity: 

;Print Message that begins the Electricity Test
push qword 0
mov qword rax,0
mov rdi, elec1
call printf 
pop rax

;Print Question 1
push qword 0
mov qword rax, 0 
mov rdi, res1
call printf 
pop rax

;Accept Answer for Q1
push qword 0
mov rax, 0
mov rdi, resans1
mov rdi, xmm0 
call scanf

;Print Question 2
push qword 0
mov qword rax, 0 
mov rdi, res2
call printf 
pop rax

;Accept Answer for Q2
mov rax,1 
mov rdi, 
push qword 0
mov rsi, rsp
call scanf
movsd xmm11, [rsp]
pop rax

;Show Total Resistance

;== Are you a Computer Science Major Block ==
major:
;Print Computer Science Major Question
push qword 0
mov qword rax, 0
mov rdi, compy
call printf
pop rax

;If yes to Computer science major
cmp rdi, 'y'
jmp final

;If no to Computer Science major
cmp rdi, 'n'
movsd xmm0, [socialsal]
movsd xmm15, xmm0
jmp final



; == FINAL prints a final message and sends a code to the main.cpp == 
final: 

;Thank you message
push qword 0
mov qword rax,0
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

