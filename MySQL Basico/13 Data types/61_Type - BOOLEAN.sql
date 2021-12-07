/* BOOLEAN */

-- Cero se considera falso y el valor distinto de cero se considera verdadero. Para usar literales booleanos, usa las constantes TRUEy FALSEeso evalúa a 1 y 0 respectivamente.

### Ejemplo de MySQL BOOLEAN

/* MySQL almacena el valor booleano en la tabla como un número entero. Para demostrar esto, veamos la siguiente taskstabla: */

CREATE TABLE tasks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    completed BOOLEAN
);

-- Aunque especificamos la columna completa como BOOLEAN, cuando mostramos la definición de la tabla , es TINYINT(1)como sigue:
DESCRIBE tasks;

-- La siguiente declaración inserta 2 filas en la taskstabla:
INSERT INTO tasks(title,completed)
VALUES('Master MySQL Boolean type',true),
      ('Design database table',false); 

-- Antes de guardar datos en la columna booleana, MySQL los convierte en 1 o 0. La siguiente consulta recupera datos de la taskstabla:
SELECT 
    id, title, completed
FROM
    tasks; 

-- Como puede ver, truey falsese convirtieron en 1 y 0.
-- Dado que booleano es TINYINT(1), puede insertar un valor distinto de 1 y 0 en la columna booleana. Considere el siguiente ejemplo:
INSERT INTO tasks(title,completed)
VALUES('Test Boolean with a number',2);

-- Si desea generar el resultado como truey false, puede usar la IFfunción de la siguiente manera:
SELECT 
    id, 
    title, 
    IF(completed, 'true', 'false') completed
FROM
    tasks;

## Operadores BOOLEAN de MySQL
-- Para obtener todas las tareas completadas en la taskstabla, puede generar la siguiente consulta:
SELECT 
    id, title, completed
FROM
    tasks
WHERE
    completed = TRUE;

-- Como puede ver, solo devolvió la tarea con el completedvalor 1. Para solucionarlo, debe usar el ISoperador:

SELECT 
    id, title, completed
FROM
    tasks
WHERE
    completed IS TRUE;

-- En este ejemplo, usamos el ISoperador para probar un valor con un valor booleano.

-- Para obtener las tareas pendientes, usa IS FALSEo de la IS NOT TRUEsiguiente manera:
SELECT 
    id, title, completed
FROM
    tasks
WHERE
    completed IS NOT TRUE
