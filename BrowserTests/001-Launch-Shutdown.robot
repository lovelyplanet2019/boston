*** Settings ***
Resource            ../Resources/BrowserFunctions.robot
Suite Setup         Start New Browser
Test Setup          Test Setup
Test Teardown       Test Teardown
Suite Teardown      Close Browser

*** Test Cases ***
001_Launch-Shutdown
     Log To Console      Webpage automation testing starts......
     Verify Page Content before Launch or after Shutdown
     Click Launch Button

     Click Shutdown Button
     Verify Page Content before Launch or after Shutdown