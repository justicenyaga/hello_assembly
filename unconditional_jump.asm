%include "io.inc"

section .bss
    num1: RESD 1
    num2: RESD 2

section .data
    input: db "%d", 0
    msg1: db "Sum: %d", 10, 0
    msg2: db "Product: %d", 10, 0

section .text
global _main

_main:
    push ebp
    mov ebp, esp
    
    push num1
    push input
    call scanf
    add esp, 4
    
    push num2
    push input
    call scanf
    add esp, 4
    
    mov eax, dword[num1]
    mov ebx, dword[num2]
    
    jmp product   ;unconditional jump - code below will never get executed
    add eax, ebx
    push eax
    push msg1
    call printf
    NEWLINE
    
    mov esp, ebp
    pop ebp
    ret
    
    product:        ;execution will proceed here from line line 32
        mul ebx
        push eax
        push msg2
        call printf
        NEWLINE
        
        mov esp, ebp
        pop ebp
        ret
    
    