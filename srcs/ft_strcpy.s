section .text

	global _ft_strcpy
	extern _ft_strlen

_ft_strcpy:
	cmp rdi, 0
	je exit
	cmp rsi, 0
	je exit
	push rdi
	mov rdi, rsi
	call _ft_strlen
	mov rdx, rax
	pop rdi
	cld
	rep movsb
	mov BYTE[rdi], 0x0
	sub rdi, rdx		; Car pour rappel, movsb itère sur l'adresse (str++)
	mov rax, rdi
	ret

exit:
	mov rax, rdi
	ret

; L'instruction "cld" met le flag DF (« Direction Flag ») à 0
; Le DF est utilisé pour les opérations sur les chaînes de
; caractères. S'il vaut 1, celles-ci seront parcourues dans le sens des
; adresses décroissantes, sinon les adresses seront croissantes.


; 2) rep movsb

; movsb : Copie l'octet adressé par SI à l'adresse DI.
; Si DF = 0, alors DI et SI sont incrémentés, sinon ils sont décrémentés.
; Pour copier plusieurs octets : REP MOVSB (« Repeat Move String Byte »).
; Le nombre d'octets à copier doit être transmis dans (ici R) CX
;
; ATTENTION : 2 heures de réflexion pour comprendre ça : rep movsb incrémente
; l'adresse de rdi à chaque tour (mais pourtant, après "mov rax, rdi", on
; récupère quand même le début du string ... il y a quelquechose de mal compris)
