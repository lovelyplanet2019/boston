*** Settings ***
Library     Browser
Library     BuiltIn
Library     OperatingSystem
Library     String
Library     SSHLibrary
Library     Screenshot
Resource    BrowserParameters.robot
Resource    BrowserResources.robot


*** Keywords ***

#*** Setup and Teardown ***
Test Setup
#Takes an arguement when keyword is called to determine which browser to use.
#Uses Login Credentials and Webpage defined in BrowserParameters.Robot to determine which webpage to navigate to and Login
    [Arguments]     ${Browser}=${Browser}
    Open SSH Connection And Log In
    SSH Docker Stop then Docker Run
    Open New Page To Server


Test Teardown
    Delete All Sessions

#*** Main Keywords ***

Start New Browser
    New Browser     ${Browser}  headless=${Headless}

Open New Page To Server
    New Context     &{Browser-Default-Capabilities}
#    Maximize Browser Window
    Set Browser Timeout        ${Default-Timeout}
    New Page        ${Webpage}

Set Screenshot Directory
    Screenshot.Set Screenshot Directory    ${ScreenshotPath}

#*** SSH Keywords ***
Open SSH Connection And Log In
   Log To Console      Open SSH Connection
   Open Connection     ${Device-Host}
   Log To Console      Login SSH
   Login               ${SSH-Username}         ${SSH-Password}

SSH Docker Stop then Docker Run
     Log To Console      docker stop ux16_backend
     Write     docker stop ux16_backend
     ${docker-stop}=    Read     delay=15s

     Log To Console      docker run --rm --net=host --name=ux16_backend --volume=/var/run/docker.sock:/var/run/docker.sock klnxrepo01.klass.dev/boston/arm64v8/ux16_backend:bos-722
     Write     docker run --rm --net=host --name=ux16_backend --volume=/var/run/docker.sock:/var/run/docker.sock klnxrepo01.klass.dev/boston/arm64v8/ux16_backend:bos-722
     ${docker-run}=    Read     delay=5s
     Close All Connections

Docker Run
     Log To Console      docker run --rm --net=host --name=ux16_backend --volume=/var/run/docker.sock:/var/run/docker.sock klnxrepo01.klass.dev/boston/arm64v8/ux16_backend:bos-722
     Write     docker run --rm --net=host --name=ux16_backend --volume=/var/run/docker.sock:/var/run/docker.sock klnxrepo01.klass.dev/boston/arm64v8/ux16_backend:bos-722
     ${docker-run}=    Read     delay=5s
     Close All Connections

Docker Stop
     Log To Console      docker stop ux16_backend
     Write     docker stop ux16_backend
     ${docker-stop}=    Read     delay=15s
     Close All Connections


#*** Run ROS and ROSBag
#Run ROSBridge
#    Run      cd ~/catkin_ws
#    Run      source devel/setup.bash
#    ${rosBridge} =     Run      roslaunch rosbridge_server rosbridge_websocket.launch
#    Log to console    \nRosBridge Websocket starts......${rosBridge}


Run ROSBag
    ${rosbagPlay} =     Run      rosbag play -u 5 filtered_map.bag
    Log to console    \nThe rosbag running for 5s ${rosbagPlay}


#*** Landing Page - Mapping
Verify Page Content before Launch or after Shutdown
    Wait For Elements State     ${Page-Content-Before-Launch-After-Shutdown}

Click Launch Button
    Click                       ${Launch-Button}
    Wait For Elements State     ${Mapping-Map}

Click Shutdown Button
    Click                       ${Shutdown-Button}

Click 3D Map Button
    Click                         ${3D-Map-Button}
    Wait For Elements State       //div[@id='ros3d']//img

Tick Stats Widget Checkbox
    Click                ${Visibility-Expand-Group}
    Click                ${Visibility-Stats-Widget-Checkbox}

Move Slider
    [Arguments]    ${steps}
    ${width}=    Get BoundingBox    //div[@class='ant-slider-step']   width
    Log To Console    width is ${width}
    ${start}=    Get Attribute    //div[@role="slider"]   aria-valuenow
    Log To Console    start is ${start}
    ${max}=    Get Attribute   //div[@role="slider"]   aria-valuemax
    Log To Console    max is ${max}
    ${min}=    Get Attribute    //div[@role="slider"]   aria-valuemin
    Log To Console    min is ${min}
    Hover   //div[@role="slider"]
    Mouse Button    Down
    Mouse Move Relative To    //div[@role="slider"]   ${{(${width} / (${max})) * ${steps}}}
    Mouse Button    Up
    ${stop}=    Get Attribute     //div[@role="slider"]   aria-valuenow
    Log To Console    Moved Slider from ${start} to ${stop}

Verify Slider Position
    [Arguments]    ${exp_pos}
    Get Attribute     //div[@role="slider"]   aria-valuenow    ==    ${exp_pos}

Set Color
    [Arguments]    ${color}
    Click     ${${color}-Color-Button}

#Set Red Color
#    Click     ${Red-Color-Button}
#
#Set Pink Color
#    Click     ${Pink-Color-Button}
#
#Set Purple Color
#    Click     ${Purple-Color-Button}
#
#Set Blue Color
#    Click     ${Blue-Color-Button}
#
#Set Green Color
#    Click     ${Green-Color-Button}
#
#Set Yellow Color
#    Click     ${Yellow-Color-Button}
#
#Set Orange Color
#    Click     ${Orange-Color-Button}
#
#Set Brown Color
#    Click     ${Brown-Color-Button}
#
#Set Gray Color
#    Click     ${Gray-Color-Button}

Click World Name
    Click                         ${World-Name-InputField}

Click Map Name
    Click                         ${Map-Name-InputField}

Input 2D-World Name
     Click World Name
     Keyboard Input    insertText    ${WorldName2D}

Input 2D-Map Name
     Click Map Name
     Keyboard Input    insertText    ${MapName2D}

Input 3D-World Name
     Click World Name
     Keyboard Input    insertText    ${WorldName3D}

Input 3D-Map Name
     Click Map Name
     Keyboard Input    insertText    ${MapName3D}

Click Save Mapping
    Click                         ${Save-Mapping-Button}

Save A Map
     Input 2D-World Name
     Input 2D-Map Name
     Click Save Mapping

#*** Maps Page
Navigate Maps Page
    Click                        ${Menu-Maps}

Select World Folder and Click Delete
    Click           ${Delete-THIS-World}

Select Map Folder and Click Delete
    Click           ${Expand-THIS-Map}
    Click           ${Delete-THIS-Map}

Click OK
   Click            ${Delete-Map-OK}

Click Cancel
   Click             ${Delete-Map-Cancel}

Click Next Page
   Click             ${Maps-Next-Page-Button}

Click Previous Page
   Click             ${Maps-Previous-Page-Button}

Click First page
   click             ${Maps-First-Page-Button}
