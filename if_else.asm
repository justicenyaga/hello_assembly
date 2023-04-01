%include "io.inc"

section .bss
    num1: RESD 1
    num2: RESD 1
    
section .data
    input: db "%d", 0
    msg1: db "Sum: %d", 10, 0
    msg2: db "Product: %d", 10, 0

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
    
    cmp eax, ebx
    jge if ;if eax is greater than or equal to ebx, program execution will proceed on if block
    jmp else ;if the condition above is false, program execution will proceed on else block
    
    ;if and else above are labels, not keywords
    
    if:
        add eax, ebx
        push eax
        push msg1
        call printf
        NEWLINE
    
        mov esp, ebp
        pop ebp
        ret
        
    else:
        mul ebx
        push eax
        push msg2
        call printf
        NEWLINE
        
        mov esp, ebp
        pop ebp
        ret
    
    