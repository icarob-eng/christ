; arquitetura CHRIST
; calculadora com duas entradas usando botão de confirma
ler_a:                  ; label de referência para jumpto (não ocupa espaço na memória)
    P2R 2,SW            ; R[2] <- PER[SW]
    R2P 2,SEGA           ; PER[SEGA] <- R[2], printa o valor lido no display
    P2R 1,BTN           ; R[1] <- PER[BTN]
    NULL 1
    JMPRDC Neg,ler_a     ; pula para ler_a se número na ALU > 0, senão, continua
ler_b:
    P2R 3,SW            ; R[3] <- PER[SW]
    R2P 3,SEGA           ; PER[SEGA] <- R[3], printa o valor lido no display
    P2R 1,BTN           ; R[1] <- PER[BTN]
    NULL 1              ; R[1] <- R[1]
    JMPRDC Neg,ler_b     ; pula para ler_b se número na ALU > 0, senão, continua

    ADD 4,2,3           ; R[4] <- R[2] + R[3]
    R2P 4,SEGA           ; PER[SEGA] <- R[4]
manter_result:
    P2R 1,BTN           ; R[1] <- PER[BTN]
    NULL 1              ; R[1] <- R[1]
    JMPRDC Neg,ler_a     ; pula para ler_b se número na ALU > 0, senão, continua
    JMPRD manter_result ; loop
