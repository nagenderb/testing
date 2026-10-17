*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                    file://${CURDIR}/../../host/


*** Keywords ***
Initialize Client
    ${version}=    Get Variable Value       ${CLIENT_VERSION}       1.2.4
    Log    CLIENT_VERSION is set to: ${version}