/*IF statement */

-- Tenga en cuenta que MySQL tiene una función IF() que es diferente de la instrucción descrita en este tutorial.IF

-- La declaración tiene tres formas: declaración simple, declaración y declaración.IFIF-THENIF-THEN-ELSEIF-THEN-ELSEIF- ELSE

## Instrucción simple de MySQLIF-THEN

-- La instrucción le permite ejecutar un conjunto de instrucciones SQL basadas en una condición especificada. 
IF condition THEN 
   statements;
END IF;

-- Consulte el siguiente procedimiento almacenado.GetCustomerLevel()
DELIMITER $$

CREATE PROCEDURE GetCustomerLevel(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL(10,2) DEFAULT 0;

    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    END IF;
END$$

DELIMITER ;

-- Esta declaración encuentra todos los clientes que tienen un límite de crédito mayor que:50,000
SELECT 
    customerNumber, 
    creditLimit
FROM 
    customers
WHERE 
    creditLimit > 50000
ORDER BY 
    creditLimit DESC;

-- Estas instrucciones llaman al procedimiento almacenado para el cliente 141 y muestran el valor del parámetro:GetCustomerLevel()OUTpCustomerLevel
CALL GetCustomerLevel(141, @level);
SELECT @level;

## Instrucción MySQLIF-THEN-ELSE
-- En caso de que desee ejecutar otras instrucciones cuando el en la rama no evalúa a , puede utilizar la instrucción de la siguiente manera:conditionIFTRUEIF-THEN-ELSE
IF condition THEN
   statements;
ELSE
   else-statements;
END IF;

-- Primero, elimine el procedimiento almacenado:GetCustomerLevel()
DROP PROCEDURE GetCustomerLevel;

-- A continuación, cree el procedimiento almacenado con el nuevo código:GetCustomerLevel()
DELIMITER $$

CREATE PROCEDURE GetCustomerLevel(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL DEFAULT 0;

    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    ELSE
        SET pCustomerLevel = 'NOT PLATINUM';
    END IF;
END$$

DELIMITER ;

-- Esta consulta encuentra clientes que tienen un límite de crédito menor o igual:50,000
SELECT 
    customerNumber, 
    creditLimit
FROM 
    customers
WHERE 
    creditLimit <= 50000
ORDER BY 
    creditLimit DESC;

-- Las siguientes instrucciones llaman al procedimiento almacenado para el número de cliente y muestran el valor del parámetro:447OUTpCustomerLevel
CALL GetCustomerLevel(447, @level);
SELECT @level;


### Instrucción MySQLIF-THEN-ELSEIF-ELSE

-- Si desea ejecutar instrucciones condicionalmente en función de varias condiciones, utilice la siguiente instrucción:IF-THEN-ELSEIF-ELSE
/*
IF condition THEN
   statements;
ELSEIF elseif-condition THEN
   elseif-statements;
...
ELSE
   else-statements;
END IF;
*/

-- Primero, elimine el procedimiento almacenado:GetCustomerLevel()
DROP PROCEDURE GetCustomerLevel;

-- A continuación, cree el nuevo procedimiento almacenado que utiliza la instrucción.
DELIMITER $$

CREATE PROCEDURE GetCustomerLevel(
    IN  pCustomerNumber INT, 
    OUT pCustomerLevel  VARCHAR(20))
BEGIN
    DECLARE credit DECIMAL DEFAULT 0;

    SELECT creditLimit 
    INTO credit
    FROM customers
    WHERE customerNumber = pCustomerNumber;

    IF credit > 50000 THEN
        SET pCustomerLevel = 'PLATINUM';
    ELSEIF credit <= 50000 AND credit > 10000 THEN
        SET pCustomerLevel = 'GOLD';
    ELSE
        SET pCustomerLevel = 'SILVER';
    END IF;
END $$

DELIMITER ;

-- Estas declaraciones llaman al procedimiento almacenado y muestran el nivel del cliente:GetCustomerLevel()447
CALL GetCustomerLevel(447, @level); 
SELECT @level;