-- SQL Lab 8: Create Transaction Reports Using Table Joins
USE BankingDB;
-- Lab 2 creates the FK Accounts.BranchID -> Branches.BranchID.
-- Task 1: all matching account/transaction records (INNER JOIN)
SELECT a.AccountID,a.AccountType,a.Balance,
 t.TransactionID,t.TransactionDate,t.TransactionType,t.Amount
FROM Accounts a INNER JOIN Transactions t ON a.AccountID=t.AccountID;
-- Task 2: include all accounts, even if they have no transactions (LEFT JOIN)
SELECT a.AccountID,a.AccountType,a.Balance,
 t.TransactionID,t.TransactionDate,t.TransactionType,t.Amount
FROM Accounts a LEFT JOIN Transactions t ON a.AccountID=t.AccountID;
-- Task 3: deposit-only transactions
SELECT a.AccountID,a.AccountType,a.Balance,
 t.TransactionID,t.TransactionDate,t.TransactionType,t.Amount
FROM Accounts a INNER JOIN Transactions t ON a.AccountID=t.AccountID
WHERE t.TransactionType='Deposit';
-- Task 4: accounts above 30000 with their transaction details
SELECT a.AccountID,a.AccountType,a.Balance,
 t.TransactionID,t.TransactionDate,t.TransactionType,t.Amount
FROM Accounts a INNER JOIN Transactions t ON a.AccountID=t.AccountID
WHERE a.Balance>30000
ORDER BY a.Balance DESC,t.TransactionDate DESC;
