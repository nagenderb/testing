*** Settings ***
Library    SeleniumLibrary
Resource    ../libs/common/app.robot
Resource    ../libs/common/networkaccess.robot

Test Setup       Open Application

*** Variables ***
${DOWNLOAD_DIR}        ${CURDIR}/downloads
${EXPORTED_CSV}        ${DOWNLOAD_DIR}/network-list.csv

*** Test Cases ***
Save Office Network Configuration
    networkaccess.Create Network Configuration  Office-WiFi  192.168.10.20  255.255.255.0  192.168.10.1  192.168.10.5
    Capture Page Screenshot    BASE64
    Element Text Should Be    id=statusMessage    Configuration saved successfully for Office-WiFi.

Export Listed Networks To CSV
    Navigate To Network List
    Wait Until Page Contains Element        id=networkCount      10s
    Click Button    id=exportToCsv
    Wait Until Keyword Succeeds    20s    1s    File Should Exist    ${EXPORTED_CSV}
    Wait Until Page Contains    Networks exported successfully
    ${csv_content}=    Get File    ${EXPORTED_CSV}
    Log    Exported CSV contents:
    Log    ${csv_content}
    Capture Page Screenshot    BASE64

