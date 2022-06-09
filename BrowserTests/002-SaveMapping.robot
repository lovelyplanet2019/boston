*** Settings ***
Library  String
Resource            ../Resources/BrowserFunctions.robot
#Suite Setup         Start New Browser
#Test Setup          Test Setup
#Test Teardown       Test Teardown
Suite Teardown      Close Browser

*** Test Cases ***
001_Save_Mapping_2D
     New Browser     ${Browser}  headless=${Headless}
     Open New Page To Server

     Click Launch Button
     Input 2D-World Name
     Input 2D-Map Name
     Click Save Mapping
     Sleep    2s

002_Save_Mapping_Multiple_Maps_2D
     New Browser     ${Browser}  headless=${Headless}
     Open New Page To Server

     Click Launch Button

    FOR    ${item}    IN    @{LIST}
        Click World Name
        Keyboard Input    insertText    ${TC002-WorldName2D}-${item}
        Log    ${TC002-WorldName2D}-${item}
        log to console  \n${TC002-WorldName2D}-${item}

        Click Map Name
        Keyboard Input    insertText    ${TC002-MapName2D}-${item}
        Log    ${TC002-MapName2D}-${item}
        log to console  \n${TC002-MapName2D}-${item}

        Click Save Mapping
        Sleep     3s
    END

003_Save_Mapping_3D
     New Browser     ${Browser}  headless=${Headless}
     Open New Page To Server

     Click Launch Button
     Click 3D Map Button
     Input 3D-World Name
     Input 3D-Map Name
     Click Save Mapping
     Sleep    2s

004_Save_Mapping_Multiple_Maps_3D
     New Browser     ${Browser}  headless=${Headless}
     Open New Page To Server

     Click Launch Button
     Click 3D Map Button

    FOR    ${item}    IN    @{LIST}
        Click World Name
        Keyboard Input    insertText    ${TC002-WorldName3D}-${item}
        Log    ${TC002-WorldName3D}-${item}
        log to console  \n${TC002-WorldName3D}-${item}

        Click Map Name
        Keyboard Input    insertText    ${TC002-MapName3D}-${item}
        Log    ${TC002-MapName3D}-${item}
        log to console  \n${TC002-MapName3D}-${item}

        Click Save Mapping
        Sleep     3s
    END