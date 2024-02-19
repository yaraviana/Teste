*** Settings ***
Library      SeleniumLibrary
Library      OperatingSystem
Library      Screenshot
Library      FakerLibrary


*** Variables ***


${GENDER}          id_gender2
${FISTNAME}        customer_firstname
${LASTNAME}        customer_lastname 
${PASSWD}          passwd
${RGENDER}         //input[@type='radio'][contains(@id,'gender2')]
${EDAY}            //select[contains(@name,'days')]
${EMONTH}          //select[contains(@name,'months')]
${EMAIL}           email_create
${DAY}             days  
${MONTH}           months
${EYEAR}           //select[contains(@name,'years')]
${YEAR}            years
${RSUCESS}        //p[@class='alert alert-success'][contains(.,'Your account has been created.')]
${ERMAIL}         //li[contains(.,'Invalid email address.')]
${SubmitCreate}    SubmitCreate
${newsletter}      newsletter
${submitAccount}   submitAccount
${PERROR}          //li[contains(.,'passwd is invalid.')]

*** Keywords ***


 E informo um email valido
  ${EMAILFAKE}       FakerLibrary.Email

  Input Text    id=${EMAIL}    ${EMAILFAKE} 
E clico no botão create an account
  Click Button    id=${SubmitCreate}

E seleciono a opção gender
  Wait Until Element Is Visible      ${RGENDER}     30
  Click Element      id= ${GENDER}

E preencho o campo firtname
  ${FISTNAMEFAKE}    FakerLibrary.First Name

  Input Text    id=${FISTNAME}    ${FISTNAMEFAKE}

E preencho o campo Last Name
  ${LASTNAMEFAKE}    FakerLibrary.Last Name


  Input Text    id=${LASTNAME}     ${LASTNAMEFAKE}

E preencho o campo password

  ${PASSWRDFAKE}     FakerLibrary.Password

  Input Text    id=${PASSWD}        ${PASSWRDFAKE}
  
E seleciono o dia de nascimento

  Wait Until Page Contains Element    ${EDAY}    timeout=10s
  Select From List by Value  id=${DAY}    15

E seleciono o Mês de Nascimneto

  Wait Until Page Contains Element    ${EMONTH}    timeout=10s
  Select From List by Value  id=${MONTH}    1
  
E seleciono o ano de nascimento
  Wait Until Page Contains Element    ${EYEAR}
  Select From List by Value  id=${YEAR}    1995

E seleciono o campo sign up

  Select Checkbox  id=${newsletter}

Quando clico no botão register
  Click Button    id=${submitAccount}

Então vejo a mensagem Your account has been created
  Wait Until Page Contains Element    ${RSUCESS}
  ${screenshot_path}  Capture Page Screenshot
  Copy File  ${screenshot_path}  C:/TesteTec/ProjetoTecnico/Resources/Screenshots/ContaCriada.png

Quando informo um email invalido
  Input Text    id=${EMAIL}     text=hdsahj
Então vejo a mensagem Invalid email address
  Wait Until Page Contains Element    ${ERMAIL}
  ${screenshot_path}  Capture Page Screenshot
  Copy File  ${screenshot_path}  C:/TesteTec/ProjetoTecnico/Resources/Screenshots/EmailInvalido.png

E clico no botão register
  Quando clico no botão register

Quando preencho o campo password com dados invalidos
  ${PASSWRDFAKE}     FakerLibrary.Password

  Input Text    id=${PASSWD}        text=1

Então vejo a mensagem passwd is invalid

  Wait Until Page Contains Element    ${PERROR}
  ${screenshot_path}  Capture Page Screenshot
  Copy File  ${screenshot_path}  C:/TesteTec/ProjetoTecnico/Resources/Screenshots/EmailInvalido.png
