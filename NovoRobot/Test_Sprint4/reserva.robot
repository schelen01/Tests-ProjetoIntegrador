*** Settings ***
Documentation        Case de Teste na página de reserva do Produto
Library  SeleniumLibrary

*** Variables ***
${BROWSER}                Chrome
${URL_register}           https://carhub-dh.vercel.app/register
${URL_login}              https://carhub-dh.vercel.app/login
${input_nome}             name:firstName
${input_sobrenome}        name:lastName
${input_email}            name:email
${input_password}         name:password
${input_confirm}          name:confirmPassword
${button_submitConta}     //button[contains(text(),"Criar conta")]
${button_submitEnter}     //button[contains(text(), "Entrar")]
${img_category}           //img[contains(@alt, 'Sedan')]
${Ver_oferta}             //a[contains(@href,${//detail/3})]



*** Keywords ***
abrir navegador
        Open Browser    ${URL_register}    ${BROWSER}

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

Iniciar sessão
        Open Browser   ${URL_login}     ${BROWSER}

clicar em Entrar
        Click Element    ${button_submitEnter}

preencher campo entrar
        Input Text       ${input_email}            mariakp@gmail.com
        Sleep                           1s
        Input Text       ${input_password}         Mariaaa123
        Sleep                           2s 


Escolher Categoria desejada
        Click Element      ${img_category}

Escolher o produto
        Click Element      ${Ver_oferta}


*** Test Cases ***
Cenário 1: Abrir a Tela e fazer Cadastro
    abrir navegador
    Maximize Browser Window
    preencher os campos
    Sleep                           3s
    Clicar em criar conta
    Sleep                           10s
    fechar navegador

Cenário 2: Fazer login e selecionar produto
    Iniciar sessão
    Maximize Browser Window
    preencher campo entrar
    clicar em Entrar
    Sleep                           10s
    Escolher Categoria desejada
    Sleep                           5s
    Escolher o produto