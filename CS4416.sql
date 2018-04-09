CREATE TABLE IF NOT EXISTS Customers (
	CustomerID CHAR(5) NOT NULL,
	CustomerName VARCHAR(32),
	DOB DATE,
	Zip VARCHAR(8) default NULL,
	Email VARCHAR(128) default NULL,
	PRIMARY KEY(CustomerID),
	UNIQUE KEY Email (Email)
);


CREATE TABLE IF NOT EXISTS Suppliers (
	SupplierID CHAR(5),
	SupplierName VARCHAR(32),
	Zip VARCHAR(8) ,
	PRIMARY KEY(SupplierID)
);

CREATE TABLE IF NOT EXISTS Products (
	ProductID CHAR(5),
	ProductType VARCHAR(32),
	SupplierID CHAR(5),
	Price FLOAT,
	PRIMARY KEY(ProductID),
	FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE IF NOT EXISTS Sales (
	SalesID CHAR(5),
	CustomerID CHAR(5),
	ProductID CHAR(5),
	Quantity INT default 1,
	Date date,
	PRIMARY KEY(SalesID, CustomerID, ProductID, date),
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE IF NOT EXISTS Addresses (
	Zip VARCHAR(8),
	Street VARCHAR(128) default null,
	City VARCHAR(32) default null,
	County VARCHAR(16) default null,
	PRIMARY KEY(Zip)
);

INSERT INTO Customers (CustomerID, CustomerName, DOB, Zip, Email) VALUES
('C1567', 'John McCarthy', '1985/09/25', 'P25 D55', 'jmc@ul.ie'),
('C5267', 'Eoin O''Brien', '1988/06/13', 'L54 D90', 'eoc@ul.ie'),
('C9563', 'John Canty', '1983/12/25', 'L12 Z48', 'jc@ul.ie'),
('C6667', 'Anthony Flavin', '1988/06/13', '1D3 D5D', 'af@ul.ie'),
('C9582', 'Jamie O''Brien', '1983/02/09', 'P2P D5X', 'job@ul.ie');

INSERT INTO Products (ProductID, ProductType, SupplierID, Price) VALUES
('P5555', 'Laptop', 'S6329', 649.99),
('P7566', 'PC', 'S6329', 999.99),
('P9955', 'PC', 'S4189', 1499.99),
('P5549', 'Laptop', 'S6177', 549.99),
('P1255', 'Laptop', 'S6329', 599.99),
('P5525', 'PC', 'S6177', 549.99),
('P2255', 'Laptop', 'S1329', 600),
('P5545', 'Laptop', 'S6178', 349.99),
('P3255', 'Laptop', 'S9329', 750);


INSERT INTO Suppliers (SupplierID, SupplierName, Zip) VALUES
('S6329', 'MSI', 'P19 H56'),
('S4189', 'Toshiba', 'MM0 12H'),
('S6177', 'Acer', '153923'),
('S1329', 'HP', 'Z45 59G'),
('S6178', 'IBM', '1H9 HFH'),
('S9329', 'Apple', '012849');

INSERT INTO Sales (SalesID, CustomerID, ProductID, Quantity, Date) VALUES
('SA901', 'C5267', 'P5555', 1, '2017/06/05'),
('SA902', 'C1567', 'P5555', 1, '2017/07/05'),
('SA903', 'C5267', 'P2255', 1, '2017/08/08'),
('SA909', 'C9582', 'P5555', 2, '2017/06/08'),
('SA805', 'C5267', 'P2255', 1, '2017/06/05'),
('SA810', 'C5267', 'P5545', 1, '2017/06/05');


INSERT INTO Addresses (Zip, Street, City, County) VALUES
('P19 H56','42 The Rise', 'Cork', 'Cork'),
('MM0 12H',NULL, NULL, NULL),
('153923',NULL, NULL, NULL),
('1H9 HFH','6 Crowley Terrace', NULL, 'Limerick'),
('012849','128 O''Connell Street', 'Dublin', 'Dublin');