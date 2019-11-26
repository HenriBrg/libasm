; push rbp = Sauvegarde de l’ancien bas de pile
; mov rbp, rsp = on remonte le bas de pile a` la position du haut de la pile

_ft_isalnum:
    push rbp      ; Car "call" empile la prochaine instruction (rdi) puis jump,
    mov rbp, rsp  ; donc si on push/pop dans la fonction, la pile sera en vrac
                  ; lorsqu'on retourne dans la fonction appelante
                  ; Avec l'épilogue ci dessus (et le prologue), on crée un
                  ; nouveau contexte et on évite le problème

    leave         ; Epilogue
    ret           ; Epilogue
