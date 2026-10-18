*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    file://${CURDIR}/network_config.html    chrome
Suite Teardown    Close All Browsers

*** Test Cases ***
Save IPv4 Network Configuration With Subnet Mask
    Input Text    id=ipv4Address    192.168.1.20
    Input Text    id=subnetMask     255.255.255.0
    Input Text    id=dnsServer      8.8.8.8
    Input Text    id=gateway        192.168.1.1
    Click Button    id=saveConfiguration
    Element Text Should Be    id=statusMessage    Network configuration saved successfully.
    Element Text Should Contain    id=savedSummary    192.168.1.20
    Element Text Should Contain    id=savedSummary    255.255.255.0
    Element Text Should Contain    id=savedSummary    8.8.8.8
    Element Text Should Contain    id=savedSummary    192.168.1.1
