-- SQL Lab 4: Investigate Customer Transactions Using SQL Queries
USE BankingDB;
-- Task 1: customer information and activity
SELECT * FROM Customers;
SELECT FirstName,LastName,Email,Phone FROM Customers;
SELECT AccountID,AccountType,Balance FROM Accounts;
-- Task 2: filtering and investigation
SELECT * FROM Accounts WHERE AccountType='Savings';
SELECT * FROM Accounts WHERE AccountType='Current';
SELECT * FROM Accounts WHERE Balance>25000;
SELECT * FROM Accounts WHERE Balance<15000;
SELECT * FROM Transactions WHERE Amount BETWEEN 5000 AND 20000;
SELECT * FROM Transactions WHERE Amount BETWEEN 1000 AND 10000;
SELECT * FROM Customers WHERE CustomerID IN (101,102,103);
SELECT * FROM Customers WHERE CustomerID IN (104,105);
SELECT * FROM Customers WHERE FirstName LIKE 'R%';
SELECT * FROM Customers WHERE LastName LIKE 'S%';
-- Task 3: sorted and limited reporting
SELECT * FROM Customers ORDER BY FirstName ASC;
SELECT * FROM Customers ORDER BY LastName ASC;
SELECT * FROM Accounts ORDER BY Balance DESC;
SELECT DISTINCT AccountType FROM Accounts;
SELECT * FROM Accounts ORDER BY Balance DESC LIMIT 3;
SELECT * FROM Transactions ORDER BY TransactionID LIMIT 5 OFFSET 2;
SELECT * FROM Transactions ORDER BY Amount DESC,TransactionID LIMIT 5;
SELECT DISTINCT TransactionType FROM Transactions;
SELECT * FROM Transactions ORDER BY TransactionID LIMIT 4 OFFSET 3;
-- Task 4: missing values
SELECT * FROM Customers WHERE Phone IS NULL;
SELECT * FROM Customers WHERE Email IS NOT NULL;
SELECT * FROM Customers WHERE Email IS NULL;
SELECT * FROM Accounts WHERE Balance IS NOT NULL;
-- Task 5: account and transaction categories
SELECT AccountID,Balance,
 CASE WHEN Balance>=50000 THEN 'Premium Account'
      WHEN Balance>=25000 THEN 'Standard Account'
      ELSE 'Basic Account' END AS AccountCategory
FROM Accounts;
-- Example transaction thresholds (not specified in assignment):
-- High >= 20000; Medium >= 5000; otherwise Low
SELECT TransactionID,Amount,
 CASE WHEN Amount>=20000 THEN 'High Transaction'
      WHEN Amount>=5000 THEN 'Medium Transaction'
      ELSE 'Low Transaction' END AS TransactionCategory
FROM Transactions;
-- Task 6: window functions
SELECT AccountID,Balance,RANK() OVER (ORDER BY Balance DESC) AS BalanceRank FROM Accounts;
SELECT TransactionID,TransactionDate,Amount,
 SUM(Amount) OVER (ORDER BY TransactionDate,TransactionID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
FROM Transactions;
SELECT TransactionID,Amount,AVG(Amount) OVER () AS AverageTransaction FROM Transactions;
-- Activities: rank customer balances; running balance; maximum transaction
SELECT c.CustomerID,c.FirstName,a.Balance,
 RANK() OVER (ORDER BY a.Balance DESC) AS CustomerBalanceRank
FROM Customers c JOIN Accounts a ON a.CustomerID=c.CustomerID;
SELECT AccountID,Balance,
 SUM(Balance) OVER (ORDER BY AccountID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningBalance
FROM Accounts;
SELECT TransactionID,Amount,MAX(Amount) OVER () AS MaximumTransaction FROM Transactions;
