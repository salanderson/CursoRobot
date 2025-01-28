*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}                     chrome
${URL}                         http://www.amazon.com.br
${MENU_ELETRONICOS}            //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEADER_ELETRONICOS}          (//h2[contains(.,'Eletrônicos e Tecnologia')])[1]
${CLICAR_CAMPO_PESQUISA}       //input[contains(@type,'text')]
${CLICAR_PESQUISAR}            //input[contains(@type,'submit')]
${CLICA_NA_IMG_DO_PRODUTO}     //img[@alt='Xbox Series S']
${CLICAR_NO_PRODUTO}           //img[contains(@alt,'Console Xbox Series S')]
${ADD_CARINHO}                 //input[@name='submit.add-to-cart']
# ${IR_PARA_CARRINHO}            (//a[contains(@href,'gtc')])[2]
${VISUALIZAR_CARRINHO}         //span[contains(@class,'nav-cart-icon nav-sprite')]
${VISUALIZAR_PROD_CARRINHO}    //div[contains(@data-csa-c-item-id,'amzn1.asin.B08JN2VMGX')]
${REMOVER_PROD_CARRINHO}       //span[contains(@data-a-selector,'decrement-icon')]
${VERIFICA_CARRINHO_VAZIO}     (//div[contains(@class,'a-cardui-body a-scroller-none')])[2]




*** Keywords ***
Abrir o navegador
    Open Browser    browser=${BROWSER} 
    ...    options=add_experimental_option("detach", True)
    # Open Browser    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}

    Wait Until Element Is Visible     locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o titulo da pagina fica "${TITULO}" 
    Title Should Be    title=${TITULO}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    locator=//img[contains(@alt,'${NOME_CATEGORIA}')]


# Inicio do caso de testes 2
    
Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Input Text    locator=${CLICAR_CAMPO_PESQUISA}   text=Xbox Series S

Clicar no botão de pesquisa
    Click Element    locator=${CLICAR_PESQUISAR}

Verificar o resultado da pesquisa se esta listando o produto pesquisado "${VISUALIZA_XBOXSERIES}"
    Wait Until Element Is Visible    locator=//img[@alt='${VISUALIZA_XBOXSERIES}']

Clicar no produto "Xbox Series S"
    Click Image    locator=${CLICA_NA_IMG_DO_PRODUTO}


# Inicio do caso de testes 3

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO_LISTADO}"
    Wait Until Element Is Visible    locator=//img[contains(@alt,'${PRODUTO_LISTADO}')]

Adicionar o produto "Console Xbox Series S" no carrinho
    Click Image      locator=${CLICAR_NO_PRODUTO}
    Click Element    locator=${ADD_CARINHO}

Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso
    Wait Until Element Is Visible    locator=//*[@id="sw-atc-details-single-container"]

Remover o produto "Console Xbox Series S" do carrinho
    # Click Element    locator=${IR_PARA_CARRINHO}
    Click Element    locator=${VISUALIZAR_CARRINHO}
    Wait Until Element Is Visible    locator=${VISUALIZAR_PROD_CARRINHO}
    Click Element    locator=${REMOVER_PROD_CARRINHO}

Verificar se o carrinho fica vazio
    # Click Element    locator=${IR_PARA_CARRINHO}
    Click Element    locator=${VISUALIZAR_CARRINHO}
    Wait Until Element Is Visible    locator=${VERIFICA_CARRINHO_VAZIO}
    
    
    
    


    
    