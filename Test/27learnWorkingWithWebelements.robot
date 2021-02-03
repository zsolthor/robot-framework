*** Settings ***
Library  SeleniumLibrary

*** Variables ***


*** Test Cases ***

Working with web elements
    [Documentation]  demonstrate how to work with webelements

    Open Browser  http://google.com  Chrome  alias= chrome
    Maximize Browser Window
    Sleep  5s

    ${attr} =  Get Element Attribute  //*[@id='tsf']//div[3]/center/input[1]  class  #-->${attr} = gNO89b
    ${attr2} =  Get Element Attribute  //*[@id='tsf']//div[3]/center/input[1]  name  #-->${attr2} = btnK
    ${attr3} =  Get Element Attribute  //*[@id='tsf']//div[3]/center/input[1]  value  #-->${attr3} = Google-keresés
    ${attr4} =  Get Element Attribute  //*[@id='tsf']//div[3]/center/input[1]  type  #-->${attr4} = submit
    # google search gomb  --> //*[@id='tsf']//div[3]/center/input[1]  class

    ${count} =  Get Element Count  //*[@id='tsf']//div[3]/center/input[1]  #-->${count} = 1
    ${count} =  Get Element Count  //input  #-->${count} = 8
    ${width}  ${height} =  Get Element Size  //*[@id='tsf']//div[3]/center/input[1]  #${width} = 133  ${height} = 36

    Get WebElement  //*[@id='tsf']//div[3]/center/input[1]
    @{webelements} =  Get WebElements  //*[@id='tsf']//div[3]/center/input[1]
    #--> @{webelements} = [ <selenium.webdriver.remote.webelement.WebElement (session="e115b3ad18294775cef70e67cd96d052", element="88cb4b79-c19a-4756-86e5-3ab70c20b98d")> ]

    Capture Element Screenshot  //input[@name='q']
    # text box kereso --> //input[@name='q']

    Assign Id To Element  name:btnK  RCVid
    Page Should Contain Element  RCVid  #id elemethez rendel és megvizsgál létezik-e

    Element Should Be Focused  //input[@name='q']
    Element Should Be Visible  //input[@name='q']  #tudok írni és látható
    # Herein, visible means that the element is logically visible, not optically visible in the current browser
    # viewport. For example, an element that carries display:none is not logically visible, so using this
    # keyword on that element would fail.

    Input Text  //input[@name='q']  locating web elements
    Capture Element Screenshot  //input[@name='q']
    # text box kereso --> //input[@name='q']
    Sleep  3s
    Clear Element Text  //input[@name='q']

    Cover Element  //*[@id="tsf"]/div[2]/div[1]/div[3]/center/input[2]
    Sleep  4s

    Element Attribute Value Should Be  name:btnK  value  Google-keresés

    Element Should Be Enabled  name:btnK
    Element Should Not Be Visible  name:btnKgf

    Element Should Contain  //*[@id='fsl']/a[3]  évj
    Element Should Not Contain  //*[@id='fsl']/a[3]  Google Search

    Element Text Should Be  //*[@id='fsl']/a[3]  Névjegy
    Element Text Should not be  //*[@id='fsl']/a[3]  How Search

    Double Click Element  //*[@id="gbw"]/div/div/div[1]/div[1]/a  #//*[@id='gb_70']
    Go Back
    Click Element At Coordinates  //*[@id="tsf"]/div[2]/div[1]/div[3]/center/input[2]  1  2  #//*[@id='identifierNext']/div[2]  15  10
    Sleep  4s
    #Element Should Be Disabled  name:btnK  info: nincs oldalon ilyen, ami disabled

    Close Browser