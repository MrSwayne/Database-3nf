SELECT SalesID, CustomerID, ProductID
FROM Sales
WHERE ProductID
IN (
	SELECT ProductID
	FROM Products
	WHERE SupplierID
	IN (
		SELECT SupplierID
		FROM Suppliers
		WHERE SupplierName = 'MSI'
	)
)

SELECT CustomerName 
FROM Customers
WHERE CustomerID
IN (
	SELECT CustomerID
	FROM Sales
	WHERE ProductID
	IN (
		SELECT ProductID 
		FROM Products
		WHERE SupplierID
		IN (
			SELECT SupplierID
			FROM Suppliers
			WHERE SupplierName = ‘Acer’
		)
	)
)


SELECT ProductType
FROM Products
WHERE ProductID 
IN (
	SELECT ProductID 
	FROM Sales
	WHERE Quantity > 1	
)

CREATE VIEW SuppliersExtended
AS (
	SELECT Suppliers.SupplierName, Products.ProductType 
	FROM Suppliers, Products 
	WHERE Suppliers.SupplierID = Products.SupplierID
)

CREATE INDEX suppInd
on Suppliers(SupplierName)

CREATE INDEX CustInd
ON Customers(CustomerName)