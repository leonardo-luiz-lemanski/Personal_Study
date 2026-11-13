Algoritmo "Cash_Register"
Var
    quant_mouse, quant_mouse_ja_selecionado, quant_teclado, quant_teclado_ja_selecionado, quant_mousepad, quant_mousepad_ja_selecionado, numero_selecionado: real

    confirmacao: caractere

procedimento produtos_disponiveis(qm, qmjs, qt, qtjs, qmp, qmpjs: real)
var
qmjs_vt, qtjs_vt, qmpjs_vt, vtc: real

inicio

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
    escreval(" Digite [1] para incluir 1 UN de mouse no carrinho. ")
    escreval(" Digite [2] para incluir 1 UN de teclado no carrinho. ")
    escreval(" Digite [3] para incluir 1 UN de mousepad no carrinho. ")

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
                produtos_disponiveis(quant_mouse, quant_mouse_ja_selecionado, quant_teclado, quant_teclado_ja_selecionado, quant_mousepad, quant_mousepad_ja_selecionado)
                registrar_venda()
                leia(numero_selecionado)

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