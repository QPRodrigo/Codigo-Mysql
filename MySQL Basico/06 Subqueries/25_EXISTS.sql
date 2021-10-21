/* EXISTS */

-- Es un operador booleano que devuelve verdadero o falso


/*

SELECT 
    select_list
FROM
    a_table
WHERE
    [NOT] EXISTS(subquery);

*/

-- Para encontrar al cliente que tiene al menos un pedido:
SELECT 
    customerNumber, 
    customerName
FROM
    customers
WHERE
    EXISTS(
	SELECT 
            1
        FROM
            orders
        WHERE
            orders.customernumber 
		= customers.customernumber);

-- Operador para buscar clientes que no tienen ningún pedido
SELECT 
    customerNumber, 
    customerName
FROM
    customers
WHERE
    NOT EXISTS( 
	SELECT 
            1
        FROM
            orders
        WHERE
            orders.customernumber = customers.customernumber
	);

-- La siguiente declaración encuentra empleados que trabajan en la oficina en San Franciso
SELECT 
    employeenumber, 
    firstname, 
    lastname, 
    extension
FROM
    employees
WHERE
    EXISTS( 
        SELECT 
            1
        FROM
            offices
        WHERE
            city = 'San Francisco' AND 
           offices.officeCode = employees.officeCode);

-- Este ejemplo agrega el número 1 a la extensión de teléfono de los empleados que trabajan en la oficina de San Francisco
UPDATE employees 
SET 
    extension = CONCAT(extension, '1')
WHERE
    EXISTS( 
        SELECT 
            1
        FROM
            offices
        WHERE
            city = 'San Francisco'
                AND offices.officeCode = employees.officeCode);

### INSERT EXISTS Ejemplo de MySQL

-- Primero, cree una nueva tabla para archivar los clientes copiando la estructura de la customerstabla:

CREATE TABLE customers_archive 
LIKE customers;

-- En segundo lugar, inserte los clientes que no tienen ningún pedido de venta en la customers_archivetabla utilizando la siguiente INSERT declaración
INSERT INTO customers_archive
SELECT * 
FROM customers
WHERE NOT EXISTS( 
   SELECT 1
   FROM
       orders
   WHERE
       orders.customernumber = customers.customernumber
);

-- En tercer lugar,  consulte los datos de la customers_archivetabla para verificar la operación de inserción
SELECT * FROM customers_archive;

### DELETE EXISTS Ejemplo de MySQL
-- Una última tarea al archivar los datos del cliente es eliminar los clientes que existen en la customers_archivetabla de la customerstabla.

-- Para hacer esto, usa el EXISTSoperador en la WHEREcláusula de la DELETE declaración de la siguiente manera:
DELETE FROM customers
WHERE EXISTS( 
    SELECT 
        1
    FROM
        customers_archive a
    
    WHERE
        a.customernumber = customers.customerNumber);
        
#### MySQL EXISTS vs operador INoperador
-- Para encontrar al cliente que ha realizado al menos un pedido, puede utilizar el IN operador como se muestra en la siguiente consulta
SELECT 
    customerNumber, 
    customerName
FROM
    customers
WHERE
    customerNumber IN (
        SELECT 
            customerNumber
        FROM
            orders);

-- Comparemos la consulta que usa el INoperador con la que usa el EXISTS operador usando la EXPLAIN declaración
EXPLAIN SELECT 
    customerNumber, 
    customerName
FROM
    customers
WHERE
    EXISTS( 
        SELECT 
            1
        FROM
            orders
        WHERE
            orders.customernumber = customers.customernumber);

-- Ahora, verifique el rendimiento de la consulta que usa el IN operador.
SELECT 
    customerNumber, customerName
FROM
    customers
WHERE
    customerNumber IN (SELECT 
            customerNumber
        FROM
            orders);
            
-- la siguiente declaración utiliza el IN operador selecciona a todos los empleados que trabajan en la oficina de San Francisco
SELECT 
    employeenumber, 
    firstname, 
    lastname
FROM
    employees
WHERE
    officeCode IN (SELECT 
            officeCode
        FROM
            offices
        WHERE
            offices.city = 'San Francisco');

