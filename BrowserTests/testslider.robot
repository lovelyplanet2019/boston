*** Settings ***
Library     Browser
Library     BuiltIn
Library     OperatingSystem
Library     String
Library  SeleniumLibrary
Resource            ../Resources/BrowserFunctions.robot
#Suite Setup         Start New Browser
##Test Setup          Test Setup
#Test Setup          Open New Page To Server
#Test Teardown       Test Teardown
Suite Teardown      Browser.Close Browser

*** Test Cases ***
001_Move-Slider
     New Browser     ${Browser}  headless=${Headless}
     Open New Page To Server
     Verify Page Content before Launch or after Shutdown
     Click Launch Button
     Click 3D Map Button
     Click                ${Point-Cloud-Expand-Group}
     sleep     3s
#     Click  xpath://div[@class="ant-slider-mark"]
     Click  //div[contains(@class,'ant-slider-track')]
     sleep     3s
#     drag and drop by offset   xpath://div[@class="ant-slider-mark"]     1325     465
    FOR  ${i}  IN RANGE  1   31
        Click   //div[contains(@class,'ant-slider-handle')]
#        drag and drop by offset   xpath://div[@class="ant-slider-mark"]     1340     0
        sleep  3s
#        browser.wait for elements state    //div[@aria-valuenow="${i}"]
#        wait until page contains element     xpath://div[@aria-valuenow="${i}"]
    END

*** Variable ***
${sliderName}     //div[@class="ant-slider-mark"]

#002_Widget-Points
#    Tick Stats Widget Checkbox
#     wait for elements state    ${Stats-Widget-Points-0}
#     sleep     3s
#     Click                ${Point-Cloud-Expand-Group}
#     sleep     3s
#     Click                ${Yellow-Color-Button}
#     sleep     3s


##codes to verify the element points is 0
##First get the text of the element
#    ${Point}=    Get Text    ${Stats-Widget-Points-0}
##Get substring to get the '0'
#    ${Point}=    Get substring     ${Point}       -1
##Convert to integer
#    ${Point}=    convert to integer      ${Point}
##Check if its not 0
#    should not be equal as integers     ${Point}        0

