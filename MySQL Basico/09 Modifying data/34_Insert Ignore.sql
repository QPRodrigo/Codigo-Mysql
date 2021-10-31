/* INSERT IGNORE */

-- las filas con datos no válidos que causan el error se ignoran y las filas con datos válidos se insertan en la tabla.

/*

INSERT IGNORE INTO table(column_list)
VALUES( value_list),
      ( value_list),
      ...

*/

### INSERT IGNORE

-- Crearemos una nueva mesa llamada subscriberspara la demostración.
CREATE TABLE subscribers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50) NOT NULL UNIQUE
);

-- La siguiente declaración inserta una nueva fila en la   subscriberstabla:
INSERT INTO subscribers(email)
VALUES('john.doe@gmail.com');

-- Ejecutemos otra declaración que inserte dos filas en la   subscriberstabla: Devuelve un error.
INSERT INTO subscribers(email) 
VALUES('john.doe@gmail.com'), 
      ('jane.smith@ibm.com');

--  si usa la INSERT IGNOREinstrucción en su lugar.
INSERT IGNORE INTO subscribers(email)
VALUES('john.doe@gmail.com'), 
      ('jane.smith@ibm.com');


### Para encontrar el detalle de la advertencia, puede usar el SHOW WARNINGS comando como se muestra a continuación:

-- Primero, creamos una nueva tabla llamada tokens:
CREATE TABLE tokens (
    s VARCHAR(6)
);


-- En segundo lugar, inserte una cuerda cuya longitud sea siete en la tokenstabla. error
INSERT INTO tokens VALUES('abcdefg');

-- En tercer lugar, use la INSERT IGNOREdeclaración para insertar la misma cadena.
INSERT IGNORE INTO tokens VALUES('abcdefg');