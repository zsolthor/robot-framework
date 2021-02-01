*** Settings ***
Documentation  searc result page objects
Library  SeleniumLibrary
Resource  ./HeaderPage.robot  #forrás megadasa search_text változó miatt egy pont mert ugyanazon a szinten van

*** Variables ***
${search_result}  results for  #változó létrehozva

*** Keywords ***
Verify Search Results
    Page Should Contain  ${search_result} ${search_text}
    Capture Element Screenshot  //h1[text()=' results for ']  filename=_searchResultPicture{index}.png
    #kép készítése találatokról

Verify Search Results with arguments
    [Arguments]  ${search_text_Arg}
    Page Should Contain  ${search_result} ${search_text_Arg}
#Arg hozzáadva a keyword-höz.

