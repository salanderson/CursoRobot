*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                         http://www.amazon.com.br
${MENU_ELETRONICOS}            //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}          (//h2[contains(.,'Eletrônicos e Tecnologia')])[1]
${TEXTO_HEADER_ELETRONICOS}    Eletrônicos e Tecnologia


*** Keywords ***
Abrir o navegador
    Open Browser    browser=firefox
    Maximize Browser Window

Fechar o navegador
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible     locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Wait Until Page Contains    text=${TEXTO_HEADER_ELETRONICOS}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}
    
    