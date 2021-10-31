/* INSERT INTO SELECT */

-- Aprendió cómo insertar una o más filas en una tabla usando la INSERTdeclaración con una lista de valores de columna especificada en la VALUES cláusula.

/*

INSERT INTO table_name(c1,c2,...)
VALUES(v1,v2,..);

*/


/*

INSERT INTO table_name(column_list)
SELECT 
   select_list 
FROM 
   another_table
WHERE
   condition;

*/


-- INSERT INTO SELECT Ejemplo de MySQL
CREATE TABLE suppliers (
    supplierNumber INT AUTO_INCREMENT,
    supplierName VARCHAR(50) NOT NULL,
    phone VARCHAR(50),
    addressLine1 VARCHAR(50),
    addressLine2 VARCHAR(50),
    city VARCHAR(50),
    state VARCHAR(50),
    postalCode VARCHAR(50),
    country VARCHAR(50),
    customerNumber INT,
    PRIMARY KEY (supplierNumber)
);


-- Suponga que todos los clientes se California, USAconvierten en proveedores de la empresa. La siguiente consulta busca todos los clientes que se ubican en California, EE. UU.

SELECT 
    customerNumber,
    customerName,
    phone,
    addressLine1,
    addressLine2,
    city,
    state,
    postalCode,
    country
FROM
    customers
WHERE
    country = 'USA' AND 
    state = 'CA';
    

-- En segundo lugar, use la INSERT INTO ... SELECTdeclaración para insertar a los clientes que se ubican en California USAla   customerstabla en la   supplierstabla:

INSERT INTO suppliers (
    supplierName, 
    phone, 
    addressLine1,
    addressLine2,
    city,
    state,
    postalCode,
    country,
    customerNumber
)
SELECT 
    customerName,
    phone,
    addressLine1,
    addressLine2,
    city,
    state ,
    postalCode,
    country,
    customerNumber
FROM 
    customers
WHERE 
    country = 'USA' AND 
    state = 'CA';
    
SELECT * FROM suppliers;

### Usando SELECT declaración en la VALUES lista

-- Primero, cree una nueva tabla llamada stats:
CREATE TABLE stats (
    totalProduct INT,
    totalCustomer INT,
    totalOrder INT
);

-- En segundo lugar, use la INSERTdeclaración para insertar valores que provienen de las SELECT declaraciones:
INSERT INTO stats(totalProduct, totalCustomer, totalOrder)
VALUES(
	(SELECT COUNT(*) FROM products),
	(SELECT COUNT(*) FROM customers),
	(SELECT COUNT(*) FROM orders)
);


SELECT * FROM stats;