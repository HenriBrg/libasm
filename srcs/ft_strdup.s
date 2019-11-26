section .text

    global _ft_strdup
    extern _ft_memcpy
    extern _ft_strlen
    extern _malloc

; Pour cet exercice, on utilisera la stack afin de passer les paramètres

_ft_strdup:
    ; --- (Prologue)
    push rbp
    mov rbp, rsp
    ; ---
    push rdi
    call _ft_strlen   ; strlen récupère rdi dans la stack - État : [Arg 1: rdi]
    push rax          ; rax reçoit le retour de strlen et on push - État : [Arg 1: rax] [Arg 2: rdi]
    call _malloc      ; malloc(size) depuis [Arg 1: rax] dans la stack puis retourne la nouvelle adresse dans rax
    mov rdi, rax      ; 3 prochaines lignes pour préparer le call memcpy
    pop rdx
    pop rsi
    call _ft_memcpy   ; rdi = dst / rsi = src / rdx = size
    ; --- (Epilogue)
    mov rsp, rbp
  	pop rbp
    ; ---
    ret


; char	*ft_strdup(const char *src)
; {
; 	int		i;
; 	char	*output;
;
; 	i = 0;
; 	while (src[i] != '\0')
; 		i++;
; 	if ((output = malloc(sizeof(char) * (i + 1))) == NULL)
; 		return (NULL);
; 	i = 0;
; 	while (src[i] != '\0')
; 	{
; 		output[i] = src[i];
; 		i++;
; 	}
; 	output[i] = '\0';
; 	return (output);
; }
