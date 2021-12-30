/* Tabla de exportación de MySQL a CSV */

-- MySQL proporciona una manera fácil de exportar el resultado de la consulta a un archivo CSV que reside en el servidor de la base de datos.

/*
Antes de exportar datos, debe asegurarse de que:

.- El proceso del servidor MySQL tiene acceso de escritura a la carpeta de destino que contiene el archivo CSV de destino.
.- El archivo CSV de destino no debe existir.
*/

-- La siguiente consulta selecciona pedidos cancelados de la  orderstabla:
SELECT 
    orderNumber, status, orderDate, requiredDate, comments
FROM
    orders
WHERE
    status = 'Cancelled';

-- Para exportar este conjunto de resultados a un archivo CSV, agregue algunas cláusulas a la consulta anterior de la siguiente manera:
SELECT 
    orderNumber, status, orderDate, requiredDate, comments
FROM
    orders
WHERE
    status = 'Cancelled' 
INTO OUTFILE 'C:/tmp/cancelled_orders.csv' 
FIELDS ENCLOSED BY '"' 
TERMINATED BY ';' 
ESCAPED BY '"' 
LINES TERMINATED BY '\r\n';

### Exportar datos a un archivo CSV cuyo nombre de archivo contiene una marca de tiempo

-- Los siguientes comandos exportan toda la tabla de pedidos a un archivo CSV con la marca de tiempo como parte del nombre del archivo.

SET @TS = DATE_FORMAT(NOW(),'_%Y_%m_%d_%H_%i_%s');

SET @FOLDER = 'c:/tmp/';
SET @PREFIX = 'orders';
SET @EXT    = '.csv';

SET @CMD = CONCAT("SELECT * FROM orders INTO OUTFILE '",@FOLDER,@PREFIX,@TS,@EXT,
				   "' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'",
				   "  LINES TERMINATED BY '\r\n';");

PREPARE statement FROM @CMD;

EXECUTE statement;

### Exportar datos con encabezados de columna

-- Sería conveniente que el archivo CSV contenga la primera línea como encabezados de columna para que el archivo sea más comprensible.

(SELECT 'Order Number','Order Date','Status')
UNION 
(SELECT orderNumber,orderDate, status
FROM orders
INTO OUTFILE 'C:/tmp/orders.csv'
FIELDS ENCLOSED BY '"' TERMINATED BY ';' ESCAPED BY '"'
LINES TERMINATED BY '\r\n');


### Manejo de valores NULL

-- En caso de que los valores del conjunto de resultados contengan valores NULL , el archivo de destino contendrá en  "Nlugar de NULL. Para solucionar este problema, debe reemplazar el NULLvalor por otro valor, por ejemplo, no aplicable ( N/A) utilizando la función IFNULL como la siguiente consulta:

SELECT 
    orderNumber, orderDate, IFNULL(shippedDate, 'N/A')
FROM
    orders INTO OUTFILE 'C:/tmp/orders2.csv' 
    FIELDS ENCLOSED BY '"' 
    TERMINATED BY ';' 
    ESCAPED BY '"' LINES 
    TERMINATED BY '\r\n';