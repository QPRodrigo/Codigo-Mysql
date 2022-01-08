/* Variables*/

-- Una variable es un objeto de datos con nombre cuyo valor puede cambiar durante la ejecución del procedimiento almacenado . Normalmente, utiliza variables en procedimientos almacenados para mantener resultados inmediatos. Estas variables son locales del procedimiento almacenado.

### Declaración de variables

-- Para declarar una variable dentro de un procedimiento almacenado, use la DECLARE  declaración de la siguiente manera:
DECLARE variable_name datatype(size) [DEFAULT default_value];

/*
.- Primero, especifique el nombre de la variable después de la DECLAREpalabra clave. El nombre de la variable debe seguir las reglas de denominación de los nombres de columna de la tabla MySQL.
.- En segundo lugar, especifique el tipo de datos y la longitud de la variable. Una variable puede tener cualquier tipo de datos MySQL tales como INT, VARCHAR, y  DATETIME.
.- En tercer lugar, asigne a una variable un valor predeterminado mediante la DEFAULTopción. Si declara una variable sin especificar un valor predeterminado, su valor es NULL.
*/

-- El siguiente ejemplo declara una variable nombrada totalSalecon el tipo de datos DEC(10,2)y el valor predeterminado de la 0.0  siguiente manera:
DECLARE totalSale DEC(10,2) DEFAULT 0.0;

-- MySQL le permite declarar dos o más variables que comparten el mismo tipo de datos usando una sola DECLAREdeclaración. El siguiente ejemplo declara dos variables enteras  xy  y, y establece sus valores predeterminados en cero.
DECLARE x, y INT DEFAULT 0;

### Asignar variables
-- Una vez que se declara una variable, está lista para usar. Para asignar un valor a una variable, usa la SETdeclaración:
SET variable_name = value;

-- Por ejemplo:
DECLARE total INT DEFAULT 0;
SET total = 10;

-- El valor de la totalvariable es 10  posterior a la asignación.

-- Además de la SET declaración, puede utilizar la  SELECT INTOdeclaración para asignar el resultado de una consulta a una variable como se muestra en el siguiente ejemplo:

DECLARE productCount INT DEFAULT 0;

SELECT COUNT(*) 
INTO productCount
FROM products;

### Poniendolo todo junto

-- El siguiente ejemplo ilustra cómo declarar y usar una variable en un procedimiento almacenado:
DELIMITER $$

CREATE PROCEDURE GetTotalOrder()
BEGIN
	DECLARE totalOrder INT DEFAULT 0;
    
    SELECT COUNT(*) 
    INTO totalOrder
    FROM orders;
    
    SELECT totalOrder;
END$$

DELIMITER ;

-- Primero, declare una variable totalOrdercon un valor predeterminado de cero. Esta variable contendrá el número de pedidos de la ordersmesa.
DECLARE totalOrder INT DEFAULT 0;

-- En segundo lugar, use la SELECT INTO  declaración para asignar a la variable totalOrderel número de pedidos seleccionados de la orderstabla:
SELECT COUNT(*) 
INTO totalOrder 
FROM orders;

-- En tercer lugar, seleccione el valor de la variable totalOrder.
SELECT totalOrder;

-- Esta declaración llama al procedimiento almacenado GetTotalOrder():
CALL GetTotalOrder();