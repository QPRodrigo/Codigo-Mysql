/* RENAME TABLE */

-- Muestra cómo cambiar el nombre de una tabla mediante una RENAME TABLE declaración.

/*
RENAME TABLE old_table_name TO new_table_name;
*/

### MySQL RENAME TABLE examples
/*
CREATE DATABASE IF NOT EXISTS hr;

CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100)
);

CREATE TABLE employees (
    id int AUTO_INCREMENT primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    department_id int not null,
    FOREIGN KEY (department_id)
        REFERENCES departments (department_id)
);

*/

-- En segundo lugar, insertamos datos de muestra en tablas employeesy departments:
/*

INSERT INTO departments(dept_name)
VALUES('Sales'),('Markting'),('Finance'),('Accounting'),('Warehouses'),('Production');

INSERT INTO employees(first_name,last_name,department_id) 
VALUES('John','Doe',1),
		('Bush','Lily',2),
		('David','Dave',3),
		('Mary','Jane',4),
		('Jonatha','Josh',5),
		('Mateo','More',1);

*/

-- En tercer lugar, revisamos nuestros datos en las tablas departmentsy employees:
/*
SELECT 
    department_id, dept_name
FROM
    departments;
    
SELECT 
    id, first_name, last_name, department_id
FROM
    employees;
*/

### Cambiar el nombre de una tabla a la que hace referencia una vista
/*
CREATE VIEW v_employee_info as
    SELECT 
        id, first_name, last_name, dept_name
    from
        employees
            inner join
        departments USING (department_id);
*/
/*
SELECT 
    *
FROM
    v_employee_info;
*/
-- Ahora cambiamos el nombre de la tabla a y volvemos employeesa peopleconsultar los datos de la v_employee_infovista.
/*
RENAME TABLE employees TO people;

SELECT 
    *
FROM
    v_employee_info;
*/
-- Error Code: 1356. View 'hr.v_employee_info' references invalid table(s) or  column(s) or function(s) or definer/invoker of view lack rights to use them


-- Podemos usar la CHECK TABLEdeclaración para verificar el estado de la v_employee_infovista de la siguiente manera:
/*
CHECK TABLE v_employee_info;
*/


#### Cambiar el nombre de una tabla a la que hace referencia un procedimiento almacenado

-- Primero, cambie el nombre de la people tabla a la  employeestabla.
/*
RENAME TABLE people TO employees;
*/

-- Luego, cree un nuevo procedimiento almacenado llamado get_employeeque haga referencia a la employeestabla.
/*
DELIMITER $$

CREATE PROCEDURE get_employee(IN p_id INT)

BEGIN
	SELECT first_name
		,last_name
		,dept_name
	FROM employees
	INNER JOIN departments using (department_id)
	WHERE id = p_id;
END $$

DELIMITER;
*/

-- A continuación, ejecutamos la get_employeetabla para obtener los datos del empleado con id 1 de la siguiente manera:
/*
CALL get_employee(1);
*/

-- Después de eso, cambiamos el nombre employeesde la peoplemesa nuevamente.
/*
RENAME TABLE employees TO people;
*/

-- Finalmente, llamamos al get_employeeprocedimiento almacenado para obtener la información del empleado con id 2:
/*
CALL get_employee(2);
*/

### Cambiar el nombre de una tabla que tiene claves externas a las que se hace referencia
 
/*
RENAME TABLE departments TO depts;
*/

/*DELETE FROM depts 
WHERE
    department_id = 1;*/
    
#### Cambiar el nombre de varias tablas
/*
RENAME TABLE old_table_name_1 TO new_table_name_2,
             old_table_name_2 TO new_table_name_2,...
*/

-- RENAME TABLE depts TO departments, people TO employees;


### Cambiar el nombre de las tablas mediante la instrucción ALTER TABLE
/*
ALTER TABLE old_table_name
RENAME TO new_table_name;
*/

### Ejemplo de cambio de nombre de tabla temporal

-- Primero, creamos una tabla temporal que contiene todos los apellidos únicos que provienen de la last_namecolumna de la employeestabla:
/*
CREATE TEMPORARY TABLE lastnames
SELECT DISTINCT last_name from employees;
*/

-- En segundo lugar, usamos RENAME TABLEpara cambiar el nombre de la lastnamestabla:
/*
RENAME TABLE lastnames TO unique_lastnames;
*/

-- En tercer lugar, usamos la ALTER TABLE declaración para cambiar el nombre de la lastnamestabla.
/*
ALTER TABLE lastnames
RENAME TO unique_lastnames;
*/

-- Cuarto, consultamos datos de la unique_lastnamestabla temporal:
/*
SELECT 
    last_name
FROM
    unique_lastnames;
*/