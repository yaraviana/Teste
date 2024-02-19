*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Screenshot
Resource    login_resources.robot
Library    FakerLibrary    
*** Variables ***
 
${URLWOMEN}               http://www.automationpractice.pl/index.php?id_product=1&controller=product#/13-color-orange/2-size-m
${ADDTOCART}              //span[contains(.,'Add to cart')]
${button.exclusive}       button.exclusive
${PRODUTO}                //div[@class='clearfix']
${XBTN}                   //a[@class='btn btn-default button button-medium' and @title='Proceed to checkout']
${XCHECK}                 //a[@class="button btn btn-default standard-checkout button-medium"]
${XBCHECK}                //button[@type='submit'][contains(.,'Proceed to checkout')]
${XCHECK2}                //button[@name="processAddress" and @class="button btn btn-default button-medium"]
${cgv}                    cgv
${BTNPG}                  button.btn.btn-default.button-medium
${CPGTO}                  div.col-xs-12 a.bankwire
${CCOMPRA}                button.btn.btn-default.button-medium
${TCCOMPRA}               Order summary
${TCOMP}                  Your order on My Shop is complete.
${CTERMOS}                Shipping:


*** Keywords ***

Abrir o navegador na pagina women
  Open Browser      browser=chrome
  Maximize Browser Window

 
  [Documentation]    Efetuar login inserindo dados incorretos
Dado que estou na tela de compra
   Go To    url=${URLWOMEN}
E clico no botão Add to cart
  Wait Until Element Is Visible     ${ADDTOCART}
  Click Element    css=${button.exclusive}
    
E clico no botão para confirmar a adição do produto ao carrinho
  Wait Until Element Is Visible    ${PRODUTO}
  Click Element    xpath=${XBTN}
								
E clico no botão checkout
  
  Click Element  xpath=${XCHECK} 
  
E realizo o login
  Efetuar login com sucesso

E clico no botão proced to checkout para informar o endereço
  Wait Until Element Is Visible    ${XBCHECK} 
  Click Element  xpath=${XCHECK2}
E aceito os temos
    Wait Until Page Contains    text=${CTERMOS} 
    Click Element    id=${cgv}
    
E seleciono o pagamento
 
  Click Button    css=${BTNPG}
E Confirmo o pagamento
    Click Element    css=${CPGTO}

E Confirmo a Compra
  Wait Until Page Contains    text=${TCCOMPRA}
  Click Button    css=${CCOMPRA} 
Então vejo mensagem Your order on My Shop is complete
   Wait Until Page Contains    text=${TCOMP}
  ${screenshot_path}  Capture Page Screenshot
  Copy File  ${screenshot_path}  C:/TesteTec/ProjetoTecnico/Resources/Screenshots/sucessoCompra.png
    
 

Efetuar login com sucesso
  Quando preencho o campo email
  E preencho o campo senha com dados validos
  E clico no botão Entrar
  

  