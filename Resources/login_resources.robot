*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Screenshot
Library    FakerLibrary


*** Variables ***
${URL}             http://www.automationpractice.pl/index.php?controller=authentication&back=my-account
${USERNAME}        yara_vianaa@hotmail.com
${PASSOWRD}        2201viana
${MY_ACCOUNT}      //i[contains(@class,'icon-home')]
${ERROLOGIN}       //div[@class='alert alert-danger'][contains(.,'Há 1 erro	Falha na autenticação.')]   
${passwd}          passwd 
${email}           email
${SubmitLogin}     SubmitLogin


*** Keywords ***
Abrir o navegador
    Open Browser      browser=chrome
   
    Maximize Browser Window

Fechar o navegador
    Close Browser

 
  [Documentation]    Efetuar login inserindo dados incorretos

Dado que estou na tela de login
   Go To    url=${URL}
Quando preencho o campo email
  Input Text   id=${email}   text=${USERNAME} 

E preencho o campo senha com dados invalidos
  
  Input Text   id=${passwd}    text="dskhsa" 
  
E clico no botão Entrar
  Click Button    id=${SubmitLogin}   

Então visualizo a mensagem Falha na autenticação.
  Wait Until Element Is Not Visible    ${ERROLOGIN}
  ${screenshot_path}  Capture Page Screenshot
  Copy File  ${screenshot_path}  C:/TesteTec/ProjetoTecnico/Resources/Screenshots/FalhanoLogin.png

  [Documentation]   Efetuar login com dados corretos

E preencho o campo senha com dados validos
  Input Text    id=${passwd}  ${PASSOWRD}    

Então visualizo a tela minha conta
  Wait Until Element Is Visible    ${MY_ACCOUNT}
  ${screenshot_path}  Capture Page Screenshot
  Copy File  ${screenshot_path}  C:/TesteTec/ProjetoTecnico/Resources/Screenshots/LoginComSucesso.png

  