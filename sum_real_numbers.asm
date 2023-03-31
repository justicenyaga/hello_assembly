%include "io.inc"

section .data
    num1: dd 3.12
    num2: dd 1.893
    res: db "Sum is: %.3f", 10, 0
    
section .text
global _main

_main:
    mov ebp, esp
    
    mov eax, num1
    mov ebx, num2
    
    fld dword[eax] ; push real value in eax
    fld dword[ebx] ; push real value in ebx
    
    faddp     ; add top values of the stack
    
    sub esp, 8 ; create space to store the result
    
    fstp qword[esp] ; convert to real and pop
    
    push res
    call printf
    
    add esp, 12
    
    ret
    
    
    
    