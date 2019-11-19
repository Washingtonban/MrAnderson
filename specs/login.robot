*** Settings ***
Documentation   O usuário suas credenciais de acesso e submete o formulário de login
Resource        ../resources/login_steps.robot


# Setup => coisas que devem acontecer antes do teste
# Teardown => coisas que devem acontecer depois do teste

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

# ATDD (Acceptance Test-Driven Development)

*** Test Cases ***
Login com sucesso
    Fazendo login com "wassuncaon@gmail.com" a senha "csa123"
    Devo ver o meu nome "Washington" na area logada

Senha inválida
    Fazendo login com "wassuncaon@gmail.com" a senha "123"
    Devo ver a seguinte mensagem de alerta "Usuário e/ou senha inválidos"

Usuário não cadastrado
    Fazendo login com "wassun@gmail.com" a senha "csa123"
    Devo ver a seguinte mensagem de alerta "Usuário e/ou senha inválidos"

Email deve ser requerido
    Fazendo login com "" a senha "csa123"
    Devo ver a seguinte mensagem de alerta "Opps. Cadê o email?"

Senha deve ser requerida
    Fazendo login com "wassuncaon@gmail.com" a senha ""
    Devo ver a seguinte mensagem de alerta "Opps. Cadê a senha?"