/* LIMIT */

-- LIMIT: Cláusula MySQL para restringir el número de filas devueltas por una consulta.

/*
SELECT 
    select_list
FROM
    table_name
LIMIT [offset,] row_count;
*/

-- Para obtener los cinco clientes principales que tienen el crédito más alto:
SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY creditLimit DESC
LIMIT 5;

-- Para encontrar cinco clientes que tienen los créditos más bajos:
SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY creditLimit
LIMIT 5;

-- Para restringir la fila en un orden único:
SELECT 
    customerNumber, 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY 
    creditLimit, 
    customerNumber
LIMIT 5;

-- Para obtener filas de la página 1 que contiene los primeros 10 clientes ordenados por el nombre del cliente
SELECT 
    customerNumber, 
    customerName
FROM
    customers
ORDER BY customerName    
LIMIT 10;

-- Para obtener las filas de la segunda página que incluyen las filas 11 a 20
SELECT 
    customerNumber, 
    customerName
FROM
    customers
ORDER BY customerName    
LIMIT 10, 10;

-- Lo siguiente encuentra al cliente que tiene el segundo crédito más alto
SELECT 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY 
    creditLimit DESC    
LIMIT 1,1;

-- Esta consulta devuelve todos los clientes ordenados por créditos de mayor a menor
SELECT 
    customerName, 
    creditLimit
FROM
    customers
ORDER BY 
    creditLimit DESC;

-- Para devolver los primeros cinco estados únicos en la customerstabla
SELECT DISTINCT
    state
FROM
    customers
WHERE
    state IS NOT NULL
LIMIT 5;