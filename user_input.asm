%include "io.inc"

section .data
    input: db "%d", 0
    num1: times 4 db 0
    num2: times 4 db 0
    msg: db "You have entered:", 0
    vals: db "num1: %d and num2: %d", 0

section .text
global _main

_main:
    mov ebp, esp
    
    push num1
    push input
    call scanf
    
    add esp, 8
    
    push num2
    push input
    call scanf
    
    add esp, 8
    
    push msg
    call printf
    NEWLINE
    push dword[num2]
    push dword[num1]
    push vals
    call printf
    
    add esp, 16
    ret