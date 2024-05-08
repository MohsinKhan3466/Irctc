*** Settings ***
Library    SeleniumLibrary

Suite Setup    Open Browser    ${IRCTC URL}    ${BROWSER}
Suite Teardown    Close All Browsers

*** Variables ***
${IRCTC URL}    https://www.irctc.co.in/nget/train-search
${BROWSER}    chrome

*** Test Cases ***
Modify IRCTC Search
    [Documentation]    Modify search on IRCTC page
    Open IRCTC Page
    Modify Search    ${Source}    ${Destination}    ${Date}    ${Class}
    # Add more test steps as needed

*** Keywords ***
Open IRCTC Page
    Open Browser    ${IRCTC URL}    ${BROWSER}
    Maximize Browser Window

Modify Search
    [Arguments]    ${source}    ${destination}    ${date}    ${class}
    Input Text    xpath://input[@placeholder='From*']    ${source}
    Input Text    xpath://input[@placeholder='To*']    ${destination}
    Click Element    id:jDate
    Input Text    id:jDate    ${date}
    Click Element    xpath://label[contains(text(),'${class}')]
    Click Element    id:train-search-btn
    Wait Until Page Contains Element    xpath://h1[contains(text(),'Train Search Result')]
