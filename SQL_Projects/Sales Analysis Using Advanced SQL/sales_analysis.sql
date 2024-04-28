
-- YTD Sales with Over: 


SELECT BusinessEntityID, 
[Total YTD Sales] = SUM(SalesYTD) OVER(), 
[Max YTD Sales] = MAX(SalesYTD) OVER(), 
[% of BEst Performer] = SalesYTD/MAX(SalesYTD) OVER() 

SELECT TOP(20) * FROM 
AdventureWorks2019.Sales.SalesTerritoryHistory 


SELECT TOP(20) * FROM 
AdventureWorks2019.Sales.SalesTerritory


SELECT TOP(20) * FROM 
AdventureWorks2019.Sales.SalesOrderDetail


SELECT TOP(20) * FROM 
AdventureWorks2019.Sales.SalesOrderHeader


SELECT TOP(20) * FROM 
AdventureWorks2019.Sales.Customer

SELECT Top(20) * FROM 
AdventureWorks2019.Production.Product


SELECT TOP(200) * FROM 
AdventureWorks2019.Sales.Store 






SELECT t.Name, t.CountryRegionCode, COUNT(odh.SalesOrderID) as total_orders
FROM AdventureWorks2019.Sales.SalesTerritory as t
INNER JOIN AdventureWorks2019.Sales.SalesOrderHeader odh
ON t.TerritoryID = odh.TerritoryID 
GROUP BY t.TerritoryID, t.Name, t.CountryRegionCode
ORDER BY total_orders DESC


SELECT
       A.SalesOrderID
      ,A.OrderDate
      ,A.TotalDue 

FROM AdventureWorks2019.Sales.SalesOrderHeader A

WHERE EXISTS (
	SELECT
	1
	FROM AdventureWorks2019.Sales.SalesOrderDetail B
	WHERE A.SalesOrderID = B.SalesOrderID
		AND B.LineTotal > 5000
)

ORDER BY  A.SalesOrderID


SELECT
       SalesOrderID
      ,OrderDate
      ,CustomerID
	  ,PrevTotalDue = LAG(TotalDue, 1) OVER(PARTITION BY CustomerID ORDER BY SalesOrderID)
	  ,TotalDue

FROM AdventureWorks2019.Sales.SalesOrderHeader

ORDER BY CustomerID, SalesOrderID


/* List the users who have ordered within 7 days of previous order*/ 

WITH frequent_buyers AS (
 SELECT CustomerID, OrderDate, 
 lead(OrderDate, 1) OVER(PARTITION BY CustomerID ORDER BY OrderDate) as next_order_date
 FROM AdventureWorks2019.Sales.SalesOrderHeader
 ) 
 SELECT DISTINCT CustomerID FROM frequent_buyers 
 WHERE datediff(d, OrderDate, next_order_date) <=7




SELECT TOP(5)
      BusinessEntityID, 
      SalesYTD,
	  SalesLastYear, 
      [% of Best Performer] = SalesYTD/MAX(SalesYTD) OVER()

FROM AdventureWorks2019.Sales.SalesPerson 
ORDER BY '% of Best Performer' DESC 

SELECT TOP(5)
      BusinessEntityID, 
      SalesYTD,
	  SalesLastYear, 
      [% of Best Performer] = SalesYTD/MAX(SalesYTD) OVER()

FROM AdventureWorks2019.Sales.SalesPerson 
ORDER BY '% of Best Performer' 


SELECT
	ProductID,
	SalesOrderID,
	SalesOrderDetailID,
	OrderQty,
	UnitPrice,
	UnitPriceDiscount,
	LineTotal,
	ProductIDLineTotal = SUM(LineTotal) OVER(PARTITION BY ProductID)

FROM AdventureWorks2019.Sales.SalesOrderDetail

ORDER BY ProductID, OrderQty DESC


SELECT TOP (10) * FROM 
[AdventureWorks2019].[Sales].[SalesOrderDetail] 

/* Order count greater than 3 */ 
SELECT 
       SalesOrderID
      ,OrderDate
      ,TotalDue
	  ,MultiOrderCount = --correlated subquery
	  (
		  SELECT
		  COUNT(*)
		  FROM AdventureWorks2019.Sales.SalesOrderDetail B
		  WHERE A.SalesOrderID = B.SalesOrderID
		  AND B.OrderQty > 1
	  )

  FROM AdventureWorks2019.Sales.SalesOrderHeader A 


  

SELECT TerritoryID, Region, Code, 
CONVERT(DECIMAL(10,2), [Accessories]) as Accessories,
CONVERT(DECIMAL(10,2), [Bikes]) as Bikes,
CONVERT(DECIMAL(10,2), [Clothing]) as Clothing,
CONVERT(DECIMAL(10,2), [Components]) as Components 
FROM
( 
SELECT
	   DISTINCT ProductCategoryName = D.Name, E.TerritoryID as TerritoryID,
	   F.Name as Region, F.CountryRegionCode as Code, 
	   SUM(A.LineTotal) OVER(PARTITION BY D.Name, E.TerritoryID) as LineTotals

FROM AdventureWorks2019.Sales.SalesOrderDetail A
	JOIN AdventureWorks2019.Production.Product B
		ON A.ProductID = B.ProductID
	JOIN AdventureWorks2019.Production.ProductSubcategory C
		ON B.ProductSubcategoryID = C.ProductSubcategoryID
	JOIN AdventureWorks2019.Production.ProductCategory D
		ON C.ProductCategoryID = D.ProductCategoryID
	JOIN AdventureWorks2019.Sales.SalesOrderHeader E
		ON A.SalesOrderID = E.SalesOrderID
	JOIN AdventureWorks2019.Sales.SalesTerritory F 
		ON E.TerritoryID = F.TerritoryID 

) G

PIVOT(
SUM(LineTotals)
FOR ProductCategoryName IN([Accessories],[Bikes],[Clothing],[Components])
) H 

ORDER BY 1


