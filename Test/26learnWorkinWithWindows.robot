*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
TC window operations
    [Documentation]  TC to demostrate browser window operation keywords in robot framework

    Open Browser  http://salesforce.com  Chrome  alias=chrome1
    Maximize Browser Window
    Sleep  1s
    Wait Until Element Is Visible  //button[@id='onetrust-accept-btn-handler']
    Click Button  //button[@id='onetrust-accept-btn-handler']
    Click Element  //header/div[2]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[3]/a[1]  CTRL
    # megnyit weboldal, megnyom elfogad gomb és CTRL+eger gombbal uj tab-ra nyit böngészőt

    @{WindowHandles} =  Get Window Handles  # [ CDwindow-ED179761DA43D2E02416047BE2B9DA16 | CDwindow-F42AF2E3AE43C9C9BC9AB42BA098FAA6 ]
    @{WindowIdentifier} =  Get Window Identifiers  # @{WindowIdentifier} = [ undefined | undefined ]
    @{WindowNames} =  Get Window Names  # @{WindowNames} = [ undefined | undefined ]
    @{WindowTitle} =  Get Window Titles  # @@{WindowTitle} = [ CRM Software & Cloud Computing Solutions - Salesforce EMEA | Salesforce Customer Service - Phone Numbers & Live Chat - Salesforce EMEA ]
    # adatok kiolvasása

    Set Window Position  100  200
    ${x}  ${y} =  Get Window Position
    Log  ${x}  #100
    Log  ${y}  #200
    Sleep  1s
    # pozicio beállítása és logolása

    Set Window Size  800  600
    ${width}  ${height} =  Get Window Size
    Log  ${width}  #800
    Log  ${height}  #600
    Sleep  1s
    # méret beállítása és logolása

    Switch Window  @{WindowHandles}[1]
    Log  @{WindowHandles}[1]  # CDwindow-F42AF2E3AE43C9C9BC9AB42BA098FAA6
    Sleep  4s
    Log Location  # -->https://www.salesforce.com/eu/company/contact-us/?d=cta-header-9
    Log Title  # -->Salesforce Customer Service - Phone Numbers & Live Chat - Salesforce EMEA

    # átvált 2. tab-ra

    Switch Window  @{WindowHandles}[0]
    Sleep  4s
    Close Window
    # átvált 1. tab-ra és bezárja

    Switch Window  @{WindowHandles}[1]
    Sleep  4s
    Close Window
    #bezárás miatt kellett switch window???

    #Close All Browsers nem ezt használtam , hanem ablakkonklnt lett becsukva