*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/DDTcommon.robot
Library  DataDriver  ../TestData/TestData2.xls  sheet_name=TestData

Suite Setup  DDTcommon.Start TestCase
Suite Teardown  DDTcommon.Finish TestCase
Test Template  Invalid Login Scenarios

*** Test Cases ***
Verify Login Fails with Invalid Creds  ${username}  ${password}  ${error_msg}

*** Keywords ***
Invalid Login Scenarios
    [Arguments]  ${username}  ${password}  ${error_msg}
    Input Text  ${textbox_username}  ${username}
    Input Text  ${textbox_password}  ${password}
    Click Button  ${btn_login}
    Sleep  1s
    Element Should Contain  ${txt_error}  ${error_msg}