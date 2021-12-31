/* Natural Sorting */

### Configurar una mesa de muestra

-- Primero, cree una nueva tabla nombrada itemsusando la siguiente  CREATE TABLEdeclaración:
CREATE TABLE items (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_no VARCHAR(255) NOT NULL
);

-- En segundo lugar, inserte algunas filas en la itemstabla:
INSERT INTO items(item_no)
VALUES ('1'),
       ('1C'),
       ('10Z'),
       ('2A'),
       ('2'),
       ('3C'),
       ('20D');

-- En tercer lugar, consulte los datos de la itemstabla ordenados por item_no:

SELECT 
    item_no
FROM
    items
ORDER BY item_no;


### Ejemplos de ordenación natural de MySQL

-- Para solucionar este problema, primero dividimos la item_nocolumna en 2 columnas: prefixy suffix. La prefixcolumna almacena la parte numérica de la item_noy la suffixcolumna almacena la parte alfabética. Luego, podemos ordenar los datos en función de estas columnas como se muestra en la siguiente consulta:

SELECT 
    CONCAT(prefix, suffix)
FROM
    items
ORDER BY 
    prefix , suffix;

-- Si los item_nodatos están en un formato bastante estándar, puede utilizar la siguiente consulta para realizar una clasificación natural sin cambiar la estructura de la tabla.

SELECT 
    item_no
FROM
    items
ORDER BY CAST(item_no AS UNSIGNED) , item_no;


-- En esta consulta, primero, convertimos los item_nodatos en un entero sin signo usando el tipo de conversión . En segundo lugar, usamos la ORDER BYcláusula para ordenar las filas numéricamente primero y luego alfabéticamente.
TRUNCATE TABLE items;

INSERT INTO items(item_no)
VALUES('A-1'),
      ('A-2'),
      ('A-3'),
      ('A-4'),
      ('A-5'),
      ('A-10'),
      ('A-11'),
      ('A-20'),
      ('A-30');
      
      
-- Para lograr este resultado, podemos usar la LENGTH función. Observe que la LENGTHfunción devuelve la longitud de una cadena. La idea es ordenar los item_nodatos por longitud primero y luego por valor de columna como la siguiente consulta:
SELECT 
    item_no
FROM
    items
ORDER BY LENGTH(item_no) , item_no;


