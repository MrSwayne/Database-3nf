//If all sales for a specific customer have been removed, they themselves are deleted from the Customers table and their address is removed from the addresses table

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
