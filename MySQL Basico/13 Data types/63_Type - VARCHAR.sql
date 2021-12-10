/* VARCHAR Data Type */

-- MySQL VARCHARes la cadena de longitud variable cuya longitud puede ser de hasta 65,535. MySQL almacena un VARCHARvalor como un prefijo de longitud de 1 byte o 2 bytes más datos reales.

/*
Crearemos una nueva tabla que tiene dos columnas s1y s2con la longitud de 32765 (+2 para el prefijo de longitud) y 32766 (+2). Note que 32765 + 2 + 32766 + 2 = 65535, que es el tamaño máximo de fila.
*/

CREATE TABLE IF NOT EXISTS varchar_test (
    s1 VARCHAR(32765) NOT NULL,
    s2 VARCHAR(32766) NOT NULL
)  CHARACTER SET 'latin1' COLLATE LATIN1_DANISH_CI;


/*
La declaración creó la tabla con éxito. Sin embargo, si aumentamos la longitud de la s1columna en 1.
*/
CREATE TABLE IF NOT EXISTS varchar_test_2 (
    s1 VARCHAR(32766) NOT NULL, -- error
    s2 VARCHAR(32766) NOT NULL
)  CHARACTER SET 'latin1' COLLATE LATIN1_DANISH_CI;


-- MySQL emitirá el mensaje de error:

-- Error Code: 1118. Row size too large. The maximum row size for the used table type, not counting BLOBs, is 65535. This includes storage overhead, check the manual. You have to change some columns to TEXT or BLOBs 0.000 sec

/*
Como puede ver, el tamaño de la fila es demasiado grande y la declaración falló.

Si inserta una cadena cuya longitud es mayor que la longitud de una VARCHARcolumna, MySQL emitirá un error. Considere el siguiente ejemplo:
*/

CREATE TABLE items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(3)
);

INSERT INTO items(title)
VALUES('ABCD');

-- En este ejemplo, MySQL emitió el siguiente mensaje de error:

-- Error Code: 1406. Data too long for column 'title' at row 1 0.000 sec

### MySQL VARCHAR y espacios

-- MySQL no rellena el espacio cuando almacena los VARCHARvalores. Además, MySQL conserva los espacios finales cuando inserta o selecciona VARCHARvalores. Vea el siguiente ejemplo:

INSERT INTO items(title)
VALUES('AB ');

SELECT 
    id, title, length(title)
FROM
    items;
    
-- 