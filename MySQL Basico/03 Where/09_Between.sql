/* BETWEEN  */

-- BETWEEN: Operador MySQL para determinar si un valor está en un rango de valores.

/*
SELECT 
    select_list
FROM
    table_name
WHERE
    select_list BETWEEN 'registro' AND 'registro';
*/

-- Operador para buscar productos cuyos precios de compra se encuentran entre 90 y 100:
SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice BETWEEN 90 AND 100;
    
-- Operadores mayor o igual (>=) y menor o igual ( <=) en lugar del BETWEENoperador para obtener el mismo resultado:
SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice >= 90 AND buyPrice <= 100;

-- Para encontrar los productos cuyos precios de compra no están entre $ 20 y $ 100, utilice el NOT BETWEEN operador de la siguiente manera
SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice NOT BETWEEN 20 AND 100;
   
-- Puede reescribir la consulta anterior usando menor que ( <), mayor que ( >) y el operador lógico ( AND) de esta manera:
SELECT 
    productCode, 
    productName, 
    buyPrice
FROM
    products
WHERE
    buyPrice < 20 OR buyPrice > 100;

# Usando MySQL BETWEEN operador con ejemplo de fechas
-- Para comprobar si un valor se encuentra entre un rango de fechas, debe convertir explícitamente el valor en el tipo DATE .
SELECT 
   orderNumber,
   requiredDate,
   status
FROM 
   orders
WHERE 
   requireddate BETWEEN 
     CAST('2003-01-01' AS DATE) AND 
     CAST('2003-01-31' AS DATE);
