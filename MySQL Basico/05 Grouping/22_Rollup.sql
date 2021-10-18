/* Rollup*/

-- Cláusula MySQL para generar subtotales y totales generales.

#### Configurar una mesa de muestra

-- La siguiente declaración crea una nueva tabla denominada salesque almacena los valores de los pedidos resumidos por líneas de productos y años. Los datos provienen de los products, ordersy orderDetailslas tablas de la base de datos de la muestra .

USE classicmodels; 

DROP TABLE IF EXISTS sales;

CREATE TABLE sales
SELECT
    productLine,
    YEAR(orderDate) orderYear,
    SUM(quantityOrdered * priceEach) orderValue
FROM
    orderDetails
        INNER JOIN
    orders USING (orderNumber)
        INNER JOIN
    products USING (productCode)
GROUP BY
    productLine ,
    YEAR(orderDate);

-- La siguiente consulta devuelve todas las filas de la sales tabla:
SELECT * FROM sales;

#### Descripción general de MySQL ROLLUP
-- Un conjunto de agrupación es un conjunto de columnas en las que desea agrupar. Por ejemplo, la siguiente consulta crea un conjunto de agrupaciones denotado por(productline).
SELECT 
    productline, 
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY 
    productline;
    
-- La siguiente consulta crea un conjunto de agrupación vacío denotado por ()
SELECT 
    SUM(orderValue) totalOrderValue
FROM
    sales;
    
-- Si desea generar dos o más conjuntos de agrupación juntos en una consulta, puede usar el UNION ALLoperador de la siguiente manera:
SELECT 
    productline, 
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY 
    productline 
UNION ALL
SELECT 
    NULL, 
    SUM(orderValue) totalOrderValue
FROM
    sales;
    
-- La ROLLUP cláusula es una extensión de la GROUP BYcláusula con la siguiente sintaxis:
/* 
SELECT 
    select_list
FROM 
    table_name
GROUP BY
    c1, c2, c3 WITH ROLLUP;
*/

-- El ROLLUPgenera múltiples conjuntos de agrupación en base a las columnas o expresiones especificadas en la GROUP BYcláusula.

SELECT 
    productLine, 
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY 
    productline WITH ROLLUP;
    
/*
Como se muestra claramente en el resultado, la ROLLUPcláusula genera no solo los subtotales sino también el gran total de los valores del pedido.

Si tiene más de una columna especificada en la GROUP BYcláusula, la ROLLUPcláusula asume una jerarquía entre las columnas de entrada.

*/
SELECT 
    productLine, 
    orderYear,
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY 
    productline, 
    orderYear 
WITH ROLLUP;

-- El ROLLUPgenera la fila de subtotal cada vez que cambia la línea de producto y el total general al final del resultado.

SELECT 
    orderYear,
    productLine, 
    SUM(orderValue) totalOrderValue
FROM
    sales
GROUP BY 
    orderYear,
    productline
WITH ROLLUP;
