*** Settings ***
Library    Browser
Resource            ../Resources/BrowserFunctions.robot
Resource            ../Resources/BrowserParameters.robot

*** Test Cases ***
Test
    New Browser    headless=False
    New Context
    New Page    http://localhost:3000/
    Click Launch Button
    Click 3D Map Button
    Wait For Elements State         ${Point-Cloud-Expand-Group}
    click          ${Point-Cloud-Expand-Group}
    sleep     2s

    Wait For Elements State    //div[@class='ant-slider-handle']   visible
    Sleep     2 sec
    Move Slider    10
    Verify Slider Position    14
    Move Slider    12
    Verify Slider Position    25
    Move Slider    14
    Verify Slider Position    30
    Move Slider    -12
    Verify Slider Position    19
    Move Slider    -19
    Verify Slider Position    1
    Move Slider    5
    Verify Slider Position    6


*** Keywords ***
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
    Mouse Move Relative To    //div[@role="slider"]   ${{(${width} / (${max}+1)) * ${steps}}}
    Mouse Button    Up
    ${stop}=    Get Attribute     //div[@role="slider"]   aria-valuenow
    Log To Console    Moved Slider from ${start} to ${stop}

Verify Slider Position
    [Arguments]    ${exp_pos}
    Get Attribute     //div[@role="slider"]   aria-valuenow    ==    ${exp_pos}