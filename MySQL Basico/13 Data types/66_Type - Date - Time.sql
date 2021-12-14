/* TIME Data Type */

### Ejemplo de tipo de datos de MySQL TIME

-- En primer lugar, crear una nueva tabla llamada tests que consta de cuatro columnas: id, name, start_at, y end_at. Los tipos de datos de las columnas start_aty end_atson TIME.
CREATE TABLE tests (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    start_at TIME,
    end_at TIME
);

-- En segundo lugar, inserte una fila en la teststabla.
INSERT INTO tests(name,start_at,end_at)
VALUES('Test 1', '08:00:00','10:00:00');

-- En tercer lugar, consulte los datos de la teststabla.
SELECT 
    name, start_at, end_at
FROM
    tests;

### Literales de MySQL TIME
-- MySQL le permite usar el 'HHMMSS'formato sin delimitador (:) para representar el valor de tiempo. Por ejemplo, '08:30:00'y '10:15:00'se puede reescribir como '083000'y '101500'.
INSERT INTO tests(name,start_at,end_at)
VALUES('Test 2','083000','101500');

-- Sin embargo, 108000no es un valor de tiempo válido porque 80no representa el minuto correcto. En este caso, MySQL generará un error si intenta insertar un valor de tiempo no válido en una tabla.
INSERT INTO tests(name,start_at,end_at)
VALUES('Test invalid','083000','108000');

-- Además del formato de cadena, MySQL acepta HHMMSScomo un número que representa un valor de tiempo. También se puede utilizar SS, MMSS. Por ejemplo, en lugar de usar '082000', puede usar 082000lo siguiente:
INSERT INTO tests(name,start_at,end_at)
VALUES('Test 3',082000,102000);

-- Para el intervalo de tiempo, se puede utilizar el 'D HH:MM:SS'formato en que Drepresenta días con un rango de 0 a 34. Una sintaxis más flexible es 'HH:MM', 'D HH:MM', 'D HH', o 'SS'.

-- Si usa el delimitador :, puede usar 1 dígito para representar horas, minutos o segundos. Por ejemplo, 9:5:0se puede utilizar en lugar de '09:05:00'.
INSERT INTO tests(name,start_at,end_at)
VALUES('Test 4','9:5:0',100500);

### Funciones útiles de MySQL TIME

-- Conociendo la hora actual
-- Para obtener la hora actual del servidor de la base de datos, utilice la CURRENT_TIMEfunción. La CURRENT_TIMEfunción devuelve el valor de tiempo actual como una cadena ( 'HH:MM:SS') o un valor numérico ( HHMMSS) dependiendo del contexto donde se usa la función.
SELECT 
    CURRENT_TIME() AS string_now,
    CURRENT_TIME() + 0 AS numeric_now;

-- Sumar y restar tiempo de un valor de TIEMPO
-- Para agregar un TIMEvalor a otro TIMEvalor, usa la ADDTIMEfunción. Para restar un TIMEvalor de otro TIMEvalor, usa la  SUBTIMEfunción.
SELECT 
    CURRENT_TIME(),
    ADDTIME(CURRENT_TIME(), 023000),	
    SUBTIME(CURRENT_TIME(), 023000);

-- Además, puede utilizar la TIMEDIFF()función para obtener una diferencia entre dos TIMEvalores.
SELECT 
    TIMEDIFF(end_at, start_at)
FROM
    tests;


### Formateo de valores de MySQL TIME 
--  Aunque MySQL usa 'HH:MM:SS'cuando recupera y muestra el TIME valor a, puede mostrar el  TIMEvalor de su forma preferida usando la  TIME_FORMATfunción.

SELECT 
    name,
    TIME_FORMAT(start_at, '%h:%i %p') start_at,
    TIME_FORMAT(end_at, '%h:%i %p') end_at
FROM
    tests;
    
### Obtener el valor de la hora UTC
-- Para obtener la hora UTC, use la UTC_TIMEfunción de la siguiente manera:
SELECT 
   CURRENT_TIME(), 
   UTC_TIME();

