*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/config.robot
*** Keywords ***
Open Browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Login Success Pass
    Wait Until Element Is Visible   ${USERNAME_FIELD}   
    Input Text    ${USERNAME_FIELD}    ${VALID_USERNAME}
    Input Text    ${PASSWORD_FIELD}    ${VALID_PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains    You logged into a secure area!    
    Click Link    ${LOGOUT_BUTTON}
    Wait Until Page Contains    You logged out of the secure area! 

Login Failed Password
    Wait Until Element Is Visible    ${USERNAME_FIELD}  
    Input Text    ${USERNAME_FIELD}    ${VALID_USERNAME}
    Input Text    ${PASSWORD_FIELD}    ${INVALID_PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains    Your password is invalid!

Login Failed Username
    Wait Until Element Is Visible    ${USERNAME_FIELD}
    Input Text    ${USERNAME_FIELD}    ${INVALID_USERNAME}
    Input Text    ${PASSWORD_FIELD}    ${INVALID_PASSWORD}
    Click Button    ${LOGIN_BUTTON}
    Wait Until Page Contains    Your username is invalid!

Validate User Data
    [Arguments]    ${json_body}    ${user_id}
    ${data}=    Get From Dictionary    ${json_body}    data
    Should Be Equal As Integers    ${data['id']}    ${user_id}
    Should Be Equal    ${data['email']}        rachel.howell@reqres.in
    Should Be Equal    ${data['first_name']}   Rachel
    Should Be Equal    ${data['last_name']}    Howell
    Should Be Equal    ${data['avatar']}       https://reqres.in/img/faces/12-image.jpg


Boot Application
    Start Minimal Todo App

Shutdown Application
    Close Minimal Todo App

User Adds Todo
    [Arguments]    ${text}
    Open Add Todo Button
    Input Todo Text    ${text}
    Save Todo

User Removes Todo
    [Arguments]    ${text}
    Delete Todo Item    ${text}

Todo Should Be Visible
    [Arguments]    ${text}
    Verify Todo Item Exists    ${text}

Todo Should Not Be Visible
    [Arguments]    ${text}
    Verify Todo Item Deleted    ${text}

No Todo Should Exist
    Verify Empty Todo Message

All Todos Should Exist
    Todo Should Be Visible    ${TEXT_A}
    Todo Should Be Visible    ${TEXT_B}
    Todo Should Be Visible    ${TEXT_C}

Seed Todo List
    User Adds Todo    ${TEXT_A}
    User Adds Todo    ${TEXT_B}
    User Adds Todo    ${TEXT_C}

Application Should Be Ready
    Verify App Title    Minimal

User Attempts Empty Todo
    Open Add Todo Button
    Input Todo Text    ${EMPTY}
    Save Todo

Generate Long Text
    [Return]    This todo description is intentionally long to validate system behavior with extended input
