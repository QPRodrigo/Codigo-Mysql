/* INT */

### Usando MySQL INTpara un ejemplo de columna

-- Primero, cree una nueva tabla nombrada itemscon una columna de número entero como clave principal :

CREATE TABLE items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    item_text VARCHAR(255)
);

-- A continuación, la siguiente INSERT declaración inserta tres filas en la itemstabla.
INSERT INTO 
    items(item_text)
VALUES
    ('laptop'), 
    ('mouse'),
    ('headphone');
    
-- Luego, consulte los datos de la itemstabla utilizando la siguiente SELECT declaración:
SELECT * FROM items;

-- Después de eso, inserte una nueva fila cuyo valor de la item_idcolumna se especifique explícitamente.
INSERT INTO items(item_id,item_text)
VALUES(10,'Server');

-- Dado que el valor actual de la item_idcolumna es 10, la secuencia se restablece a 11. Si inserta una nueva fila, la AUTO_INCREMENTcolumna utilizará 11 como el siguiente valor.
INSERT INTO items(item_text)
VALUES('Router');

-- Finalmente, itemsvuelva a consultar los datos de la tabla para ver el resultado.
SELECT * FROM items;

### INT UNSIGNEDEjemplo de uso de MySQL

-- Primero, cree una tabla llamada classesque tenga la columna total_membercon el tipo de datos entero sin signo:

CREATE TABLE classes (
    class_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    total_member INT UNSIGNED,
    PRIMARY KEY (class_id)
);

-- En segundo lugar, inserte una nueva fila en la classestabla:
INSERT INTO classes(name, total_member)
VALUES('Weekend',100);

-- En tercer lugar, intente insertar un valor negativo en la total_membercolumna:
/*
INSERT INTO classes(name, total_member)
VALUES('Fly',-50);
*/

## MySQL INT con el atributo de ancho de visualización
/*
MySQL proporciona una extensión que le permite especificar el ancho de visualización junto con el INTtipo de datos. El ancho de visualización está envuelto entre paréntesis después de la INTpalabra clave, por ejemplo, INT(5)especifica un INTcon el ancho de visualización de cinco dígitos.

Es importante tener en cuenta que el atributo de ancho de visualización no controla los rangos de valores que la columna puede almacenar. Las aplicaciones suelen utilizar el atributo de ancho de visualización para formatear los valores enteros. MySQL incluye el atributo de ancho de visualización como metadatos del conjunto de resultados devuelto.
*/

### MySQL INTcon el ZEROFILL atributo
/*
Además del atributo de ancho de visualización, MySQL proporciona un ZEROFILLatributo no estándar . En este caso, MySQL reemplaza los espacios con cero. Considere el siguiente ejemplo.

Primero, cree una tabla llamada zerofill_tests:
*/

CREATE TABLE zerofill_tests(
    id INT AUTO_INCREMENT PRIMARY KEY,
    v1 INT(2) ZEROFILL,
    v2 INT(3) ZEROFILL,
    v3 INT(5) ZEROFILL
);

-- En segundo lugar, inserte una nueva fila en la zerofill_teststabla.
INSERT INTO zerofill_tests(v1,v2,v3)
VALUES(1,6,9);

-- En tercer lugar, consulte los datos de la zerofill_tests tabla.
SELECT 
    v1, v2, v3
FROM
    zerofill_tests;
    
/*
La v1columna tiene un ancho de visualización 2 incluido ZEROFILL.Su valor es 1, por lo tanto, se ve 01en la salida. MySQL reemplaza el primer espacio por 0.

La columna v2 tiene una pantalla con 3 incluidos  ZEROFILL. Su valor es 6, por lo tanto, verá 00como los ceros iniciales.

La columna v3 tiene un ancho de visualización de 5 con ZEROFILL, mientras que su valor es 9, por lo tanto, MySQL rellena 0000al comienzo del número en la salida.
*/
