*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br/
${MENU_PRINCIPAL}    id:nav-hamburger-menu
${VENDIDOS}    //a[@href='/gp/bestsellers/?ref_=nav_em_cs_bestsellers_0_1_1_2'][contains(.,'Mais Vendidos')]
${HEADER_ELETRONICOS}    //h1[contains(.,'Eletrônicos e Tecnologia')]
${SEARCH_BAR}    id:twotabsearchtextbox
${SUBMIT_SEARCH}    id:nav-search-submit-button
${ADD_TO_CART}    id:add-to-cart-button
${CART}    id:nav-cart

*** Keywords ***
Abrir o navegador
    Open Browser    browser=Chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}
    Wait Until Element Is Visible    locator=${MENU_PRINCIPAL}

Entrar no menu "Eletrônicos"
    Click Element               locator=${MENU_PRINCIPAL}
    Element Should Be Enabled    (//a[@class='hmenu-item hmenu-compressed-btn'][contains(.,'ver tudo')])[1]
    Click Element                    (//a[@class='hmenu-item hmenu-compressed-btn'][contains(.,'ver tudo')])[1]
    Element Should Be Enabled    //a[@class='hmenu-item'][contains(.,'Eletrônicos, TV e Áudio')]
    Click Element                    //a[@class='hmenu-item'][contains(.,'Eletrônicos, TV e Áudio')]
    Element Should Be Enabled    //a[contains(.,'Tudo em Eletrônicos')]
    Click Element    //a[contains(.,'Tudo em Eletrônicos')]

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains    text=${FRASE}
    Wait Until Element Is Visible    locator=${HEADER_ELETRONICOS}

Verificar se o título da página fica "${TITULO}" 
    Title Should Be    title=${TITULO}
    
Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible    //a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Wait Until Element Is Enabled    locator=${SEARCH_BAR}
    Input Text    locator=${SEARCH_BAR}    text=${PRODUTO}

Clicar no botão de pesquisa
    Element Should Be Enabled    locator=${SUBMIT_SEARCH}
    Click Element    locator=${SUBMIT_SEARCH}

Verificar o resultado da pesquisa, se listando o "${PRODUTO}" pesquisado
    Wait Until Page Contains    text=${PRODUTO}
    Page Should Contain    text=${PRODUTO}

Adicionar o produto "${PRODUTO}" no carrinho
    Wait Until Element Is Enabled    //img[contains(@alt,'${PRODUTO}')]
    Click Element    //img[contains(@alt,'${PRODUTO}')]
    Wait Until Element Is Enabled    locator=${ADD_TO_CART}
    Click Element    locator=${ADD_TO_CART}

Verificar se o produto "${PRODUTO}" foi adicionado com sucesso
    Wait Until Page Contains    Adicionado ao carrinho
    Page Should Contain    Adicionado ao carrinho

Remover o produto "${PRODUTO}" do carrinho
    Element Should Be Enabled    locator=${CART}
    Click Element    locator=${CART}
    Element Should Be Enabled    //input[contains(@aria-label,'Excluir ${PRODUTO}')]
    Click Element    //input[contains(@aria-label,'Excluir ${PRODUTO}')]

Verificar se o carrinho fica vazio
    Wait Until Page Contains    Seu carrinho de compras da Amazon está vazio.
    Page Should Contain    Seu carrinho de compras da Amazon está vazio.

#GHERKIN BDD

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br

Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"

E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
    Verificar se aparece a frase "Eletrônicos e Tecnologia"

E a categoria "Computadores e Informática" deve ser exibida na página
    Verificar se aparece a categoria "Computadores e Informática"

Quando pesquisar pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Então o título da página deve ficar "Amazon.com.br : ${PRODUTO}"
    Title Should Be    title=Amazon.com.br : ${PRODUTO}

E um produto da linha "Xbox Series S" deve ser mostrado na página
    Verificar o resultado da pesquisa, se listando o "Xbox Series S" pesquisado
    
E um produto da linha "Xbox Series S" é mostrado na página
    Verificar o resultado da pesquisa, se listando o "Xbox Series S" pesquisado

E eu pesquiso pelo produto "Xbox Series S"
    Digitar o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa

Quando eu adicionar "Xbox Series S" ao carrinho
    Adicionar o produto "Console Xbox Series S" no carrinho

Então a página confirmará que foi adicionado com sucesso
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

E eu adiciono "Xbox Series S" ao carrinho
    Adicionar o produto "Console Xbox Series S" no carrinho

E a página confirmará que "Xbox Series S" foi adicionado com sucesso
    Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso

Quando eu excluir o produto do meu carrinho
    Remover o produto "Console Xbox Series S" do carrinho

Então a mensagem "${MENSAGEM}" aparecerá
    Wait Until Page Contains    text=${MENSAGEM}
    Page Should Contain    text=${MENSAGEM}

    
    