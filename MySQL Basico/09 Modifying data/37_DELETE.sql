/* DELETE */

-- Para eliminar datos de una tabla, usa la DELETEdeclaración MySQL .

/*

DELETE FROM table_name
WHERE condition;

*/

### Suponga que desea eliminar empleados cuyo el officeNumberes 4, usa la DELETEdeclaración con la WHEREcláusula como se muestra en la siguiente consulta

DELETE FROM employees 
WHERE officeCode = 4;

-- Para eliminar todas las filas de la employeestabla, use la DELETE declaración sin la WHEREcláusula de la siguiente manera
DELETE FROM employees;

### MySQL DELETEy LIMIT cláusula
-- use la LIMIT cláusula de la siguiente manera
DELETE FROM table_table
LIMIT row_count;

-- cuando usa la LIMITcláusula, siempre debe usar la ORDER BY cláusula.
DELETE FROM table_name
ORDER BY c1, c2, ...
LIMIT ROW_COUNT;

-- la siguiente declaración ordena a los clientes por nombres de clientes en orden alfabético y elimina los primeros 10 clientes:
DELETE FROM customers
ORDER BY customerName
LIMIT 10;

-- la siguiente DELETEdeclaración selecciona a los clientes France, los clasifica por límite de crédito de menor a mayor y elimina los primeros 5 clientes
DELETE FROM customers
WHERE country = 'France'
ORDER BY creditLimit
LIMIT 5;