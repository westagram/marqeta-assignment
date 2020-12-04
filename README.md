# marqeta-assignment

## Test Documentation:

For test documentation, regarding test cases and its result, please view the excel file "Marqeta Testing Document.xlsx" or use the following google sheets link: https://docs.google.com/spreadsheets/d/1g4hwd1NE1lF8qQTCYXKNsmSUIYUPaV3JxW8BW9s2c88/edit?usp=sharing

## Test Automation:

The test automation is being written in RobotFramework (for more detail of the framework, visit https://robotframework.org/)

There are testing automation for 4 functionalities: User Creation, Card Product Creation, Card Creation and Transaction

To view the test automation, go to the *Test* folder and its respective sub-folder.

To view the test result, after going into the test sub-folder, navigate to *Output* and open the *log.html* file (NOTE: it needs to be open in a browser and not only inspecting its html code) 

To view the automation code, after going into the test sub-folder, open up the *.robot* file

## Run the Automation:

To run the automation, follow the following steps:<br />
    &nbsp;&nbsp;- Install python version 3 and pip in your machine.<br />
    &nbsp;&nbsp;- Install RobotFramework by opening the command line and enter *pip install robotframework* (for more detail, visit https://robotframework.org/)<br />
    &nbsp;&nbsp;- In the command line, navigate through the testing folder and run the execution *robot -A argfile.txt robotfile.robot*<br />
    &nbsp;&nbsp;- The output of the test will write/overwrite in the */Output* folder. Open up its *log.html* file to check its output.<br />

## Test Library:

The test library (in python) can be found in "Lib/marqeta.py". It includes all needed functionalities to test user creation, card product creation, card creation and transaction.

## Objects:

There are 4 objects to support the framework: User, Card, CardProduct and Transaction. Each of the Object has the following APIs:<br />
    &nbsp;&nbsp;- User (takes 3 parameters: firstName, lastName, birthday):<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- createUser() - create the User with its parameters<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- validateSuccessStatus() - validate return status is 201<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- validateFailStatus() - validate return status is NOT 201<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- fundTheUser() - fund the User with the given amount as input<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- returnUserToken() - return the User's token<br />
    &nbsp;&nbsp;- CardProduct (takes 4 parameters: name, active, startDate, endDate):<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- createCardProduct() - create the CardProduct with its parameters<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- validateSuccessStatus() - validate return status is 201<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- validateFailStatus() - validate return status is NOT 201<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- returnUserToken() - return the CardProduct's token<br />
    &nbsp;&nbsp;- Card (takes 2 parameters: userToken, cardProductToken):<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- createCard() - create the Card with its parameters<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- validateSuccessStatus() - validate return status is 201<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- validateFailStatus() - validate return status is NOT 201<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- returnUserToken() - return the Card's token<br />
    &nbsp;&nbsp;- Transaction (takes 3 parameters: amount, merchantID, cardToken):<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- createTransaction() - create the Transaction with its parameters<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- createTransactionMultipleTimes() - create the same Transaction multiple times with its parameters<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- validateSuccessStatus() - validate return status is 201<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- validateFailStatus() - validate return status is NOT 201<br />
        &nbsp;&nbsp;&nbsp;&nbsp;- validateSuccessStatusForMultipleTransactions() - validate all the multiple transactions have return status 201<br />