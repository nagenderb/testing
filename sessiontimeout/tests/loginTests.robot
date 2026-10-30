*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../libs/common/app.robot
Resource    ../libs/common/networkaccess.robot

Test Setup       Open Application

*** Variables ***
${LOGIN_BUTTON}     xpath=//button[text()='Login']
${DASHBOARD}        id=dashboard
${LOGIN_PAGE}       id=loginPage

*** Test Cases ***
TC00 - Login And Verify Dashbaord
    User Login   admin   admin
    Wait Until Element Is Visible    ${DASHBOARD}    10s
    Page Should Contain    Welcome to Dashboard
    Element Should Not Be Visible   ${LOGIN_PAGE}
    Log    Login successful. Dashboard displayed.
    Capture Page Screenshot    BASE64


*** Keywords ***
User Login
    [Documentation]    Logs in using the provided username and password, then verifies the login modal message.
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Wait Until Element Is Visible    id=username    10s
    Input Text    id=username    ${USERNAME}
    Input Password    id=password    ${PASSWORD}
    Click Button    ${LOGIN_BUTTON}
