/* Common table expression or CTE */

-- Una expresión de tabla común es un conjunto de resultados temporal denominado que existe sólo dentro del ámbito ejecución de una instrucción SQL única por ejemplo, SELECT, INSERT, UPDATE, o DELETE. Similar a una tabla derivada , un CTE no se almacena como un objeto y dura solo durante la ejecución de una consulta.

/*

WITH cte_name (column_list) AS (
    query
) 
SELECT * FROM cte_name;

*/

-- El siguiente ejemplo ilustra cómo utilizar un CTE para consultar datos de la customerstabla en la base de datos de muestra .

WITH customers_in_usa AS (
    SELECT 
        customerName, state
    FROM
        customers
    WHERE
        country = 'USA'
) SELECT 
    customerName
 FROM
    customers_in_usa
 WHERE
    state = 'CA'
 ORDER BY customerName;


-- el nombre del CTE es customers_in_usa, la consulta que define el CTE devuelve dos columnas customerNamey state. Por lo tanto, el customers_in_usaCTE devuelve a todos los clientes ubicados en EE. UU. Después de definir el customers_in_usaCTE, lo hicimos referencia en la SELECTdeclaración para seleccionar solo clientes ubicados en California.

WITH topsales2003 AS (
    SELECT 
        salesRepEmployeeNumber employeeNumber,
        SUM(quantityOrdered * priceEach) sales
    FROM
        orders
            INNER JOIN
        orderdetails USING (orderNumber)
            INNER JOIN
        customers USING (customerNumber)
    WHERE
        YEAR(shippedDate) = 2003
            AND status = 'Shipped'
    GROUP BY salesRepEmployeeNumber
    ORDER BY sales DESC
    LIMIT 5
)
SELECT 
    employeeNumber, 
    firstName, 
    lastName, 
    sales
FROM
    employees
        JOIN
    topsales2003 USING (employeeNumber);

### Un ejemplo de MySQL CTE más avanzado
WITH salesrep AS (
    SELECT 
        employeeNumber,
        CONCAT(firstName, ' ', lastName) AS salesrepName
    FROM
        employees
    WHERE
        jobTitle = 'Sales Rep'
),
customer_salesrep AS (
    SELECT 
        customerName, salesrepName
    FROM
        customers
            INNER JOIN
        salesrep ON employeeNumber = salesrepEmployeeNumber
)
SELECT 
    *
FROM
    customer_salesrep
ORDER BY customerName;

