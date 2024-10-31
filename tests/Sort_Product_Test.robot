*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn
Library           Collections

*** Variables ***
${Browser}        Chrome
${URL}            https://www.saucedemo.com/
${USERNAME}       standard_user
${PASSWORD}       secret_sauce
${sort_order}     Price (low to high)
${sort_order1}    Price (high to low)
${sort_order2}    Name (A to Z)
${sort_order3}    Name (Z to A)

*** Test Cases ***
TC01 : Sort Product With Price Low To High
    #Open browser and login
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Element    id=login-button
    Wait Until Page Contains Element    id=inventory_container    10s
    #Sort Product Price Low To High
    Select From List By Label    css=.product_sort_container    ${sort_order}
    ${sorted}=    Verify Prices Are Sorted Ascending
    Should Be True    ${sorted}
    Sleep    5s
    [Teardown]    Close Browser

TC02 : Sort Product With Price High To Low
    #Open browser and login
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Element    id=login-button
    Wait Until Page Contains Element    id=inventory_container    10s
    #Sort Product Price High To Low
    Select From List By Label    css=.product_sort_container    ${sort_order1}
    ${sorted}=    Verify Prices Are Sorted Descending
    Should Be True    ${sorted}
    Sleep    5s
    [Teardown]    Close Browser

TC03 : Sort Product With Nam A to Z
    #Open browser and login
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Element    id=login-button
    Wait Until Page Contains Element    id=inventory_container    10s
    #Sort Product Price High To Low
    Select From List By Label    css=.product_sort_container    ${sort_order2}
    ${sorted}=    Verify Prices Are Sorted A To Z
    Should Be True    ${sorted}
    Sleep    5s
    [Teardown]    Close Browser

TC04 : Sort Product With Z to A
    #Open browser and login
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    Input Text    id=user-name    ${USERNAME}
    Input Text    id=password    ${PASSWORD}
    Click Element    id=login-button
    Wait Until Page Contains Element    id=inventory_container    10s
    #Sort Product Price High To Low
    Select From List By Label    css=.product_sort_container    ${sort_order3}
    ${sorted}=    Verify Prices Are Sorted Z To A
    Should Be True    ${sorted}
    Sleep    5s
    [Teardown]    Close Browser

*** Keywords ***
Verify Prices Are Sorted Ascending
    @{price_elements}=    Get WebElements    css=.inventory_item_price
    @{prices}=    Create List
    FOR    ${el}    IN    @{price_elements}
        ${price}=    Get Text    ${el}
        ${price_num}=    Convert To Number    ${price.replace('$', '')}
        Append To List    ${prices}    ${price_num}
        ${is_sorted}=    Evaluate    ${prices} == sorted(${prices}, reverse=False)
    END
    RETURN    ${is_sorted}

Verify Prices Are Sorted Descending
    @{price_elements}=    Get WebElements    css=.inventory_item_price
    @{prices}=    Create List
    FOR    ${el}    IN    @{price_elements}
        ${price}=    Get Text    ${el}
        ${price_num}=    Convert To Number    ${price.replace('$', '')}
        Append To List    ${prices}    ${price_num}
        ${is_sorted}=    Evaluate    ${prices} == sorted(${prices}, reverse=True)
    END
    RETURN    ${is_sorted}

Verify Prices Are Sorted A To Z
    @{name_elements}=    Get WebElements    css=.inventory_item_name
    @{names}=    Create List
    FOR    ${el}    IN    @{name_elements}
        ${name}=    Get Text    ${el}
        Append To List    ${names}    ${name}
        ${is_sorted}=    Evaluate    ${names} == sorted(${names}, reverse=False)
    END
    RETURN    ${is_sorted}

Verify Prices Are Sorted Z To A
    @{name_elements}=    Get WebElements    css=.inventory_item_name
    @{names}=    Create List
    FOR    ${el}    IN    @{name_elements}
        ${name}=    Get Text    ${el}
        Append To List    ${names}    ${name}
        ${is_sorted}=    Evaluate    ${names} == sorted(${names}, reverse=True)
    END
    RETURN    ${is_sorted}
