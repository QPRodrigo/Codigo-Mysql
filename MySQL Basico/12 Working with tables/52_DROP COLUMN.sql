/* DROP COLUMN */

-- Cómo eliminar una columna de una tabla usando la DROP COLUMNdeclaración MySQL.

/*
ALTER TABLE table_name
DROP COLUMN column_name;
*/

USE classicmodels;

### DROP COLUMN Ejemplos de MySQL.
-- Primero,  cree una tabla con el nombre postsde la demostración.
CREATE TABLE posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    excerpt VARCHAR(400),
    content TEXT,
    created_at DATETIME,
    updated_at DATETIME
);

-- A continuación, use la ALTER TABLE DROP COLUMNdeclaración para eliminar la excerptcolumna:
ALTER TABLE posts
DROP COLUMN excerpt;

-- Luego, vea la estructura de la tabla usando la DESCRIBEdeclaración:
DESCRIBE posts;

-- Después de eso, use la ALTER TABLE DROP COLUMNdeclaración para eliminar las columnas created_aty updated_at:
ALTER TABLE posts
DROP COLUMN created_at,
DROP COLUMN updated_at;

-- Finalmente, use la DESCRIBEdeclaración para verificar la eliminación:
DESCRIBE posts;

### MySQL suelta una columna que es un ejemplo de clave externa

-- Primero, cree una tabla llamada categories:
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

-- En segundo lugar, agregue una columna nombrada category_ida la poststabla.
ALTER TABLE posts 
ADD COLUMN category_id INT NOT NULL;

-- En tercer lugar, haga que la category_idcolumna sea una columna de clave externa que haga referencia a la idcolumna de la categoriestabla.
ALTER TABLE posts 
ADD CONSTRAINT fk_cat 
FOREIGN KEY (category_id) 
REFERENCES categories(id);

-- Cuarto, suelte la category_idcolumna de la poststabla.
ALTER TABLE posts
DROP COLUMN category_id;