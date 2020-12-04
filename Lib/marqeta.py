from User import User
from CardProduct import CardProduct
from Card import Card
from Transaction import Transaction
from pprint import pprint

import requests
import json
from requests.auth import HTTPBasicAuth

USERNAME = "71a10f81-b296-485b-a995-428651c5560c"
PASSWORD = "eb69ff5b-3663-4eb2-a071-7d0c5a96092d"

#####################################
##### User Testing Utils
#####################################

def testSuccessUser(firstName, lastName, birthday):
    newUser = User(firstName, lastName, birthday)
    (statusCode, response) = newUser.createUser(USERNAME, PASSWORD)
    newUser.validateSuccessStatus(statusCode)
    return response

def testFailedUser(firstName, lastName, birthday):
    newUser = User(firstName, lastName, birthday)
    (statusCode, response) = newUser.createUser(USERNAME, PASSWORD)
    newUser.validateFailStatus(statusCode)
    return response

#####################################
##### Card Product Testing Utils
#####################################

def testSuccessCardProduct(name, active, startDate, endDate):
    newCardProduct = CardProduct(name, active, startDate, endDate)
    (statusCode, response) = newCardProduct.createCardProduct(USERNAME, PASSWORD)
    newCardProduct.validateSuccessStatus(statusCode)
    return response

def testFailedCardProduct(name, active, startDate, endDate):
    newCardProduct = CardProduct(name, active, startDate, endDate)
    (statusCode, response) = newCardProduct.createCardProduct(USERNAME, PASSWORD)
    newCardProduct.validateFailStatus(statusCode)
    return response

#####################################
##### Card Testing Utils
#####################################

def getNewTestingValidCardProductToken():
    newCardProduct = CardProduct("Test_Card_Product", True, "2019-01-01", "2030-01-01")
    newCardProduct.createCardProduct(USERNAME, PASSWORD)
    return newCardProduct.returnCardProductToken()

def getNewTestingValidUserToken():
    newUser = User("Test", "User", "1990-01-01")
    newUser.createUser(USERNAME, PASSWORD)
    return newUser.returnUserToken()

def testSuccessCard(userToken, cardProductToken):
    newCard = Card(userToken, cardProductToken)
    (statusCode, response) = newCard.createCard(USERNAME, PASSWORD)
    newCard.validateSuccessStatus(statusCode)
    return response

def testFailedCard(userToken, cardProductToken):
    newCard = Card(userToken, cardProductToken)
    (statusCode, response) = newCard.createCard(USERNAME, PASSWORD)
    newCard.validateFailStatus(statusCode)
    return response

#####################################
##### Transaction Testing Utils
#####################################

def createFundingSource(fundingName, username, password):
    createFundingSourceURL = "https://sandbox-api.marqeta.com/v3/fundingsources/program"
    body = {"name": fundingName}
    response = requests.post(url=createFundingSourceURL, json=body, auth=HTTPBasicAuth(username, password))
    return((response.status_code, response.json()))

def transactionUtil(fundAmount):
    ### Create new user, new funding source and fund the user
    newFundingSource = createFundingSource("NEW_TEST_FUNDING_SOURCE", USERNAME, PASSWORD)
    newUser = User("Test", "User", "1990-01-01")
    newUser.createUser(USERNAME, PASSWORD)
    newUser.fundTheUser(fundAmount, newFundingSource[1]["token"], USERNAME, PASSWORD)
    newUserToken = newUser.returnUserToken()
    
    ### Create new card with the newly created user
    cardProductToken = getNewTestingValidCardProductToken()
    newCard = Card(newUserToken, cardProductToken)
    newCard.createCard(USERNAME, PASSWORD)
    return newCard.returnCardToken()

def createNewTransaction(amount, merchantID, cardToken):
    newTransaction = Transaction(amount, merchantID, cardToken)
    return newTransaction

def testSuccessTransaction(transactionAmount, merchantID, cardToken):
    newTransaction = createNewTransaction(transactionAmount, merchantID, cardToken)
    (statusCode, response) = newTransaction.createTransaction(USERNAME, PASSWORD)
    newTransaction.validateSuccessStatus(statusCode)
    return response

def testFailedTransaction(transactionAmount, merchantID, cardToken):
    newTransaction = createNewTransaction(transactionAmount, merchantID, cardToken)
    (statusCode, response) = newTransaction.createTransaction(USERNAME, PASSWORD)
    newTransaction.validateFailStatus(statusCode)
    return response

def testSuccessMultipleTransaction(transactionAmount, merchantID, cardToken, nTransaction):
    newTransaction = createNewTransaction(transactionAmount, merchantID, cardToken)
    responseList = newTransaction.createTransactionMultipleTimes(USERNAME, PASSWORD, nTransaction)
    newTransaction.validateSuccessStatusForMultipleTransactions(responseList)

#####################################
##### Pretty Print Response
#####################################

def prettyPrintResponse(response):
    pprint(response)