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
    Wait Until Element Is Visible       id=confirmationModal        timeout=10s
    Click Button    id=yesButton

Verify Required Parameters Error Message Is Displayed
    Wait Until Element Is Visible    id=errorModal    timeout=10s
    Capture Page Screenshot    BASE64
    Element Text Should Be    id=errorMessage    Both Network Name and IP Address are mandatory parameters
    Click Button    id=errorOkButton

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

