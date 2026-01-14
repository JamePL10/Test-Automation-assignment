*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/common.robot

*** Test Cases ***
Login Success
    Open Browser
    Maximize Browser Window
    Login Success Pass
    Close Browser

Login Failed Password Incorrect
    Open Browser
    Maximize Browser Window
    Login Failed Password
    Close Browser

Login Failed Username Not Found
    Open Browser
    Maximize Browser Window
    Login Failed Username
    Close Browser