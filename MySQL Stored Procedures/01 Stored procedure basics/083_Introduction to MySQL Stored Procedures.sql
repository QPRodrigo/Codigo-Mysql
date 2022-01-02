/* Introducción a los procedimientos almacenados */

-- La siguiente SELECT declaración devuelve todas las filas de la tabla customersde la base de datos de muestra :

SELECT 
    customerName, 
    city, 
    state, 
    postalCode, 
    country
FROM
    customers
ORDER BY customerName;

-- Cuando usa MySQL Workbench o mysql shell para enviar la consulta a MySQL Server, MySQL procesa la consulta y devuelve el conjunto de resultados.

-- Si desea guardar esta consulta en el servidor de la base de datos para ejecutarla más tarde, una forma de hacerlo es utilizar un procedimiento almacenado.

-- La siguiente CREATE PROCEDUREdeclaración crea un nuevo procedimiento almacenado que envuelve la consulta anterior:

DELIMITER $$

CREATE PROCEDURE GetCustomers()
BEGIN
	SELECT 
		customerName, 
		city, 
		state, 
		postalCode, 
		country
	FROM
		customers
	ORDER BY customerName;    
END$$
DELIMITER ;

-- Por definición, un procedimiento almacenado es un segmento de declaraciones SQL declarativas almacenadas dentro del servidor MySQL. En este ejemplo, acabamos de crear un procedimiento almacenado con el nombre GetCustomers().

-- Una vez que guarde el procedimiento almacenado, puede invocarlo usando la CALLdeclaración:

CALL GetCustomers();

-- La primera vez que invoca un procedimiento almacenado, MySQL busca el nombre en el catálogo de la base de datos, compila el código del procedimiento almacenado, lo coloca en un área de memoria conocida como caché y ejecuta el procedimiento almacenado.

-- Si invoca el mismo procedimiento almacenado en la misma sesión nuevamente, MySQL simplemente ejecuta el procedimiento almacenado desde la caché sin tener que volver a compilarlo.

-- Un procedimiento almacenado puede tener parámetros para que pueda pasarle valores y recuperar el resultado. Por ejemplo, puede tener un procedimiento almacenado que devuelva clientes por país y ciudad. En este caso, el país y la ciudad son parámetros del procedimiento almacenado.

-- Un procedimiento almacenado puede contener instrucciones de flujo de control como IF, CASEy LOOPque le permiten implementar el código de forma procedimental.

-- Un procedimiento almacenado puede llamar a otros procedimientos almacenados o funciones almacenadas , lo que le permite modular su código.