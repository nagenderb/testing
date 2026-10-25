
*** Settings ***
Library    SeleniumLibrary
Resource    ../libs/common/app.robot
Resource    ../libs/common/login.robot

*** Test Cases ***
Register A New User
    Open Application

Edit An Existing User
    Navigate To Users
    Edit User
    Verify Changes Of User
    

##Click Element    xpath=//button[normalize-space(.)='Register' or normalize-space(.)='Signup']
