-- SQL Lab 3: Initialize Banking Data with INSERT, UPDATE and DELETE
-- Run once after Labs 1 and 2. All information is fictional sample data.
USE BankingDB;
INSERT INTO Customers
(CustomerID,FirstName,LastName,Email,Phone,AccountCreationDate,DateOfBirth)
VALUES
(101,'Rahul','Sharma','rahul@gmail.com','9876543210','2023-01-05','1998-04-15'),
(102,'Priya','Patil','priya@yahoo.com','9888888899','2023-02-05','1995-06-18'),
(103,'Amit','Sarkar','amit@gmail.com',NULL,'2023-03-05','2000-09-20'),
(104,'Sneha','Pawar',NULL,'9876500099','2023-04-05','1997-09-12'),
(105,'Ravi','Shekar','ravi@yahoo.com','9876543299','2023-05-05','1993-11-25');
INSERT INTO Branches (BranchID,BranchName,BranchAddress,BranchPhone) VALUES
(1,'Mumbai Central','Mumbai','0221234567'),
(2,'Pune East','Pune','0201234567'),
(3,'Hyderabad','Hyderabad','0401234567'),
(4,'Bengaluru','Bengaluru','0801234567'),
(5,'Delhi','Delhi','0111234567');
INSERT INTO Accounts (AccountID,CustomerID,BranchID,AccountType,Balance) VALUES
(201,101,1,'Savings',25000),
(202,102,2,'Current',12000),
(203,103,3,'Savings',75000),
(204,104,4,'Salary',45000),
(205,105,5,'Savings',18000);
INSERT INTO Transactions
(TransactionID,AccountID,TransactionDate,Amount,TransactionType) VALUES
(301,201,'2026-01-01',12000,'Deposit'),
(302,202,'2026-01-02',2500,'Withdrawal'),
(303,203,'2026-01-03',50000,'Deposit'),
(304,204,'2026-01-04',7000,'Payment'),
(305,205,'2026-01-05',1500,'Deposit'),
(306,201,'2026-01-06',4500,'Withdrawal'),
(307,203,'2026-01-07',9000,'Payment'),
(308,204,'2026-01-08',22000,'Deposit'),
(309,205,'2026-01-09',3000,'Withdrawal');
INSERT INTO Loans
(LoanID,CustomerID,LoanAmount,InterestRate,StartDate,EndDate) VALUES
(401,101,500000,8.5,'2025-01-01','2030-01-01'),
(402,102,250000,9.0,'2025-02-01','2029-02-01'),
(403,103,500000,8.0,'2025-03-01','2030-03-01'),
(404,104,150000,10.0,'2025-04-01','2028-04-01'),
(405,105,300000,9.5,'2025-05-01','2029-05-01');
SELECT * FROM Customers;
SELECT * FROM Branches;
SELECT * FROM Accounts;
SELECT * FROM Transactions;
SELECT * FROM Loans;

-- Update phone, email, and AccountID 201 balance.
UPDATE Customers SET Phone='9999999999' WHERE CustomerID=101;
UPDATE Customers SET Email='rahul.sharma@gmail.com' WHERE CustomerID=101;
UPDATE Accounts SET Balance=30000 WHERE AccountID=201;
SELECT * FROM Customers WHERE CustomerID=101;
SELECT * FROM Accounts WHERE AccountID=201;

-- Delete linked TransactionID 302 first, then AccountID 202.
DELETE FROM Transactions WHERE TransactionID=302;
SELECT * FROM Transactions;
DELETE FROM Accounts WHERE AccountID=202;
SELECT * FROM Accounts;
