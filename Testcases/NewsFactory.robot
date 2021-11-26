*** Settings ***
Resource    ../Resources/Settings.robot
Resource    ../Resources/Variables.robot
Resource    ../Resources/Keywords.robot


*** Test Cases ***
Login
    Open Backoffice
    Login as Admin
    Wait for loading
    

Publishing news
    Create news
    @{LINES}=    Read file
    : FOR    ${DATA}    IN    @{LINES}
        @{COLUMNS}=    Split String    ${DATA}    separator=,
        Maker Work  @{COLUMNS}
        Sleep    1s
        Checker Work
        Sleep    1s
        Publisher Work
    END