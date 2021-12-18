/* NOT NULL Constraint */

-- le presenta la NOT NULLrestricción y le muestra cómo declarar una  NOT NULLcolumna o agregar una  NOT NULLrestricción a una columna existente.

/*
column_name data_type NOT NULL;
*/

## Introducción a la NOT NULLrestricción de MySQL

-- La siguiente CREATE TABLEdeclaración crea la tasks tabla:
CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE
);

### Agregar una NOT NULLrestricción a una columna existente
/*
Normalmente, agrega NOT NULLrestricciones a las columnas cuando crea la tabla. A veces, desea agregar una NOT NULLrestricción a una columna NULL de una tabla existente. En este caso, utilice los siguientes pasos:

1.- Compruebe los valores actuales de la columna si los hay NULL.
2.- Actualice NULL  a no NULLsi NULLsexiste.
3.- Modifique la columna con una NOT NULLrestricción.
*/

INSERT INTO tasks(title ,start_date, end_date)
VALUES('Learn MySQL NOT NULL constraint', '2017-02-01','2017-02-02'),
      ('Check and update NOT NULL constraint to your database', '2017-02-01',NULL);

-- Suponga que desea obligar a los usuarios a dar una fecha de finalización estimada al crear una nueva tarea. Para implementar esta regla, agrega una NOT NULLrestricción a la end_datecolumna de la taskstabla.

-- Primero, use el IS NULLoperador para buscar filas con NULLsen la columna end_date:
SELECT * 
FROM tasks
WHERE end_date IS NULL;  

-- En segundo lugar, actualice los NULLvalores a valores no nulos. En este caso, puede crear una regla de que si end_datees así NULL, la fecha de finalización es una semana después de la fecha de inicio.
UPDATE tasks 
SET 
    end_date = start_date + 7
WHERE
    end_date IS NULL;

-- Esta consulta verifica la actualización:
SELECT * FROM tasks;

-- En tercer lugar, agregue una NOT NULLrestricción a la end_datecolumna utilizando la siguiente ALTER TABLEdeclaración:
ALTER TABLE table_name
CHANGE 
   old_column_name 
   new_column_name column_definition;

-- En este caso, el nombre de los nombres de columna nuevo y antiguo es el mismo, excepto que la columna debe tener una NOT NULLrestricción:
ALTER TABLE tasks 
CHANGE 
    end_date 
    end_date DATE NOT NULL;

-- Verifiquemos el cambio usando la DESCRIBEdeclaración:
DESCRIBE tasks;

### Suelta una NOT NULL restricción
-- Para eliminar una NOT NULLrestricción para una columna, usa la ALTER TABLE..MODIFYdeclaración:
ALTER TABLE table_name
MODIFY column_name column_definition;

-- Tenga en cuenta que la definición de columna (column_definition) debe reformular la definición de columna original sin la NOT NULLrestricción.
ALTER TABLE tasks 
MODIFY 
    end_date 
    end_date DATE NOT NULL;

