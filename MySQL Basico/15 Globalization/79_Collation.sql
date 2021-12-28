/* Collation */

-- Es un conjunto de reglas que se utilizan para comparar caracteres en un conjunto de caracteres en particular . Cada juego de caracteres en MySQL tiene al menos una intercalación predeterminada. Y puede tener más de una colación y. Sin embargo, dos conjuntos de caracteres no pueden tener la misma intercalación.

/*
SHOW CHARACTER SET;
*/

-- Para obtener todas las intercalaciones de un conjunto de caracteres determinado, utilice la SHOW COLLATION  declaración de la siguiente manera:
SHOW COLLATION LIKE 'character_set_name%';

-- Por ejemplo, la siguiente declaración obtiene todas las intercalaciones para el latin1conjunto de caracteres:
SHOW COLLATION LIKE 'latin1%';

### 1.- Establecer conjuntos de caracteres e intercalaciones a nivel de servidor

-- MySQL usa latin1como conjunto de caracteres predeterminado. Por lo tanto, la intercalación predeterminada es latin1_swedish_ci. Puede cambiar esta configuración al iniciar el servidor.

-- La siguiente declaración establece el conjunto de caracteres utf8 y la utf8_unicode_cscolación para el servidor a través de la línea de comando:

>mysqld --character-set-server=utf8 --collation-server=utf8_unicode_cs

### 2.- Establecer conjuntos de caracteres y colaciones a nivel de base de datos

-- Cuando crea una base de datos pero no especifica el conjunto de caracteres y la intercalación, MySQL utilizará el conjunto de caracteres predeterminado y la intercalación del servidor para la nueva base de datos.

-- Puede anular la configuración predeterminada en el nivel de la base de datos mediante la CREATE DATABASEinstrucción:

CREATE DATABASE database_name
CHARACTER SET character_set_name
COLLATE collation_name;

-- o usando la ALTER DATABASEdeclaración:

ALTER DATABASE database_name
CHARACTER SET character_set_name
COLLATE collation_name;

### 3.- Establecer conjuntos de caracteres y colaciones a nivel de tabla

-- Una base de datos puede contener tablas con conjuntos de caracteres y colaciones que son diferentes del conjunto de caracteres y la colación de la base de datos.

-- Puede especificar el conjunto de caracteres y la intercalación predeterminados para una tabla cuando crea la tabla mediante la CREATE TABLEinstrucción:

CREATE TABLE table_name(
   ...
)
CHARACTER SET character_set_name
COLLATE collation_name;

-- o cuando altera la tabla usando la ALTER TABLE  declaración:
ALTER TABLE table_name(
  ...
)
CHARACTER SET character_set_name
COLLATE collation_name;

### 4.- Establecer el juego de caracteres y la clasificación a nivel de columna

-- Una columna de tipo CHAR, VARCHARo TEXTpuede tener su propio conjunto de caracteres y colación diferente del conjunto de caracteres y colación de la tabla.

-- La instrucción CREATE TABLEy le ALTER TABLEpermite anular el juego de caracteres y la intercalación para una columna específica:

column_name [CHAR | VARCHAR | TEXT] (length)
CHARACTER SET character_set_name
COLLATE collation_name


### Ejemplos de configuración de conjuntos de caracteres y colaciones

-- Primero, cree una nueva base de datos con utf8 como conjunto de caracteres y utf8_unicode_cicomo colación predeterminada:

CREATE DATABASE mydb
CHARACTER SET utf8
COLLATE UTF8_UNICODE_CI;

-- En segundo lugar, cree una nueva tabla nombrada t1en la mydbbase de datos:

USE mydb;
 
CREATE TABLE t1(
    c1 char(25)
);

-- En tercer lugar, cambie el conjunto de caracteres y la clasificación de la tabla t1a latin1y latin1_german1_ci:

ALTER TABLE t1
CHARACTER SET latin1
COLLATE latin1_german1_ci;

-- Finalmente, cambie el juego de caracteres de la c1columna a latin1:
ALTER TABLE t1
MODIFY c1 VARCHAR(25)
CHARACTER SET latin1;
