Algoritmo "Cash_Register"
Var
    quant_mouse, quant_teclado, quant_mousepad, numero_selecionado: real

    confirmacao: caractere

funcao registrar_venda():real
var

inicio


fimfuncao
Inicio

    numero_selecionado <- 0
    quant_mouse <- 5
    quant_teclado <- 3
    quant_mousepad <- 6
    confirmacao <- "N"

    repita
        escreval("========================")
        escreval("     Leonard's Store    ")
        escreval("========================")
        escreval("[ 1 - Registrar venda  ]")
        escreval("[ 2 - Relatório do dia ]")
        escreval("[ 3 - Calcular troco   ]")
        escreval("[ 4 - Sair             ]")
        escreval("========================")

        escreva("Para começar, digite sua escolha: ")
        leia(numero_selecionado)
        
        escolha numero_selecionado
            caso 1
                registrar_venda()

            caso 2

            caso 3

            caso 4
                escreval("Você tem certeza que gostaria de sair? [S/N]")
                leia(confirmacao)
                confirmacao <- maiusc(confirmacao)

                se (confirmacao = "N") entao
                    numero_selecionado <- 0
                
                senao
                    se (confirmacao <> "S") e (confirmacao <> "N") entao
                        escreval("Resposta inválida, por favor, digite apenas [S] ou [N]. ")
                        numero_selecionado <- 0
                    
                    fimse
                fimse

            outrocaso 
                escreval("Opção inválida, por favor, tente novamente.")
            
        fimescolha
    ate numero_selecionado = 4   
FimAlgoritmo