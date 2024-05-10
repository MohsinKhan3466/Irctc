*** Settings ***
Library           ExcelLibrary
Library           SeleniumLibrary

Suite Setup       Open Browser    ${BASE_URL}    ${BROWSER}
Suite Teardown    Close All Browsers

*** Variables ***
${BASE_URL}       https://www.irctc.co.in/nget/train-search
${BROWSER}        Chrome
${EXCEL_FILE}     D:\Python_Projects\testData.xlsx

*** Test Cases ***
Book Train Tickets
    Open Excel    ${EXCEL_FILE}
    @{test_data}=    Read Worksheet As List    TrainBookingData
    FOR    ${data}    IN   @{test_data}
        [Arguments]    ${data}
        Go to    ${BASE_URL}
        Input Text    xpath://input[@class='ng-tns-c57-8 ui-inputtext ui-widget ui-state-default ui-corner-all ui-autocomplete-input ng-star-inserted']    ${data}[0]
        Input Text    xpath://input[@class='ng-tns-c57-9 ui-inputtext ui-widget ui-state-default ui-corner-all ui-autocomplete-input ng-star-inserted']    ${data}[1]
        Input Text    xpath://input[@class='ng-tns-c58-10 ui-inputtext ui-widget ui-state-default ui-corner-all ng-star-inserted']    ${data}[2]
        Select From List by Label    xpath://div[@class='ng-tns-c65-11 ui-dropdown ui-widget ui-state-default ui-corner-all']    ${data}[3]
        Click Element    xpath://button[@class='search_btn train_Search']
    END

*** Keywords ***
Open Excel
    [Arguments]    ${file_path}
    Open Workbook   ${file_path}

