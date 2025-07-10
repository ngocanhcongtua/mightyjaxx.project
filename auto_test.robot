*** Settings ***
Library           AppiumLibrary
Resource            ./keywords.robot


*** Variables ***
${REMOTE_URL}         http://127.0.0.1:4723/wd/hub
${APP}                 D:/learn_react_js/app-soft-freeze-3.22.0-1.apk


${PLATFORM}           Android
${DEVICE_NAME}        R9HR201CADJ
${AUTOMATION_NAME}    UiAutomator2

*** Test Cases ***
Browser to product US
    Open App
    I setup country is US region
    I navigate to profile and sign up with Google
    I search and open Pre-Order product
    I filter product after selecting item    Premium Art Toys

