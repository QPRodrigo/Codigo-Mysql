/* Self Join */

-- Une una tabla a sí misma usando la combinación interna o la combinación izquierda.

/*

*/

-- Puede unir la employeestabla a sí misma usando las columnas employeeNumbery reportsTo. La mesa employeestiene dos roles: uno es el Gerente y el otro es Informes Directos.

SELECT 
    CONCAT(m.lastName, ', ', m.firstName) AS Manager,
    CONCAT(e.lastName, ', ', e.firstName) AS 'Direct report'
FROM
    employees e
INNER JOIN employees m ON 
    m.employeeNumber = e.reportsTo
ORDER BY 
    Manager;
    
### Autounión de MySQL usando LEFT JOINcláusula
-- El presidente es el empleado que no tiene ningún gerente o valor en la reportsTocolumna NULL.
-- La siguiente declaración usa la LEFT JOINcláusula en lugar de INNER JOINincluir al presidente

SELECT 
    IFNULL(CONCAT(m.lastname, ', ', m.firstname),
            'Top Manager') AS 'Manager',
    CONCAT(e.lastname, ', ', e.firstname) AS 'Direct report'
FROM
    employees e
LEFT JOIN employees m ON 
    m.employeeNumber = e.reportsto
ORDER BY 
    manager DESC;
    
### Uso de la autounión de MySQL para comparar filas sucesivas
-- Al utilizar la autounión de MySQL, puede mostrar una lista de clientes que se ubican en la misma ciudad uniéndose a la customerstabla a sí mism.
SELECT 
    c1.city, 
    c1.customerName, 
    c2.customerName
FROM
    customers c1
INNER JOIN customers c2 ON 
    c1.city = c2.city
    AND c1.customername > c2.customerName
ORDER BY 
    c1.city;