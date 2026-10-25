*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}                    file://${CURDIR}/../../host/


*** Keywords ***
Initialize Client
    ${username}=    Set Variable    apmadmin
    ${password}=    Set Variable    admin123
    Log    Username: ${username}
    Log    Password: ${password}

