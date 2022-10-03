*** Settings ***
Documentation       Entendendo o uso de loops


*** Variables ***
@{NUMLIST}      1    2    3    4    5    6    7    8    9    10


*** Test Cases ***
Test Case #1
    Separe os números 5 e 10


*** Keywords ***
Separe os números 5 e 10
    Log To Console    ${\n}
    FOR    ${NUMERO}    IN    @{NUMLIST}
        IF    ${NUMERO} == 5
            Log To Console    Eu sou o número 5!
            Log    Eu sou o número 5!
        ELSE IF    ${NUMERO} == 10
            Log To Console    Eu sou o número 10!
            Log    Eu sou o número 10!
        ELSE
            Log To Console    Eu não sou o número 5 e nem o 10!
            Log    Eu não sou o número 5 e nem o 10!
        END
    END
