*** Settings ***
Documentation  Essa suite testa o site da Amazon.com.br
Resource       amazon_resources.robot
Test Setup     Abrir o navegador
Test Teardown  Fechar o navegador

*** Test Cases ***
Caso de teste #1 - Acesso ao menu "Eletrônicos"
   [Documentation]  Esse teste verifica o menu eletrônicos da Amazon.com.br
   ...              e verifica a categoria Computadores e Informática
   [Tags]           menus  categorias
   Dado que estou na home page da Amazon.com.br
   Quando acessar o menu "Eletrônicos"
   Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
   E o texto "Eletrônicos e Tecnologia" deve ser exibido na página
   E a categoria "Computadores e Informática" deve ser exibida na página


 Caso de testes #2 - Pesquisa de Produto
   [Documentation]  Esse teste verifica a busca de um produto
   [Tags]           busca_produtos  lista_busca
   Dado que estou na home page da Amazon.com.br
   Quando pesquisar pelo produto "Xbox Series S"
   Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
   E um produto da linha "Xbox Series S" deve ser mostrado na página

Caso de Teste #3 - Adicionar Produto no Carrinho
   [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
   [Tags]             adicionar_carrinho
   Dado que estou na home page da Amazon.com.br
   E eu pesquiso pelo produto "Xbox Series S"
   E um produto da linha "Xbox Series S" é mostrado na página
   Quando eu adicionar "Xbox Series S" ao carrinho
   Então a página confirmará que foi adicionado com sucesso
 
Caso de Teste #4 - Remover Produto do Carrinho
   [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
   [Tags]             remover_carrinho
   Dado que estou na home page da Amazon.com.br
   E eu pesquiso pelo produto "Xbox Series S"
   E um produto da linha "Xbox Series S" é mostrado na página
   E eu adiciono "Xbox Series S" ao carrinho
   E a página confirmará que "Xbox Series S" foi adicionado com sucesso
   Quando eu excluir o produto do meu carrinho
   Então a mensagem "Seu carrinho de compras da Amazon está vazio." aparecerá
