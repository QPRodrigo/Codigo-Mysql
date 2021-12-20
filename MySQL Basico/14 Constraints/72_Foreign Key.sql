/* MySQL Foreign Key */

-- Una clave externa es una columna o grupo de columnas en una tabla que se vincula a una columna o grupo de columnas en otra tabla. La clave externa impone restricciones a los datos de las tablas relacionadas, lo que permite que MySQL mantenga la integridad referencial.

### FOREIGN KEY Sintaxis de MySQL

-- Aquí está la sintaxis básica para definir una restricción de clave externa en la instrucción CREATE TABLEo ALTER TABLE:
/*
[CONSTRAINT constraint_name]
FOREIGN KEY [foreign_key_name] (column_name, ...)
REFERENCES parent_table(colunm_name,...)
[ON DELETE reference_option]
[ON UPDATE reference_option]
*/


### FOREIGN KEYEjemplos de MySQL
-- Creemos una nueva base de datos llamada fkdemopara la demostración.
CREATE DATABASE fkdemo;

USE fkdemo;

### RESTRICT y NO ACTION acciones
-- Dentro de la fkdemobase de datos, cree dos tablas categoriesy products:
CREATE TABLE categories(
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL
) ENGINE=INNODB;

CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
        REFERENCES categories(categoryId)
) ENGINE=INNODB;

/*
El categoryIdde la productstabla es la columna de clave externa que se refiere a la categoryIdcolumna de la  categoriestabla.

Debido a que no especificamos ninguna cláusula ON UPDATEy ON DELETE, la acción predeterminada es RESTRICTpara la operación de actualización y eliminación.
*/

-- Los siguientes pasos ilustran la RESTRICTacción.

# 1.- Inserte dos filas en la categoriestabla:
INSERT INTO categories(categoryName)
VALUES
    ('Smartphone'),
    ('Smartwatch');

# 2.- Seleccione los datos de la categoriestabla:
SELECT * FROM categories;

# 3.- Inserte una nueva fila en la productstabla:
INSERT INTO products(productName, categoryId)
VALUES('iPhone',1);

# 4.- Intente insertar una nueva fila en la productstabla con un categoryId  valor que no existe en la categoriestabla:
/*
INSERT INTO products(productName, categoryId)
VALUES('iPad',3);
*/

# 5.- Actualice el valor en la categoryIdcolumna de la categoriestabla a 100:
/*
UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;
*/

### CASCADE action
-- 1.- Suelta la productsmesa:
DROP TABLE products;

-- 2.- Cree la productstabla con las opciones ON UPDATE CASCADEy ON DELETE CASCADEpara la clave externa:
CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT NOT NULL,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
    REFERENCES categories(categoryId)
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ENGINE=INNODB;

-- 3.- Inserte cuatro filas en la productstabla:
INSERT INTO products(productName, categoryId)
VALUES
    ('iPhone', 1), 
    ('Galaxy Note',1),
    ('Apple Watch',2),
    ('Samsung Galary Watch',2);


-- 4.- Seleccione los datos de la productstabla:
SELECT * FROM products;

-- 5.- Actualice categoryId1 a 100 en la categoriestabla:
UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;

-- 6.- Verifique la actualización:
SELECT * FROM categories;

-- 7.- Obtenga datos de la productstabla:
SELECT * FROM products;

-- 8.- Elimina categoryId2 de la categoriestabla:
DELETE FROM categories
WHERE categoryId = 2;

-- 9.- Verifique la eliminación:
SELECT * FROM categories;

-- 10.- Consulta la productstabla:
SELECT * FROM products;

## SET NULL acción

-- 1.- Suelta ambas categoriesy productstablas:
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS products;

-- 2.- Cree las tablas categoriesy products:
CREATE TABLE categories(
    categoryId INT AUTO_INCREMENT PRIMARY KEY,
    categoryName VARCHAR(100) NOT NULL
)ENGINE=INNODB;

CREATE TABLE products(
    productId INT AUTO_INCREMENT PRIMARY KEY,
    productName varchar(100) not null,
    categoryId INT,
    CONSTRAINT fk_category
    FOREIGN KEY (categoryId) 
        REFERENCES categories(categoryId)
        ON UPDATE SET NULL
        ON DELETE SET NULL 
)ENGINE=INNODB;

-- 3.- Inserte filas en la categoriestabla:
INSERT INTO categories(categoryName)
VALUES
    ('Smartphone'),
    ('Smartwatch');

-- 4.- Inserte filas en la productstabla:
INSERT INTO products(productName, categoryId)
VALUES
    ('iPhone', 1), 
    ('Galaxy Note',1),
    ('Apple Watch',2),
    ('Samsung Galary Watch',2);

-- 5.- Actualice categoryIdde 1 a 100 en la categoriestabla:
UPDATE categories
SET categoryId = 100
WHERE categoryId = 1;

-- 6.- Verifique la actualización:
SELECT * FROM categories;

-- 7.- Seleccione los datos de la productstabla:
-- Las filas con el categoryId1 en la productstabla se establecieron automáticamente NULLdebido a la ON UPDATE SET NULLacción.

-- 8.- Elimina el categoryId2 de la categoriestabla:
DELETE FROM categories 
WHERE categoryId = 2;

-- 9.- Consulta la productstabla:
SELECT * FROM products;

### Elimina las restricciones de clave externa de MySQL
-- Para eliminar una restricción de clave externa, usa la ALTER TABLEdeclaración:
/*
ALTER TABLE table_name 
DROP FOREIGN KEY constraint_name;
*/

-- Para obtener el nombre de restricción generado de una tabla, use la SHOW CREATE TABLEdeclaración:
SHOW CREATE TABLE table_name;

-- Por ejemplo, para ver las claves externas de la productstabla, use la siguiente instrucción:
SHOW CREATE TABLE products;

-- Y esta declaración elimina la restricción de clave externa de la productstabla:
ALTER TABLE products 
DROP FOREIGN KEY fk_category;

-- Para asegurarse de que se haya eliminado la restricción de clave externa, puede ver la estructura de la tabla de productos:
SHOW CREATE TABLE products;

### Deshabilitar las comprobaciones de claves foráneas
-- Para deshabilitar las comprobaciones de claves externas, utilice la siguiente declaración:
SET foreign_key_checks = 0;

-- Y puede habilitarlo usando la siguiente declaración:
SET foreign_key_checks = 1;