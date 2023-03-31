%include "io.inc"

section .data
    numbers: DD "num1: %d, num2: %d", 10, 0
    a: DB "Sum: %d", 10, 0
    b: DB "Difference: %d", 10, 0
    c: DB "Product: %d", 10, 0
    d: DB "Modulus: %d", 10, 0
    %define num1 27
    num2 equ 7

section .text
global _main

_main:
    mov ebp, esp
    
    mov eax, num1
    mov ebx, num2
    
    push ebx
    push eax
    push numbers
    call printf
    NEWLINE
    add esp, 12
    
    mov ecx, num1+num2
    push ecx
    push a
    call printf
    add esp, 8
    
    mov ecx, num1-num2
    push ecx
    push b
    call printf
    add esp, 8
    
    mov ecx, num1*num2
    push ecx
    push c
    call printf
    add esp, 8
    
    mov ecx, num1%num2
    push ecx
    push d
    call printf
    add esp, 8
    
    ret