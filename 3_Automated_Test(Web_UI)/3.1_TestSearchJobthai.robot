*** Settings ***
Library    SeleniumLibrary
Suite Setup    Set Selenium Speed    0.5s

*** Variables ***
${url}    https://www.jobthai.com/%E0%B8%AB%E0%B8%B2%E0%B8%87%E0%B8%B2%E0%B8%99/
${browser}    edge
${Locator_btn_Close_Pop up}    id=close-button
${Locator_Language}    xpath=//*[@id="lang"]/span
${Locator_Language_English}    xpath=//*[@id="lang-EN"]/span
${Locator_Icon_Metro / BRT}    id=search-text-shortcut-mst
${Locator_Icon_Bus}    id=search-text-shortcut-bus
${Locator_Icon_Industrial Estate}    id=search-text-shortcut-industrial
${Locator_Location_Work}    id=selected-workLocation-0
${Locator_Job Category}    id=selected-jobtype-all
${Locator_Hybrid Work}    id=search-text-hybrid-work
${Locator_Work from Home}    id=search-text-work-from-home
${Locator_Advanced Search}    xpath=//*[@id="search-advance-section-header"]/span
${Locator_Keywords}    CSS=#search-keyword > div > div.ant-col.ant-col-20
${Locator_Enter_Keyword}    id=input-pophover-keyword
${Locator_btn_search}    CSS=#search-submit-btn > div
${Locator_btn_Search_in_Keyword}    id=button-pophover-submit-keyword
${Locator_Img_Found 0 positions}    CSS=#__next > section > main > div > div > section > section > div > div > div > div > div > div.sc-1jn9jx6-1.eEsjbO > div.sc-1jn9jx6-3.gHXaWU > img

*** Keywords ***
Open Web
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Click Element    ${Locator_btn_Close_Pop up}
    Wait Until Page Contains    JobThai

Verify Change Language
    Wait Until Element Is Visible    ${Locator_Language}
    Click Element    ${Locator_Language}
    Wait Until Element Is Visible    ${Locator_Language_English}
    Click Element    ${Locator_Language_English}
    Wait Until Page Contains    EN    

Verify Defualt Filter
    Wait Until Element Is Visible    ${Locator_Location Work}
    Wait Until Element Is Visible    ${Locator_Icon_Metro / BRT}
    Wait Until Element Is Visible    ${Locator_Icon_Bus}
    Wait Until Element Is Visible    ${Locator_Icon_Industrial Estate}
    Wait Until Element Is Visible    ${Locator_Location_Work}
    Wait Until Element Is Visible    ${Locator_Job Category}
    Wait Until Element Is Visible    ${Locator_Hybrid Work}
    Wait Until Element Is Visible    ${Locator_Work from Home}
    Wait Until Element Is Visible    ${Locator_Advanced Search}
    Wait Until Element Is Visible    ${Locator_Keywords}
    Wait Until Element Is Visible    ${Locator_btn_search}

Verify the search by entering the relevant keywords 
    Wait Until Element Is Visible    ${Locator_Keywords}
    Click Element    ${Locator_Keywords}
    Wait Until Element Is Visible    ${Locator_Enter_Keyword}
    Input Text    ${Locator_Enter_Keyword}    Software Tester
    Click Element    ${Locator_btn_Search_in_Keyword}
    Sleep    1s
    Wait Until Page Contains    Software Tester
    Sleep    3s

Verify the search by entering keywords that are not present
    Wait Until Element Is Visible    ${Locator_Keywords}
    Click Element    ${Locator_Keywords}
    Wait Until Element Is Visible    ${Locator_Enter_Keyword}
    Input Text    ${Locator_Enter_Keyword}    xfgjfgk
    Click Element    ${Locator_btn_Search_in_Keyword}
    Sleep    3s
    Wait Until Element Is Visible    ${Locator_Img_Found 0 positions}
    Sleep    3s

*** Test Cases ***
TC1_Open Page
    Open Web
    Close Browser

TC2_Change Language
    Open Web
    Verify Change Language
    Close Browser

TC3_Defualt Page
    Open Web
    Verify Change Language
    Verify Defualt Filter
    Close Browser

TC4_Search Filter entering the relevant keywords
    Open Web
    Verify Change Language
    Verify the search by entering the relevant keywords
    Close Browser

TC5_Search Filter entering keywords that are not present
    Open Web
    Verify Change Language
    Verify the search by entering keywords that are not present
    Close Browser
