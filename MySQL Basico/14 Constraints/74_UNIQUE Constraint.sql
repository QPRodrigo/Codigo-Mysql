/* UNIQUE Constraint */

-- Restricción para imponer la unicidad de los valores en una columna o un grupo de columnas en una tabla.

### Introducción a la UNIQUE restricción de MySQL

-- Para definir una UNIQUErestricción para una columna cuando crea una tabla , use esta sintaxis:
CREATE TABLE table_name(
    ...,
    column_name data_type UNIQUE,
    ...
);

-- Para definir una UNIQUE  restricción para dos o más columnas, utilice la siguiente sintaxis:
CREATE TABLE table_name(
   ...
   column_name1 column_definition,
   column_name2 column_definition,
   ...,
   UNIQUE(column_name1,column_name2)
);

-- Si define una UNIQUErestricción sin especificar un nombre, MySQL genera automáticamente un nombre para ella. Para definir una UNIQUErestricción con un nombre, usa esta sintaxis:
[CONSTRAINT constraint_name]
UNIQUE(column_list)

### UNIQUE Ejemplo de restricción de MySQL
-- Primero, crea una nueva tabla nombrada supplierscon las dos UNIQUErestricciones:
CREATE TABLE suppliers (
    supplier_id INT AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE,
    address VARCHAR(255) NOT NULL,
    PRIMARY KEY (supplier_id),
    CONSTRAINT uc_name_address UNIQUE (name , address)
);

-- En este ejemplo, la primera UNIQUErestricción se define para la phonecolumna:
-- phone VARCHAR(12) NOT NULL UNIQUE

-- Y la segunda restricción es para el bothnombre y las addresscolumnas:
-- CONSTRAINT uc_name_address UNIQUE (name , address)

-- En segundo lugar, inserte una fila en la supplierstabla.
INSERT INTO suppliers(name, phone, address) 
VALUES( 'ABC Inc', 
       '(408)-908-2476',
       '4000 North 1st Street');

--- En tercer lugar, intente insertar un proveedor diferente pero tenga el número de teléfono que ya existe en la supplierstabla.
INSERT INTO suppliers(name, phone, address) 
VALUES( 'XYZ Corporation','(408)-908-2476','3000 North 1st Street');

-- MySQL emitió un error:
/*
Error Code: 1062. Duplicate entry '(408)-908-2476' for key 'phone'
*/

-- Cuarto, cambie el número de teléfono por uno diferente y ejecute la instrucción de inserción nuevamente.
INSERT INTO suppliers(name, phone, address) 
VALUES( 'XYZ Corporation','(408)-908-3333','3000 North 1st Street');

-- En quinto lugar, inserte una fila en la supplierstabla con valores que ya existen en las columnas namey address:
INSERT INTO suppliers(name, phone, address) 
VALUES( 'ABC Inc', 
       '(408)-908-1111',
       '4000 North 1st Street');

-- MySQL emitió un error porque se violó la UNIQUErestricción uc_name_address.
/*
Error Code: 1062. Duplicate entry 'ABC Inc-4000 North 1st Street' for key 'uc_name_address'
*/

### UNIQUE Restricciones e índices de MySQL

-- La SHOW CREATE TABLEdeclaración muestra la definición de la supplierstabla:
SHOW CREATE TABLE suppliers;

-- La siguiente SHOW INDEXdeclaración muestra todos los índices asociados con la supplierstabla.
SHOW INDEX FROM suppliers;

### Eliminar una restricción única
-- Para eliminar una UNIQUErestricción, use can use DROP INDEXor ALTER TABLEstatement:
DROP INDEX index_name ON table_name;

ALTER TABLE table_name
DROP INDEX index_name;

-- Por ejemplo, la siguiente declaración elimina la uc_name_address restricción de la supplierstabla:
DROP INDEX uc_name_address ON suppliers;

-- SHOW INDEXVuelva a ejecutar la instrucción para verificar si uc_name_uniquese ha eliminado la restricción.
SHOW INDEX FROM suppliers;

### Agregar nueva restricción única
-- Lo siguiente ALTER TABLE ADD CONSTRAINTagrega una restricción única a una columna de una tabla existente:
ALTER TABLE table_name
ADD CONSTRAINT constraint_name 
UNIQUE (column_list);

-- Esta declaración agrega una UNIQUErestricción uc_name_addressa la supplierstabla:
ALTER TABLE suppliers
ADD CONSTRAINT uc_name_address 
UNIQUE (name,address);
