*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://www.saucedemo.com/
${browser}  Chrome

${textbox_username}  id:user-name
${textbox_password}  id:password
${btn_login}  xpath://input[@id='login-button']
${txt_error}  xpath://*[@id="login_button_container"]/div/form/h3

# DDTcommon file-ban ezt a *** Settings ***-ben hozzá is kell adni
# Resource  ../TestData/DDTconfig.robot