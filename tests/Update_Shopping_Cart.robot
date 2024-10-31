*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Browser}        Chrome
${URL}            https://www.saucedemo.com/
${USERNAME}       standard_user
${PASSWORD}       secret_sauce

*** Test Cases ***
TC01 : Thêm sản phẩm vào giỏ hàng sau đó xóa sản phẩm khỏi giỏ hàng
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    css=input#user-name    ${USERNAME}
    Input Text    css=input#password    ${PASSWORD}
    Click Button    css=input[type="submit"]
    Click Link    css=a#item_4_title_link
    Click Button    css=button#add-to-cart
    Click Link    css=a.shopping_cart_link
    Click Button    css=button#remove-sauce-labs-backpack
    Page Should Not Contain Element    css=div.inventory_item_name    Sauce Labs Backpack
    Close Browser

TC02 : Thêm sản phẩm vào giỏ hàng
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    css=input#user-name    ${USERNAME}
    Input Text    css=input#password    ${PASSWORD}
    Click Button    css=input[type="submit"]
    Click Link    css=a#item_4_title_link
    Click Button    css=button#add-to-cart
    Click Link    css=a.shopping_cart_link
    Page Should Contain Element    css=div.inventory_item_name    Sauce Labs Backpack
    Close Browser
