/* DROP DATABASE */

-- Declaración MySQL para eliminar una base de datos existente en el servidor.

/* DROP DATABASE [IF EXISTS] database_name; */

### MySQL DROP DATABASE usando el ejemplo del programa mysql

-- Primero, inicie sesión en MySQL Server usando el rootusuario:
/*
mysql -u root -p
*/

-- Escriba la contraseña del rootusuario y presione Entrar.
/*
Enter password: ********
*/

-- En segundo lugar, muestre todas las bases de datos usando la SHOW DATABASESdeclaración:

/*
SHOW DATABASES;
*/

-- Producción:

/*

+--------------------+
| Database           |
+--------------------+
| classicmodels      |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| testdb             |
| testdb2            |
+--------------------+
7 rows in set (0.00 sec)

*/

-- En tercer lugar, elimine la testdbbase de datos emitiendo la DROP DATABASE declaración:

/*
DROP DATABASE testdb;
*/