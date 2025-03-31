// avg.asm – Calcula a média de R2 valores armazenados a partir do endereço indicado em R1
// Exemplo: se R1 = 100 e R2 = 10, soma os valores de RAM[100] até RAM[109] e divide por 10

    // Preserva o número de elementos em R8
    @R2
    D=M
    @R8
    M=D         // R8 ← count
    // Inicializa a soma em R4 = 0
    @R4
    M=0         // soma = 0
    // Inicializa o índice em R9 = 0
    @R9
    M=0         // índice = 0
(AVG_LOOP)
    // Verifica se índice < count
    @R9
    D=M         // D = índice
    @R8
    D=D-M       // D = índice - count
    @AVG_END
    D;JGE       // Se índice >= count, sai do laço
    // Computa o endereço do elemento: endereço = (conteúdo de R1) + (índice em R9)
    @R1
    D=M         // D = endereço base (valor armazenado em R1)
    @R9
    D=D+M       // D = endereço base + índice
    @R10
    M=D         // R10 ← endereço calculado
    @R10
    A=M         // A aponta para o endereço do elemento
    D=M         // D = valor do elemento
    // Soma o valor ao acumulador (R4)
    @R4
    D=D+M
    @R4
    M=D         // soma = soma + valor
    // Incrementa o índice
    @R9
    M=M+1
    @AVG_LOOP
    0;JMP
(AVG_END)
    // Agora, R4 contém a soma total e R8 o número de elementos.
    // Realiza a divisão: média = soma / count (parte inteira)
    @R4
    D=M
    @R7
    M=D         // R7 ← soma (dividendo)
    @R0
    M=0         // Zera o quociente (R0)
(AVG_DIV_LOOP)
    @R7
    D=M         // D = dividendo atual (soma restante)
    @R8
    D=D-M       // D = (soma restante) - count
    @AVG_DIV_END
    D;JLT       // Se o dividendo atual < count, fim da divisão
    // Atualiza dividendo: R7 = R7 - count
    @R7
    D=M
    @R8
    D=D-M
    @R7
    M=D
    // Incrementa o quociente (média) em R0
    @R0
    M=M+1
    @AVG_DIV_LOOP
    0;JMP
(AVG_DIV_END)
    // Em R0 temos a média (parte inteira)
    @END
    0;JMP
(END)
