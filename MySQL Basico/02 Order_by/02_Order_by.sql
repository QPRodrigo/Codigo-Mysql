/* ORDER BY */

/*

SELECT 
   select_list
FROM 
   table_name
ORDER BY 
   column1 [ASC|DESC], 
   column2 [ASC|DESC],
   ...;

*/

-- Uso de la cláusula ORDER BY de MySQL para ordenar el conjunto de resultados por ejemplo de una columna
SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname;

-- Si desea ordenar a los clientes por apellido en orden descendente	
SELECT
	contactLastname,
	contactFirstname
FROM
	customers
ORDER BY
	contactLastname DESC;
	
-- Uso de la cláusula ORDER BY de MySQL para ordenar el conjunto de resultados por ejemplo de columnas múltiples
SELECT 
    contactLastname, 
    contactFirstname
FROM
    customers
ORDER BY 
	contactLastname DESC , 
	contactFirstname ASC;
	
-- Usar la cláusula ORDER BY de MySQL para ordenar un conjunto de resultados por un ejemplo de expresión
SELECT 
    orderNumber, 
    orderlinenumber, 
    quantityOrdered * priceEach
FROM
    orderdetails
ORDER BY 
   quantityOrdered * priceEach DESC;
   
-- Se puede asignar a la expresión en la SELECTcláusula un alias de columna 
SELECT 
    orderNumber,
    orderLineNumber,
    quantityOrdered * priceEach AS subtotal
FROM
    orderdetails
ORDER BY subtotal DESC;

-- Usando la cláusula ORDER BY de MySQL para ordenar datos usando una lista personalizada
-- puede usar la FIELD()función para asignar cada estado de pedido a un número y ordenar el resultado por el resultado de la FIELD()
SELECT 
    orderNumber, status
FROM
    orders
ORDER BY FIELD(status,
        'In Process',
        'On Hold',
        'Cancelled',
        'Resolved',
        'Disputed',
        'Shipped');
        
-- MySQL ORDER BY y NULL
SELECT 
    firstName, lastName, reportsTo
FROM
    employees
ORDER BY reportsTo;

SELECT 
    firstName, lastName, reportsTo
FROM
    employees
ORDER BY reportsTo DESC;
