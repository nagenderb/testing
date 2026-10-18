
*** Settings ***
Library    SeleniumLibrary
Resource    ../libs/common/app.robot
Resource    ../libs/common/login.robot
Suite Setup     Initialize Client
Test Setup      Open The Browser
*** Variables ***
${URL}                    file://${CURDIR}/../host/

*** Test Cases ***
Save IPv4 Network Configuration
    Navigate To The Network Configuration
    Input Text    id=ipv4Address    192.168.1.20
    IF    '${APP_VERSION}'  ==  'Latest'
        Input Text    id=subnetMask    255.255.255.0
    ELSE
        No Operation
    END
    Input Text    id=dnsServer      8.8.8.8
    Input Text    id=gateway        192.168.1.1
    Click Button    id=saveConfiguration
    Element Text Should Be    id=statusMessage    Network configuration saved successfully.
    Capture Page Screenshot    BASE64

*** Keywords ***
Open The Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Evaluate    $options.add_argument("--headless=new")
    Evaluate    $options.add_argument("--no-sandbox")
    Evaluate    $options.add_argument("--disable-dev-shm-usage")
    Evaluate    $options.add_argument("--disable-gpu")
    Evaluate    $options.add_argument("--window-size=1920,1080")
    Open Browser    browser=chrome    options=${options}

Navigate To The Network Configuration
    IF    '${APP_VERSION}' == 'Latest'
        Go To    ${URL}latest.html
    ELSE
        Go To    ${URL}old.html
    END
    Capture Page Screenshot    BASE64
