*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn

*** Variables ***
${Browser}        Chrome
${URL}            https://www.saucedemo.com/
${USERNAME}       standard_user
${PASSWORD}       secret_sauce

*** Test Cases ***
TC01 : Check out but missing FirstName
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    css=input#user-name    ${USERNAME}
    Input Text    css=input#password    ${PASSWORD}
    Click Button    css=input[type="submit"]
    Click Link    css=a#item_4_title_link
    Click Button    css=button#add-to-cart
    Click Link    css=a.shopping_cart_link
    Click Button    css=button[data-test="checkout"]
    Input Text    css=input[data-test="lastName"]    Doe
    Input Text    css=input[data-test="postalCode"]    12345
    Click Button    id=continue
    Page Should Contain Element    css=div.error-message-container
    Sleep    5s
    [Teardown]    Close Browser

TC02 : Check out but missing LastName
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    css=input#user-name    ${USERNAME}
    Input Text    css=input#password    ${PASSWORD}
    Click Button    css=input[type="submit"]
    Click Link    css=a#item_4_title_link
    Click Button    css=button#add-to-cart
    Click Link    css=a.shopping_cart_link
    Click Button    css=button[data-test="checkout"]
    Input Text    css=input[data-test="firstName"]    John
    Input Text    css=input[data-test="postalCode"]    12345
    Click Button    id=continue
    Page Should Contain Element    css=div.error-message-container
    Close Browser

TC03 : Check out but missing PostCode
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    css=input#user-name    ${USERNAME}
    Input Text    css=input#password    ${PASSWORD}
    Click Button    css=input[type="submit"]
    Click Link    css=a#item_4_title_link
    Click Button    css=button#add-to-cart
    Click Link    css=a.shopping_cart_link
    Click Button    css=button[data-test="checkout"]
    Input Text    css=input[data-test="firstName"]    John
    Click Button    id=continue
    Page Should Contain Element    css=div.error-message-container
    Close Browser

TC04 : Check out successfully
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    css=input#user-name    ${USERNAME}
    Input Text    css=input#password    ${PASSWORD}
    Click Button    css=input[type="submit"]
    Click Link    css=a#item_1_title_link
    Click Button    css=button#add-to-cart
    Click Link    css=a.shopping_cart_link
    Click Button    css=button[data-test="checkout"]
    Input Text    css=input[data-test="firstName"]    John
    Input Text    css=input[data-test="lastName"]    Doe
    Input Text    css=input[data-test="postalCode"]    12345
    Click Button    id=continue
    Click Button    id=finish
    Sleep    2s
    ${message}    Get Text    xpath=//h2[contains(@class, 'complete-header')][@data-test='complete-header']
    Should Be Equal As Strings    ${message}    Thank you for your order!
    Close Browser

TC05 : Check out successfully and go back All Items
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    css=input#user-name    ${USERNAME}
    Input Text    css=input#password    ${PASSWORD}
    Click Button    css=input[type="submit"]
    Click Link    css=a#item_1_title_link
    Click Button    css=button#add-to-cart
    Click Link    css=a.shopping_cart_link
    Click Button    css=button[data-test="checkout"]
    Input Text    css=input[data-test="firstName"]    John
    Input Text    css=input[data-test="lastName"]    Doe
    Input Text    css=input[data-test="postalCode"]    12345
    Click Button    id=continue
    Click Button    id=finish
    Sleep    2s
    Click Button    id=back-to-products
    ${current_url}    Get Location
    Should Contain    ${current_url}    https://www.saucedemo.com/inventory.html
    Close Browser
