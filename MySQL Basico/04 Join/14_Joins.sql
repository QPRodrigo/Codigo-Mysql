/* JOIN*/

-- Combinación de MySQL en la SELECTdeclaración para consultar datos de dos tablas.

/*
SELECT column_list
FROM table_1
INNER JOIN table_2 ON join_condition;
*/

USE classicmodels;

-- Primero, cree dos tablas llamadas membersy committees:
CREATE TABLE members (
    member_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (member_id)
);

CREATE TABLE committees (
    committee_id INT AUTO_INCREMENT,
    name VARCHAR(100),
    PRIMARY KEY (committee_id)
);

-- En segundo lugar, inserte algunas filas en las tablas members y committees:
INSERT INTO members(name)
VALUES('John'),('Jane'),('Mary'),('David'),('Amelia');

INSERT INTO committees(name)
VALUES('John'),('Mary'),('Amelia'),('Joe');

-- En tercer lugar, consulte los datos de las tablas members y committees:
SELECT * FROM members;
SELECT * FROM committees;

### Cláusula MySQL INNER JOIN

# Una cláusula de unión interna para encontrar miembros que también son miembros del comité:
SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
INNER JOIN committees c ON c.name = m.name;

# Debido a que ambas tablas usan la misma columna para hacer coincidir, puede usar la USINGcláusula como se muestra en la siguiente consulta:
SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
INNER JOIN committees c USING(NAME);

### Cláusula LEFT JOIN de MySQL

# El siguiente ejemplo usa una cláusula de combinación izquierda para unir el memberscon la committe establa:
SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
LEFT JOIN committees c USING(NAME);

-- Esta declaración usa la cláusula de combinación izquierda con la USING sintaxis:
SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
LEFT JOIN committees c USING(NAME);

-- Para encontrar miembros que no son miembros del comité, agregue una WHERE cláusula y un IS NULL operador de la siguiente manera:
SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
LEFT JOIN committees c USING(name)
WHERE c.committee_id IS NULL;

### Cláusula MySQL RIGHT JOIN

-- Esta declaración usa la combinación correcta para unir las tablas members y committees:
SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
RIGHT JOIN committees c on c.name = m.name;

-- La siguiente declaración usa la cláusula de combinación correcta con la USING sintaxis:
SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
RIGHT JOIN committees c USING(NAME);

-- Para encontrar los miembros del comité que no están en la memberstabla, utilice esta consulta:
SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
RIGHT JOIN committees c USING(name)
WHERE m.member_id IS NULL;

### Cláusula MySQL CROSS JOIN

-- La cláusula de unión cruzada para unir el memberscon las committees tablas:
SELECT 
    m.member_id, 
    m.name AS member, 
    c.committee_id, 
    c.name AS committee
FROM
    members m
CROSS JOIN committees c;