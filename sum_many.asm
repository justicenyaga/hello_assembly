%include "io.inc"

section .data
    res: db "The result is: %d", 10, 0

section .text
global _main

_main:
    mov eax, 1000
    mov ebx, 1100
    mov ecx, 1200
    mov edx, 1300
    mov ebp, 1400
    mov edi, 1500
    mov esi, 2500
    
    add eax, ebx
    add eax, ecx
    add eax, edx
    add eax, ebp
    add eax, edi
    add eax, esi
    
    push eax
    
    push res
    call printf
    
    add esp, 8
    ret