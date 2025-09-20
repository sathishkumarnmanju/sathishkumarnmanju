*** Settings ***
Library    Browser

*** Variables ***
${URL}    https://demo.automationtesting.in/Index.html

*** Test Cases ***
Case 1 : Register User
    New Browser    chromium    headless=False    
    New Context    viewport={'width': 1920, 'height': 1080}    
    Set Browser Timeout    5s
    New Page    ${URL}

    # Step 1: Enter email and click arrow
    Fill Text    input[id="email"]    Santhosh Kumar N
    Click    id=enterimg

    # Step 2: Fill Registration Form
    Fill Text    input[placeholder="First Name"]    Santhosh
    Fill Text    input[placeholder="Last Name"]     Kumar N
    Fill Text    textarea[ng-model="Adress"]        Chennai, India
    Fill Text    input[type="email"]                santhosh@test.com
    Fill Text    input[type="tel"]                  9876543210
    Sleep    2s
    # Step 3: Select Gender
    Click    input[value="Male"]
    Sleep    2s
    # Step 4: Select Hobbies
    Click    input[id="checkbox1"]    # Cricket
    Click    input[id="checkbox2"]    # Movies
    Click    input[id="checkbox3"]    # Hockey
    Sleep    2s

    # Step 6 : Select Languages
    Click    id=msdd
    Click    xpath=//a[text()='English']

    # Step 5: Select Skills and Country
    Select Options By    id=Skills    text    Python
    # Select Options By    id=select2-country-container    text    India
     Sleep    2s
    # Step 6: Select DOB
    Select Options By    id=yearbox    text    1995
    Select Options By    xpath=//select[@placeholder="Month"]    text    May
    Select Options By    id=daybox    text    20
    Sleep    2s
    # Step 7: Set Password and Confirm Password
    Fill Text    id=firstpassword     Santhosh@123
    Fill Text    id=secondpassword    Santhosh@123
    Sleep    2s
    # (Optional) Click Submit button
    Click    id=submitbtn
    Sleep    5s
