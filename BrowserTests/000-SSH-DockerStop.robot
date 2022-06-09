*** Settings ***
Library                SSHLibrary
Suite Setup            Open SSH Connection And Log In
Suite Teardown         Close All Connections

*** Variables ***
${Device-Host}             200.168.18.99
${SSH-Username}            nvidia
${SSH-Password}            nvidia

*** Keywords ***
Open SSH Connection And Log In
   Open Connection     ${Device-Host}
   Login               ${SSH-Username}         ${SSH-Password}

*** Test Cases ***
Docker Stop
     Write     docker stop ux16_backend
     ${docker-stop}=    Read     delay=15s
     Close All Connections

