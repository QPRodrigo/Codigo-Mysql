/* NOT IN */

-- NOT IN: Operador MySQL para verificar si un valor no está en una lista de valores.

/*
SELECT 
    select_list
FROM
    table_name
WHERE 
    column NOT IN ('registro', 'registro');
*/

-- Operador para encontrar las oficinas que no se ubican en Francey el USA:
SELECT 
    officeCode, 
    city, 
    phone
FROM
    offices
WHERE
    country NOT IN ('USA' , 'France')
ORDER BY 
    city;
