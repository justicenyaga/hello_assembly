%include "io.inc"

section .bss
    num1: RESD 1
    num2: RESD 1

section .data
    input: db "%d", 0
    res: db "result of division: %d rem %d", 10, 0

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
    mov edx, 0
    
    div ebx
    
    push edx
    push eax
    push res
    call printf
    
    mov esp, ebp
    pop ebp
    ret