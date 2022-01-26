/* Stored Functions */

/*
A diferencia de un procedimiento almacenado,puede utilizar una función almacenada en instrucciones SQL dondequiera que se utilice una expresión. Esto ayuda a mejorar la legibilidad y el mantenimiento del código de procedimiento.
*/

### Sintaxis de MySQL CREATE FUNCTION
/*
DELIMITER $$

CREATE FUNCTION function_name(
    param1,
    param2,…
)
RETURNS datatype
[NOT] DETERMINISTIC
BEGIN
 -- statements
END $$

DELIMITER ;
*/

### Ejemplo de MySQLCREATE FUNCTION
-- La siguiente instrucción crea una función que devuelve el nivel de cliente basado en el crédito:CREATE FUNCTION
DELIMITER $$

CREATE FUNCTION CustomerLevel(
	credit DECIMAL(10,2)
) 
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE customerLevel VARCHAR(20);

    IF credit > 50000 THEN
		SET customerLevel = 'PLATINUM';
    ELSEIF (credit >= 50000 AND 
			credit <= 10000) THEN
        SET customerLevel = 'GOLD';
    ELSEIF credit < 10000 THEN
        SET customerLevel = 'SILVER';
    END IF;
	-- return the customer level
	RETURN (customerLevel);
END$$
DELIMITER ;

-- O bien, puede ver todas las funciones almacenadas en la base de datos actual mediante la siguiente opción:classicmodelsSHOW FUNCTION STATUS
SHOW FUNCTION STATUS 
WHERE db = 'classicmodels';

#### Llamar a una función almacenada en una instrucción SQL

-- La siguiente instrucción utiliza la función almacenada:CustomerLevel

SELECT 
    customerName, 
    CustomerLevel(creditLimit)
FROM
    customers
ORDER BY 
    customerName;


### Llamar a una función almacenada en un procedimiento almacenado

-- La siguiente instrucción crea un nuevo procedimiento almacenado que llama a la función almacenada:CustomerLevel()
DELIMITER $$

CREATE PROCEDURE GetCustomerLevel(
    IN  customerNo INT,  
    OUT customerLevel VARCHAR(20)
)
BEGIN

	DECLARE credit DEC(10,2) DEFAULT 0;
    
    -- get credit limit of a customer
    SELECT 
		creditLimit 
	INTO credit
    FROM customers
    WHERE 
		customerNumber = customerNo;
    
    -- call the function 
    SET customerLevel = CustomerLevel(credit);
END$$

DELIMITER ;

-- A continuación se muestra cómo llamar al procedimiento almacenado:GetCustomerLevel()
CALL GetCustomerLevel(-131,@customerLevel);
SELECT @customerLevel;
