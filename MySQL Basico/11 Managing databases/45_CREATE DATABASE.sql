/* CREATE DATABASE */

-- Para crear una nueva base de datos a través de la herramienta cliente mysql

/*
CREATE DATABASE [IF NOT EXISTS] database_name
[CHARACTER SET charset_name]
[COLLATE collation_name]
*/

### Creando una nueva base de datos usando la herramienta de cliente mysql

/*
Para crear una nueva base de datos a través de la herramienta cliente mysql, siga estos pasos:

Primero, inicie sesión en el servidor MySQL con una cuenta de usuario que tenga el CREATE DATABASEprivilegio:
*/

-- mysql -u root -p

/*
Le pedirá que ingrese una contraseña. Para autenticarse, debe escribir la contraseña de la rootcuenta de usuario y presionar la Entertecla.

A continuación, muestre las bases de datos actuales disponibles en el servidor utilizando la SHOW DATABASESdeclaración. Este paso es opcional.
*/

-- SHOW DATABASES;

/*
Producción:
*/

/*

+--------------------+
| Database           |
+--------------------+
| classicmodels      |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

*/

/*
Luego, emita el CREATE DATABASEcomando con un nombre de base de datos, por ejemplo, testdby presione Enter:
*/

-- CREATE DATABASE testdb;

/*
Devolverá lo siguiente:
*/

-- Query OK, 1 row affected (0.02 sec)

/*
Después de eso, use el SHOW CREATE DATABASEcomando para revisar la base de datos creada:
*/
-- SHOW CREATE DATABASE testdb;

/*
Finalmente, seleccione la base de datos recién creada para trabajar usando la USEdeclaración:
*/ 
-- USE testdb;