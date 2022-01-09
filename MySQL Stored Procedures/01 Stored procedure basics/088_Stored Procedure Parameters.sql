/*Stored Procedure Parameters*/


### IN
-- INes el modo predeterminado. Cuando define un INparámetro en un procedimiento almacenado, el programa de llamada tiene que pasar un argumento al procedimiento almacenado.

### OUT
-- El valor de un OUTparámetro se puede cambiar dentro del procedimiento almacenado y su nuevo valor se devuelve al programa de llamada.

### INOUT
-- Un INOUT  parámetro es una combinación de INy OUTparámetros. Significa que el programa de llamada puede pasar el argumento y el procedimiento almacenado puede modificar el INOUTparámetro y devolver el nuevo valor al programa de llamada.

### Definiendo un parámetro

/*
[IN | OUT | INOUT] parameter_name datatype[(length)]
*/

#### Ejemplos de parámetros de procedimiento almacenado de MySQL

-- El ejemplo de parámetro IN
DELIMITER //

CREATE PROCEDURE GetOfficeByCountry(
	IN countryName VARCHAR(255)
)
BEGIN
	SELECT * 
 	FROM offices
	WHERE country = countryName;
END //

DELIMITER ;

-- Suponga que desea encontrar oficinas ubicadas en los EE. UU., Debe pasar un argumento ( USA) al procedimiento almacenado como se muestra en la siguiente consulta:
CALL GetOfficeByCountry('USA');

-- Para encontrar oficinas en France, pasa la cadena literal Franceal GetOfficeByCountry procedimiento almacenado de la siguiente manera:
CALL GetOfficeByCountry('France')

-- Debido a que countryNamees el INparámetro, debe pasar un argumento. Si no lo hace, obtendrá un error:
/*
CALL GetOfficeByCountry();
*/

### El ejemplo del parámetro OUT

-- El siguiente procedimiento almacenado devuelve el número de pedidos por estado de pedido.

DELIMITER $$

CREATE PROCEDURE GetOrderCountByStatus (
	IN  orderStatus VARCHAR(25),
	OUT total INT
)
BEGIN
	SELECT COUNT(orderNumber)
	INTO total
	FROM orders
	WHERE status = orderStatus;
END$$

DELIMITER ;

-- Para encontrar el número de pedidos que ya se enviaron, llame GetOrderCountByStatusy pase el estado del pedido a partir de Shipped, y también pase una variable de sesión ( @total) para recibir el valor de devolución.
CALL GetOrderCountByStatus('Shipped',@total);
SELECT @total;

-- Para obtener el número de pedidos que están en proceso, llame al procedimiento almacenado de la GetOrderCountByStatus siguiente manera:
CALL GetOrderCountByStatus('in process',@total);
SELECT @total AS  total_in_process;

### El ejemplo del parámetro INOUT
DELIMITER $$

CREATE PROCEDURE SetCounter(
	INOUT counter INT,
    IN inc INT
)
BEGIN
	SET counter = counter + inc;
END$$

DELIMITER ;

-- En este ejemplo, el procedimiento almacenado SetCounter()acepta un INOUT parámetro ( counter) y un INparámetro ( inc). Aumenta el contador ( counter) por el valor especificado por el incparámetro.
SET @counter = 1;
CALL SetCounter(@counter,1); -- 2
CALL SetCounter(@counter,1); -- 3
CALL SetCounter(@counter,5); -- 8
SELECT @counter; -- 8
