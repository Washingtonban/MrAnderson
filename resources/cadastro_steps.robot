*** Settings ***
Library     SeleniumLibrary

*** Variables ***

## 1 - Resolver o problema dos elementos seletores repetidos
## 2 - Implementar campos obrigatorios com Test Templete (DDT)

# Aberir browser
${URL}              http://ninjaplus-web:5000/movie/add
${BROWSER}          chrome

# Timmer
${TIME_SLEEP}       10

# Cadastro
${CREAT_BUTTON}         .card-title .btn
${TITULO_CSS}           .col-sm-12 .row .col-sm-8 .form-group input
${DROP_BOX_CSS}         .el-input .el-select__caret
${STATUS_CSS}           .el-input .el-input__inner
${LANCAMENTO_CSS}       .col-sm-12 .row .col-md-4 .form-group .form-control
${ESTREIA_CSS}          .col-md-8 .el-date-editor .el-input__inner
${ATORES_CSS}           .form-group .col-sm-12 .row .col-md-12 .form-control
${CREAT_MOVIE_ID}       creat-movie

# IDs
${EMAIL_ID}         emailId
${PASS_ID}          passId
${BUTTON_ID}        login

*** Keywords ***
#### Setup e Teardown
Abrir navegador
    Open Browser    ${URL}     ${BROWSER}
    Set Selenium Implicit Wait  ${TIME_SLEEP}
    Maximize Browser Window
    Input Text      id:${EMAIL_ID}      wassuncaon@gmail.com
    Input Text      id:${PASS_ID}        csa123
    Click Button    id:${BUTTON_ID}
    Set Selenium Implicit Wait          ${TIME_SLEEP}
    Click Button                        css:${CREAT_BUTTON}

Fechar navegador
    Close Browser


Cadastrar um novo titulo preenchendo todos os campos obrigatorios

    [Arguments]      ${titutlo}    ${Datas}   ${Estreia}  ${Atores}

    Input Text                          css:${TITULO_CSS}      ${titutlo}
    Click Button                        css:${DROP_BOX_CSS}
    #Input Text                          css:${STATUS_CSS}       ${Status}
    Input Text                          css:${LANCAMENTO_CSS}   ${Datas}
    Input Text                          css:${ESTREIA_CSS}      ${Estreia}
    Input Text                          css:${ATORES_CSS}       ${Atores}
    Click Button                        id:${CREAT_MOVIE_ID}
    #Wait Until Element Contains         css:${MSG_LOGIN}      ${expect_message}
