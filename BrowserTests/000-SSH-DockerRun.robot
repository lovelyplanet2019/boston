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
Docker Run
     Write     docker run --rm --net=host --name=ux16_backend --volume=/var/run/docker.sock:/var/run/docker.sock klnxrepo01.klass.dev/boston/arm64v8/ux16_backend:bos-722
     ${docker-run}=    Read     delay=5s
     Close All Connections



