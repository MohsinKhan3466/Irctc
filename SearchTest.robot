*** Settings ***
Library    SeleniumLibrary
Library    CSVLibrary

*** Variables ***
${BASE_URL}    https://www.irctc.co.in/nget/train-search
${BROWSER}    Chrome
${TEST_DATA_FILE}    D:\Python_Projects\TestCases\NewTC\data.csv


*** Test Cases ***
Search Test
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    20 seconds
     @{test_data}    SearchClass    ${TEST_DATA_FILE}    ,    "    utf-8
    :FOR    ${row}    IN    @{test_data}
        ${source}    ${destination}    ${date}    ${seatClass}=    Split To Lines
        Search Train    ${source}    ${destination}    ${date}    ${seatClass}
    END
    [Teardown]    Close Browser


*** Keywords ***
SearchClass
    [Arguments]    ${source}    ${destination}    ${date}    ${seatClass}
    [Documentation]    Perform train search
    ${destinationElement}    Set Variable    xpath://input[@class='ng-tns-c57-8 ui-inputtext ui-widget ui-state-default ui-corner-all ui-autocomplete-input ng-star-inserted']
    ${sourceElement}    Set Variable    xpath://input[@class='ng-tns-c57-9 ui-inputtext ui-widget ui-state-default ui-corner-all ui-autocomplete-input ng-star-inserted']
    ${dateElement}    Set Variable    xpath://input[@class='ng-tns-c58-10 ui-inputtext ui-widget ui-state-default ui-corner-all ng-star-inserted']
    ${classElement}    Set Variable    xpath://div[@class='ng-tns-c65-11 ui-dropdown ui-widget ui-state-default ui-corner-all']
    ${searchButton}    Set Variable    xpath://button[@class='search_btn train_Search']

    Wait Until Element Is Visible    ${sourceElement}
    Input Text    ${sourceElement}    ${source}

    Wait Until Element Is Visible    ${destinationElement}
    Input Text    ${destinationElement}    ${destination}

    Wait Until Element Is Visible    ${dateElement}
    Input Text    ${dateElement}    ${date}

    Wait Until Element Is Visible    ${classElement}
    Input Text    ${classElement}    ${seatClass}

    Wait Until Element Is Clickable    ${searchButton}
    Click Element    ${searchButton}

