%include "io.inc"

section .data
    input: db "%f", 0
    num1: times 4 db 0
    num2: times 4 db 0
    nums: db "num1 = %.2f, num2 = %.2f", 10, 0
    res: db "Sum is: %.3f", 10, 0

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
    
    
    fld dword[num1]
    fld dword[num2]
    
    fadd
    
    sub esp, 8
    
    fstp qword[esp]
    
    push res
    call printf
    add esp, 12
    
    ret