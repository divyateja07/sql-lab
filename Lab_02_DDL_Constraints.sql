-- SQL Lab 2: Secure Banking Data Model and DDL Constraints
-- Run after Lab 1.
USE BankingDB;
ALTER TABLE Customers ADD COLUMN DateOfBirth DATE;
ALTER TABLE Customers MODIFY Phone VARCHAR(20);
ALTER TABLE Customers MODIFY FirstName VARCHAR(50) NOT NULL;
ALTER TABLE Customers ADD CONSTRAINT uq_Email UNIQUE (Email);
-- CustomerID already has a PRIMARY KEY in Lab 1.

CREATE TABLE Branches (
  BranchID INT PRIMARY KEY,
  BranchName VARCHAR(100),
  BranchAddress VARCHAR(200),
  BranchPhone VARCHAR(15)
);
CREATE TABLE Accounts (
  AccountID INT PRIMARY KEY,
  AccountType VARCHAR(20),
  Balance DECIMAL(12,2),
  CustomerID INT NOT NULL,
  BranchID INT NOT NULL,
  CONSTRAINT chk_MinBalance CHECK (Balance >= 1000),
  CONSTRAINT FK_Accounts_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  CONSTRAINT FK_Accounts_Branches FOREIGN KEY (BranchID) REFERENCES Branches(BranchID)
);
CREATE TABLE Transactions (
  TransactionID INT PRIMARY KEY,
  TransactionDate DATE,
  Amount DECIMAL(12,2),
  TransactionType VARCHAR(20),
  AccountID INT NOT NULL,
  CONSTRAINT FK_Transactions_Accounts FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
CREATE TABLE Loans (
  LoanID INT PRIMARY KEY,
  LoanAmount DECIMAL(12,2),
  InterestRate DECIMAL(5,2),
  StartDate DATE,
  EndDate DATE,
  CustomerID INT NOT NULL,
  CONSTRAINT FK_Loans_Customers FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- DDL CREATE / DROP demonstration on a disposable table
CREATE TABLE AccountBranches (
  AccountID INT NOT NULL,
  BranchID INT NOT NULL,
  AssignmentDate DATE,
  PRIMARY KEY (AccountID,BranchID)
);
DESCRIBE AccountBranches;
DROP TABLE AccountBranches;

SHOW TABLES;
DESCRIBE Customers;
DESCRIBE Accounts;
DESCRIBE Transactions;
DESCRIBE Branches;
DESCRIBE Loans;
-- Verification: all foreign keys
SELECT TABLE_NAME,COLUMN_NAME,REFERENCED_TABLE_NAME,REFERENCED_COLUMN_NAME
FROM information_schema.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA='BankingDB' AND REFERENCED_TABLE_NAME IS NOT NULL
ORDER BY TABLE_NAME,COLUMN_NAME;
-- EER Diagram: Workbench > Database > Reverse Engineer > BankingDB
-- Relationships: Customers 1:N Accounts; Branches 1:N Accounts;
-- Accounts 1:N Transactions; Customers 1:N Loans.
-- Normalization: 1NF atomic attributes, 2NF no partial dependencies,
-- 3NF no transitive non-key dependencies.
