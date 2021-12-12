/* Type - TEXT de MySQL */

## TINYTEXT - 255 bytes (255 caracteres)
-- Debe usar TINYTEXTpara la columna que requiere menos de 255 caracteres, tiene una longitud inconsistente y no requiere clasificación, como el extracto de una publicación de blog y el resumen de un artículo.
CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    summary TINYTEXT
);


## TEXT - 64 KB (65,535 caracteres)
-- El TEXTtipo de datos puede contener hasta 64 KB, lo que equivale a 65535 (2 ^ 16 - 1) caracteres. TEXTtambién requiere 2 bytes de sobrecarga.
ALTER TABLE articles 
ADD COLUMN body TEXT NOT NULL
AFTER summary;


## MEDIUMTEXT - 16 MB (16.777.215 caracteres)
-- El MEDIUMTEXTpuede almacenar hasta 16 MB de datos de texto que es equivalente a 16.777.215 caracteres. Requiere una sobrecarga de 3 bytes.
CREATE TABLE whitepapers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    body MEDIUMTEXT NOT NULL,
    published_on DATE NOT NULL
); 


## LONGTEXT - 4GB (4.294.967.295 caracteres)
-- El LONGTEXT puede almacenar datos de texto de hasta 4 GB, que es mucho. Requiere 4 bytes de sobrecarga.
