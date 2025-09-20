*** Settings ***
Library    Browser

*** Variables ***
${URL}         https://www.saucedemo.com/
${USERNAME}    standard_user
${PASSWORD}    secret_sauce
${FIRSTNAME}   John
${LASTNAME}    Wick
${POSTALCODE}  600001

*** Test Cases ***
Case 1 : Login to SauceDemo
    New Browser    chromium    headless=False
    New Context
    New Page    ${URL}
    Set Viewport Size    1920    1080
    Set Browser Timeout    5s
    Fill Text    id=user-name    ${USERNAME}
    Fill Text    id=password    ${PASSWORD}
    Wait For Elements State    id=login-button    visible
    Click    id=login-button
    Get Title    EQUALS    Swag Labs
    Log To Console    1. Successfully logged in to the application
    Wait For Elements State    xpath=//div[normalize-space()='Sauce Labs Backpack']    visible
    Click    xpath=//div[normalize-space()='Sauce Labs Backpack']
    Log To Console    2. Successfully Clicked product from Sauce Labs Backpack
    Wait For Elements State    id=add-to-cart    visible 
    Click    id=add-to-cart
    Log To Console    3. Successfully added product to the cart
    Wait For Elements State    id=back-to-products    visible
    Click    id=back-to-products
    Log To Console    4. Successfully clicked back to products
    Wait For Elements State    xpath=//div[normalize-space()='Sauce Labs Bolt T-Shirt']    visible
    Click    xpath=//div[normalize-space()='Sauce Labs Bolt T-Shirt']
    Log To Console    5. Successfully Clicked product from Sauce Labs Bolt T-Shirt
    Click    id=add-to-cart
    Log To Console    6. Successfully added product to the cart
    Wait For Elements State    xpath=//a[@class='shopping_cart_link']    visible
    Click    xpath=//a[@class='shopping_cart_link']
    Log To Console    7. Successfully clicked on the cart
    Wait For Elements State    id=checkout    visible
    Click    id=checkout
    Log To Console    8. Successfully clicked on the checkout
    Wait For Elements State    id=first-name    visible
    Fill Text    id=first-name    ${FIRSTNAME}
    Fill Text    id=last-name     ${LASTNAME}
    Fill Text    id=postal-code   ${POSTALCODE}
    Wait For Elements State    id=continue    visible
    Click    id=continue
    Log To Console    9. Successfully filled the details
    Wait For Elements State    id=finish    visible
    Click    id=finish
    Log To Console    10. Successfully clicked on the finish button
    Wait For Elements State    id=back-to-products    visible
    Click    id=back-to-products
    Wait For Elements State    id=react-burger-menu-btn    visible
    Click    id=react-burger-menu-btn
    Wait For Elements State    id=logout_sidebar_link    visible    
    Click    id=logout_sidebar_link
    Sleep    3s
    Close Browser