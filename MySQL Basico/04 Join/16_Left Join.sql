/*  LEFT JOIN */

-- Cláusula MySQL y cómo aplicarla para consultar datos de dos o más tablas.

/*
SELECT 
    select_list
FROM
    t1
LEFT JOIN t2 ON 
    join_condition;
*/

-- Consulte las siguientes tablas customersy ordersen la base de datos de muestra.
-- Esta consulta utiliza la LEFT JOINcláusula para encontrar todos los clientes y sus pedidos:
SELECT 
    customers.customerNumber, 
    customerName, 
    orderNumber, 
    status
FROM
    customers
LEFT JOIN orders ON 
    orders.customerNumber = customers.customerNumber;
    
-- Alternativamente, puede guardar algo de escritura usando alias de tabla:
SELECT
    c.customerNumber,
    customerName,
    orderNumber,
    status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber;

-- La customerses la mesa de la izquierda y orderses la mesa de la derecha.
-- La LEFT JOINcláusula devuelve a todos los clientes, incluidos los clientes que no tienen ningún pedido. Si un cliente no tiene pedido, los valores de la columna orderNumbery statusson NULL.
SELECT
	customerNumber,
	customerName,
	orderNumber,
	status
FROM
	customers
LEFT JOIN orders USING (customerNumber);

-- El siguiente ejemplo utiliza LEFT JOINpara buscar clientes que no tienen ningún pedido:
SELECT 
    c.customerNumber, 
    c.customerName, 
    o.orderNumber, 
    o.status
FROM
    customers c
LEFT JOIN orders o 
    ON c.customerNumber = o.customerNumber
WHERE
    orderNumber IS NULL;

-- Este ejemplo utiliza dos LEFT JOINcláusulas para unirse a las tres tablas: employees, customers, y payments.
SELECT 
    lastName, 
    firstName, 
    customerName, 
    checkNumber, 
    amount
FROM
    employees
LEFT JOIN customers ON 
    employeeNumber = salesRepEmployeeNumber
LEFT JOIN payments ON 
    payments.customerNumber = customers.customerNumber
ORDER BY 
    customerName, 
    checkNumber;

-- Condición en WHERE cláusula vs. ON cláusula
SELECT 
    o.orderNumber, 
    customerNumber, 
    productCode
FROM
    orders o
LEFT JOIN orderDetails 
    USING (orderNumber)
WHERE
    orderNumber = 10123;

-- Sin embargo, si mueve la condición de la WHERE cláusula a la ON cláusula:
SELECT 
    o.orderNumber, 
    customerNumber, 
    productCode
FROM
    orders o
LEFT JOIN orderDetails d 
    ON o.orderNumber = d.orderNumber AND 
       o.orderNumber = 10123;
