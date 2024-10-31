*** Settings ***
Library           SeleniumLibrary
Library           BuiltIn

*** Variables ***
${BROWSER}        Chrome
${URL}            https://www.saucedemo.com/
${user1}          visual_user
${user2}          standard_user
${user3}          locked_out_user
${user4}          problem_user
${user5}          performance_glitch_user
${user6}          error_user
${incorrect-username}    incorrectusername
${password}       secret_sauce
${nopass}         \
${incorrectpass}    123
${nouser-name}    \

*** Test Cases ***
TC01 : Positive Login Test
    Open Browser    ${URL}    ${BROWSER}
    Location Should Be    ${URL}
    Maximize Browser Window
    Input Text    id=user-name    ${user1}
    Input Text    id=password    ${password}
    Click Element    id:login-button
    Sleep    5s
    [Teardown]    Close Browser

TC02 : Negative Login Test With Incorrect User-name
    Open Browser    ${URL}    ${BROWSER}
    Location Should Be    ${URL}
    Maximize Browser Window
    Input Text    id=user-name    ${incorrect-username}
    Input Text    id=password    ${password}
    Click Element    id:login-button
    Page Should Contain    Epic sadface: Username and password do not match any user in this service
    Sleep    5s
    [Teardown]    Close Browser

TC03 : Negative Login Test With Lock Out Username
    Open Browser    ${URL}    ${BROWSER}
    Location Should Be    ${URL}
    Maximize Browser Window
    Input Text    id=user-name    ${user4}
    Input Text    id=password    ${nopass}
    Click Element    id:login-button
    Page Should Contain    Epic sadface: Password is required
    Sleep    5s
    [Teardown]    Close Browser

TC04 : Negative Login With Incorrect Password
    Open Browser    ${URL}    ${BROWSER}
    Location Should Be    ${URL}
    Maximize Browser Window
    Input Text    id=user-name    ${user3}
    Input Text    id=password    ${password}
    Click Element    id:login-button
    Page Should Contain    Epic sadface: Sorry, this user has been locked out.
    Sleep    5s
    [Teardown]    Close Browser

TC05 : Negative Login Test With No User-name
    Open Browser    ${URL}    ${BROWSER}
    Location Should Be    ${URL}
    Maximize Browser Window
    Input Text    id=user-name    ${nouser-name}
    Input Text    id=password    ${password}
    Click Element    id:login-button
    Page Should Contain    Epic sadface: Username is required
    Sleep    5s
    [Teardown]    Close Browser

TC06 : Negative Login Test With No Password And No User-name
    Open Browser    ${URL}    ${BROWSER}
    Location Should Be    ${URL}
    Maximize Browser Window
    Input Text    id=user-name    ${nouser-name}
    Input Text    id=password    ${nopass}
    Click Element    id:login-button
    Page Should Contain    Epic sadface: Username is required
    Sleep    5s
    [Teardown]    Close Browser
