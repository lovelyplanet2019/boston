*** Settings ***
Library     Browser    timeout=20s
Library     DocTest.VisualTest
Library     OperatingSystem
Library           Screenshot
Resource            ../Resources/BrowserFunctions.robot
Resource            ../Resources/BrowserParameters.robot

*** Test Cases ***
Compare 3D Map
    Set Screenshot Directory
    Create Directory    ${EXECDIR}${/}screenshots${/}CompareBaseline
    Create Directory   ${OUTPUTDIR}${/}CompareActual
     New Browser     ${Browser}  headless=${Headless}
     Open New Page To Server
     Verify Page Content before Launch or after Shutdown
     Click Launch Button
     Click 3D Map Button
     Wait For Elements State         ${Point-Cloud-Expand-Group}
     click          ${Point-Cloud-Expand-Group}
     sleep     2s

    Wait For Elements State    //div[@class='ant-slider-handle']   visible
    Move Slider    20
    sleep     2s

    Run ROSBag
    sleep     2s

    Screenshot.Take Screenshot    actual-3DMap-Size24.jpg
    sleep     2s
    #good base vs test
    compare images    screenshots/CompareBaseline/base-3DMap-Size24.jpg     screenshots/actual-3DMap-Size24.jpg     placeholder_file=masks.json

    #bad base vs test
#    compare images    screenshots/CompareBaseline/wrongimage.jpg     screenshots/actual-3DMap-Size24.jpg      placeholder_file=masks.json

#    ${status}    Run Keyword and return status    Variable Should Exist    ${INDEX}
#    ${INDEX}    Run Keyword if    ${status} == ${FALSE}    Set Variable    ${1}    ELSE
#    ...    Set Variable    ${INDEX + 1}
#    ${baseline}    Convert To String    ${EXECDIR}${/}screenshots${/}CompareBaseline${/}${INDEX}.jpg
#    ${actual}      Convert To String    ${OUTPUTDIR}${/}screenshots${/}CompareActual${/}${INDEX}.jpg
#    sleep     2s
#    #finally do the magic, without ImgMagick (ツ)
#    compare images    ${baseline}    ${actual}   placeholder_file=masks.json