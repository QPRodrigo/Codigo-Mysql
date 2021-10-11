/* ALIAS */

-- ALIAS: Para mejorar la legibilidad de las consultas.

/*
SELECT 
   [column_1 | expression] AS descriptive_name
FROM table_name;
*/

/*
SELECT 
   [column_1 | expression] AS `descriptive name`
FROM 
   table_name;
*/

-- La siguiente consulta selecciona los nombres y apellidos de los empleados. Utiliza la CONCAT_WS()función para concatenar el nombre y el apellido en el nombre completo
SELECT 
    CONCAT_WS(', ', lastName, firstname)
FROM
    employees;

-- El encabezado de la columna es bastante difícil de leer. Para resolver esto, puede asignar al encabezado de columna de la salida un alias de columna como se muestra en la siguiente consulta
SELECT
   CONCAT_WS(', ', lastName, firstname) AS `Full name`
FROM
   employees;

-- La siguiente consulta usa el alias de columna en la ORDER BYcláusula para ordenar alfabéticamente los nombres completos de los empleados:
SELECT
	CONCAT_WS(', ', lastName, firstname) `Full name`
FROM
	employees
ORDER BY
	`Full name`;

-- La siguiente declaración selecciona los pedidos cuyo monto total es superior a 60000. Utiliza alias de columna en las cláusulas GROUP BY y HAVING.
SELECT
	orderNumber `Order no.`,
	SUM(priceEach * quantityOrdered) total
FROM
	orderDetails
GROUP BY
	`Order no.`
HAVING
	total > 60000;

-- Esta consulta muestra cómo asignar el employeesalias de la tabla como e:
SELECT 
    e.firstName, 
    e.lastName
FROM
    employees e
ORDER BY e.firstName;