
/*SELECT select_list FROM table_name;*/

USE `classicmodels`;

--  Uso de la instrucción SELECT de MySQL para recuperar datos de un ejemplo de una sola columna
SELECT 
	lastName 
FROM 
	employees;

-- Uso de la instrucción SELECT de MySQL para consultar datos de varias columnas
SELECT 
    lastName, 
    firstName, 
    jobTitle
FROM
    employees;
    
-- Uso de la instrucción SELECT de MySQL para recuperar datos de todas las columnas de ejemplo
SELECT 
	employeeNumber,
	lastName,
	firstName,
	extension,
	email,
	officeCode,
	reportsTo,
	jobTitle
FROM   
	employees; 
	
SELECT 
	* 
FROM 
	employees;