import requests
import json
from requests.auth import HTTPBasicAuth
from robot.utils.asserts import assert_equal, assert_not_equal

class Transaction:
    def __init__(self, amount, merchantID, cardToken):
        self.amount = amount
        self.merchantID = merchantID
        self.cardToken = cardToken
        self.transactionCreationURL = "https://sandbox-api.marqeta.com/v3/simulate/authorization"

    def createTransaction(self, username, password):
        body = {
                "amount": self.amount,
                "mid": self.merchantID,
                "card_token": self.cardToken
        }
        response = requests.post(url=self.transactionCreationURL, json=body, auth=HTTPBasicAuth(username, password))
        return((response.status_code, response.json()))
    
    def createTransactionMultipleTimes(self, username, password, n):
        body = {
                "amount": self.amount,
                "mid": self.merchantID,
                "card_token": self.cardToken
        }
        responseList = []
        for i in n:
            responseList.append(requests.post(url=self.transactionCreationURL, json=body, auth=HTTPBasicAuth(username, password)))
        return(responseList)

    def validateSuccessStatus(self, statusCode):
        return assert_equal(statusCode, 201)

    def validateFailStatus(self, statusCode):
        return assert_not_equal(statusCode, 201)
    
    def validateSuccessStatusForMultipleTransactions(self, responseList):
        for response in responseList:
            assert_equal(response.status_code, 201)
    