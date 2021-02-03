*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***
TC Radio button operations
    [Documentation]  TC to demonstrate radio button operation keywords

    Open Browser  https://www.sugarcrm.com/request-demo/  Chrome
    Maximize Browser Window

    Scroll Element Into View  xpath://*[@id="field1"]/div/input
    Sleep  3s
    # request a demo gomb lett kiválasztva, hogy addig görgesse amíg az nem láthato

    Page Should Contain Radio Button  xpath://*[@id="doi0"]
    Page Should Not Contain Radio Button  xpath://*[@id="doi00"]
    # oldalon van vagy nincs radio button

    Radio Button Should Not Be Selected  doi  #group name
    # doi csoport nincs kiválasztva

    Select Radio Button  doi  0  #group name + value or id
    Radio Button Should Be Set To  doi  0
    Sleep  4s
    # doi radio button csoportot 0-ra állitok, ez itt a második gomb.
    # ez lett kiválasztva: I'm not interested in more information right now.
    # van ellenőrzés, hogy 2. lett kiválasztva

    Select Radio Button  doi  1  #group name + value or id
    Radio Button Should Be Set To  doi  1
    Sleep  4s
    # doi radio button csoportot 1-re állitok, ez itt az első gomb.
    # ez lett kiválasztva: Please add me to marketing communications. I understand I may opt out at any time.
    # van ellenőrzés, hogy 2. lett kiválasztva

    Close Browser

###https://www.sugarcrm.com/request-demo/###


