*** Settings ***
Library     SeleniumLibrary


*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Open Browser    http://ninjaplus-web:5000/login     chrome
    Maximize Browser Window

Fechar navegador
    Close Browser

#### Steps
Fazendo login com "${email}" a senha "${pass}"
    Input Text      id:emailId      ${email}
    Input Text      id:passId       ${pass}
    Click Button    id:login
    Sleep           5

Devo ver o meu nome "${username}" na area logada
    Page Should Contain        ${username}

Devo ver a seguinte mensagem de alerta "${expect_message}"
    Wait Until Element Contain      css:.alert     ${expect_message}

#parei o video 1h33