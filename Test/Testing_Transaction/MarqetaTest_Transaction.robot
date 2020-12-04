*** Settings ***
Documentation       Transaction Testing for Marqeta

Library     String
Library     ../../Lib/marqeta.py

*** Test Cases ***

### TEST SUITE 1
SUITE 1 - TEST CASE 1
    ${CARD TOKEN}       transactionUtil             1000
    SUCCESSULLY CREATE TRANSACTION      10          ABC_MERCHANT        ${CARD TOKEN}

SUITE 1 - TEST CASE 2
    ${CARD TOKEN}       transactionUtil             1000
    SUCCESSULLY CREATE TRANSACTION      0.01        ABC_MERCHANT        ${CARD TOKEN}

SUITE 1 - TEST CASE 3
    ${CARD TOKEN}       transactionUtil             1000
    UNSUCCESSULLY CREATE TRANSACTION    0.0000001   ABC_MERCHANT        ${CARD TOKEN}

SUITE 1 - TEST CASE 4
    ${CARD TOKEN}       transactionUtil             1000000000000
    SUCCESSULLY CREATE TRANSACTION      999999999999        ABC_MERCHANT        ${CARD TOKEN}

SUITE 1 - TEST CASE 5
    ${CARD TOKEN}       transactionUtil             1000
    UNSUCCESSULLY CREATE TRANSACTION    ABC10       ABC_MERCHANT        ${CARD TOKEN}

SUITE 1 - TEST CASE 6
    ${CARD TOKEN}       transactionUtil             1000
    UNSUCCESSULLY CREATE TRANSACTION    10          ABC_MERCHANT        INVALID_CARD_TOKEN

### TEST SUITE 2
SUITE 2 - TEST CASE 1
    ${CARD TOKEN}       transactionUtil             1000
    SUCCESSULLY CREATE TRANSACTION      10          ABC_MERCHANT        ${CARD TOKEN}

SUITE 2 - TEST CASE 2
    ${CARD TOKEN}       transactionUtil             1000
    SUCCESSULLY CREATE TRANSACTION      9999        ABC_MERCHANT        ${CARD TOKEN}

SUITE 2 - TEST CASE 3
    ${CARD TOKEN}       transactionUtil             1000
    SUCCESSULLY CREATE MULTIPLE TRANSACTION         10      ABC_MERCHANT        ${CARD TOKEN}       10

SUITE 2 - TEST CASE 4
    ${CARD TOKEN}       transactionUtil             1000
    SUCCESSULLY CREATE MULTIPLE TRANSACTION         10      ABC_MERCHANT        ${CARD TOKEN}       1000


*** Keywords ***
SUCCESSULLY CREATE TRANSACTION
    [Arguments]     ${transactionAmount}        ${merchantID}       ${CARD TOKEN}
    ${response}     testSuccessTransaction      ${transactionAmount}        ${merchantID}       ${CARD TOKEN}
    prettyPrintResponse                 ${response}

UNSUCCESSULLY CREATE TRANSACTION
    [Arguments]     ${transactionAmount}        ${merchantID}       ${CARD TOKEN}
    ${response}     testFailedTransaction       ${transactionAmount}        ${merchantID}       ${CARD TOKEN}
    prettyPrintResponse                 ${response}

SUCCESSULLY CREATE MULTIPLE TRANSACTION
    [Arguments]     ${transactionAmount}        ${merchantID}       ${CARD TOKEN}       ${nTransaction}
    testSuccessMultipleTransaction      ${transactionAmount}        ${merchantID}       ${CARD TOKEN}       ${nTransaction}
