*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${URL}                    file://${CURDIR}/../../host/


*** Keywords ***
Initialize Client
    ${username}=    Get Environment Variable    APM_ADMIN_USR
    ${password}=    Get Environment Variable    APM_ADMIN_PSW
    Log    Username: ${username}
    Log    Password: ${password}