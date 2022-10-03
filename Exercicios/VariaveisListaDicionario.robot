*** Settings ***
Documentation       Exemplos de variáveis dos tipos lista e dicionário


*** Variables ***
@{CALENDAR}
...             JANUARY
...             FEBRUARY
...             MARCH
...             APRIL
...             MAY
...             JUNE
...             JULY
...             AUGUST
...             SEPTEMBER
...             OCTOBER
...             NOVEMBER
...             DECEMBER

&{CAL}
...             jan=31
...             fev=28
...             mar=31
...             apr=30
...             may=31
...             jun=30
...             jul=31
...             aug=31
...             sep=30
...             oct=31
...             nov=30
...             dec=31


*** Test Cases ***
Test Case #1
    Imprima os meses em inglês

Test Case #2
    Imprima a quantidade de dias de cada mês


*** Keywords ***
Imprima os meses em inglês
    Log To Console    ${\n}
    Log To Console    Janeiro em inglês: ${CALENDAR[0]}
    Log To Console    Fevereiro em inglês: ${CALENDAR[1]}
    Log To Console    Março em inglês: ${CALENDAR[2]}
    Log To Console    Abril em inglês: ${CALENDAR[3]}
    Log To Console    Maio em inglês: ${CALENDAR[4]}
    Log To Console    Junho em inglês: ${CALENDAR[5]}
    Log To Console    Julho em inglês: ${CALENDAR[6]}
    Log To Console    Agosto em inglês: ${CALENDAR[7]}
    Log To Console    Setembro em inglês: ${CALENDAR[8]}
    Log To Console    Outubro em inglês: ${CALENDAR[9]}
    Log To Console    Novembro em inglês: ${CALENDAR[10]}
    Log To Console    Dezembro em inglês: ${CALENDAR[11]}

Imprima a quantidade de dias de cada mês
    Log To Console    ${\n}
    Log To Console    Quantidade de dias em janeiro: ${CAL.jan}
    Log To Console    Quantidade de dias em fevereiro: ${CAL.fev}
    Log To Console    Quantidade de dias em março: ${CAL.mar}
    Log To Console    Quantidade de dias em abril: ${CAL.apr}
    Log To Console    Quantidade de dias em maio: ${CAL.may}
    Log To Console    Quantidade de dias em junho: ${CAL.jun}
    Log To Console    Quantidade de dias em julho: ${CAL.jul}
    Log To Console    Quantidade de dias em agosto: ${CAL.aug}
    Log To Console    Quantidade de dias em setembro: ${CAL.sep}
    Log To Console    Quantidade de dias em outubro: ${CAL.oct}
    Log To Console    Quantidade de dias em novembro: ${CAL.nov}
    Log To Console    Quantidade de dias em dezembro: ${CAL.dec}
