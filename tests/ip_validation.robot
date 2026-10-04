*** Settings ***
Library    Browser
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
    New Page    ${URL}
    ${ip}=    Set Variable    192.168.1.25

    ${expected}=    Is Valid IPv4    ${ip}
    Should Be True    ${expected}

    Fill Text    ${IP_FIELD}    ${ip}
    Click    ${VALIDATE_BUTTON}

    ${actual}=    Get Element States    ${VALIDATION_MESSAGE}
    ${visible}=    Evaluate    "visible" in ${actual}
    Should Be Equal    ${visible}    ${expected}

    Take Screenshot


Invalid IPv4 Is Rejected
    [Documentation]    Verify that an invalid IPv4 address is rejected by the UI.
    New Page    ${URL}
    ${ip}=    Set Variable    192.168.999.25

    ${expected}=    Is Valid IPv4    ${ip}
    Should Not Be True    ${expected}

    Fill Text    ${IP_FIELD}    ${ip}
    Click    ${VALIDATE_BUTTON}

    ${actual}=    Get Element States    ${ERROR_MESSAGE}
    ${visible}=    Evaluate    "visible" in ${actual}
    Should Not Be Equal    ${visible}    ${expected}



*** Keywords ***
Open Application
    New Browser    chromium    headless=False
    New Context