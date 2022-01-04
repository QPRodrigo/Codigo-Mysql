/* Delimiter */

-- Al escribir sentencias SQL, usa el punto y coma ( ;) para separar dos sentencias como en el siguiente ejemplo:

SELECT * FROM products;

SELECT * FROM customers;

-- Para redefinir el delimitador predeterminado, usa el DELIMITERcomando:
-- // DELIMITER delimiter_character

-- El delimiter_characterpuede consistir en un solo carácter o múltiples caracteres por ejemplo, //o $$. Sin embargo, debe evitar usar la barra invertida ( \) porque es el carácter de escape en MySQL.
-- DELIMITER //

-- Una vez que cambie el delimitador, puede usar el nuevo delimitador para finalizar una declaración de la siguiente manera:
/*
DELIMITER //

SELECT * FROM customers //

SELECT * FROM products //
*/

-- Para cambiar el delimitador al predeterminado, que es un punto y coma ( ;), utilice la siguiente declaración:
-- DELIMITER ;

### Usando MySQL DELIMITER para procedimientos almacenados

-- Normalmente, un procedimiento almacenado contiene varias instrucciones separadas por punto y coma (;). Para compilar todo el procedimiento almacenado como una única declaración compuesta, debe cambiar temporalmente el delimitador del punto y coma (;) a otro delimitador como $$o //:

DELIMITER $$

CREATE PROCEDURE sp_name()
BEGIN
  -- statements
END $$

DELIMITER ;


