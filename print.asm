%include "print.h"

section .text
	global _start

_start:
	call input

input:
	call read				; read input
	cmp rax, 0				; check for EOF
	je exit					; exit if EOF
	call print				; print the input
	jmp input				; loop

print:
	mov rax, 1				; syscall: sys_write
	mov rdi, 1				; STDOUT
	mov rdx, 256			; length
	syscall

exit:
	mov rax, 60				; syscall: sys_exit
	xor rdi, rdi			; exit code: 0
	syscall
