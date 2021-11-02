/* UPDATE */

-- Le permite cambiar los valores en una o más columnas de una sola fila o varias filas.

/*

UPDATE [LOW_PRIORITY] [IGNORE] table_name 
SET 
    column_name1 = expr1,
    column_name2 = expr2,
    ...
[WHERE
    condition];

*/

### Primero, busque el correo electrónico de Mary en la employeestabla usando la siguiente SELECT declaración:
SELECT 
    firstname, 
    lastname, 
    email
FROM
    employees
WHERE
    employeeNumber = 1056;
    
-- En segundo lugar, actualice la dirección de Marycorreo electrónico del nuevo correo electrónico mary.patterson@classicmodelcars.com:
UPDATE employees 
SET 
    email = 'mary.patterson@classicmodelcars.com'
WHERE
    employeeNumber = 1056;
    
-- En tercer lugar, SELECTvuelva a ejecutar la declaración para verificar el cambio:
SELECT 
    firstname, 
    lastname, 
    email
FROM
    employees
WHERE
    employeeNumber = 1056;
    
### Usar MySQL UPDATE
-- La siguiente declaración actualiza las columnas de apellido y correo electrónico del número de empleado 1056
UPDATE employees 
SET 
    lastname = 'Hill',
    email = 'mary.hill@classicmodelcars.com'
WHERE
    employeeNumber = 1056;
    
-- Verifiquemos los cambios:
SELECT 
    firstname, 
    lastname, 
    email
FROM
    employees
WHERE
    employeeNumber = 1056;

### 3) Usando MySQL UPDATE para reemplazar el ejemplo de cadena

-- El siguiente ejemplo actualiza las partes del dominio de los correos electrónicos de todos Sales Repscon código de oficina 6
UPDATE employees
SET email = REPLACE(email,'@classicmodelcars.com','@mysqltutorial.org')
WHERE
   jobTitle = 'Sales Rep' AND
   officeCode = 6;
   
### Usar MySQL UPDATEpara actualizar filas devueltas por un SELECT ejemplo de declaración
-- En la customerstabla, algunos clientes no tienen representante de ventas. El valor de la columna saleRepEmployeeNumberes el NULL siguiente
SELECT 
    customername, 
    salesRepEmployeeNumber
FROM
    customers
WHERE
    salesRepEmployeeNumber IS NULL;

### Esta consulta selecciona un empleado aleatorio de la tabla employeescuyo puesto de trabajo es Sales Rep.
SELECT 
    employeeNumber
FROM
    employees
WHERE
    jobtitle = 'Sales Rep'
ORDER BY RAND()
LIMIT 1;

-- Para actualizar la columna del número de empleado del representante de ventas en la customerstabla, colocamos la consulta anterior en la SETcláusula de la UPDATEdeclaración de la siguiente manera:
UPDATE customers 
SET 
    salesRepEmployeeNumber = (SELECT 
            employeeNumber
        FROM
            employees
        WHERE
            jobtitle = 'Sales Rep'
        ORDER BY RAND()
        LIMIT 1)
WHERE
    salesRepEmployeeNumber IS NULL;
-- Si consulta datos de la   employeestabla, verá que cada cliente tiene un representante de ventas. En otras palabras, la siguiente consulta no devuelve ninguna fila
SELECT 
     salesRepEmployeeNumber
FROM
    customers
WHERE
    salesRepEmployeeNumber IS NULL; 