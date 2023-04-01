%include "io.inc"

section .bss
    n: RESD 1

section .data
    input: db "%d", 0
    i: dd "%3d", 0

section .text
global _main

_main:
    push ebp
    mov ebp, esp
    
    push n
    push input
    call scanf
    add esp, 4
    
    mov ecx, dword[n]
    mov eax, 1
    repeat:
        push ecx
        push eax
        push i
        call printf
        add esp, 4
        
        pop eax
        
        inc eax
        dec ecx
        pop ecx
        
        loopnz repeat
       
        mov esp, ebp
        pop ebp
        ret