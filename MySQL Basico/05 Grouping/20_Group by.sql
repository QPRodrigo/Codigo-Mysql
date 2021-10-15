/* GROUP BY */

-- Para agrupar filas en subgrupos según los valores de columnas o expresiones.

/*

SELECT 
    c1, c2,..., cn, aggregate_function(ci)
FROM
    table
WHERE
    where_conditions
GROUP BY c1 , c2,...,cn;

*/

### Simple MySQL GROUP BY ejemplo

-- Se desea agrupar valores del estado del pedido en subgrupos, usa la GROUP BYcláusula con la statuscolumna como la siguiente consulta
SELECT 
    status
FROM
    orders
GROUP BY STATUS;

-- la GROUP BYcláusula devuelve ocurrencias únicas de statusvalores. Funciona como el DISTINCT operador como se muestra en la siguiente consulta
SELECT DISTINCT
    status
FROM
    orders;

### Usando MySQL GROUP BY con funciones agregadas

-- si desea saber el número de pedidos en cada estado, puede usar la COUNTfunción con la GROUP BYcláusula de la siguiente manera
SELECT 
    status, COUNT(*)
FROM
    orders
GROUP BY STATUS;

-- Para obtener el monto total de todos los pedidos por estado, se une a la orderstabla con la orderdetailstabla y usa la SUM función para calcular el monto total. 
SELECT 
    status, 
    SUM(quantityOrdered * priceEach) AS amount
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
GROUP BY 
    status;

-- La siguiente consulta devuelve los números de pedido y el monto total de cada pedido.
SELECT 
    orderNumber,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orderdetails
GROUP BY 
    orderNumber;
    
### MySQL GROUP BY con ejemplo de expresión

-- Puede agrupar filas por expresiones. La siguiente consulta obtiene las ventas totales de cada año.
SELECT 
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
WHERE
    status = 'Shipped'
GROUP BY 
    YEAR(orderDate);

-- Para filtrar los grupos devueltos por GROUP BYcláusula, usa una  HAVING cláusula. La siguiente consulta utiliza la HAVING cláusula para seleccionar las ventas totales de los años posteriores a 2003.
SELECT 
    YEAR(orderDate) AS year,
    SUM(quantityOrdered * priceEach) AS total
FROM
    orders
INNER JOIN orderdetails 
    USING (orderNumber)
WHERE
    status = 'Shipped'
GROUP BY 
    year
HAVING 
    year > 2003;
    
-- La cláusula GROUP BY: estándar MySQL frente a SQL
SELECT 
    YEAR(orderDate) AS year, 
    COUNT(orderNumber)
FROM
    orders
GROUP BY 
    year;

SELECT 
    status, 
    COUNT(*)
FROM
    orders
GROUP BY 
    status DESC;
    
### La cláusula GROUP BY frente a la cláusula DISTINCT

-- La siguiente declaración utiliza la GROUP BYcláusula para seleccionar los estados únicos de los clientes de la customers tabla.
SELECT 
    state
FROM
    customers
GROUP BY state;

SELECT DISTINCT
    state
FROM
    customers;
    
-- Si agrega la ORDER BYcláusula a la declaración que usa la  DISTINCTcláusula, el conjunto de resultados se ordena y es el mismo que devuelve la declaración que usa GROUP BYcláusula.
SELECT DISTINCT
    state
FROM
    customers
ORDER BY 
    state;