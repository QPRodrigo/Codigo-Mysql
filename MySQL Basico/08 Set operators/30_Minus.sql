/* MINUS */

-- Operador SQL y cómo simular MINUSen MySQL usando join.

/*

SELECT select_list1 
	FROM table_name1
		MINUS 
			SELECT select_list2 
				FROM table_name2;

*/

-- Supongamos que tenemos dos tablas t1y t2con la siguiente estructura y datos:
CREATE TABLE t1 (
    id INT PRIMARY KEY
);

CREATE TABLE t2 (
    id INT PRIMARY KEY
);

INSERT INTO t1 VALUES (1),(2),(3);
INSERT INTO t2 VALUES (2),(3),(4);

-- La siguiente consulta devuelve valores distintos de la consulta de la t1tabla que no se encuentra en el resultado de la consulta de la t2 tabla.
SELECT id FROM t1
MINUS
SELECT id FROM t2; 

### MINUS Emulación de operador MySQL
-- Desafortunadamente, MySQL no es compatible con el MINUSoperador. Sin embargo, puede usar join para emularlo.

SELECT 
    select_list
FROM 
    table1
LEFT JOIN table2 
    ON join_predicate
WHERE 
    table2.column_name IS NULL; 

-- Por ejemplo, la siguiente consulta usa la LEFT JOINcláusula para devolver el mismo resultado que el MINUS operador:
SELECT 
    id
FROM
    t1
LEFT JOIN
    t2 USING (id)
WHERE
    t2.id IS NULL;
