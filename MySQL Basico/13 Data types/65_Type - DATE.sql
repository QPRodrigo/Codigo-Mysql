/* Type - DATE de MySQL */

-- MySQL DATEes uno de los cinco tipos de datos temporales que se utilizan para administrar valores de fecha. MySQL usa yyyy-mm-dd formato para almacenar un valor de fecha. Este formato es fijo y no es posible cambiarlo.

### Valores de fecha de MySQL con años de dos dígitos
-- Primero, cree una tabla llamada personas con una columna de fecha de nacimiento con DATEel tipo de datos.
CREATE TABLE people (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_date DATE NOT NULL
);

-- A continuación, inserte una fila en la peopletabla.
INSERT INTO people(first_name,last_name,birth_date)
VALUES('John','Doe','1990-09-01');

-- Luego, consulta los datos de la peopletabla.
SELECT 
    first_name, 
    last_name, 
    birth_date
FROM
    people;
    
-- Después de eso, use el formato de año de dos dígitos para insertar datos en la peopletabla.
INSERT INTO people(first_name,last_name,birth_date)
VALUES('Jack','Daniel','01-09-01'),
      ('Lily','Bush','80-09-01');
-- En la primera fila, usamos 01 (rango 00-69) como año, por lo que MySQL lo convirtió a 2001. En la segunda fila, usamos 80 (rango 70-99) como año, MySQL lo convirtió a 1980.

-- Finalmente, podemos consultar datos de la peopletabla para verificar si los datos se convirtieron en función de las reglas de conversión.
SELECT 
    first_name, 
    last_name, 
    birth_date
FROM
    people;

### DATE Funciones de MySQL
-- MySQL proporciona muchas funciones útiles de fecha que le permiten manipular la fecha de manera efectiva.
SELECT NOW();

-- Para obtener solo la fecha parte de un DATETIMEvalor, usa la DATE()función.
SELECT DATE(NOW());

-- Para obtener la fecha actual del sistema, use la   CURDATE()función de la siguiente manera:
SELECT CURDATE();

-- Para formatear un valor de fecha, usa   DATE_FORMATfunction. La siguiente declaración formatea la fecha mm/dd/yyyy usando el patrón de formato de fecha  %m/%d/%Y :
SELECT DATE_FORMAT(CURDATE(), '%m/%d/%Y') today;

-- Para calcular el número de días entre dos valores de fecha, utilice la DATE DIFF función de la siguiente manera:
SELECT DATEDIFF('2015-11-04','2014-11-04') days;

-- Para agregar una cantidad de días, semanas, meses, años, etc., a un valor de fecha, use la DATE_ADDfunción:
SELECT 
    '2015-01-01' start,
    DATE_ADD('2015-01-01', INTERVAL 1 DAY) 'one day later',
    DATE_ADD('2015-01-01', INTERVAL 1 WEEK) 'one week later',
    DATE_ADD('2015-01-01', INTERVAL 1 MONTH) 'one month later',
    DATE_ADD('2015-01-01', INTERVAL 1 YEAR) 'one year later';
    
-- De manera similar, puede restar un intervalo de una fecha usando la DATE_SUBfunción:
SELECT 
    '2015-01-01' start,
    DATE_SUB('2015-01-01', INTERVAL 1 DAY) 'one day before',
    DATE_SUB('2015-01-01', INTERVAL 1 WEEK) 'one week before',
    DATE_SUB('2015-01-01', INTERVAL 1 MONTH) 'one month before',
    DATE_SUB('2015-01-01', INTERVAL 1 YEAR) 'one year before';

-- Si usted desea conseguir el día, mes, trimestre y año de un valor de fecha, puede utilizar la función correspondiente DAY, MONTH, QUARTER, y YEARde la siguiente manera:
SELECT DAY('2000-12-31') day, 
       MONTH('2000-12-31') month, 
       QUARTER('2000-12-31') quarter, 
       YEAR('2000-12-31') year;
       
-- Para obtener información sobre las funciones relacionadas con la semana. Por ejemplo, la WEEKfunción devuelve el número de la semana, la WEEKDAYfunción devuelve el índice del día de la semana y la WEEKOFYEARfunción devuelve la semana del calendario.
SELECT 
    WEEKDAY('2000-12-31') weekday,
    WEEK('2000-12-31') week,
    WEEKOFYEAR('2000-12-31') weekofyear;
    
-- La función de la semana devuelve el número de la semana con el índice de base cero si no pasa el segundo argumento o si pasa 0. Si pasa 1, devolverá el número de la semana con 1-indexado.
SELECT 
    WEEKDAY('2000-12-31') weekday,
    WEEK('2000-12-31',1) week,
    WEEKOFYEAR('2000-12-31') weekofyear;
