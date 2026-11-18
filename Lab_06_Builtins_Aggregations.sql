-- SQL Lab 6: Generate Banking Summary Reports Using Aggregations
USE BankingDB;
-- Task 1: string functions
SELECT * FROM Customers;
SELECT FirstName,UPPER(FirstName) AS UpperCaseName FROM Customers;
SELECT FirstName,LOWER(FirstName) AS LowerCaseName FROM Customers;
SELECT FirstName,LENGTH(FirstName) AS NameLength FROM Customers;
SELECT FirstName,LEFT(FirstName,3) AS Initials FROM Customers;
SELECT CONCAT(FirstName,' - ',LastName) AS FullName FROM Customers;
-- Math functions
SELECT ROUND(1256.75) AS Rounded_Value;
SELECT CEIL(1256.25) AS Ceiling_Value;
SELECT FLOOR(1256.75) AS Floor_Value;
SELECT ABS(-2500) AS Absolute_Value;
SELECT MOD(25,4) AS Remainder;
-- Date/time functions
SELECT CURDATE() AS CurrentDate;
SELECT NOW() AS CurrentDateTime;
SELECT CustomerID,YEAR(DateOfBirth) AS BirthYear FROM Customers;
SELECT CustomerID,MONTH(DateOfBirth) AS BirthMonth FROM Customers;
SELECT CustomerID,DATEDIFF(CURDATE(),DateOfBirth) AS Days FROM Customers;
-- Conditional/comparison functions
-- The assignment uses the 1995 birth-year threshold; this is not a legal adulthood test.
SELECT FirstName,DateOfBirth,
 IF(YEAR(DateOfBirth)<=1995,'Adult','Young') AS Category FROM Customers;
SELECT FirstName,IFNULL(Phone,'Not Available') AS PhoneNumber FROM Customers;
SELECT GREATEST('2000-09-20','1995-06-18','1997-09-12','1993-11-25') AS LatestBirthDate;
SELECT LEAST('2000-09-20','1995-06-18','1997-09-12','1993-11-25') AS EarliestBirthDate;
SELECT FirstName,NULLIF(FirstName,'Priya') AS Result FROM Customers;
-- Task 2: overall banking performance (separate aggregate calculations)
SELECT SUM(Balance) AS total_balance FROM Accounts;
SELECT AVG(Balance) AS average_balance FROM Accounts;
SELECT MAX(Balance) AS highest_balance FROM Accounts;
SELECT MIN(Balance) AS lowest_balance FROM Accounts;
SELECT COUNT(*) AS total_accounts FROM Accounts;
-- Task 3: account-type performance
SELECT AccountType,SUM(Balance) AS TotalBalance
FROM Accounts GROUP BY AccountType;
-- Task 4: high-performing categories
SELECT AccountType,SUM(Balance) AS TotalBalance
FROM Accounts GROUP BY AccountType HAVING SUM(Balance)>25000;
