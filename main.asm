%include "print.h"

section .data
	newline db 0xA
	buffer db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ; space for 32-bit int string

section .text
	global _start

_start:
	mov rsi, -2147483648	; number to print
	mov rdi, buffer		; pass buffer to itoa
	call itoa		; call itoa
	mov rsi, rax		; rax contains the pointer to the start of the string
	mov rdi, buffer + 11	; end of the buffer

calc_len:
	mov rdi, buffer + 11
	mov rcx, buffer		; point to start of buffer.
	sub rdi, rcx
	mov rdx, rdi		;length of the string

	mov rax, 1		; syscall: sys_write
	mov rdi, 1		; STDOUT
	syscall

	mov rdi, buffer		; reset rdi to the start of the buffer

	mov rax, 1
	mov rdi, 1
	mov rsi, newline
	mov rdx, 1		; length
	syscall

	mov rax, 60		; syscall: sys_exit
	xor rdi, rdi		; exit code: 0
	syscall
