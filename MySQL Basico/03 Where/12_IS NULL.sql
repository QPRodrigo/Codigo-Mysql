/* IS NULL */

-- IS NULL: Para probar si un valor lo es NULLo no.

/*
SELECT 
    select_list
FROM
    table_name
WHERE
    search_condition IS NULL;
*/

USE classicmodels; 

-- Para buscar clientes que no tienen un representante de ventas
SELECT 
    customerName, 
    country, 
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NULL
ORDER BY 
    customerName; 

-- Para obtener los clientes que tienen un representante de ventas
SELECT 
    customerName, 
    country, 
    salesrepemployeenumber
FROM
    customers
WHERE
    salesrepemployeenumber IS NOT NULL
ORDER BY 
   customerName;
   
### MySQL IS NULL - características especializadas

## 1) Tratamiento de la fecha '0000-00-00'

# Si una columna DATEo DATETIMEtiene una NOT NULLrestricción y contiene una fecha especial '0000-00-00', puede usar el IS NULLoperador para encontrar dichas filas.

-- Primero, cree una tabla llamada projects:
CREATE TABLE IF NOT EXISTS projects (
    id INT AUTO_INCREMENT,
    title VARCHAR(255),
    begin_date DATE NOT NULL,
    complete_date DATE NOT NULL,
    PRIMARY KEY(id)
);

-- En segundo lugar, inserte algunas filas en la projectstabla:
/*INSERT INTO projects(title,begin_date, complete_date)
VALUES('New CRM','2020-01-01','0000-00-00'),
      ('ERP Future','2020-01-01','0000-00-00'),
      ('VR','2020-01-01','2030-01-01');
*/
-- En tercer lugar, use el IS NULL operador para seleccionar filas con los valores en la complete_datecolumna es '0000-00-00'.
SELECT * 
FROM projects
WHERE complete_date IS NULL;

## 2) Influencia de la @@sql_auto_is_nullvariable

-- Primero, establezca la variable @@sql_auto_is_nullen 1.
SET @@sql_auto_is_null = 1;

-- En segundo lugar, inserte una nueva fila en la projectstabla:
INSERT INTO projects(title,begin_date, complete_date)
VALUES('MRP III','2010-01-01','2020-12-31');

-- En tercer lugar, use el  IS NULLoperador para obtener el valor generado de la idcolumna:
SELECT 
    id
FROM
    projects
WHERE
    id IS NULL;