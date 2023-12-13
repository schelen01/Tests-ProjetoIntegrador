*** Settings ***
Documentation        Caso de teste Cadastro
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

preencher os campos
        Input Text      ${input_nome}             Maria
        Sleep                           1s
        Input Text      ${input_sobrenome}        Kipper
        Sleep                           2s 
        Input Text      ${input_email}            mariakp@gmail.com
        Sleep                           2s 
        Input Text      ${input_password}         Mariaaa123
        Sleep                           2s 
        Input Text      ${input_confirm}          Mariaaa123
        Sleep                           2s 

Clicar em criar conta
        Click Element  ${button_submitConta}
fechar navegador
    Close Browser




*** Test Cases ***
Cenário 1: Abrir a Tela de login
    abrir navegador
    Maximize Browser Window
    preencher os campos
    Sleep                           3s
    Clicar em criar conta
    Sleep                           5s
    fechar navegador
    
