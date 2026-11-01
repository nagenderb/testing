*** Settings ***
Library    SeleniumLibrary
Resource    ../libs/common/app.robot
Resource    ../libs/common/networkaccess.robot

Test Setup       Open Application

*** Test Cases ***
Save Office Network Configuration
    networkaccess.Create Network Configuration  Office-WiFi  192.168.10.20  255.255.255.0  192.168.10.1  192.168.10.5
    Capture Page Screenshot    BASE64
    Element Text Should Be    id=statusMessage    Configuration saved successfully for Office-WiFi.

Save Configuratioin With IPAddress Only
    Input Text      id=ipAddress    192.168.10.20
    Click Button    id=saveConfiguration
    Capture Page Screenshot    BASE64
    Verify Required Error Message Is Displayed

Save Configuratioin With Nework Name Only
    Input Text      id=networkName      networkNameTest
    Click Button    id=saveConfiguration
    Capture Page Screenshot    BASE64
    Verify Required Error Message Is Displayed   