*** Settings ***
Library           Browser   jsextension=${CURDIR}${/}pixelmatch.js
Library           String
Library           OperatingSystem
Library           BuiltIn
Library           String
Library           Screenshot
Resource            ../Resources/BrowserFunctions.robot
Resource            ../Resources/BrowserParameters.robot

*** Keywords ***
Compare images with pixelmatch
    [Documentation]    This keywords will require an 'actual' directory. Can be called
    ...    multiple times in one Test.
    ...    Directory names will be name of test, containing ${index}.png.
    ...    Requires following npm packages to work:
    ...    | npm install pixelmatch
    ...    | npm install fs
    [Arguments]    ${selector}=None    ${Threshold}=0.15
    #Check if ${INDEX} exists within scope, set to 1 if it doesn't, otherwise increase
    #by one
    ${status}    Run Keyword and return status    Variable Should Exist    ${INDEX}
    ${INDEX}    Run Keyword if    ${status} == ${FALSE}    Set Variable    ${1}    ELSE
    ...    Set Variable    ${INDEX + 1}
    Set Test Variable    ${INDEX}    ${INDEX}
    #Replace spaces in testname with underscore
    ${TEST_NAME}    Replace String    ${TEST NAME}    ${SPACE}    _
    #Create the directories
    Create Directory    ${EXECDIR}${/}baseline${/}${TEST_NAME}
    Create Directory    ${OUTPUTDIR}${/}actual${/}${TEST_NAME}
    Create Directory    ${OUTPUTDIR}${/}diff${/}${TEST_NAME}
    #Make screenshot. Note that Browser library sets the img extention, so we're only
    #using ${INDEX} as filename.
    Screenshot.Take Screenshot    ${OUTPUTDIR}${/}actual${/}${TEST_NAME}${/}${INDEX}    ${selector}
    #For readablilty: set full paths to baseline, actual en diff in a scalar variable
    ${baseline}    Convert To String    ${EXECDIR}${/}baseline${/}${TEST_NAME}${/}${INDEX}.png
    ${actual}    Convert To String    ${OUTPUTDIR}${/}actual${/}${TEST_NAME}${/}${INDEX}.png
    ${diff}    Convert To String    ${OUTPUTDIR}${/}diff${/}${TEST_NAME}${/}${INDEX}.png
    #finally do the magic, without ImgMagick (ツ)
    CompareImagesWithPixelmatch    ${baseline}    ${actual}    ${diff}    ${Threshold}

*** Test Cases ***
Compare with baseline
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
    ${rosbagPlay} =     Run      rosbag play -u 5 filtered_map.bag
    Log to console    \nThe rosbag running for 5s ${rosbagPlay}
    sleep     2s
    Screenshot.Take Screenshot    3DMap-Size24.jpg
    sleep     2s
#    Verify Slider Position    15
    CompareImagesWithPixelmatch