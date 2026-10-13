
*** Settings ***
Library    SeleniumLibrary
Library    ../common/app.robot
Library    ../common/login.robot

*** Test Cases ***
Register A New User
    Open Application
    Start Registering
    

##Click Element    xpath=//button[normalize-space(.)='Register' or normalize-space(.)='Signup']
