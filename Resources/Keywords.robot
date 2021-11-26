*** Keywords ***
Wait for loading
    Wait for condition  return document.readyState === 'complete'
    
Open Backoffice
    Open Browser    ${TargetWebsite}    ${CHROME}
    Sleep    1s


Login as Admin
    Input Text    id=username    ${username}
    Input Password    id=password    ${password} 
    Click Button    class=btn

Split to Lines and Remove Header
    [Arguments]    ${FILE_CONTENT}
    @{LINES}=    Split To Lines    ${FILE_CONTENT}
    Remove From List    ${LINES}    0
    [Return]    @{LINES}

Read file
    ${FILE_CONTENT}=    Get File    Resources/Files/news.csv
    @{LINES}=    Split to Lines and Remove Header    ${FILE_CONTENT}
    [Return]    @{LINES}

Create news
    Sleep    3s
    Click Link    link=ข่าวประชาสัมพันธ์
    Sleep    3s

Maker Work
    [Arguments]    @{DATA}
    Click Link    link=เพิ่มข่าว
    Sleep    3s
    Input Text    id=title    ${DATA}[0]
    Input Text    class=note-editable    ${DATA}[1]
    Click Element    xpath=/html/body/app-root/app-admin/div/div/app-news-detail/div[2]/div[1]/form/div[2]/div[1]/div[2]/div/div/div/div[1]/label
    Choose file    id=file    C:/Users/Dell/Desktop/robotcover.jpg
    Sleep    3s
    Click Element    xpath=/html/body/app-root/app-admin/div/div/app-news-detail/div[2]/div[2]/div/button[3]
    sleep    7s
    Click Element    xpath=/html/body/ngb-modal-window/div/div/div[3]/div/button

Checker Work
    Click Link    link=ดูข้อมูล
    Sleep    3s
    Click Element    xpath=/html/body/app-root/app-admin/div/div/app-news-detail/div[2]/div[2]/div[2]/button[4]
    sleep    7s
    Click Element    xpath=/html/body/ngb-modal-window/div/div/div[3]/div/button

Publisher Work
    Click Link    link=ดูข้อมูล
    Sleep    3s
    Click Element    xpath=/html/body/app-root/app-admin/div/div/app-news-detail/div[2]/div[2]/div[2]/button[4]
    sleep    7s
    Click Element    xpath=/html/body/ngb-modal-window/div/div/div[3]/div/button
    