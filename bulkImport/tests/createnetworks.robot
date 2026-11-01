*** Settings ***
Library    SeleniumLibrary
Resource    ../libs/common/app.robot
Resource    ../libs/common/networkaccess.robot

Test Setup       Open Application

*** Variables ***
${BULK_IMPORT_CSV}    ${CURDIR}/bulkimport.csv

*** Test Cases ***
Save Office Network Configuration
    networkaccess.Create Network Configuration  Office-WiFi  192.168.10.20  255.255.255.0  192.168.10.1  192.168.10.5
    Capture Page Screenshot    BASE64
    Element Text Should Be    id=statusMessage    Configuration saved successfully for Office-WiFi.


Bulk Import Network Configurations
    Navigate To Bulk Import
    Wait Until Page Contains Element        id=csvFile      10s
    Choose File     id=csvFile      ${BULK_IMPORT_CSV}
    Wait Until Element Is Visible       id=saveConfigurations
    Capture Page Screenshot     BASE64
    Wait Until Element Contains     id=bulkStatusMessage        loaded successfully
    Click Element       id=saveConfigurations
    Capture Page Screenshot     BASE64
    Wait Until Element Contains     id=bulkStatusMessage        imported successfully