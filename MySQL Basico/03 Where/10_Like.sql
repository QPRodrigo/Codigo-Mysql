/* LIKE  */

-- LIKE: Operador MySQL para consultar datos según un patrón específico.

/*
SELECT 
    select_list
FROM
    table_name
WHERE
    search_condition LIKE 'caracter%';;
*/

-- Operador para encontrar empleados cuyos nombres comienzan con la letra a.
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    firstName LIKE 'a%';
    
-- Operador para encontrar empleados cuyos apellidos terminan con la cadena literal onpor ejemplo, Patterson, Thompson.
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastName LIKE '%on';

-- Operador para buscar todos los empleados cuyos apellidos contienen la subcadena on:
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastname LIKE '%on%';

-- Para encontrar empleados cuyos nombres comienzan primero con la letra  T, extremo con la letra my contener cualquier carácter individual entre, por ejemplo, Tom, Tim, se utiliza el comodín de subrayado (_) para construir el patrón de la siguiente manera
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    firstname LIKE 'T_m';

-- Suponga que desea buscar empleados cuyos apellidos no comiencen con la letra B, puede usar el NOT LIKEoperador de la siguiente manera:
SELECT 
    employeeNumber, 
    lastName, 
    firstName
FROM
    employees
WHERE
    lastName NOT LIKE 'B%';

-- si desea buscar productos cuyos códigos de producto contengan la cadena _20, puede utilizar el patrón %\_20%con el carácter de escape predeterminado
SELECT 
    productCode, 
    productName
FROM
    products
WHERE
    productCode LIKE '%\_20%';

-- Alternativamente, puede especificar un carácter de escape diferente, por ejemplo, $usando la ESCAPEcláusula:
SELECT 
    productCode, 
    productName
FROM
    products
WHERE
    productCode LIKE '%$_20%' ESCAPE '$';