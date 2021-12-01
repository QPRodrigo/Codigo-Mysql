/* Tipo Dato */

/*
Cada tipo de datos en MySQL se puede determinar mediante las siguientes características:

El tipo de valores que representa.
El espacio que ocupa y si los valores son de longitud fija o variable.
Los valores del tipo de datos se pueden indexar o no.
Cómo compara MySQL los valores de un tipo de datos específico.
*/

-- https://www.mysqltutorial.org/wp-content/uploads/0211/03/MySQL-Data-Types.jpg

## MySQL numeric data types

/*
En MySQL, puede encontrar todos los tipos numéricos estándar de SQL, incluido el tipo de datos numérico exacto y los tipos de datos numéricos aproximados, incluidos los números enteros, de coma fija y de coma flotante. 
*/

-- TINYINT:	Un número entero muy pequeño
-- SMALLINT:	Un pequeño entero
-- MEDIUMINT:	Un número entero de tamaño mediano
-- INT:	Un número entero estándar
-- BIGINT:	Un entero grande
-- DECIMAL:	Un número de coma fija
-- FLOAT:	Un número de punto flotante de precisión simple
-- DOUBLE:	Un número de coma flotante de doble precisión
-- BIT:	Un poco de campo

### Tipo de datos booleanos de MySQL
/*
MySQL no tiene el tipo integrado  BOOLEANo de BOOLdatos. Para representar valores booleanos, MySQL usa el tipo de entero más pequeño que es TINYINT(1). En otras palabras,  BOOLEANy BOOLson sinónimos deTINYINT(1).
*/

### Tipos de datos de cadenas de MySQL
/*
-- CHAR: Una cadena no binaria (de caracteres) de longitud fija
-- VARCHAR:	Una cadena no binaria de longitud variable
-- BINARY:	Una cadena binaria de longitud fija
-- VARBINARY:	Una cadena binaria de longitud variable
-- TINYBLOB:	Un BLOB muy pequeño (objeto binario grande)
-- BLOB:	Un pequeño BLOB
-- MEDIUMBLOB:	Un BLOB de tamaño mediano
-- LONGBLOB:	Un gran BLOB
-- TINYTEXT:	Una cadena no binaria muy pequeña
-- TEXT:	Una pequeña cadena no binaria
-- MEDIUMTEXT:	Una cadena no binaria de tamaño mediano
-- LONGTEXT:	Una cadena grande no binaria
-- ENUM:	Una enumeración; a cada valor de columna se le puede asignar un miembro de enumeración
-- SET: Un conjunto; a cada valor de columna se le puede asignar cero o más SETmiembros 
*/


### Tipos de datos de fecha y hora de MySQL
-- DATE:	Un valor de fecha en CCYY-MM-DDformato
-- TIME:	Un valor de tiempo en hh:mm:ssformato
-- DATETIME:	Un valor de fecha y hora en CCYY-MM-DD hh:mm:ssformato
-- TIMESTAMP:	Un valor de marca de tiempo en CCYY-MM-DD hh:mm:ssformato
-- YEAR:	Un valor de año en CCYYo YY formato

### Tipos de datos espaciales de MySQL
-- GEOMETRY:	Un valor espacial de cualquier tipo
-- POINT:	Un punto (un par de coordenadas XY)
-- LINESTRING:	Una curva (uno o más POINT valores)
-- POLYGON:	Un polígono
-- GEOMETRYCOLLECTION: Una colección de GEOMETRYvalores
-- MULTILINESTRING:	Una colección de LINESTRINGvalores
-- MULTIPOINT:	Una colección de POINTvalores
-- MULTIPOLYGON:	Una colección de POLYGONvalores

### Tipo de datos JSON
/*
MySQL admitió un JSONtipo de datos nativo desde la versión 5.7.8 que le permite almacenar y administrar documentos JSON de manera más efectiva. El tipo de datos JSON nativo proporciona una validación automática de documentos JSON y un formato de almacenamiento óptimo
*/