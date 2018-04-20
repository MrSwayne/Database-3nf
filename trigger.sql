//If all sales for a specific customer have been removed, they themselves are deleted from the Customers table and their address is removed from the addresses table

delimiter //
CREATE TRIGGER DeleteCustomer
AFTER DELETE ON Sales
FOR EACH ROW BEGIN
	if(OLD.CustomerID NOT IN (SELECT CustomerID From Sales)) THEN
		DELETE FROM Addresses 
		WHERE ZIP 
		IN (
			SELECT ZIP 
			FROM Customers 
			WHERE CustomerID = OLD.CustomerID
		)
		
		DELETE FROM Customers WHERE CustomerID = OLD.CustomerID;
	END IF;
END;
//


//If a price is added and it's 1000, set it to 999.99, also if a price is less than 1 euro then set it to 100
delimiter //
CREATE TRIGGER ChangePrice
BEFORE UPDATE ON Products
FOR EACH ROW BEGIN
  IF (NEW.Price = 1000) THEN 
    SET NEW.Price = 999.99;
  END IF;
  IF(NEW.Price < 1) THEN
    SET NEW.Price = 99.99;
  END IF;
END;
//
