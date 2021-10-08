/* OR */

-- OR: operador MySQL para combinar expresiones booleanas.

/*
SELECT 
    select_list
FROM
    table_name
WHERE 
    search_condition
OR
    search_condition;
*/

-- Cláusula para seleccionar todos los clientes ubicados en EE. UU. O Francia
SELECT    
	customername, 
	country
FROM    
	customers
WHERE country = 'USA' OR 
      country = 'France';
      
-- Para seleccionar los clientes que se ubican en EE. UU. O Francia y tienen un límite de crédito superior a 100.000
SELECT   
	customername, 
	country, 
	creditLimit
FROM   
	customers
WHERE(country = 'USA'
		OR country = 'France')
	  AND creditlimit > 100000;
	  
-- Tenga en cuenta que si no utiliza el paréntesis, la consulta devolverá los clientes que se ubican en EE. UU. O los clientes ubicados en Francia con un límite de crédito superior a 100.000.
SELECT    
    customername, 
    country, 
    creditLimit
FROM    
    customers
WHERE 
    country = 'USA'
    OR country = 'France'
    AND creditlimit > 100000;
