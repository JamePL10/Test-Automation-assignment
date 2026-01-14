*** Settings ***
Library        ../../Resources/Customlibraies/TouchLibrary.py
Resource       ../../init.txt
Resource  ../resources/common.robot
Resource  ../variables/config.robot

Suite Setup    Boot Application
Suite Teardown Shutdown Application

*** Test Cases ***
TC-001 Application Ready For Use
    [Tags]    Smoke
    Application Should Be Ready
    No Todo Should Exist

TC-002 User Creates Single Todo
    [Tags]    Functional
    User Adds Todo    ${TEXT_A}
    Todo Should Be Visible    ${TEXT_A}

TC-003 User Removes Existing Todo
    [Tags]    Functional
    User Adds Todo    ${TEXT_A}
    User Removes Todo    ${TEXT_A}
    Todo Should Not Be Visible    ${TEXT_A}

TC-004 User Manages Multiple Todos
    [Tags]    Regression
    User Adds Todo    ${TEXT_A}
    User Adds Todo    ${TEXT_B}
    User Adds Todo    ${TEXT_C}
    All Todos Should Exist

TC-005 User Clears Todo List
    [Tags]    Regression
    Seed Todo List
    User Removes Todo    ${TEXT_A}
    User Removes Todo    ${TEXT_B}
    User Removes Todo    ${TEXT_C}
    No Todo Should Exist

TC-006 Todo Accepts Symbols
    [Tags]    Edge
    User Adds Todo    Task!@#$
    Todo Should Be Visible    Task!@#$

TC-007 Todo Accepts Long Description
    [Tags]    Edge
    ${long}=    Generate Long Text
    User Adds Todo    ${long}
    Todo Should Be Visible    ${long}

TC-008 Empty Todo Is Rejected
    [Tags]    Negative
    User Attempts Empty Todo
    No Todo Should Exist

TC-009 Whitespace Todo Is Allowed
    [Tags]    Negative
    User Adds Todo    ${SPACE}${SPACE}
    Todo Should Be Visible    ${SPACE}${SPACE}

TC-010 Unicode Todo Support
    [Tags]    Localization
    User Adds Todo    สวัสดี ✨ Hello こんにちは
    Todo Should Be Visible    สวัสดี ✨ Hello こんにちは

TC-011 Rapid User Interaction
    [Tags]    Performance
    FOR    ${i}    IN RANGE    1    6
        User Adds Todo    Fast ${i}
    END
    FOR    ${i}    IN RANGE    1    6
        User Removes Todo    Fast ${i}
    END
    No Todo Should Exist

TC-012 Duplicate Todo Names
    [Tags]    Data
    User Adds Todo    Same Task
    User Adds Todo    Same Task
    User Removes Todo    Same Task
    User Removes Todo    Same Task
    No Todo Should Exist

TC-013 Create Todo With Reminder
    [Tags]    Functional
    User Schedules Todo    Meeting with Client    27


