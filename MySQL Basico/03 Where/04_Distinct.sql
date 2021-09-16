# Al consultar datos de una tabla, es posible que obtenga filas duplicadas. Para eliminar estas filas duplicadas

/*

SELECT DISTINCT
    select_list
FROM
    table_name
WHERE 
    search_condition
ORDER BY 
    sort_expression;

*/

USE classicmodels;

-- cláusulas MySQL DISTINCT
SELECT 
    lastname
FROM
    employees
ORDER BY 
    lastname;
    
SELECT 
    DISTINCT lastname
FROM
    employees
ORDER BY 
    lastname;
   
-- Valores de MySQL DISTINCT y NULL
# Cuando especifica una columna que tiene NULLvalores en la DISTINCTcláusula, la DISTINCTcláusula mantendrá solo un NULLvalor porque considera que todos los NULLvalores son iguales.
SELECT DISTINCT state
FROM customers;

-- MySQL DISTINCT con múltiples columnas
SELECT DISTINCT
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state, 
    city;

#Sin la DISTINCT cláusula,
SELECT 
    state, city
FROM
    customers
WHERE
    state IS NOT NULL
ORDER BY 
    state , 
    city;