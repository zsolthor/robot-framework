*** Settings ***
Documentation    ebayuserfunction description
Library  SeleniumLibrary

*** Keywords ***
Test case 1
    Input text  //*[@id="gh-ac"]  mobile
    Press Keys  xpath://*[@id="gh-btn"]  [Return]
    Page Should Contain  results for mobile

