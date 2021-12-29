/* Import CSV File Into MySQL Table */

-- La  LOAD DATA INFILEdeclaración le permite leer datos de un archivo de texto e importar los datos del archivo a una tabla de base de datos muy rápido.

-- Usamos la declaración CREATE TABLE para crear la discountstabla de la siguiente manera:

CREATE TABLE discounts (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    expired_date DATE NOT NULL,
    amount DECIMAL(10 , 2 ) NULL,
    PRIMARY KEY (id)
);


-- La siguiente declaración importa datos del   c:\tmp\discounts.csvarchivo a la discountstabla.
LOAD DATA INFILE 'c:/tmp/discounts.csv' 
INTO TABLE discounts 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- El campo del archivo termina con una coma indicada por  FIELD TERMINATED BY ','y entre comillas dobles especificadas por ENCLOSED BY '"'.

-- Cada línea del archivo CSV termina con un carácter de nueva línea indicado por LINES TERMINATED BY '\n'.

-- Debido a que el archivo tiene la primera línea que contiene los encabezados de las columnas, que no se deben importar a la tabla, lo ignoramos al especificar la  IGNORE 1 ROWSopción.

-- Ahora, podemos consultar la discountstabla para ver si se importan los datos.

SELECT * FROM discounts;

### Transformar datos durante la importación

-- A veces, el formato de los datos no coincide con las columnas de destino de la tabla. En casos simples, puede transformarlo usando la SETcláusula en la  LOAD DATA INFILEdeclaración.

-- Al importar datos a la discountstabla, tenemos que transformarlos al formato de fecha MySQL usando la función str_to_date () de la siguiente manera:

LOAD DATA INFILE 'c:/tmp/discounts_2.csv'
INTO TABLE discounts
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(title,@expired_date,amount)
SET expired_date = STR_TO_DATE(@expired_date, '%m/%d/%Y');

### Importar archivo del cliente a un servidor de base de datos MySQL remoto

-- Cuando usa la  LOCALopción en el  LOAD DATA INFILE, el programa cliente lee el archivo en el cliente y lo envía al servidor MySQL. El archivo se cargará en la carpeta temporal del sistema operativo del servidor de la base de datos, por ejemplo,  C:\windows\tempen Windows o  /tmpLinux. Esta carpeta no es configurable ni determinada por MySQL.

LOAD DATA LOCAL INFILE  'c:/tmp/discounts.csv'
INTO TABLE discounts
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- La única diferencia es la LOCALopción en la declaración. Si carga un archivo CSV grande, verá que con la  LOCALopción, será un poco más lento cargar el archivo porque lleva tiempo transferir el archivo al servidor de la base de datos.

-- La cuenta que se conecta al servidor MySQL no necesita tener el privilegio de ARCHIVO para importar el archivo cuando usa la LOCALopción.

-- Importar el archivo desde el cliente a un servidor de base de datos remoto  LOAD DATA LOCALtiene algunos problemas de seguridad que debe tener en cuenta para evitar posibles riesgos de seguridad.
