; arquitetura CHRIST
; printa a série de fibonacci até produzir overwflow
start:
    R2R 0,1  ; zera registradores
    R2R 0,2
    INC 2    ; escreve 1 no segundo
loop:        ; a_n = a_n-1 + a_n-2
    R2P 1,SEGA
    ADD 3,1,2
    JMPRDC OF,end  ; se tiver overwflow, termina
;     R2R 1,0
    R2R 2,1        ; desloca dados
    R2R 3,2
    JMPRD loop
end:
    HALT
