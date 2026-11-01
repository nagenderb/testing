*** Settings ***
Library    SeleniumLibrary
Library    Process
Library    OperatingSystem
*** Variables ***
${URL}                    file://${CURDIR}/../../host/na.html
${NETWORK_LIST_URL}    file://${CURDIR}/../../host/nalist.html
${DOWNLOAD_DIR}        ${CURDIR}/downloads



*** Keywords ***
Open Application
    Check Selenium version
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Evaluate    $options.add_argument("--headless=new")
    Evaluate    $options.add_argument("--no-sandbox")
    Evaluate    $options.add_argument("--disable-dev-shm-usage")
    Evaluate    $options.add_argument("--disable-gpu")
    Evaluate    $options.add_argument("--window-size=1920,1080")
    Open Browser    browser=chrome    options=${options}
    Go To    ${URL}
    Capture Page Screenshot    BASE64

Navigate To Bulk Import
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Evaluate    $options.add_argument("--headless=new")
    Evaluate    $options.add_argument("--no-sandbox")
    Evaluate    $options.add_argument("--disable-dev-shm-usage")
    Evaluate    $options.add_argument("--disable-gpu")
    Evaluate    $options.add_argument("--window-size=1920,1080")
    Open Browser    browser=chrome    options=${options}
    Go To    file://${CURDIR}/../../host/bulkimport.html
    Capture Page Screenshot    BASE64

Navigate To Network List
    Prepare Download Directory

    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Evaluate    $options.add_argument("--headless=new")
    Evaluate    $options.add_argument("--no-sandbox")
    Evaluate    $options.add_argument("--disable-dev-shm-usage")
    Evaluate    $options.add_argument("--disable-gpu")
    Evaluate    $options.add_argument("--window-size=1920,1080")
    ${prefs}=    Create Dictionary    download.default_directory=${DOWNLOAD_DIR}    prompt_for_download=${FALSE}    download_directory_upgrade=${TRUE}
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Open Browser    ${NETWORK_LIST_URL}    chrome    options=${options}
    Wait Until Page Contains Element    id=networkTable    10s

Check Selenium version
    ${result}=    Run Process    pip3 freeze | grep selenium    shell=True
    Log    ${result.stdout}

*** Keywords ***
Prepare Download Directory
    Create Directory    ${DOWNLOAD_DIR}
    Empty Directory    ${DOWNLOAD_DIR}
