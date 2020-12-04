import requests
import json
from requests.auth import HTTPBasicAuth
from robot.utils.asserts import assert_equal, assert_not_equal

class Card:
    def __init__(self, userToken, cardProductToken):
        self.userToken = userToken
        self.cardProductToken = cardProductToken
        self.cardToken = ""
        self.cardCreationURL = "https://sandbox-api.marqeta.com/v3/cards"

    def createCard(self, username, password):
        body = {
            "user_token": self.userToken,
            "card_product_token": self.cardProductToken
        }
        response = requests.post(url=self.cardCreationURL, json=body, auth=HTTPBasicAuth(username, password))
        if response.status_code == 201:
            self.cardToken = response.json()["token"]
        return((response.status_code, response.json()))
    
    def validateSuccessStatus(self, statusCode):
        return assert_equal(statusCode, 201)

    def validateFailStatus(self, statusCode):
        return assert_not_equal(statusCode, 201)
    
    def returnCardToken(self):
        return self.cardToken