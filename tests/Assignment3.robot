*** Settings ***
Library    RequestsLibrary
Library    Collections
Resource  ../resources/common.robot
Resource  ../variables/config.robot

*** Test Cases ***
Get User Profile Success
    [Documentation]    Verify API returns correct user data for existing user
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /api/users/${USER_EXIST}    expected_status=anything
    Log    Status Code: ${resp.status_code}
    Log    Response: ${resp.json()}
    Should Be Equal As Integers    ${resp.status_code}    200
    Validate User Data    ${resp.json()}    ${USER_EXIST}


Get User Profile Not Found
    [Documentation]    Verify API returns 404 and empty body when user not found
    Create Session    api    ${BASE_URL}
    ${resp}=    GET On Session    api    /api/users/${USER_NOT_FOUND}    expected_status=anything
    Log    Status Code: ${resp.status_code}
    Log    Response: ${resp.text}
    Should Be Equal As Integers    ${resp.status_code}    404
    Should Be Equal    ${resp.text}    {}
