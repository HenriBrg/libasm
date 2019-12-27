section .text

    global _ft_strdup
    extern _ft_strlen
	extern _ft_memcpy
	extern _malloc

_ft_strdup:
	cmp rdi, 0x0
	je strNull
    push rbp
    mov rbp, rsp
    push rdi
    call _ft_strlen		; strlen récupère rdi dans la stack - État : [Arg 1: rdi]
	inc rax
    push rax			; rax reçoit le retour de strlen et on push - État : [Arg 1: rax] [Arg 2: rdi]
    call _malloc		; malloc(size) depuis [Arg 1: rax] dans la stack puis retourne la nouvelle adresse dans rax
	cmp rax, 0
	je mallocFailed
	mov rdi, rax
    pop rcx
    pop rsi
	cld					; Set flag DF à 0 --> itération croissante sur rdi et rsi
	rep movsb			; Copie rsi dans rdi N fois (avec N définit par rdx)
    mov rsp, rbp		; Essayer de comprendre pourquoi strcpy ne passait pas !
  	pop rbp
    ret

strNull:
	mov rax, 0
	ret

mallocFailed:
	mov rsp, rbp
	pop rbp
	mov rax, 0
	ret
