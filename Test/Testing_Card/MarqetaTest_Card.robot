*** Settings ***
Documentation       Card Testing for Marqeta

Library     String
Library     ../../Lib/marqeta.py

*** Test Cases ***

### TEST SUITE 1
SUITE 1 - TEST CASE 1
    ${newValidUserToken}                    getNewTestingValidUserToken
    UNSUCCESSULLY CREATE CARD   ${newValidUserToken}    INVALID_CARD_PRODUCT_TOKEN

SUITE 1 - TEST CASE 2
    ${newValidCardProductToken}             getNewTestingValidCardProductToken
    UNSUCCESSULLY CREATE CARD   INVALID_USER_TOKEN      ${newValidCardProductToken}

SUITE 1 - TEST CASE 3   
    UNSUCCESSULLY CREATE CARD   INVALID_USER_TOKEN      INVALID_CARD_PRODUCT_TOKEN

SUITE 1 - TEST CASE 4
    SUCCESSULLY CREATE CARD


### TEST SUITE 2
SUITE 2 - TEST CASE 1
    ${num}  Convert To Integer      2
    TestSameUserWithMultipleCards   ${num}

SUITE 2 - TEST CASE 2
    ${num}  Convert To Integer      10
    TestSameUserWithMultipleCards   ${num}

SUITE 2 - TEST CASE 3
    ${num}  Convert To Integer      0
    TestSameUserWithMultipleCards   ${num}

*** Keywords ***
SUCCESSULLY CREATE CARD
    ${newValidUserToken}            getNewTestingValidUserToken
    ${newValidCardProductToken}     getNewTestingValidCardProductToken
    ${response}     testSuccessCard     ${newValidUserToken}        ${newValidCardProductToken}
    prettyPrintResponse                 ${response}

UNSUCCESSULLY CREATE CARD
    [Arguments]     ${userToken}        ${cardProductToken}
    ${response}     testFailedCard      ${userToken}        ${cardProductToken}
    prettyPrintResponse                 ${response}