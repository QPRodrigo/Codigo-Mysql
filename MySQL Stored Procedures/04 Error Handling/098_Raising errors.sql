/* Raising Error Conditions with MySQL SIGNAL / RESIGNAL Statements */

### MySQL SIGNAL statement

/*
SIGNAL SQLSTATE | condition_name;
SET condition_information_item_name_1 = value_1,
    condition_information_item_name_1 = value_2, etc;
*/

-- El siguiente procedimiento almacenado agrega un elemento de línea de pedido a un pedido de cliente existente. Emite un mensaje de error si el número de pedido no existe.
DELIMITER $$

CREATE PROCEDURE AddOrderItem(
		         in orderNo int,
			 in productCode varchar(45),
			 in qty int, 
                         in price double, 
                         in lineNo int )
BEGIN
	DECLARE C INT;

	SELECT COUNT(orderNumber) INTO C
	FROM orders 
	WHERE orderNumber = orderNo;

	-- check if orderNumber exists
	IF(C != 1) THEN 
		SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Order No not found in orders table';
	END IF;
	-- more code below
	-- ...
END

-- Si llamamos al procedimiento almacenado y pasamos un número de pedido inexistente, recibiremos un mensaje de error.AddOrderItem()
CALL AddOrderItem(10,'S10_1678',1,95.7,1);

### Declaración resignal de MySQL

-- El siguiente procedimiento almacenado cambia el mensaje de error antes de emitirlo al autor de la llamada.
DELIMITER $$

CREATE PROCEDURE Divide(IN numerator INT, IN denominator INT, OUT result double)
BEGIN
	DECLARE division_by_zero CONDITION FOR SQLSTATE '22012';

	DECLARE CONTINUE HANDLER FOR division_by_zero 
	RESIGNAL SET MESSAGE_TEXT = 'Division by zero / Denominator cannot be zero';
	-- 
	IF denominator = 0 THEN
		SIGNAL division_by_zero;
	ELSE
		SET result := numerator / denominator;
	END IF;
END

-- Llamemos al procedimiento almacenado.Divide()

CALL Divide(10,0,@result);