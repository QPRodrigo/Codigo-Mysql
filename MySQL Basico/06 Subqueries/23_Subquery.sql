/* Subquery */

--  Para escribir consultas complejas y explicar el concepto de subconsulta correlacionada.

-- la siguiente consulta utiliza una subconsulta para devolver los empleados que trabajan en las oficinas ubicadas en EE. UU.
SELECT 
    lastName, firstName
FROM
    employees
WHERE
    officeCode IN (SELECT 
            officeCode
        FROM
            offices
        WHERE
            country = 'USA');
            
-- la siguiente consulta devuelve el cliente que tiene el pago más alto.
SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount = (SELECT MAX(amount) FROM payments);
    
--  Puede encontrar clientes cuyos pagos sean mayores que el pago promedio mediante una subconsulta:
SELECT 
    customerNumber, 
    checkNumber, 
    amount
FROM
    payments
WHERE
    amount > (SELECT 
            AVG(amount)
        FROM
            payments);

-- puede utilizar una subconsulta con NOT INoperador para encontrar los clientes que no han realizado ningún pedido de la siguiente manera:
SELECT 
    customerName
FROM
    customers
WHERE
    customerNumber NOT IN (SELECT DISTINCT
            customerNumber
        FROM
            orders);
            
-- La siguiente subconsulta busca el número máximo , mínimo y promedio de artículos en pedidos de venta
SELECT 
    MAX(items), 
    MIN(items), 
    FLOOR(AVG(items))
FROM
    (SELECT 
        orderNumber, COUNT(orderNumber) AS items
    FROM
        orderdetails
    GROUP BY orderNumber) AS lineitems;
    
-- Subconsulta correlacionada con MySQL
SELECT 
    orderNumber, 
    COUNT(orderNumber) AS items
FROM
    orderdetails
GROUP BY orderNumber;

-- El siguiente ejemplo usa una subconsulta correlacionada para seleccionar productos cuyos precios de compra son mayores que el precio de compra promedio de todos los productos en cada  línea de productos.
SELECT 
    productname, 
    buyprice
FROM
    products p1
WHERE
    buyprice > (SELECT 
            AVG(buyprice)
        FROM
            products
        WHERE
            productline = p1.productline)
            
-- Subconsulta de MySQL con EXISTS y NOT EXISTS
SELECT 
    *
FROM
    table_name
WHERE
    EXISTS( subquery );

-- La siguiente consulta busca pedidos de ventas cuyos valores totales sean superiores a 60 K.
SELECT 
    orderNumber, 
    SUM(priceEach * quantityOrdered) total
FROM
    orderdetails
        INNER JOIN
    orders USING (orderNumber)
GROUP BY orderNumber
HAVING SUM(priceEach * quantityOrdered) > 60000;

-- Puede utilizar la consulta anterior como una subconsulta correlacionada para encontrar clientes que hayan realizado al menos un pedido de venta con un valor total superior a 60K mediante el EXISTS operador
SELECT 
    customerNumber, 
    customerName
FROM
    customers
WHERE
    EXISTS( SELECT 
            orderNumber, SUM(priceEach * quantityOrdered)
        FROM
            orderdetails
                INNER JOIN
            orders USING (orderNumber)
        WHERE
            customerNumber = customers.customerNumber
        GROUP BY orderNumber
        HAVING SUM(priceEach * quantityOrdered) > 60000);