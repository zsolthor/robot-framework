*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
TC Checkboxes operations
    [Documentation]  TC to demonstrate radio button operation keywords

    Open Browser  https://www.sugarcrm.com/request-demo/  Chrome
    Maximize Browser Window

    Scroll Element Into View  xpath://*[@id="field1"]/div/input
    Sleep  3s
    # request a demo gomb lett kiválasztva, hogy addig görgesse amíg az nem láthato

    Page Should Contain Checkbox  id:interest_market_c0
    Page Should Contain Checkbox  id:interest_sell_c0
    Page Should Contain Checkbox  id:interest_serve_c0
    Page Should Not Contain Checkbox  id:interest_serve_c1
    Capture Page Screenshot  filename=checkbox{index}.png
    # 3 checkbox létezik és egy nem

    Select Checkbox  id:interest_market_c0
    Checkbox Should Be Selected  id:interest_market_c0
    Checkbox Should Not Be Selected  id:interest_sell_c0
    Checkbox Should Not Be Selected  id:interest_serve_c0
    Sleep  1s
    # beállít 1., ellenőríz, mint 3-at

    Select Checkbox  id:interest_sell_c0
    Checkbox Should Be Selected  id:interest_market_c0
    Checkbox Should Be Selected  id:interest_sell_c0
    Checkbox Should Not Be Selected  id:interest_serve_c0
    Sleep  1s
    # beállít 2., ellenőríz, mint 3-at

    Select Checkbox  id:interest_serve_c0
    Checkbox Should Be Selected  id:interest_market_c0
    Checkbox Should Be Selected  id:interest_sell_c0
    Checkbox Should Be Selected  id:interest_serve_c0
    Sleep  1s
    Capture Page Screenshot  filename=checkbox{index}.png
    # beállít 3., ellenőríz, mint 3-at

    Unselect Checkbox  id:interest_market_c0
    Unselect Checkbox  id:interest_sell_c0
    Unselect Checkbox  id:interest_serve_c0
    Checkbox Should Not Be Selected  id:interest_market_c0
    Checkbox Should Not Be Selected  id:interest_sell_c0
    Checkbox Should Not Be Selected  id:interest_serve_c0
    Capture Page Screenshot  filename=checkbox{index}.png

    Sleep  3s

    Close Browser

###https://www.sugarcrm.com/request-demo/###


