/* INTERSECT */

-- Operador y le mostraremos cómo emular el INTERSECT operador MySQL.

/*

(SELECT 
	column_list 
FROM 
	table_1)
INTERSECT
(SELECT 
	column_list
FROM 
	table_2);

*/

-- Las siguientes declaraciones crean tablas t1 y t2, a continuación, insertar los datos en ambas tablas.

CREATE TABLE t1 (
    id INT PRIMARY KEY
);

CREATE TABLE t2 LIKE t1;

INSERT INTO t1(id) VALUES(1),(2),(3);

INSERT INTO t2(id) VALUES(2),(3),(4);

### Emular el INTERSECT uso DISTINCT y la INNER JOIN cláusula
SELECT DISTINCT 
   id 
FROM t1
   INNER JOIN t2 USING(id);
   
   
### Emular INTERSECT usando IN y subconsultas
SELECT DISTINCT id
FROM t1
WHERE id IN (SELECT id FROM t2);