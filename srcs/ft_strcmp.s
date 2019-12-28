section .text

	global _ft_strcmp

; int strcmp(const char *s1, const char *s2)
; rdi = s1 / rsi = s2 et on utilisera rcx comme compteur
; Pour rappel : al et bl appartiennet respectivement à RAX et RBX

_ft_strcmp:
	cmp rdi, 0
	je badArgsExit
	cmp rsi, 0
	je badArgsExit
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	while:
		cmp BYTE[rdi + rcx], 0x0
		je normalExit
		cmp BYTE[rsi + rcx], 0x0
		je supExit
		mov al, [rdi + rcx]
		cmp al, BYTE[rsi + rcx]
		jg supExit
		jb infExit
		inc rcx
		jmp while

normalExit:
	cmp BYTE[rsi + rcx], 0x0
	je equalExit
	jmp infExit

badArgsExit:
	cmp rdi, rsi
	jg supExit
	jl infExit
	jmp equalExit

supExit:
	mov rax, 1
	ret

infExit:
	mov rax, -1
	ret

equalExit:
	mov rax, 0
	ret
