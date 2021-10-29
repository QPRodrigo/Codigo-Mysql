/* INSERT multiple rows */

-- Declaración de MySQL para insertar varias filas en una tabla.

/*

INSERT INTO table_name (column_list)
VALUES
	(value_list_1),
	(value_list_2),
	...
	(value_list_n);

*/

DROP TABLE IF EXISTS projects;

CREATE TABLE IF NOT EXISTS projects(
	project_id INT AUTO_INCREMENT, 
	name VARCHAR(100) NOT NULL,
	start_date DATE,
	end_date DATE,
	PRIMARY KEY(project_id)
);

INSERT INTO 
	projects(name, start_date, end_date)
VALUES
	('AI for Marketing','2019-08-01','2019-12-31'),
	('ML for Sales','2019-05-15','2019-11-20');


SELECT * FROM projects;