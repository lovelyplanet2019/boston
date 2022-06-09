*** Settings ***
Library     Browser
Library     BuiltIn
Library     OperatingSystem
Library     String
Library     Screenshot
Resource            ../Resources/BrowserFunctions.robot
Resource            ../Resources/BrowserParameters.robot
#Suite Setup         Start New Browser
##Test Setup          Test Setup
#Test Setup          Open New Page To Server
#Test Teardown       Test Teardown
#Suite Teardown      Browser.Close Browser


*** Test Cases ***
001_Move-Slider-SetSize
     Set Screenshot Directory
     New Browser     ${Browser}  headless=${Headless}
     Open New Page To Server
     Verify Page Content before Launch or after Shutdown
     Click Launch Button
     Click 3D Map Button
     Wait For Elements State         ${Point-Cloud-Expand-Group}
     click          ${Point-Cloud-Expand-Group}

     Run ROSBag
     sleep     2s

    Wait For Elements State    //div[@class='ant-slider-handle']   visible
    Screenshot.Take Screenshot    SizeInit5.jpg
    Sleep     2 sec

    Move Slider    10
    sleep     2s
    Screenshot.Take Screenshot    Size15.jpg
    Verify Slider Position    15

    Move Slider    5
    sleep     2s
    Screenshot.Take Screenshot    Size20.jpg
    Verify Slider Position    20

    Move Slider    10
    sleep     2s
    Screenshot.Take Screenshot    Size30.jpg
    Verify Slider Position    30

    Move Slider    -12
    sleep     2s
    Screenshot.Take Screenshot    Size18s.jpg
    Verify Slider Position    18

    Move Slider    -18
    sleep     2s
    Screenshot.Take Screenshot    Size1.jpg
    Verify Slider Position    1

    Move Slider    5
    sleep     2s
    Screenshot.Take Screenshot    Size6.jpg
    Verify Slider Position    6


#001_Move-Slider_1-10-20-30
#     Set Screenshot Directory
#     New Browser     ${Browser}  headless=${Headless}
#    # ${chromedriver_path}  CustomLib.Get Chromedriver Path
#     #create webdriver   Chrome     executable_path=${chromedriver_path}
#     Open New Page To Server
#     Verify Page Content before Launch or after Shutdown
#     Click Launch Button
#     Click 3D Map Button
#     Wait For Elements State         ${Point-Cloud-Expand-Group}
#     click          ${Point-Cloud-Expand-Group}
#     sleep     2s
#
#     #slide to Size 1
#     Drag And Drop By Coordinates
#     ...    from_x=1395    from_y=470
#     ...    to_x=1330    to_y=470   steps=1
#     sleep    5s
#     Screenshot.Take Screenshot    S1.jpg
#
#    #slide to Size 10
#    ${int}=    Evaluate    '10'
#    ${to_x_new}  evaluate   (13*${int})+1407
#    Click 3D Map Button
#    Drag And Drop By Coordinates
#    ...    from_x=1407  from_y=470
#    ...    to_x=${to_x_new}   to_y=470   steps=1
#    sleep   5s
#    Screenshot.Take Screenshot    S10.jpg
#
#     #slide to Size 20
#    ${int}=    Evaluate    '20'
#    ${to_x_new}  evaluate   (15*${int})+1407
#    Click 3D Map Button
#    Drag And Drop By Coordinates
#    ...    from_x=1407  from_y=470
#    ...    to_x=${to_x_new}   to_y=470   steps=1
#    sleep   5s
#    Screenshot.Take Screenshot    S20.jpg
#
#    #slide to Size 30
#    ${int}=    Evaluate    '30'
#
#    ${to_x_new}  evaluate   (16*${int})+1407
#    Click 3D Map Button
#    Drag And Drop By Coordinates
#    ...    from_x=1407  from_y=470
#    ...    to_x=${to_x_new}   to_y=470   steps=1
#    sleep   5s
#    Screenshot.Take Screenshot    S30.jpg

#002_Move-Slider_min-max
#     Screenshot.Set Screenshot Directory    ${ScreenshotPath}
#     New Browser     ${Browser}  headless=${Headless}
#    # ${chromedriver_path}  CustomLib.Get Chromedriver Path
#     #create webdriver   Chrome     executable_path=${chromedriver_path}
#     Open New Page To Server
#     Verify Page Content before Launch or after Shutdown
#     Click Launch Button
#     Click 3D Map Button
#     Wait For Elements State         ${Point-Cloud-Expand-Group}
#     click          ${Point-Cloud-Expand-Group}
#     sleep     2s
#
#     Wait For Elements State     //div[@role="slider" and @aria-valuenow="5"]     visible     timeout=5s
#     Screenshot.Take Screenshot
#     FOR      ${i}      IN      -500      2000
#        Hover     //div[@role="slider"]     # Move mouse over the element
#        Mouse Button     down     # Press mouse button down
#        Mouse Move Relative To     //div[@role="slider"]    ${i}     # Drag mouse
#        Mouse Button     up    # Release mouse button
#        Run Keyword If     ${i}==-500    Wait For Elements State     //div[@role="slider" and @aria-valuenow="1"]     visible    timeout=5s
#        sleep     3s
#        Run Keyword If     ${i}==2000    Wait For Elements State    //div[@role="slider" and @aria-valuenow="30"]     visible    timeout=5s
#        sleep     3s
#     Screenshot.Take Screenshot
#        END

#003_Move-Slider_Incremental
#     New Browser     ${Browser}  headless=${Headless}
#     Open New Page To Server
#     Verify Page Content before Launch or after Shutdown
#     Click Launch Button
#     Click 3D Map Button
#     Wait For Elements State         ${Point-Cloud-Expand-Group}
#     click          ${Point-Cloud-Expand-Group}
#     sleep     2s
#     Drag And Drop By Coordinates
#     ...    from_x=1395    from_y=470
#     ...    to_x=1330    to_y=470   steps=1
#     sleep    6s
#
#     FOR     ${i}     IN RANGE    3      20
#        ${xinit}    evaluate     '1407'
#        ${xto}  evaluate  ${i}+${xinit}
#        ${xtonew}     evaluate  33*${i}+${xto}
#        Drag And Drop By Coordinates
#           ...    from_x=${xto}   from_y=470
#           ...    to_x=${xtonew}   to_y=470   steps=1
#        log to console    \nxto is ${i} ${xto}
#        log to console    \nxtonew is ${i} ${xtonew}
#        sleep   3s
#     END



