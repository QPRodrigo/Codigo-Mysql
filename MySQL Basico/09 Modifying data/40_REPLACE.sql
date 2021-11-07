/* REPLACE */

/*

Funciona de la siguiente manera

Paso 1. Inserte una nueva fila en la tabla , si se produce un error de clave duplicada.

Paso 2. Si la inserción falla debido a un error de clave duplicada ocurre:
	.- Elimine la fila en conflicto que causa el error de clave duplicada de la tabla.
	.- Inserte la nueva fila en la tabla nuevamente.
	
*/


### Usando MySQL REPLACEpara insertar una nueva fila
/*
REPLACE [INTO] table_name(column_list)
VALUES(value_list);
*/

-- En primer lugar, crear una nueva tabla llamada citiesde la siguiente manera:
CREATE TABLE cities (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    population INT NOT NULL
);

-- A continuación, inserte algunas filas en la citiestabla:
INSERT INTO cities(name,population)
VALUES('New York',8008278),
	  ('Los Angeles',3694825),
	  ('San Diego',1223405);

-- Luego, consulte los datos de la citiestabla para verificar la operación de inserción.
SELECT * FROM cities;

-- Después de eso, use la REPLACEdeclaración para actualizar la población de la Los Angelesciudad a 3696820.
REPLACE INTO cities(id,population)
VALUES(2,3696820);

-- Finalmente, citiesvuelva a consultar los datos de la tabla para verificar el reemplazo.
SELECT * FROM cities;

### Usando la REPLACE declaración de MySQL para actualizar una fila

-- A continuación, se ilustra cómo utilizar la REPLACEdeclaración para actualizar datos:
/*
REPLACE INTO table
SET column1 = value1,
    column2 = value2;
*/
-- Este ejemplo usa la REPLACEdeclaración para actualizar la población de la Phoenixciudad a 1768980:
REPLACE INTO cities
SET id = 4,
    name = 'Phoenix',
    population = 1768980;
    
-- A diferencia de la UPDATEdeclaración, si no especifica el valor de la columna en la SETcláusula, la REPLACEdeclaración utilizará el valor predeterminado de esa columna.
SELECT * FROM cities;

### Usando MySQL REPLACEpara insertar datos de una SELECT declaración
-- A continuación se ilustra la REPLACEdeclaración que inserta datos en una tabla con los datos que provienen de una consulta.
/*
REPLACE INTO table_1(column_list)
SELECT column_list
FROM table_2
WHERE where_condition;
*/

-- La siguiente declaración usa la REPLACE INTOdeclaración para copiar una fila dentro de la misma tabla:
REPLACE INTO 
    cities(name,population)
SELECT 
    name,
    population 
FROM 
   cities 
WHERE id = 1;