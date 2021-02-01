*** Settings ***
Documentation  Basic search functionality
#Library  SeleniumLibrary #nem kellett egy felbontás után
Resource  ../../Resources/common.functionality.robot
Resource  ../../Resources/PageObjects/HeaderPage.robot
Resource  ../../Resources/PageObjects/SearchResultPage.robot
#page object model szerint fel lett bontva

Test Setup  Start test case
Test Teardown  End test case
#kezdeti es kilépő feltételek common functionality-ban van definiálva

#a kettos kereszt egy megjeyzést tesz lehetove, nem fut le
*** Variables ***
#common.functionality-ben van olyan változó a sleep_time ami változtatható command line-ból.

*** Test Cases ***

Verify basic search functionality
    [Documentation]  basic searh functionality
    [Tags]  Functional
    HeaderPage.Input search text and click search
    SearchResultPage.Verify Search Results

Verify advanced search functionality
    [Documentation]  advanced search functionality
    [Tags]  Functional
    HeaderPage.Click on advanced search link

Verify basic search functinality with arguments 1
    [Documentation]  basic searh functionality with arguments
    [Tags]  Functional
    HeaderPage.Input search text and click search with arguments  mobile charger
    SearchResultPage.Verify Search Results with arguments  mobile charger

Verify basic search functinality with arguments 2
    [Documentation]  basic searh functionality with arguments
    [Tags]  Functional
    HeaderPage.Input search text and click search with arguments  external battery
    SearchResultPage.Verify Search Results with arguments  external battery
#Arguments-ekkel keresve. Felső 2 teszt. HeaderPage és SearchResultPage uj kewword létrehozva arg-akkal.
#A tesztben ezek a keywordok vannak meghívva. Meghívás után mondom meg arg értékét.

Input search text and click search with python webelemets
    [Documentation]  basic searh functionality with python webelements
    [Tags]  Functional
    HeaderPage.Input search text and click search with python webelemets
    #WebElements.py file-bol felhasznalva.
    SearchResultPage.Verify Search Results

*** Keywords ***



