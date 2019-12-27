section .text

	global _ft_strcmp

; int strcmp(const char *s1, const char *s2)
; rdi = s1 / rsi = s2 et on utilisera rcx comme compteur
; Pour rappel : al et bl appartiennet respectivement à RAX et RBX

_ft_strcmp:
	cmp rdi, 0
	je undefinedBehavior
	cmp rsi, 0
	je undefinedBehavior
	xor rax, rax
	xor rbx, rbx
	xor rcx, rcx
	mov r8, rdi
	mov r9, rsi
	while:
		mov al, BYTE[rdi + rcx]
		mov bl, BYTE[rsi + rcx]
		cmp al, 0x0
		je exit
		cmp bl, 0x0
		je exit
		add rcx, 1
		cmp al, bl
		je while

exit:
	sub rax, rbx	; On soustrait en fait al et bl
	mov rdi, r8
	mov rsi, r9
	ret

undefinedBehavior:
	ret
