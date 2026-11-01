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

Save Configuration With IPAddress Only
    Input Text      id=ipAddress        10.10.10.10
    Click Button    id=saveConfiguration
    Verify Required Parameters Error Message Is Displayed

Save Configuration With Network Onlly
    Input Text      id=networkName      networkNameTest
    Click Button    id=saveConfiguration
    Verify Required Parameters Error Message Is Displayed