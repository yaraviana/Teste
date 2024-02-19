*** Settings ***
Documentation    Essa suite testa o login na Pratice
Resource         C:/TesteTec/ProjetoTecnico/Resources/cadastro_resource.robot
Resource         C:/TesteTec/ProjetoTecnico/Resources/login_resources.robot
Test Setup       Abrir o navegador 
Test Teardown    Fechar o navegador


*** Test Cases ***
Caso de Teste 01 - Realizar um cadastro com sucesso

   [Documentation]  Esse teste cria uma conta com sucesso
   [Tags]           Cadastrar_com_sucesso
  Dado que estou na tela de login
  E informo um email valido
  E clico no botão create an account
  E seleciono a opção gender
  E preencho o campo firtname
  E preencho o campo Last Name
  E preencho o campo password
  E seleciono o dia de nascimento
  E seleciono o Mês de Nascimneto
  E seleciono o ano de nascimento
  E seleciono o campo sign up
  Quando clico no botão register
  Então vejo a mensagem Your account has been created

Caso de Teste 02 - Realizar um cadastro com email invalido

   [Documentation]  Esse teste tenta cadastrar uma conta com email invalido
   [Tags]           Cadastrar_email_invalido
   Dado que estou na tela de login
   Quando informo um email invalido
   E clico no botão create an account
   Então vejo a mensagem Invalid email address


Caso de Teste 03 - Realizar um cadastro com senha invalida

   [Documentation]  Esse teste tenta cadastrar uma conta com email invalido
   [Tags]           Cadastrar_Senha_Invalida
   Dado que estou na tela de login
   E informo um email valido
   E clico no botão create an account
   E seleciono a opção gender
   E preencho o campo firtname
   E preencho o campo Last Name
   Quando preencho o campo password com dados invalidos
   E seleciono o dia de nascimento
   E seleciono o Mês de Nascimneto
   E seleciono o ano de nascimento
   E seleciono o campo sign up
   E clico no botão register
   Então vejo a mensagem passwd is invalid

