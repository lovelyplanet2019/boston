*** Settings ***
#Library
Resource            ../Resources/BrowserFunctions.robot
#Suite Setup         Start New Browser
#Test Setup          Test Setup
#Test Teardown       Test Teardown
Suite Teardown      Close Browser

*** Test Cases ***
001_Delete_MapFolder     #child-folder
     New Browser     ${Browser}  headless=${Headless}
     Open New Page To Server

     Navigate Maps Page

     Select Map Folder and Click Delete
     Sleep     2s
     Click OK
     Sleep     2s


002_Delete_WorldFolder   #parent-folder
     New Browser     ${Browser}  headless=${Headless}
     Open New Page To Server

     Navigate Maps Page

     Select World Folder and Click Delete
     Sleep     2s
     Click OK
     Sleep     2s

