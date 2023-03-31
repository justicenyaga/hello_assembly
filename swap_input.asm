%include "io.inc"

section .data
    msg: db "Swap Input Values:", 0
    msg1: db "Before: num1 = %d, num2 = %d", 10, 0
    msg2: db "After: num1 = %d, num2 = %d", 10, 0
    input: db "%d", 0
    num1: times 4 db 0
    num2: times 4 db 0

section .text
global _main

_main:
    push num1
    push input
    call scanf
    add esp, 8
    
    push num2
    push input
    call scanf
    add esp, 8
    
    mov eax, dword[num1]
    mov ebx, dword[num2]
    
    push msg
    call printf
    NEWLINE
    add esp, 4
    
    push ebx
    push eax
    push msg1
    call printf
    add esp, 4
    pop eax
    pop ebx
    
    xchg eax, ebx
    
    push ebx
    push eax
    push msg2
    call printf
    add esp, 12

    ret