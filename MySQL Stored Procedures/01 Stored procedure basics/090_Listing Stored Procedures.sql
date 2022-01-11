/* Listing Stored Procedures */

### Listado de procedimientos almacenados mediante instrucción SHOW PROCEDURE STATUS

/*
SHOW PROCEDURE STATUS [LIKE 'pattern' | WHERE search_condition]
*/


-- La instrucción muestra todas las características de los procedimientos almacenados, incluidos los nombres de los procedimientos almacenados. Devuelve procedimientos almacenados a los que tiene un privilegio para acceder.SHOW PROCEDURE STATUS
SHOW PROCEDURE STATUS;

-- Si solo desea mostrar procedimientos almacenados en una base de datos determinada, puede utilizar una cláusula en el como se muestra en la siguiente instrucción:WHERESHOW PROCEDURE STATUS
SHOW PROCEDURE STATUS WHERE search_condition;

-- Por ejemplo, esta instrucción enumera todos los procedimientos almacenados en la base de datos de ejemplo:classicmodels
SHOW PROCEDURE STATUS WHERE db = 'classicmodels';

-- En caso de que desee encontrar procedimientos almacenados cuyos nombres contengan una palabra específica, puede utilizar la cláusula de la siguiente manera:LIKE
SHOW PROCEDURE STATUS LIKE '%pattern%'

-- La siguiente instrucción muestra todos los procedimientos almacenados cuyos nombres contienen la palabra:Order
SHOW PROCEDURE STATUS LIKE '%Order%'

### Listado de procedimientos almacenados mediante el diccionario de datos

-- La tabla de la base de datos contiene toda la información sobre los procedimientos almacenados y las funciones almacenadas de todas las bases de datos en el servidor MySQL actual.routinesinformation_schema
/*
SELECT 
    routine_name
FROM
    information_schema.routines
WHERE
    routine_type = 'PROCEDURE'
        AND routine_schema = '<database_name>';
*/

-- Por ejemplo, esta instrucción enumera todos los procedimientos almacenados de la base de datos:classicmodels
SELECT 
    routine_name
FROM
    information_schema.routines
WHERE
    routine_type = 'PROCEDURE'
        AND routine_schema = 'classicmodels';










