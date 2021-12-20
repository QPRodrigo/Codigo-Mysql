/* Clave principal de MySQL */

/*
Una clave principal es una columna o un conjunto de columnas que identifica de forma única cada fila de la tabla. La clave principal sigue estas reglas:

-- Una clave primaria debe contener valores únicos. Si la clave principal consta de varias columnas, la combinación de valores en estas columnas debe ser única.
-- Una columna de clave principal no puede tener NULLvalores. Cualquier intento de insertar o actualizar NULL las columnas de clave primaria resultará en un error. Tenga en cuenta que MySQL agrega implícitamente una NOT NULLrestricción a las columnas de clave principal.
-- Una tabla puede tener una sola clave primaria.
*/

## PRIMARY KEY Ejemplos de MySQL

-- Defina una PRIMARY KEY restricción enCREATE TABLE
/*
CREATE TABLE table_name(
    primary_key_column datatype PRIMARY KEY,
    ...
);
*/

-- Cuando la clave principal tiene más de una columna, debe usar la PRIMARY KEY restricción como restricción de tabla.
/*
CREATE TABLE table_name(
    primary_key_column1 datatype,
    primary_key_column2 datatype,
    ...,
    PRIMARY KEY(column_list)
);
*/

-- La PRIMARY KEYrestricción de tabla se puede utilizar cuando la clave principal tiene una columna:
/*
CREATE TABLE table_name ( 
    primary_key_column datatype, 
    ... ,
    PRIMARY KEY(primary_key_column)
);
*/

-- El siguiente ejemplo crea una tabla denominada userscuya clave principal es la user_idcolumna:
CREATE TABLE users(
   user_id INT AUTO_INCREMENT PRIMARY KEY,
   username VARCHAR(40),
   password VARCHAR(255),
   email VARCHAR(255)
);

-- Esta declaración crea la rolestabla que tiene la PRIMARY KEYrestricción como restricción de tabla:
CREATE TABLE roles(
   role_id INT AUTO_INCREMENT,
   role_name VARCHAR(50),
   PRIMARY KEY(role_id)
);

-- El siguiente ejemplo crea la user_rolestabla cuya clave principal consta de dos columnas: user_idy role_id. Define la PRIMARY KEYrestricción como la restricción de la tabla:
CREATE TABLE user_roles(
   user_id INT,
   role_id INT,
   PRIMARY KEY(user_id,role_id),
   FOREIGN KEY(user_id) 
       REFERENCES users(user_id),
   FOREIGN KEY(role_id) 
       REFERENCES roles(role_id)
);

## Defina PRIMARY KEY restricciones usandoALTER TABLE

-- Si una tabla, por alguna razón, no tiene una clave principal, puede usar la ALTER TABLE instrucción para agregar una clave principal a la tabla de la siguiente manera:
ALTER TABLE table_name
ADD PRIMARY KEY(column_list);

-- Primero, cree la pkdemostabla sin una clave principal.
CREATE TABLE pkdemos(
   id INT,
   title VARCHAR(255) NOT NULL
);

-- En segundo lugar, agregue una clave principal a la pkdemostabla usando la ALTER TABLEdeclaración:
ALTER TABLE pkdemos
ADD PRIMARY KEY(id);

-- PRIMARY KEYvs. UNIQUE KEY vs.KEY
/*
KEYes el sinónimo de  INDEX. Utilice  KEYcuando desee crear un índice para una columna o un conjunto de columnas que no sea parte de una clave principal o clave única .

Un UNIQUEíndice asegura que los valores en una columna deben ser únicos. A diferencia del PRIMARYíndice, MySQL permite NULLvalores en el UNIQUEíndice. Además, una tabla puede tener varios UNIQUEíndices.

Suponga que emaily usernamede los usuarios de la userstabla deben ser únicos. Para hacer cumplir estas reglas, puede definir UNIQUEíndices para las columnas emaily usernamecomo la siguiente declaración:
*/
-- Agregue un  UNIQUEíndice para la usernamecolumna:
ALTER TABLE users
ADD UNIQUE INDEX username_unique (username ASC) ;

-- Agregue un  UNIQUEíndice para la emailcolumna:
ALTER TABLE users
ADD UNIQUE INDEX  email_unique (email ASC) ;
