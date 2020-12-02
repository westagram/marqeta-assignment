from User import User
from CardProduct import CardProduct
from pprint import pprint

USERNAME = "71a10f81-b296-485b-a995-428651c5560c"
PASSWORD = "eb69ff5b-3663-4eb2-a071-7d0c5a96092d"

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

def prettyPrintResponse(response):
    pprint(response)