/* INNER JOIN */

-- Cláusula MySQL para seleccionar datos de varias tablas según las condiciones de unión

/*
SELECT
    select_list
FROM t1
INNER JOIN t2 ON join_condition1
INNER JOIN t3 ON join_condition2
...;
*/

-- Para seleccionar datos de ambas tablas haciendo coincidir filas según los valores de la productlinecolumna usando la INNER JOINcláusula de la siguiente manera:
SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products t1
INNER JOIN productlines t2 
    ON t1.productline = t2.productline;
    
-- Debido a que las columnas unidas de ambas tablas tienen el mismo nombre   productline, puede usar la USING sintaxis:
SELECT 
    productCode, 
    productName, 
    textDescription
FROM
    products
INNER JOIN productlines USING (productline);

-- Esta consulta devuelve el número de pedido, el estado del pedido y las ventas totales de las tablas ordersy orderdetailsutilizando la INNER JOINcláusula con la GROUP BY cláusula:
SELECT 
    t1.orderNumber,
    t1.status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders t1
INNER JOIN orderdetails t2 
    ON t1.orderNumber = t2.orderNumber
GROUP BY orderNumber;

-- De manera similar, la siguiente consulta usa el INNER JOINcon la USING sintaxis:
SELECT 
    orderNumber,
    status,
    SUM(quantityOrdered * priceEach) total
FROM
    orders
INNER JOIN orderdetails USING (orderNumber)
GROUP BY orderNumber;

-- Esta consulta utiliza dos INNER JOIN cláusulas para unirse a tres tablas: orders, orderdetails y products:
SELECT 
    orderNumber,
    orderDate,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN
    orderdetails USING (orderNumber)
INNER JOIN
    products USING (productCode)
ORDER BY 
    orderNumber, 
    orderLineNumber;

-- Consulte la siguiente orders, orderdetails, customersy productstablas:
-- Este ejemplo utiliza tres INNER JOINcláusulas para consultar datos de las cuatro tablas anteriores:
SELECT 
    orderNumber,
    orderDate,
    customerName,
    orderLineNumber,
    productName,
    quantityOrdered,
    priceEach
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
INNER JOIN products 
    USING (productCode)
INNER JOIN customers 
    USING (customerNumber)
ORDER BY 
    orderNumber, 
    orderLineNumber;
    
-- MySQL INNER JOIN usando otros operadores
SELECT 
    orderNumber, 
    productName, 
    msrp, 
    priceEach
FROM
    products p
INNER JOIN orderdetails o 
   ON p.productcode = o.productcode
      AND p.msrp > o.priceEach
WHERE
    p.productcode = 'S10_1678';
    