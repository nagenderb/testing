
*** Settings ***
Library    SeleniumLibrary
Resource    ../libs/common/app.robot
Resource    ../libs/common/login.robot

*** Variables ***
${URL}                    file://${CURDIR}/../host/home.html

*** Test Cases ***
Register A New User
    Initialize Client
    Open The Browser
    Navigate To The Applicaiton Home Page

*** Keywords ***
Open The Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Evaluate    $options.add_argument("--headless=new")
    Evaluate    $options.add_argument("--no-sandbox")
    Evaluate    $options.add_argument("--disable-dev-shm-usage")
    Evaluate    $options.add_argument("--disable-gpu")
    Evaluate    $options.add_argument("--window-size=1920,1080")
    Open Browser    browser=chrome    options=${options}

Navigate To The Applicaiton Home Page
    Go To    ${URL}
    Capture Page Screenshot    BASE64
