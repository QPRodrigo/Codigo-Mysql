/* INSERT */

-- Declaración le permite insertar una o más filas en una tabla. 

/*

INSERT INTO table(c1,c2,...)
VALUES (v1,v2,...);

*/

/*

INSERT INTO table(c1,c2,...)
VALUES 
   (v11,v12,...),
   (v21,v22,...),
    ...
   (vnn,vn2,...);

*/

DROP TABLE IF EXISTS tasks;

### INSERT Ejemplos de MySQL
CREATE TABLE IF NOT EXISTS tasks (
    task_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    start_date DATE,
    due_date DATE,
    priority TINYINT NOT NULL DEFAULT 3,
    description TEXT,
    PRIMARY KEY (task_id)
);


-- La siguiente declaración inserta una nueva fila en la taskstabla:
INSERT INTO tasks(title,priority)
VALUES('Learn MySQL INSERT Statement',1);

SELECT * FROM tasks;


### MySQL INSERT- Insertar filas usando el ejemplo de valor predeterminado

-- Si desea insertar un valor predeterminado en una columna
INSERT INTO tasks(title,priority)
VALUES('Understanding DEFAULT keyword in INSERT statement',DEFAULT);

SELECT * FROM tasks;

### MySQL INSERT- Insertar fechas en el ejemplo de tabla

-- La siguiente declaración inserta una nueva fila en la taskstabla con los valores de fecha de inicio y vencimiento
INSERT INTO tasks(title, start_date, due_date)
VALUES('Insert date into table','2018-01-09','2018-09-15');

-- Es posible utilizar expresiones en la VALUEScláusula.
INSERT INTO tasks(title,start_date,due_date)
VALUES('Use current date for the task',CURRENT_DATE(),CURRENT_DATE());

### MySQL INSERT

-- La siguiente declaración inserta tres filas en la taskstabla:
INSERT INTO tasks(title, priority)
VALUES
	('My first task', 1),
	('It is the second task',2),
	('This is the third task of the week',3);
	
SELECT * FROM tasks;