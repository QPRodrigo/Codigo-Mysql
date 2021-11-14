/* Selecting a MySQL DATABASE */

-- Mostrarle cómo usar la instrucción USE para configurar la base de datos actual.

### Seleccionar una base de datos MySQL usando la herramienta cliente mysql

-- Primero, inicie sesión en MySQL con la rootcuenta de usuario:
-- mysql -u root -p
-- MySQL le pedirá una contraseña:
-- Enter password: 

-- Para iniciar sesión, debe proporcionar la contraseña correcta de la rootcuenta de usuario y presionar Enter. Para mostrar la base de datos actual, utilice la siguiente declaración:

-- SELECT database();

-- Devolverá lo siguiente:
/*
+------------+
| database() |
+------------+
| NULL       |
+------------+
1 row in set (0.00 sec)
*/

-- Significa que la base de datos actual no está configurada. Si emite una declaración, MySQL emitirá un error. Por ejemplo:
-- SELECT * FROM t;

/*
Error:

ERROR 1046 (3D000): No database selected
Lenguaje de código:  texto  sin formato ( texto sin formato )
Para seleccionar una base de datos con la que trabajar, use la USEdeclaración:
-- USE database_name;
*/

-- Por ejemplo, la siguiente declaración usa la declaración USE para configurar la base de datos actual en modelos clásicos:
-- USE classicmodels;

-- Si ve el siguiente mensaje, significa que ha cambiado la base de datos classicmodels correctamente:
-- Database changed

-- Para verificarlo, puede usar la instrucción select database ():
-- SELECT database();

-- Devolverá algo como:
/*

+---------------+
| database()    |
+---------------+
| classicmodels |
+---------------+
1 row in set (0.00 sec)

*/

-- Si la base de datos de modelos clásicos no existe, obtendrá el siguiente error después de ejecutar la USEdeclaración:
-- ERROR 1049 (42000): Unknown database 'classicmodels'

-- En este caso, necesita encontrar qué bases de datos están disponibles en su servidor usando la declaración show database:
-- SHOW DATABASES;
-- La salida puede tener el siguiente aspecto:
/*
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.02 sec)
*/

-- Seleccionar una base de datos al iniciar sesión
/*

Si sabe con qué base de datos desea trabajar antes de iniciar sesión, puede usar la -Dmarca. Por ejemplo, el siguiente comando se conecta a la classicmodelsbase de datos con la cuenta de usuario root:

*/

-- mysql -u root -D classicmodels -p

-- En este comando, especificamos la base de datos classicmodelsdespués de la -Dbandera.
-- Después de ingresar la contraseña e iniciar sesión correctamente, puede verificar la base de datos actual:

-- SELECT database();

-- Producción:
/*
+---------------+
| database()    |
+---------------+
| classicmodels |
+---------------+
*/