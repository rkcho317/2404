
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

;name db "%s", 0
;salry db "%lf", 0

chrisq db "%c", 0  ;answer to the question if you are Chris Sawyer

resans1 db "%lf",0 ;answer to res1
resans2 db "%lf",0 ;answer to res2
resans3 db "%lf",0 ;answer to res3

compyq db "%c",0 ;answer to computer science major question

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
movsd xmm15, 1000000.00 
jmp final

;If no to Chris Sawyer
cmp rdi, 'n'
jmp major

;==Major Block

major:
;Print Computer Science Major Question
push qword 0
mov qword rax, 0
mov rdi, compy
call printf
pop rax

;If yes to Computer science major
cmp rdi, 'y'
jmp electricity

;If no to Computer Science major
cmp rdi, 'n'
movsd xmm15, 1200.12
jmp final

;===BEGIN ELECTRICITY TEST===
electricity: 

final:    
 pop rax
 movsd xmm0,xmm15 ;Sends result to the main.cpp 
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

