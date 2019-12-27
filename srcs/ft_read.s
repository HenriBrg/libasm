section .text

	global _ft_read

_ft_read:
	cmp edi, 0			; Si l'on compare avec rdi, ça ne fonctionnera pas
	jl exitBadArgs
	cmp rsi, 0x0
	je exitBadArgs
	mov rax, 0x2000003
	syscall
	ret

exitBadArgs:
	mov rax, -1
	ret
