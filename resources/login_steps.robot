*** Settings ***
Library     SeleniumLibrary

*** Variables ***

## 1 - Resolver o problema dos elementos seletores repetidos
## 2 - Implementar campos obrigatorios com Test Templete (DDT)

# Aberir browser
${URL}              http://ninjaplus-web:5000/login
${BROWSER}          chrome

# IDs
${EMAIL_ID}         emailId
${PASS_ID}          passId
${BUTTON_ID}        login

# Timmer
${TIME_SLEEP}       10

# CSS
${MSG_NAME}         .user .info span
${MSG_LOGIN}        .alert


*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Open Browser    ${URL}     ${BROWSER}
    Set Selenium Implicit Wait  ${TIME_SLEEP}
    Maximize Browser Window

Fechar navegador
    Close Browser

#### Steps
Fazendo login com "${email}" a senha "${pass}"
    Input Text      id:${EMAIL_ID}      ${email}
    Input Text      id:${PASS_ID}        ${pass}
    Click Button    id:${BUTTON_ID}

Devo ver o meu nome "${username}" na area logada
    Wait Until Element Contains      css:${MSG_NAME}       ${username}

Devo ver a seguinte mensagem de alerta "${expect_message}"
    Wait Until Element Contains      css:${MSG_LOGIN}     ${expect_message}

Logando com credenciais inavalidas devo receber uma mensagem de alerta

    [Arguments]                         ${email}        ${pass}     ${expect_message}

    Input Text                          id:${EMAIL_ID}      ${email}
    Input Text                          id:${PASS_ID}       ${pass}
    Click Button                        id:${BUTTON_ID}
    Wait Until Element Contains         css:${MSG_LOGIN}      ${expect_message}
