*** Settings ***
Documentation        Caso de teste no Forms do Produto- ADMIN
Library  SeleniumLibrary
Library    Process

*** Variables ***
${BROWSER}                 Chrome
${URL_register}            https://carhub-dh.vercel.app/register
${URL_login}               https://carhub-dh.vercel.app/login
${input_nome}              name:firstName
${input_sobrenome}         name:lastName
${input_email}             name:email
${input_password}          name:password 
${input_confirm}           name:confirmPassword
${button_submitConta}      //button[contains(text(),"Criar conta")]
${button_submitEnter}      //button[contains(text(), "Entrar")]
${button_Painel}           //button[contains(text(), "Painel admin")]
${input_marca}             name:brand   
${input_modelo}            name:model
${input_ano}               name:carYear
${URL_img}                 name:imageUrl
${input_price}             name:pricePerDay
${input_descrição}         name:description
${input_IDcategory}        name:categoryId
${input_IDempresa}         name:rentalCompanyId
${input_IDcaracters}       name:characteristicId
${button_AddCar}           //button[contains(text(), "Adicionar Carro")]


*** Keywords ***
abrir navegador
    Open Browser    ${URL_register}     ${BROWSER}

fazer login
    Open Browser    ${URL_login}     ${BROWSER}

preencher os campos
        Input Text   ${input_nome}         Admin
        Sleep                              1s
        Input Text   ${input_sobrenome}    ADMIN
        Sleep                              1s
        Input Text   ${input_email}        admin@admin.com
        Sleep                              1s
        Input Text   ${input_password}     123456  
        Sleep                              2s 
        Input Text   ${input_confirm}      123456 
        
preencher o login
        Input Text  ${input_email}      admin@admin.com
        Sleep                           1s
        Input Text  ${input_password}   123456 
        Sleep                           2s 

clicar em Criar conta
        Click Element  ${button_submitConta}
clicar em Entrar
        Click Element  ${button_submitEnter}

clicar no Painel de Admin
        Click Element  ${button_Painel} 

fechar navegador
    Close Browser

criar um novo produto
    Input Text    ${input_marca}             Ferrari  
    Input Text    ${input_modelo}            Califórnia Conversível
    Sleep                           2s 
    Input Text    ${input_ano}               2012
    Sleep                           2s 
    Input Text    ${URL_img}                 <img src="https://images.unsplash.com/photo-1610847499832-918a1c3c6811?q=80&w=1964&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"/>
    Sleep                           2s 
    Input Text    ${input_price}             R$ 500
    Sleep                           2s 
    Input Text    ${input_descrição}         A Ferrari Califórnia traz para Maranello a era do câmbio de embreagem dupla e sete marchas e a do teto rígido escamoteável, alternando entre cupê e conversível.
    Sleep                           2s 
    Input Text    ${input_IDcategory}        30
    Sleep                           2s 
    Input Text    ${input_IDempresa}         3
    Sleep                           2s 
    Input Text    ${input_IDcaracters}       5



*** Test Cases ***
Cenário 1: Fazer o cadastro
    abrir navegador
    Maximize Browser Window
    preencher os campos
    Sleep                           2s
    clicar em Criar conta
    Sleep                           10s
    fechar navegador
    

 Cenário 2: Fazer o login
    fazer login
    Maximize Browser Window
    preencher o login
    Sleep                           2s
    clicar em Entrar
    Sleep                           10s  
    clicar no Painel de Admin
    Sleep                           2s
    criar um novo produto
    Sleep                           5s