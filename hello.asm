%include "io.inc"

section .data
    msg: db "Hello world", 10, 0

global _main

section .text
_main:
    push msg
    call printf
    add esp, 4
    xor eax, eax
    ret