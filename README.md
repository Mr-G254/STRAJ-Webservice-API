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
![Search UI](images/Test/searchAccount.png)
![Search UI](images/Test/searchAccountOutput.png)
### Creating Current Account
Creates a current Account(CATEGORY : 1001)

![Create Account UI](images/Test/createAccount.png)
![Create Account UI](images/Test/createAccountOutput.png)

Verifying the on T24. Note that the inputter is OFS IRIS.

<img at="Create Account T24" src="images/Test/createAccountOutputT24.png" height="500">

### Edit Customer Record
This involves two APIs, one that will fetch the customer data to display to the user interface and another to save the edited data to T24. More details will be provided in the setup section.

![Edit Customer UI](images/Test/editCustomerA.png)
![Edit Customer UI](images/Test/editCustomerB.png)
![Edit Customer UI](images/Test/editCustomerC.png)

Comparing the Edited customer records
Changes: ` MNEMONIC, SHORT NAME, NATIONALITY, LANGUAGE `
| Before | After |
| :---: | :---: |
| ![Edit Customer Before](images/Test/editCustomerBefore.png) | ![Edit Customer After](images/Test/editCustomerAfter.png) |

### Delete Unauthorised Customer Record
Note: you can't delete an authorised Customer record

![Delete Customer UI](images/Test/delCustomerA.png)
![Delete Customer UI](images/Test/delCustomerB.png)

## T24 Setup
### Customer Accounts Enquiry API
 T24 | T24 |
 :---: | :---: |
| ![Customer Accounts Enquiry API](images/1.ENQA.png) | ![Customer Accounts Enquiry API](images/1.ENQB.png) |

### Creating Current Account Version API
The Category is a noinput field and has a default value of 1001
 T24 | T24 | T24 |
 :---: | :---: | :---: |
| ![Create Account UI](images/2.VERSA.png) | ![Create Account UI](images/2.VERSB.png) | ![Create Account UI](images/2.VERSC.png) |

### Get Customer Enquiry API
 T24 | T24 | T24 |
 :---: | :---: | :---: |
| ![Get Customer](images/getCustA.png) | ![Get Customer](images/getCustB.png) | ![Get Customer](images/getCustC.png) |

### Edit Customer Record Version API
 T24 | T24 | T24 |
 :---: | :---: | :---: |
| ![Edit Customer](images/editCustA.png) | ![Edit Customer](images/editCustB.png) | ![Edit Customer](images/editCustC.png) |

### Delete Unauthorised Customer Version API
Note: The fields in this version are not necesarry because we are only deleting the record and we won't be sending any data.
 T24 | T24 | T24 |
 :---: | :---: | :---: |
| ![Del Unauth Cust](images/4.VERSA.png) | ![Del Unauth Cust](images/4.VERSB.png) | ![Del Unauth Cust](images/4.VERSC.png) |