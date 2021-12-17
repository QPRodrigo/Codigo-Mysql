/* MySQL ENUM */
/*

En MySQL, an ENUMes un objeto de cadena cuyo valor se elige de una lista de valores permitidos definidos en el momento de la creación de la columna.

El ENUMtipo de datos ofrece las siguientes ventajas:

.- Almacenamiento de datos compacto. MySQL ENUMusa índices numéricos (1, 2, 3,…) para representar valores de cadena.
.- Consultas y resultados legibles.
*/

/*
CREATE TABLE table_name (
    ...
    col ENUM ('value1','value2','value3'),
    ...
);
*/

### Veamos el siguiente ejemplo.
-- Supongamos que tenemos que almacenar la información del ticket con la prioridad: baja, media y alta. Para asignar el tipo a la prioritycolumna ENUM, utilice la siguiente CREATE TABLEdeclaración:

CREATE TABLE tickets (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    priority ENUM('Low', 'Medium', 'High') NOT NULL
);

## Insertar ENUM valores de MySQL
-- Para insertar datos en una ENUMcolumna, utilice los valores de enumeración en la lista predefinida. Por ejemplo, la siguiente declaración inserta una nueva fila en la ticketstabla.
INSERT INTO tickets(title, priority)
VALUES('Scan virus for computer A', 'High');

-- Además de los valores de enumeración, puede utilizar el índice numérico del miembro de enumeración para insertar datos en una ENUMcolumna. Por ejemplo, la siguiente declaración inserta un nuevo ticket con la Lowprioridad:
INSERT INTO tickets(title, priority)
VALUES('Upgrade Windows OS for all computers', 1);

-- Agreguemos algunas filas más a la ticketstabla:
INSERT INTO tickets(title, priority)
VALUES('Install Google Chrome for Mr. John', 'Medium'),
      ('Create a new user for the new employee David', 'High');       

-- Debido a que definimos prioritycomo una NOT NULLcolumna, cuando inserta una nueva fila sin especificar el valor de la prioritycolumna, MySQL usará el primer miembro de enumeración como valor predeterminado.
INSERT INTO tickets(title)
VALUES('Refresh the computer of Ms. Lily');

## Filtrado de ENUMvalores de MySQL
-- La siguiente declaración obtiene todos los tickets de alta prioridad:
SELECT 
    *
FROM
    tickets
WHERE
    priority = 'High';

-- Debido a que el miembro de enumeración 'Alto' se asigna a 3, la siguiente consulta devuelve el mismo conjunto de resultados:
SELECT 
    *
FROM
    tickets
WHERE
    priority = 3;

### Ordenar ENUMvalores de MySQL
-- MySQL ordena los ENUM valores en función de sus números de índice. Por lo tanto, el orden de los miembros depende de cómo se definieron en la lista de enumeración.
SELECT 
    title, priority
FROM
    tickets
ORDER BY priority DESC;

