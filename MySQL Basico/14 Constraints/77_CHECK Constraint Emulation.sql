/* CHECK Constraint Emulation */

### Emular CHECK restricciones mediante disparadores

-- Para emular CHECKrestricciones en MySQL, puede usar dos disparadores : BEFORE INSERTy BEFORE UPDATE.

-- Primero, cree una nueva tabla con el nombre   parts de la demostración:
CREATE TABLE IF NOT EXISTS parts (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10 , 2 ) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- A continuación, cree un procedimiento almacenado para verificar los valores en las columnas costy price.
DELIMITER $

CREATE PROCEDURE `check_parts`(IN cost DECIMAL(10,2), IN price DECIMAL(10,2))
BEGIN
    IF cost < 0 THEN
        SIGNAL SQLSTATE '45000'
           SET MESSAGE_TEXT = 'check constraint on parts.cost failed';
    END IF;
    
    IF price < 0 THEN
	SIGNAL SQLSTATE '45001'
	   SET MESSAGE_TEXT = 'check constraint on parts.price failed';
    END IF;
    
    IF price < cost THEN
	SIGNAL SQLSTATE '45002'
           SET MESSAGE_TEXT = 'check constraint on parts.price & parts.cost failed';
    END IF;
END$
DELIMITER ;

-- Luego, crea  BEFORE INSERT y BEFORE UPDATEdispara. Dentro de los desencadenadores, llame al check_parts()procedimiento almacenado.
-- before insert
DELIMITER $
CREATE TRIGGER `parts_before_insert` BEFORE INSERT ON `parts`
FOR EACH ROW
BEGIN
    CALL check_parts(new.cost,new.price);
END$   
DELIMITER ; 
-- before update
DELIMITER $
CREATE TRIGGER `parts_before_update` BEFORE UPDATE ON `parts`
FOR EACH ROW
BEGIN
    CALL check_parts(new.cost,new.price);
END$   
DELIMITER ;

/*
Después de eso, inserte una nueva fila que cumpla con todas las siguientes condiciones:

.- costo> 0
.- Y precio> 0
.- Y precio> = costo
*/

INSERT INTO parts(part_no, description,cost,price)
VALUES('A-001','Cooler',100,120);

-- ILa INSERTdeclaración invoca el BEFORE INSERTdisparador y acepta los valores.

-- La siguiente INSERTdeclaración falla porque viola la condición: costo> 0.
/*
INSERT INTO parts(part_no, description,cost,price)
VALUES('A-002','Heater',-100,120);
*/

-- La siguiente INSERTdeclaración falla porque viola la condición: precio> 0.
/*
INSERT INTO parts(part_no, description,cost,price)
VALUES('A-002','Heater',100,-120);
*/
-- Veamos qué tenemos ahora en la partsmesa.
SELECT * FROM parts;

-- La siguiente declaración intenta actualizar el costo para hacerlo más bajo que el precio:
/*
UPDATE parts
SET price = 10
WHERE part_no = 'A-001';
*/

### Emule CHECK restricciones usando vistas
/*
La idea es crear una vista WITH CHECK OPTIONbasada en la tabla subyacente. En la SELECTdeclaración de la definición de vista, seleccionamos solo filas válidas que satisfacen las CHECKcondiciones. Cualquier inserción o actualización en la vista será rechazada si hace que la nueva fila no aparezca en la vista.
*/

-- Primero, suelte la partstabla para eliminar todos los activadores asociados y cree una nueva tabla como la partstabla pero con un nombre diferente parts_data:
DROP TABLE IF EXISTS parts;

CREATE TABLE IF NOT EXISTS parts_data (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10,2) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- A continuación, cree una vista nombrada partssegún la parts_datatabla. Al hacer esto, podemos mantener partsintacto el código de las aplicaciones que usan la tabla. Además, todos los privilegios de la partsmesa anterior permanecen sin cambios.

CREATE VIEW parts AS
    SELECT 
        part_no, description, cost, price
    FROM
        parts_data
    WHERE
        cost > 0 AND price > 0 AND price >= cost 
WITH CHECK OPTION;

-- Luego, inserte una nueva fila en la parts_datatabla a través de la partsvista:
INSERT INTO parts(part_no, description,cost,price)
VALUES('A-001','Cooler',100,120);

-- Se acepta porque es válida la nueva fila que aparece en la vista.
-- Después de eso, intente insertar una nueva fila que no aparecería en la vista.
/*
INSERT INTO parts_checked(part_no, description,cost,price)
VALUES('A-002','Heater',-100,120);
*/

