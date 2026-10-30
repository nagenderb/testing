*** Settings ***
Library    SeleniumLibrary
Library    Process

*** Variables ***
${URL}                    file://${CURDIR}/../../host/na.html
${DEFAULT_APP_VERSION}    Latest


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
    ${version}=    Get Variable Value    \${APP_VERSION}    ${DEFAULT_APP_VERSION}
    Log    APP_VERSION is set to: ${version}
    Go To    ${URL}
    Capture Page Screenshot    BASE64

Check Selenium version
    ${result}=    Run Process    pip3 freeze | grep selenium    shell=True
    Log    ${result.stdout}