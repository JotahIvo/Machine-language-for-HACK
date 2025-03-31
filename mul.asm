// mul.asm – Multiplicação por adição repetida: R0 = R1 * R2

    @R1
    D=M          // D = multiplicando (R1)
    @R5
    M=D          // R5 ← multiplicando (armazenado em R5)
    @R2
    D=M          // D = multiplicador (R2)
    @R6
    M=D          // R6 ← multiplicador (armazenado em R6)
    @R0
    M=0          // Inicializa o resultado (R0 = 0)
(MUL_LOOP)
    @R6
    D=M
    @END_MUL
    D;JEQ       // Se R6 == 0, fim do laço
    @R0
    D=M
    @R5
    D=D+M       // Soma o multiplicando (R5) ao acumulador
    @R0
    M=D         // Atualiza o resultado
    @R6
    M=M-1       // Decrementa o contador (multiplicador)
    @MUL_LOOP
    0;JMP
(END_MUL)
    @END
    0;JMP
(END)
