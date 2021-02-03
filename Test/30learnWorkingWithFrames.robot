*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
TC Frame Operations
    [Documentation]  TC to demonstrate frame operation keywords

    Open Browser  https://www.w3schools.com/js/tryit.asp?filename=tryjs_alert  Chrome
    Maximize Browser Window
    Sleep  3s
    Click Element  id:accept-choices
    Sleep  1s

    Select Frame  id:iframeResult
    Current Frame Should Contain  JavaScript Alert
    Current Frame Should Not Contain  JavaScript Confirm box two
    Unselect Frame
    Sleep  1s

    Frame Should Contain  id:iframeResult  JavaScript Alert
    Frame Should Contain  id:iframeResult  Try it
    Sleep  1s

    Close Browser


