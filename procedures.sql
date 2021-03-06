//You can add a product by supplier name, and then it will manually search for its corresponding id

delimiter//
CREATE PROCEDURE addProductBySupplierName(
				IN a CHAR(5),
				IN b VARCHAR(32),
				IN C VARCHAR(32),
				IN D FLOAT
	
)
	MODIFIES SQL DATA
	BEGIN

	SET @SupplierID = (SELECT DISTINCT SupplierID
		   	  FROM Suppliers
		     	WHERE SupplierName = C)

	IF(@SupplierID IS NULL) THEN
		SET @SupplierID = 'S0000'
	END IF;

	INSERT INTO Products(ProductID, ProductType, SupplierID, Float) VALUES(A, B,@SupplierID, D);

END//
	
	
//You can add a sale by customer name instead of id

delimiter//
CREATE PROCEDURE addSaleByNames(
		IN a CHAR(5),
		IN b VARCHAR(32),
		IN c CHAR(5),
		IN d INT,
		IN e DATE
)

	MODIFIES SQL DATA
	BEGIN
	
	SET @CustomerID = (SELECT DISTINCT CustomerID
			   FROM Customers
			   WHERE CustomerName = b)
	
	IF(@CustomerID IS NULL) THEN
		SET @CustomerID = 'C0000'
	END IF;
	
	INSERT INTO Sales(a, @CustomerID, c, d, e)
	
END//

delimiter//
CREATE FUNCTION CustomerExists(
	c VARCHAR(32)
)
	RETURNS BOOLEAN

	IF c IN (SELECT CustomerName FROM Customers) THEN 
		RETURN TRUE;
	ELSE						
		RETURN FALSE;
	END IF;
END//
