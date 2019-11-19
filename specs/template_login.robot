*** Settings ***
Documentation   O usuário suas credenciais de acesso e submete o formulário de login
Resource        ../resources/login_steps.robot
Test Template   Logando com credenciais inavalidas devo receber uma mensagem de alerta


# Setup => coisas que devem acontecer antes do teste
# Teardown => coisas que devem acontecer depois do teste

#DDT => Teste guiado por dados (Data Driven Testing)

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

# ATDD (Acceptance Test-Driven Development)

*** Test Cases ***

Senha inválida              wassuncaon@gmail.com        123     Usuário e/ou senha inválidos
Usuário não cadastrado      wassun@gmail.com            csa123  Usuário e/ou senha inválidos
#Email deve ser requerido    ""                          csa123  Opps. Cadê o email?
#Senha deve ser requerida    wassuncaon@gmail.com        ""      Opps. Cadê a senha?
