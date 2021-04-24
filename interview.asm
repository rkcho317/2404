
extern printf
extern scanf

name_size equ 100

global interview

.segment data

.segment css

info db "Hello %s.   I am Ms Fenster. The interview will begin now.",10,0
salary db "Wow! %i That's a lot of cash. Who do you think you are, Chris Sawyer (y or n)?", 10,0
elec1 db "Alright.  Now we will work on your electricity.", 10,0
res1 db "Please enter the resistance of circuit #1 in ohms: ", 10,0
res2 db "What is the resistance of circuit #2 in ohms: ", 10,0
res3 db "The total resistance is %i Ohms.", 10,0 
compy db "Were you a computer science major (y or n)? ",10, 0
thanks db "Thank you. Please follow the exit signs to the front desk.", 10,0

chrisq %c, 0  ;answer to the question if you are Chris Sawyer

resans1 %lf,0 ;answer to res1
resans2 %lf,0 ;answer to res2
resans3 %lf,0 ;answer to res3

compyq %c,0 ;answer to computer science major question

.segment text
control:

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

work:

    mov r15, rdi        ;safekeeping
    ;Begin section to output the name passed into this function
    mov rax, 0
    mov rdi, info
    mov rsi, r15
    call printf


    ;;;;16 pops
    pop rax
    movsd xmm0,xmm15
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

