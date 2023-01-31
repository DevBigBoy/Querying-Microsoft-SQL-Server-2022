-- ==================================
--   Introduction to T-SQL Queries
-- ==================================

/*
	Return Records with SELECT and FROM
*/

-- Display Specific columns
-- it doesn't have to be in the same order that they appear in the table
SELECT Name, GroupName
FROM HumanResources.Department

SELECT GroupName, Name
FROM HumanResources.Department

-- Display all columns
SELECT *
FROM HumanResources.Department;

/*
	Filter Records With WHERE
*/

SELECT *
FROM HumanResources.Department 
WHERE GroupName = 'Research and Development'


SELECT *
FROM HumanResources.Department 
WHERE GroupName <> 'Research and Development'

SELECT *
FROM HumanResources.Department 
WHERE GroupName <> 'Research and Development'
	AND DepartmentID < 10

SELECT *
FROM HumanResources.Department 
WHERE GroupName = 'Research and Development'
	OR GroupName = 'Quality Assurance'

-- I can simplify this query by using the IN Function
SELECT *
FROM HumanResources.Department 
WHERE GroupName 
	IN( 'Research and Development','Quality Assurance')

/*
	Sort Records with ORDER BY
*/

-- Note : Select From WHERE ORDER By

SELECT *
FROM HumanResources.Department 
ORDER BY GroupName

-- We can reverse this by adding DESC Keyword
SELECT *
FROM HumanResources.Department 
ORDER BY GroupName DESC

-- Sort Multiple Columns
SELECT *
FROM HumanResources.Department 
ORDER BY GroupName DESC, DepartmentID

/*
	Columns Aliases With AS 
*/

SELECT Name AS 'Department Name',
	GroupName AS 'Management Group'
FROM HumanResources.Department 

/*
	Create values With Constant and Math
*/

SELECT Name,
	ProductNumber,
	'AdventureWorks' AS Manufacturer,
	ListPrice,
	ListPrice * 0.85 AS SalePrice
FROM Production.Product
WHERE ListPrice > 0

/*
	Challenge: Write A SELECT query
=======================================
- Use Production.WorkOrder table in AdentureWorks
- This table stores information about the production of 
the items that AdventureWorks manufacturers
- Locate all December 2013 work order that have a scrapped
quantity above zero units
- Then Sort the results so the work orders with the 
highest amount of scrapped units appear at the top
*/
SELECT WorkOrderID AS 'Work Order ID',
	ScrappedQty AS 'Scrapped Quantity',
	StartDate AS 'Start Date',
	EndDate AS 'End Date'
FROM Production.WorkOrder
WHERE ScrappedQty > 0
	AND StartDate >= '2013-12-01'
	AND EndDate <= '2013-12-31'
ORDER BY ScrappedQty DESC






