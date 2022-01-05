/* CREATE PROCEDURE */

-- Esta consulta devuelve todos los productos de la products
SELECT * FROM products;

-- La siguiente declaración crea un nuevo procedimiento almacenado que envuelve la consulta:
DELIMITER //

CREATE PROCEDURE GetAllProducts()
BEGIN
	SELECT *  FROM products;
END //

DELIMITER ;


### Ejecutando un procedimiento almacenado
-- Para ejecutar un procedimiento almacenado, usa la CALLinstrucción:
CALL stored_procedure_name(argument_list);

-- En esta sintaxis, especifica el nombre del procedimiento almacenado después de la CALLpalabra clave. Si el procedimiento almacenado tiene parámetros, debe pasar argumentos entre paréntesis después del nombre del procedimiento almacenado.

-- Este ejemplo ilustra cómo llamar al GetAllProducts()procedimiento almacenado:

CALL GetAllProducts();

