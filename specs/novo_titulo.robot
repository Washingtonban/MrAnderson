*** Settings ***
Documentation   O usuário suas credenciais de acesso e submete o formulário de login
Resource        ../resources/cadastro_steps.robot
Test Template   Cadastrar um novo titulo preenchendo todos os campos obrigatorios


# Setup => coisas que devem acontecer antes do teste
# Teardown => coisas que devem acontecer depois do teste

Test Setup      Abrir navegador
Test Teardown   Fechar navegador

# ATDD (Acceptance Test-Driven Development)

*** Test Cases ***

Cadastrar novo titulo   Club_da_Luta  2019    12/12/2019  Washington

