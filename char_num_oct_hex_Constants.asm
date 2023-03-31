%include "io.inc"

section .data
    msg1: db "The char is: '%c' and number is: '%d'", 10, 0
    msg2: db "The octal is: '%o' and the hexa is: '%x'", 10, 0

section .text
global _main

_main:
    mov ebp, esp
    
    mov eax, 'H'
    mov ebx, 23
    
    push ebx
    push eax
    push msg1
    call printf
    
    add esp, 4
    pop eax
    pop ebx
    
    mov eax, 6o
    mov ebx, 7Ah
    
    push ebx
    push eax
    push msg2
    call printf
    
    add esp, 4
    pop eax
    pop ebx
    
    ret