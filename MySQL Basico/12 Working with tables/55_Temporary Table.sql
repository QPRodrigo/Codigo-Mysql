/* Temporary Table */

-- Una tabla temporal es un tipo especial de tabla que le permite almacenar un conjunto de resultados temporal, que puede reutilizar varias veces en una sola sesión.

/*

CREATE TEMPORARY TABLE table_name(
   column_1_definition,
   column_2_definition,
   ...,
   table_constraints
);

*/

### CREATE TEMPORARY TABLE Declaración de MySQL

-- Para crear una tabla temporal cuya estructura se basa en una tabla existente, no puede utilizar la CREATE TEMPORARY TABLE ... LIKEdeclaración. En su lugar, usa la siguiente sintaxis:


CREATE TEMPORARY TABLE temp_table_name
SELECT * FROM original_table
LIMIT 0;



### Creación de un ejemplo de tabla temporal

-- Primero, cree una nueva tabla temporal llamada creditsque almacena los créditos de los clientes:
CREATE TEMPORARY TABLE credits(
    customerNumber INT PRIMARY KEY,
    creditLimit DEC(10,2)
);

-- Luego, inserte filas de la customerstabla en la tabla temporal credits:
INSERT INTO credits(customerNumber,creditLimit)
SELECT customerNumber, creditLimit
FROM customers
WHERE creditLimit > 0;

###  Creando una tabla temporal cuya estructura basada en un ejemplo de consulta

-- El siguiente ejemplo crea una tabla temporal que almacena los 10 principales clientes por ingresos. La estructura de la tabla temporal se deriva de una SELECT declaración:
CREATE TEMPORARY TABLE top_customers
SELECT p.customerNumber, 
       c.customerName, 
       ROUND(SUM(p.amount),2) sales
FROM payments p
INNER JOIN customers c ON c.customerNumber = p.customerNumber
GROUP BY p.customerNumber
ORDER BY sales DESC
LIMIT 10;

-- Ahora, puede consultar datos de la top_customerstabla temporal como consultar desde una tabla permanente:
SELECT 
    customerNumber, 
    customerName, 
    sales
FROM
    top_customers
ORDER BY sales;

### Eliminar una tabla temporal de MySQL
/*
DROP TEMPORARY TABLE table_name;
*/

DROP TEMPORARY TABLE top_customers;

### Comprobando si existe una tabla temporal
DELIMITER //
CREATE PROCEDURE check_table_exists(table_name VARCHAR(100)) 
BEGIN
    DECLARE CONTINUE HANDLER FOR SQLSTATE '42S02' SET @err = 1;
    SET @err = 0;
    SET @table_name = table_name;
    SET @sql_query = CONCAT('SELECT 1 FROM ',@table_name);
    PREPARE stmt1 FROM @sql_query;
    IF (@err = 1) THEN
        SET @table_exists = 0;
    ELSE
        SET @table_exists = 1;
        DEALLOCATE PREPARE stmt1;
    END IF;
END //
DELIMITER ;

CALL check_table_exists('credits');
SELECT @table_exists;
