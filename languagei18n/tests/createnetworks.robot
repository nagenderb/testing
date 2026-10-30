*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Resource    ../libs/common/app.robot
Resource    ../libs/common/networkaccess.robot

Test Setup       Open Application

*** Test Cases ***
Save Office Network Configuration
    ${name_value}=    Get Name From File
    networkaccess.Create Network Configuration  ${name_value}  192.168.10.20  255.255.255.0  192.168.10.1  192.168.10.5
    Element Text Should Be    id=statusMessage    Configuration saved successfully for ${name_value}.
    Capture Page Screenshot    BASE64


*** Keywords ***
Get Name From File
    ${name_value}=    Get File    ${CURDIR}/data.txt    encoding=UTF-8
    Log To Console    Read value: ${name_value}
    Log    Read value: ${name_value}
    RETURN    ${name_value}