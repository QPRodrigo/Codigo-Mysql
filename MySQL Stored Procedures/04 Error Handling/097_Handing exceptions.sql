/* Error Handling in Stored Procedures */

-- Declarar un controlador
/*
DECLARE action HANDLER FOR condition_value statement;
*/

### Ejemplos de manejo de errores de MySQL
-- El siguiente controlador establece el valor de la variable en 1 y continúa la ejecución si se produce unhasErrorSQLEXCEPTION
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
SET hasError = 1;

-- El siguiente controlador revierte las operaciones anteriores, emite un mensaje de error y sale del bloque de código actual en caso de que se produzca un error. Si lo declara dentro del bloque de un procedimiento almacenado, terminará el procedimiento almacenado inmediatamente.BEGIN END
DECLARE EXIT HANDLER FOR SQLEXCEPTION
BEGIN
    ROLLBACK;
    SELECT 'An error has occurred, operation rollbacked and the stored procedure was terminated';
END;

-- El siguiente controlador establece el valor de la variable en 1 y continúa la ejecución si no hay más fila que recuperar en caso de un cursor o una instrucción:RowNotFoundSELECT INTO
DECLARE CONTINUE HANDLER FOR NOT FOUND 
SET RowNotFound = 1;

-- Si se produce un error de clave duplicada, el siguiente controlador emite un mensaje de error y continúa la ejecución.
DECLARE CONTINUE HANDLER FOR 1062
SELECT 'Error, duplicate key occurred';


### Ejemplo de controlador MySQL en procedimientos almacenados

-- Primero, cree una nueva tabla con el nombre de la demostración:SupplierProducts
CREATE TABLE SupplierProducts (
    supplierId INT,
    productId INT,
    PRIMARY KEY (supplierId , productId)
);

-- En segundo lugar, cree un procedimiento almacenado que inserte el identificador del producto y el identificador del proveedor en la tabla:SupplierProducts
CREATE PROCEDURE InsertSupplierProduct(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    -- exit if the duplicate key occurs
    DECLARE EXIT HANDLER FOR 1062
    BEGIN
 	SELECT CONCAT('Duplicate key (',inSupplierId,',',inProductId,') occurred') AS message;
    END;
    
    -- insert a new row into the SupplierProducts
    INSERT INTO SupplierProducts(supplierId,productId)
    VALUES(inSupplierId,inProductId);
    
    -- return the products supplied by the supplier id
    SELECT COUNT(*) 
    FROM SupplierProducts
    WHERE supplierId = inSupplierId;
    
END$$

DELIMITER ;

-- El siguiente controlador de salida finaliza el procedimiento almacenado cada vez que se produce una clave duplicada (con el código 1062). Además, devuelve un mensaje de error.
DECLARE EXIT HANDLER FOR 1062
BEGIN
    SELECT CONCAT('Duplicate key (',supplierId,',',productId,') occurred') AS message;
END;

-- Esta instrucción inserta una fila en la tabla. Si se produce una clave duplicada, se ejecutará el código de la sección del controlador.SupplierProducts
INSERT INTO SupplierProducts(supplierId,productId) 
VALUES(supplierId,productId);

-- En tercer lugar, llame a la para insertar algunas filas en la tabla:InsertSupplierProduct()SupplierProducts
CALL InsertSupplierProduct(1,1);
CALL InsertSupplierProduct(1,2);
CALL InsertSupplierProduct(1,3);

-- Cuarto, intente insertar una fila cuyos valores ya existen en la tabla:SupplierProducts
/*
CALL InsertSupplierProduct(1,3);
*/

-- Dado que el controlador es un controlador, la última instrucción no se ejecuta:EXIT
SELECT COUNT(*) 
FROM SupplierProducts
WHERE supplierId = inSupplierId;

-- Si cambia la declaración del manipulador a , también obtendrá el número de productos proporcionados por el proveedor:EXITCONTINUE
DROP PROCEDURE IF EXISTS InsertSupplierProduct;

DELIMITER $$

CREATE PROCEDURE InsertSupplierProduct(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    -- exit if the duplicate key occurs
    DECLARE CONTINUE HANDLER FOR 1062
    BEGIN
	SELECT CONCAT('Duplicate key (',inSupplierId,',',inProductId,') occurred') AS message;
    END;
    
    -- insert a new row into the SupplierProducts
    INSERT INTO SupplierProducts(supplierId,productId)
    VALUES(inSupplierId,inProductId);
    
    -- return the products supplied by the supplier id
    SELECT COUNT(*) 
    FROM SupplierProducts
    WHERE supplierId = inSupplierId;
    
END$$

DELIMITER ;

-- Por último, vuelva a llamar al procedimiento almacenado para ver el efecto del controlador:CONTINUE
CALL InsertSupplierProduct(1,3);

### Precedencia del controlador MySQL

-- Supongamos que tenemos tres controladores en los controladores en el procedimiento almacenado:insert_article_tags_3
DROP PROCEDURE IF EXISTS InsertSupplierProduct;

DELIMITER $$

CREATE PROCEDURE InsertSupplierProduct(
    IN inSupplierId INT, 
    IN inProductId INT
)
BEGIN
    -- exit if the duplicate key occurs
    DECLARE EXIT HANDLER FOR 1062 SELECT 'Duplicate keys error encountered' Message; 
    DECLARE EXIT HANDLER FOR SQLEXCEPTION SELECT 'SQLException encountered' Message; 
    DECLARE EXIT HANDLER FOR SQLSTATE '23000' SELECT 'SQLSTATE 23000' ErrorCode;
    
    -- insert a new row into the SupplierProducts
    INSERT INTO SupplierProducts(supplierId,productId)
    VALUES(inSupplierId,inProductId);
    
    -- return the products supplied by the supplier id
    SELECT COUNT(*) 
    FROM SupplierProducts
    WHERE supplierId = inSupplierId;
    
END$$

DELIMITER ;

-- Llame al procedimiento almacenado para insertar una clave duplicada:
CALL InsertSupplierProduct(1,3);

### Uso de una condición de error con nombre

-- Comencemos con una declaración de controlador de errores.
DELIMITER $$

CREATE PROCEDURE TestProc()
BEGIN

    DECLARE EXIT HANDLER FOR 1146 
    SELECT 'Please create table abc first' Message; 
        
    SELECT * FROM abc;
END$$

DELIMITER ;

-- Aquí está la sintaxis de la instrucción:DECLARE CONDITION

/*
DECLARE condition_name CONDITION FOR condition_value;
*/

-- Por lo tanto, puede reescribir el código anterior de la siguiente manera:
DROP PROCEDURE IF EXISTS TestProc;

DELIMITER $$

CREATE PROCEDURE TestProc()
BEGIN
    DECLARE TableNotFound CONDITION for 1146 ; 

    DECLARE EXIT HANDLER FOR TableNotFound 
	SELECT 'Please create table abc first' Message; 
    SELECT * FROM abc;
END$$

DELIMITER ;