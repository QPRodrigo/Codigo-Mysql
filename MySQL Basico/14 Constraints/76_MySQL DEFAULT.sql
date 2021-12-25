/* MySQL DEFAULT */

### Introducción a la restricción DEFAULT de MySQL

-- La DEFAULTrestricción de MySQL le permite especificar un valor predeterminado para una columna. Aquí está la sintaxis de la DEFAULTrestricción:

/*
column_name data_type DEFAULT default_value;
*/


## Ejemplo de restricción de MySQL DEFAULT
-- En el siguiente ejemplo se crea una nueva tabla llamada cart_itemscon cuatro columnas item_id, name, quantity, y sales_tax:
CREATE TABLE cart_items 
(
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price DEC(5,2) NOT NULL,
    sales_tax DEC(5,2) NOT NULL DEFAULT 0.1,
    CHECK(quantity > 0),
    CHECK(sales_tax >= 0) 
);

-- La sales_taxcolumna tiene un valor predeterminado de 0,1 (10%). La siguiente declaración muestra la cart_itemstabla:
/*
DESC cart_items;
*/

-- La siguiente INSERTdeclaración agrega un nuevo elemento a la cart_itemstabla:
INSERT INTO cart_items(name, quantity, price)
VALUES('Keyboard', 1, 50);

-- En este ejemplo, la INSERTdeclaración no proporciona un valor para la sales_taxcolumna. La sales_taxcolumna usa el valor predeterminado especificado en la DEFAULTrestricción:
SELECT * FROM cart_items;

-- Además, puede usar explícitamente la DEFAULTpalabra clave cuando inserta una nueva fila en la cart_itemstabla:
INSERT INTO cart_items(name, quantity, price, sales_tax)
VALUES('Battery',4, 0.25 , DEFAULT);

-- En este caso, la sales_taxcolumna toma el valor predeterminado:
SELECT * FROM cart_items;

### Agregar una restricción DEFAULT a una columna
-- Para agregar una restricción predeterminada a una columna de una tabla existente, use la ALTER TABLEdeclaración:
ALTER TABLE table_name
ALTER COLUMN column_name SET DEFAULT default_value;

-- El siguiente ejemplo agrega una DEFAULTrestricción a la quantitycolumna de la cart_itesmtabla:
ALTER TABLE cart_items
ALTER COLUMN quantity SET DEFAULT 1;

-- Si describe la cart_itemstabla, verá los cambios:
/*
DESC cart_items;
*/

-- La siguiente declaración inserta una nueva fila en la cart_itemstabla sin especificar un valor para la quantitycolumna:
INSERT INTO cart_items(name, price, sales_tax)
VALUES('Maintenance services',25.99, 0)

-- El valor de la quantitycolumna se establecerá por defecto en 1:
SELECT * FROM cart_items;

### Eliminar una restricción DEFAULT de una columna
-- Para eliminar una DEFAULTrestricción de una columna, usa la ALTER TABLEdeclaración:
ALTER TABLE table_name
ALTER column_name DROP DEFAULT;

-- El siguiente ejemplo elimina la DEFAULTrestricción de la quantitycolumna de la cart_itemstabla:
ALTER TABLE cart_items
ALTER COLUMN quantity DROP DEFAULT;

/*
Y aquí está la nueva cart_itemsestructura:
DESC cart_items;
*/
