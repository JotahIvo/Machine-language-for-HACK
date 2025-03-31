// div.asm – Divisão por subtração repetida: R0 = R1 / R2

    @R1
    D=M          // D = dividendo (R1)
    @R7
    M=D          // R7 ← cópia do dividendo (variável TEMP)
    @R0
    M=0          // Zera o quociente (R0)
(DIV_LOOP)
    @R7
    D=M          // D = dividendo atual
    @R2
    D=D-M       // D = dividendo atual – divisor (R2)
    @END_DIV
    D;JLT       // Se o resultado for negativo, encerra o laço (dividendo < divisor)
    // Atualiza o dividendo: R7 = R7 – R2
    @R7
    D=M
    @R2
    D=D-M
    @R7
    M=D
    // Incrementa o quociente em R0
    @R0
    M=M+1
    @DIV_LOOP
    0;JMP
(END_DIV)
    @END
    0;JMP
(END)
