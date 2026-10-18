*** Settings ***
Library    SeleniumLibrary
Resource    ../libs/common/app.robot
Resource    ../libs/common/networkaccess.robot

Test Setup       Open Application

*** Test Cases ***
Save Office Network Configuration
    networkaccess.Create Network Configuration  Office-WiFi  192.168.10.20  255.255.255.0  192.168.10.1  192.168.10.5
    Element Text Should Be    id=statusMessage    Configuration saved successfully for Office-WiFi.
    Capture Page Screenshot

Save Lab Network Configuration
    networkaccess.Create Network Configuration  QA-Lab  10.20.30.40  255.255.255.0  10.20.30.1  10.20.30.2
    Element Text Should Be    id=statusMessage    Configuration saved successfully for QA-Lab.
    Capture Page Screenshot    ${OUTPUTDIR}/screenshot.png

Save Development Network Configuration
    networkaccess.Create Network Configuration  Dev-Network  172.16.5.25  255.255.255.0  172.16.5.1  172.16.5.2
    Element Text Should Be    id=statusMessage    Configuration saved successfully for Dev-Network.
    Capture Page Screenshot    BASE64