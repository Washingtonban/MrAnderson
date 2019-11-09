*** Settings ***
Documentation   O usuário suas credenciais de acesso e submete o formulário de login
Resource        ../resources/login_steps.robot

*** Test Cases ***
Login com sucesso
    Fazendo login com "wassuncaon@gmail.com" a senha "csa123"
    Devo ver o meu nome "Washington" na area logada