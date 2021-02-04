*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
TC Mouse operations
    [Documentation]  TC to demonstrate mouse operation keywords

    Open Browser  https://www.sugarcrm.com/request-demo/  Chrome
    Maximize Browser Window
    Scroll Element Into View  id:interest_market_c0

    Sleep  3s
    Mouse Down  xpath://*[@id="field25"]/div/input
    Sleep  10s
    Mouse Up  xpath://*[@id="field25"]/div/input
    Sleep  3s
    # business phone text box-ba bal egér gomb lenyom 10 másodpercig
    # amig nyomva tart a villogó cursor statikus volt
    # majd elnged, ekkor már villog a cursor a text box-ban

    Scroll Element Into View  xpath://*[@id="menu-item-115"]/a
    Sleep  3s  # legörgetünk aljára, terms of use-ra, itt lesznek linkek

    Mouse Down On Link  //*[@id="menu-item-17582"]/a
    Sleep  3s
    Mouse Over  //*[@id="menu-item-21324"]/a
    Sleep  3s
    Mouse Out  //*[@id="menu-item-21324"]/a
    Sleep  3s
    # sales automation link bal egér lenyom, egeret product supportra viszi és elenged

    Mouse Down On Image  xpath://footer//div[1]/a/img
    Sleep  3s
    # képre bal egér gomb

    Go To  https://demoqa.com/droppable
    Drag And Drop  //*[@id="draggable"]  //*[@id="droppable"]
    Sleep  3s
    # drag and drop: forrás  cél


    Open Context Menu  xpath://*[@id="droppable"]
    Sleep  3s
    # jobb egér gomb a droppable elemre

    Close Browser