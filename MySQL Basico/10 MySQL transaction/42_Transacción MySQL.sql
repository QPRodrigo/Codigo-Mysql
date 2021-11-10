/* Transacción MySQL */

### Declaraciones de transacciones de MySQL

/*

MySQL nos proporciona la siguiente declaración importante para controlar las transacciones:

Para iniciar una transacción, usa el START TRANSACTION  estado de cuenta. El BEGINo  BEGIN WORKson los alias de la START TRANSACTION.
Para confirmar la transacción actual y hacer que sus cambios sean permanentes, usa la COMMITinstrucción.
Para revertir la transacción actual y cancelar sus cambios, usa el ROLLBACKestado de cuenta.
Para deshabilitar o habilitar el modo de confirmación automática para la transacción actual, use la SET autocommitinstrucción.
De forma predeterminada, MySQL confirma automáticamente los cambios de forma permanente en la base de datos. Para obligar a MySQL a no realizar cambios automáticamente, utilice la siguiente declaración:

*/

/*

SET autocommit = 0;
Lenguaje de código:  SQL (lenguaje de consulta estructurado)  ( sql )
O

SET autocommit = OFF
Lenguaje de código:  SQL (lenguaje de consulta estructurado)  ( sql )
Utiliza la siguiente declaración para habilitar el modo de confirmación automática de forma explícita:

SET autocommit = 1;
Lenguaje de código:  SQL (lenguaje de consulta estructurado)  ( sql )
O

SET autocommit = ON;

*/


### Ejemplo COMMIT

/*

Para utilizar una transacción, primero debe dividir las instrucciones SQL en porciones lógicas y determinar cuándo se deben confirmar o deshacer los datos.

A continuación, se ilustra el paso de crear un nuevo pedido de cliente:

Primero, inicie una transacción utilizando el  START TRANSACTION  estado de cuenta.
A continuación, seleccione el último número de orden de venta de la  orderstabla y use el siguiente número de orden de venta como el nuevo número de orden de venta.
Luego, inserte una nueva orden de venta en la  orderstabla.
Después de eso, inserte los artículos de la orden de venta en la  orderdetailstabla.
Finalmente, confirme la transacción usando la  COMMITdeclaración.
Opcionalmente, puede seleccionar datos de ambas  tablas ordersy orderdetailspara verificar la nueva orden de venta.

El siguiente es el script que realiza los pasos anteriores:

*/

-- 1. start a new transaction
START TRANSACTION;

-- 2. Get the latest order number
SELECT 
    @orderNumber:=MAX(orderNUmber)+1
FROM
    orders;

-- 3. insert a new order for customer 145
INSERT INTO orders(orderNumber,
                   orderDate,
                   requiredDate,
                   shippedDate,
                   status,
                   customerNumber)
VALUES(@orderNumber,
       '2005-05-31',
       '2005-06-10',
       '2005-06-11',
       'In Process',
        145);
        
-- 4. Insert order line items
INSERT INTO orderdetails(orderNumber,
                         productCode,
                         quantityOrdered,
                         priceEach,
                         orderLineNumber)
VALUES(@orderNumber,'S18_1749', 30, '136', 1),
      (@orderNumber,'S18_2248', 50, '55.09', 2); 
      
-- 5. commit changes    
COMMIT;

# Para obtener el pedido de cliente recién creado, utilice la siguiente consulta:

SELECT 
    a.orderNumber,
    orderDate,
    requiredDate,
    shippedDate,
    status,
    comments,
    customerNumber,
    orderLineNumber,
    productCode,
    quantityOrdered,
    priceEach
FROM
    orders a
        INNER JOIN
    orderdetails b USING (orderNumber)
WHERE
    a.ordernumber = 10426;
    
# Ejemplo de ROLLBACK

-- Primero, inicie sesión en el servidor de la base de datos MySQL y elimine los datos de la tabla de pedidos:

/*

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> DELETE FROM orders;
Query OK, 327 rows affected (0.03 sec)

*/

-- Como puede ver en el resultado, MySQL confirmó que ordersse eliminaron todas las filas de la tabla.

-- En segundo lugar, inicie sesión en el servidor de la base de datos MySQL en una sesión separada y consulte los datos de la tabla de pedidos:

/*

mysql> SELECT COUNT(*) FROM orders;
+----------+
| COUNT(*) |
+----------+
|      327 |
+----------+
1 row in set (0.00 sec)

*/

/*

En esta segunda sesión, todavía podemos ver los datos de la orderstabla.

Hemos realizado los cambios en la primera sesión. Sin embargo, los cambios no son permanentes. En la primera sesión, podemos confirmar o revertir los cambios.

Para fines de demostración, revertiremos los cambios en la primera sesión.

*/

/*

mysql> ROLLBACK;
Query OK, 0 rows affected (0.04 sec)

*/

/*

en la primera sesión, también verificaremos el contenido de la orderstabla:

*/

/*

mysql> SELECT COUNT(*) FROM orders;
+----------+
| COUNT(*) |
+----------+
|      327 |
+----------+
1 row in set (0.00 sec)

*/