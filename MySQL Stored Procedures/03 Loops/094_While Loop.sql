/* WHILE Loop */

-- Introducción a la instrucción de bucle MySQL WHILE

/*
[begin_label:] WHILE search_condition DO
    statement_list
END WHILE [end_label]
*/

### Ejemplo de instrucción de bucle MySQL WHILE

-- Primero, cree una tabla con el nombre que almacene fechas e información de fecha derivada, como día, mes, trimestre y año:calendars
CREATE TABLE calendars(
    id INT AUTO_INCREMENT,
    fulldate DATE UNIQUE,
    day TINYINT NOT NULL,
    month TINYINT NOT NULL,
    quarter TINYINT NOT NULL,
    year INT NOT NULL,
    PRIMARY KEY(id)
);

-- En segundo lugar, cree un nuevo procedimiento almacenado para insertar una fecha en la tabla:calendars
DELIMITER $$

CREATE PROCEDURE InsertCalendar(dt DATE)
BEGIN
    INSERT INTO calendars(
        fulldate,
        day,
        month,
        quarter,
        year
    )
    VALUES(
        dt, 
        EXTRACT(DAY FROM dt),
        EXTRACT(MONTH FROM dt),
        EXTRACT(QUARTER FROM dt),
        EXTRACT(YEAR FROM dt)
    );
END$$

DELIMITER ;

-- En tercer lugar, cree un nuevo procedimiento almacenado que cargue un número de días a partir de una fecha de inicio en la tabla.LoadCalendars()calendars

DELIMITER $$

CREATE PROCEDURE LoadCalendars(
    startDate DATE, 
    day INT
)
BEGIN
    
    DECLARE counter INT DEFAULT 1;
    DECLARE dt DATE DEFAULT startDate;

    WHILE counter <= day DO
        CALL InsertCalendar(dt);
        SET counter = counter + 1;
        SET dt = DATE_ADD(dt,INTERVAL 1 day);
    END WHILE;

END$$

DELIMITER ;


-- La siguiente instrucción llama al procedimiento almacenado para cargar 31 días en la tabla a partir de .LoadCalendars()calendarsJanuary 1st 2019
CALL LoadCalendars('2019-01-01',31);