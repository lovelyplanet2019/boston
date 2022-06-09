*** Settings ***
Library     Browser
Library     BuiltIn
Library     OperatingSystem
Library     String
Library     Screenshot
Library     DocTest.VisualTest
Resource            ../Resources/BrowserFunctions.robot
Resource            ../Resources/BrowserParameters.robot
#Suite Setup         Start New Browser
##Test Setup          Test Setup
#Test Setup          Open New Page To Server
#Test Teardown       Test Teardown
#Suite Teardown      Browser.Close Browser


*** Test Cases ***
001_Move-Slider-SetColor
     Set Screenshot Directory
     New Browser     ${Browser}  headless=${Headless}
     Open New Page To Server
     Verify Page Content before Launch or after Shutdown
     Click Launch Button
     Click 3D Map Button
     Wait For Elements State         ${Point-Cloud-Expand-Group}
     click          ${Point-Cloud-Expand-Group}
     sleep     2s

    Wait For Elements State    //div[@class='ant-slider-handle']   visible
    Screenshot.Take Screenshot    SizeInit5.jpg
    Sleep     2 sec

    Move Slider    20
    sleep     2s
    Screenshot.Take Screenshot    Size15.jpg
    Verify Slider Position    24

#    Run ROSBridge
    Run ROSBag
    sleep     2s

    FOR   ${color}   IN    Red    Pink     Purple    Blue    Green    Yellow    Orange    Brown    Gray
        Set Color    ${color}
        sleep     2s
        Screenshot.Take Screenshot    actual-3DMap-Size24-${color}.jpg
    END
    FOR   ${color}   IN    Red    Pink     Purple    Blue    Green    Yellow    Orange    Brown    Gray
       compare images    screenshots/CompareBaseline/base-3DMap-Size24-${color}.jpg     screenshots/actual-3DMap-Size24-${color}.jpg     placeholder_file=masks.json
    END

#
#    Set Blue Color
#    sleep     2s
#    Screenshot.Take Screenshot    Size24-Blue.jpg
#
#    Set Red Color
#    sleep     2s
#    Screenshot.Take Screenshot    Size24-Red.jpg
#
#    Set Purple Color
#    sleep     2s
#    Screenshot.Take Screenshot    Size24-Purple.jpg
#
#    Set Pink Color
#    sleep     2s
#    Screenshot.Take Screenshot    Size24-Pink.jpg
#
#    Set Orange Color
#    sleep     2s
#    Screenshot.Take Screenshot    Size24-Orange.jpg
#
#    Set Green Color
#    sleep     2s
#    Screenshot.Take Screenshot    Size24-Green.jpg
#
#    Set Gray Color
#    sleep     2s
#    Screenshot.Take Screenshot    Size24-Gray.jpg
#
#    Set Brown Color
#    sleep     2s
#    Screenshot.Take Screenshot    Size24-Brown.jpg
#
#    Set Yellow Color
#    sleep     2s
#    Screenshot.Take Screenshot    Size24-Yellow.jpg
