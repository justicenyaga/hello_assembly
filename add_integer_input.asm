%include "io.inc"

section .data
    input: dd "%d", 0
    num1: times 4 db 0
    num2: times 4 db 0
    msg: db "num1 = %d, num2 = %d", 10, 0
    sum: db "Sum: %d", 10, 0
    
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
    
    push ebx
    push eax
    push msg
    call printf
    add esp, 4
    pop eax
    pop ebx
    
    add eax, ebx
    push eax
    push sum
    call printf
    add esp, 8
    
    ret