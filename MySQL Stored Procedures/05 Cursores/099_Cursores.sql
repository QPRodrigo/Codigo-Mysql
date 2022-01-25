/*Cursor*/

### Introducción al cursor MySQL

-- Sólo lectura: no se pueden actualizar los datos de la tabla subyacente a través del cursor.

-- No desplazable: Solo puede obtener filas en el orden determinado por la instrucción. No se pueden obtener filas en el orden invertido. Además, no puede omitir filas ni saltar a una fila específica en el conjunto de resultados.SELECT

-- Insensible: Hay dos tipos de cursores: cursor insensible y cursor insensible. Un cursor insensible apunta a los datos reales, mientras que un cursor insensible utiliza una copia temporal de los datos. Un cursor insensible funciona más rápido que un cursor insensible porque no tiene que hacer una copia temporal de los datos. Sin embargo, cualquier cambio que se realice en los datos de otras conexiones afectará a los datos que está siendo utilizado por un cursor sensible, por lo tanto, es más seguro si no actualiza los datos que está siendo utilizado por un cursor sensible. El cursor de MySQL es sensible.

### Trabajar con el cursor MySQL

-- En primer lugar, declare un cursor mediante la instrucción:DECLARE
DECLARE cursor_name CURSOR FOR SELECT_statement;

-- A continuación, abra el cursor utilizando la instrucción. La instrucción inicializa el conjunto de resultados para el cursor, por lo tanto, debe llamar a la instrucción antes de obtener filas del conjunto de resultados.OPENOPENOPEN
OPEN cursor_name;

-- A continuación, utilice la instrucción para recuperar la siguiente fila apuntada por el cursor y mueva el cursor a la siguiente fila del conjunto de resultados.FETCH
FETCH cursor_name INTO variables list;

-- Finalmente, desactive el cursor y libere la memoria asociada con él utilizando la instrucción:CLOSE
CLOSE cursor_name;

-- Para declarar un controlador, utilice la sintaxis siguiente:NOT FOUND
DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;

### Ejemplo de cursor MySQL

-- Primero, declare algunas variables, un cursor para recorrer los correos electrónicos de los empleados y un controlador:NOT FOUND
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE emailAddress varchar(100) DEFAULT "";

	-- declare cursor for employee email
	DEClARE curEmail 
		CURSOR FOR 
			SELECT email FROM employees;

	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

-- A continuación, abra el cursor utilizando la instrucción:OPEN
OPEN curEmail;

-- Luego, repita la lista de correo electrónico y concatene todos los correos electrónicos donde cada correo electrónico esté separado por un punto y coma (;):
    getEmail: LOOP
		FETCH curEmail INTO emailAddress;
		IF finished = 1 THEN 
			LEAVE getEmail;
		END IF;
		-- build email list
		SET emailList = CONCAT(emailAddress,";",emailList);
	END LOOP getEmail;

-- Finalmente, cierre el cursor usando la instrucción:CLOSE
CLOSE email_cursor;

-- El procedimiento almacenado es el siguiente:createEmailList
DELIMITER $$
CREATE PROCEDURE createEmailList (
	INOUT emailList varchar(4000)
)
BEGIN
	DECLARE finished INTEGER DEFAULT 0;
	DECLARE emailAddress varchar(100) DEFAULT "";

	-- declare cursor for employee email
	DEClARE curEmail 
		CURSOR FOR 
			SELECT email FROM employees;

	-- declare NOT FOUND handler
	DECLARE CONTINUE HANDLER 
        FOR NOT FOUND SET finished = 1;

	OPEN curEmail;

	getEmail: LOOP
		FETCH curEmail INTO emailAddress;
		IF finished = 1 THEN 
			LEAVE getEmail;
		END IF;
		-- build email list
		SET emailList = CONCAT(emailAddress,";",emailList);
	END LOOP getEmail;
	CLOSE curEmail;

END$$
DELIMITER ;

-- Puede probar el procedimiento almacenado mediante el siguiente script:createEmailList
SET @emailList = ""; 
CALL createEmailList(@emailList); 
SELECT @emailList;