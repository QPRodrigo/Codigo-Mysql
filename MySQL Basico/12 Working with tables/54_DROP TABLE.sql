/* DROP TABLE */

-- Para eliminar una tabla de la base de datos.

/*

DROP [TEMPORARY] TABLE [IF EXISTS] table_name [, table_name] ...
[RESTRICT | CASCADE]

*/

### Uso de MySQL DROP TABLEpara eliminar un ejemplo de una sola tabla
-- Primero, cree una tabla con el nombre insurancespara fines de prueba:
CREATE TABLE insurances (
    id INT AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    effectiveDate DATE NOT NULL,
    duration INT NOT NULL,
    amount DEC(10 , 2 ) NOT NULL,
    PRIMARY KEY(id)
);

-- En segundo lugar, use DROP TABLEpara eliminar la insurancestabla:

DROP TABLE insurances;

### Usar MySQL DROP TABLEpara eliminar varias tablas
-- Primero, cree dos tablas con el nombre CarAccessoriesy CarGadgets:

CREATE TABLE CarAccessories (
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DEC(10 , 2 ) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE CarGadgets (
    id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price DEC(10 , 2 ) NOT NULL,
    PRIMARY KEY(id)
);

-- En segundo lugar, use la DROP TABLEdeclaración para eliminar las dos tablas:

DROP TABLE CarAccessories, CarGadgets;

### Usar MySQL DROP TABLEpara eliminar una tabla que no existe
-- Esta declaración intenta eliminar una tabla que no existe:

DROP TABLE aliens;

-- Sin embargo, si usa la IF EXISTSopción en la DROP TABLEdeclaración:

DROP TABLE IF EXISTS aliens;

### MySQL DROP TABLE basado en un patrón
-- Desafortunadamente, MySQL no tiene la DROP TABLE LIKEdeclaración que pueda eliminar tablas en función de la coincidencia de patrones:
DROP TABLE LIKE '%pattern%'

-- En primer lugar, crear tres mesas test1, test2, test4para la demostración:
CREATE TABLE test1(
  id INT AUTO_INCREMENT,
  PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS test2 LIKE test1;
CREATE TABLE IF NOT EXISTS test3 LIKE test1;

-- En segundo lugar, declare dos variables que acepten el esquema de la base de datos y un patrón que desee que coincidan las tablas:

-- set table schema and pattern matching for tables
SET @schema = 'classicmodels';
SET @pattern = 'test%';

-- En tercer lugar, construya una DROP TABLEdeclaración dinámica :

-- construct dynamic sql (DROP TABLE tbl1, tbl2...;)
SELECT CONCAT('DROP TABLE ',GROUP_CONCAT(CONCAT(@schema,'.',table_name)),';')
INTO @droplike
FROM information_schema.tables
WHERE @schema = database()
AND table_name LIKE @pattern;

-- Cuarto, muestre el SQL dinámico para verificar si funciona correctamente:

-- display the dynamic sql statement
SELECT @droplike;

-- En quinto lugar, ejecute la declaración utilizando una declaración preparada  como se muestra en la siguiente consulta:

-- execute dynamic sql
PREPARE stmt FROM @droplike;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Poniendolo todo junto.

-- set table schema and pattern matching for tables
SET @schema = 'classicmodels';
SET @pattern = 'test%';

-- build dynamic sql (DROP TABLE tbl1, tbl2...;)
SELECT CONCAT('DROP TABLE ',GROUP_CONCAT(CONCAT(@schema,'.',table_name)),';')
INTO @droplike
FROM information_schema.tables
WHERE @schema = database()
AND table_name LIKE @pattern;

-- display the dynamic sql statement
SELECT @droplike;

-- execute dynamic sql
PREPARE stmt FROM @droplike;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
