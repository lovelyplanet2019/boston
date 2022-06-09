*** Settings ***
Library    FakerLibrary

*** Test Cases ***
FakerLibrary Words Generation
    ${words}=    FakerLibrary.Words
    Log To Console    words: ${words}
    ${words}=    FakerLibrary.Words    nb=${10}
    Log To Console    words: ${words}