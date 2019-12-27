section .data
hello:
  .string db "My first ASM program", 10
  .len equ $ - hello.string

section .text
  global start
  global _main
  extern _printf

start:
  call _main
  ret

_main:
    push rbp ; push du registre rbp sur la stack
    mov rbp, rsp
    sub rsp, 16
    lea rdi, [rel hello.string] ; lea = load effective adresse RDI = 1er argument de printf
    call _printf
    leave ; pop la stack
    ret
