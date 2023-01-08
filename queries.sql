-- Problem 1 & 2
-- 1. Using JOINs in a single query, combine data from all three tables (employees, products, sales) to view all sales with complete employee and product information in one table.

-- >>> SOLUTION <<<
-- CREATE VIEW all_sales AS
-- SELECT SalesID, SalesPersonID, FirstName, LastName, CustomerID, products.ProductID, Quantity, Name, Price
-- FROM sales INNER JOIN employees ON employees.EmployeeID = sales.SalesPersonID JOIN products ON products.ProductID = sales.ProductID
-- ORDER BY SalesID;
-- -------------------------------------------------------------------------------------------------------------------------------------

-- 2a. Create a View for the query you made in Problem 1 named "all_sales"
-- NOTE: You'll want to remove any duplicate columns to clean up your view!
-- --- DONE ---

-- 2b. Test your View by selecting all rows and columns from the View

-- >>> ONE OF MANY SOLUTIONS <<<
-- SELECT * FROM intermediate_sql.all_sales
-- WHERE EmployeeID = 8
-- -------------------------------------------------------------------------------------------------------------------------------------
-- Problem 3
-- Find the average sale amount for each sales person

-- >>> SOLUTION <<<
-- SELECT SalesPersonID, AVG(Quantity*Price) FROM all_sales
-- GROUP BY SalesPersonID
-- ORDER BY SalesPersonID ASC;

-- >>> BRAINSTORM <<<
-- SELECT SalesPersonID, SUM(Quantity*Price) AS TotalSales FROM all_sales
-- GROUP BY SalesPersonID
-- ORDER BY SalesPersonID ASC
-- LIMIT 3;

-------------------------------------------------------------------------------------------------------------------------------------
-- Problem 4
-- Find the top three sales persons by total sales

-- >>> SOLUTION <<<
-- SELECT DISTINCT SalesPersonID AS SalesPerson, SUM(Quantity*Price) AS TotalSales FROM all_sales
-- GROUP BY SalesPersonID
-- ORDER BY SalesPersonID ASC
-- LIMIT 3

-- >>> BRAINSTORM <<<
-- SELECT CustomerID, COUNT(CustomerID) FROM all_sales
-- GROUP BY CustomerID

-- >>> BRAINSTORM <<<
-- SELECT CustomerID FROM all_sales

-- >>> BRAINSTORM <<<
-- SELECT Price, Name, Quantity FROM all_sales
-- ORDER BY Price ASC
-- -------------------------------------------------------------------------------------------------------------------------------------
-- Problem 5
-- Find the product that has the highest price

-- >>> SOLUTION <<<
-- SELECT Name, Price FROM all_sales
-- ORDER BY Price DESC
-- LIMIT 1

-- -------------------------------------------------------------------------------------------------------------------------------------
-- Problem 6
-- Find the product that was sold the most times

-- >>> SOLUTION <<<
-- SELECT Name, Quantity FROM all_sales
-- ORDER BY Quantity DESC
-- LIMIT 1

-- -------------------------------------------------------------------------------------------------------------------------------------
-- >>>>> HELP <<<<<
-- Problem 7 
-- Using a subquery, find all products that have a price higher than the average price for all products

-- >>> SOLUTION <<<
-- SELECT * FROM products
-- WHERE Price >
-- 	(SELECT AVG(Price) FROM products)
-- ORDER BY Name ASC

-- ------------------------------------------
-- SELECT Name, Price FROM all_sales
-- WHERE Price >
-- 	(SELECT AVG(Price) FROM all_sales)
-- GROUP BY Name
-- ORDER BY Name ASC
-- ------------------------------------------
-- >>> HELPFUL EXAMPLE <<<
-- SELECT *, …
-- FROM mytable
-- WHERE column
--     IN/NOT IN (SELECT another_column
--                FROM another_table);

-- AVG(Price) AS AveragePrice

-- -------------------------------------------------------------------------------------------------------------------------------------
-- Problem 8
-- Find the customer who spent the most money in purchased products

-- >>> SOLUTION <<<
-- SELECT CustomerID AS Customer, SUM(Quantity*Price) AS TotalPurchase FROM all_sales
-- GROUP BY CustomerID
-- ORDER BY CustomerID ASC
-- LIMIT 1

-- >>> HELPFUL EXAMPLE <<<
-- SELECT DISTINCT SalesPersonID AS SalesPerson, SUM(Quantity*Price) AS TotalSales FROM all_sales
-- GROUP BY SalesPersonID
-- ORDER BY SalesPersonID ASC
-- LIMIT 3

-- -------------------------------------------------------------------------------------------------------------------------------------
-- Problem 9
-- Find the total number of sales for each sales person

-- >>> SOLUTION <<<
-- SELECT SalesPersonID AS SalesPerson, SUM(Quantity*Price) AS TotalPurchas FROM all_sales
-- GROUP BY SalesPersonID
-- ORDER BY SalesPersonID ASC;

-- -------------------------------------------------------------------------------------------------------------------------------------
-- Problem 10
-- Find the sales person who sold the most to the customer you found in Problem 8

-- >>> SOLUTION <<<
-- SELECT SalesPersonID AS SalesPerson, SUM(Quantity*Price) AS TotalSales FROM all_sales
-- WHERE CustomerID = 1
-- GROUP BY SalesPersonID
-- ORDER BY SalesPersonID ASC;

-- >>> HELPFUL EXAMPLE FROM #8 <<<
-- SELECT CustomerID AS Customer, SUM(Quantity*Price) AS TotalPurchase FROM all_sales
-- GROUP BY CustomerID
-- ORDER BY CustomerID ASC
-- LIMIT 1
