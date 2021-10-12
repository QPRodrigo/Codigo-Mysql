/* RIGHT JOIN */

-- para consultar datos de dos tablas.

/*
SELECT 
    select_list
FROM t1
RIGHT JOIN t2 ON 
    join_condition;
*/

-- Esta declaración usa la RIGHT JOINcláusula une la tabla customerscon la tabla employees.
SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees 
    ON salesRepEmployeeNumber = employeeNumber
ORDER BY 
	employeeNumber;
	
-- La siguiente declaración utiliza la RIGHT JOINcláusula para encontrar empleados que no están a cargo de ningún cliente:
SELECT 
    employeeNumber, 
    customerNumber
FROM
    customers
RIGHT JOIN employees ON 
	salesRepEmployeeNumber = employeeNumber
WHERE customerNumber is NULL
ORDER BY employeeNumber;