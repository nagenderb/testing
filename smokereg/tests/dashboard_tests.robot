*** Settings ***
Library    SeleniumLibrary
Resource    ../libs/common/app.robot
Resource    ../libs/common/login.robot

*** Test Cases ***
Verify Dashboard Loads
    [Tags]    Smoke    Regression
    Verify Dashboard Page