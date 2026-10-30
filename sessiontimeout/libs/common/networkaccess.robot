*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${register_button}        //button[normalize-space(.)='Register']

*** Keywords ***
Create Network Configuration
    [Arguments]     ${networkName}      ${ipAddress}        ${subnetMask}       ${gateway}      ${dnsServer}
    Input Text    id=networkName    ${networkName}
    Input Text    id=ipAddress      ${ipAddress}
    Input Text    id=subnetMask     ${subnetMask}
    Input Text    id=gateway        ${gateway}
    Input Text    id=dnsServer      ${dnsServer}
    Click Button    id=saveConfiguration

Start Registering
    Capture Page Screenshot    BASE64
    Wait Until Element Is Visible    ${register_button}
    Click Element    ${register_button}
    Capture Page Screenshot    BASE64


Verify Registration Modal Message
    
    Wait Until Element Is Visible    id=modalMessage    timeout=5s
    Element Text Should Be    id=modalMessage    You will be redirected to Registration.\nPlease keep your details ready.
User Login
    [Documentation]    Logs in using the provided username and password, then verifies the login modal message.
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Wait Until Element Is Visible    id=username    10s
    Input Text    id=username    ${USERNAME}
    Input Password    id=password    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
