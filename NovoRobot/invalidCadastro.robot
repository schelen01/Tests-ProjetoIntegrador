*** Settings ***
Documentation        Caso Negativo de teste do Cadastro
Library  SeleniumLibrary

*** Variables ***
${BROWSER}                Chrome
${URL}                    https://carhub-dh.vercel.app/register
${input_nome}             name:firstName
${input_sobrenome}        name:lastName
${input_email}            name:email
${input_password}         name:password
${input_confirm}          name:confirmPassword
${button_submitConta}     //button[contains(text(),"Criar conta")]


*** Keywords ***
abrir navegador
    Open Browser    ${URL}    ${BROWSER}


Campo email invalido
        Input Text      ${input_nome}             Maria
        Sleep                           1s
        Input Text      ${input_sobrenome}        Kipper
        Sleep                           2s 
        Input Text      ${input_email}            mariakpgmail.com
        Sleep                           2s 
        Input Text      ${input_password}         Mariaaa123
        Sleep                           2s 
        Input Text      ${input_confirm}          Mariaaa123
        Sleep                           2s 


Senha invalida
        Input Text      ${input_nome}             Maria
        Sleep                           1s
        Input Text      ${input_sobrenome}        Kipper
        Sleep                           2s 
        Input Text      ${input_email}            mariakp@gmail.com
        Sleep                           2s 
        Input Text      ${input_password}         Mariaa
        Sleep                           2s 
        Input Text      ${input_confirm}          Mari123
        Sleep                           2s 

Nome invalido
        Input Text      ${input_nome}             Ma
        Sleep                           1s
        Input Text      ${input_sobrenome}        Kipper
        Sleep                           2s 
        Input Text      ${input_email}            mariakp@gmail.com
        Sleep                           2s 
        Input Text      ${input_password}         Mari123
        Sleep                           2s 
        Input Text      ${input_confirm}          Mari123
        Sleep                           2s 

Campos vazios
        Input Text      ${input_nome}             ${EMPTY}
        Sleep                           1s
        Input Text      ${input_sobrenome}        ${EMPTY}
        Sleep                           2s 
        Input Text      ${input_email}            ${EMPTY}
        Sleep                           2s 
        Input Text      ${input_password}         ${EMPTY}
        Sleep                           2s 
        Input Text      ${input_confirm}          ${EMPTY}
        Sleep                           2s 
Clicar em criar conta
        Click Element  ${button_submitConta}
fechar navegador
    Close Browser




*** Test Cases ***
Cenário 1: Abrir a Tela de Cadastro com email inválido
    abrir navegador
    Maximize Browser Window
    Campo email invalido
    Sleep                           3s
    Clicar em criar conta
    Sleep                           5s
    fechar navegador
    
Cenário 2: Abrir a Tela de Cadastro com senha incompatível
    abrir navegador
    Maximize Browser Window
    Senha invalida
    Sleep                           3s
    Clicar em criar conta
    Sleep                           5s
    fechar navegador


Cenário 3: Abrir a Tela de Cadastro nome com menos de 3 caracteres
    abrir navegador
    Maximize Browser Window
    Nome invalido
    Sleep                           3s
    Clicar em criar conta
    Sleep                           5s
    fechar navegador

Cenário 4: Abrir a Tela de Cadastro sem Inputs
    abrir navegador
    Maximize Browser Window
    Campos vazios
    Sleep                           3s
    Clicar em criar conta
    Sleep                           5s
    fechar navegador