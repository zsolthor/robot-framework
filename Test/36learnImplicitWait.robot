*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
TC implicit wait operations
    [Documentation]  TC to demonstrate implicit wait keywords

    ${default_implicit_wait}=  Get Selenium Implicit Wait
    # -->  	${default_implicit_wait} = 0 seconds

    Set Selenium Implicit Wait  20s
    ${custom_implicit_wait}=  Get Selenium Implicit Wait
    # --> ${custom_implicit_wait} = 20 seconds

    Open Browser  https://www.sugarcrm.com/request-demo/  Chrome
    Maximize Browser Window

    Scroll Element Into View  xpath://*[@id="menu-item-115"]/a
    Mouse Down  xpath://*[@id="field25"]/div/input
    Mouse Up  xpath://*[@id="field25"]/div/input

    ### Set Browser Implicit Wait
    Open Browser  https://www.sugarcrm.com/request-demo/  Chrome
    Set Browser Implicit Wait  30s

    ${second_browser_implicit_wait}=  Get Selenium Implicit Wait
    # -->  	${second_browser_implicit_wait} = 20 seconds

    Scroll Element Into View  xpath://*[@id="menu-item-115"]/a
    Mouse Down  xpath://*[@id="field25"]/div/input
    Mouse Up  xpath://*[@id="field25"]/div/input/xyz  #ez hamis locator
    ###

    Close Browser

    ### ha minden elem megtalálható, gyorsan lefut
    ### ha berakunk egy nem korrekt localization-t, akkor vár több időd, hogy megjelenjen
    # Mouse Up  xpath://*[@id="field25"]/div/input/xyzhahaha   mouse up time:00:00:20.495
    # ha kiveszem a set selenium implicit wait-et, akkor idő:   00:00:00.51

    ### videóban nem volt Set Browser Implicit Wait
    # 24es sortól ### Set Browser Implicit Wait új lépések berakva
    # Get Selenium Implicit wait értéke 20sec lesz. Külön Get nincs browser elemre.
    # hamis locator esetén azonban ennyi idő telt el: 00:00:30.561
    # Set Browser Implicit Wait  30s

