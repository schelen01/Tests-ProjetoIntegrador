*** Settings ***
Documentation        Caso de teste Negativo de acesso à tela de login
Library  SeleniumLibrary

*** Variables ***
${BROWSER}                Chrome
${URL}                    https://carhub-dh.vercel.app/login
${input_email}            name:email
${input_password}         name:password 
${button_submitEnter}     //button[contains(text(), "Entrar")]

*** Keywords ***
abrir navegador
    Open Browser    ${URL}    ${BROWSER}

preencher os campos
        Input Text  ${input_email}      admin@gmail.com
        Sleep                           1s
        Input Text  ${input_password}   admin123  
        Sleep                           2s 
        
clicar em Entrar
        Click Element  ${button_submitEnter}


Campo invalido
        Input Text  ${input_email}      admingmail.com            
        Sleep                           1s
        Input Text  ${input_password}   admin123  
        Sleep                           2s

Senha invalida
        Input Text  ${input_email}      admin@admin.com            
        Sleep                           1s
        Input Text  ${input_password}   12  
        Sleep                           2s
fechar navegador
    Close Browser




*** Test Cases ***
Cenário 1: Abrir a Tela de login
    abrir navegador
    Maximize Browser Window
    preencher os campos
    clicar em Entrar
    Sleep                           2s
    fechar navegador
    
Cenário 2: Abrir a Tela de login com erro no email
    abrir navegador
    Maximize Browser Window
    Campo invalido
    clicar em Entrar
    Sleep                           2s
    fechar navegador

Cenário 3: Abrir a Tela de login com erro no email
    abrir navegador
    Maximize Browser Window
    Senha invalida
    clicar em Entrar
    Sleep                           2s
    fechar navegador