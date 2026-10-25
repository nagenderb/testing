*** Settings ***
Library    SeleniumLibrary
Resource    ../libs/common/app.robot
Resource    ../libs/common/login.robot

*** Test Cases ***
Verify Valid Login
    [Tags]    Smoke    Regression
    Verify Login Page