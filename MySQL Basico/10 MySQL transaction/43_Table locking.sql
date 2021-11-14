/* Table Locking */

-- El bloqueo de MySQL para los accesos a tablas cooperativos entre sesiones.

-- Antes de continuar, creemos una tabla con el nombre messagespara practicar con las declaraciones de bloqueo de tablas.

CREATE TABLE messages ( 
    id INT NOT NULL AUTO_INCREMENT, 
    message VARCHAR(100) NOT NULL, 
    PRIMARY KEY (id) 
);


/*
LOCK TABLES table_name [READ | WRITE]
*/


/*
LOCK TABLES table_name1 [READ | WRITE], 
            table_name2 [READ | WRITE],
             ... ;
*/

-- UNLOCK TABLESDeclaración de MySQL
/*
UNLOCK TABLES;
*/

/*

READ Cerraduras
Un READ candado tiene las siguientes características:

READ Varias sesiones al mismo tiempo pueden adquirir un candado para una mesa. Además, otras sesiones pueden leer datos de la tabla sin adquirir el bloqueo.
La sesión que mantiene el READbloqueo solo puede leer datos de la tabla, pero no puede escribir. Y otras sesiones no pueden escribir datos en la tabla hasta READque se libere el bloqueo. Las operaciones de escritura de otra sesión se pondrán en estado de espera hasta READque se libere el bloqueo.
Si la sesión finaliza, ya sea normal o anormalmente, MySQL liberará todos los bloqueos implícitamente. Esta característica también es relevante para la WRITEcerradura.

*/


-- En la primera sesión, primero, conéctese a la base de datos y use la CONNECTION_ID() función para obtener el ID de conexión actual de la siguiente manera:
SELECT CONNECTION_ID();

-- Luego, inserte una nueva fila en la messagestabla.
INSERT INTO messages(message) 
VALUES('Hello');

-- A continuación, consulte los datos en la messagestabla.
SELECT * FROM messages;

-- Después de eso, adquiera un candado usando la LOCK TABLEdeclaración.
LOCK TABLE messages READ;

-- Finalmente, intente insertar una nueva fila en la messagestabla:
/*

INSERT INTO messages(message) 
VALUES('Hi');

*/

-- Primero, conéctese a la base de datos y verifique la identificación de la conexión:
SELECT CONNECTION_ID();

-- A continuación, consulte los datos de la messages  tabla:
SELECT * FROM messages;

-- Luego, inserte una nueva fila en la messagestabla:
INSERT INTO messages(message) 
VALUES('Bye');

-- Desde la primera sesión, use la SHOW PROCESSLISTdeclaración para mostrar información detallada:
SHOW PROCESSLIST;

-- Finalmente, verifique los datos de la messagestabla para ver si la INSERToperación de la segunda sesión realmente se ejecutó.
SELECT * FROM messages;

# Bloqueos de escritura

-- Primero, adquiera un WRITEcandado desde la primera sesión.
LOCK TABLE messages WRITE;

-- Luego, inserte una nueva fila en la messagestabla.
INSERT INTO messages(message) 
VALUES('Good Moring');

-- A continuación, consulte los datos de la messagestabla.
SELECT * FROM messages;

-- Después de eso, desde la segunda sesión, intente escribir y leer datos:
INSERT INTO messages(message) 
VALUES('Bye Bye');

SELECT * FROM messages;

-- MySQL pone estas operaciones en estado de espera. Puede comprobarlo utilizando el SHOW PROCESSLISTestado de cuenta.

SHOW PROCESSLIST;

-- Finalmente, suelte el bloqueo de la primera sesión.
UNLOCK TABLES;
