*** Settings ***
Library             String
Documentation       Exemplos de uso de keywords com argumentos



*** Variables ***
&{PESSOA}
...             nome=MaynardJames
...             sobrenome=Keenan


*** Test Cases ***
Test Case #1
    Produzindo um e-mail customizado


*** Keywords ***
Produzindo um e-mail customizado
    Log To Console    ${\n}
    ${VAR}    Gerador de e-mail    ${PESSOA.nome}    ${PESSOA.sobrenome}
    Log To Console    ${VAR}

Gerador de e-mail
    [Arguments]    ${nome}    ${sobrenome}
    ${RANDOM_STRING}    Generate Random String
    RETURN    ${nome}${sobrenome}${RANDOM_STRING}@testerobot.com
