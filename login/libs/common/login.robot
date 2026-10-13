*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                    file://${CURDIR}/../../host/login.html
${register_button}        //button[normalize-space(.)='Register']

*** Keywords ***
Start Registering
    Log    APP_VERSION is set to: ${APP_VERSION}
    Wait Until Element Is Visible    text=Register
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

