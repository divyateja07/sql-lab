-- SQL Lab 7: Analyze Loan Risk Using Window Functions
-- These queries rank loan AMOUNTS (no risk score column is supplied).
USE BankingDB;
-- Task 1: OVER() keeps all loan records when computing window metrics.
SELECT LoanID,CustomerID,LoanAmount,AVG(LoanAmount) OVER () AS OverallAverageLoan FROM Loans;
-- Task 2: RANK allows gaps when loan amounts tie
SELECT LoanID,CustomerID,LoanAmount,
 RANK() OVER (ORDER BY LoanAmount DESC) AS LoanRank FROM Loans;
-- Task 3: DENSE_RANK has no rank gaps
SELECT LoanID,CustomerID,LoanAmount,
 DENSE_RANK() OVER (ORDER BY LoanAmount DESC) AS DenseRank FROM Loans;
-- Task 4: ROW_NUMBER always gives a unique sequence
SELECT LoanID,CustomerID,LoanAmount,
 ROW_NUMBER() OVER (ORDER BY LoanAmount DESC,LoanID) AS RowNumber FROM Loans;
-- Task 5: PARTITION BY independently numbers loans per customer
SELECT LoanID,CustomerID,LoanAmount,
 ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY LoanAmount DESC,LoanID) AS RowNum FROM Loans;
-- Task 6: cumulative loan total, deterministic for ties
SELECT LoanID,CustomerID,LoanAmount,
 SUM(LoanAmount) OVER (ORDER BY LoanAmount DESC,LoanID ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS RunningTotal
FROM Loans;
-- Task 7: previous loan
SELECT LoanID,CustomerID,LoanAmount,
 LAG(LoanAmount) OVER (ORDER BY LoanAmount DESC,LoanID) AS PreviousLoanAmount FROM Loans;
-- Task 8: next loan
SELECT LoanID,CustomerID,LoanAmount,
 LEAD(LoanAmount) OVER (ORDER BY LoanAmount DESC,LoanID) AS NextLoanAmount FROM Loans;
-- Combined rank comparison
SELECT LoanID,CustomerID,LoanAmount,
 RANK() OVER (ORDER BY LoanAmount DESC) AS LoanRank,
 DENSE_RANK() OVER (ORDER BY LoanAmount DESC) AS DenseRank,
 ROW_NUMBER() OVER (ORDER BY LoanAmount DESC,LoanID) AS RowNumber
FROM Loans;
