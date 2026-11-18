-- SQL Lab 1: Set Up Banking Database & Explore Table Structure
-- Run first on MySQL 8.0+.
CREATE DATABASE IF NOT EXISTS BankingDB;
USE BankingDB;
SHOW DATABASES;

CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(100),
  Phone VARCHAR(15),
  AccountCreationDate DATE
);
SHOW TABLES;
DESCRIBE Customers;
SHOW COLUMNS FROM Customers;
-- A column is an attribute (e.g. CustomerID). A row is a customer record.
SELECT COUNT(*) AS TotalRows FROM Customers;
SELECT * FROM Customers;
