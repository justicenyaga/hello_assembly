%include "io.inc"

section .data
    o: db "%d",10 , 0

section .text
global _main

_main:
    mov ecx, 10
    
    outer:
        push ecx
        mov ecx, 5
        
    inner:
        push ecx
        push o
        call printf
        add esp, 4
        
        pop ecx
        loop inner
        
        
        pop ecx
        loop outer
    ret