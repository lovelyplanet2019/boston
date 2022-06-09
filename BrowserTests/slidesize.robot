*** Settings ***
Library    Browser


*** Test Cases ***
Test
    New Browser    headless=False
    New Context
    New Page    https://codesandbox.io/s/p92101zymj
    Wait For Elements State    iframe >>> .rc-slider-handle    visible
    Sleep     2 sec
    Move Slider    50
    Verify Slider Position    50
    Move Slider    -2
    Verify Slider Position    48
    Move Slider    -48
    Verify Slider Position    0
    Move Slider    1
    Verify Slider Position    1
    Move Slider    99
    Verify Slider Position    100
    Move Slider    20
    Verify Slider Position    120


*** Keywords ***
Move Slider
    [Arguments]    ${steps}
    ${width}=    Get BoundingBox    iframe >>> .rc-slider    width
    Log To Console    width is ${width}
    ${start}=    Get Attribute    iframe >>> .rc-slider-handle    aria-valuenow
    Log To Console    start is ${start}
    ${max}=    Get Attribute    iframe >>> .rc-slider-handle    aria-valuemax
    Log To Console    max is ${max}
    ${min}=    Get Attribute    iframe >>> .rc-slider-handle    aria-valuemin
    Log To Console    min is ${min}
    Hover    iframe >>> .rc-slider-handle
    Mouse Button    Down
    Mouse Move Relative To    iframe >>> .rc-slider-handle    ${{(${width} / ${max}) * ${steps}}}
    Mouse Button    Up
    ${stop}=    Get Attribute    iframe >>> .rc-slider-handle    aria-valuenow
    Log To Console    Moved Slider from ${start} to ${stop}

Verify Slider Position
    [Arguments]    ${exp_pos}
    Get Attribute    iframe >>> .rc-slider-handle    aria-valuenow    ==    ${exp_pos}