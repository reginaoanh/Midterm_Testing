*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Browser}        Chrome
${URL}            https://www.saucedemo.com/
${USERNAME}       standard_user
${PASSWORD}       secret_sauce
${NUMBER_OF_PRODUCTS}    3

*** Test Cases ***
TC01 : Open browser And Add Random Product To Cart
    #Open browser and login
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Element    id=login-button
    Wait Until Page Contains Element    id=inventory_container    10s
    #Add random product to cart
    ${product_elements}=    Get WebElements    css=.inventory_item
    ${count}=    Get Length    ${product_elements}
    FOR    ${i}    IN RANGE    ${NUMBER_OF_PRODUCTS}
        ${random_index}=    Evaluate    random.randint(0, ${count} - 1)    modules=random
        ${add_to_cart_button}=    Get WebElement    css=.inventory_item:nth-of-type(${random_index + 1}) button.btn_inventory
        Click Element    ${add_to_cart_button}
        Sleep    1s
    END

TC02 : Go To Cart
    #Go to cart
    Click Element    css=.shopping_cart_link
    Scroll Element Into View    //div[@class='cart_footer']
    sleep    2s

TC03 : Go To Cart And Click Return Inventory Page
    Click Element    css=.back
    sleep    2s

TC04 : Go To Cart And Click Checkout
    Click Element    css=.shopping_cart_link
    Scroll Element Into View    //div[@class='cart_footer']
    Click Element    css=.checkout_button
    sleep    2s
