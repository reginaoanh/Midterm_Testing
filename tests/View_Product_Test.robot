*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn

*** Variables ***
${Browser}        Chrome
${URL}            https://www.saucedemo.com
${USERNAME}       standard_user
${PASSWORD}       secret_sauce

*** Test Cases ***
TC01 : Open browser, sign in
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Element    id=login-button
    Wait Until Page Contains Element    id=inventory_container    10s

TC02 : Count product
    ${products}=    Get Element Count    css=.inventory_item
    Should Be True    ${products} > 0
    Log    Đã tìm thấy ${products} sản phẩm

TC03 : Check Product Details Of The First Products
    Wait Until Page Contains Element    (//div[@class='inventory_item'])[1]    5s
    ${product_name}=    Get Text    css=.inventory_item_name
    ${product_description}=    Get Text    css=.inventory_item_desc
    ${product_price}=    Get Text    css=.inventory_item_price
    Log    Tên sản phẩm: ${product_name}
    Log    Mô tả sản phẩm: ${product_description}
    Log    Giá sản phẩm: ${product_price}
    Should Not Be Empty    ${product_name}    msg=Tên sản phẩm không được rỗng
    Should Not Be Empty    ${product_price}    msg=Giá sản phẩm không được rỗng
    Should Not Be Empty    ${product_description}    msg=Mô tả sản phẩm không được rỗng

TC04 : Check Product Details Of All Products
    @{products}=    Get WebElements    css=.inventory_item
    FOR    ${product}    IN    @{products}
        ${name_locator}=    Set Variable    css=.inventory_item_name
        ${desc_locator}=    Set Variable    css=.inventory_item_desc
        ${price_locator}=    Set Variable    css=.inventory_item_price
        ${product_name}=    Get Text    ${name_locator}
        ${product_description}=    Get Text    ${desc_locator}
        ${product_price}=    Get Text    ${price_locator}
        Log    Tên sản phẩm: ${product_name}
        Log    Mô tả sản phẩm: ${product_description}
        Log    Giá sản phẩm: ${product_price}
        Should Not Be Empty    ${product_name}
        Should Not Be Empty    ${product_description}
        Should Not Be Empty    ${product_price}
    END
    [Teardown]    Close Browser
