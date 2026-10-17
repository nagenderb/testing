*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                    file://${CURDIR}/../../host/


*** Keywords ***
Initialize Client
    ${version}=    Set Variable    1.2.4
    Log    CLIENT_VERSION is set to: ${version}