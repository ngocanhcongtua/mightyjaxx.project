*** Keywords ***
Open Application
    [Arguments]    ${remote_url}    ${platformName}    ${deviceName}    ${app}    ${automationName}
    AppiumLibrary.Open Application    ${remote_url}
    ...    platformName=${platformName}
    ...    deviceName=${deviceName}
    ...    app=${app}
    ...    automationName=${automationName}
    Sleep    3s

Close Application
    AppiumLibrary.Close Application

Login To App
    [Documentation]    Chọn vùng United States trong màn hình chọn quốc gia
    Wait Until Page Contains Element    xpath=//android.widget.EditText    timeout=20s
    Input Text    xpath=//android.widget.EditText    uni
    Sleep    1s
    Capture Page Screenshot
    Wait Until Page Contains Element    xpath=//android.widget.TextView[contains(@text, "United States")]    timeout=15s
    Click Element    xpath=//android.widget.TextView[contains(@text, "United States")]
    Run Keyword And Ignore Error    Hide Keyboard
    Sleep    1s
    Wait Until Page Contains Element    xpath=//android.widget.TextView[contains(@text, "Save")]    timeout=15s
    Click Element    xpath=//android.widget.TextView[contains(@text, "Save")]
    Sleep    3s
    Capture Page Screenshot
    Run Keyword And Ignore Error    Click Element    xpath=//*[contains(@text, "Continue")]
    Run Keyword And Ignore Error    Click Element    -android uiautomator    new UiSelector().textContains("Continue")
    Sleep    2s
    Capture Page Screenshot 
    Wait Until Page Contains Element    xpath=//android.widget.TextView[contains(@text, "Profile")]    timeout=30s
    Click Element    xpath=//android.widget.TextView[contains(@text, "Profile")]
    Sleep    2s
    Capture Page Screenshot
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="Sign up"]    timeout=15s
    Click Element    xpath=//android.widget.TextView[@text="Sign up"]
    Sleep    2s
    Capture Page Screenshot

    ${signup_btn}=    Run Keyword And Return Status    Wait Until Page Contains Element    xpath=//android.widget.Button[contains(@text, "Sign up")]    timeout=10s
    Run Keyword If    '${signup_btn}'=='True'    Click Element    xpath=//android.widget.Button[contains(@text, "Sign up")]
    Sleep    2s
    Capture Page Screenshot

    Swipe    500    1500    500    800
    FOR    ${i}    IN RANGE    3
        ${visible}=    Run Keyword And Return Status    Page Should Contain Element    xpath=//android.widget.TextView[contains(@text, "Sign up with Google")]
        Run Keyword If    '${visible}'=='True'    Exit For Loop
        Swipe    500    1500    500    800
        Sleep    1s
    END

    Wait Until Page Contains Element    xpath=//android.widget.TextView[contains(@text, "Sign up with Google")]    timeout=20s
    Click Element    xpath=//android.widget.TextView[contains(@text, "Sign up with Google")]
    Sleep    3s
    Capture Page Screenshot
    Wait Until Page Contains Element    xpath=//android.widget.TextView[contains(@text,"@gmail.com")]    timeout=40s
    Click Element    xpath=(//android.widget.TextView[contains(@text,"@gmail.com")])[1]
    Sleep    3s
    Capture Page Screenshot

    Wait Until Page Contains Element    xpath=//android.widget.TextView[contains(@text, "Shop")]    timeout=20s
    Click Element    xpath=//android.widget.TextView[contains(@text, "Shop")]
    Sleep    2s
    Capture Page Screenshot

   
    # Click vào thanh tìm kiếm
    Wait Until Page Contains Element    xpath=//android.widget.ScrollView//android.view.ViewGroup[1]/android.view.ViewGroup[1]    timeout=20s
    Click Element    xpath=//android.widget.ScrollView//android.view.ViewGroup[1]/android.view.ViewGroup[1]
    Sleep    1s
    Wait Until Page Contains Element    xpath=//android.widget.EditText    timeout=10s
    Input Text    xpath=//android.widget.EditText    XXPlay:
    Press Keycode    66
    Sleep    3s

Choose Product And Add To Cart
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="XXPLAY: Adam Bomb by The Hundreds"]    timeout=15s
    Click Element    xpath=//android.widget.TextView[@text="XXPLAY: Adam Bomb by The Hundreds"]
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="Add to cart"]    timeout=15s
   
    Click Element    xpath=//android.widget.TextView[@text="Add to cart"]
    Wait Until Page Contains    Added to cart    timeout=15s
    Sleep    2s
    Wait Until Page Contains Element    xpath=//android.view.View[@content-desc="Go to cart"]    timeout=20s
    Click Element    xpath=//android.view.View[@content-desc="Go to cart"]
    Sleep    2s

Proceed To Checkout
    Click Element    xpath=//android.widget.Button[@text="Continue to checkout"]

Fill Shipping Information
    Input Text    xpath=//android.widget.EditText[@placeholder="First name"]    ${FIRST_NAME}
    Input Text    xpath=//android.widget.EditText[@placeholder="Last name"]     ${LAST_NAME}
    Input Text    xpath=//android.widget.EditText[@placeholder="Address"]       ${ADDRESS}
    Wait Until Element Is Visible    xpath=//android.widget.ListView/android.view.View[1]
    Click Element    xpath=//android.widget.ListView/android.view.View[1]
    Input Text    xpath=//android.widget.EditText[@placeholder="Phone number"]  ${PHONE}
    Click Element    xpath=//android.widget.CheckBox[@resource-id="saveAddress"]
    Click Element    xpath=//android.widget.Button[@text="Continue to shipping"]

Proceed To Payment
    Click Element    xpath=//android.widget.Button[@text="Continue to payment"]

Fill Payment Information And Confirm
    Input Text    xpath=//android.widget.EditText[@placeholder="Card number"]       ${CARD_NUMBER}
    Input Text    xpath=//android.widget.EditText[@placeholder="MM/YY"]             ${EXPIRY_DATE}
    Input Text    xpath=//android.widget.EditText[@placeholder="CVC"]               ${CVV}
    Click Element    xpath=//android.widget.Button[@text="Pay now"]

Verify Checkout Successful
    Wait Until Page Contains Element    xpath=//*[contains(@text, "Thank you")]    timeout=15s
