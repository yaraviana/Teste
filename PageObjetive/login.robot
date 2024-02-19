*** Settings ***
Documentation    Essa suite testa o login na Pratice
Resource         C:/TesteTec/ProjetoTecnico/Resources/login_resources.robot
Resource         C:/TesteTec/ProjetoTecnico/Resources/cadastro_resource.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador


*** Test Cases ***

Caso de Teste 02 - Fazer Login no site Pratice com sucesso
  [Documentation]  Esse teste acessa o site pratice e efetua login com sucesso
  [Tags]           Login_com_sucesso
  Dado que estou na tela de login
  Quando preencho o campo email
  E preencho o campo senha com dados validos
  E clico no botão Entrar
  Então visualizo a tela minha conta

Caso de Teste 01 - Fazer login no site Pratice sem sucesso
   [Documentation]  Esse teste acessa o site pratice e efetua login sem sucesso
   [Tags]           Login_senha_invalida
  Dado que estou na tela de login
  Quando preencho o campo email
  E preencho o campo senha com dados invalidos
  E clico no botão Entrar
  Então visualizo a mensagem Falha na autenticação.
  
