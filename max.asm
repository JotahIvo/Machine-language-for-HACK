// max.asm – Computa o máximo entre R1, R2 e R3, com resultado em R0

    @R1          // Carrega o conteúdo de R1
    D=M          // D = R1
    @R2
    D=D-M        // D = R1 - R2
    @USE_R1
    D;JGT        // Se R1 > R2 (diferença positiva), mantém D = R1
    @R2
    D=M          // Caso contrário, D = R2
(USE_R1)
    @R4
    M=D          // R4 ← max(R1,R2)
    @R4
    D=M          // D = max(R1,R2)
    @R3
    D=D-M        // D = max(R1,R2) – R3
    @KEEP_MAX
    D;JGT        // Se max(R1,R2) > R3, então o máximo é max(R1,R2)
    @R3
    D=M          // Senão, D = R3
(KEEP_MAX)
    @R0
    M=D          // Armazena o máximo em R0
    @END
    0;JMP
(END)
