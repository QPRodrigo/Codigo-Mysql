/* IN */

-- IN: Operador MySQL para determinar si un valor especificado coincide con algún valor en una lista de valores.

/*
SELECT 
    select_list
FROM
    table_name
WHERE 
    column IN ('registro', 'registro');
*/

-- operador para encontrar las oficinas ubicadas en EE. UU. Y Francia
SELECT 
    officeCode, 
    city, 
    phone, 
    country
FROM
    offices
WHERE
    country IN ('USA' , 'France');
    
-- También puede obtener el mismo resultado con el ORoperador de esta manera:
SELECT 
    officeCode, 
    city, 
    phone
FROM
    offices
WHERE
    country = 'USA' OR country = 'France';