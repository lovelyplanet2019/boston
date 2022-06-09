*** Settings ***
#Library  Collections
Library  String
#Resource    BrowserParameters.robot
Resource    ../Resources/BrowserFunctions.robot

*** Test Cases ***
#login with random string
#    ${password} =  Generate Random String  5  MapNameAuto[NUMBERS]
#    login to system  login  ${password}

#002_Save_Mapping_Multiple_Maps
#    FOR     ${INDEX}    IN RANGE    0   5
#        Save A Map
#    END

#*** Keywords ***
#login to system
#    [arguments]  ${login}  ${password}
#    log to console  \nattempting to log with login and password ${password}

Test1
    ${RandomFolder}=    Create Dictionary
    FOR    ${i}    IN RANGE    10    # how many random string you need
      ${value}         Generate Random String    3     [NUMBERS]
      Set To Dictionary    ${RandomFolder}     Folder_${i}    ${value}
    END
   Log To Console    ${RandomFolder}

Test2
     New Browser     ${Browser}  headless=${Headless}
     Open New Page To Server

     Click Launch Button

    @{RandomFolder}=    Create List
    FOR    ${i}    IN RANGE    10    # how many random string you need
      ${value}         Generate Random String    3     [NUMBERS]
      Click World Name
      Keyboard Input    insertText    FolderWorld-${value}
#      Append To List   @{RandomFolder}    FolderWorld-${value}
      Sleep     3s

      Click Map Name
      Keyboard Input    insertText    FolderMap-${value}
#      Append To List   @{RandomFolder}    FolderMap-${value}
      Sleep     3s

      Click Save Mapping
      Sleep     3s
    END