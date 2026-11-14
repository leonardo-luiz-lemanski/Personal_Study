Algoritmo "Cash_Register"
Var
    quant_mouse, quant_mouse_ja_selecionado, quant_teclado, quant_teclado_ja_selecionado, quant_mousepad, quant_mousepad_ja_selecionado, numero_selecionado: real

    confirmacao: caractere

funcao remove_um(y:inteiro):inteiro
inicio
    y <- y - 1
    retorne y
fimfuncao

funcao adiciona_um(x:inteiro):inteiro
inicio
    x <- x + 1
    retorne x
fimfuncao

procedimento carrinho(qm, qmjs, qt, qtjs, qmp, qmpjs: real)
var
c, qmjs_vt, qtjs_vt, qmpjs_vt, vtc: real
tecla: caractere

inicio
    c <- 7
    tecla <- "N"

    repita
        qmjs_vt <- qmjs*35.50
        qtjs_vt <- qtjs*65.90
        qmpjs_vt <- qmpjs*9.90
        vtc <- qmjs_vt + qtjs_vt + qmpjs_vt

        limpatela
        escreval("============================================")
        escreval("           C  A  T  Á  L  O  G  O           ")
        escreval("============================================")
        escreval("   [1] = Mouse:    " , qm , " UN - R$ 35.50 cada")
        escreval("   [2] = Teclado:  " , qt , " UN - R$ 65.90 cada")
        escreval("   [3] = Mousepad: " , qmp , " UN - R$  9.90 cada")
        escreval("============================================")
        escreval("        C   A   R   R   I   N   H   O       ")
        escreval("============================================")

        escreval("    Mouse:    " , qmjs , " UN = R$" , qmjs_vt:5:2)
        escreval("    Teclado:  " , qtjs , " UN = R$" , qtjs_vt:5:2)
        escreval("    Mousepad: " , qmpjs , " UN = R$" , qmpjs_vt:5:2)
        escreval("---------------------------------------------")
        escreval(" Total de itens: " , qmjs + qtjs + qmpjs , " Valor total: R$" , vtc:6:2)
        escreval("=============================================")
        escreval(" ")
        escreval(" [1] para incluir 1 UN de mouse no carrinho.    [4] para retirar 1 UN de mouse do carrinho.")
        escreval(" [2] para incluir 1 UN de teclado no carrinho.  [5] para retirar 1 UN de teclado do carrinho.")
        escreval(" [3] para incluir 1 UN de mousepad no carrinho. [6] para retirar 1 UN de mousepad do carrinho.")
        escreval(" [9] para finalizar o carrinho.                 [0] para CANCELAR a venda e voltar para o menu.")
        escreval(" ")
        escreval(" Digite uma opção conforme acima: ")
        leia(c)

        escolha c
            caso 1
                qm <- remove_um(qm)
                qmjs <- adiciona_um(qmjs)
                c <- 7

            caso 2
                qt <- remove_um(qt)
                qtjs <- adiciona_um(qtjs)
                c <- 7

            caso 3
                qmp <- remove_um(qmp)
                qmpjs <- adiciona_um(qmpjs)
                c <- 7

            caso 4
                qm <- adiciona_um(qm)
                qmjs <- remove_um(qmjs)
                c <- 7

            caso 5
                qt <- adiciona_um(qt)
                qtjs <- remove_um(qtjs)
                c <- 7

            caso 6
                qmp <- adiciona_um(qmp)
                qmpjs <- remove_um(qmpjs)
                c <- 7

            caso 9
                escreval("Continuar para o pagamento? [S/N]")
                leia(tecla)
                tecla <- maiusc(tecla)

                    se (tecla = "S") entao
                        c <- 0
                        quant_mouse <- qm
                        quant_mouse_ja_selecionado <- qmjs
                        quant_teclado <- qt
                        quant_teclado_ja_selecionado <- qtjs
                        quant_mousepad <- qmpjs
                        quant_mousepad_ja_selecionado <- qmpjs

                    senao
                        se (tecla = "N") entao
                            c <- 7

                        senao
                            c <- 7
                            escreval("Opção inválida, Aperte qualquer tecla para tentar novamente. ")
                            leia(tecla)

                        fimse
                    fimse
            caso 0
                c <- 0

            outrocaso
                escreval("Opção inválida. Aperte qualquer tecla para tentar novamente.")
                leia(tecla)
                c <- 7

        fimescolha    
    ate (c = 0)

fimprocedimento

funcao registrar_venda():real
var

inicio


fimfuncao
Inicio

    numero_selecionado <- 0
    quant_mouse <- 5
    quant_mouse_ja_selecionado <- 0
    quant_teclado <- 3
    quant_teclado_ja_selecionado <- 0
    quant_mousepad <- 6
    quant_mousepad_ja_selecionado <- 0
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
                carrinho(quant_mouse, quant_mouse_ja_selecionado, quant_teclado, quant_teclado_ja_selecionado, quant_mousepad, quant_mousepad_ja_selecionado)
                registrar_venda()
                limpatela

            caso 2
                limpatela

            caso 3
                limpatela

            caso 4
                escreval("Você tem certeza que gostaria de sair? [S/N]")
                leia(confirmacao)
                confirmacao <- maiusc(confirmacao)

                se (confirmacao = "N") entao
                    numero_selecionado <- 0
                    limpatela
                
                senao
                    se (confirmacao <> "S") e (confirmacao <> "N") entao
                        limpatela
                        escreval("Resposta inválida, por favor, digite apenas [S] ou [N]. ")
                        numero_selecionado <- 0
                    
                    fimse
                fimse

            outrocaso 
                limpatela
                escreval("Opção inválida, por favor, tente novamente.")
            
        fimescolha
    ate numero_selecionado = 4   
FimAlgoritmo