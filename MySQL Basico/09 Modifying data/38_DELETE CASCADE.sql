/* DELETE CASCADE */

-- MySQL proporciona una forma más efectiva llamada ON DELETE CASCADEacción referencial para una clave externa que le permite eliminar datos de las tablas secundarias automáticamente cuando elimina los datos de la tabla principal.

/*

DELETE FROM buildings 
WHERE building_no = 2;

*/

### Los siguientes son pasos que demuestran cómo funciona la ON DELETE CASCADE  acción referencial.

-- Paso 1 . Crea la buildingstabla
CREATE TABLE buildings (
    building_no INT PRIMARY KEY AUTO_INCREMENT,
    building_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL
);

-- Paso 2 . Crea la roomstabla:
CREATE TABLE rooms (
    room_no INT PRIMARY KEY AUTO_INCREMENT,
    room_name VARCHAR(255) NOT NULL,
    building_no INT NOT NULL,
    FOREIGN KEY (building_no)
        REFERENCES buildings (building_no)
        ON DELETE CASCADE
);

-- Paso 3 . Inserte filas en la buildingstabla:
INSERT INTO buildings(building_name,address)
VALUES('ACME Headquaters','3950 North 1st Street CA 95134'),
      ('ACME Sales','5000 North 1st Street CA 95134');

-- Paso 4 . Consultar datos de la buildingstabla:
SELECT * FROM buildings;

-- Paso 5 . Inserte filas en la roomstabla:
INSERT INTO rooms(room_name,building_no)
VALUES('Amazon',1),
      ('War Room',1),
      ('Office of CEO',1),
      ('Marketing',2),
      ('Showroom',2);
      
-- Paso 6 . Consultar datos de la roomstabla:
SELECT * FROM rooms;

-- Paso 7 . Eliminar el edificio con el edificio no. 2:
DELETE FROM buildings 
WHERE building_no = 2;

-- Paso 8 . Consultar datos de la roomstabla:
SELECT * FROM rooms;

### Consejos para encontrar tablas afectadas por la ON DELETE CASCADE acción de MySQL

USE information_schema;

SELECT 
    table_name
FROM
    referential_constraints
WHERE
    constraint_schema = 'database_name'
        AND referenced_table_name = 'parent_table'
        AND delete_rule = 'CASCADE'