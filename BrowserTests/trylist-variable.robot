*** Settings ***
Library  Collections
Library  String
#Resource    BrowserParameters.robot
Resource    ../Resources/BrowserFunctions.robot


*** Variables ***
@{LIST}=          1    2    3   4   5   6   7   8   9   10


*** Test Cases ***
Loop a list
     New Browser     ${Browser}  headless=${Headless}
     Open New Page To Server

     Click Launch Button

    FOR    ${item}    IN    @{LIST}
        Click World Name
        Keyboard Input    insertText    FolderWorld-${item}
        Log    WordName-${item}
        log to console  \nWordName-${item}

        Click Map Name
        Keyboard Input    insertText    FolderMap-${item}
        Log    MapName-${item}
        log to console  \nMapName-${item}

        Click Save Mapping
        Sleep     3s
    END




#Execute a for loop only two times
#    ${index}=    Set Variable    1
#    FOR    ${robot}    IN    @{ROBOTS}
#        Exit For Loop If    ${index} > 2
#        Log    ${robot}
#        ${index}=    Evaluate    ${index} + 1
#    END
