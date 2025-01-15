; arquitetura CHRIST
; calculadora com duas entradas usando botão de confirma
ler_a:                  ; label de referência para jumpto (não ocupa espaço na memória)
    P2R 2,SW            ; R[2] <- PER[SW]
    P2R 2,SEG           ; PER[SEG] <- R[2], printa o valor lido no display
    P2R 1,BTW           ; R[1] <- PER[BTN]
    NULL 1
    JMPRDC ~N,ler_a     ; pula para ler_a se número na ALU > 0, senão, continua
ler_b:
    P2R 3,SW            ; R[3] <- PER[SW]
    P2R 3,SEG           ; PER[SEG] <- R[3], printa o valor lido no display
    P2R 1,BTN           ; R[1] <- PER[BTN]
    NULL 1              ; R[1] <- R[1]
    JMPRDC ~N,ler_b     ; pula para ler_b se número na ALU > 0, senão, continua

    P2R 2,SEG           ; PER[SEG] <- R[2]
    ADD 2,3,4           ; R[4] <- R[2] + R[3]
    R2P 4,SEG           ; PER[SEG] <- R[4]
manter_result:
    P2R 1,BTN           ; R[1] <- PER[BTN]
    NULL 1              ; R[1] <- R[1]
    JMPRDC ~N,ler_a     ; pula para ler_b se número na ALU > 0, senão, continua
    JMPRD manter_result ; loop
