# BIT

-- Permite almacenar valores de bits

### Ejemplos de MySQL

-- La siguiente declaración crea una nueva tabla con el nombre working_calendarsque tiene la columna de días es BIT(7):

CREATE TABLE working_calendars(
    y INT
    w INT,
    days BIT(7),
    PRIMARY KEY(y,w)
);

-- Los valores en la columna daysindican si el día es un día laborable o un día libre, es decir, 1: día laborable y 0: día libre.

-- Suponga que el sábado y el viernes de la primera semana de 2017 no son días hábiles, puede insertar una fila en la working_calendarstabla:

INSERT INTO working_calendars(y,w,days)
VALUES(2017,1,B'1111100');


-- La siguiente consulta recupera datos de la working_calendartabla:
SELECT 
    y, w , days
FROM
    working_calendars;

-- Como puede ver, el valor de bit de la   dayscolumna se convierte en un número entero. Para representarlo como valores de bit, usa la BINfunción:
SELECT 
    y, w , bin(days)
FROM
    working_calendar;

-- Si inserta un valor en una BIT(n)columna que tiene menos de nbits de longitud, MySQL rellenará ceros a la izquierda del valor de bit.

-- Suponga que el primer día de la segunda semana está inactivo, puede insertarlo 01111100en la   days columna. Sin embargo, el  111100valor también funcionará porque MySQL rellenará un cero a la izquierda.

INSERT INTO working_calendars(y,w,days)
VALUES(2017,2,B'111100');

-- Para ver los datos, utilice la misma consulta anterior:
SELECT 
    y, w , bin(days)
FROM
    working_calendars; 
    
-- Como puede ver, MySQL eliminó los ceros iniciales antes de devolver el resultado. Para visualizarlo correctamente, puede utilizar la LPAD función:
SELECT 
    y, w , lpad(bin(days),7,'0')
FROM
    working_calendars;
