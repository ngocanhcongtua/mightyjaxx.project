*** Keywords ***
Open App
    [Documentation]    Mở ứng dụng MightyJaxx bằng Appium
    Open Application    ${REMOTE_URL}
    ...    platformName=${PLATFORM}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${APP}
    ...    automationName=${AUTOMATION_NAME}
    ...    appPackage=com.mightyjaxx
    ...    appActivity=com.mightyjaxx.MainActivity
    ...    autoGrantPermissions=true
    ...    autoAcceptAlerts=true
    ...    noReset=false
    Sleep    3s

I setup country is US region
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

I navigate to profile and sign up with Google
    [Documentation]    Mở tab Profile và đăng ký bằng Google
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

I search and open Pre-Order product
    [Documentation]    Tìm kiếm sản phẩm bất kỳ, chọn sản phẩm Pre-order → Cancel → View All
    Wait Until Page Contains Element    xpath=//android.widget.TextView[contains(@text, "Shop")]    timeout=20s
    Click Element    xpath=//android.widget.TextView[contains(@text, "Shop")]
    Sleep    2s
    Capture Page Screenshot

    Wait Until Page Contains Element    xpath=//android.widget.ScrollView//android.view.ViewGroup[1]/android.view.ViewGroup[1]    timeout=20s
    Click Element    xpath=//android.widget.ScrollView//android.view.ViewGroup[1]/android.view.ViewGroup[1]
    Sleep    1s

    Wait Until Page Contains Element    xpath=//android.widget.EditText    timeout=10s
    Input Text    xpath=//android.widget.EditText    XXPlay:
    Press Keycode    66
    Sleep    3s
    Capture Page Screenshot

    Wait Until Page Contains Element    xpath=//android.widget.TextView[contains(@text, "Cancel")]    timeout=10s
    Click Element    xpath=//android.widget.TextView[contains(@text, "Cancel")]
    Sleep    1s

    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text="View all"]    timeout=10s
    Click Element    xpath=//android.widget.TextView[@text="View all"]
    Sleep    2s
    Capture Page Screenshot

I filter product after selecting item
    [Arguments]    ${filter_text}=Free Shipping
    [Documentation]    Từ màn hình "View All" → nhấn filter → chọn radio theo text → Apply filter

    # Mở bộ lọc Filter
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="allProducts_filter"]
    Click Element    xpath=//android.view.ViewGroup[@resource-id="allProducts_filter"]
    Sleep    1s
    Capture Page Screenshot

    FOR    ${i}    IN RANGE    5
        ${found}=    Run Keyword And Return Status
        ...    Page Should Contain Element    xpath=//android.widget.TextView[@text="${filter_text}"]
        Run Keyword If    '${found}' == 'True'    Exit For Loop
        Swipe    500    1600    500    800
        Sleep    1s
    END

    ${radio_xpath}=    Set Variable    //android.widget.TextView[@text="${filter_text}"]/../../..
    Wait Until Element Is Visible    ${radio_xpath}    timeout=10s
    Click Element    ${radio_xpath}
    Sleep    1s
    Capture Page Screenshot
    Wait Until Element Is Visible    xpath=//android.view.ViewGroup[@resource-id="exploreButton"]/com.horcrux.svg.SvgView/com.horcrux.svg.l/com.horcrux.svg.u[1]
    Click Element    xpath=//android.view.ViewGroup[@resource-id="exploreButton"]/com.horcrux.svg.SvgView/com.horcrux.svg.l/com.horcrux.svg.u[1]
    Sleep    3s
    Capture Page Screenshot