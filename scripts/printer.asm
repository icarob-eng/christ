; arquitetura CHRIST
; printa exatamente o que foi passado nos Switches
start:           ; label de referência para jump (não ocupa espaço na memória)
    P2R 2,SW     ; R[2] <- PER[SW]
    P2R 2,SEG    ; PER[SEG] <- R[2], printa o valor lido no display
    P2R 1,BTW    ; R[1] <- PER[BTN]
    NULL 1
    JMPRD start  ; pula para start
