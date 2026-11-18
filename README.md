# BankingDB — SQL Labs 1–10

An educational Banking Management Database project prepared for **MySQL 8.0+**. The repository includes **10 separate SQL lab files**, one ERD source diagram and these instructions. All sample customer data is fictional.

## Run order

| Lab | File | Topics |
|---|---|---|
| 1 | [Lab_01_Setup.sql](Lab_01_Setup.sql) | Create BankingDB and Customers, SHOW, DESCRIBE, rows and columns |
| 2 | [Lab_02_DDL_Constraints.sql](Lab_02_DDL_Constraints.sql) | ALTER, CREATE, DROP, primary/foreign keys, UNIQUE, CHECK, relationships |
| 3 | [Lab_03_DML.sql](Lab_03_DML.sql) | INSERT sample data, UPDATE, DELETE and verify |
| 4 | [Lab_04_DQL_Analysis.sql](Lab_04_DQL_Analysis.sql) | SELECT, WHERE, IN, BETWEEN, NULL, CASE and window calculations |
| 5 | [Lab_05_Filtering_Sorting.sql](Lab_05_Filtering_Sorting.sql) | LIKE, IN, ORDER BY, LIMIT, OFFSET, combined searches |
| 6 | [Lab_06_Builtins_Aggregations.sql](Lab_06_Builtins_Aggregations.sql) | String/math/date/comparison functions, SUM, AVG, COUNT, GROUP BY, HAVING |
| 7 | [Lab_07_Window_Functions.sql](Lab_07_Window_Functions.sql) | OVER, RANK, DENSE_RANK, ROW_NUMBER, PARTITION BY, SUM, LAG, LEAD |
| 8 | [Lab_08_Joins.sql](Lab_08_Joins.sql) | INNER JOIN, LEFT JOIN, deposits, higher-balance reports |
| 9 | [Lab_09_Subqueries.sql](Lab_09_Subqueries.sql) | Average and maximum subqueries, IN subquery |
| 10 | [Lab_10_Views.sql](Lab_10_Views.sql) | CREATE VIEW, CREATE OR REPLACE VIEW, joined reporting views |

## Steps to execute

1. Install MySQL Server 8.0+ and MySQL Workbench. Connect to your local server.
2. Open **Lab_01_Setup.sql** and execute all statements.
3. Continue **Lab_02_DDL_Constraints.sql** through **Lab_10_Views.sql** in order. Run Lab 3 only once, since it inserts sample records.
4. Inspect the MySQL Workbench output/results to verify each query. Lab 2's EER diagram can be generated through **Database → Reverse Engineer → BankingDB**.
5. If screenshots are needed for assessment, capture your own output from Workbench.

**Important details**

- The supplied lab notes define Customers differently in different places. The scripts reconcile these definitions so the sequence remains internally consistent. The CustomerID primary key is created in Lab 1; don't add it again in Lab 2.
- Lab 3 **deletes TransactionID 302 and AccountID 202**, as the assignment specifically requires; later labs analyze the remaining records.
- Some searches intentionally produce empty results because there are no matches, not because MySQL returns SQL NULL rows.
- Lab 4 transaction categories use example cutoff amounts (High >= 20,000; Medium >= 5,000; otherwise Low) because no thresholds were specified.
- Lab 6 follows the handout's year-1995 Adult/Young rule; it does **not** reflect legal adulthood.
- Lab 7 ranks **loan amount**, not credit risk, because the supplied Loans table has no risk score.
- `ERD.mmd` contains a Mermaid ER diagram representation of the core schema.

**Verification status:** Files were prepared and uploaded to GitHub. They were reviewed for consistent columns, insert order, and foreign-key dependencies; no live MySQL server was available for execution, so SQL runtime validation, screenshots, and Workbench EER generation have **not** been performed.
