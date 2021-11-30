/* TRUNCATE TABLE */

-- Instrucción MySQL para eliminar todos los datos de una tabla.

/*
TRUNCATE [TABLE] table_name;
*/

### TRUNCATE TABLEEjemplo de MySQL

-- Primero, cree una nueva tabla con el nombre booksde la demostración:

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL
)  ENGINE=INNODB;

-- A continuación, inserte datos ficticios en la bookstabla mediante el siguiente procedimiento almacenado :
DELIMITER $$
CREATE PROCEDURE load_book_data(IN num INT(4))
BEGIN
	DECLARE counter INT(4) DEFAULT 0;
	DECLARE book_title VARCHAR(255) DEFAULT '';

	WHILE counter < num DO
	  SET book_title = CONCAT('Book title #',counter);
	  SET counter = counter + 1;

	  INSERT INTO books(title)
	  VALUES(book_title);
	END WHILE;
END$$

DELIMITER ;

-- Luego, cargue 10,000 filas en la bookstabla. Tardará un rato.
CALL load_book_data(10000);

-- Después de eso, verifique los datos en la bookstabla:
SELECT * FROM books;

-- Finalmente, use la TRUNCATE TABLEdeclaración para eliminar todas las filas de la bookstabla:
TRUNCATE TABLE books;