-- SQL Lab 10: Develop Reporting Layer Using SQL Views
USE BankingDB;
-- Task 1: create a reusable high-balance account view
CREATE OR REPLACE VIEW High_Balance_Accounts AS
SELECT AccountID,AccountType,Balance,CustomerID
FROM Accounts
WHERE Balance>30000;
-- Task 2: retrieve view records
SELECT * FROM High_Balance_Accounts;
-- Task 3: replace view to include related transaction details
CREATE OR REPLACE VIEW High_Balance_Accounts AS
SELECT a.AccountID,a.AccountType,a.Balance,a.CustomerID,
 t.TransactionID,t.TransactionDate,t.TransactionType,t.Amount
FROM Accounts a INNER JOIN Transactions t
ON a.AccountID=t.AccountID
WHERE a.Balance>30000;
-- Task 4: sorted report from the view
SELECT AccountID,AccountType,Balance,CustomerID,
 TransactionID,TransactionDate,TransactionType,Amount
FROM High_Balance_Accounts ORDER BY Balance DESC,TransactionDate DESC;
