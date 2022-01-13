/* Case */

-- Además de la instrucción IF, MySQL proporciona una instrucción condicional alternativa llamada instrucción para construir instrucciones condicionales en procedimientos almacenados. Las declaraciones hacen que el código sea más legible y eficiente.CASECASE

/*
CASE case_value
   WHEN when_value1 THEN statements
   WHEN when_value2 THEN statements
   ...
   [ELSE else-statements]
END CASE;
*/

-- Tambien se puede utilizar un bloque vacío en la cláusula de la siguiente manera:case_valuewhen_valueBEGIN ENDELSE
/*
CASE case_value
    WHEN when_value1 THEN ...
    WHEN when_value2 THEN ...
    ELSE 
        BEGIN
        END;
END CASE;
*/

#### Ejemplo de declaración simpleCASE

-- El siguiente procedimiento almacenado ilustra cómo utilizar la instrucción simple:CASE
DELIMITER $$

CREATE PROCEDURE GetCustomerShipping(
	IN  pCustomerNUmber INT, 
	OUT pShipping       VARCHAR(50)
)
BEGIN
    DECLARE customerCountry VARCHAR(100);

SELECT 
    country
INTO customerCountry FROM
    customers
WHERE
    customerNumber = pCustomerNUmber;

    CASE customerCountry
		WHEN  'USA' THEN
		   SET pShipping = '2-day Shipping';
		WHEN 'Canada' THEN
		   SET pShipping = '3-day Shipping';
		ELSE
		   SET pShipping = '5-day Shipping';
	END CASE;
END$$

DELIMITER ;


-- Esta instrucción llama al procedimiento almacenado y pasa el número de cliente 112:
CALL GetCustomerShipping(112,@shipping);

-- La siguiente declaración devuelve el tiempo de envío del cliente 112:
SELECT @shipping;

#### Declaración buscada CASE

-- Aquí está la sintaxis básica de la instrucción buscada:CASE
CASE
    WHEN search_condition1 THEN statements
    WHEN search_condition1 THEN statements
    ...
    [ELSE else-statements]
END CASE;

-- Similar a la instrucción simple, si no especifica una cláusula y no hay ninguna condición, MySQL genera el mismo error:CASEELSETRUE
Case not found for CASE statement


#### Ejemplo de instrucción buscada CASE
DELIMITER $$

CREATE PROCEDURE GetDeliveryStatus(
	IN pOrderNumber INT,
    OUT pDeliveryStatus VARCHAR(100)
)
BEGIN
	DECLARE waitingDay INT DEFAULT 0;
    SELECT 
		DATEDIFF(requiredDate, shippedDate)
	INTO waitingDay
	FROM orders
    WHERE orderNumber = pOrderNumber;
    
    CASE 
		WHEN waitingDay = 0 THEN 
			SET pDeliveryStatus = 'On Time';
        WHEN waitingDay >= 1 AND waitingDay < 5 THEN
			SET pDeliveryStatus = 'Late';
		WHEN waitingDay >= 5 THEN
			SET pDeliveryStatus = 'Very Late';
		ELSE
			SET pDeliveryStatus = 'No Information';
	END CASE;	
END$$
DELIMITER ;

-- Esta declaración utiliza el procedimiento almacenado para obtener el estado de entrega del pedido:GetDeliveryStatus()10100
CALL GetDeliveryStatus(10100,@delivery);