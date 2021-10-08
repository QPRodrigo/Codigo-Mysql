/* AND */

/*
SELECT 
    select_list
FROM
    table_name
WHERE 
    search_condition
AND
    search_condition;
*/


-- Para encontrar clientes que se ubican en California (CA), EE. UU:
SELECT 
    customername, 
    country, 
    state
FROM
    customers
WHERE
    country = 'USA' AND 
    state = 'CA';

-- Devuelve los clientes que se encuentran en California, EE. UU., Y tienen un límite de crédito superior a 100K.
SELECT 
    customername, 
    country, 
    state, 
    creditlimit
FROM
    customers
WHERE
    country = 'USA' AND 
    state = 'CA' AND 
    creditlimit > 100000;
    