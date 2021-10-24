/*  CTE recursivo */

-- Recursiva  (CTE) es un CTE que tiene una subconsulta que se refiere al nombre de CTE en sí. 

/*

WITH RECURSIVE cte_name AS (
    initial_query  -- anchor member
    UNION ALL
    recursive_query -- recursive member that references to the CTE name
)
SELECT * FROM cte_name;

*/

-- Ejemplo simple de CTE recursivo de MySQL
WITH RECURSIVE cte_count (n) 
AS (
      SELECT 1
      UNION ALL
      SELECT n + 1 
      FROM cte_count 
      WHERE n < 3
    )
SELECT n 
FROM cte_count;

#### Usando CTE recursivo de MySQL para atravesar los datos jerárquicos
-- Puede aplicar el CTE recursivo para consultar toda la estructura de la organización de forma descendente de la siguiente manera:

WITH RECURSIVE employee_paths AS
  ( SELECT employeeNumber,
           reportsTo managerNumber,
           officeCode, 
           1 lvl
   FROM employees
   WHERE reportsTo IS NULL
     UNION ALL
     SELECT e.employeeNumber,
            e.reportsTo,
            e.officeCode,
            lvl+1
     FROM employees e
     INNER JOIN employee_paths ep ON ep.employeeNumber = e.reportsTo )
SELECT employeeNumber,
       managerNumber,
       lvl,
       city
FROM employee_paths ep
INNER JOIN offices o USING (officeCode)
ORDER BY lvl, city;

-- Dividamos la consulta en partes más pequeñas para que sea más fácil de entender.

-- Primero, forme el miembro ancla usando la siguiente consulta:
SELECT 
    employeeNumber, 
    reportsTo managerNumber, 
    officeCode
FROM
    employees
WHERE
    reportsTo IS NULL

-- En segundo lugar, convierta el miembro recursivo en referencia al nombre de CTE, que employee_pathsen este caso es:
SELECT 
    e.employeeNumber, 
    e.reportsTo, 
    e.officeCode
FROM
    employees e
INNER JOIN employee_paths ep 
    ON ep.employeeNumber = e.reportsTo
