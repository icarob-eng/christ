; arquitetura CHRIST
; printa exatamente o que foi passado nos Switches
start:           ; label de referência para jump (não ocupa espaço na memória)
    P2R 2,SW     ; R[2] <- PER[SW]
    R2P 2,SEGA   ; PER[SEGA] <- R[2], printa o valor lido no display
    JMPRD start  ; pula para start
