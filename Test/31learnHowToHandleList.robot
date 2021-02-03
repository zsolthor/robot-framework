*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://www.sugarcrm.com/request-demo/
${browser}  Chrome
*** Test Cases ***
TC List Operations
    [Documentation]  TC to demonstrate list operation keywords
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    Sleep  2s
    Scroll Element Into View  xpath://*[@id="field1"]/div/input

    Page Should Contain List  xpath://*[@id="field27"]/div/select
    Page Should Not Contain List  xpath://*[@id="field27"]/div/selectttt
    # listát tartalmaz?

    @{AllItems}=  Get List Items  xpath://*[@id="field27"]/div/select
    # --> @{AllItems} = [ Company Size* | 1 - 10 employees | 11 - 50 employees
    #| 51 - 100 employees | 101 - 250 employees | 251 - 500 employees | 501 - 1,000 employees
    #| 1,001 - 2,500 employees | 2,501 - 5,000 employees | 5,...
    ${ListLabel}=  Get Selected List Label  xpath://*[@id="field27"]/div/select
    # -->  	${ListLabel} = Company Size*
    ${ListValue}=  Get Selected List Value  xpath://*[@id="field27"]/div/select
    # -->  	${ListValue} =

    List Selection Should Be  xpath://*[@id="field27"]/div/select  Company Size*
    # alapértelmezett text

    Select From List By Index  xpath://*[@id="field27"]/div/select  1
    # index alapján elem választás
    ${LLabel1}=  Get Selected List Label  xpath://*[@id="field27"]/div/select
    # -->  	${LLabel1} = 1 - 10 employees
    Sleep  2s

    Select From List By Label  xpath://*[@id="field27"]/div/select  51 - 100 employees
    # label alapján elem választás
    ${LLabel2}=  Get Selected List Label  xpath://*[@id="field27"]/div/select
    # --> ${LLabel2} = 51 - 100 employees
    Sleep  2s


    Select From List By Value  xpath://*[@id="field27"]/div/select  level5
    # value alapján elem választás
    ${LLabel3}=  Get Selected List Label  xpath://*[@id="field27"]/div/select
    # --> ${LLabel3} = 251 - 500 employees
    Sleep  2s
    ### index, szám alapján 0-tól kezdődik, tesztben 1 volt
    ### label, tesztben 51 - 100 employees volt
    ### value, tesztben level5 volt
    ### <option value="level1" xpath="1">1 - 10 employees</option>

#   MultiSelect List    https://www.w3schools.com/tags/tryit.asp?filename=tryhtml_select_multiple
    Go To  https://www.w3schools.com/tags/tryit.asp?filename=tryhtml_select_multiple
    Sleep  3s
    Click Element  id:accept-choices
    Sleep  3s

    Select Frame  id:iframeResult
    # frame kiválasztása

    Select All From List  xpath://*[@id="cars"]
    Sleep  2s
    # minden elem kijelölése

    Unselect From List By Value  xpath://*[@id="cars"]  audi
    Sleep  2s
    List Selection Should Be  xpath://*[@id="cars"]  Volvo  Opel  Saab
    # lista elem eltávolítása Value alapján és megmaradt ellenőrzése

    Unselect From List By Index  xpath://*[@id="cars"]  1
    List Selection Should Be  xpath://*[@id="cars"]  Opel  Volvo
    Sleep  2s
    # lista elem eltávolítása index alapján és megmaradt ellenőrzése
    # --> @{ListValues} = [ opel ]  Volvo Saab Opel Audi már csak opel és volvo maradt

    Unselect From List By Label  xpath://*[@id="cars"]  Volvo
    List Selection Should Be  xpath://*[@id="cars"]  Opel
    Sleep  2s
    # lista elem eltávolítása label alapján és megmaradt ellenőrzése

    @{ListValues}=  Get Selected List Values  xpath://*[@id="cars"]
    # --> @{ListValues} = [ opel ]  Volvo Saab Opel Audi már csak opel maradt
    Sleep  2s


    Unselect All From List  xpath://*[@id="cars"]
    Sleep  2s
    # minden elem kijelölés eltávolítása

    List Should Have No Selections  xpath://*[@id="cars"]
    List Selection Should Be  xpath://*[@id="cars"]
    # ellenőriz, hogy üres-e a lista
    # elsőben nincs lista elem, másodikban nincs paraméter mi legyen, tehát üresnek kell lennie
    Close Browser

