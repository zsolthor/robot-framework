*** Settings ***
LIBRARY  SeleniumLibrary
#a kettos kereszt egy megjeyzést tesz lehetove, nem fut le
*** Variables ***

*** Test Cases ***
This is a simple test case
    [Documentation]  simple test case documentation
    [Tags]  simple test case tag
    Open Browser  http://google.com  chrome
    Close Browser

*** Keywords ***

