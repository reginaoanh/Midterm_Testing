*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${Browser}        Chrome
${URL}            https://www.saucedemo.com
${USERNAME}       standard_user
${PASSWORD}       secret_sauce

*** Test Cases ***
TC01 : Log out successfully
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    css=input#user-name    ${USERNAME}
    Input Text    css=input#password    ${PASSWORD}
    Click Button    css=input[type="submit"]
    Click Button    css=#react-burger-menu-btn
    Wait Until Page Contains Element    css=a.bm-item.menu-item[data-test="logout-sidebar-link"]
    Execute JavaScript    window.scrollTo(0, document.querySelector('a.bm-item.menu-item[data-test="logout-sidebar-link"]').getBoundingClientRect().top)
    Wait Until Element Is Visible    css=a#logout_sidebar_link
    Click Element    css=a#logout_sidebar_link
    Close Browser

TC02 : Check login status after logging out
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Input Text    css=input#user-name    ${USERNAME}
    Input Text    css=input#password    ${PASSWORD}
    Click Button    css=input[type="submit"]
    Click Button    css=#react-burger-menu-btn
    Wait Until Page Contains Element    css=a.bm-item.menu-item[data-test="logout-sidebar-link"]
    Execute JavaScript    window.scrollTo(0, document.querySelector('a.bm-item.menu-item[data-test="logout-sidebar-link"]').getBoundingClientRect().top)
    Wait Until Element Is Visible    css=a#logout_sidebar_link
    Click Element    css=a#logout_sidebar_link
    Page Should Contain Element    css=.submit-button.btn_action
    Close Browser
