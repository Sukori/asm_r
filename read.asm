section .bss
	buffer resb 256

section .data
	prompt db "asm> ", 0
	prompt_len equ $ - prompt ;$ is the current address and prompt is the start address of the prompt string

section .text
global read

read:
	mov rax, 1
	mov rdi, 1
	mov rsi, prompt
	mov rdx, prompt_len
	syscall

	mov rax, 0
	mov rdi, 0
	mov rsi, buffer
	mov rdx, 256
	syscall
	ret
