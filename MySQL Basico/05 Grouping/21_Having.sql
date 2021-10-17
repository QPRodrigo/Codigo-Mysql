/* Having */

-- Cláusula MySQL para especificar una condición de filtro para grupos de filas o agregados.

/*

SELECT 
    select_list
FROM 
    table_name
WHERE 
    search_condition
GROUP BY 
    group_by_expression
HAVING 
    group_condition;

*/

-- cláusula para obtener los números de pedido, el número de artículos vendidos por pedido y las ventas totales de cada uno de la orderdetailstabla:
SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber;

-- encontrar qué pedido tiene un total de ventas mayor que 1000utilizando la HAVINGcláusula de la siguiente manera:
SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY 
   ordernumber
HAVING 
   total > 1000;
   
-- HAVING cláusula para buscar pedidos que tienen cantidades totales mayores que 1000y contienen más que 600 artículos:
SELECT 
    ordernumber,
    SUM(quantityOrdered) AS itemsCount,
    SUM(priceeach*quantityOrdered) AS total
FROM
    orderdetails
GROUP BY ordernumber
HAVING 
    total > 1000 AND 
    itemsCount > 600;
    
-- Suponga que desea encontrar todos los pedidos que ya se enviaron y tienen un monto total superior a 1500, puede unir la orderdetailstabla con la orderstabla usando la INNER JOINcláusula y aplicar una condición en la  statuscolumna y totalagregar como se muestra en la siguiente consulta:

SELECT 
    a.ordernumber, 
    status, 
    SUM(priceeach*quantityOrdered) total
FROM
    orderdetails a
INNER JOIN orders b 
    ON b.ordernumber = a.ordernumber
GROUP BY  
    ordernumber, 
    status
HAVING 
    status = 'Shipped' AND 
    total > 1500;
    

