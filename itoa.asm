section .text
global itoa

; converts a number into a string
; inputs:
;	rdi - buffer to store the string
;	rsi - number to convert
; outputs:
;	rax - pointer to the start of the string

itoa:
	mov rbx, rdi		; save the buffer pointer
	mov rax, rsi		; move the number into rax
	test rax, rax		; check neg
	jns skip_neg		; skip if not neg
	neg rax			; negate if negative
	mov byte [rdi], '-'	; '-' char if negative
	inc rdi			; move forward one byte

skip_neg:
	add rdi, 10		; move to the end of the buffer
	mov byte [rdi], 0	; null terminate the string
	mov rcx, 10		; divisor

convert_loop:
	xor rdx, rdx		; clear rdx
	div rcx			; divide rax by rcx, remainder in rdx, quotient in rax
	add dl, '0'		; ascii conversion
	dec rdi			; move back one byte
	mov [rdi], dl		; store ascii
	test rax, rax		; 0 check
	jnz convert_loop	; if not, loop
	mov rax, rbx		; return the pointer to the start of the string
	ret
