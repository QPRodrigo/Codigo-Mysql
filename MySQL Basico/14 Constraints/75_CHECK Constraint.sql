/* CHECK Constraint */ 

-- para asegurarse de que los valores almacenados en una columna o grupo de columnas satisfagan una expresión booleana.

### Introducción a la CHECK restricción de MySQL

-- le CREATE TABLEpermite incluir una CHECKrestricción de tabla . Sin embargo, la CHECKrestricción simplemente se analiza e ignora:
CHECK(expression)

-- A partir de MySQL 8.0.16, las CREATE TABLEcaracterísticas esenciales admitidas de las CHECKrestricciones de tabla y columna para todos los motores de almacenamiento .
[CONSTRAINT [constraint_name]] CHECK (expression) [[NOT] ENFORCED]

-- Primero, especifique el nombre de la restricción de verificación que desea crear. Si omite el nombre de la restricción, MySQL genera automáticamente un nombre con la siguiente convención:
table_name_chk_n
-- donde nes un número ordinal 1,2,3 ... Por ejemplo, los nombres de CHECKlas limitaciones de la partsmesa serán parts_chk_1, parts_chk_2...

/*
# En segundo lugar, especifique un valor booleano expressionque debe evaluar en TRUEo UNKNOWNpara cada fila de la tabla. Si la expresión se evalúa como FALSE, los valores violan la restricción o se produce una violación de la restricción.

# En tercer lugar, especifique opcionalmente una cláusula de cumplimiento para indicar si se aplica la restricción de verificación:

.- Utilice ENFORCEDo simplemente omita la ENFORCEDcláusula para crear y hacer cumplir la restricción.
.- Úselo NOT ENFORCEDpara crear la restricción pero no la aplique.
Como se mencionó anteriormente, puede especificar una CHECKrestricción como restricción de tabla o restricción de columna.

Una CHECKrestricción de tabla puede hacer referencia a varias columnas, mientras que la CHECKrestricción de columna puede hacer referencia a la única columna donde está definida.
*/

### CHECK Ejemplos de restricciones de MySQL

# CHECK Restricción de MySQL : ejemplo de restricción de columna
-- Esta declaración crea una nueva partstabla:
CREATE TABLE parts (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10,2 ) NOT NULL CHECK (cost >= 0),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0)
);

-- Para ver la definición de la tabla con el CHECKnombre de la restricción, use la SHOW CREATE TABLEdeclaración:
SHOW CREATE TABLE parts;

-- Una vez que las CHECKrestricciones están en su lugar, siempre que inserta o actualiza un valor que hace que la expresión booleana se evalúe como falsa, MySQL rechaza el cambio y emite un error.
INSERT INTO parts(part_no, description,cost,price) 
VALUES('A-001','Cooler',0,-100);
-- MySQL emitió un error:
/*
Error Code: 3819. Check constraint 'parts_chk_2' is violated.
*/

# CHECK restricción de MySQL - ejemplo de restricción de tabla
-- Primero, suelte la partsmesa:
DROP TABLE IF EXISTS parts;

-- Luego, cree una nueva partstabla con una CHECKrestricción de tabla más :
CREATE TABLE parts (
    part_no VARCHAR(18) PRIMARY KEY,
    description VARCHAR(40),
    cost DECIMAL(10,2 ) NOT NULL CHECK (cost >= 0),
    price DECIMAL(10,2) NOT NULL CHECK (price >= 0),
    CONSTRAINT parts_chk_price_gt_cost 
        CHECK(price >= cost)
);

-- La siguiente cláusula nueva define una CHECKrestricción de tabla que garantiza que el precio sea siempre mayor o igual al costo:
CONSTRAINT parts_chk_price_gt_cost CHECK(price >= cost)

-- Debido a que especificamos explícitamente el nombre de la CHECKrestricción, MySQL simplemente crea la nueva restricción con el nombre especificado.

-- Aquí está la definición de la partstabla:
SHOW CREATE TABLE parts;

-- Esta declaración intenta insertar una nueva pieza cuyo precio es menor que el costo:
INSERT INTO parts(part_no, description,cost,price) 
VALUES('A-001','Cooler',200,100);
-- Aquí está el error debido a la violación de la restricción:
/*
Error Code: 3819. Check constraint 'parts_chk_price_gt_cost' is violated.
*/

