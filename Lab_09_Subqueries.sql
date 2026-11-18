-- SQL Lab 9: Perform Branch Performance Analysis Using Subqueries
-- The assigned exercises focus on account and transaction subqueries.
USE BankingDB;
-- Task 1: transactions higher than the overall average transaction
SELECT AVG(Amount) AS AverageAmount FROM Transactions;
SELECT * FROM Transactions
WHERE Amount > (SELECT AVG(Amount) FROM Transactions);
-- Task 2: accounts with above-average balances
SELECT AccountID,AccountType,Balance,CustomerID FROM Accounts
WHERE Balance > (SELECT AVG(Balance) FROM Accounts)
ORDER BY Balance DESC;
-- Task 3: deposit accounts using multi-row IN subquery
SELECT AccountID,AccountType,Balance,CustomerID FROM Accounts
WHERE AccountID IN (
 SELECT AccountID FROM Transactions WHERE TransactionType='Deposit'
);
-- Task 4: highest-balance account(s), including ties
SELECT AccountID,AccountType,Balance,CustomerID FROM Accounts
WHERE Balance = (SELECT MAX(Balance) FROM Accounts);
