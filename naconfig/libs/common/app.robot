*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL}                    file://${CURDIR}/../../host/na.html



*** Keywords ***
Open Application
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Evaluate    $options.add_argument("--headless=new")
    Evaluate    $options.add_argument("--no-sandbox")
    Evaluate    $options.add_argument("--disable-dev-shm-usage")
    Evaluate    $options.add_argument("--disable-gpu")
    Evaluate    $options.add_argument("--window-size=1920,1080")
    Open Browser    browser=chrome    options=${options}
    Log    APP_VERSION is set to: ${APP_VERSION}
    Go To    ${URL}
    Capture Page Screenshot    BASE64