/* MySQL TIMESTAMP */

-- MySQL TIMESTAMPes un tipo de datos temporales que contiene la combinación de fecha y hora . El formato de un  TIMESTAMPdecir YYYY-MM-DD HH:MM:SSque se fija en 19 caracteres.

-- El TIMESTAMPvalor tiene un rango de '1970-01-01 00:00:01' UTCa '2038-01-19 03:14:07' UTC.

## TIMESTAMP Ejemplo de zona horaria de MySQL

-- Primero, creó una nueva tabla llamada test_timestampque tiene una TIMESTAMPcolumna t1:
CREATE TABLE test_timestamp (
    t1  TIMESTAMP
);

-- En segundo lugar, establezca la zona horaria de la sesión en '+00: 00' UTC utilizando la SET time_zonedeclaración.
SET time_zone='+00:00';

-- En tercer lugar, inserte un TIMESTAMPvalor en la test_timestamptabla.
INSERT INTO test_timestamp(t1)
VALUES('2008-01-01 00:00:01');

-- Cuarto, seleccione el TIMESTAMPvalor de la test_timestamptabla.
SELECT t1 FROM test_timestamp;

-- En quinto lugar, establezca la zona horaria de la sesión en una zona horaria diferente para ver qué valor obtendremos del servidor de la base de datos:
SET time_zone ='+03:00';

-- Finalmente, consulta los datos de la tabla:
SELECT t1 FROM test_timestamp;

### Inicialización y actualización automática de TIME STAMP columnas.
-- Primero, crea una tabla llamada   categories:
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- En segundo lugar, inserta una nueva fila en la categoriestabla sin especificar el valor de la created_atcolumna:
INSERT INTO categories(name) 
VALUES ('A');

SELECT * FROM categories;

-- En tercer lugar, agregue una nueva columna nombrada updated_ata la categoriestabla.
ALTER TABLE categories
ADD COLUMN updated_at 
  TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
  ON UPDATE CURRENT_TIMESTAMP;

-- Cuarto, inserta una nueva fila en la categoriestabla.
INSERT INTO categories(name)
VALUES('B');

-- En quinto lugar, consulte los datos de la categoriestabla:
SELECT * FROM categories;

-- En sexto lugar, actualice el valor en la columna namede la fila id 2:
UPDATE categories 
SET name = 'B+'
WHERE id = 2;

-- En séptimo lugar, consulte los datos de la categoriestabla para verificar la actualización:
SELECT *
FROM categories
WHERE id = 2;

-- Tenga en cuenta que si ejecuta la UPDATEinstrucción para actualizar el mismo valor para la namecolumna, la updated_atcolumna no se actualizará.
UPDATE categories 
SET name = 'B+'
WHERE id = 2;
