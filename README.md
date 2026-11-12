# STRAJ Webservice API Assignment

## Introduction
This project is a continuation of the T24 Webservice API assignmet which Involved:
- Creating an API enquiry that list all customer accounts
- Creating an API version that creates current Accounts
- Creating an API enquiry that will fetch customer data
- Creating an API version that will edit the fetched customer data
- Creating an API version that will delete unauthorised customer record

The APIs above interact with T24 with the help of a web application provided in this repository 
` STRAJ-Webservice-API/STRAJ_Webservice ` folder.

## Overview
### Searching For All Customer Accounts
![Search UI](images\Test\searchAccount.png)
![Search UI](images\Test\searchAccountOutput.png)
### Creating Current Account
Creates a current Account(CATEGORY : 1001)

![Create Account UI](images\Test\createAccount.png)
![Create Account UI](images\Test\createAccountOutput.png)

Verifying the on T24. Note that the inputter is OFS IRIS.

![Create Account T24](images\Test\createAccountOutputT24.png)

### Edit Customer Record
This invvolves two APIs, one that will fetch the customer data and another to save the edited data. More details will be provided in the setup section.

![Edit Customer UI](images\Test\editCustomerA.png)
![Edit Customer UI](images\Test\editCustomerB.png)
![Edit Customer UI](images\Test\editCustomerC.png)

Comparing the Edited customer records
| Before | After |
| :---: | :---: |
| ![Edit Customer Before](images\Test\editCustomerBefore.png) | ![Edit Customer After](images\Test\editCustomerAfter.png) |

### Delete Unauthorised Customer Record
Note: you can't delete an authorised Customer record

![Delete Customer UI](images\Test\delCustomerA.png)
![Delete Customer UI](images\Test\delCustomerB.png)