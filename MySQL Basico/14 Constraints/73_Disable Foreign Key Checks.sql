/* Disable Foreign Key Checks */

-- Para deshabilitar las comprobaciones de claves externas, establezca la foreign_key_checksvariable en cero de la siguiente manera:
SET foreign_key_checks = 0;

-- Para volver a habilitar la verificación de restricción de clave externa, establezca el valor de foreign_key_checksen 1:
SET foreign_key_checks = 1;


## Deshabilitar el ejemplo de verificación de clave externa

-- Primero, cree una nueva tabla llamada countries:
CREATE TABLE countries(
    country_id INT AUTO_INCREMENT,
    country_name VARCHAR(255) NOT NULL,
    PRIMARY KEY(country_id)
) ENGINE=InnoDB;


-- En segundo lugar, cree otra tabla llamada cities:
CREATE TABLE cities(
    city_id INT AUTO_INCREMENT,
    city_name VARCHAR(255) NOT NULL,
    country_id INT NOT NULL,
    PRIMARY KEY(city_id),
    FOREIGN KEY(country_id) 
		REFERENCES countries(country_id)
)ENGINE=InnoDB;

-- La tabla citiestiene una restricción de clave externa que hace referencia a la columna country_idde la tabla countries.

-- En tercer lugar, inserte una nueva fila en la citiestabla:
/*
INSERT INTO cities(city_name, country_id)
VALUES('New York',1);
*/

/*
MySQL emitió el siguiente error:
Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`classicmodels`.`cities`, CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `countries` (`country_id`))
*/

-- En cuarto lugar, desactive las comprobaciones de claves externas:
SET foreign_key_checks = 0;

-- En quinto lugar, inserte una nueva fila en la citiestabla:
INSERT INTO cities(city_name, country_id)
VALUES('New York',1);

-- Esta vez, la INSERTdeclaración se ejecutó con éxito debido a que la verificación de clave externa se deshabilitó.

-- La siguiente consulta devuelve el contenido de la tabla cities:
SELECT * FROM cities;

-- En sexto lugar, vuelva a habilitar la verificación de restricción de clave externa:
SET foreign_key_checks = 1;

-- Cuando se volvieron a habilitar las comprobaciones de clave externa, MySQL no volvió a validar los datos en la tabla. Sin embargo, no le permitirá insertar o actualizar datos que violen la restricción de clave externa.

-- Finalmente, inserte una fila en la countriestabla cuyo valor en la columna country_idsea ​​1 para que los datos sean consistentes en ambas tablas:
INSERT INTO countries(country_id, country_name)
VALUES(1,'USA');

### Eliminar tablas que tienen restricciones de clave externa
-- Primero, suelte la mesa countries:
/*
DROP TABLE countries;

MySQL emitió este error:
Error Code: 3730. Cannot drop table 'countries' referenced by a foreign key constraint 'cities_ibfk_1' on table 'cities'.
*/

-- En segundo lugar, desactive la verificación de clave externa:
SET foreign_key_checks = 0;

-- En tercer lugar, elimine ambas tablas countriesy cities:
DROP TABLE countries;
DROP TABLE cities;

-- Ambas declaraciones se ejecutaron con éxito.
-- Finalmente, habilite la verificación de clave externa:
SET foreign_key_checks = 1;
