*** Settings ***
Library    SeleniumLibrary
Resource    ../libs/common/app.robot
Resource    ../libs/common/networkaccess.robot

Test Setup       Open Application

*** Test Cases ***
Save Office Network Configuration
    networkaccess.Configure Network  Office-WiFi  192.168.10.20  255.255.255.0  192.168.10.1  192.168.10.5

Save Lab Network Configuration
    networkaccess.Configure Network  QA-Lab  10.20.30.40  255.255.255.0  10.20.30.1  10.20.30.2

Save Development Network Configuration
    networkaccess.Configure Network  Dev-Network  172.16.5.25  255.255.255.0  172.16.5.1  172.16.5.2
  