*** Settings ***
Documentation       User Testing for Marqeta

Library     String
Library     ../../Lib/marqeta.py

*** Test Cases ***

### TEST SUITE 1
SUITE 1 - TEST CASE 1
    SUCCESSULLY CREATE USER     JOHN    Smith   1990-01-01

SUITE 1 - TEST CASE 2
    SUCCESSULLY CREATE USER     john    Smith   1990-01-01

SUITE 1 - TEST CASE 3
    SUCCESSULLY CREATE USER     JoHn    Smith   1990-01-01

SUITE 1 - TEST CASE 4
    SUCCESSULLY CREATE USER     $JoHn   Smith   1990-01-01

SUITE 1 - TEST CASE 5
    SUCCESSULLY CREATE USER     Jo_hn   Smith   1990-01-01

SUITE 1 - TEST CASE 6
    SUCCESSULLY CREATE USER     Jo hn   Smith   1990-01-01

SUITE 1 - TEST CASE 7
    SUCCESSULLY CREATE USER     J       Smith   1990-01-01

SUITE 1 - TEST CASE 8
    SUCCESSULLY CREATE USER     j       Smith   1990-01-01

### TEST SUITE 2
SUITE 2 - TEST CASE 1
    SUCCESSULLY CREATE USER     John    SMITH   1990-01-01

SUITE 2 - TEST CASE 2
    SUCCESSULLY CREATE USER     John    smith   1990-01-01

SUITE 2 - TEST CASE 3
    SUCCESSULLY CREATE USER     John    SmItH   1990-01-01

SUITE 2 - TEST CASE 4
    SUCCESSULLY CREATE USER     John    $Smith  1990-01-01

SUITE 2 - TEST CASE 5
    SUCCESSULLY CREATE USER     John    Smi_th  1990-01-01

SUITE 2 - TEST CASE 6
    SUCCESSULLY CREATE USER     John    Smi th  1990-01-01

SUITE 2 - TEST CASE 7
    SUCCESSULLY CREATE USER     John    S       1990-01-01

SUITE 2 - TEST CASE 8
    SUCCESSULLY CREATE USER     John    s       1990-01-01

### TEST SUITE 3
SUITE 3 - TEST CASE 1
    SUCCESSULLY CREATE USER     John    Smith   1990-01-01

SUITE 3 - TEST CASE 2
    UNSUCCESSULLY CREATE USER   John    Smith   1990-01-32

SUITE 3 - TEST CASE 3
    SUCCESSULLY CREATE USER     John    Smith   1992-02-29

SUITE 3 - TEST CASE 4
    UNSUCCESSULLY CREATE USER   John    Smith   1990-02-29

SUITE 3 - TEST CASE 5
    UNSUCCESSULLY CREATE USER   John    Smith   1990-13-01

SUITE 3 - TEST CASE 6
    SUCCESSULLY CREATE USER     John    Smith   2010-01-01

SUITE 3 - TEST CASE 7
    UNSUCCESSULLY CREATE USER   John    Smith   2030-01-01

SUITE 3 - TEST CASE 8
    UNSUCCESSULLY CREATE USER   John    Smith   01-01-1990


*** Keywords ***
SUCCESSULLY CREATE USER
    [Arguments]     ${firstName}        ${lastName}     ${birthday}
    ${response}     testSuccessUser     ${firstName}    ${lastName}     ${birthday}
    prettyPrintResponse                 ${response}

UNSUCCESSULLY CREATE USER
    [Arguments]     ${firstName}        ${lastName}     ${birthday}
    ${response}     testFailedUser      ${firstName}    ${lastName}     ${birthday}
    prettyPrintResponse                 ${response}