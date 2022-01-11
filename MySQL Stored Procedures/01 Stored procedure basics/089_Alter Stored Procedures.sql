/* Alter Stored Procedures */

### Alterar un procedimiento almacenado usando MySQL Workbench

-- Primero, cree un procedimiento almacenado que devuelva el monto total de todas las órdenes de venta:
DELIMITER $$

CREATE PROCEDURE GetOrderAmount()
BEGIN
    SELECT 
        SUM(quantityOrdered * priceEach) 
    FROM orderDetails;
END$$

DELIMITER ;

