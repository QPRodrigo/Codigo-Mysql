/* Generated COLUMNS */

### Introducción a la columna generada por MySQL
DROP TABLE IF EXISTS contacts;

CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- Para obtener el nombre completo de un contacto, utilice la CONCAT()función de la siguiente manera:
SELECT 
    id, 
    CONCAT(first_name, ' ', last_name), 
    email
FROM
    contacts;

-- Al utilizar la columna generada por MySQL, puede volver a crear la contactstabla de la siguiente manera:
DROP TABLE IF EXISTS contacts;

CREATE TABLE contacts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    fullname varchar(101) GENERATED ALWAYS AS (CONCAT(first_name,' ',last_name)),
    email VARCHAR(100) NOT NULL
);

-- El GENERATED ALWAYS as (expression)es la sintaxis para la creación de una columna generada. Para probar la fullnamecolumna,  inserta una fila en la contactstabla.
INSERT INTO contacts(first_name,last_name, email)
VALUES('john','doe','john.doe@mysqltutorial.org');

-- Ahora, puede consultar datos de la contactstabla.
SELECT 
    *
FROM
    contacts;

### Sintaxis de la columna generada por MySQL
/*
column_name data_type [GENERATED ALWAYS] AS (expression)
   [VIRTUAL | STORED] [UNIQUE [KEY]]
*/

### Ejemplo de columna almacenada de MySQL
-- Los datos de  quantityInStocky las buyPricecolumnas nos permiten calcular el valor de la acción por SKU usando la siguiente expresión:
quantityInStock * buyPrice

-- Sin embargo, podemos agregar una columna generada almacenada nombrada stock_valuea la productstabla usando la siguiente ALTER TABLE ...ADD COLUMNdeclaración:
ALTER TABLE products
ADD COLUMN stockValue DOUBLE 
GENERATED ALWAYS AS (buyprice*quantityinstock) STORED;

-- Por lo general, la ALTER TABLEdeclaración requiere una reconstrucción completa de la tabla, por lo tanto, si cambia las tablas grandes, lleva mucho tiempo. Sin embargo, este no es el caso de la columna virtual.
SELECT 
    productName, 
    ROUND(stockValue, 2) stock_value
FROM
    products;