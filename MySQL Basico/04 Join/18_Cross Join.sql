/* CROSS JOIN */

-- cláusula devuelve un producto cartesiano de filas de las tablas unidas.

/*
SELECT * FROM t1
CROSS JOIN t2;
*/

/*
SELECT * FROM t1
CROSS JOIN t2
WHERE t1.id = t2.id;
*/

#### Ejemplos 

# Primero, cree una nueva base de datos salesdb :
CREATE DATABASE IF NOT EXISTS salesdb;

# En segundo lugar, cambie los datos actuales a la nueva base de datos salesdb:
USE salesdb;

# En tercer lugar, cree nuevas tablas en la salesdbbase de datos:
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    price DECIMAL(13,2 )
);

CREATE TABLE stores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    store_name VARCHAR(100)
);

CREATE TABLE sales (
    product_id INT,
    store_id INT,
    quantity DECIMAL(13 , 2 ) NOT NULL,
    sales_date DATE NOT NULL,
    PRIMARY KEY (product_id , store_id),
    FOREIGN KEY (product_id)
        REFERENCES products (id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (store_id)
        REFERENCES stores (id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


-- Finalmente, inserte datos en las tres tablas. Supongamos que tenemos tres productos iPhone, iPady Macbook Proque se venden en dos tiendas Northy South.

INSERT INTO products(product_name, price)
VALUES('iPhone', 699),
      ('iPad',599),
      ('Macbook Pro',1299);

INSERT INTO stores(store_name)
VALUES('North'),
      ('South');

INSERT INTO sales(store_id,product_id,quantity,sales_date)
VALUES(1,1,20,'2017-01-02'),
      (1,2,15,'2017-01-05'),
      (1,3,25,'2017-01-05'),
      (2,1,30,'2017-01-02'),
      (2,2,35,'2017-01-05');

# Ejemplo de MySQL CROSS JOIN
SELECT 
    store_name,
    product_name,
    SUM(quantity * price) AS revenue
FROM
    sales
        INNER JOIN
    products ON products.id = sales.product_id
        INNER JOIN
    stores ON stores.id = sales.store_id
GROUP BY store_name , product_name; 

-- cláusula para obtener la combinación de todas las tiendas y productos:
SELECT 
    store_name, product_name
FROM
    stores AS a
        CROSS JOIN
    products AS b;
    
-- A continuación, combine el resultado de la consulta anterior con una consulta que devuelva el total de ventas por tienda y producto. 
SELECT 
    b.store_name,
    a.product_name,
    IFNULL(c.revenue, 0) AS revenue
FROM
    products AS a
        CROSS JOIN
    stores AS b
        LEFT JOIN
    (SELECT 
        stores.id AS store_id,
        products.id AS product_id,
        store_name,
            product_name,
            ROUND(SUM(quantity * price), 0) AS revenue
    FROM
        sales
    INNER JOIN products ON products.id = sales.product_id
    INNER JOIN stores ON stores.id = sales.store_id
    GROUP BY stores.id, products.id, store_name , product_name) AS c ON c.store_id = b.id
        AND c.product_id= a.id
ORDER BY b.store_name;