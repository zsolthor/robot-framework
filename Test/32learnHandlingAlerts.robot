*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_alert
${browser}  Chrome
*** Test Cases ***
TC Handling Alerts Operations
    [Documentation]  TC to demonstrate handling alert operation keywords
    Open Browser  ${url}  ${browser}
    Maximize Browser Window
    Sleep  2s
    Click Element  id:accept-choices
    Sleep  2s

    Select Frame  id:iframeResult
    Sleep  2s
    Click Button  xpath:html//body/button
    Sleep  1s
    ${message1}=  Handle Alert  ACCEPT  timeout=5 s
    # -->  	${message1} = Hello! I am an alert box!
    # Accept -- OK -- itt csak egy ok gomb volt


    Go To  https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_confirm
    Select Frame  id:iframeResult
    Click Button  xpath:html//body/button
    Sleep  2s
    ${message2}=  Handle Alert  DISMISS  timeout=2 s
    # --> ${message2} = Press a button!
    # Dismiss -- Cancel -- itt ok és cancel van
    Go To  https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_confirm
    Select Frame  id:iframeResult
    Click Button  xpath:html//body/button
    Sleep  2s
    ${message2}=  Handle Alert  Accept  timeout=2 s
    # --> ${message2} = Press a button!
    # Accept -- Ok -- itt ok és cancel van

    Go To  https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_prompt
    Select Frame  id:iframeResult
    Sleep  2s
    Click Button  xpath:html//body/button
    Input text Into Alert  My lord  action=DISMISS
    Sleep  2s
    # Dismiss -- Cancel, alarm üzenet text-ként megad
    Go To  https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_prompt
    Select Frame  id:iframeResult
    Sleep  2s
    Click Button  xpath:html//body/button
    Input text Into Alert  My lord  action=ACCEPT
    Element Text Should Be  Id:demo  Hello My lord! How are you today?
    Sleep  2s
    # Acept -- Ok, alarm üzenet text-ként megad

    Go To  https://www.w3schools.com/jsref/tryit.asp?filename=tryjsref_alert2
    Select Frame  id:iframeResult
    Click Button  xpath:html//body/button
    Sleep  2s
    Alert Should Be Present  text=Hello How are you?  action=ACCEPT
    # Accept -- OK, alarm üzenet megjelent, ezt check-oljuk itt cask ok gomb van

    Go To  https://www.sugarcrm.com/request-demo/
    Sleep  2s
    Alert Should Not Be Present  action=ACCEPT, timeout=2s
    # nem lesz alarm

    Close Browser