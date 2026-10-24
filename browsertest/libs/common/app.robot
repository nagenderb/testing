*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                    file://${CURDIR}/../../host/
${DEFAULT_APP_VERSION}    Latest
${BROWSER}      chrome
*** Keywords ***
Open Application
    Log    BROWSER selected is ${BROWSER}
    Open Browser    ${URL}    {BROWSER}
    Maximize Browser Window
    ${version}=    Get Variable Value    \${APP_VERSION}    ${DEFAULT_APP_VERSION}
    Log    APP_VERSION is set to: ${version}
    Go To    ${URL}${version}.html
    Capture Page Screenshot    BASE64
