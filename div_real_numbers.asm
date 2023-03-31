%include "io.inc"

section .data
    num1: dd 22
    num2: dd 7
    div: db "Division: %.5f", 10, 0

section .text
global _main

_main:
    mov ebp, esp
    
    mov eax, num1
    mov ebx, num2
    
    fld dword[eax]
    fld dword[ebx]
    
    fdiv
    
    sub esp, 8
    
    fstp qword[esp]
    push div
    call printf
    
    add esp, 12
    ret