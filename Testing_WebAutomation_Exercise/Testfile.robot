*** Settings ***
Library    Browser
*** Variables ***
${URL}    https://www.automationexercise.com/

*** Test Cases ***
Open Automation Exercise Website
    New Browser    chromium    headless=False
    New Context
    New Page    ${URL}
    Set Viewport Size    1920    1080
    Set Browser Timeout    5s
    Wait For Elements State    xpath=//img[@alt='Website for automation practice']    visible
    Log To Console   \n Successfully opened the Automation Exercise website
    Sleep    5s
    Close Browser