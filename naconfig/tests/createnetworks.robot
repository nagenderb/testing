*** Settings ***
Library    SeleniumLibrary
Resource    ../libs/common/app.robot
Resource    ../libs/common/networkaccess.robot

Test Setup       Open Application

*** Test Cases ***
Save Office Network Configuration
    Input Text    id=networkName    Office-WiFi
    Input Text    id=ipAddress      192.168.10.20
    Input Text    id=subnetMask     255.255.255.0
    Input Text    id=gateway        192.168.10.1
    Input Text    id=dnsServer      192.168.10.5
    Click Button    id=saveConfiguration
    Element Text Should Be    id=statusMessage    Configuration saved successfully for Office-WiFi.
    Capture Page Screenshot    BASE64

Save Lab Network Configuration
    Input Text    id=networkName    QA-Lab
    Input Text    id=ipAddress      10.20.30.40
    Input Text    id=subnetMask     255.255.255.0
    Input Text    id=gateway        10.20.30.1
    Input Text    id=dnsServer      10.20.30.2
    Click Button    id=saveConfiguration
    Element Text Should Be    id=statusMessage    Configuration saved successfully for QA-Lab.
    Capture Page Screenshot    BASE64

Save Development Network Configuration
    Input Text    id=networkName    Dev-Network
    Input Text    id=ipAddress      172.16.5.25
    Input Text    id=subnetMask     255.255.255.0
    Input Text    id=gateway        172.16.5.1
    Input Text    id=dnsServer      172.16.5.2
    Click Button    id=saveConfiguration
    Element Text Should Be    id=statusMessage    Configuration saved successfully for Dev-Network.
    Capture Page Screenshot    BASE64