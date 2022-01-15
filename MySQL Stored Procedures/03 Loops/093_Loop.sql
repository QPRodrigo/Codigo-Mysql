/* LOOP */

### Introducción a la instrucción MySQL LOOP

/*
[begin_label:] LOOP
    statement_list
END LOOP [end_label]
*/

-- Esta es la sintaxis típica de la instrucción utilizada con la instrucción:LOOPLEAVE
[label]: LOOP
    ...
    -- terminate the loop
    IF condition THEN
        LEAVE [label];
    END IF;
    ...
END LOOP;


### Ejemplo de instrucción MySQL LOOP
-- La siguiente instrucción crea un procedimiento almacenado que utiliza una instrucción loop:LOOP
DROP PROCEDURE LoopDemo;

DELIMITER $$
CREATE PROCEDURE LoopDemo()
BEGIN
	DECLARE x  INT;
	DECLARE str  VARCHAR(255);
        
	SET x = 1;
	SET str =  '';
        
	loop_label:  LOOP
		IF  x > 10 THEN 
			LEAVE  loop_label;
		END  IF;
            
		SET  x = x + 1;
		IF  (x mod 2) THEN
			ITERATE  loop_label;
		ELSE
			SET  str = CONCAT(str,x,',');
		END  IF;
	END LOOP;
	SELECT str;
END$$

DELIMITER ;

/*
El procedimiento almacenado construye una cadena a partir de los números pares, por ejemplo, 2, 4 y 6.
El antes de la instrucción para usar con las instrucciones y.loop_labelLOOPITERATELEAVE
Si el valor de es mayor que , el bucle termina debido a la instrucción.x10LEAVE
Si el valor del es un número impar, el ignora todo lo que está debajo de él y comienza una nueva iteración de bucle.xITERATE
Si el valor de the es un número par, el bloque de la instrucción generará la cadena de resultados a partir de números pares.xELSE
*/

-- La siguiente instrucción llama al procedimiento almacenado:
CALL LoopDemo();