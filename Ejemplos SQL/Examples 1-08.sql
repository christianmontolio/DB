-- SET OPERATORS [Operadores de Conjuntos]
-- EMPLOYEES  : Provee un detalle de los empleados activos
-- JOB_HISTORY: Registra el detalle de la fecha de inicio y fin de los puestos anteriores
--              y empleados que cambian de posición
-- UNION     [retorna el resultado de ambos queries después de eliminar las duplicidades]
-- UNION ALL [retorna el resultado de ambos queries sin eliminar las duplicidades]
-- INTERSECT [retorna las filas que son comunes en ambos queries]
-- MINUS     [retorna las filas del primer query que no están presentes en el segundo query]
SELECT employee_id, job_id
  FROM employees -- Conjunto 1: Todos los empleados activos
 UNION -- Une ambos queries y elimina las duplicidades
SELECT employee_id, job_id
  FROM job_history -- Conjunto 2: Todos los empleados inactivos o que cambiaron de puestos
 ORDER BY 1, 2;
 
SELECT employee_id, job_id
  FROM employees -- Conjunto 1: Todos los empleados activos
 UNION ALL -- Une ambos queries y no elimina las duplicidades [176 SA_REP]
SELECT employee_id, job_id
  FROM job_history -- Conjunto 2: Todos los empleados inactivos o que cambiaron de puestos
 ORDER BY 1, 2;
 
   SELECT employee_id, job_id
     FROM employees
INTERSECT -- Empleados que actualmente ocupan un puesto en el que estuvieron anteriormente 
   SELECT employee_id, job_id
     FROM job_history;

SELECT employee_id
  FROM employees
 MINUS -- Empleados que nunca han cambiado de puesto
SELECT employee_id
  FROM job_history;

SELECT employee_id
  FROM job_history
 MINUS -- Empleados inactivos
SELECT employee_id
  FROM employees;

-- Lineamientos
--    * Las expresiones en la lista del SELECT deben coincidir en cantidad y tipo de datos.
--    * Se puede usar paréntesis para alterar la secuencia de ejecución.
--    * La cláusula ORDER BY se coloca al final de la última instrucción.
-- Servidor de Oracle
--    * Las filas duplicadas son eliminadas automáticamente excepto en UNION ALL.
--    * Los nombres de las columnas del primer query son los que aparecen en el resultado.
--    * La salida se ordena de manera ascendente por defecto excepto en UNION ALL.
SELECT department_id, hire_date -- Error? Que pasó?
  FROM employees
 UNION
SELECT department_id, location_id
  FROM departments;

SELECT department_id, TO_NUMBER(null) AS location, hire_date
  FROM employees
 UNION
SELECT department_id, location_id,  TO_DATE(null)
  FROM departments;

SELECT department_id, TO_NUMBER(null) AS location, hire_date
  FROM employees
 UNION
SELECT department_id, location_id,  TO_DATE(null)
  FROM departments;



-- Controlando el orden de las filas
COLUMN a_dummy NOPRINT -- Comando de SQL*Plus [No funciona en SQL Developer]
SELECT 'sing' AS "My dream", 3 a_dummy
  FROM dual
 UNION
SELECT 'I''d like to teach', 1 a_dummy
  FROM dual
 UNION 
SELECT 'the world to', 2 a_dummy
  FROM dual
 ORDER BY a_dummy; -- Esta cláusula se coloca al final de la última instrucción
