*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
TC LOOP
    [Documentation]  TC to demonstrate FOR loop in Robot Framework
    Set Selenium Implicit Wait  5s

    Open Browser  https://google.com  Chrome
    Sleep  4s
    Maximize Browser Window
    Input Text  name:q  RVC Academy
    Press Keys  xpath://*[@id="tsf"]/div[2]/div[1]/div[3]/center/input[1]  RETURN


    @{results_on_page}=  Get WebElements  xpath://*[@id="rso"]/div


    FOR  ${element}  IN  @{results_on_page}
         ${text}=  Get Text  ${element}
    END

    Close Browser






