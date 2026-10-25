*** Settings ***
Library    SeleniumLibrary
Resource    ../libs/common/app.robot
Resource    ../libs/common/login.robot

*** Test Cases ***
Verify Reports Page
    [Tags]    Regression
    Verify Reports Page