/* CHAR */

-- El CHARtipo de datos es un tipo de carácter de longitud fija en MySQL. A menudo declara el CHARtipo con una longitud que especifica el número máximo de caracteres que desea almacenar. Por ejemplo, CHAR(20)puede contener hasta 20 caracteres.

-- Primero, crea una tabla con una CHARcolumna.
CREATE TABLE mysql_char_test (
    status CHAR(3)
);

-- En segundo lugar, inserte dos filas en la mysql_char_testtabla.
INSERT INTO mysql_char_test(status)
VALUES('Yes'),('No');

-- En tercer lugar, use la función de longitud para obtener la longitud de cada CHARvalor.
SELECT 
    status, 
    LENGTH(status)
FROM
    mysql_char_test;

-- Cuarto, inserta un CHARvalor con los espacios iniciales y finales.
INSERT INTO mysql_char_test(status)
VALUES(' Y ');

-- Finalmente, consulte los valores insertados, verá que MySQL elimina los espacios finales.
SELECT 
    status, 
    LENGTH(status)
FROM
    mysql_char_test;

### Comparando CHAR valores de MySQL 
-- Al almacenar o comparar los CHARvalores, MySQL usa la intercalación del juego de caracteres asignada a la columna.
SELECT * 
FROM mysql_char_test
WHERE status = 'Y';

-- MySQL no devuelve ninguna fila porque no considera el espacio final. Para que coincida con la 'Y', debemos eliminar el espacio final de la siguiente manera:
SELECT *
FROM mysql_char_test
WHERE status = ' Y';

### MySQL CHARe UNIQUE índice
-- Si la CHARcolumna tiene un UNIQUEíndice e inserta un valor que es diferente de un valor existente en varios espacios finales, MySQL rechazará los cambios debido a un error de clave duplicada.

-- Primero, cree un índice único para la statuscolumna de la mysql_char_test tabla.
CREATE UNIQUE INDEX uidx_status 
ON mysql_char_test(status);

-- En segundo lugar, inserte una nueva fila en la mysql_char_testtabla.
INSERT INTO mysql_char_test(status)
VALUES('N');

-- En tercer lugar, insertar el siguiente valor provocará un error de clave duplicada.
/*INSERT INTO mysql_char_test(status)
VALUES('N ');*/