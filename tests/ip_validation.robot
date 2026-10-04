*** Settings ***
Library    SeleniumLibrary
Library    ../libs/ipvalidation.py

Suite Setup       Open Application
Suite Teardown    Close Browser

*** Variables ***
${URL}                    http://re-birth-2025.web.app/qa/apm/na.html
${IP_FIELD}               id=ipAddress
${VALIDATE_BUTTON}        id=validateBtn
${VALIDATION_MESSAGE}     id=validationMessage
${ERROR_MESSAGE}          id=errorMessage
${NEXT_BUTTON}            id=nextBtn


*** Test Cases ***
Valid IPv4 Is Accepted
    [Documentation]    Verify that a valid IPv4 address is accepted by the UI.
    Go To    ${URL}
    ${ip}=    Set Variable    192.168.1.25
    
    ${expected}=    Is Valid IPv4    ${ip}
    Should Be True    ${expected}

    Input Text    ${IP_FIELD}    ${ip}
    Click Button    ${VALIDATE_BUTTON}
    
    ${visible}=    Run Keyword And Return Status    Element Should Be Visible    ${VALIDATION_MESSAGE}
    Should Be Equal    ${visible}    ${expected}
    Capture Page Screenshot   
 

Invalid IPv4 Is Rejected
    [Documentation]    Verify that an invalid IPv4 address is rejected by the UI.
    Go To    ${URL}
    ${ip}=    Set Variable    192.168.999.25

    ${expected}=    Is Valid IPv4    ${ip}
    Should Not Be True    ${expected}

    Input Text    ${IP_FIELD}    ${ip}
    Click Button    ${VALIDATE_BUTTON}
    ${visible}=    Run Keyword And Return Status    Element Should Be Visible    ${ERROR_MESSAGE}
    # Since expected is False, 'visible' should be True (not equal to expected) if it rejected it properly
    Should Not Be Equal    ${visible}    ${expected}


Valid IPv6 Is Accepted
    [Documentation]    Verify that a valid IPv4 address is accepted by the UI.
    Go To    ${URL}
    ${ip}=    Set Variable    2001:db8::25
    
    ${expected}=    Is Valid IPv6    ${ip}
    Should Be True    ${expected}

    Input Text    ${IP_FIELD}    ${ip}
    Click Button    ${VALIDATE_BUTTON}
    
    ${visible}=    Run Keyword And Return Status    Element Should Be Visible    ${VALIDATION_MESSAGE}
    Should Be Equal    ${visible}    ${expected}
    Capture Page Screenshot   
 

Invalid IPv6 Is Rejected
    [Documentation]    Verify that an invalid IPv4 address is rejected by the UI.
    Go To    ${URL}
    ${ip}=    Set Variable    2001:::25

    ${expected}=    Is Valid IPv6    ${ip}
    Should Not Be True    ${expected}

    Input Text    ${IP_FIELD}    ${ip}
    Click Button    ${VALIDATE_BUTTON}
    ${visible}=    Run Keyword And Return Status    Element Should Be Visible    ${ERROR_MESSAGE}
    # Since expected is False, 'visible' should be True (not equal to expected) if it rejected it properly
    Should Not Be Equal    ${visible}    ${expected}

*** Keywords ***
Open Application
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Evaluate    $options.add_argument("--headless=new")
    Evaluate    $options.add_argument("--no-sandbox")
    Evaluate    $options.add_argument("--disable-dev-shm-usage")
    Evaluate    $options.add_argument("--disable-gpu")
    Evaluate    $options.add_argument("--window-size=1920,1080")
    Open Browser    browser=chrome    options=${options}
