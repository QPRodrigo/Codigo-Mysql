/* UPDATE JOIN */

-- Utiliza combinaciones para consultar filas de una tabla que tienen (en el caso de INNER JOIN) o no pueden tener (en el caso de LEFT JOIN) filas coincidentes en otra tabla.

/*

UPDATE T1, T2,
[INNER JOIN | LEFT JOIN] T1 ON T1.C1 = T2. C1
SET T1.C2 = T2.C2, 
    T2.C3 = expr
WHERE condition

*/

--  el UPDATE tutorial de declaraciones, notará que hay otra forma de actualizar la tabla cruzada de datos usando la siguiente sintaxis
UPDATE T1, T2
SET T1.c2 = T2.c2,
      T2.c3 = expr
WHERE T1.c1 = T2.c1 AND CONDITION

-- Esta UPDATE  declaración funciona igual que  UPDATE JOIN  con una INNER JOIN  cláusula implícita . Significa que puede reescribir la declaración anterior de la siguiente manera:
UPDATE T1,T2
INNER JOIN T2 ON T1.C1 = T2.C1
SET T1.C2 = T2.C2,
      T2.C3 = expr
WHERE CONDITION

### Las siguientes declaraciones crean y cargan datos en la empdbbase de datos de muestra:
CREATE DATABASE IF NOT EXISTS empdb;

USE empdb;

-- create tables
CREATE TABLE merits (
    performance INT(11) NOT NULL,
    percentage FLOAT NOT NULL,
    PRIMARY KEY (performance)
);

CREATE TABLE employees (
    emp_id INT(11) NOT NULL AUTO_INCREMENT,
    emp_name VARCHAR(255) NOT NULL,
    performance INT(11) DEFAULT NULL,
    salary FLOAT DEFAULT NULL,
    PRIMARY KEY (emp_id),
    CONSTRAINT fk_performance FOREIGN KEY (performance)
        REFERENCES merits (performance)
);
-- insert data for merits table
INSERT INTO merits(performance,percentage)
VALUES(1,0),
      (2,0.01),
      (3,0.03),
      (4,0.05),
      (5,0.08);
-- insert data for employees table
INSERT INTO employees(emp_name,performance,salary)      
VALUES('Mary Doe', 1, 50000),
      ('Cindy Smith', 3, 65000),
      ('Sue Greenspan', 4, 75000),
      ('Grace Dell', 5, 125000),
      ('Nancy Johnson', 3, 85000),
      ('John Doe', 2, 45000),
      ('Lily Bush', 3, 55000);
      
-- El vínculo entre las tablas employees  y merites el  performance  campo. Vea la siguiente consulta:
UPDATE employees
        INNER JOIN
    merits ON employees.performance = merits.performance 
SET 
    salary = salary + salary * percentage;
    
-- Supongamos que la empresa contrata a dos empleados más:
INSERT INTO employees(emp_name,performance,salary)
VALUES('Jack William',NULL,43000),
      ('Ricky Bond',NULL,52000);

-- Por ejemplo, puede aumentar el salario de un nuevo empleado en un 1,5% utilizando la siguiente declaración:
UPDATE employees
        LEFT JOIN
    merits ON employees.performance = merits.performance 
SET 
    salary = salary + salary * 0.015
WHERE
    merits.percentage IS NULL;




