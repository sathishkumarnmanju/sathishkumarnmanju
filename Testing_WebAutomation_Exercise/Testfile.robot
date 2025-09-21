*** Settings ***
Library    Browser
Library    BuiltIn
Library    Collections
*** Variables ***
${URL}    https://www.automationexercise.com/


*** Test Cases ***
Open Automation Exercise Website Home Page

    New Browser    chromium    headless=False   
    New Page    ${URL}
    Set Viewport Size    1920    1080
    Wait For Elements State    xpath=//img[@alt='Website for automation practice']    visible
    Log To Console   \n 1. Successfully opened the Automation Exercise website
    Sleep    2s


    #SignUp User
    Click    xpath=//a[normalize-space()='Signup / Login']
    Wait For Elements State    xpath=//h2[normalize-space()='New User Signup!']    visible
    Log To Console   \n 2. Successfully navigated to Signup/Login page
    ${timestamp}=    Evaluate    str(int(time.time())) + str(random.randint(100,999))    modules=time,random
    ${email}=        Set Variable    santhosh_${timestamp}@example.com
    Fill Text    xpath=//input[@placeholder='Name']    Santhosh Kumar N
    Fill Text    xpath=//input[@data-qa='signup-email']    ${email}
    Log To Console    Using email: ${email}
    Wait For Elements State    xpath=//button[normalize-space()='Signup']    visible
    Click    xpath=//button[normalize-space()='Signup']
    Wait For Elements State    xpath=//b[normalize-space()='Enter Account Information']    visible
    Log To Console   \n 3. Successfully navigated to Enter Account Information page
    Sleep    2s

    # Fill in Account Information
    Click    id=id_gender1
    Fill Text    id=name    Santhosh Kumar N    
    #Fill Text    id=email   ${email}
    Fill Text    id=password    Santhosh@123     
    Select Options By    id=days    value    20
    Select Options By    id=months    value    5
    Select Options By    id=years    value    1995
    Click    id=newsletter
    Click    id=optin
    Sleep    2s
    Fill Text    id=first_name    Santhosh
    Fill Text    id=last_name     Kumar N
    Fill Text    id=company       TestLeaf
    Fill Text    id=address1      123, ABC Street
    Fill Text    id=address2      Chennai, India
    Select Options By    id=country    text    India
    Fill Text    id=state         Tamil Nadu
    Fill Text    id=city          Chennai
    Fill Text    id=zipcode       600001
    Fill Text    id=mobile_number  9876543210
    Sleep    2s
    Click    xpath=//button[normalize-space()='Create Account']
    Wait For Elements State    xpath=//b[normalize-space()='Account Created!']    visible
    Log To Console   \n 4. Successfully created a new account    
    Click    xpath=//a[normalize-space()='Continue']
    Wait For Elements State    xpath=//a[normalize-space()='Logged in as Santhosh Kumar N']    visible
    Log To Console   \n 5. Successfully logged in as Santhosh Kumar N
    Sleep    5s

    # Search and Add Products to Cart
    Wait For Elements State    xpath=//a[@href='/products']    visible
    Click   xpath=//a[@href='/products']
    Wait For Elements State    id=search_product    visible
    Fill Text    id=search_product    T-Shirt
    Wait For Elements State    xpath=//button[@id='submit_search']    visible
    Click    xpath=//button[@id='submit_search']
    Log To Console   \n 6. Successfully searched for T-Shirt
    Sleep    2s
    Wait For Elements State    xpath=//div[@class='col-sm-9 padding-right']//div[2]//div[1]//div[2]//ul[1]//li[1]//a[1]    visible
    Click    xpath=//div[@class='col-sm-9 padding-right']//div[2]//div[1]//div[2]//ul[1]//li[1]//a[1]
    # Add T-Shirt
    Wait For Elements State    xpath=//button[normalize-space()='Add to cart']    visible
    Click   xpath=//button[normalize-space()='Add to cart']
    Wait For Elements State    xpath=//button[normalize-space()='Continue Shopping']    visible
    Click    xpath=//button[normalize-space()='Continue Shopping']
    Log To Console   \n 7. Successfully added T-Shirt to cart
    Sleep    2s    
    # Proceeding with checkout
    Wait For Elements State    xpath=//a[normalize-space()='Cart']    visible
    Click    xpath=//a[normalize-space()='Cart']
    Wait For Elements State    xpath=//a[normalize-space()='Proceed To Checkout']    visible
    Click    xpath=//a[normalize-space()='Proceed To Checkout']
    Log To Console   \n 10. Successfully Proceeding with checkout
    Sleep    2s
    Fill Text    xpath=//textarea[@name='message']    Products are good. Please deliver between 10 AM to 5 PM.
    Click    xpath=//a[normalize-space()='Place Order']
    Sleep    5s
    Wait For Elements State    xpath=//h2[normalize-space()='Payment']    visible
    Log To Console   \n 11. Successfully navigated to Payment page
    Sleep    2s
    Fill Text    xpath=//input[@name='name_on_card']    Santhosh Kumar N
    Fill Text    xpath=//input[@name='card_number']     4111111111111111
    Fill Text    xpath=//input[@name='cvc']             123
    Fill Text    xpath=//input[@name='expiry_month']    12/25
    Fill Text    xpath=//input[@name='expiry_year']     2025
    Sleep    2s    
    Click    xpath=//button[normalize-space()='Pay and Confirm Order']
    Wait For Elements State    //p[normalize-space()='Congratulations! Your order has been confirmed!']    visible
    Log To Console   \n 12. Successfully placed the order    
    Sleep    2s
    Wait For Elements State    xpath=//a[normalize-space()='Download Invoice']    visible
    Click    xpath=//a[normalize-space()='Download Invoice']
    Log To Console   \n 13. Successfully downloaded the invoice    
    Wait For Elements State    xpath=//a[normalize-space()='Continue']    visible
    Click    xpath=//a[normalize-space()='Continue']
    Sleep    5s
    Wait For Elements State    xpath=//a[normalize-space()='Delete Account']    visible
    Click    xpath=//a[normalize-space()='Delete Account']
    Wait For Elements State    xpath=//b[normalize-space()='Account Deleted!']    visible
    Log To Console   \n 14. Successfully deleted the account
    Click    xpath=//a[normalize-space()='Continue']
    Sleep    5s
    


