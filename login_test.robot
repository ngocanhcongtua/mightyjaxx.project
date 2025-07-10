*** Settings ***
Library    AppiumLibrary
Resource   keywords.robot

*** Variables ***
${REMOTE_URL}         http://127.0.0.1:4723/wd/hub
${APP}                D:/learn_react_js/3.22.0(2011232343).apk
${PLATFORM}           Android
${DEVICE_NAME}        samsung a02
${AUTOMATION_NAME}    UiAutomator2
${PACKAGE_NAME}       com.monystudio.detectorhiddendevicesa

*** Test Cases ***
Browser to product US
    [Documentation]    Check Browser to product US
    [Tags]    Browser to product US

    Open App
    I setup country is US region
    I navigate to profile and sign up with Google
    I accept terms and create username
    I search product by keyword
    I check search result is correct
    I sort product list
    I check sort result is correct
