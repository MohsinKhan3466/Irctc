*** Settings ***
Library  SelniumLibrary
Library  OperatingSystem

Suite Setup  Open Browser ${IRCTC URL}   ${BROWSER}
Suite Teardown  Close All Browsers

*** Variables ***
${IRCTC URL}    https://www.irctc.co.in/nget/train-search
${BROWSER}   chrome
${DATA_FILE}    TestData/irctc_test_data.csv

*** Test Cases ***
Modify IRCTC Search
      [Documentation]  Modify search on IRCTC page
      ${test_data}   Get Test Data   ${DATA_FILE}
      :FOR  ${data}   IN   @{test_data}
      \     Open IRCTC Page
      \     Modify Search    ${data.source}    ${data.destination}    ${data.date}   ${data.class}


*** Keywords ***
Open IRCTC Page
     Open Browser      ${IRCTC URL}     ${Browser}
     Maximize Browser Window

Modify Search
     [Arguments]   ${source}    ${destination}   ${date}   ${class}
     Input Text    xpath://input[@placeholder='From*']    ${source}
     Input Text    xpath://input[@placeholder='To*']     ${destination}
     Click Element   id:jDate
     Input Text    id:jDate    ${date}
     Click Element  xpath://label[contains(text()),'${class}']

     #Click the search button
     Click Element   id:train-search-btn
     Wait Until Page Contains Element   xpath://h1[contains(text(),'Train Search Result')]

*** Keywords ***
    [Arguments]   ${file_path}
    ${data} =  Parse CSV File   ${file_path}
    [Return]  ${data}