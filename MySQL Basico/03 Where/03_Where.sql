/* WHERE */

/*

SELECT 
    select_list
FROM
    table_name
WHERE
    search_condition;

*/

-- Uso de la cláusula WHERE de MySQL con un ejemplo de operador de igualdad
SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle = 'Sales Rep';
    
-- Usando la cláusula WHERE de MySQL con el operador AND
SELECT 
    lastname, 
    firstname, 
    jobtitle,
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' AND 
    officeCode = 1;
    
-- Usando la cláusula WHERE de MySQL con el operador OR
SELECT 
    lastName, 
    firstName, 
    jobTitle, 
    officeCode
FROM
    employees
WHERE
    jobtitle = 'Sales Rep' OR 
    officeCode = 1
ORDER BY 
    officeCode , 
    jobTitle;

-- Uso de la cláusula WHERE de MySQL con el ejemplo del operador BETWEEN
SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode BETWEEN 1 AND 3
ORDER BY 
	officeCode;

-- Uso de la cláusula WHERE de MySQL con el ejemplo del operador LIKE
SELECT 
    firstName, 
    lastName
FROM
    employees
WHERE
    lastName LIKE '%son'
ORDER BY 
	firstName;

-- Uso de la cláusula WHERE de MySQL con el ejemplo del operador IN
SELECT 
    firstName, 
    lastName, 
    officeCode
FROM
    employees
WHERE
    officeCode IN (1 , 2, 3)
ORDER BY 
    officeCode;
    
-- Uso de la cláusula WHERE de MySQL con el operador IS NULL
SELECT 
    lastName, 
    firstName, 
    reportsTo
FROM
    employees
WHERE
    reportsTo IS NULL;

-- Uso de la cláusula WHERE de MySQL con operadores de comparación
SELECT 
    lastname, 
    firstname, 
    jobtitle
FROM
    employees
WHERE
    jobtitle <> 'Sales Rep';
    
SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode > 5;
    
SELECT 
    lastname, 
    firstname, 
    officeCode
FROM
    employees
WHERE 
    officecode <= 4;