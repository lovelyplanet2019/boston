*** Settings ***
Library     Browser
Library     Collections
Library     DateTime
Resource            ../Resources/BrowserFunctions.robot
#Suite Setup         Start New Browser
#Test Setup          Test Setup
#Test Teardown       Test Teardown
#Suite Teardown      Close Browser
*** Variables ***
@{worldNameList}
@{mapNameList}

*** Test Cases ***
001_Save_Mapping_Multiple_Maps_2D
#save 10 maps which used currentdatetime append behind the WorkName and MapName - saved these variables to be called at next case
     Set Screenshot Directory
     New Browser     ${Browser}  headless=${Headless}
     Open New Page To Server
     Click Launch Button
    ${currentDateTime}  get current date

    FOR    ${item}    IN    @{LIST}
        Click World Name
        ${worldName}     set variable    ${WorldName2D}-${item}
#        ${worldName}     set variable    ${WorldName2D}-${item}-${currentDateTime}
        Keyboard Input    insertText    ${worldName}

        Click Map Name
        ${mapName}      set variable    ${MapName2D}-${item}
#        ${mapName}      set variable    ${MapName2D}-${item}-${currentDateTime}
        Keyboard Input    insertText    ${mapName}

        Click Save Mapping
        Sleep     2s
        append to list   ${worldNameList}    ${worldName}
        Log To Console    worldNameList is ${worldNameList} worldName is ${worldName}
        append to list   ${mapNameList}     ${mapName}
        Log To Console    mapNameList is ${mapNameList} mapName is ${mapName}
    END

002_Expand_Collapse_Pagination
     Set Screenshot Directory
     New Browser     ${Browser}  headless=${Headless}
     Open New Page To Server
     Navigate Maps Page

#verify pageSize: 10
     wait for elements state    //tr[@data-row-key="18"]     visible
     wait for elements state    //tr[@data-row-key="19"]     detached
     sleep    2
     Screenshot.Take Screenshot    PageSize.jpg

#search the WorldName and click expand button. click next page to continue searching,expand button.
    FOR     ${i}    IN    @{worldNameList}
         Click First page
         FOR    ${j}     IN RANGE      1      10
             ${state}       Get Element States    //td[text()="${i}"]  then  bool(value & visible)
             Log To Console    state is ${state}
             exit for loop if   '${state}'=='True'
             Click Next Page
         END
         sleep    2
         click    //td[text()="${i}"]//preceding-sibling::button
         sleep    2
         Screenshot.Take Screenshot    Next${i}.jpg
         sleep    2
    END
     Click Previous Page
     sleep    2
     Screenshot.Take Screenshot    Prev.jpg
     sleep    2


003_Delete_Mapping_Multiple_Maps_2D
#based on the folders saved previously, search the WorldName and click expand button and delete the MapName #child folders.
     Set Screenshot Directory
     New Browser     ${Browser}  headless=${Headless}
     Open New Page To Server
     Navigate Maps Page
    FOR     ${i}    IN RANGE     0     9
         ${mapName}     set variable     ${mapNameList}[${i}]
         ${worldName}     set variable     ${worldNameList}[${i}]
         Click First page
         FOR    ${j}     IN RANGE      1      10
             ${state}       Get Element States    //td[text()="${worldName}"]  then  bool(value & visible)
             Log To Console    state is ${state}
             exit for loop if   '${state}'=='True'
             Click Next Page
         END
         sleep    2
         click    //td[text()="${worldNameList}[${i}]"]//preceding-sibling::button
         sleep    2
         Screenshot.Take Screenshot    world${i}.jpg
         sleep    2
         click    //td[text()='${mapNameList}[${i}]']//following-sibling::td[.//span[@aria-label='delete']]
         sleep    2
         click    //div[contains(.,'Delete only map ${mapName} ')]//following::span[text()='OK']
         sleep    2
         Screenshot.Take Screenshot    Delete-map${i}.jpg
         wait for elements state    //div[text()='Deleted successfully']     visible
         wait for elements state    //div[text()='Deleted successfully']     detached

         #Then delete the WorldName #parent folders.
         click    //td[text()='${worldNameList}[${i}]']//following-sibling::td[.//span[@aria-label='delete']]
         sleep    2
         click    //div[text()='Delete world ${worldName} and all its maps ?']//following::span[text()='OK']
         sleep    2
         Screenshot.Take Screenshot    Delete-world${i}.jpg
         wait for elements state    //div[text()='Deleted successfully']     visible
         wait for elements state    //div[text()='Deleted successfully']     detached
    END




