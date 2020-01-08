section .text

	global _ft_write

; write() sur un fd erroné retourne -1
; pour savoir si un fd est valide ou non, syscall fstat
; http://manpagesfr.free.fr/man/man2/stat.2.html


_ft_write:
	cmp rsi, BYTE 0x0
	je exitBadArgs
	mov r8, rsi
	mov r9, rdx
	mov rsi, 0x0		; Null pointer required by fstat()
	mov rax, 0x20000BD
	syscall
	cmp rax, 9			; if fstat return 9 --> wrong file descriptor (EBADFD)
	je exitBadArgs
	mov rsi, r8
	mov rdx, r9
	mov rax, 0x2000004	; args : rdi = fd / rsi = string / rdx = size
	syscall
	ret

exitBadArgs:
	mov rax, -1
	ret
