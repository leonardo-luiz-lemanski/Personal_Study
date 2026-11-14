Algoritmo "Cash_Register"
Var
    quant_mouse, quant_mouse_ja_selecionado, quant_teclado, quant_teclado_ja_selecionado, quant_mousepad, quant_mousepad_ja_selecionado, numero_selecionado: real

    confirmacao: caractere

funcao parcela_credito(capital, n_parcelas: real): real
var 
    montante_parc: real

inicio
    montante_parc <- (capital + (capital * 0.02 * n_parcelas))/n_parcelas
    retorne montante_parc

fimfuncao

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

procedimento imprimir_parc(h:real)
var
    i: inteiro
    n: real

inicio
    para i <- 1 ate 6 passo 1 faca
        n <- parcela_credito(h, i)
        escreval(i , "x de R$" , n:6:2)

    fimpara

fimprocedimento

procedimento carrinho(qm, qmjs, qt, qtjs, qmp, qmpjs: real)
var
c, s, qmjs_vt, qtjs_vt, qmpjs_vt, vtc, vtcp, vtcc: real
tecla: caractere
numero_de_parcelas, variavel_temp_loop_tosemideiamaisdevariavel: inteiro

inicio
    variavel_temp_loop_tosemideiamaisdevariavel <- 0
    c <- 7
    s <- 0
    vtc <- 0
    vtcp <- 0
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
        
        se ((qm = 0) e (c = 1)) ou ((qt = 0) e (c = 2)) ou ((qmp = 0) e (c = 3)) ou ((qmjs = 0) e (c = 4)) ou ((qtjs = 0) e (c = 5)) ou ((qmpjs = 0) e (c = 6)) entao
            escreval("Opção inválida. Aperte qualquer tecla para tentar novamente.")
            leia(tecla) 
            tecla <- "N"

            senao
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
                        c <- 7
                        variavel_temp_loop_tosemideiamaisdevariavel <- 0

                        enquanto (variavel_temp_loop_tosemideiamaisdevariavel = 0) faca

                            limpatela
                            escreval("============================================")
                            escreval("        C   A   R   R   I   N   H   O       ")
                            escreval("============================================")
                            escreval("    Mouse:    " , qmjs , " UN = R$" , qmjs_vt:5:2)
                            escreval("    Teclado:  " , qtjs , " UN = R$" , qtjs_vt:5:2)
                            escreval("    Mousepad: " , qmpjs , " UN = R$" , qmpjs_vt:5:2)
                            escreval("---------------------------------------------")
                            escreval(" Total de itens: " , qmjs + qtjs + qmpjs , " Valor total: R$" , vtc:6:2)
                            escreval("=============================================")
                            escreval(" Meios de pagamentos disponíveis:            ")
                            vtcp <- vtc*0.97
                            escreval(" [1] Pix - 3% de desconto - R$", vtcp:6:2)
                            escreval(" [2] Cartão de débito ou dinheiro - R$" , vtc:6:2 )
                            escreval(" [3] Cartão de crédito em até 6x com juros")
                            escreval(" [0] Voltar")
                            escreval(" ")
                            escreval(" Digite um número para selecionar o meio de pagamento: ")
                            leia(s)
                            escolha s
                                caso 1
                                    escreval("Meio de pagamento selecionado foi Pix, cobre do cliente R$" , vtcp:6:2)
                                    escreval("Confirmar venda? [S/N] ")
                                    leia(tecla)
                                    tecla <- maiusc(tecla)

                                    se (tecla = "S") entao
                                        quant_mouse <- qm
                                        quant_mouse_ja_selecionado <- 0
                                        quant_teclado <- qt
                                        quant_teclado_ja_selecionado <- 0
                                        quant_mousepad <- qmp
                                        quant_mousepad_ja_selecionado <- 0

                                        escreval("Venda registrada com sucesso!")
                                        escreval("Pressione qualquer tecla para voltar ao menu inicial")
                                        leia(tecla)
                                        limpatela
                                        variavel_temp_loop_tosemideiamaisdevariavel <- 1 
                                        c <- 0          

                                    senao
                                        se (tecla = "N") entao
                                        escreval("Meio de pagamento não confirmado.")
                                        escreval("Pressione qualquer tecla para voltar ao menu de pagamento.")
                                        leia(tecla)

                                        senao 
                                            escreval("Opção inválida. Aperte qualquer tecla para tentar novamente.")
                                            leia(tecla)    

                                        fimse
                                    fimse

                                caso 2
                                    escreval("Meio de pagamento selecionado foi cartão de débito ou dinheiro, cobre do cliente R$" , vtc:6:2)
                                    escreval("Confirmar venda? [S/N] ")
                                    leia(tecla)
                                    tecla <- maiusc(tecla)

                                    se (tecla = "S") entao
                                        quant_mouse <- qm
                                        quant_mouse_ja_selecionado <- 0
                                        quant_teclado <- qt
                                        quant_teclado_ja_selecionado <- 0
                                        quant_mousepad <- qmp
                                        quant_mousepad_ja_selecionado <- 0

                                        escreval("Venda registrada com sucesso!")
                                        escreval("Pressione qualquer tecla para voltar ao menu inicial")
                                        leia(tecla)
                                        limpatela
                                        variavel_temp_loop_tosemideiamaisdevariavel <- 1 
                                        c <- 0          

                                    senao
                                        se (tecla = "N") entao
                                        escreval("Meio de pagamento não confirmado.")
                                        escreval("Pressione qualquer tecla para voltar ao menu de pagamento.")
                                        leia(tecla)

                                        senao 
                                            escreval("Opção inválida. Aperte qualquer tecla para tentar novamente.")
                                            leia(tecla)    

                                        fimse
                                    fimse

                                caso 3

                                    escreval("Meio de pagamento selecionado foi cartão de crédito, os parcelamentos são:")
                                    imprimir_parc(vtc)
                                    escreval("Em quantas vezes será parcelado?")
                                    leia(numero_de_parcelas)
                                    se (numero_de_parcelas <> 1) e (numero_de_parcelas <> 2) e (numero_de_parcelas <> 3) e (numero_de_parcelas <> 4) e (numero_de_parcelas <> 5) e (numero_de_parcelas <> 6) faca
                                        escreval("Opção inválida. Aperte qualquer tecla para tentar novamente.")
                                        leia(tecla)    

                                        senao
                                            vtcc <- numero_de_parcelas*parcela_credito(vtc, numero_de_parcelas)
                                            escreval("Em ", numero_de_parcelas , "x, cobre do cliente um total de: R$" , vtcc:6:2)

                                            escreval("Confirmar venda? [S/N] ")
                                            leia(tecla)
                                            tecla <- maiusc(tecla)
                                            se (tecla = "S") entao
                                                quant_mouse <- qm
                                                quant_mouse_ja_selecionado <- 0
                                                quant_teclado <- qt
                                                quant_teclado_ja_selecionado <- 0
                                                quant_mousepad <- qmp
                                                quant_mousepad_ja_selecionado <- 0

                                                escreval("Venda registrada com sucesso!")
                                                escreval("Pressione qualquer tecla para voltar ao menu inicial")
                                                leia(tecla)
                                                limpatela
                                                variavel_temp_loop_tosemideiamaisdevariavel <- 1 
                                                c <- 0          

                                            senao
                                                se (tecla = "N") entao
                                                    escreval("Meio de pagamento não confirmado.")
                                                    escreval("Pressione qualquer tecla para voltar ao menu de pagamento.")
                                                    leia(tecla)

                                                    senao 
                                                        escreval("Opção inválida. Aperte qualquer tecla para tentar novamente.")
                                                        leia(tecla)    

                                                fimse
                                        fimse

                                    fimse                            
                                caso 0
                                    variavel_temp_loop_tosemideiamaisdevariavel <- 0

                                outrocaso
                                    escreval("Opção inválida. Aperte qualquer tecla para tentar novamente.")
                                    leia(tecla)
                            
                            fimescolha    
                        fimenquanto
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


        fimse
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