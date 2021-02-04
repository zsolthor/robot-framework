*** Settings ***
Library  SeleniumLibrary

*** Variables ***

*** Test Cases ***
TC explicit wait operations
    [Documentation]  TC to demonstrate explicit wait keywords

    Open Browser  https://www.sugarcrm.com/request-demo/  Chrome
    Maximize Browser Window

    Scroll Element Into View  xpath://*[@id="menu-item-115"]/a

    Wait Until Page Contains  With our customers
    #Waits until text appears on the current page.
    Wait Until Page Contains Element  xpath://*[@id="menu-item-115"]/a
    #Waits until the element locator appears on the current page.
    Wait Until Page Does Not Contain  With our customersxyz
    #Waits until text disappears from the current page.
    Wait Until Page Does Not Contain Element  xpath://*[@id="menu-item-115"]/axyz
    #Waits until the element locator disappears from the current page.

    Wait Until Location Is  https://www.sugarcrm.com/request-demo/
    #Waits until the current URL is expected.
    Wait Until Location Is Not  https://www.sugarcrm.com/request-demo/xyz
    #Waits until the current URL is not location.
    Wait Until Location Contains  crm
    #Waits until the current URL contains expected.
    Wait Until Location Does Not Contain  crmxyz
    #Waits until the current URL does not contains location.

    Wait Until Element Contains  xpath:/html/body/div/footer/div/div[2]/div   © 2021 SugarCRM. All Rights Reserved.
    #Waits until the element locator contains text.
    Wait Until Element Does Not Contain  xpath://*[@id="menu-item-117"]  Legalxyz
    #Waits until the element locator does not contain text.
    Wait Until Element Is Visible  xpath://*[@id="menu-item-117"]
    #Waits until the element locator is visible.
    Wait Until Element Is Not Visible  xpath://*[@id="menu-item-117"]/axyz
    #Waits until the element locator is not visible.
    Wait Until Element Is Enabled  xpath://*[@id="menu-item-117"]
    #Waits until the element locator is enabled.

    Close Browser



