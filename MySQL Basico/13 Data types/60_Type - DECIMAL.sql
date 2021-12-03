/* DECIMAL Data Type */

-- Primero, cree una nueva tabla nombrada materials con tres columnas: id, descripción y costo

/*
CREATE TABLE materials (
    id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255),
    cost DECIMAL(19 , 4 ) NOT NULL
);
*/

-- En segundo lugar, inserte datos en la materialstabla.
/*
INSERT INTO materials(description,cost)
VALUES('Bicycle', 500.34),('Seat',10.23),('Break',5.21);
*/

-- En tercer lugar, consulte los datos de la materialstabla.
/*
SELECT 
    *
FROM
    materials;
*/

-- Cuarto, cambie la columna de costo para incluir el ZEROFILLatributo.
/*
ALTER TABLE materials
MODIFY cost DECIMAL(19,4) zerofill;
*/

-- En quinto lugar, vuelva a consultar la tabla de materiales.
/*
SELECT 
    *
FROM
    materials;
*/
