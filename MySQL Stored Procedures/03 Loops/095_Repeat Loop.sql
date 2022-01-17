/* REPEAT Loop */

-- La instrucción ejecuta una o más instrucciones hasta que una condición de búsqueda es true.REPEAT

/*
[begin_label:] REPEAT
    statement
UNTIL search_condition
END REPEAT [end_label]
*/

### Ejemplo de bucle MySQLREPEAT
-- Esta instrucción crea un procedimiento almacenado denominado que utiliza la instrucción para concatenar números del 1 al 9:RepeatDemoREPEAT

DELIMITER $$

CREATE PROCEDURE RepeatDemo()
BEGIN
    DECLARE counter INT DEFAULT 1;
    DECLARE result VARCHAR(100) DEFAULT '';
    
    REPEAT
        SET result = CONCAT(result,counter,',');
        SET counter = counter + 1;
    UNTIL counter >= 10
    END REPEAT;
    
    -- display result
    SELECT result;
END$$

DELIMITER ;

-- En segundo lugar, agregue valor a la variable usando la función hasta que sea mayor o igual que 10.counterresultCONCAT()counter

CALL RepeatDemo();

-- Aquí está el resultado:

/*
+--------------------+
| result             |
+--------------------+
| 1,2,3,4,5,6,7,8,9, |
+--------------------+
1 row in set (0.02 sec)

Query OK, 0 rows affected (0.02 sec)

*/