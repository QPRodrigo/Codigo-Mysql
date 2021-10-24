/* UNION */

--  le permite combinar dos o más conjuntos de resultados de consultas en un único conjunto de resultados. 

/*

SELECT column_list
UNION [DISTINCT | ALL]
SELECT column_list
UNION [DISTINCT | ALL]
SELECT column_list
...

*/


# Ejemplo 01
DROP TABLE IF EXISTS t1;
DROP TABLE IF EXISTS t2;

CREATE TABLE t1 (
    id INT PRIMARY KEY
);

CREATE TABLE t2 (
    id INT PRIMARY KEY
);

INSERT INTO t1 VALUES (1),(2),(3);
INSERT INTO t2 VALUES (2),(3),(4);

-- Combina conjuntos de resultados devueltos desde t1y t2 tablas:
SELECT id
FROM t1
UNION
SELECT id
FROM t2;


### Si usa UNION ALLexplícitamente, las filas duplicadas, si están disponibles, permanecen en el resultado. Debido a UNION ALLque no necesita manejar duplicados, funciona más rápido que  UNION DISTINCT .

SELECT id
FROM t1
UNION ALL
SELECT id
FROM t2;

### UNION Ejemplos de MySQL y alias de columna

-- Suponga que desea combinar el nombre y apellido de empleados y clientes en un solo conjunto de resultados, puede usar el UNION operador de la siguiente manera:
SELECT 
    firstName, 
    lastName
FROM
    employees 
UNION 
SELECT 
    contactFirstName, 
    contactLastName
FROM
    customers;
    
-- Si desea usar otros encabezados de columna, debe usar alias de columna explícitamente en la primera SELECTdeclaración como se muestra en el siguiente ejemplo
SELECT 
    CONCAT(firstName,' ',lastName) fullname
FROM
    employees 
UNION SELECT 
    CONCAT(contactFirstName,' ',contactLastName)
FROM
    customers;
    
### MySQL UNION y ORDER BY
-- Si desea ordenar el conjunto de resultados de una unión, use una ORDER BYcláusula en la última  SELECTdeclaración como se muestra en el siguiente ejemplo
SELECT 
    concat(firstName,' ',lastName) fullname
FROM
    employees 
UNION SELECT 
    concat(contactFirstName,' ',contactLastName)
FROM
    customers
ORDER BY fullname;

-- Para diferenciar entre empleados y clientes, puede agregar una columna como se muestra en la siguiente consulta:
SELECT 
    CONCAT(firstName, ' ', lastName) fullname, 
    'Employee' as contactType
FROM
    employees 
UNION SELECT 
    CONCAT(contactFirstName, ' ', contactLastName),
    'Customer' as contactType
FROM
    customers
ORDER BY 
    fullname
    
-- MySQL también le proporciona una opción alternativa para ordenar un conjunto de resultados según la posición de la columna usando la ORDER BYcláusula de la siguiente manera:
SELECT 
    CONCAT(firstName,' ',lastName) fullname
FROM
    employees 
UNION SELECT 
    CONCAT(contactFirstName,' ',contactLastName)
FROM
    customers
ORDER BY 1;


