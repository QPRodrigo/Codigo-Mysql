/* MySQL JSON */

-- MySQL admite el tipo de datos JSON nativo desde la versión 5.7.8. El tipo de datos JSON nativo le permite almacenar documentos JSON de manera más eficiente que el formato de texto JSON en las versiones anteriores.

-- MySQL almacena documentos JSON en un formato interno que permite un acceso de lectura rápido a los elementos del documento. El formato binario JSON está estructurado de manera que permite al servidor buscar valores dentro del documento JSON directamente por clave o índice de matriz, lo cual es muy rápido.

## Para definir una columna cuyo tipo de datos es JSON, usa la siguiente sintaxis:

/*
CREATE TABLE table_name (
    ...
    json_column_name JSON,
    ... 
);
*/


## Ejemplo de tipo de datos MySQL JSON

-- Supongamos que tenemos que rastrear a los visitantes y sus acciones en nuestro sitio web. Algunos visitantes pueden simplemente ver las páginas y otros pueden ver las páginas y comprar los productos. Para almacenar esta información, crearemos una nueva tabla llamada events.
CREATE TABLE events( 
  id int auto_increment primary key, 
  event_name varchar(255), 
  visitor varchar(255), 
  properties json, 
  browser json
);

-- Cada evento en la tabla de eventos tiene un idque identifica de forma única al evento. Un evento también tiene un nombre, por ejemplo, página vista, compra, etc. La visitorcolumna se usa para almacenar la información del visitante.

-- Las columnas propertiesy browserson las columnas JSON. Se utilizan para almacenar las propiedades de un evento y la especificación del navegador que los visitantes utilizan para navegar por el sitio web.

-- Vamos a insertar algunos datos en la eventstabla:
INSERT INTO events(event_name, visitor,properties, browser) 
VALUES (
  'pageview', 
   '1',
   '{ "page": "/" }',
   '{ "name": "Safari", "os": "Mac", "resolution": { "x": 1920, "y": 1080 } }'
),
('pageview', 
  '2',
  '{ "page": "/contact" }',
  '{ "name": "Firefox", "os": "Windows", "resolution": { "x": 2560, "y": 1600 } }'
),
(
  'pageview', 
  '1',
  '{ "page": "/products" }',
  '{ "name": "Safari", "os": "Mac", "resolution": { "x": 1920, "y": 1080 } }'
),
(
  'purchase', 
   '3',
  '{ "amount": 200 }',
  '{ "name": "Firefox", "os": "Windows", "resolution": { "x": 1600, "y": 900 } }'
),
(
  'purchase', 
   '4',
  '{ "amount": 150 }',
  '{ "name": "Firefox", "os": "Windows", "resolution": { "x": 1280, "y": 800 } }'
),
(
  'purchase', 
  '4',
  '{ "amount": 500 }',
  '{ "name": "Chrome", "os": "Windows", "resolution": { "x": 1680, "y": 1050 } }'
);

-- Para extraer valores de las columnas JSON, usa el operador de ruta de columna ( ->).
SELECT id, browser->'$.name' browser
FROM events;

-- Esta consulta devuelve el siguiente resultado:
/*
+----+-----------+
| id | browser   |
+----+-----------+
|  1 | "Safari"  |
|  2 | "Firefox" |
|  3 | "Safari"  |
|  4 | "Firefox" |
|  5 | "Firefox" |
|  6 | "Chrome"  |
+----+-----------+
6 rows in set (0.00 sec)
*/

-- Observe que los datos de la browsercolumna están rodeados por comillas. Para eliminar las comillas, utilice el operador de ruta en línea ( ->>) de la siguiente manera:
SELECT id, browser->>'$.name' browser
FROM events;

-- Como puede ver en el siguiente resultado, se eliminaron las comillas:
/*
+----+---------+
| id | browser |
+----+---------+
|  1 | Safari  |
|  2 | Firefox |
|  3 | Safari  |
|  4 | Firefox |
|  5 | Firefox |
|  6 | Chrome  |
+----+---------+
6 rows in set (0.00 sec)
*/

-- Para obtener el uso del navegador, puede utilizar la siguiente declaración:
SELECT browser->>'$.name' browser, 
      count(browser)
FROM events
GROUP BY browser->>'$.name';

-- El resultado de la consulta es el siguiente:
/*
+---------+----------------+
| browser | count(browser) |
+---------+----------------+
| Safari  |              2 |
| Firefox |              3 |
| Chrome  |              1 |
+---------+----------------+
3 rows in set (0.02 sec)
*/

-- Para calcular los ingresos totales del visitante, utilice la siguiente consulta:
SELECT visitor, SUM(properties->>'$.amount') revenue
FROM events
WHERE properties->>'$.amount' > 0
GROUP BY visitor;

-- Aquí está el resultado:
/*
+---------+---------+
| visitor | revenue |
+---------+---------+
| 3       |     200 |
| 4       |     650 |
+---------+---------+
2 rows in set (0.00 sec)
*/


