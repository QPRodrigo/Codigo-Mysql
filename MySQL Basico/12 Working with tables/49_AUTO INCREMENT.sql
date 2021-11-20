/* AUTO_INCREMENT */

-- Muestra cómo utilizar una columna AUTO_INCREMENT para generar números únicos automáticamente para la clave principal.

/*

CREATE TABLE employees (
    emp_no INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
*/

-- Primero, inserte dos filas nuevas en la employeestabla:
/*
INSERT INTO employees(first_name,last_name)
VALUES('John','Doe'),
      ('Mary','Jane');
*/

-- En segundo lugar, seleccione los datos de la employeestabla:
/*

SELECT * FROM employees;

*/

-- En tercer lugar, elimine el segundo empleado cuyo emp_noes 2:

/*

DELETE FROM employees 
WHERE emp_no = 2;

*/

-- Cuarto, inserte un nuevo empleado:

/*

INSERT INTO employees(first_name,last_name)
VALUES('Jack','Lee');

*/

-- Quinto, actualice un empleado existente con emp_no3 a 1:

/*

UPDATE employees 
SET 
    first_name = 'Joe',
    emp_no = 1
WHERE
    emp_no = 3;

*/

-- MySQL emitió un error de entrada duplicada para la clave principal.

/*

UPDATE employees 
SET 
    first_name = 'Joe',
    emp_no = 10
WHERE
    emp_no = 3;

*/

-- En sexto lugar, inserte un nuevo empleado después de actualizar el número de secuencia a 10:

/*

INSERT INTO employees(first_name,last_name)
VALUES('Wang','Lee');

*/