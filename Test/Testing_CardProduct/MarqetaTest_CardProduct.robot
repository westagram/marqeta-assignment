*** Settings ***
Documentation       Card Testing for Marqeta

Library     String
Library     ../../Lib/marqeta.py

*** Test Cases ***

### TEST SUITE 1
SUITE 1 - TEST CASE 1
    SUCCESSULLY CREATE CARD     TEST_CARD   ${TRUE}     2019-01-01      2020-12-12

SUITE 1 - TEST CASE 2
    UNSUCCESSULLY CREATE CARD   TEST_CARD   ${TRUE}     2019-01-32      2020-12-12

SUITE 1 - TEST CASE 3   
    SUCCESSULLY CREATE CARD     TEST_CARD   ${TRUE}     2020-02-29      2020-12-12

SUITE 1 - TEST CASE 4
    SUCCESSULLY CREATE CARD     TEST_CARD   ${TRUE}     2019-02-29      2020-12-12

SUITE 1 - TEST CASE 5
    UNSUCCESSULLY CREATE CARD   TEST_CARD   ${TRUE}     2019-13-01      2020-12-12

SUITE 1 - TEST CASE 6
    UNSUCCESSULLY CREATE CARD   TEST_CARD   ${TRUE}     01-01-2019      2020-12-12

SUITE 1 - TEST CASE 7
    UNSUCCESSULLY CREATE CARD   TEST_CARD   ${TRUE}     2022-01-01      2020-12-12


### TEST SUITE 2
SUITE 2 - TEST CASE 1
    SUCCESSULLY CREATE CARD     TEST_CARD   ${TRUE}     2018-01-01      2019-01-01

SUITE 2 - TEST CASE 2
    UNSUCCESSULLY CREATE CARD   TEST_CARD   ${TRUE}     2018-01-01      2019-01-32

SUITE 2 - TEST CASE 3   
    SUCCESSULLY CREATE CARD     TEST_CARD   ${TRUE}     2018-01-01      2020-02-29

SUITE 2 - TEST CASE 4
    SUCCESSULLY CREATE CARD     TEST_CARD   ${TRUE}     2018-01-01      2019-02-29

SUITE 2 - TEST CASE 5
    UNSUCCESSULLY CREATE CARD   TEST_CARD   ${TRUE}     2018-01-01      2019-13-01

SUITE 2 - TEST CASE 6
    UNSUCCESSULLY CREATE CARD   TEST_CARD   ${TRUE}     2018-01-01      01-01-2019


### TEST SUITE 3
SUITE 3 - TEST CASE 1
    SUCCESSULLY CREATE CARD     TESTING CARD    ${TRUE}     2018-01-01      2020-12-12

SUITE 3 - TEST CASE 2
    SUCCESSULLY CREATE CARD     testing card    ${TRUE}     2018-01-01      2020-12-12

SUITE 3 - TEST CASE 3   
    SUCCESSULLY CREATE CARD     Testing Card    ${TRUE}     2018-01-01      2020-12-12

SUITE 3 - TEST CASE 4
    SUCCESSULLY CREATE CARD     $Testing $Card  ${TRUE}     2018-01-01      2020-12-12

SUITE 3 - TEST CASE 5
    SUCCESSULLY CREATE CARD     Testing_Card    ${TRUE}     2018-01-01      2020-12-12

SUITE 3 - TEST CASE 6
    SUCCESSULLY CREATE CARD     T               ${TRUE}     2018-01-01      2020-12-12

SUITE 3 - TEST CASE 7
    SUCCESSULLY CREATE CARD     t               ${TRUE}     2018-01-01      2020-12-12

SUITE 3 - TEST CASE 8
    SUCCESSULLY CREATE CARD     Testing_Card_Testing_Card_Testing_Card_T    ${TRUE}     2018-01-01    2020-12-12

SUITE 3 - TEST CASE 9
    UNSUCCESSULLY CREATE CARD   Testing_Card_Testing_Card_Testing_Card_Te   ${TRUE}     2018-01-01    2020-12-12


### TEST SUITE 4
SUITE 4 - TEST CASE 1
    SUCCESSULLY CREATE CARD     TEST_CARD       ${TRUE}     2018-01-01      2020-12-12

SUITE 4 - TEST CASE 2
    SUCCESSULLY CREATE CARD     TEST_CARD       ${TRUE}     2018-01-01      2020-12-12

SUITE 4 - TEST CASE 3   
    UNSUCCESSULLY CREATE CARD   TEST_CARD       Test        2018-01-01      2020-12-12


*** Keywords ***
SUCCESSULLY CREATE CARD
    [Arguments]     ${name}  ${active}  ${startDate}    ${endDate}
    ${response}     testSuccessCardProduct      ${name}         ${active}  ${startDate}    ${endDate}
    prettyPrintResponse                 ${response}

UNSUCCESSULLY CREATE CARD
    [Arguments]     ${name}  ${active}  ${startDate}    ${endDate}
    ${response}     testFailedCardProduct      ${name}         ${active}  ${startDate}    ${endDate}
    prettyPrintResponse                 ${response}