import requests
import json
from requests.auth import HTTPBasicAuth
from robot.utils.asserts import assert_equal, assert_not_equal

class User:
    def __init__(self, firstName, lastName, birthday):
        self.firstName = firstName
        self.lastName = lastName
        self.birthday = birthday
        self.userCreationURL = "https://sandbox-api.marqeta.com/v3/users"

    def createUser(self, username, password):
        body = {
            "first_name": self.firstName,
            "last_name": self.lastName,
            "birth_date": self.birthday
        }
        response = requests.post(url=self.userCreationURL, json=body, auth=HTTPBasicAuth(username, password))
        return((response.status_code, response.json()))
    
    def validateSuccessStatus(self, statusCode):
        return assert_equal(statusCode, 201)

    def validateFailStatus(self, statusCode):
        return assert_not_equal(statusCode, 201)