*** Settings ***
Library  SeleniumLibrary
# Library  SeleniumLibrary  timeout= 10s
# megváltoztatható itt is timeout értéke, alapból 5 sec volt
# ha megváltoztatás után itt timeout nélkül adjuk meg, akkor 5 lesz értéke újra

*** Variables ***


*** Test Cases ***
TC time and speed operations
    [Documentation]  TC to demonstrate selenium speed and timeout in robot framework

    ${default_selenium_timeout}=  Get Selenium Timeout
    # --> ${default_selenium_timeout} = 5 seconds
    ###Gets the timeout that is used by various keywords.
    #The value is returned as a human-readable string like 1 second.

    ${default_selenium_speed}=  Get Selenium Speed
    # --> ${default_selenium_speed} = 0 seconds
    ### Gets the delay that is waited after each Selenium command.
    #The value is returned as a human-readable string like 1 second.

    Set Selenium Timeout  6s
    Set Selenium Speed  2s

    ###33as teszt beillszt, sleep nélkül
    Open Browser  https://www.sugarcrm.com/request-demo/  Chrome
    Maximize Browser Window
    Scroll Element Into View  id:interest_market_c0
    Mouse Down  xpath://*[@id="field25"]/div/input
    Mouse Up  xpath://*[@id="field25"]/div/input
    Scroll Element Into View  xpath://*[@id="menu-item-115"]/a
    Mouse Down On Link  //*[@id="menu-item-17582"]/a
    Mouse Over  //*[@id="menu-item-21324"]/a
    Mouse Out  //*[@id="menu-item-21324"]/a
    Mouse Down On Image  xpath://footer//div[1]/a/img
    Go To  https://demoqa.com/droppable
    Drag And Drop  //*[@id="draggable"]  //*[@id="droppable"]
    Open Context Menu  xpath://*[@id="droppable"]

    ${default_selenium_timeout1}=  Get Selenium Timeout
     # --> ${default_selenium_timeout1} = 6 seconds
    ${default_selenium_speed1}=  Get Selenium Speed
    # --> ${default_selenium_speed1} = 2 seconds

    ### timeout 5 volt, de 6ra lett állítva
    ### speed 0 volt, de 2re lett állítva
    ### ha *** Settings ***-ben: Library  SeleniumLibrary  timeout= 10s, akkor is felül lesz írva

    ### Timeout keyword-ok várakozása
    ### Speed minden selenium parancs után vár, ez egy késleltetés

    Close Browser