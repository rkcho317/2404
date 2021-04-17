.segment data

.segment css

info db "Your name is %s.   How are you?",10,0

.segment text

work:
    ;;;16 pushes
    mov r15, rdi        ;safekeeping
    ;Begin section to output the name passed into this function
    mov rax, 0
    mov rdi, info
    mov rsi, r15
    call printf
    ;;;;16 pops
    movsd xmm0,xmm15
ret