*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                    file://${CURDIR}/../../host/Latest.html
${DEFAULT_APP_VERSION}    Latest

*** Keywords ***
Open Application
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    ${version}=    Get Variable Value    ${APP_VERSION}    ${DEFAULT_APP_VERSION}
    Log    APP_VERSION is set to: ${version}
    Go To    ${URL}
    Capture Page Screenshot    BASE64

Verify Login Page
    Log    Starting login page verification
    Sleep    2s
    Log    Login page verification completed

Verify Dashboard Page
    Log    Starting dashboard verification
    Sleep    2s
    Log    Dashboard verification completed

Verify User Profile
    Log    Starting user profile regression test
    Sleep    2s
    Log    User profile regression test completed

Verify Reports Page
    Log    Starting reports page regression test
    Sleep    2s
    Log    Reports page regression test completed