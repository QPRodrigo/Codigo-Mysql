/* ALTER TABLE */

-- Declaración MySQL para agregar una columna, modificar una columna, cambiar el nombre de una columna, eliminar una columna y cambiar el nombre de una tabla.

/*

CREATE TABLE vehicles (
    vehicleId INT,
    year INT NOT NULL,
    make VARCHAR(100) NOT NULL,
    PRIMARY KEY(vehicleId)
);

*/

### MySQL ALTER TABLE: agregar columnas a una tabla

--  Agregar una columna a una tabla
/*
ALTER TABLE table_name
ADD 
    new_column_name column_definition
    [FIRST | AFTER column_name]
*/

/*
ALTER TABLE vehicles
ADD model VARCHAR(100) NOT NULL;
*/

/*
DESCRIBE vehicles;
*/


### Agregue varias columnas a una tabla
-- Para agregar varias columnas a una tabla, utilice la siguiente forma de la ALTER TALE ADDdeclaración:
/*
ALTER TABLE table_name
    ADD new_column_name column_definition
    [FIRST | AFTER column_name],
    ADD new_column_name column_definition
    [FIRST | AFTER column_name],
    ...;
*/
-- Por ejemplo, esta declaración agrega dos columnas colory notea la vehiclestabla:
/*
ALTER TABLE vehicles
ADD color VARCHAR(50),
ADD note VARCHAR(255);
*/
-- Esta declaración muestra la nueva estructura de la vehiclestabla:
/*
DESCRIBE vehicles;
*/

### MySQL ALTER TABLE: modificar columnas
-- 1) Modificar una columna
/*
ALTER TABLE table_name
MODIFY column_name column_definition
[ FIRST | AFTER column_name];    
*/

-- Primero, muestre la lista de columnas de la vehiclestabla:
/*
DESCRIBE vehicles;
*/

-- Luego, modifique la notecolumna:
/*
ALTER TABLE vehicles 
MODIFY note VARCHAR(100) NOT NULL;
*/

-- Finalmente, muestre la lista de columnas de la vehiclestabla para verificar el cambio:
/*
DESCRIBE vehicles;
*/


### Modificar varias columnas
/*
ALTER TABLE table_name
    MODIFY column_name column_definition
    [ FIRST | AFTER column_name],
    MODIFY column_name column_definition
    [ FIRST | AFTER column_name],
    ...;
*/
-- Primero, muestre las columnas actuales de la vehiclestabla:

-- En segundo lugar, use la ALTER TABLE MODIFYdeclaración para modificar varias columnas:
/*
ALTER TABLE vehicles 
MODIFY year SMALLINT NOT NULL,
MODIFY color VARCHAR(20) NULL AFTER make;
*/

### MySQL ALTER TABLE: cambiar el nombre de una columna en una tabla
/*
ALTER TABLE table_name
    CHANGE COLUMN original_name new_name column_definition
    [FIRST | AFTER column_name];
*/
-- El siguiente ejemplo usa la ALTER TABLE CHANGE COLUMNdeclaración para cambiar el nombre de la columna notea vehicleCondition:
/*
ALTER TABLE vehicles 
CHANGE COLUMN note vehicleCondition VARCHAR(100) NOT NULL;
*/

-- Repasemos la lista de columnas de la vehiclestabla:
/*
DESCRIBE vehicles;
*/

### MySQL ALTER TABLE- Suelta una columna
-- Para colocar una columna en una tabla, usa la ALTER TABLE DROP COLUMNdeclaración:
/*
ALTER TABLE table_name
DROP COLUMN column_name;
*/

-- Este ejemplo muestra cómo eliminar la vehicleConditioncolumna de la vehiclestabla:
/*
ALTER TABLE vehicles
DROP COLUMN vehicleCondition;
*/

### MySQL ALTER TABLE- Cambiar nombre de tabla
-- Para cambiar el nombre de una tabla , usa la ALTER TABLE RENAME TOdeclaración:
/*
ALTER TABLE table_name
RENAME TO new_table_name;
*/

/*
ALTER TABLE vehicles 
RENAME TO cars; 
*/