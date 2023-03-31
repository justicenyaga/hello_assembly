%include "io.inc"

section .data
    num1: dd 12
    num2: dd 23
    vals: db "EAX: %d added to EBX: %d", 10, 0
    sum: db "Sum is: %d", 10, 0

global _main

section .text
_main:
    mov ebp, esp
    
    mov eax, dword[num1]
    mov ebx, dword[num2]
    
    push ebx
    push eax
    push vals
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