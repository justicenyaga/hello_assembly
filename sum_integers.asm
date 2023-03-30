%include "io.inc"

section .data
    sum: db "Sum: %d", 10, 0

global _main

section .text
_main:
    mov eax, 3
    mov ebx, 8
    
    add eax, ebx
    
    push eax
    push sum
    call printf
    add esp, 8
    ret