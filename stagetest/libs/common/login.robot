*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${register_button}        //button[normalize-space(.)='Register']

*** Keywords ***
Start Registering
    Capture Page Screenshot    BASE64
    Wait Until Element Is Visible    ${register_button}
    Click Element    ${register_button}
    Capture Page Screenshot    BASE64


Verify Registration Modal Message
    
    Wait Until Element Is Visible    id=modalMessage    timeout=5s
    Element Text Should Be    id=modalMessage    You will be redirected to Registration.\nPlease keep your details ready.
User Login
    [Documentation]    Logs in using the provided email and password, then verifies the login modal message.
    [Arguments]    ${email}    ${password}
    Input Text    id=email    ${email}
    Input Password    id=password    ${password}
    Click Element    id=loginBtn
    Element Text Should Be    id=modalMessage    Login button clicked
    Sleep    5s

Navigate To Users
    [Documentation]    Logs in using the provided email and password, then verifies the login modal message.
    Sleep    5s

Edit User
    [Documentation]    Logs in using the provided email and password, then verifies the login modal message.
    Sleep    5s

Verify Changes Of User
[Documentation]    Logs in using the provided email and password, then verifies the login modal message.
    Sleep    5s
