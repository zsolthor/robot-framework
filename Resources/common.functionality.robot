*** Settings ***
Documentation    commonfunctionality description
Library  SeleniumLibrary

*** Variables ***
&{url_dictionary}  qa=http://qa.demo.com  uat=https://ebay.com  dev=dev.demo.com
#melyik oldalt nyissa meg, ez dictionary: ${url_dictionary.uat}

${milestone}  main
&{browser}  main=chrome  end=firefox  optional=safari
#böngésző meghatarozása és milestone alapján: ${browser.${milestone}}

${sleep_time}  1s
#command line-bol érték változtatással lesz meghívva.
#robot -d results -v sleep_time:5s test/ebay/basicsearch
#példa pluszban: más url vagy más böngésző

*** Keywords ***
Start test case
    Open Browser  ${url_dictionary.uat}  ${browser.${milestone}}
    Maximize Browser Window
    Sleep  ${sleep_time}
    #sleep_time command line-ból változtatva.
End test case
    Close Browser