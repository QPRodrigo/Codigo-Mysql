/* DROP PROCEDURE */

-- La DROP PROCEDUREdeclaración elimina un procedimiento almacenado creado por la CREATE PROCEDUREdeclaración.

-- DROP PROCEDURE [IF EXISTS] stored_procedure_name;

### Ejemplos de PROCEDIMIENTO DE DROP de MySQL

# DROP PROCEDUREEjemplo de uso de MySQL

-- Primero, cree un nuevo procedimiento almacenado que devuelva información de empleados y oficinas:

DELIMITER $$

CREATE PROCEDURE GetEmployees()
BEGIN
    SELECT 
        firstName, 
        lastName, 
        city, 
        state, 
        country
    FROM employees
    INNER JOIN offices using (officeCode);
    
END$$

DELIMITER ;

-- En segundo lugar, utilice DROP PROCEDUREpara eliminar el GetEmployees()procedimiento almacenado:

DROP PROCEDURE GetEmployees;


# Usando MySQL DROP PROCEDURE con el ejemplo de la opción SI EXISTE

-- El siguiente ejemplo descarta un procedimiento almacenado que no existe:

DROP PROCEDURE abc;

-- Esta declaración elimina el mismo procedimiento almacenado no existente, pero con la IF EXISTSopción:
DROP PROCEDURE IF EXISTS abc;

-- La declaración SHOW WARNINGSmuestra la advertencia:
SHOW WARNINGS;

### Descartar un procedimiento almacenado usando MySQL Workbench

-- Esta declaración crea un nuevo procedimiento almacenado llamado GetPayments()que devuelve la información del cliente y del pago:

DELIMITER $$

CREATE PROCEDURE GetPayments()
BEGIN
    SELECT 
        customerName, 
        checkNumber, 
        paymentDate, 
        amount
    FROM payments
    INNER JOIN customers 
        using (customerNumber);
END$$

DELIMITER ;

-- Para eliminar el procedimiento almacenado con MySQL Workbench, siga estos pasos:

-- Primero, haga clic con el botón derecho en el nombre del procedimiento almacenado que desea eliminar y elija la opción Eliminar procedimiento almacenado ...