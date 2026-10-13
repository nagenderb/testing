
*** Settings ***
Library    SeleniumLibrary

Suite Setup       Open Browser    file://${CURDIR}/../login.html    chrome
Suite Teardown    Close Browser

*** Test Cases ***
Register Using Visible Text
    Wait Until Element Is Visible    text=Register
    Click Element    text=Register
    Alert Should Be Present    Register button clicked

Login Using Visible Text
    Input Text    id=email    tester@example.com
    Input Password    id=password    SamplePassword123
    Click Element    text=Login
    Alert Should Be Present    Login button clicked


##Click Element    xpath=//button[normalize-space(.)='Register' or normalize-space(.)='Signup']
