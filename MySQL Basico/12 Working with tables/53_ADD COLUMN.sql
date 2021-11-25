/* ADD COLUMN Statement */

-- Para agregar una nueva columna a una tabla existente, use la instrucción ALTER TABLE de la ADD COLUMN

/*
ALTER TABLE table
ADD [COLUMN] column_name column_definition [FIRST|AFTER existing_column];
*/

### Ejemplos de MySQL ADD COLUMN

-- Primero, creamos una tabla nombrada vendorspara el propósito de demostración usando la siguiente declaración:
CREATE TABLE IF NOT EXISTS vendors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255)
);

-- En segundo lugar, agregamos una nueva columna nombrada phonea la vendorstabla. Debido a que especificamos la posición de la phonecolumna explícitamente después de la namecolumna, MySQL obedecerá esto.
ALTER TABLE vendors
ADD COLUMN phone VARCHAR(15) AFTER name;

-- En tercer lugar, agregamos una nueva columna nombrada vendor_groupa la vendorstabla. En este momento, no especificamos la posición de la nueva columna, por lo que MySQL agrega la  vendor_groupcolumna como la última columna de la vendorstabla.
ALTER TABLE vendors
ADD COLUMN vendor_group INT NOT NULL;

-- Vamos a insertar algunas filas en la vendorstabla.
INSERT INTO vendors(name,phone,vendor_group)
VALUES('IBM','(408)-298-2987',1);

INSERT INTO vendors(name,phone,vendor_group)
VALUES('Microsoft','(408)-298-2988',1);

-- Podemos consultar los datos de la vendorstabla para ver los cambios.
SELECT 
    id, name, phone,vendor_group
FROM
    vendors;

-- Cuarto, agregue dos columnas más emaily hourly_ratea la vendorstabla al mismo tiempo.
ALTER TABLE vendors
ADD COLUMN email VARCHAR(100) NOT NULL,
ADD COLUMN hourly_rate decimal(10,2) NOT NULL;

-- Revisemos los datos en la vendorstabla.
SELECT 
    id, name, phone, vendor_group, email, hourly_rate
FROM
    vendors;

-- Si agrega accidentalmente una columna que ya existe en la tabla, MySQL emitirá un error. Por ejemplo, si ejecuta la siguiente instrucción:
ALTER TABLE vendors
ADD COLUMN vendor_group INT NOT NULL;

-- En algunas situaciones, desea verificar si una columna ya existe en una tabla antes de agregarla. Sin embargo, no hay ninguna declaración como ADD COLUMN IF NOT EXISTSdisponible. Afortunadamente, puede obtener esta información de la columnstabla de la information_schemabase de datos como la siguiente consulta:
SELECT 
    IF(count(*) = 1, 'Exist','Not Exist') AS result
FROM
    information_schema.columns
WHERE
    table_schema = 'classicmodels'
        AND table_name = 'vendors'
        AND column_name = 'phone';
