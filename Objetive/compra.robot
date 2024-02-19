*** Settings ***
Documentation    Essa suite testa o login na Pratice
Resource         C:/TesteTec/ProjetoTecnico/Resources/compra_resources.robot
Resource         C:/TesteTec/ProjetoTecnico/Resources/login_resources.robot         
Test Setup       Abrir o navegador na pagina women
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Realizar uma compra com sucesso
   [Documentation]  Esse teste acessa o site pratice e efetua login sem sucesso
   [Tags]           Comprar
  Dado que estou na tela de compra
  E clico no botão Add to cart
  E clico no botão para confirmar a adição do produto ao carrinho
  E clico no botão checkout
  E realizo o login
  E clico no botão proced to checkout para informar o endereço
  E aceito os temos
  E seleciono o pagamento
  E Confirmo o pagamento
  E Confirmo a Compra
  Então vejo mensagem Your order on My Shop is complete
