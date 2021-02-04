*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/DDTcommon.robot

Suite Setup  DDTcommon.Start TestCase
Suite Teardown  DDTcommon.Finish TestCase
Test Template  Invalid Login Scenarios

*** Test Cases ***                                      USERNAME            PASSWORD            ERROR_MSG
Verify Login Fails - Blank username and password        ${Empty}            ${Empty}            Epic sadface: Username is required
Verify Login Fails - Blank username and good password   ${Empty}            secret_sauce        Epic sadface: Username is required
Verify Login Fails - Wrong username                     standard_us         secret_sauce        Epic sadface: Username and password do not match any user in this service
Verify Login Fails - Locked out user                    locked_out_user     secret_sauce        Epic sadface: Sorry, this user has been locked out
Verify Login Fails - Wrong password                     standard_user       secret_sa           Epic sadface: Username and password do not match any user in this service
Verify Login Fails - wrong username and password        standard_us         secret_sa           Epic sadface: Username and password do not match any user in this service

*** Keywords ***
Invalid Login Scenarios
    [Arguments]  ${username}  ${password}  ${error_msg}
    Input Text  ${textbox_username}  ${username}
    Input Text  ${textbox_password}  ${password}
    Click Button  ${btn_login}
    Sleep  2s
    Element Should Contain  ${txt_error}  ${error_msg}

# egyszer kell megírni tsztet és *** Settings ***-ben template-ként kell kezelni
# Test Template  Invalid Login Scenarios

# [Arguments]-ben a 3 változó van, amit DDT-ben (builtin) határoztunk meg:
# ${username}  ${password}  ${error_msg}

# localizációk a DDTconfig file-ban vannak a tesztesethez.
# ${textbox_username}
# ${textbox_password}
# ${btn_login}
# ${txt_error}