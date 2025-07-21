*** Settings ***
Library    AppiumLibrary
Resource   keywords1.robot

*** Variables ***
${REMOTE_URL}         http://127.0.0.1:4723/wd/hub
${APP}                D:/learn_react_js/app-soft-freeze-3.22.0-1.apk
${PLATFORM}           Android
${DEVICE_NAME}       emulator-5554 
${AUTOMATION_NAME}    UiAutomator2

${CARD_NUMBER}        4242424242424242
${EXPIRY_DATE}        08/30
${CVV}                345
${FIRST_NAME}         test
${LAST_NAME}          123
${ADDRESS}            ha noi
${PHONE}              5714870566

*** Test Cases ***
User Can Checkout With Valid Credit Card
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${APP}
    ...    automationName=${AUTOMATION_NAME}

    Login To App
    Choose Product And Add To Cart
    Proceed To Checkout
    Fill Shipping Information
    Proceed To Payment
    Fill Payment Information And Confirm
    Verify Checkout Successful

    Close Application
