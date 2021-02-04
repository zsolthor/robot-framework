*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
TC IF/ELSE
    [Documentation]  TC to demonstrate IF/ELSE in Robot Framework

    Open Browser  http://saucedemo.com/  Chrome
    Maximize Browser Window
    Input Text  id:user-name  standard_user
    Input Text  Id:password  secret_sauce
    Click Button  xpath://*[@id="login-button"]

    ${items_on_page}=  Get Element Count  //*[@class="inventory_list"]/div
    # --> ${items_on_page} = 6

    Run Keyword If  ${items_on_page}== 10  Test Keyword 1
    ...  ELSE IF  ${items_on_page}< 10 and ${items_on_page}>5  Test Keyword 2
    ...  ELSE  Test Keyword 3
    # a test keyword 2 fog lefutni ebben a példában
    # ha ${items_on_page}== 6  Test Keyword 1, akkor 1-es
    # ha ELSE IF  ${items_on_page}< 10 and ${items_on_page}>6  Test Keyword 2, akkor 3as
### Run Keyword if ${condition} == "Some DAta" Keyword1
### ...  ELSE IF ${condition} == "Some other data" KEyword2
### ...  ELSE Keyword3



*** Keywords ***
Test Keyword 1
    Log To Console  Executed Keyword1 - Found Items as expected
    Close Browser

Test Keyword 2
    Log To Console  Executed Keyword2 - Found less than expected items
    Close Browser

Test Keyword 3
    Log To Console  Executed Keyword3 - Exception
    Close Browser
