
extern printf
extern scanf

name_size equ 100

global interview

.segment data

info db "Hello %s. I am Ms Fenster. The interview will begin now.",10,0
salary db "Wow! %5.3lf That's a lot of cash. Who do you think you are, Chris Sawyer (y or n)?: %c", 10,0
elec1 db "Alright.  Now we will work on your electricity.", 10,0
res1 db "Please enter the resistance of circuit #1 in ohms: %5.3lf", 10,0
res2 db "What is the resistance of circuit #2 in ohms: %5.3lf", 10,0
res3 db "The total resistance is %5.3lf Ohms.", 10,0 
compy db "Were you a computer science major (y or n)?: %c ",10, 0
thanks db "Thank you. Please follow the exit signs to the front desk.", 10,0

chrisq %c, 0  ;answer to the question if you are Chris Sawyer

resans1 %lf,0 ;answer to res1
resans2 %lf,0 ;answer to res2
resans3 %lf,0 ;answer to res3

compyq %c,0 ;answer to computer science major question

.segment css

name %s, 0
salry %lf, 0

.segment text
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

;Print info1 with name
push qword 0
mov qword rax,0
mov qword rdi, info1
mov qword rsi, r15
call printf
pop rax

;Print info2
push qword 0
push rax, 0
mov rdi, info2
movsd rsi, xmm15
call printf 
pop rax

;

;===BEGIN ELECTRICITY TEST===

    
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

