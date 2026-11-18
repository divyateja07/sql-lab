-- SQL Lab 5: Build Customer Search System with Filtering & Sorting
USE BankingDB;
-- Task 1: LIKE name, email and phone search patterns
SELECT * FROM Customers WHERE FirstName LIKE 'A%';
SELECT * FROM Customers WHERE Email LIKE '%gmail%';
SELECT * FROM Customers WHERE LastName LIKE '%kar';
SELECT * FROM Customers WHERE FirstName LIKE 'R%';
SELECT * FROM Customers WHERE Email LIKE '%yahoo%';
SELECT * FROM Customers WHERE LastName LIKE 'P%';
SELECT * FROM Customers WHERE Phone LIKE '%99';
-- Task 2: selected bank account, transaction and customer IDs
SELECT * FROM Accounts WHERE AccountType IN ('Savings','Current');
SELECT * FROM Transactions WHERE TransactionType IN ('Deposit','Withdrawal');
SELECT * FROM Customers WHERE CustomerID IN (101,102,105);
SELECT * FROM Accounts WHERE AccountType IN ('Salary','Savings');
SELECT * FROM Transactions WHERE TransactionType IN ('Payment','Deposit');
SELECT * FROM Customers WHERE CustomerID IN (103,104);
SELECT * FROM Accounts WHERE AccountID IN (201,203,205);
-- Task 3: sorted banking reports
SELECT * FROM Customers ORDER BY LastName ASC;
SELECT * FROM Accounts ORDER BY Balance DESC;
SELECT * FROM Transactions ORDER BY TransactionDate DESC,TransactionID DESC;
SELECT * FROM Customers ORDER BY FirstName;
SELECT * FROM Accounts ORDER BY AccountType;
SELECT * FROM Transactions ORDER BY Amount DESC;
SELECT * FROM Customers ORDER BY DateOfBirth;
-- Task 4: LIMIT and OFFSET results
SELECT * FROM Accounts ORDER BY Balance DESC LIMIT 5;
SELECT * FROM Customers ORDER BY CustomerID LIMIT 3;
SELECT * FROM Transactions ORDER BY TransactionID LIMIT 5 OFFSET 3;
SELECT * FROM Transactions ORDER BY Amount DESC,TransactionID LIMIT 3;
SELECT * FROM Customers ORDER BY CustomerID LIMIT 4;
SELECT * FROM Accounts ORDER BY AccountID LIMIT 3 OFFSET 2;
SELECT * FROM Transactions ORDER BY TransactionDate DESC,TransactionID DESC LIMIT 5;
-- Task 5: combined filter/sort/search reports
SELECT * FROM Accounts WHERE AccountType='Savings' ORDER BY Balance DESC;
SELECT * FROM Customers WHERE FirstName LIKE 'S%' ORDER BY CustomerID LIMIT 5;
SELECT * FROM Transactions WHERE TransactionType IN ('Deposit','Withdrawal')
ORDER BY TransactionDate DESC,TransactionID DESC;
