/* Delete Join */

--  Muestra cómo eliminar datos de varias tablas.

/*

DELETE T1, T2
FROM T1
INNER JOIN T2 ON T1.key = T2.key
WHERE condition;

*/

### MySQL DELETE JOIN con INNER JOIN

DROP TABLE IF EXISTS t1, t2;

CREATE TABLE t1 (
    id INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE t2 (
    id VARCHAR(20) PRIMARY KEY,
    ref INT NOT NULL
);

INSERT INTO t1 VALUES (1),(2),(3);

INSERT INTO t2(id,ref) VALUES('A',1),('B',2),('C',3);

### La siguiente declaración elimina la fila con id 1 en la t1tabla y también la fila con ref1 en la t2tabla usando DELETE...INNER JOIN declaración:
DELETE t1,t2 FROM t1
        INNER JOIN
    t2 ON t2.ref = t1.id 
WHERE
    t1.id = 1;
    
-- La siguiente sintaxis ilustra cómo usar la DELETEinstrucción con LEFT JOIN cláusula para eliminar filas de la T1tabla que no tienen filas correspondientes en la T2 tabla:
DELETE T1 
FROM T1
        LEFT JOIN
    T2 ON T1.key = T2.key 
WHERE
    T2.key IS NULL;

### Podemos usar una DELETEdeclaración con una LEFT JOINcláusula para limpiar los datos maestros de nuestros clientes. La siguiente declaración elimina a los clientes que no han realizado ningún pedido:
DELETE customers 
FROM customers
        LEFT JOIN
    orders ON customers.customerNumber = orders.customerNumber 
WHERE
    orderNumber IS NULL;
    
### Podemos verificar la eliminación encontrando si existen clientes que no tienen ningún pedido mediante la siguiente consulta:
SELECT 
    c.customerNumber, 
    c.customerName, 
    orderNumber
FROM
    customers c
        LEFT JOIN
    orders o ON c.customerNumber = o.customerNumber
WHERE
    orderNumber IS NULL;