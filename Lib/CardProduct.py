import requests
import json
from requests.auth import HTTPBasicAuth
from robot.utils.asserts import assert_equal, assert_not_equal

class CardProduct:
    def __init__(self, name, active, startDate, endDate):
        self.name = name
        self.active = active
        self.startDate = startDate
        self.endDate = endDate
        self.cardProductToken = ""
        self.cardCreationURL = "https://sandbox-api.marqeta.com/v3/cardproducts"

    def createCardProduct(self, username, password):
        body = {
            "name": self.name,
            "active": self.active,
            "start_date": self.startDate,
            "end_date": self.endDate,
            "config": {
                "fulfillment": {
                    "payment_instrument":"VIRTUAL_PAN"
                },
                "poi": {
                    "ecommerce": True
                },
                "card_life_cycle": {
                    "activate_upon_issue": True
                }
            }
        }
        response = requests.post(url=self.cardCreationURL, json=body, auth=HTTPBasicAuth(username, password))
        if response.status_code == 201:
            self.cardProductToken = response.json()["token"]
        return((response.status_code, response.json()))
    
    def validateSuccessStatus(self, statusCode):
        return assert_equal(statusCode, 201)

    def validateFailStatus(self, statusCode):
        return assert_not_equal(statusCode, 201)

    def returnCardProductToken(self):
        return self.cardProductToken