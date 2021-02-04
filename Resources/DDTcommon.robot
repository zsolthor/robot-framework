*** Settings ***
Library  SeleniumLibrary
Resource  ../TestData/DDTconfig.robot
### DDTconfig file-ban van url, browser tipus és teszthez szükséges localizációk megadva


*** Keywords ***
Start TestCase
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    Sleep  2s

Finish TestCase
    Close Browser

### Itt van Suite Setup és Suite Teardown meghatározva.

### a 40learnDDT *** Settings ***-ben meg van adva,
###      ezt a file-t ott *** Settings ***-ben meg adni mint resource
###Suite Setup  DDTcommon.Start TestCase
###Suite Teardown  DDTcommon.Finish TestCase
