/* DROP FUNCTION */

-- La instrucción elimina una función almacenada. Aquí está la sintaxis de la instrucción:DROP FUNCTIONDROP FUNCTION

/*
DROP FUNCTION [IF EXISTS] function_name;
*/

### Ejemplo de MySQL DROP FUNCTION

-- Primero, cree una nueva función llamada que calcule el número de días entre la fecha de pedido y la fecha requerida:OrderLeadTime
DELIMITER $$

CREATE FUNCTION OrderLeadTime (
    orderDate DATE,
    requiredDate DATE
) 
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN requiredDate - orderDate;
END$$

DELIMITER ;

-- En segundo lugar, use la instrucción para eliminar la función:DROP FUNCTIONOrderLeadTime
DROP FUNCTION OrderLeadTime;

-- En tercer lugar, use el para eliminar una función no existente:DROP FUNCTION
DROP FUNCTION IF EXISTS NonExistingFunction;

/*
0 row(s) affected, 1 warning(s): 1305 FUNCTION classicmodels.NonExistingFunction does not exist
*/

-- Si desea ver la advertencia en detalle, utilice la instrucción:SHOW WARNINGS
SHOW WARNINGS;