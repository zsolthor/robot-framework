*** Settings ***
Documentation  Header page page objects
Library  SeleniumLibrary
Variables  ../WebElements.py

*** Variables ***
${search_text}  mobile  #local variable kis betűkkel , scalar variable
@{search_text_list}  book  travel  mobile  robot  anything  #list variable, hivatkozás nulla számtól
&{search_text_dictionary}  abc=book  bcd=mobile  cde=anything  #dictionary key=value

#változo nevek ne legyenek ugyanazok, hiaba mas tipus!
#listában és dictionary-ben egymás között 2 space kell!

*** Keywords ***
Input search text and click search
    Input text  //*[@id="gh-ac"]  ${search_text_dictionary.bcd}
    #${search_text} ez volt első, scalar variable
    #@{search_text_list}[2] ez volt masodik, list
    #${search_text_dictionary.bcd} ez a harmadik, dictionary
    Sleep  1s
    Press Keys  xpath://*[@id="gh-btn"]  [Return]

Click on advanced search link
    Click Element  //*[@id="gh-as-a"]
    Element Text Should Be  //*[@id="gh-title"]  Advanced Search
    Capture Element Screenshot  //*[@id="gh-title"]  filename=_advSearchTextPicture{index}.png
    #ADvanced Search elemről csinál egy képet
    Sleep  1s  #vár X másodpercet

Input search text and click search with arguments
    [Arguments]  ${search_text_Arg}
    Input text  //*[@id="gh-ac"]  ${search_text_Arg}
    Sleep  1s
    Press Keys  xpath://*[@id="gh-btn"]  [Return]
#Arg hozzáadva a keyword-höz.

Input search text and click search with python webelemets
    Input text  ${HeaderPageInputTextBox}  ${search_text_dictionary.bcd}
    Sleep  1s
    Press Keys  ${HeaderPageSearchButton}  [Return]